= NP-Completeness: 3-SAT to Independent Set

In 3-SAT, each clause has exactly three literals, e.g. $(x_1 or overline(x_2) or x_3)$.
In Independent Set, we ask whether a graph has $k$ vertices with no edge
between any two of them.

#theorem(title: "3-SAT Reduces to Independent Set")[
  Given a 3-SAT formula with $m$ clauses, one can build a graph $G$ such
  that the formula is satisfiable if and only if $G$ has an independent
  set of size $m$.
]

*Construction.* For each clause $(l_1 or l_2 or l_3)$, add a triangle of
three vertices, one per literal. Connect two vertices from *different*
triangles exactly when their literals are negations of each other.

*Proof.*
- ($=>$) A satisfying assignment makes some literal true in every clause.
  Picking one true literal per clause gives $m$ vertices — one per
  triangle, so none share a triangle, and no two are negations of each
  other (both can't be true), so no edge crosses triangles either.
- ($<==$) An independent set of size $m$ must pick exactly one vertex per
  triangle, since any two vertices within a triangle are connected.
  Setting each picked literal true is consistent, since no two picked
  literals are negations of each other. Every clause then has a true
  literal, so the formula is satisfied.

This is the classic reduction showing Independent Set is NP-hard.
