#!/bin/bash
# Compile one SVG per animated content line for each demo.
# Each .typ file: first 9 lines = header block (title, author, rule) always compiled in.
# Lines 10+ are the animated content — one SVG per line.
# Lines mid-expression reuse the last valid SVG.
# Run from repo root: bash public/demo/build.sh

set -e
SRC="$(dirname "$0")/src"
OUT="$(dirname "$0")"
TMP=$(mktemp -d)
trap "rm -rf $TMP" EXIT

PAGE_PREAMBLE='#set page(width: 240pt, height: auto, margin: (x: 14pt, y: 12pt))
#set text(size: 9.5pt, font: "New Computer Modern")
#set block(spacing: 0.65em)
'

HEADER_LINES=9   # same for all three files

compile_per_line() {
  local slug="$1"
  local src="$SRC/$slug.typ"
  local total; total=$(wc -l < "$src")
  local last_good=0

  echo "=== $slug (content lines $((HEADER_LINES+1))–$total) ==="

  for ((n=HEADER_LINES+1; n<=total; n++)); do
    local cl=$((n - HEADER_LINES))   # 1-indexed content line
    local frag="$TMP/${slug}_${cl}.typ"
    { printf '%s\n' "$PAGE_PREAMBLE"; head -n "$n" "$src"; } > "$frag"

    local out="$OUT/${slug}-${cl}.svg"
    if typst compile --format svg "$frag" "$out" 2>/dev/null; then
      last_good=$cl
      echo "  cl $cl ✓"
    else
      if [ "$last_good" -gt 0 ]; then
        cp "$OUT/${slug}-${last_good}.svg" "$out"
        echo "  cl $cl — reusing $last_good"
      else
        echo "  cl $cl — no valid frame yet"
      fi
    fi
  done
}

compile_per_line linear-algebra
compile_per_line gradient-descent
compile_per_line calculus

echo ""
echo "Done — $(ls "$OUT"/*.svg 2>/dev/null | wc -l | tr -d ' ') SVGs"
