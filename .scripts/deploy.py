#!/bin/env python3

import json
from subprocess import run, PIPE


class Status:
    NEW = "1"
    IN_PROGRESS = "2"
    OPEN_PULL_REQUEST = "3"
    REJECTED = "6"
    MERGED = "7"
    DEPLOYED = "8"
    CHANGES_REQUESTED = "9"
    TODO = "10"


def get_redmine_issues(status):
    issues = json.loads(
        run(
            ["redmine", "issues", "--status", status, "--json"], stdout=PIPE, check=True
        ).stdout.decode("utf-8")
    )
    return [
        add_uncategorized_category(issue) for issue in issues if "category" not in issue
    ]


def add_uncategorized_category(issue):
    issue["category"] = {"name": "uncategorized"}
    return issue


def render_issue(issue, done_by=False):
    iid = issue["id"]
    title = issue["subject"]
    itype = issue["tracker"]["name"]
    author = issue["author"]["name"]
    assigned_to = (
        issue["assigned_to"]["name"] if "assigned_to" in issue else "Not assigned"
    )
    result = f"* {itype} [#{iid}](https://redmine.spotl.io/issues/{iid}) ({author}): {title} *done by {assigned_to}*"
    result += f"*done by {assigned_to}*" if done_by else ""
    return result


def render_category(category):
    return f"#### {category.capitalize()}"


def move_issue(issue, status):
    run(["redmine", "update", "--status", status, str(issue["id"])], check=True)


def main():
    issues = get_redmine_issues(Status.MERGED)

    categorized_issues = {
        category: [issue for issue in issues if issue["category"]["name"] == category]
        for category in set(issue["category"]["name"] for issue in issues)
    }

    for category, sub_issues in categorized_issues.items():
        print(render_category(category))
        for issue in sorted(sub_issues, key=lambda issue: issue["id"]):
            print("  " + render_issue(issue))

    for issue in issues:
        move_issue(issue, Status.DEPLOYED)


if __name__ == "__main__":
    main()
