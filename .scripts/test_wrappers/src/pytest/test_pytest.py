from src.pytest import PytestWrapper
from src.common import load_fixture, Summary

ROOT = "/home/kevin/.scripts/test_wrappers"


def as_strings(iterables):
    return list(map(str, iterables))


def test_no_failures():
    stdout, stderr = load_fixture("pytest/no_failures")
    wrapper = PytestWrapper()

    messages, summary = PytestWrapper().parse(stdout, stderr)

    assert messages == []
    assert summary == Summary(passed=1, total=1)


def test_failure_in_test():
    stdout, stderr = load_fixture("pytest/failure_in_test")
    wrapper = PytestWrapper()

    messages, summary = PytestWrapper().parse(stdout, stderr)

    assert as_strings(messages) == [
        f"e:test_failure_in_test:{ROOT}/src/pytest/test_pytest.py:14:Failing Test:",
        f"e:test_failure_in_test:{ROOT}/src/pytest/test_pytest.py:16:AssertionError",
    ]
    assert summary == Summary(passed=1, failed=1, total=2)
