---
title: "KKT Conditions — A Quick Primer"
date: 2026-06-01
tags: ["optimisation", "KKT", "calculus"]
summary: "The Karush–Kuhn–Tucker conditions generalise Lagrange multipliers to inequality constraints. Here's an intuitive breakdown."
draft: false
---

## What are the KKT conditions?

The **Karush–Kuhn–Tucker (KKT) conditions** are necessary conditions for a solution to a constrained optimisation problem to be optimal. They generalise the method of Lagrange multipliers to handle *inequality constraints*.

Consider the problem:

$$
\min_{x} f(x) \quad \text{s.t.} \quad g_i(x) \leq 0, \; h_j(x) = 0
$$

### The four KKT conditions

1. **Stationarity** — the gradient of the Lagrangian is zero:
   $$\nabla f(x^*) + \sum_i \mu_i \nabla g_i(x^*) + \sum_j \lambda_j \nabla h_j(x^*) = 0$$

2. **Primal feasibility** — the original constraints are satisfied:
   $$g_i(x^*) \leq 0, \quad h_j(x^*) = 0$$

3. **Dual feasibility** — multipliers for inequality constraints are non-negative:
   $$\mu_i \geq 0$$

4. **Complementary slackness** — either the constraint is active or its multiplier is zero:
   $$\mu_i \cdot g_i(x^*) = 0$$

### Intuition

Complementary slackness is the key insight: if an inequality constraint is *not active* (i.e., $g_i(x^*) < 0$), it doesn't affect the solution, so $\mu_i = 0$. If it *is* active, $\mu_i$ can be nonzero.

Under convexity, KKT conditions are also *sufficient* for optimality.
