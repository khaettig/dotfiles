python3 << endpython

import vim
import os

NOTES_DIR = "Notes/"
ARCHIVE_DIR = "Archive/"
PROJECTS_DIR = "Projects/"
SOMEDAY_DIR = "Someday/"

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

endpython
