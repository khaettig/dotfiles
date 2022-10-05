from datetime import datetime

WIDTH = 25
FULL_CHAR = "█"
EMPTY_CHAR = "░"


def render_time(seconds):
    sign = "-" if seconds < 0 else " "
    return f"{sign}{abs(seconds) // 60 :02}:{abs(seconds) % 60 :02}"


class Timer:
    def __init__(self, name, duration_in_s):
        self.name = name
        self.duration_in_s = duration_in_s

        self.started = datetime.now()

    def render(self):
        remaining_seconds = self.remaining_seconds
        remaining_percentage = max(0, remaining_seconds / self.duration_in_s)

        n_empty = int(remaining_percentage * WIDTH)
        n_full = WIDTH - n_empty

        return " ".join((
            self.name,
            f"{n_full * FULL_CHAR}{n_empty * EMPTY_CHAR}",
            render_time(remaining_seconds)
        ))

    @property
    def remaining_seconds(self):
        return self.duration_in_s - int((datetime.now() - self.started).total_seconds())

    @property
    def done(self):
        return self.remaining_seconds == 0
