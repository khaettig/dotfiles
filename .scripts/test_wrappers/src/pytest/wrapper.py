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
            file_name, module_name = test["nodeid"].split("::")

            messages.append(
                Message(
                    "e",
                    module_name,
                    data["root"] + "/" + file_name,
                    test["lineno"],
                    "Failing Test:",
                )
            )

            traceback = test["call"]["traceback"]
            messages.append(
                Message(
                    "e",
                    module_name,
                    data["root"] + "/" + traceback[0]["path"],
                    traceback[0]["lineno"],
                    traceback[0]["message"],
                )
            )

        raw_summary = data["summary"]
        return (
            messages,
            Summary(
                passed=raw_summary.get("passed", 0),
                failed=raw_summary.get("failed", 0),
                total=raw_summary.get("total", 0),
            ),
        )
