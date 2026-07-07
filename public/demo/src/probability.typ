// PREAMBLE (lines 1-5 shown as #import/#show in the animation, not editable)
// Edit the content below (after // ── CONTENT) to change the animation.
// Run: bash public/demo/build.sh  — to regenerate the rendered SVGs.
// Then push. The animation will reflect your changes automatically.
#let dx = $space upright(d)x$
// ── CONTENT ──────────────────────────────────────────────────
= Definite Integral

The integral gives the signed area under $f$:

$ integral_a^b f(x) dx = "Area under" f "on" [a, b] $

= Normal Distribution

#definition(title: "Gaussian Density")[
  For mean $mu$ and variance $sigma^2$:
  $ f(x) = 1 / (sigma sqrt(2 pi))
    e^(-(x - mu)^2 / (2 sigma^2)) $
]

= Expectation

The mean of a continuous random variable $X$:

$ EE[X] = integral_(-infinity)^infinity x f(x) dx $

= Total Probability

#theorem(title: "Normalization")[
  Every valid density integrates to $1$ over $RR$:
  $ integral_(-infinity)^infinity f(x) dx = 1 $
]
