import requests
import datetime
from subprocess import run
import os
from glob import glob
import re
import pynvim


@pynvim.plugin
class GTD:
    def __init__(self, nvim):
        self.nvim = nvim

    @pynvim.command("AddHabiticaTodo", nargs=("*"))
    def add_habitica_todo(self, args):
        line = self.nvim.current.buffer[self.nvim.current.window.cursor[0] - 1]

        line = re.sub(r"\<.+\>", "", line)
        line = re.sub(r"^\-\s*", "", line)

        with open(os.path.expanduser("~/.habitica"), "r") as f:
            user, token = f.readlines()[0].strip().split(":")

        requests.post(
            "https://habitica.com/api/v3/tasks/user",
            headers={
                "x-api-user": user,
                "x-api-key": token,
                "x-client": user + "-CustomScript",
            },
            json={
                "text": line,
                "type": "todo",
            },
        )

    @pynvim.command("GoToLink", nargs=("*"))
    def go_to_link(self, args):
        link_name, link_type = self._get_link()

        if link_type == "project":
            self._open_project(link_name)
        if link_type == "md":
            self._open_md(link_name)
        if link_type == "file":
            self._open_file(link_name)
        if link_type == "cmd":
            self._run_command(link_name)
        if link_type == "url":
            self._open_chrome(link_name)
        if link_type == "ff":
            self._open_firefox(link_name)

    def _get_link(self):
        line = self.nvim.current.buffer[self.nvim.current.window.cursor[0] - 1]
        match = re.search(r"\[.+\]", line)

        if match is None:
            raise Exception("No link found!")

        split = match.group(0)[1:-1].split(":")

        if len(split) == 1:
            if split[0].startswith("/"):
                return split[0][1:] + ".md", "md"
            else:
                return split[0], "project"
        return split[1], split[0]

    def _open_project(self, project_name):
        projects_by_name = {
            f.split("_")[-1][:-3].lower(): f for f in glob("Projects/*.md")
        }

        if project_name.lower() in projects_by_name:
            self.nvim.command(f"e {projects_by_name[project_name.lower()]}")
            return

        date = datetime.datetime.now().strftime("%Y-%m-%d")
        self.nvim.command(f"e Projects/{date}_{project_name}.md")
        self.nvim.command("r System/ProjectTemplate.md")
        self.nvim.feedkeys("kddo")

    def _open_md(self, md_name):
        self.nvim.command(f"e {md_name}")

    def _open_file(self, file_name):
        run(["xdg-open", os.path.expanduser(file_name)], check=True)

    def _run_command(self, command):
        run([command], check=True)

    def _open_chrome(self, url):
        run(["google-chrome", "--new-window", url], check=True)

    def _open_firefox(self, url):
        run(["firefox", "--new-window", url], check=True)
