# `just` `1.55.0` introduced `minimum-version` setting
set minimum-version := "1.55.0"

set shell := ["bash", "-euc"]
export PYTHONPATH := shell("realpath .")

[private]
default:
    @just --list

lock:
    # Let `pip freeze` handle as many exclusions as it can
    # Remove editable packages because they are expected to be available locally
    pip freeze \
      --exclude-editable \
      >requirements-lock.txt
    # Strip local versions so PyTorch is the same on Linux and macOS
    sed --in-place -e 's/+[[:alnum:]]\+$$//g' requirements-lock.txt
    # Remove nvidia-* and triton because they cannot be installed on macOS
    # The packages have no sdists, and their wheels are not available for macOS
    # They install automatically on Linux as a requirement of PyTorch
    sed --in-place -e '/^\(nvidia-.*\|triton\)==.*/d' requirements-lock.txt

actionlint: (precommit "actionlint")

codespell: (precommit "codespell")

just: (precommit "just")

lychee: (precommit "lychee")

markdownlint: (precommit "markdownlint")

mypy: (precommit "mypy")

prettier: (precommit "prettier")

pylint: (precommit "pylint")

ruff: (precommit "ruff-check")

ruff-format: (precommit "ruff-format")

shellcheck: (precommit "shellcheck")

shfmt: (precommit "shfmt")

yamllint: (precommit "yamllint")

zizmor: (precommit "zizmor")

precommit *ARGS:
    prek run --all-files {{ ARGS }}

check: precommit

fix: lock check

update:
    pip install --upgrade pip
    pip install --upgrade -r requirements-lock.txt

upgrade:
    pip install --upgrade pip
    pip install --upgrade --upgrade-strategy eager --group base --group dev
    prek update

install:
    {{ just_executable() }} update
