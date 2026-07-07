// PREAMBLE (lines 1-5 shown as #import/#show in the animation, not editable)
// Edit the content below (after // ── CONTENT) to change the animation.
// Run: bash public/demo/build.sh  — to regenerate the rendered SVGs.
// Then push. The animation will reflect your changes automatically.
#let RR = $bb(R)$
// ── CONTENT ──────────────────────────────────────────────────
= What is a Matrix?

#definition(title: "Matrix")[
  An $m times n$ matrix is a rectangular array of
  numbers with $m$ rows and $n$ columns:
  $ A = mat(a_11, dots, a_(1n);
           dots.v, dots.down, dots.v;
           a_(m 1), dots, a_(m n)) $
]

= Matrix-Vector Product

#example(title: "Multiplication")[
  For $A in RR^(2 times 2)$ and $arrow(x) in RR^2$:
  $ A arrow(x) =
    mat(a, b; c, d)
    mat(x_1; x_2) =
    mat(a x_1 + b x_2; c x_1 + d x_2) $
]

= The Identity Matrix

#definition(title: "Identity")[
  $I$ satisfies $A I = I A = A$ for any square $A$:
  $ I = mat(1, 0; 0, 1) $
]
