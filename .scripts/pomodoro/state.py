from itertools import cycle
from playsound import playsound
from timer import Timer

TIMERS = cycle((
    ("POMODORO", 25 * 60),
    ("BREAK", 5 * 60),
))


class State:
    def __init__(self):
        self.timer = None

    def handle(self, message):
        if message == "NEXT":
            self.timer = Timer(*next(TIMERS))
        if message == "STOP":
            self.timer = None
            print(" ", flush=True)

    def update(self):
        if self.timer:
            print(self.timer.render(), flush=True)
            if self.timer.done:
                try:
                    playsound("/home/kevin/.misc/beep.mp3", block=False)
                except Exception:
                    pass
