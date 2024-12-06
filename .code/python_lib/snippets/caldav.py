from caldav import DAVClient
from dataclasses import dataclass
from datetime import datetime
from pytz import timezone


@dataclass
class Event:
    start: datetime
    end: datetime
    title: str
    categories: list


def load_credentials(file_name):
    with open(file_name, "r") as f:
        return f.readlines()[0].strip().split(",")


def create_events(calendar_name, events):
    url, username, password = load_credentials(".calendar")

    with DAVClient(url=url, username=username, password=password) as client:
        calendars = client.principal().calendars()
        calendar = [c for c in calendars if c.name == calendar_name][0]

        for event in events:
            calendar.save_event(
                dtstart=timezone("Europe/Paris").localize(event.start),
                dtend=timezone("Europe/Paris").localize(event.end),
                summary=event.title,
                categories=event.categories,
            )
