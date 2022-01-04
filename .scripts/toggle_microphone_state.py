from subprocess import run, PIPE

ON = """
                    ______   __    __
                   /      \ /  \  /  |
                  /$$$$$$  |$$  \ $$ |
                  $$ |  $$ |$$$  \$$ |
                  $$ |  $$ |$$$$  $$ |
                  $$ |  $$ |$$ $$ $$ |
                  $$ \__$$ |$$ |$$$$ |
                  $$    $$/ $$ | $$$ |
                   $$$$$$/  $$/   $$/

"""

OFF = """
                ______   ________  ________
               /      \ /        |/        |
              /$$$$$$  |$$$$$$$$/ $$$$$$$$/
              $$ |  $$ |$$ |__    $$ |__
              $$ |  $$ |$$    |   $$    |
              $$ |  $$ |$$$$$/    $$$$$/
              $$ \__$$ |$$ |      $$ |
              $$    $$/ $$ |      $$ |
               $$$$$$/  $$/       $$/

"""


def read_device_id():
    try:
        with open(".microphone_id", "r") as f:
            return "".join(f.readlines()).strip()
    except FileNotFoundError:
        return "-1"


def main():
    device_id = read_device_id()

    if device_id == "-1":
        return

    raw = run(
        ["amixer", "-c", device_id, "sset", "Mic", "toggle"], stdout=PIPE, check=True
    ).stdout.decode("utf-8")

    if "[off]" in raw:
        message = ["critical", OFF]
    else:
        message = ["normal", ON]

    run(["notify-send", "-t", "300", "-u", *message], check=True)


if __name__ == "__main__":
    main()
