import json
from dataclasses import dataclass


@dataclass
class Test:
    file_name: str
    class_name: str = None
    method_name: str = None
    line_number: int = None

    @property
    def identifier(self):
        result = self.file_name

        if self.class_name:
            result += "::" + self.class_name

        if self.method_name:
            result += "::" + self.method_name

        return result


def load_selected_tests(file_name):
    with open(file_name, "r") as f:
        data = json.load(f)
    return [Test(**test) for test in data["tests"]]


def save_selected_tests(tests, file_name):
    with open(file_name, "w+") as f:
        json.dump({"tests": [test.__dict__ for test in tests]}, f, indent=4)
