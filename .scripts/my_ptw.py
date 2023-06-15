import os
import sys
import subprocess
import time
from watchdog.events import FileSystemEventHandler
from watchdog.observers import Observer
from snippets.selected_tests import load_selected_tests

SELECTED_TESTS_FILE = ".selected_tests.json"
GLOBALS = {
    "outer_restart": True,
    "inner_restart": True,
}


class OuterRestart(FileSystemEventHandler):
    def on_any_event(self, event):
        GLOBALS["outer_restart"] = True


class InnerRestart(FileSystemEventHandler):
    def __init__(self, tests, *args, **kwargs):
        self._tests = tests
        return super().__init__(*args, **kwargs)

    def on_any_event(self, event):
        if not (event.src_path.endswith(".py") or event.src_path.endswith(".html")):
            return
        GLOBALS["inner_restart"] = True


def start_inner_observer(tests):
    observer = Observer()
    observer.schedule(InnerRestart(tests), ".", recursive=True)
    observer.start()
    return observer


def stop_observer(observer):
    if observer:
        observer.stop()
        observer.join()


def main():
    outer_observer = Observer()
    outer_observer.schedule(OuterRestart(), SELECTED_TESTS_FILE)
    try:
        outer_observer.start()
    except FileNotFoundError:
        print(f"Missing {SELECTED_TESTS_FILE}!")
        exit(1)
    inner_observer = None

    try:
        while True:
            if GLOBALS["outer_restart"]:
                GLOBALS["outer_restart"] = False
                tests = load_selected_tests(SELECTED_TESTS_FILE)
                stop_observer(inner_observer)
                inner_observer = start_inner_observer(tests)
            if GLOBALS["inner_restart"]:
                GLOBALS["inner_restart"] = False
                subprocess.run("clear")
                subprocess.run(
                    ["pytest", *[test.identifier for test in tests]],
                    stdout=sys.stdout,
                    env=os.environ,
                    # check=True,
                )
            time.sleep(1)
    except KeyboardInterrupt:
        pass
    finally:
        stop_observer(inner_observer)
        stop_observer(outer_observer)


if __name__ == "__main__":
    main()
