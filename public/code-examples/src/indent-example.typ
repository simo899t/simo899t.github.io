#import "@local/sdust:0.1.0": *

= Typst uses indentation in a smart way

== Lists
- Sets
  - Finite sets
    - Empty set $emptyset$
  - Infinite sets
    - Countable, e.g. $NN$
    - Uncountable, e.g. $RR$
- Relations
  - Reflexive, symmetric, transitive

== Trees
#figure(
  tree(
    shape: "rectangle",
    reverse: false,
    spacing: (40pt, 40pt),
  )[
    - root
      - child 1
        - child 1.1
        - child 1.2
      - child 2
  ],
  caption: [Tree example],
) <label>

== Induction proofs
#pseudo[
*Proof by induction*
- We want to prove that $sum_(i=1)^n i = (n(n+1))/2$ for all $n >= 0$
- *$underline("Base case")$* ($n = 0$)
  + The empty sum is $0$, and $(0 dot 1)/2 = 0$
  + So the claim holds for $n = 0$
- *$underline("Inductive hypothesis")$*
  + Assume $sum_(i=1)^k i = (k(k+1))/2$ for some $k >= 0$
- *$underline("Inductive step")$*
  + Show the claim for $k + 1$:
    $ sum_(i=1)^(k+1) i &= sum_(i=1)^k i + (k+1) \ &= (k(k+1))/2 + (k+1) quad "by the hypothesis" \ &= ((k+1)(k+2))/2 $
  + This matches the claim with $n = k+1$
+ By induction, $sum_(i=1)^n i = (n(n+1))/2$ holds for all $n >= 0$. #QED
]



