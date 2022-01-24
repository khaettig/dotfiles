def save_device_id(device_id):
    with open(".microphone_id", "w") as f:
        f.write(str(device_id))


def main():
    with open("/proc/asound/cards", "r") as f:
        for line in f.readlines()[::2]:
            print(line, end="")

    device_id = int(input("Choose your microphone id: "))

    save_device_id(device_id)


if __name__ == "__main__":
    main()
