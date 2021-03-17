def get_fixture_prefix(runner_name, fixture_name):
    return f"src/{runner_name}/fixtures/{fixture_name}"


def load_fixture(runner_name, fixture_name):
    with open(get_fixture_prefix(runner_name, fixture_name) + "_stdout.json") as f:
        stdout = f.read()
    with open(get_fixture_prefix(runner_name, fixture_name) + "_stderr.json") as f:
        stderr = f.read()
    return stdout, stderr
