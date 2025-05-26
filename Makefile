SHELL := /bin/bash

.SUFFIXES:
.SECONDEXPANSION:


PYTHON_ENTRY_FILE ?= main.py


.PHONY: all
all: test run

.PHONY: run
run: uv-run

.PHONY: test
test: pytest check

.PHONY: check
check: ruff-check mypy-check

.PHONY: format
format: ruff-format

.PHONY: install
install: install-uv uv-install-tools

# https://github.com/astral-sh/uv
.PHONY: install-uv
install-uv:
	curl -LsSf https://astral.sh/uv/install.sh | sh

.PHONY: uv-init
uv-init:
	uv init

.PHONY: uv-lock
uv-lock:
	uv lock

.PHONY: uv-run
uv-run: $(PYTHON_ENTRY_FILE)
	uv run python3 $<

.PHONY: uv-install-tools
uv-install-tools:
	uv tool install ruff 
	uv tool install mypy
	uv tool install pytest

.PHONY: ruff-check
ruff-check:
	uvx ruff check

.PHONY: ruff-format
ruff-format:
	uvx ruff format

.PHONY: mypy-check
mypy-check:
	uvx mypy --strict --ignore-missing-imports --show-error-code-links .

.PHONY: mypy
mypy: mypy-check

.PHONY: pytest
pytest:
	uvx pytest