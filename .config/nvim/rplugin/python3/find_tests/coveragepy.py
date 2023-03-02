import sqlite3
import subprocess


def find_tests_running_file(file_name):
    rows = sqlite3.connect(".coverage").cursor().execute(
        f"""
        SELECT DISTINCT context
        FROM context c
        INNER JOIN arc a ON c.id = a.context_id
        INNER JOIN file f ON a.file_id = f.id
        WHERE f.path="{file_name}";
        """
    )
    return [parse_row(row) for row in rows.fetchall() if row[0]]


def parse_row(row):
    split = row[0].split("|")[0].split("::")
    return {
        "file_name": split[0],
        "class_name": split[1],
        "method_name": split[2],
        "line_number": get_line_number(
            file_name=split[0],
            method_name=split[2],
        ),
    }


def get_line_number(file_name, method_name):
    return (
        subprocess.run(
            ["grep", "-n", "def " + method_name, file_name],
            capture_output=True,
        )
        .stdout.decode("utf-8")
        .split(":")[0]
    )
