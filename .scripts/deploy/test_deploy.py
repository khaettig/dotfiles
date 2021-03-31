from collections import defaultdict
from unittest.mock import Mock
from commands import render_issues, move_issues
from redmine import Redmine, IssueStatus

URL = "https://redmine.spotl.io/issues/"


class RedmineMock:
    def __init__(self, issues_as_dict):
        self.issues_as_dict = issues_as_dict
        self.moved_issues = defaultdict(list)

    def get_issues_as_dicts(self, status):
        return self.issues_as_dict

    def move_issue(self, issue_id, status):
        self.moved_issues[status].append(issue_id)



def get_example_issues():
    return [
            {
                "id": "12345",
                "subject": "Clean up code base",
                "category": {"name": "backend"},
                "tracker": {"name": "Bug"},
                "author": {"name": "Bob Martin"},
                "assigned_to": {"name": "Martin Fowler"},
            },
            {
                "id": "12346",
                "subject": "no one does this",
                "category": {"name": "backend"},
                "tracker": {"name": "Feature"},
                "author": {"name": "Bob Martin"},
            },
            {
                "id": "12347",
                "subject": "Eat cake",
                "tracker": {"name": "Bug"},
                "author": {"name": "Bob Martin"},
                "assigned_to": {"name": "Kent Beck"},
            },
        ]


class TestRenderIssues:
    def test_returns_empty_string_if_list_is_empty(self):
        redmine = Redmine(api=RedmineMock(issues_as_dict=[]))

        result = render_issues(IssueStatus.MERGED, redmine)

        assert result == ""

    def test_complete_example(self):
        redmine = Redmine(api=RedmineMock(issues_as_dict=get_example_issues()))

        result = render_issues(IssueStatus.MERGED, redmine)

        expected = [
            "#### Backend",
            f"- Bug [#12345]({URL}12345) (Bob Martin): Clean up code base *done by Martin Fowler*",
            f"- Feature [#12346]({URL}12346) (Bob Martin): No one does this",
            "#### Uncategorized",
            f"- Bug [#12347]({URL}12347) (Bob Martin): Eat cake *done by Kent Beck*",
            "",
        ]

        for expected, actual in zip(expected, result.split("\n")):
            assert expected == actual


class TestMoveIssues:
    def test_moves_all_issues_to_new_status(self):
        redmine = Redmine(api=RedmineMock(issues_as_dict=get_example_issues()))

        move_issues(IssueStatus.MERGED, IssueStatus.DEPLOYED, redmine)

        assert "12345" in redmine.api.moved_issues[IssueStatus.DEPLOYED]
        assert "12346" in redmine.api.moved_issues[IssueStatus.DEPLOYED]
        assert "12347" in redmine.api.moved_issues[IssueStatus.DEPLOYED]
