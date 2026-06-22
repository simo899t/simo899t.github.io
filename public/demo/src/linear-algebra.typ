// Header baked into every frame via preamble — matches temp.typ note output
#align(center)[
  *DM561 — Linear Algebra* \
  #text(size: 8pt, fill: luma(120))[Simon Holm · SDU · 2025]
]
#v(3pt)
#line(length: 100%, stroke: 0.4pt + luma(160))
#v(8pt)

// Content starts here (lines below are animated)
= Positive Definiteness

A symmetric $A in RR^(n times n)$ is
_positive definite_ ($A succ 0$) iff
$x^T A x > 0$ for all $x != bold(0)$.

#block(
  stroke: 0.4pt + luma(120),
  inset: (x: 8pt, y: 6pt),
  width: 100%,
  fill: luma(248),
)[
  *Definition.* $A succ 0 arrow.l.r.double$ all eigenvalues
  $lambda_i > 0 arrow.l.r.double$ Cholesky decomposition
  $A = L L^T$ exists.
]

*Example.* $mat(2, 1; 1, 3) succ 0$ since
$lambda_1 = (5 + sqrt(5))/2 > 0$ and
$lambda_2 = (5 - sqrt(5))/2 > 0$.
