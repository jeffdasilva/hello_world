#!/usr/bin/env python3

import pytest
from main import get_greeting_message


def test_get_greeting_message_returns_string() -> None:
    result = get_greeting_message()
    assert isinstance(result, str), "Result should be a string"


def test_get_greeting_message_content() -> None:
    result = get_greeting_message()
    assert result == "Hello, World!", "Greeting message should match expected output"


if __name__ == "__main__":
    raise SystemExit(pytest.main([__file__]))
