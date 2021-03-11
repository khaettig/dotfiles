#!/bin/env python3

import json
from subprocess import run, PIPE


def get_redmine_issues():
    return json.loads(
        run(
            ["redmine", "issues", "--status", "7", "--json"], stdout=PIPE, check=True
        ).stdout.decode("utf-8")
    )


def render_issue(issue):
    iid = issue["id"]
    title = issue["subject"]
    itype = issue["tracker"]["name"]
    author = issue["author"]["name"]
    assigned_to = issue["assigned_to"]["name"]
    return f"* {itype} [#{iid}](https://redmine.spotl.io/issues/{iid}) ({author}): {title} *done by {assigned_to}*"


def render_category(category):
    return f"#### {category.capitalize()}"


def move_issue(issue):
    run(["redmine", "update", "--status", "8", str(issue["id"])], check=True)


def main():
    issues = get_redmine_issues()

    categorized_issues = {
        category: [issue for issue in issues if issue["category"]["name"] == category]
        for category in set(issue["category"]["name"] for issue in issues)
    }

    for category, sub_issues in categorized_issues.items():
        print(render_category(category))
        for issue in sorted(sub_issues, key=lambda issue: issue["id"]):
            print("  " + render_issue(issue))

    for issue in issues:
        move_issue(issue)


if __name__ == "__main__":
    main()
