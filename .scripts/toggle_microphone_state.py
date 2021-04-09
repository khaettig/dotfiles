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


def main():
    raw = run(
        ["amixer", "-c", "3", "sset", "Mic", "toggle"], stdout=PIPE, check=True
    ).stdout.decode("utf-8")

    if "[off]" in raw:
        message = ["critical", OFF]
    else:
        message = ["normal", ON]

    run(["notify-send", "-t", "300", "-u", *message], check=True)


if __name__ == "__main__":
    main()
