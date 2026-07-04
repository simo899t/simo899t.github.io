#import "@local/sdust:0.1.0": *

= Problem 10

The Sherman-Morrison formula is a result that says that if $A in RR^(n times n)$ is invertible and $v$, $w in RR^(n times 1)$, then
$ inv(A + v tran(w)) = inv(A) - (inv(A) v tran(w) inv(A))/(1 + tran(w) inv(A) v) $

As long as the denominator is not zero. Prove that this formula holds by multiplying $A + v tran(w)$ by its proposed inverse.

== Solution

We want to prove that: 
$ (A + v tran(w)) (inv(A) - (inv(A) v tran(w) inv(A))/(1 + tran(w) inv(A) v)) = I $

We can rewrite this as:
$ = A inv(A) - A ((inv(A) v tran(w) inv(A))/(1 + tran(w) inv(A) v)) + v tran(w) inv(A) - v tran(w) ((inv(A) v tran(w) inv(A))/(1 + tran(w) inv(A) v)) $

and then as:
$ = I - (I v tran(w) inv(A))/(1 + tran(w) inv(A) v) + (v tran(w) inv(A))/1 - v tran(w) ((tran(w) inv(A) v tran(w) inv(A))/(1 + tran(w) inv(A) v)) $

$ = I - (v tran(w) inv(A))/(1 + tran(w) inv(A) v) + (v tran(w) inv(A))/(1 + tran(w) inv(A) v) - v tran(w) ((inv(A) v tran(w) inv(A))/(1 + tran(w) inv(A) v)) $