import pytz
import logging
import json
import requests
from os.path import expanduser

URL = "https://api.clockify.me/api/v1/workspaces/"
TIMEZONE = pytz.timezone("Europe/Paris")

logging.basicConfig(filename=expanduser("~/.clockify.log"), level=logging.DEBUG)
logger = logging.getLogger()


def create_entry(*, start, end, task, project=""):
    logger.info("Create clockify entry %s, %s, %s, %s", start, end, task, project)
    settings = _load_settings()

    data = {
        "start": TIMEZONE.localize(start).isoformat(),
        "end": TIMEZONE.localize(end).isoformat(),
        "description": task,
    }

    if project:
        projects = _load_projects(settings)

        project_id = projects.get(project, None)

        if project_id:
            data["projectId"] = project_id

    response = requests.post(
        URL + settings["workspaceId"] + "/time-entries",
        headers={
            "X-Api-Key": settings["apiKey"],
            "Content-Type": "application/json",
        },
        data=json.dumps(data),
    )
    logger.info("Response: %s", response.text)


def _load_settings():
    with open(expanduser("~/.clockify.json"), "r") as f:
        return json.load(f)


def _load_projects(settings):
    response = requests.get(
        URL + settings["workspaceId"] + "/projects",
        headers={
            "X-Api-Key": settings["apiKey"],
            "Content-Type": "application/json",
        },
    )

    return {project["name"]: project["id"] for project in response.json()}