import sys
import time
import argparse
from subprocess import run, PIPE, CalledProcessError


def parse_arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument("--print_raw", action="store_true")
    return parser.parse_known_args()


def render_messages(messages):
    for message in messages:
        message.render()


def render_summary(summary, duration):
    print(f"{summary} in {duration:.2f}s")


def print_raw(stdout, stderr, returncode):
    print("Output (stdout):")
    print(stdout)
    print("Errors (stderr):")
    print(stderr)
    print(f"Returncode: {returncode}")


class Wrapper:
    command = []

    def run(self):
        wrapper_args, command_args = parse_arguments()

        time_before = time.time()
        stdout, stderr, returncode = self.run_command(command_args)
        duration = time.time() - time_before

        if wrapper_args.print_raw:
            print_raw(stdout, stderr, returncode)
            sys.exit(returncode)

        if stderr:
            print(stderr)
            sys.exit(returncode)

        messages, summary = self.parse(stdout=stdout, stderr=stderr)
        render_messages(messages)
        render_summary(summary, duration)

        sys.exit(returncode)

    def parse(self, stdout, stderr):
        raise NotImplementedError

    def run_command(self, options):
        try:
            call = run(self.command + options, stdout=PIPE, stderr=PIPE, check=True)
        except CalledProcessError:
            pass  # stderr is passed anyway
        return call.stdout.decode("utf-8"), call.stderr.decode("utf-8"), call.returncode
