#!/usr/bin/env bash
# Extract the embedded <script> block from index.html and run `node --check`
# on it to catch JavaScript syntax errors. Exits nonzero on failure.
set -euo pipefail

SRC="index.html"
OUT="_check.js"

# Print the lines strictly between the first <script> and the next </script>.
awk '
  /<\/script>/ { inside = 0 }
  inside       { print }
  /<script>/   { inside = 1 }
' "$SRC" > "$OUT"

if [ ! -s "$OUT" ]; then
  echo "check.sh: failed to extract a <script> block from $SRC" >&2
  exit 1
fi

node --check "$OUT"
echo "check.sh: $SRC script block passed node --check"
