import json
from subprocess import run, PIPE

URL = "https://redmine.spotl.io/issues/"


def get_output_from(command):
    return run(command, stdout=PIPE, check=True).stdout.decode("utf-8")


def capitalize_start(string):
    return string[0].upper() + string[1:]


class IssueStatus:
    NEW = "1"
    IN_PROGRESS = "2"
    OPEN_PULL_REQUEST = "3"
    REJECTED = "6"
    MERGED = "7"
    DEPLOYED = "8"
    CHANGES_REQUESTED = "9"
    TODO = "10"
    REJECTED_LOGGED = "11"


class Issue:
    @staticmethod
    def from_dict(issue_dict):
        issue = Issue()
        issue.issue_id = issue_dict["id"]
        issue.subject = capitalize_start(issue_dict["subject"])
        issue.category = (
            capitalize_start(issue_dict["category"]["name"])
            if "category" in issue_dict
            else "Uncategorized"
        )
        issue.tracker = issue_dict["tracker"]["name"]
        issue.author = issue_dict["author"]["name"]
        if "assigned_to" in issue_dict:
            issue.assigned_to = issue_dict["assigned_to"]["name"]
        return issue

    def __init__(self):
        self.issue_id = None
        self.subject = None
        self.category = None
        self.tracker = None
        self.author = None
        self.assigned_to = None

    def __str__(self):
        issue_id = f"[#{self.issue_id}]({URL}{self.issue_id})"
        done_by = f" *done by {self.assigned_to}*" if self.assigned_to else ""
        return (
            f"{self.tracker} {issue_id} ({self.author}): {self.subject}{done_by}"
        )


class RedmineAPI:
    def get_issues_as_dicts(self, status):
        command = ["redmine", "issues", "--status", status, "--json"]
        return json.loads(get_output_from(command))

    def move_issue(self, issue_id, status):
        run(["redmine", "update", "--status", str(status), str(issue_id)], check=True)


class Redmine:
    def __init__(self, api=RedmineAPI()):
        self.api = api

    def get_issues(self, status):
        return [Issue.from_dict(d) for d in self.api.get_issues_as_dicts(status)]

    def move_issue(self, issue_id, status):
        self.api.move_issue(issue_id, status)
