.PHONY: default
default:
	@echo "an explicit target is required"

SHELL=/usr/bin/env bash

PYTHON_FILES=$(shell git ls-files '*.py' | sort | tr '\n' ' ')

export PYTHONPATH := $(shell realpath .)

.PHONY: reqs-freeze
reqs-freeze:
	# Complex logic needed to pin `setuptools` but not `pip` in Python 3.11 and earlier
	PYTHON_VERSION_AT_LEAST_3_12=$(shell python -c 'import sys; print(int(sys.version_info >= (3, 12)))')
ifeq ($(PYTHON_VERSION_AT_LEAST_3_12),1)
	pip freeze >requirements-lock.txt
else
	pip freeze --all --exclude pip >requirements-lock.txt
endif
	# Strip local versions so PyTorch is the same on Linux and macOS
	sed --in-place -e 's/+[[:alnum:]]\+$$//g' requirements-lock.txt
	# Remove DeepSpeed because it cannot be installed automatically
	sed --in-place -e '/^deepspeed==.*/d' requirements-lock.txt
	# Remove triton because it cannot be installed on macOS
	# The package has no sdists, and its wheels are Linux-only
	# It installs automatically on Linux as a requirement of PyTorch
	sed --in-place -e '/^triton==.*/d' requirements-lock.txt

.PHONY: black
black:
	pre-commit run --all-files black

.PHONY: codespell
codespell:
	pre-commit run --all-files codespell

.PHONY: markdownlint
markdownlint:
	pre-commit run --all-files markdownlint

.PHONY: mypy
mypy:
ifneq ($(PYTHON_FILES),)
	mypy $(PYTHON_FILES)
endif

.PHONY: prettier
prettier:
	pre-commit run --all-files prettier

.PHONY: pylint
pylint:
ifneq ($(PYTHON_FILES),)
	pylint $(PYTHON_FILES)
endif

.PHONY: ruff
ruff:
	pre-commit run --all-files ruff

.PHONY: shellcheck
shellcheck:
	pre-commit run --all-files shellcheck

.PHONY: shfmt
shfmt:
	pre-commit run --all-files shfmt

.PHONY: yamllint
yamllint:
	pre-commit run --all-files yamllint

.PHONY: precommit
precommit:
	pre-commit run --all-files

.PHONY: check
check: precommit mypy pylint

.PHONY: fix
fix: reqs-freeze check

.PHONY: update
update:
	pip install --upgrade pip
	pip install --upgrade -r requirements-lock.txt

.PHONY: upgrade
upgrade:
	pip install --upgrade pip
	pip install --upgrade --upgrade-strategy eager -r requirements.txt -r requirements-dev.txt

.PHONY: install
install:
	make update
