// PREAMBLE (lines 1-5 shown as #import/#show in the animation, not editable)
// Edit the content below (line 7 onwards) to change the animation.
// Run: bash public/demo/build.sh  — to regenerate the rendered SVGs.
// Then push. The animation will reflect your changes automatically.

// ── CONTENT ──────────────────────────────────────────────────
= Gradient Descent

The update rule for parameters $theta$ with
loss $cal(L)$:

$ theta_(t+1) = theta_t
  - eta nabla_theta cal(L)(theta_t) $

where $eta > 0$ is the learning rate.

== Mini-batch SGD

Approximate $nabla_theta cal(L)$ over
a batch $cal(B) subset cal(D)$:

$ nabla_theta cal(L) approx
  1 / |cal(B)|
  sum_(i in cal(B)) nabla_theta ell_i $
