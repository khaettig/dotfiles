from pathlib import Path


def get_fixture_prefix(runner_name, fixture_name):
    return f"src/{runner_name}/fixtures/{fixture_name}_"


def load_file_if_exists(path):
    if not Path(path).is_file():
        return ""
    with open(path) as f:
        return f.read()


def load_fixture(runner_name, fixture_name):
    prefix = get_fixture_prefix(runner_name, fixture_name)
    return (
        load_file_if_exists(prefix + "stdout.json"),
        load_file_if_exists(prefix + "stderr.json"),
    )
