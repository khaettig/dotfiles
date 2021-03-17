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
        messages = []

        failed_tests = [test for test in data["tests"] if test["outcome"] == "failed"]
        for test in failed_tests:
            messages.append(self.get_title_message(data["root"], test))

            for trace in test["call"]["traceback"]:
                messages.append(self.get_traceback_message(data["root"], test, trace))

        return (messages, self.get_summary(data["summary"]))

    def get_summary(self, raw_summary):
        return Summary(
            passed=raw_summary.get("passed", 0),
            failed=raw_summary.get("failed", 0),
            total=raw_summary.get("total", 0),
        )

    def get_file_and_module_name(self, test):
        return test["nodeid"].split("::")

    def get_title_message(self, root, test):
        file_name, module_name = self.get_file_and_module_name(test)
        return Message(
            "e", module_name, root + "/" + file_name, test["lineno"], "Failing Test:"
        )

    def get_traceback_message(self, root, test, trace):
        _, module_name = self.get_file_and_module_name(test)
        return Message(
            "e",
            module_name,
            root + "/" + trace["path"],
            trace["lineno"],
            trace["message"],
        )
