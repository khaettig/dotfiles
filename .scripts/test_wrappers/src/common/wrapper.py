import sys
from subprocess import run, PIPE


class Wrapper:
    def run(self):
        call = self.run_command()
        messages, summary = self.parse(
            stdout=call.stdout.decode("utf-8"), stderr=call.stderr.decode("utf-8")
        )
        self.render_messages(messages)
        self.render_summary(summary)
        exit(call.returncode)

    def run_command(self):
        return run(self.command + sys.argv[1:], stdout=PIPE, stderr=PIPE)

    def render_messages(self, messages):
        for message in messages:
            message.render()

    def render_summary(self, summary):
        print(f"SUMMARY: {summary}")
