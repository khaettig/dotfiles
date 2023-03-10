import pynvim
from snippets.quickfix import LoadQuickfixList
from snippets.selected_tests import save_selected_tests


@pynvim.plugin
class SelectTests:
    def __init__(self, nvim):
        self.nvim = nvim

    @pynvim.command("SelectTestsFromQuickFixList", nargs=("*"))
    def from_quick_fix_list(self, args):
        tests = LoadQuickfixList(self.nvim)()
        save_selected_tests(tests, ".selected_tests.json")
