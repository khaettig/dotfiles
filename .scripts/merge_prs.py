#!/bin/env python3

import argparse
import subprocess
import time

import git

REPOSITORY = "<assigned via arguments>"
LOCAL_REPOSITORY_TEMPLATE = "/home/kevin/Git/merge-<name>/"
REMOTE_REPOSITORY_TEMPLATE = "https://api.github.com/repos/spotl-io/<name>/"


def get_remote_repository():
    return REMOTE_REPOSITORY_TEMPLATE.replace("<name>", f"spotl.{REPOSITORY}")


def get_local_repository():
    return LOCAL_REPOSITORY_TEMPLATE.replace("<name>", f"spotl.{REPOSITORY}")


class PullRequest:
    def __init__(self, pr_id, branch, author, title):
        self.id = pr_id
        self.branch = branch
        self.author = author
        self.title = title

    def __str__(self):
        return f"<{self.id}: {self.branch} by {self.author} ({self.title})>"

    @staticmethod
    def from_string(string):
        return PullRequest(*string.split(";,;"))

    def can_merge(self):
        return run(["hub", "ci-status", self.commit_sha]).strip() == "success"

    def try_rebase_head(self, repo):
        try:
            repo.git.rebase("develop")
            return True
        except git.exc.GitCommandError:
            repo.git.rebase(abort=True)
            return False

    def try_merge_head(self, repo):
        try:
            repo.git.merge("develop")
            return True
        except git.exc.GitCommandError:
            repo.git.merge(abort=True)
            return False

    def rebase_or_merge_head(self):
        repo = git.Repo(get_local_repository())

        repo.git.checkout("develop")
        repo.git.pull()
        repo.git.checkout(self.branch)
        if not self.try_rebase_head(repo) and not self.try_merge_head(repo):
            raise Exception()
        repo.git.push(u=True, force_with_lease=True)

    def delete_local_branch(self):
        repo = git.Repo(get_local_repository())
        repo.git.checkout("develop")
        repo.git.branch("-D", self.branch)

    def merge(self):
        run(["hub", "api", "-XPUT", f"{get_remote_repository()}pulls/{self.id}/merge"])

    @property
    def commit_sha(self):
        return run(["hub", "rev-parse", "HEAD"]).strip()


def run(command):
    result = subprocess.run(command, stdout=subprocess.PIPE, cwd=get_local_repository())

    if result.returncode == 1:
        exit(1)

    return result.stdout.decode("utf-8")


def get_prs_raw():
    return run(["hub", "pr", "list", "-f", "%I;,;%H;,;%au;,;%t%n"])


def get_pull_requests():
    prs = [
        PullRequest.from_string(line)
        for line in get_prs_raw().split("\n")
        if len(line) > 0
    ]
    return {pr.id: pr for pr in prs}


def parse_arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--repository",
        choices=["media", "machine"],
        default="media")
    parser.add_argument(
        "pull_request_ids",
        nargs=argparse.REMAINDER)
    return parser.parse_args()


def main():
    args = parse_arguments()

    global REPOSITORY
    REPOSITORY = args.repository

    all_pull_requests = get_pull_requests()

    print("Start auto merging")

    for pull_request_id in args.pull_request_ids:
        pr = all_pull_requests.get(pull_request_id, None)

        print()

        if not pr:
            print(f"PR with id {pull_request_id} not found in open pull requests!")
            continue

        print(pr)
        print(20 * "=")

        print("Rebasing ...")
        try:
            pr.rebase_or_merge_head()
        except Exception:
            print(f"Could not rebase nor merge branch {pr.branch}! Skipping")
            continue

        while not pr.can_merge():
            print("Waiting for CI ...")
            time.sleep(30)

        print("Merging ...")
        pr.merge()

        pr.delete_local_branch()

    print()
    print("Finished!")


if __name__ == "__main__":
    main()
