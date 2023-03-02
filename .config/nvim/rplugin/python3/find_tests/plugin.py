import pynvim
from find_tests.quickfix import set_quickfix_list
from find_tests.coveragepy import find_tests_running_file


@pynvim.plugin
class FindTests:
    def __init__(self, nvim):
        self.nvim = nvim

    @pynvim.command("FindTests", nargs=("*"))
    def find_tests(self, args):
        tests = find_tests_running_file(file_name=self.nvim.current.buffer.name)
        set_quickfix_list(
            self.nvim,
            items=[self._render_entry(test) for test in tests],
        )

    def _render_entry(self, test):
        return {
            "filename": test["file_name"],
            "text": test["class_name"] + "::" + test["method_name"],
            "lnum": test["line_number"],
        }
