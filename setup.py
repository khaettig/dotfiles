#!/usr/bin/env python3

import os
from pathlib import Path


def install(source, link):
    if link.exists():
        backup = link.with_suffix('.old')
        print(f'Moving existing file to {backup}')
        link.rename(backup)

    print(f'Creating soft link for {source}')
    link.symlink_to(source)


if __name__ == '__main__':
    files = [ 
        ('init.vim', '~/.config/nvim/init.vim'),
        ('bashrc', '~/.bashrc'),
        ('pylintrc', '~/.pylintrc'),
        ('pdbrc.py', '~/.pdbrc.py'),
        ('tmux.conf', '~/.tmux.conf')]

    for source, link in files:
        install(Path.cwd() / source, Path(link).expanduser())
