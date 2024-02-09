from datetime import datetime
from playsound import playsound
from timer import Timer
from input import ask_for_input
from snippets.clockify import create_entry
from snippets.datetime import round_to_next_minute

BEEP_PATH = "/home/kevin/.misc/beep.mp3"
LOG_PATH = "/home/kevin/.pomodoro_log.txt"


class State:
    def __init__(self):
        self.timer = None
        self.next_is_break = False

        self.current_goal = ""

    def handle(self, message):
        if message == "NEXT":
            self._next()
        if message == "STOP":
            self._stop()

    def update(self):
        if self.timer:
            print(self.timer.render(), flush=True)
            if self.timer.done:
                try:
                    playsound(BEEP_PATH, block=False)
                except Exception:
                    pass

    def _next(self):
        if self.next_is_break:
            self._log_timer()
            self.timer = Timer("BREAK", 5 * 60)
            self.next_is_break = False
        else:
            input = ask_for_input()
            if input["goal"].strip() == "":
                self._stop()
                return
            self.current_goal = input["goal"]
            self.current_categories = input["categories"]
            self.timer = Timer("POMODORO", input["minutes"] * 60)
            self.next_is_break = True

    def _stop(self):
        self.timer = None
        self.next_is_break = False
        print(" ", flush=True)

    def _log_timer(self):
        try:
            create_entry(
                start=round_to_next_minute(self.timer.started),
                end=round_to_next_minute(datetime.now()),
                task=self.current_goal,
                project=self.current_categories[0] if len(self.current_categories) else "",
            )
        except Exception:
            pass
