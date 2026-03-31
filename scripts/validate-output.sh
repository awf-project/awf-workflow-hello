#!/usr/bin/env bash
set -euo pipefail

# Validate that the previous step produced non-empty output
if [ -z "${AWF_STEP_OUTPUT:-}" ]; then
  echo "Error: no output from greeting step" >&2
  exit 1
fi

echo "Output validated: ${AWF_STEP_OUTPUT}"
