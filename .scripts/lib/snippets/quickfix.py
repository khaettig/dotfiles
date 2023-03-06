import json
from .selected_tests import Test


class LoadQuickfixList:
    def __init__(self, nvim):
        self._nvim = nvim
        self._buffer_name_cache = {}

    def __call__(self):
        return self._parse_output(self._nvim.command_output("echo getqflist()"))

    def _parse_output(self, output):
        parsed_output = json.loads(output.replace("'", '"'))
        return [self._parse_entry(entry) for entry in parsed_output]

    def _parse_entry(self, entry):
        class_name, method_name = entry["text"].split("::")
        return Test(
            file_name=self._get_file_name(entry["bufnr"]),
            class_name=class_name,
            method_name=method_name,
            line_number=entry["lnum"],
        )

    def _get_file_name(self, buffer_number):
        if buffer_number not in self._buffer_name_cache:
            self._buffer_name_cache[buffer_number] = self._nvim.command_output(
                f"echo bufname({ buffer_number })"
            )
        return self._buffer_name_cache[buffer_number]


class SetQuickfixList:
    def __init__(self, nvim):
        self._nvim = nvim

    def __call__(self, items):
        self._nvim.command(self._render_call(self._render_items(items)))

    def _render_call(self, rendered_items):
        return f"call setqflist([], ' ', {{'items': [{rendered_items}]}})"

    def _render_items(self, items):
        return ",".join(self._render_item(item) for item in items)

    def _render_item(self, item):
        return "{" + ",".join(f"'{k}': '{v}'" for k, v in item.items()) + "}"
