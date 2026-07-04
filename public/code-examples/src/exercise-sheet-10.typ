= Exercise $1^*$
Consider the Boolean objective function:
$ f(x) = x_1 and (x_2 or not x_3) and (not x_1 or not x_2) $

Formulate the problem as an integer linear program. Can any Boolean satisfiability problem be formulated as an integer linear program? Solve the problem with `scipy`.

== Solution

$ max_x f(x) \
st A x =b \ x in ZZ^n $

= Exercise $2^*$

Consider  $max{c^top x | A x = b, x in ZZ^n}.$ Sometimes the solution of the linear relaxation is already integral. Can you find a sufficient condition for the matrix $A$ for that to happen?

==

$ max_x c^top x \
st A x =b \ x in RR^n $

Firstly $A$ must only have integer entries 

Also for $ A_B x_B + A_N x_N = b imp x = A_B^(-1)b $

Since for $x in ZZ$ then 
$ A^(-1) = 1/det(A) adj(A) $

For this $A_B$ must have $det(A) = 0,-1,1$

"A should be a totally unimodular matrix"