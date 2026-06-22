#!/bin/bash
# Compile one SVG per animated content line for each demo.
# Edit the .typ files in public/demo/src/ to change what gets animated.
# Content starts at line 7 (lines 1-6 are comments/preamble marker).
# Run from repo root: bash public/demo/build.sh

set -e
SRC="$(dirname "$0")/src"
OUT="$(dirname "$0")"
TMP=$(mktemp -d)
trap "rm -rf $TMP" EXIT

# Page styling applied to every compiled frame
PAGE_PREAMBLE='#set page(width: 240pt, height: auto, margin: (x: 14pt, y: 12pt))
#set text(size: 9.5pt, font: "New Computer Modern")
#set block(spacing: 0.65em)

// Header shown in every frame
#align(center)[
  *Course notes* \
  #text(size: 8pt, fill: luma(120))[Simon Holm · SDU · 2025]
]
#v(3pt)
#line(length: 100%, stroke: 0.4pt + luma(160))
#v(8pt)

'

SKIP_LINES=6   # comment block at top of each .typ file

compile_per_line() {
  local slug="$1"
  local src="$SRC/$slug.typ"
  local total; total=$(wc -l < "$src")
  local last_good=0

  echo "=== $slug (content lines $((SKIP_LINES+1))–$total) ==="

  for ((n=SKIP_LINES+1; n<=total; n++)); do
    local cl=$((n - SKIP_LINES))   # 1-indexed content line
    local frag="$TMP/${slug}_${cl}.typ"
    { printf '%s' "$PAGE_PREAMBLE"; tail -n +$((SKIP_LINES+1)) "$src" | head -n "$cl"; } > "$frag"

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
