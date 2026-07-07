// PREAMBLE (lines 1-5 shown as #import/#show in the animation, not editable)
// Edit the content below (after // ── CONTENT) to change the animation.
// Run: bash public/demo/build.sh  — to regenerate the rendered SVGs.
// Then push. The animation will reflect your changes automatically.
#let pv(f, x) = $(d #f) / (d #x)$
// ── CONTENT ──────────────────────────────────────────────────
= Newton's Method

#definition(title: "Update Rule")[
  To find a root of $f$, iterate:
  $ x_(n+1) = x_n - f(x_n) / f'(x_n) $
]

= Python Implementation

```py
def newton(f, df, x0, tol=1e-8, max_iter=50):
    x = x0
    for _ in range(max_iter):
        fx = f(x)
        if abs(fx) < tol:
            return x
        x -= fx / df(x)
    return x
```

= Using it for Optimization

#theorem(title: "Newton's Method for Optimization")[
  Minimize $f$ by finding roots of $f'$ using $f''$:
  $ x_(n+1) = x_n - pv(f, x) / f''(x_n) $
]

= Example Run

```output
>>> newton(lambda x: x**2 - 2, lambda x: 2*x, x0=1.0)
1.4142135623730951
```
