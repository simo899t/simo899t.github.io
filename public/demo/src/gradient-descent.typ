// PREAMBLE (lines 1-5 shown as #import/#show in the animation, not editable)
// Edit the content below (line 7 onwards) to change the animation.
// Run: bash public/demo/build.sh  — to regenerate the rendered SVGs.
// Then push. The animation will reflect your changes automatically.
#let apx = $approx$
#let loss = $cal(L)$
// ── CONTENT ──────────────────────────────────────────────────
= Gradient Descent

The update rule for parameters $theta$ with
loss $cal(L)$:

$ theta_(t+1) = theta_t
  - alpha nabla_theta (theta_t) $

where $alpha > 0$ is the learning rate.

= Mini-batch SGD

Approximate $nabla_theta loss$ over
a batch $cal(B) subset cal(D)$:

#let batch = $cal(B)$
#let batchsSize = $abs(batch)$

$ nabla_theta loss apx
  1 / batchsSize
  sum_(i in batch) nabla_theta ell_i $
