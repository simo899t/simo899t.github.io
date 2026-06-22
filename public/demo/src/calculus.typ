// PREAMBLE (lines 1-5 shown as #import/#show in the animation, not editable)
// Edit the content below (line 7 onwards) to change the animation.
// Run: bash public/demo/build.sh  — to regenerate the rendered SVGs.
// Then push. The animation will reflect your changes automatically.

// ── CONTENT ──────────────────────────────────────────────────
= Chain Rule

For $h(x) = f(g(x))$, the derivative is:

$ (d h) / (d x) = (d f) / (d g) dot (d g) / (d x) $

== Backpropagation

At layer $l$ with pre-activation $z^((l)) = W^((l)) a^((l-1))$:

$ (partial cal(L)) / (partial W^((l)))
  = (partial cal(L)) / (partial z^((l)))
  dot (partial z^((l))) / (partial W^((l))) $

== Gradient of Loss

For $cal(L) = 1/n sum_(i=1)^n ell(hat(y)_i, y_i)$:

$ nabla_W cal(L) = 1/n sum_(i=1)^n
  delta^((l)) (a^((l-1)))^T $

where $delta^((l)) = (partial cal(L))/(partial z^((l)))$
is the *error signal* at layer $l$.
