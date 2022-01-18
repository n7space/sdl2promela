from typing import List


def assert_lines_match(actual: List[str], expected: List[str]):
    for i in range(0, max(len(actual), len(expected))):
        actualLine = actual[i].strip() if i < len(actual) else ""
        expectedLine = expected[i].strip() if i < len(expected) else ""
        assert actualLine == expectedLine, "Difference in line {}".format(i + 1)
