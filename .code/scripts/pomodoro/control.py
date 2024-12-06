import sys
import zmq

ADDRESS = "tcp://127.0.0.1:12323"


def main():
    context = zmq.Context()
    socket = context.socket(zmq.REQ)
    socket.connect(ADDRESS)

    socket.send(sys.argv[1].encode("utf-8"))


if __name__ == "__main__":
    main()
