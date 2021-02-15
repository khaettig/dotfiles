import os
import sys

import git


def rebase():
    repo = git.Repo(os.getcwd())

    if len(sys.argv) < 2:
        print("Please specify the branch to rebase!")
        exit(1)

    if repo.is_dirty():
        print("Please commit or stash your current files first!")
        exit(1)

    start_branch = repo.head.reference.name
    rebase_branch = sys.argv[1]

    repo.git.checkout("develop")
    repo.git.pull()
    repo.git.checkout(rebase_branch)
    repo.git.rebase("develop")
    repo.git.push(u=True, force_with_lease=True)
    repo.git.checkout(start_branch)


if __name__ == "__main__":
    rebase()
