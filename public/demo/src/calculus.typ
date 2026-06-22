// PREAMBLE (lines 1-5 shown as #import/#show in the animation, not editable)
// Edit the content below (after // ── CONTENT) to change the animation.
// Run: bash public/demo/build.sh  — to regenerate the rendered SVGs.
// Then push. The animation will reflect your changes automatically.
#let loss = $cal(L)$
#let px(f, x) = $(partial #f) / (partial #x)$
#let pv(f, x) = $(d #f) / (d #x)$
#let dx = $upright(d)x$
// ── CONTENT ──────────────────────────────────────────────────
= Fundamental Theorem

If $f$ continuous on $[a, b]$, $F' = f$:

$ integral_a^b f(x) dx = F(b) - F(a) $

= Chain Rule

For $h(x) = f(g(x))$:

$ pv(h, x) = pv(f, g) dot pv(g, x) $

= Backpropagation

At layer $l$ with $z^((l)) = W^((l)) a^((l-1))$:

$ px(loss, W^((l)))
  = px(loss, z^((l)))
  dot px(z^((l)), W^((l))) $

where $px(loss, z^((l))) = delta^((l))$
is the *error signal* at layer $l$.
