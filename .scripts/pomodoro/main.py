from time import sleep
import zmq
from state import State

ADDRESS = "tcp://127.0.0.1:12323"


def fetch_message(socket):
    try:
        message = socket.recv(zmq.NOBLOCK).decode("utf-8")
        socket.send(b"OK")
        return message
    except zmq.error.Again:
        pass


def main():
    context = zmq.Context()
    socket = context.socket(zmq.REP)
    socket.bind(ADDRESS)

    state = State()

    while True:
        message = fetch_message(socket)
        state.handle(message)
        state.update()
        sleep(1)


if __name__ == "__main__":
    main()
