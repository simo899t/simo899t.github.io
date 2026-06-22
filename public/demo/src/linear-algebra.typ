// PREAMBLE (lines 1-5 shown as #import/#show in the animation, not editable)
// Edit the content below (after // ── CONTENT) to change the animation.
// Run: bash public/demo/build.sh  — to regenerate the rendered SVGs.
// Then push. The animation will reflect your changes automatically.
#let RR = $bb(R)$
#let mid = "|"
// ── CONTENT ──────────────────────────────────────────────────
= Matrices

A matrix $A in RR^(m times n)$ maps $RR^n -> RR^m$:

$ A = mat(a_11, dots, a_(1n);
         dots.v, dots.down, dots.v;
         a_(m 1), dots, a_(m n)) $

= Determinant

For $A in RR^(2 times 2)$:

$ det(A) = mat(delim: mid, a, b; c, d) = a d - b c $

$A$ is invertible iff $det(A) != 0$.
