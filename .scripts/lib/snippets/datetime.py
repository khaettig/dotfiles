from datetime import timedelta


def round_to_next_minute(dt):
    current_second = dt.second

    if current_second >= 30:
        dt += timedelta(minutes=1)

    dt = dt.replace(second=0, microsecond=0)

    return dt
