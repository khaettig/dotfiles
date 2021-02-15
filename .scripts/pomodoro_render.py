import math

import zmq

ADDRESS = "tcp://127.0.0.1:12323"

BLOCK_CHAR = "█"
LEFT_CHAR = "▕"
RIGHT_CHAR = "▏"


def render(message, seconds_left, duration_in_s):
    pos_seconds_left = max(0, seconds_left)
    seconds_gone = min(duration_in_s, duration_in_s - pos_seconds_left)

    bar_mult = (25 * 60) / duration_in_s

    minutes_gone = math.floor(bar_mult * seconds_gone / 60)
    minutes_left = math.ceil(bar_mult * pos_seconds_left / 60)

    bar = LEFT_CHAR + minutes_gone * BLOCK_CHAR + minutes_left * " " + RIGHT_CHAR
    if seconds_left < 0:
        seconds_left *= -1
        time_left = "-"
    else:
        time_left = " "
    time_left += f"{seconds_left // 60 :02}:{seconds_left % 60 :02}"
    return message + "  " + bar + " " + time_left + "  "


def main():
    context = zmq.Context()
    socket = context.socket(zmq.REQ)
    socket.connect(ADDRESS)

    socket.send(b"TIME")
    try:
        message, time_in_s, duration = socket.recv().decode("utf-8").split(",")
    except ValueError:
        print("")
        exit()
    print(render(message, int(time_in_s), int(duration)))


if __name__ == "__main__":
    main()
