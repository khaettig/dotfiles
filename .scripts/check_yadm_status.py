from subprocess import run, PIPE

def check(command, message):
    result = run(command, stdout=PIPE, check=True).stdout.decode("utf-8")
    if not result:
        return
    run(["notify-send", "-t", "20000", "-u", "critical", f"{message}:\n{result}"], check=True)


if __name__ == '__main__':
    check(["yadm", "status", "-s"], "You have unsaved changes")
    check(["yadm", "log", "origin/master..HEAD"], "You have unpushed commits:")
