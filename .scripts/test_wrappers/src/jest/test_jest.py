from src.common import load_fixture, as_strings, Summary
from src.jest import JestWrapper

ROOT = "/home/kevin/Git/spotl.media/frontend/spec/"


def test_no_failures():
    stdout, stderr = load_fixture("jest", "no_failures")

    messages, summary = JestWrapper().parse(stdout, stderr)

    assert messages == []
    assert summary == Summary(passed=1, total=1)


def test_failure_in_test():
    stdout, stderr = load_fixture("jest", "failure_in_test")

    messages, summary = JestWrapper().parse(stdout, stderr)

    # ● hello world

    # expect(received).toBe(expected) // Object.is equality

    # Expected: true
    # Received: false

    # 1 | test("hello world", () => {
    # > 2 |   expect(false).toBe(true);
    #   |                 ^
    # 3 | });
    # 4 |

    # at Object.<anonymous>.test (spec/test_jest.js:2:17)

    expected = [
        f"e:hello world:spec/test_jest.js:2:"
        "expect(received).toBe(expected) // Object.is equality",
        "",
        "    Expected: true",
        "    Received: false",
        "",
        '      1 | test("hello world", () => {',
        "    > 2 |   expect(false).toBe(true);",
        "        |                 ^",
        "      3 | });",
        "      4 | ",
        "",
        f"e:hello world:spec/test_jest.js:2:at Object.<anonymous>.test",
        "",
    ]
    assert as_strings(messages) == expected
    assert summary == Summary(failed=1, total=1)
