// PREAMBLE (lines 1-5 shown as #import/#show in the animation, not editable)
// Edit the content below (line 7 onwards) to change the animation.
// Run: bash public/demo/build.sh  — to regenerate the rendered SVGs.
// Then push. The animation will reflect your changes automatically.

// ── CONTENT ──────────────────────────────────────────────────
= Positive Definiteness

A symmetric $A in RR^(n times n)$ is
_positive definite_ ($A succ 0$) iff
$x^T A x > 0$ for all $x != bold(0)$.

#block(
  stroke: 0.4pt + luma(120),
  inset: (x: 8pt, y: 6pt),
  width: 100%, fill: luma(248),
)[
  *Definition.* $A succ 0 arrow.l.r.double$
  all $lambda_i > 0$ — Cholesky $A = L L^T$.
]

*Example.* $mat(2, 1; 1, 3) succ 0$ since
$lambda_1 = (5 + sqrt(5))/2 > 0$ and
$lambda_2 = (5 - sqrt(5))/2 > 0$.
