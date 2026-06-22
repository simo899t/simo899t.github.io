// Header baked into every frame via preamble — matches temp.typ note output
#align(center)[
  *AI505 — Optimisation* \
  #text(size: 8pt, fill: luma(120))[Simon Holm · SDU · 2025]
]
#v(3pt)
#line(length: 100%, stroke: 0.4pt + luma(160))
#v(8pt)

// Content starts here (lines below are animated)
= Gradient Descent

The update rule for parameters $theta$ with
loss $cal(L)$:

$ theta_(t+1) = theta_t - eta nabla_theta cal(L)(theta_t) $

where $eta > 0$ is the learning rate.

== Mini-batch SGD

Approximate $nabla_theta cal(L)$ over a batch
$cal(B) subset cal(D)$:

$ nabla_theta cal(L) approx 1 / |cal(B)| sum_(i in cal(B)) nabla_theta ell_i $
