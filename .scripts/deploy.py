#!/bin/env python3

from subprocess import run, PIPE
from collections import namedtuple

TYPES = [(1, "Bug"), (2, "Feature"), (3, "Support")]
Issue = namedtuple("Issue", ["number", "title"])


def get_redmine_raw():
    return run(
        ["redmine", "issues", "--status", "7"], stdout=PIPE, check=True
    ).stdout.decode("utf-8")


def parse_line(line):
    return Issue(number=line[:6].strip(), title=line[85:].strip())


def move_issue(number):
    run(["redmine", "update", "--status", "8", number], check=True)


def main():
    for issue_type in TYPES:
        issues = [parse_line(line) for line in get_redmine_raw().split("\n") if line]
        for issue in sorted(issues):
            print(f"* {issue_type[1]} #{issue.number}: {issue.title}")
        for issue in sorted(issues):
            move_issue(issue.number)


if __name__ == "__main__":
    main()
