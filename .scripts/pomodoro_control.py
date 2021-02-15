import sys
import random
from datetime import datetime
from playsound import playsound

import zmq

ADDRESS = "tcp://127.0.0.1:12323"
DURATIONS = {True: 25 * 60, False: 5 * 60}


def start_server(context):
    socket = context.socket(zmq.REP)
    socket.bind(ADDRESS)

    begin = datetime.now()
    stop = False
    pomodoro = True
    duration = DURATIONS[pomodoro]

    while True:
        message = socket.recv().decode("utf-8")
        if message == "TIME":
            if stop:
                socket.send("STOP".encode("utf-8"))
                exit()
            seconds_left = duration - int((datetime.now() - begin).total_seconds())
            if seconds_left == 0:
                pass
                # playsound("/home/kevin/.misc/beep.mp3")
            mode = "POMODORO" if pomodoro else "BREAK"
            answer = f"{mode},{seconds_left},{duration}"
            socket.send(answer.encode("utf-8"))
        if message == "NEXT":
            pomodoro = not pomodoro
            duration = DURATIONS[pomodoro]
            begin = datetime.now()
            socket.send("OK".encode("utf-8"))
        if message == "STOP":
            stop = True
            socket.send("OK".encode("utf-8"))
        print(message)


def send_next(context):
    socket = context.socket(zmq.REQ)
    socket.connect(ADDRESS)

    socket.send(b"NEXT")
    socket.recv()


def send_stop(context):
    socket = context.socket(zmq.REQ)
    socket.connect(ADDRESS)

    socket.send(b"STOP")


def main():
    args = sys.argv
    context = zmq.Context()
    try:
        start_server(context)
    except zmq.error.ZMQError as error:
        if "Address already in use" in error.strerror:
            if len(sys.argv) > 1 and sys.argv[1] == "stop":
                send_stop(context)
            else:
                send_next(context)
        else:
            print(error)
            exit(1)


if __name__ == "__main__":
    main()
