import json
from subprocess import run, PIPE

from src.common import Wrapper, Message, SubMessage, Summary

JSON_REPORT = "/tmp/pytest.json"


class PytestWrapper(Wrapper):
    command = ["pytest", "--json-report", f"--json-report-file={JSON_REPORT}"]

    def run_command(self, command_arguments, executable=None):
        assembled_command = self.assemble_command(
            self.command, command_arguments, executable
        )
        call = run(assembled_command, stdout=PIPE, stderr=PIPE)
        with open(JSON_REPORT) as f:
            stdout = f.read()
        return stdout, call.stderr.decode("utf-8"), call.returncode

    def parse(self, stdout, stderr):
        data = json.loads(stdout)
        data["parsed_root"] = data["root"] + "/"
        return (self.parse_messages(data), self.parse_summary(data))

    def parse_messages(self, data):
        return self.parse_collectors(data) + self.parse_tests(data)

    def has_failed(self, report):
        return report["outcome"] == "failed"

    def has_stdout(self, test):
        return "stdout" in test["call"]

    def parse_collectors(self, data):
        failed_collectors = [
            collector for collector in data["collectors"] if self.has_failed(collector)
        ]
        return [
            message
            for collector in failed_collectors
            for message in self.get_collector_messages(data, collector)
        ]

    def get_collector_messages(self, data, collector):
        if "longrepr" not in collector:
            return []
        raw_message = collector["longrepr"].split("\n")

        messages = []
        file_name, line_number = None, None
        for line in reversed(raw_message):
            if not line.startswith("E   "):
                if not file_name:
                    if line.startswith(" "):
                        continue
                    file_name, line_number = line.split(":")[:2]
                    file_name = data["parsed_root"] + file_name
                break
            if line.startswith("E     File"):
                file_name, line_number = self.parse_file_name(line)
                break
            messages.insert(0, line)

        # E   SyntaxError: invalid syntax
        module_name = messages[-1][1:].strip().split(" ")[0][:-1]

        return [
            Message("e", module_name, file_name, line_number, line) for line in messages
        ]

    def parse_file_name(self, line):
        # E     File "<file_name>", line <line_number>
        split = line[12:].split(" ")
        return split[0][:-2], split[2]

    def get_failed_collectors(self, data):
        return [
            collector
            for collector in data["collectors"]
            if collector["outcome"] == "failed"
        ]

    def parse_tests(self, data):
        return [
            message
            for test in data["tests"]
            for message in self.parse_test(data["parsed_root"], test)
        ]

    def parse_test(self, root, test):
        messages = []

        if self.has_failed(test):
            messages += self.get_error_messages(root, test, test["call"]["traceback"])

        if self.has_stdout(test):
            messages += self.get_stdout_messages(root, test)

        return messages

    def get_file_and_module_name(self, test):
        split = test["nodeid"].split("::")
        return split[0], (".").join(split[1:])

    def get_error_messages(self, root, test, traceback):
        return [
            self.get_title_message(root, test),
            *(self.get_error_message(root, test, trace) for trace in traceback[:-1]),
            self.get_error_message("", test, test["call"]["crash"]),
        ]

    def get_title_message(self, root, test):
        file_name, module_name = self.get_file_and_module_name(test)
        return Message(
            "e", module_name, root + file_name, test["lineno"], "Test failed:"
        )

    def get_error_message(self, root, test, trace):
        _, module_name = self.get_file_and_module_name(test)
        return Message(
            "e", module_name, root + trace["path"], trace["lineno"], trace["message"]
        )

    def get_stdout_messages(self, root, test):
        file_name, module_name = self.get_file_and_module_name(test)
        return [
            Message(
                "i", module_name, root + file_name, test["lineno"], "Output: " + line
            )
            for line in test["call"]["stdout"].split("\n")
            if line != ""
        ]

    def parse_summary(self, data):
        if self.get_failed_collectors(data):
            return Summary(message="CRASHED")
        raw_summary = data["summary"]
        return Summary(
            passed=raw_summary.get("passed", 0),
            failed=raw_summary.get("failed", 0),
            skipped=raw_summary.get("skipped", 0),
            total=raw_summary.get("total", 0),
        )

    def get_failed_collectors(self, data):
        return [
            collector
            for collector in data["collectors"]
            if collector["outcome"] == "failed"
        ]
