from src.common import load_fixture, as_strings, Summary
from src.pytest import PytestWrapper

W_ROOT = "/home/kevin/.scripts/test_wrappers/"
S_ROOT = "/home/kevin/Git/spotl.media/"


def test_no_failures():
    stdout, stderr = load_fixture("pytest", "no_failures")

    messages, summary = PytestWrapper().parse(stdout, stderr)

    assert messages == []
    assert summary == Summary(passed=1, total=1)


def test_skipped_test():
    stdout, stderr = load_fixture("pytest", "skipped_test")

    messages, summary = PytestWrapper().parse(stdout, stderr)

    assert messages == []
    assert summary == Summary(passed=1, skipped=1, total=2)


def test_failure_in_test():
    stdout, stderr = load_fixture("pytest", "failure_in_test")

    messages, summary = PytestWrapper().parse(stdout, stderr)

    expected = [
        f"e:test_failure_in_test:{W_ROOT}src/pytest/test_pytest.py:14:Test failed:",
        f"e:test_failure_in_test:{W_ROOT}src/pytest/test_pytest.py:16:assert False",
    ]
    assert as_strings(messages) == expected
    assert summary == Summary(passed=1, failed=1, total=2)


def test_failure_in_code():
    stdout, stderr = load_fixture("pytest", "failure_in_code")

    messages, summary = PytestWrapper().parse(stdout, stderr)

    expected = [
        f"e:test_no_failures:{W_ROOT}src/pytest/test_pytest.py:10:Test failed:",
        f"e:test_no_failures:{W_ROOT}src/pytest/test_pytest.py:15:",
        f"e:test_no_failures:{W_ROOT}src/pytest/wrapper.py:19:AssertionError",
        f"e:test_failure_in_test:{W_ROOT}src/pytest/test_pytest.py:20:Test failed:",
        f"e:test_failure_in_test:{W_ROOT}src/pytest/test_pytest.py:25:",
        f"e:test_failure_in_test:{W_ROOT}src/pytest/wrapper.py:19:AssertionError",
    ]
    assert as_strings(messages) == expected
    assert summary == Summary(passed=0, failed=2, total=2)


def test_syntax_error():
    stdout, stderr = load_fixture("pytest", "syntax_error")

    messages, summary = PytestWrapper().parse(stdout, stderr)

    expected = [
        f"e:test_syntax_error:{W_ROOT}src/pytest/test_pytest.py:60:Test failed:",
        f"e:test_syntax_error:{W_ROOT}src/pytest/test_pytest.py:62:"
        "NameError: name 'mischief' is not defined",
    ]
    assert as_strings(messages) == expected
    assert summary == Summary(passed=3, failed=1, total=4)


def test_import_error():
    stdout, stderr = load_fixture("pytest", "import_error")

    messages, summary = PytestWrapper().parse(stdout, stderr)

    expected = [
        f"e:NameError:{W_ROOT}src/pytest/test_pytest.py:1:"
        "E   NameError: name 'importerror' is not defined"
    ]
    assert as_strings(messages) == expected
    assert summary == Summary(message="CRASHED")


def test_captures_stdout():
    stdout, stderr = load_fixture("pytest", "captures_stdout")

    messages, summary = PytestWrapper().parse(stdout, stderr)

    expected = [
        f"i:test_captures_stdout:{W_ROOT}src/pytest/test_pytest.py:98:Output: A line",
        f"i:test_captures_stdout:{W_ROOT}src/pytest/test_pytest.py:98:Output: Another",
    ]
    assert as_strings(messages) == expected
    assert summary == Summary(passed=1, total=1)


def test_class_based_test():
    stdout, stderr = load_fixture("pytest", "class_based_test")

    messages, summary = PytestWrapper().parse(stdout, stderr)

    expected = [
        "e:AjaxMenuViewTest.test_renders_correct_template:"
        f"{S_ROOT}apps/membership/tests/test_member_menu.py:6:Test failed:",
        "e:AjaxMenuViewTest.test_renders_correct_template:"
        f"{S_ROOT}apps/membership/tests/test_member_menu.py:10:"
        "AssertionError: assert False",
    ]
    assert as_strings(messages) == expected
    assert summary == Summary(failed=1, total=1)


def test_missing_colon_after_def():
    stdout, stderr = load_fixture("pytest", "missing_colon_after_def")

    messages, summary = PytestWrapper().parse(stdout, stderr)

    expected = [
        f"e:SyntaxError:{S_ROOT}apps/membership/tests/test_member_menu.py:25:"
        "E       def test_shows_menu_options(self)",
        f"e:SyntaxError:{S_ROOT}apps/membership/tests/test_member_menu.py:25:"
        "E                                       ^",
        f"e:SyntaxError:{S_ROOT}apps/membership/tests/test_member_menu.py:25:"
        "E   SyntaxError: invalid syntax",
    ]
    assert as_strings(messages) == expected
    assert summary == Summary(message="CRASHED")


def test_fixture_not_found():
    stdout, stderr = load_fixture("pytest", "fixture_not_found")

    messages, summary = PytestWrapper().parse(stdout, stderr)

    expected = [
        f"e:test_:{W_ROOT}src/jest/test_jest.py:0:Test failed:",
        f"e:test_:{W_ROOT}src/jest/test_jest.py:0:" "E       fixture 'self' not found",
    ]
    assert as_strings(messages) == expected
    assert summary == Summary(passed=9, failed=1, total=10)


def test_long_traceback():
    stdout, stderr = load_fixture("pytest", "long_traceback")

    messages, summary = PytestWrapper().parse(stdout, stderr)

    expected = [
        "e:MemberCreationTest.test_links_new_member_to_current_account:"
        f"{S_ROOT}apps/membership/tests/test_member_creation.py:29:Test failed:",
        "e:MemberCreationTest.test_links_new_member_to_current_account:"
        f"{S_ROOT}apps/membership/tests/test_member_creation.py:31:",
        "e:MemberCreationTest.test_links_new_member_to_current_account:"
        f"{S_ROOT}apps/user/mixins.py:57:in dispatch",
        "e:MemberCreationTest.test_links_new_member_to_current_account:"
        f"{S_ROOT}apps/membership/views/ajax_account_views.py:46:in form_valid",
        "e:MemberCreationTest.test_links_new_member_to_current_account:"
        f"{S_ROOT}apps/membership/services.py:11:in send_password_email",
        "e:MemberCreationTest.test_links_new_member_to_current_account:"
        f"{S_ROOT}.venv/lib/python3.8/site-packages/django/urls/resolvers.py:685:"
        "django.urls.exceptions.NoReverseMatch: Reverse for "
        "'password_reset_confirm' with keyword arguments '{'uidb64': "
        "'NDVhN2MyNzgtMWNkZC00YWNiLWJhM2ItZWNhNDZkM2NmZDAz', 'token': "
        "'ajt7ek-c3d2bc2371954b1ba7d47cbbe15eaf3d'}' not found. 1 pattern(s) "
        "tried: ['en/u/reset/(?P<uidb64>[0-9A-Za-z_\\\\-]+)/(?P<token>[0-9A-Za-z]"
        "{1,13}-[0-9A-Za-z]{1,20})/$']",
    ]
    assert as_strings(messages) == expected
    assert summary == Summary(failed=1, total=1)
