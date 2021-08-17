#!/bin/env python3

import argparse
from redmine import Redmine, IssueStatus, ISSUE_NAMES
from commands import render_issues, move_issues


def parse_arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument("from_status", choices=ISSUE_NAMES.keys())
    parser.add_argument("to_status", choices=ISSUE_NAMES.keys())
    parser.add_argument(
        "--only_print",
        action="store_true",
        default=False
    )
    return parser.parse_args()


def main():
    args = parse_arguments()
    redmine = Redmine()

    from_status = IssueStatus.from_string(args.from_status)
    to_status = IssueStatus.from_string(args.to_status)

    print("**Deployed**")
    print(render_issues(from_status, redmine))
    print("**Rejected**")
    print(render_issues(IssueStatus.REJECTED, redmine))

    if args.only_print:
        exit(0)

    move_issues(from_status, to_status, redmine)
    move_issues(IssueStatus.REJECTED, IssueStatus.REJECTED_LOGGED, redmine)


if __name__ == "__main__":
    main()
