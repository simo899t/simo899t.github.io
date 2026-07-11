= Proof by Induction

#theorem(title: "Sum of Powers of Two")[
  $ sum_(i=0)^(n) 2^i = 2^(n+1) - 1 quad forall n >= 0 $
]

One can prove this via induction

#pseudo[
  *Proof by induction*
  - Goal: prove $P(n)$ that $sum_(i=0)^(n) 2^i = 2^(n+1) - 1 quad forall n >= 0$.
  + *$underline("Base case")$*
    + $sum_(i=0)^(0) 2^i = 2^0 = 1 = 2^(0+1) - 1$. #h(1fr)
  + *$underline("Inductive hypothesis")$*
    + Assume that $sum_(i=0)^(k) 2^i = 2^(k+1) - 1$ for some $k >= 0$.
  + *$underline("Inductive step")$*
    + $ sum_(i=0)^(kplus) 2^i
        &= (sum_(i=0)^(k) 2^i) + 2^kplus qquad "(by IH)" \
        &= (2^(k+1) - 1) + 2^(k+1) \
        &= 2 dot 2^(k+1) - 1 \
        &= 2^(k+2) - 1 $
    + This is exactly $P(k+1)$, completing the induction. #h(1fr) $square$
]
