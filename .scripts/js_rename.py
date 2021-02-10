python3 << endpython

import os
from subprocess import run
import vim


def js_rename(root, source, destination):
    full_source = os.path.join(root, source + ".js")
    full_destination = os.path.join(root, destination + ".js")

    os.rename(full_source, full_destination)
    output = run(
        [
            "find",
            root,
            "-name",
            "*.js",
            "-not",
            "-path",
            "*/node_modules/*",
            "-exec",
            "sed",
            "-i",
            f"s:{source}:{destination}:g",
            "{}",
            "+",
        ],
        check=True,
    )
    vim.command("checkt")
    vim.command("NERDTreeRefreshRoot")


endpython
