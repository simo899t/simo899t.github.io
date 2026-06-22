#set page(width: 240pt, height: auto, margin: (x: 14pt, y: 12pt))
#set text(size: 9.5pt, font: "New Computer Modern")
#set block(spacing: 0.65em)

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
