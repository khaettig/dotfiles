python3 << endpython

import os
import vim
from datetime import date


NOTES_DIR = "Notes/"
WORK_NOTES_DIR = "WorkNotes/"
ARCHIVE_DIR = "Archive/"
PROJECTS_DIR = "Projects/"
SOMEDAY_DIR = "Someday/"
WAITING_DIR = "Waiting/"
PROTOCOL_DIR = "Protocols/"

PROTOCOL_TEMPLATE = """# {}
"""


def move_to_dir(dir_name):
    paths = vim.current.buffer.name.split(NOTES_DIR)
    file_name = paths[1].split("/")[1]
    new_path = paths[0] + NOTES_DIR + dir_name + file_name
    os.rename(vim.current.buffer.name, new_path)
    vim.current.buffer.name = new_path


def gtd_archive():
    move_to_dir(ARCHIVE_DIR)


def gtd_project():
    move_to_dir(PROJECTS_DIR)


def gtd_someday():
    move_to_dir(SOMEDAY_DIR)


def gtd_waiting():
    move_to_dir(WAITING_DIR)


def open_protocol():
    today = date.today().strftime("%y-%m-%d")
    new_path = os.path.expanduser("~/" + WORK_NOTES_DIR + PROTOCOL_DIR + today + ".md")

    if not os.path.exists(new_path):
        with open(new_path, "w+") as f:
            for line in PROTOCOL_TEMPLATE.format(today):
                f.write(line)
    vim.command('e' + new_path)


endpython
