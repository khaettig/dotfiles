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
    lines = result.stdout.decode("utf-8").split("\n")

    failure_start = 0
    in_failure = False

    in_error = False
    for i, line in enumerate(lines):
        if line.startswith("E     File"):
            in_error = True
            split = line.split(" ")
            file_name = split[6][1:-2]
            line_number = split[8]

        elif line.startswith("E "):
            if not in_error and not in_failure:
                in_failure = True
                failure_start = i
        else:
            if in_error:
                in_error = False
                message = lines[i - 1][1:].strip()
                print(f"e:{file_name}:{line_number}:{message}")
            elif in_failure:
                in_failure = False
                message = lines[i - 1][1:].strip()
                split = lines[failure_start - 2].split(":")
                file_name = split[0]
                line_number = split[1]
                print(f"e:{file_name}:{line_number}:{message}")

    # ============================== 1 passed in 1.60s ===============================
    # ============================== 1 failed in 1.30s ===============================
    # ============================== 1 error in 1.30s ===============================
    # ====================== 1 failed, 212 deselected in 0.22s =======================
    # ====================== 1 passed, 211 deselected in 1.40s =======================
    # ==================== 1 failed, 2 passed, 1 skipped in 1.86s ====================
    # ================= 3 passed, 1 skipped, 208 deselected in 1.59s =================

    raw_summary = lines[-2].strip("=").split("in")[0]
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
    duration = time.time() - start_time

    summary = f"SUMMARY: {passed}P {failed}F {skipped}S {total}T in {duration:.2f}s"
    print(summary, end="")
    exit(result.returncode)


if __name__ == "__main__":
    main()
