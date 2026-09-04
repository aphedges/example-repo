set shell := ["bash", "-euc"]
export PYTHONPATH := shell("realpath .")

[private]
default:
    @just --list

lock:
    pip freeze >requirements-lock.txt
    # Remove editable packages because they are expected to be available locally
    sed --in-place -e '/^-e .*/d' requirements-lock.txt
    # Strip local versions so PyTorch is the same on Linux and macOS
    sed --in-place -e 's/+[[:alnum:]]\+$$//g' requirements-lock.txt
    # Remove nvidia-* and triton because they cannot be installed on macOS
    # The packages have no sdists, and their wheels are not available for macOS
    # They install automatically on Linux as a requirement of PyTorch
    sed --in-place -e '/^\(nvidia-.*\|triton\)==.*/d' requirements-lock.txt

actionlint:
    pre-commit run --all-files actionlint

codespell:
    pre-commit run --all-files codespell

just:
    pre-commit run --all-files just

lychee:
    pre-commit run --all-files --hook-stage manual lychee

markdownlint:
    pre-commit run --all-files markdownlint

mypy:
    pre-commit run --all-files mypy

prettier:
    pre-commit run --all-files prettier

pylint:
    pre-commit run --all-files pylint

ruff:
    pre-commit run --all-files ruff-check

ruff-format:
    pre-commit run --all-files ruff-format

shellcheck:
    pre-commit run --all-files shellcheck

shfmt:
    pre-commit run --all-files shfmt

yamllint:
    pre-commit run --all-files yamllint

zizmor:
    pre-commit run --all-files zizmor

precommit:
    pre-commit run --all-files

check: precommit

fix: lock check

update:
    pip install --upgrade pip
    pip install --upgrade -r requirements-lock.txt

upgrade:
    pip install --upgrade pip
    pip install --upgrade --upgrade-strategy eager --group base --group dev

install:
    {{ just_executable() }} update
