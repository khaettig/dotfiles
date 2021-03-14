import time
import sys
from subprocess import run, PIPE

# Failure:
# apps/membership/tests/test_member_menu.py:23: in test_renders_constant_as_title_for_all_selections
#     assert False
# E   AssertionError: assert False
# === ...

# Error:
# E     File "/home/kevin/Git/spotl.media/apps/membership/tests/test_member_menu.py", line 16
# E       deftest_renders_constant_as_title_for_all_selections(self):
# E                                                                 ^
# E   SyntaxError: invalid syntax
# === ...


def main():
    start_time = time.time()
    result = run(["pytest", "--tb=short", *sys.argv[1:]], stdout=PIPE, stderr=PIPE,)

    stderr = result.stderr.decode("utf-8")
    if stderr:
        lines = stderr.split("\n")
        message = lines[-2]
        for line in reversed(lines):
            if line.strip().startswith("File"):
                parts = line[8:].split(" ")
                file_name = parts[0][:-2]
                line_number = parts[2][:-1]
                break
        render_message("e", "Invalid code", file_name, line_number, message)
        print("SUMMARY: INVALID CODE", end="")
        exit(1)

    lines = result.stdout.decode("utf-8").split("\n")
    sections = split_lines(lines, header_char="=")

    handle_errors(sections.get("ERRORS", []))
    handle_failures(sections.get("FAILURES", []))
    handle_summary(lines[-2], time.time() - start_time)
    exit(result.returncode)


def split_lines(lines, header_char):
    start = 1
    label = ""
    result = {}
    for i, line in enumerate(lines):
        if line.startswith(header_char):
            if label:
                result[label] = lines[start:i]
            start = i + 1
            label = line.strip(header_char).strip()
    if label:
        result[label] = lines[start : len(lines)]
    return result


def render_message(error_type, module_name, file_name, line_number, message):
    print(f"{error_type}:{module_name}:{file_name}:{line_number}:{message}")


def handle_errors(lines):
    # ==================================== ERRORS ====================================
    # ___________________ ERROR collecting apps/sequencer/tests.py ___________________
    # .venv/lib/python3.8/site-packages/_pytest/python.py:578: in _importtestmodule
    #     mod = import_path(self.fspath, mode=importmode)
    # .venv/lib/python3.8/site-packages/_pytest/pathlib.py:531: in import_path
    #     importlib.import_module(module_name)
    # /usr/lib/python3.8/importlib/__init__.py:127: in import_module
    #     return _bootstrap._gcd_import(name[level:], package, level)
    # <frozen importlib._bootstrap>:1014: in _gcd_import
    #     ???
    # <frozen importlib._bootstrap>:991: in _find_and_load
    #     ???
    # <frozen importlib._bootstrap>:975: in _find_and_load_unlocked
    #     ???
    # <frozen importlib._bootstrap>:671: in _load_unlocked
    #     ???
    # .venv/lib/python3.8/site-packages/_pytest/assertion/rewrite.py:161: in exec_module
    #     source_stat, co = _rewrite_test(fn, self.config)
    # .venv/lib/python3.8/site-packages/_pytest/assertion/rewrite.py:354: in _rewrite_test
    #     tree = ast.parse(source, filename=fn_)
    # /usr/lib/python3.8/ast.py:47: in parse
    #     return compile(source, filename, mode, flags,
    # E     File "/home/kevin/Git/spotl.media/apps/sequencer/tests.py", line 8
    # E       deftest_valid_patch(self):
    # E                                ^
    # E   SyntaxError: invalid syntax
    errors = split_lines(lines, header_char="_")
    for key, value in errors.items():
        handle_error(key, value)


def handle_error(title, lines):
    module_name = title
    for line in lines:
        if line.startswith("E     File"):
            parts = line[12:].split(" ")
            file_name = parts[0][:-2]
            line_number = parts[2]
    message = lines[-1][4:]

    render_message("e", module_name, file_name, line_number, message)


def handle_failures(lines):
    # =================================== FAILURES ===================================
    # ______ AjaxMenuViewTest.test_renders_constant_as_title_for_all_selections ______
    # .venv/lib/python3.8/site-packages/django/urls/base.py:72: in reverse
    #     extra, resolver = resolver.namespace_dict[ns]
    # E   KeyError: 'm %t'
    # During handling of the above exception, another exception occurred:
    # apps/membership/tests/test_member_menu.py:22: in test_renders_constant_as_title_for_all_selections
    #     url_for_selected(
    # apps/core/utils.py:277: in url_for_selected
    #     reverse(name, kwargs={"pk": root.id} if root else {}),
    # .venv/lib/python3.8/site-packages/django/urls/base.py:83: in reverse
    #     raise NoReverseMatch("%s is not a registered namespace" % key)
    # E   django.urls.exceptions.NoReverseMatch: 'm %t' is not a registered namespace
    # ----------------------------- Captured stdout call -----------------------------
    # hello world
    # ________________ AjaxMenuViewTest.test_renders_correct_template ________________
    # apps/membership/tests/test_member_menu.py:14: in test_renders_correct_template
    #     assert False
    # E   AssertionError: assert False
    failures = split_lines(lines, header_char="_")
    for key, value in failures.items():
        handle_failure(key, value)


def handle_failure(title, lines):
    module_name = title
    test_name = title.split(".")[-1]
    for line in lines:
        if test_name in line:
            parts = line.split(":")
            file_name = parts[0]
            line_number = parts[1]
            render_message("e", module_name, file_name, line_number, "Failing Test:")
            break

    capturing_stdout = False
    stdout = []

    for i, line in enumerate(lines):
        if line.startswith("E "):
            for j in reversed(range(0, i)):
                if lines[j].startswith(" "):
                    continue
                parts = lines[j].split(":")
            render_message("e", module_name, parts[0], parts[1], line[1:].strip())
        if capturing_stdout:
            if "Captured log call" in line:
                capturing_stdout = False
                continue
            render_message("i", module_name, file_name, line_number, line)
        if line.startswith("-") and "Captured stdout call" in line:
            capturing_stdout = True


def handle_summary(last_line, duration):
    # ============================== 1 passed in 1.60s ===============================
    # ============================== 1 failed in 1.30s ===============================
    # ============================== 1 error in 1.30s ===============================
    # ====================== 1 failed, 212 deselected in 0.22s =======================
    # ====================== 1 passed, 211 deselected in 1.40s =======================
    # ==================== 1 failed, 2 passed, 1 skipped in 1.86s ====================
    # ================= 3 passed, 1 skipped, 208 deselected in 1.59s =================

    raw_summary = last_line.strip("=").split("in")[0]
    options = ["passed", "failed", "error", "skipped", "deselected"]
    parsed_summary = {
        option: int(part.strip().split(" ")[0])
        for option in options
        for part in raw_summary.split(",")
        if option in part
    }

    passed = parsed_summary.get("passed", 0)
    failed = parsed_summary.get("failed", 0) + parsed_summary.get("error", 0)
    skipped = parsed_summary.get("skipped", 0)
    total = passed + failed + skipped + parsed_summary.get("deselected", 0)

    summary = f"SUMMARY: {passed}P {failed}F {skipped}S {total}T in {duration:.2f}s"
    print(summary, end="")


if __name__ == "__main__":
    main()
