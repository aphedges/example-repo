.PHONY: default
default:
	@echo "an explicit target is required"

SHELL=/usr/bin/env bash

PYTHON_FILES=$(shell git ls-files '*.py' | sort | tr '\n' ' ')

export PYTHONPATH := $(shell realpath .)

.PHONY: reqs-freeze
reqs-freeze:
	pip freeze >requirements-lock.txt

.PHONY: black
black:
	pre-commit run --all-files black

.PHONY: codespell
codespell:
	pre-commit run --all-files codespell

.PHONY: mypy
mypy:
	mypy $(PYTHON_FILES)

.PHONY: markdownlint
markdownlint:
	pre-commit run --all-files markdownlint

.PHONY: prettier
prettier:
	pre-commit run --all-files prettier

.PHONY: pylint
pylint:
	pylint $(PYTHON_FILES)

.PHONY: ruff
ruff:
	pre-commit run --all-files ruff

.PHONY: shellcheck
shellcheck:
	pre-commit run --all-files shellcheck

.PHONY: precommit
precommit:
	pre-commit run --all-files

.PHONY: check
check: precommit mypy pylint

.PHONY: fix
fix: reqs-freeze check

.PHONY: update
update:
	pip install --upgrade pip setuptools wheel
	pip install --upgrade -r requirements-lock.txt

.PHONY: install
install:
	bash setup.sh
