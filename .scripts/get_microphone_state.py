from subprocess import run, PIPE


# If not working anymore:
# Run amixer -c 1/2/3/4... and look for A Capture limit of 0 - 496

def read_device_id():
    try:
        with open(".microphone_id", "r") as f:
            return "".join(f.readlines()).strip()
    except FileNotFoundError:
        return "-1"


def main():
    device_id = read_device_id()

    if device_id == "-1":
        print(" Microphone not configured ")
        return

    raw = run(["amixer", "-c", device_id], stdout=PIPE).stdout.decode("utf-8")

    if "[off]" in raw:
        print("  MUTED ⚠️  ")


if __name__ == "__main__":
    main()
