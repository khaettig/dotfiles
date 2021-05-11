#!/bin/env python3

import argparse
from redmine import Redmine, IssueStatus
from commands import render_issues, move_issues


def parse_arguments():
    parser = argparse.ArgumentParser(description="Search GCP logs for an entry.")
    parser.add_argument(
        "--only_print",
        action="store_true",
        default=False
    )
    return parser.parse_args()


def main():
    args = parse_arguments()
    redmine = Redmine()

    print("**Deployed**")
    print(render_issues(IssueStatus.MERGED, redmine))
    print("**Rejected**")
    print(render_issues(IssueStatus.REJECTED, redmine))

    if args.only_print:
        exit(0)

    move_issues(IssueStatus.MERGED, IssueStatus.DEPLOYED, redmine)
    move_issues(IssueStatus.REJECTED, IssueStatus.REJECTED_LOGGED, redmine)


if __name__ == "__main__":
    main()
