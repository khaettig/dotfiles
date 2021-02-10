#!/usr/bin/env python3

import os
import stat
from pathlib import Path
from subprocess import run

import requests

NVIM_URL = "https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage"
NVIM_INSTALL = f"{Path.home()}/.local/bin/nvim"

PACKAGES = [
    "python3-pip",
    "python3-venv",
    "curl",
    "tmux",
    "xclip", # Needed for nvim clipboard support
]


def download_file(url, destination):
    print(f"Downloading {url} to {destination}")
    request = requests.get(url)
    with open(destination, "wb") as f:
        f.write(request.content)


def make_executable(file_name):
    os.chmod(file_name, os.stat(file_name).st_mode | stat.S_IEXEC)


def install_config_file(source, link):
    if link.exists():
        backup = link.with_suffix(".old")
        print(f"Moving existing file to {backup}")
        link.rename(backup)

    print(f"Creating soft link for {source}")
    link.symlink_to(source)


def install_nvim_if_not_installed():
    if Path(NVIM_INSTALL).is_file():
        return
    print("Installing nvim")
    download_file(NVIM_URL, NVIM_INSTALL)
    make_executable(NVIM_INSTALL)

def install_packages():
    for package in PACKAGES:
        run(["sudo", "apt-get", "install", "-y", package], check=True)

def main():
    files = [
        ("init.vim", "~/.config/nvim/init.vim"),
        ("bashrc", "~/.bashrc"),
        ("profile", "~/.profile"),
        ("pylintrc", "~/.pylintrc"),
        ("pdbrc.py", "~/.pdbrc.py"),
        ("tmux.conf", "~/.tmux.conf"),
        ("pycodestyle", "~/.config/pycodestyle"),
        ("scripts", "~/.scripts/"),
    ]

    install_packages()
    install_nvim_if_not_installed()

    for source, link in files:
        install_config_file(Path.cwd() / source, Path(link).expanduser())


if __name__ == "__main__":
    main()
