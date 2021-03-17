import json
from subprocess import run, PIPE

from src.common import Wrapper, Message, SubMessage, Summary

JSON_REPORT = "/tmp/pytest.json"


class PytestWrapper(Wrapper):
    command = ["pytest", "--json-report", f"--json-report-file={JSON_REPORT}"]

    def run_command(self, command_arguments):
        call = run(self.command + command_arguments, stdout=PIPE, stderr=PIPE)
        with open(JSON_REPORT) as f:
            stdout = f.read()
        return stdout, call.stderr.decode("utf-8"), call.returncode

    def parse(self, stdout, stderr):
        data = json.loads(stdout)
        root = data["root"] + "/"
        messages = []

        for collector in self.get_failed_collectors(data):
            messages.append(self.get_collector_message(root, collector))

        failed_tests = [test for test in data["tests"] if test["outcome"] == "failed"]
        for test in failed_tests:
            messages.append(self.get_title_message(root, test))

            for trace in test["call"]["traceback"][:-1]:
                messages.append(self.get_traceback_message(root, test, trace))

            messages.append(self.get_traceback_message("", test, test["call"]["crash"]))

        return (messages, self.get_summary(data))

    def get_summary(self, data):
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

    def get_file_and_module_name(self, test):
        split = test["nodeid"].split("::")
        return split[0], (".").join(split[1:])

    def get_title_message(self, root, test):
        file_name, module_name = self.get_file_and_module_name(test)
        return Message(
            "e", module_name, root + file_name, test["lineno"], "Failing Test:"
        )

    def get_traceback_message(self, root, test, trace):
        _, module_name = self.get_file_and_module_name(test)
        return Message(
            "e", module_name, root + trace["path"], trace["lineno"], trace["message"]
        )

    def get_collector_message(self, root, collector):
        split = collector["longrepr"].split(":")
        file_name = root + split[0]
        line_number = split[1]
        message = ":".join(split[2:])
        return Message(
            "e", "import error", file_name, line_number, message.split("\nE   ")[-1]
        )
