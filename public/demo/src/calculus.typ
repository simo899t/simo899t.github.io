// PREAMBLE (lines 1-5 shown as #import/#show in the animation, not editable)
// Edit the content below (line 7 onwards) to change the animation.
// Run: bash public/demo/build.sh  — to regenerate the rendered SVGs.
// Then push. The animation will reflect your changes automatically.

// ── CONTENT ──────────────────────────────────────────────────
= Fundamental Theorem

If $f$ is continuous on $[a, b]$ and
$F' = f$, then:

$ integral_a^b f(x) dif x = F(b) - F(a) $

= Chain Rule

For $h(x) = f(g(x))$:

$ (dif h) / (dif x) = (dif f) / (dif g)
  dot (dif g) / (dif x) $

In backprop: $(partial cal(L)) / (partial W)
= (partial cal(L)) / (partial z)
  dot (partial z) / (partial W)$
applied layer by layer.
