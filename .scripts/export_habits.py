#!/bin/env python3

from subprocess import run
import argparse
import os
import requests
from datetime import date, timedelta, datetime


def main():
    args = parse_arguments()

    user, token = read_file("~/.habitica")
    habit_names = read_file("~/.habitica_habits")

    tasks = requests.get(
        "https://habitica.com/api/v3/tasks/user",
        headers={
            "x-api-user": user,
            "x-api-key": token,
            "x-client": user + "-CustomScript",
        },
    ).json()["data"]

    tasks_by_name = {task["text"]: parse_task(task) for task in tasks}

    rendered_tasks = render_tasks(tasks_by_name, habit_names, args)

    with open("/tmp/to_selection", "w") as f:
        f.write(rendered_tasks)

    run("xsel -b < /tmp/to_selection", shell=True, check=True)


def parse_arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument("week")
    return parser.parse_args()


def read_file(file_name):
    with open(os.path.expanduser(file_name), "r") as f:
        return f.readlines()[0].strip().split(":")


def parse_task(task):
    if "history" not in task:
        return []
    history = task["history"]
    return [parse_history(entry) for entry in history]


def parse_history(entry):
    done = entry["completed"] if "completed" in entry else entry["scoredDown"] == 0
    return {
        "done": 1 if done else 0,
        "date": date.fromtimestamp(entry["date"] / 1000),
    }


def render_tasks(tasks, names, args):
    monday = datetime.strptime(args.week + "-1", "%Y-%W-%w").date()
    year, week = args.week.split("-")
    result = [[f"{year} W{week}", "Mo", "Di", "Mi", "Do", "Fr", "Sa", "So"]]

    for name in names:
        result.append(
            [name]
            + [render_day(monday + timedelta(days=i), tasks[name]) for i in range(7)]
        )

    return "\n".join(";".join(x) for x in result)


def render_day(date, tasks):
    for task in tasks:
        if task["date"] == date:
            return str(task["done"])
    return "-"


if __name__ == "__main__":
    main()
