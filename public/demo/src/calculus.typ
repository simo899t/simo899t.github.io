= Taylor Series

#definition(title: "Taylor Series")[
  If $f$ is infinitely differentiable at $a$, its Taylor series there is
  $ f(x) = sum_(n=0)^(oo) (f^((n))(a)) / (n!) (x-a)^n $
]

Centered at $a = 0$ this is the *Maclaurin series*:
$ f(x) = f(0) + f'(0) x + (f''(0))/(2!) x^2 + (f'''(0))/(3!) x^3 + dots.c $

Some common Taylor expansions are

$ e^x &= sum_(n=0)^(oo) x^n/(n!) = 1 + x + x^2/(2!) + x^3/(3!) + dots.c \
  sin x &= sum_(n=0)^(oo) (-1)^n x^(2n+1)/((2n+1)!) = x - x^3/(3!) + x^5/(5!) - dots.c $
