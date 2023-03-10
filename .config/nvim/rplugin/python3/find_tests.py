import pynvim
from snippets.quickfix import SetQuickfixList
from snippets.coveragepy import find_tests_for_file


@pynvim.plugin
class FindTests:
    def __init__(self, nvim):
        self.nvim = nvim

    @pynvim.command("FindTestsForFile", nargs=("*"))
    def for_file(self, args):
        tests = find_tests_for_file(file_name=self.nvim.current.buffer.name)
        SetQuickfixList(self.nvim)(items=[self._render_entry(test) for test in tests],)

    def _render_entry(self, test):
        return {
            "filename": test["file_name"],
            "text": test["class_name"] + "::" + test["method_name"],
            "lnum": test["line_number"],
        }
