#!/bin/bash
# Compile Typst demo frames for the notes page animation.
# Run from repo root: bash public/demo/build.sh
# Requires: typst CLI (https://typst.app)
#
# For each source file, we compile frames at specific line counts
# (the "checkpoint" lines that match atLine values in notes/index.astro).
# Outputs: public/demo/<slug>-<n>.svg

set -e
SRC="$(dirname "$0")/src"
OUT="$(dirname "$0")"

compile_frame() {
  local slug="$1"
  local lines="$2"
  local frame="$3"
  local src="$SRC/$slug.typ"
  local tmp="/tmp/typst-demo-frame-$$.typ"

  head -n "$lines" "$src" > "$tmp"
  typst compile --format svg "$tmp" "$OUT/$slug-$frame.svg" 2>/dev/null
  rm "$tmp"
  echo "  $slug-$frame.svg (first $lines lines)"
}

echo "=== linear-algebra ==="
compile_frame linear-algebra 6  1   # heading
compile_frame linear-algebra 10 2   # + definition paragraph
compile_frame linear-algebra 19 3   # + definition box
compile_frame linear-algebra 23 4   # + example

echo "=== gradient-descent ==="
compile_frame gradient-descent 6  1   # heading
compile_frame gradient-descent 12 2   # + update rule
compile_frame gradient-descent 14 3   # + learning rate sentence
compile_frame gradient-descent 20 4   # + mini-batch formula

echo "=== calculus ==="
compile_frame calculus 6  1   # FTC heading
compile_frame calculus 11 2   # + FTC formula
compile_frame calculus 14 3   # + chain rule heading
compile_frame calculus 20 4   # + backprop sentence

echo ""
echo "Done — SVGs in public/demo/"
ls "$OUT"/*.svg 2>/dev/null | sed 's|.*/||'
