// Header baked into every frame via preamble — matches temp.typ note output
#align(center)[
  *MM536 — Analysis* \
  #text(size: 8pt, fill: luma(120))[Simon Holm · SDU · 2025]
]
#v(3pt)
#line(length: 100%, stroke: 0.4pt + luma(160))
#v(8pt)

// Content starts here (lines below are animated)
= Fundamental Theorem

If $f$ is continuous on $[a, b]$ and
$F' = f$, then:

$ integral_a^b f(x) dif x = F(b) - F(a) $

= Chain Rule

For $h(x) = f(g(x))$:

$ (dif h) / (dif x) = (dif f) / (dif g) dot (dif g) / (dif x) $

In backprop: $(partial cal(L)) / (partial W) =
(partial cal(L)) / (partial z) dot
(partial z) / (partial W)$ applied layer by layer.
