#!/bin/env python3

import argparse
import csv
import datetime


def main():
    args = parse_arguments()

    with open(args.csv, "r", encoding="ISO-8859-1") as csv_file:
        reader = csv.reader(csv_file, delimiter=";")
        rows = list(reader)[7:]

    parsed_rows = [parse_row(row) for row in rows]

    with open("output.csv", "w") as csv_file:
        writer = csv.writer(csv_file, delimiter=";")
        for row in reversed(parsed_rows):
            writer.writerow(row)


def parse_arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument("csv", help="The csv to parse.")
    return parser.parse_args()


def parse_row(row):
    date = datetime.datetime.strptime(row[0], "%d/%m/%Y").strftime("%Y-%m-%d")
    return [date, "BP Giro", row[1], row[2].replace(",", ".")]


if __name__ == "__main__":
    main()
