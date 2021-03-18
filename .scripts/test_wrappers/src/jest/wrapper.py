import json

from src.common import Wrapper, PlainMessage, Message, Summary


class JestWrapper(Wrapper):
    command = ["jest", "--json"]

    def parse(self, stdout, stderr):
        data = json.loads(stdout)
        return self.parse_messages(data), self.parse_summary(data)

    def parse_messages(self, data):
        return [
            message
            for test_suite in data["testResults"]
            for message in self.parse_test_suite(test_suite, data)
        ]

    def parse_test_suite(self, test_suite, data):
        return [
            message
            for test in test_suite["message"].split("●")[1:]
            for message in self.change_paths_to_absolute(
                self.parse_test(test), test_suite
            )
        ]

    def parse_test(self, test):
        lines = test.split("\n")
        traceback_messages = self.get_traceback_messages(lines)
        error_mesages = self.get_error_messages(lines, traceback_messages[-1])
        return [*error_mesages, *traceback_messages]

    def get_traceback_messages(self, lines):
        result = []
        tracebacks_reached = False
        for line in reversed(lines):
            if line.strip() == "" and tracebacks_reached:
                break
            if line.strip() == "":
                continue
            tracebacks_reached = True
            parsed = self.parse_traceback_line(line)
            if parsed:
                result.insert(0, Message("e", lines[0].strip(), *parsed))
        return result

    def get_error_messages(self, lines, traceback):
        result = [
            Message(
                "e",
                traceback.module_name,
                traceback.file_name,
                traceback.line_number,
                lines[2].strip(),
            )
        ]
        for line in lines[3:]:
            if line.startswith("      at "):
                break
            result.append(PlainMessage(line))
        return result

    def parse_traceback_line(self, line):
        #    at <object> (<file_name>:2:17)
        traceback, location = line.split("(")
        split_location = location.split(":")
        #    at new Promise (<anonymous>)
        if (
            len(split_location) == 1
            or split_location[0].startswith("internal")
            or "node_modules" in split_location[0]
        ):
            return None
        return split_location[0], split_location[1], traceback.strip()

    def parse_summary(self, data):
        return Summary(
            passed=data["numPassedTests"],
            failed=data["numFailedTests"],
            total=data["numTotalTests"],
        )

    def change_paths_to_absolute(self, messages, test_suite):
        root = test_suite["name"].replace(messages[0].file_name, "")

        for message in messages:
            message.add_root_to_file_name(root)

        return messages
