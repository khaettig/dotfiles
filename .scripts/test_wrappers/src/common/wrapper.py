import sys
import time
import argparse
from subprocess import run, PIPE


class Wrapper:
    def run(self):
        wrapper_args, command_args = self.parse_arguments()

        time_before = time.time()
        stdout, stderr, returncode = self.run_command(command_args)
        duration = time.time() - time_before

        if wrapper_args.print_raw:
            self.print_raw(stdout, stderr, returncode)
            exit(0)

        if stderr:
            print(stderr)
            exit(1)

        messages, summary = self.parse(stdout=stdout, stderr=stderr)
        self.render_messages(messages)
        self.render_summary(summary, duration)

        exit(returncode)

    def parse_arguments(self):
        parser = argparse.ArgumentParser()
        parser.add_argument("--print_raw", action="store_true")
        return parser.parse_known_args()

    def run_command(self, options):
        call = run(self.command + options, stdout=PIPE, stderr=PIPE)
        return call.stdout.decode("utf-8"), call.stderr.decode("utf-8"), call.returncode

    def render_messages(self, messages):
        for message in messages:
            message.render()

    def render_summary(self, summary, duration):
        print(f"{summary} in {duration:.2f}s")

    def print_raw(self, stdout, stderr, returncode):
        print("Output (stdout):")
        print(stdout)
        print("Errors (stderr):")
        print(stderr)
        print(f"Returncode: {returncode}")
