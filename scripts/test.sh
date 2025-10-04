#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="$PWD"
python -m unittest -q
echo "✅ tests passed"
