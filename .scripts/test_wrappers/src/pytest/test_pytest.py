from src.pytest import PytestWrapper
from src.common import load_fixture, Summary

ROOT = "/home/kevin/.scripts/test_wrappers"


def as_strings(iterables):
    return list(map(str, iterables))


def test_no_failures():
    stdout, stderr = load_fixture("pytest", "no_failures")
    wrapper = PytestWrapper()

    messages, summary = PytestWrapper().parse(stdout, stderr)

    assert messages == []
    assert summary == Summary(passed=1, total=1)


def test_skipped_test():
    stdout, stderr = load_fixture("pytest", "skipped_test")
    wrapper = PytestWrapper()

    messages, summary = PytestWrapper().parse(stdout, stderr)

    assert messages == []
    assert summary == Summary(passed=1, skipped=1, total=2)


def test_failure_in_test():
    stdout, stderr = load_fixture("pytest", "failure_in_test")
    wrapper = PytestWrapper()

    messages, summary = PytestWrapper().parse(stdout, stderr)

    assert as_strings(messages) == [
        f"e:test_failure_in_test:{ROOT}/src/pytest/test_pytest.py:14:Failing Test:",
        f"e:test_failure_in_test:{ROOT}/src/pytest/test_pytest.py:16:AssertionError",
        f"e:test_failure_in_test:{ROOT}/src/pytest/test_pytest.py:16:assert False",
    ]
    assert summary == Summary(passed=1, failed=1, total=2)


def test_failure_in_code():
    stdout, stderr = load_fixture("pytest", "failure_in_code")
    wrapper = PytestWrapper()

    messages, summary = PytestWrapper().parse(stdout, stderr)

    assert as_strings(messages) == [
        f"e:test_no_failures:{ROOT}/src/pytest/test_pytest.py:10:Failing Test:",
        f"e:test_no_failures:{ROOT}/src/pytest/test_pytest.py:15:",
        f"e:test_no_failures:{ROOT}/src/pytest/wrapper.py:19:AssertionError",
        f"e:test_failure_in_test:{ROOT}/src/pytest/test_pytest.py:20:Failing Test:",
        f"e:test_failure_in_test:{ROOT}/src/pytest/test_pytest.py:25:",
        f"e:test_failure_in_test:{ROOT}/src/pytest/wrapper.py:19:AssertionError",
    ]
    assert summary == Summary(passed=0, failed=2, total=2)


def test_syntax_error():
    stdout, stderr = load_fixture("pytest", "syntax_error")
    wrapper = PytestWrapper()

    messages, summary = PytestWrapper().parse(stdout, stderr)

    assert as_strings(messages) == [
        f"e:test_syntax_error:{ROOT}/src/pytest/test_pytest.py:60:Failing Test:",
        f"e:test_syntax_error:{ROOT}/src/pytest/test_pytest.py:62:NameError",
        f"e:test_syntax_error:{ROOT}/src/pytest/test_pytest.py:62:"
        + "NameError: name 'mischief' is not defined",
    ]
    assert summary == Summary(passed=3, failed=1, total=4)


def test_import_error():
    stdout, stderr = load_fixture("pytest", "import_error")
    wrapper = PytestWrapper()

    messages, summary = PytestWrapper().parse(stdout, stderr)

    assert as_strings(messages) == [
        f"e:import error:{ROOT}/src/pytest/test_pytest.py:1:"
        + "NameError: name 'importerror' is not defined"
    ]
    assert summary == Summary(message="CRASHED")
