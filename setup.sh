#!/usr/bin/env bash

set -euxo pipefail

PYTHONPATH=$(dirname "$(realpath "$0")")
export PYTHONPATH

# Set up Python environment
make update

# Initialize data directories
python -c 'import paths'
