def load_fixture(name):
    with open("src/" + name + "_stdout.json") as f:
        stdout = f.read()
    with open("src/" + name + "_stderr.json") as f:
        stderr = f.read()
    return stdout, stderr
