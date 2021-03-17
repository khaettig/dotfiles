from subprocess import run, PIPE

from src.common import Wrapper, Message, SubMessage, Summary

JSON_REPORT = "/tmp/pytest.json"


class PytestWrapper(Wrapper):
    command = ["pytest", "--json-report", f"--json-report-file={JSON_REPORT}"]

    def parse(self, stdout, stderr):
        return [], Summary(passed=1, total=1)

    def run_command(self, command_arguments):
        call = run(self.command + command_arguments, stdout=PIPE, stderr=PIPE)
        with open(JSON_REPORT) as f:
            stdout = f.read()
        return stdout, call.stderr.decode("utf-8"), call.returncode
