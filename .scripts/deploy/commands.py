def render_issues(status, redmine):
    result = ""

    issues = redmine.get_issues(status)
    categories = sorted(set(issue.category for issue in issues))

    for category in categories:
        categorized_issues = sorted(
            [issue for issue in issues if issue.category == category],
            key=lambda issue: (issue.tracker, issue.issue_id)
        )
        result += f"#### {category}\n"
        result += "\n".join(str(issue) for issue in categorized_issues)
        result += "\n"

    return result

def move_issues(from_status, to_status, redmine):
    issues = redmine.get_issues(from_status)

    for issue in issues:
        redmine.move_issue(issue.issue_id, to_status)
