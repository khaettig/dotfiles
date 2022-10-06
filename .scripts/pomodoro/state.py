from datetime import datetime
from playsound import playsound
from timer import Timer, render_time
from input import ask_for_input

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
            self.current_goal = input["goal"]
            self.timer = Timer("POMODORO", input["minutes"] * 60)
            self.next_is_break = True

    def _stop(self):
        self.timer = None
        self.next_is_break = False
        print(" ", flush=True)

    def _log_timer(self):
        now = self.timer.started.strftime("%Y-%m-%d %H:%M")
        goal = self.current_goal
        duration = render_time(self.timer.seconds_since_start)

        with open(LOG_PATH, "a") as f:
            f.write(f"{now} |{duration} | {goal}\n")
