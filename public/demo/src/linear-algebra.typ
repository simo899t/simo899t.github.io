= Gauss Elimination

#definition(title: "Linear Independence")[
  Vectors $v_1, dots, v_n in RR^m$ are *linearly independent* if
  $ c_1 v_1 + dots.c + c_n v_n = 0 quad => quad c_1 = dots.c = c_n = 0 $
  for scalars $c_1, dots, c_n in RR$.
]

Gauss elimination reduces a matrix to *row echelon form* (REF) using three
elementary row operations - swapping, scaling, and adding a multiple of
one row to another. If every row ends up with a nonzero pivot, the
original rows were linearly independent.

Take $v_1 = vec(0,1,2)$, $v_2 = vec(1,3,1)$, $v_3 = vec(2,4,5)$. The first pivot is
zero, so swap first:

$ mat(0,1,2; 1,3,1; 2,4,5)
  quad &=^(R_1 <-> R_2) quad
  mat(1,3,1; 0,1,2; 2,4,5) 

  \

  mat(1,3,1; 0,1,2; 2,4,5)
  quad &=^(R_3 -> R_3 - 2R_1) quad
  mat(1,3,1; 0,1,2; 0,-2,3)
  
  \

  mat(1,3,1; 0,1,2; 0,-2,3)
  quad &=^(R_3 -> R_3 + 2R_2) quad
  mat(1,3,1; 0,1,2; 0,0,7) $

Every pivot ($1$, $1$, $7$) is nonzero, so $v_1, v_2, v_3$ are *linearly
independent*.
