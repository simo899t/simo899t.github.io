#set page(width: 240pt, height: auto, margin: (x: 14pt, y: 12pt))
#set text(size: 9.5pt, font: "New Computer Modern")
#set block(spacing: 0.65em)

= Gradient Descent

The update rule for parameters $theta$ with
loss $cal(L)$:

$ theta_(t+1) = theta_t - eta nabla_theta cal(L)(theta_t) $

where $eta > 0$ is the learning rate.

== Mini-batch SGD

Approximate $nabla_theta cal(L)$ over a batch
$cal(B) subset cal(D)$:

$ nabla_theta cal(L) approx 1 / |cal(B)| sum_(i in cal(B)) nabla_theta ell_i $
