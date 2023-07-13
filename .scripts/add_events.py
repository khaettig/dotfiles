#!/usr/bin/env python3

from collections import defaultdict
import argparse
from datetime import date, datetime, timedelta
from pandas_ods_reader import read_ods
from snippets.caldav import create_events, Event

STEP_SIZE = timedelta(minutes=15)
PATH = "/home/kevin/Dokumente/Tabellen/"
WEEKDAYS = {
    0: "Monday",
    1: "Tuesday",
    2: "Wednesday",
    3: "Thursday",
    4: "Friday",
    5: "Saturday",
    6: "Sunday",
}


def main():
    args = parse_arguments()
    events = parse_data(load_data(args.file), args)
    create_events(calendar_name="Time Blocking", events=events)


def parse_arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument("offset", type=int)
    parser.add_argument("days", type=int)
    parser.add_argument("file", default="Week.ods", type=str)
    return parser.parse_args()


def load_data(file_name):
    raw = read_ods(PATH + file_name, headers=False).to_numpy().transpose()[1:-1]

    data = defaultdict(list)

    for row in raw:
        data[row[0]].append(list(row[1:]))

    return data


def parse_data(data, args):
    today = date.today()
    events = []

    for i in range(args.offset, args.offset + args.days):
        day = today + timedelta(days=i)

        for row in data[WEEKDAYS[day.weekday()]]:
            events += generate_events(row, day)

    return events


def generate_events(row, day):
    events = []

    for step, value in enumerate(row):
        if value is None:
            continue

        if value == ".":
            events[-1].end += STEP_SIZE
            continue

        split = value.split("(")

        start = (
            datetime(
                day.year,
                day.month,
                day.day,
                7,
                30,
            )
            + step * STEP_SIZE
        )
        events.append(
            Event(
                start=start,
                end=start + STEP_SIZE,
                title=split[0].strip(),
                categories=[split[1][:-1]] if len(split) > 1 else [],
            )
        )

    return events


if __name__ == "__main__":
    main()
