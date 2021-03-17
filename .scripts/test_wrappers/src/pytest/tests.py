from src.pytest import PytestWrapper
from src.common import load_fixture, Summary


def test_no_failures():
    stdout, stderr = load_fixture("pytest/no_failures")
    wrapper = PytestWrapper()

    messages, summary = PytestWrapper().parse(stdout, stderr)

    assert messages == []
    assert summary == Summary(passed=1, total=1)
