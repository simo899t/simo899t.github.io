// PREAMBLE (lines 1-5 shown as #import/#show in the animation, not editable)
// Edit the content below (after // ── CONTENT) to change the animation.
// Run: bash public/demo/build.sh  — to regenerate the rendered SVGs.
// Then push. The animation will reflect your changes automatically.
// (definition/inv come from buildPageSetup() in index.astro, not a real
// import — see the note at the top of that function for why.)
// ── CONTENT ──────────────────────────────────────────────────
= Newton's Method

#definition(title: "Newton's Update Rule")[
  To find a minimum of a twice-differentiable $f$, iterate
  $ x_(k+1) = x_k - inv(H_k) nabla f(x_k) $
  where $H_k$ is the Hessian of $f$ at $x_k$.
]

Geometrically, this models $f$ near $x_k$ by its second-order Taylor
expansion and jumps straight to that quadratic approximation's minimum,
rather than crawling downhill one gradient step at a time.

= Quadratic Convergence

Let $x^*$ be a local minimum with $nabla f(x^*) = 0$ and $H^*$ positive
definite, and write the error at step $k$ as $e_k = x_k - x^*$. Expanding
$nabla f$ around $x^*$ with Taylor's theorem and substituting into the
update rule gives
$ e_(k+1) approx C e_k^2 $
for some constant $C$ depending on the third derivatives of $f$ near $x^*$.

The error *squares* each step rather than merely shrinking by a constant
factor — once $x_k$ is close enough to $x^*$, the number of correct digits
roughly *doubles* every iteration.
