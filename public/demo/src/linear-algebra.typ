#set page(width: 240pt, height: auto, margin: (x: 14pt, y: 12pt))
#set text(size: 9.5pt, font: "New Computer Modern")
#set block(spacing: 0.65em)

= Positive Definiteness

A symmetric $A in RR^(n times n)$ is
_positive definite_ ($A succ 0$) iff
$x^T A x > 0$ for all $x != bold(0)$.

#block(
  stroke: 0.4pt + black,
  inset: (x: 8pt, y: 6pt),
  width: 100%,
)[
  *Definition.* $A succ 0 arrow.l.r.double$ all eigenvalues
  $lambda_i > 0 arrow.l.r.double$ Cholesky decomposition
  $A = L L^T$ exists.
]

*Example.* $mat(2, 1; 1, 3) succ 0$ since
$lambda_1 = (5 + sqrt(5))/2 > 0$ and
$lambda_2 = (5 - sqrt(5))/2 > 0$.
