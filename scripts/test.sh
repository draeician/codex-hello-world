#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="$PWD"

# Explicitly discover tests in the tests/ directory
python -m unittest discover -s tests -p "test_*.py" -v

echo "✅ tests passed"
