from subprocess import run, PIPE


def main():
    raw = run(["amixer", "-c", "3"], stdout=PIPE).stdout.decode("utf-8")

    if "[off]" in raw:
        print("  MUTED ⚠️  ")


if __name__ == "__main__":
    main()
