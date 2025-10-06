import Game.Levels.L7PsetIntro

World "Lecture8"
Level 1
Title "NotEven"

Introduction "
# Level 1: Induction

In this level, you'll prove your first theorem by mathematical induction: for all natural numbers `n`, we have `n < 2^n`. This captures the fundamental fact that exponential functions grow faster than linear functions.

## Proof Strategy

The proof follows the standard induction template:

**Base Case (`n = 0`):** Show that `0 < 2^0 = 1`. This is straightforward.

**Inductive Step:** Assume `k < 2^k` (the inductive hypothesis `hk`). Prove that `k + 1 < 2^(k+1)`.

The key challenge is connecting `k + 1` to `2^(k+1) = 2 · 2^k`. While the inductive hypothesis gives us `k < 2^k`, we need to show `k + 1 < 2 · 2^k`.

If we can show that `k + 1 ≤ 2k`, then we'd have:

`k + 1 ≤ 2k < 2 · 2^k = 2^(k+1)`

However, `k + 1 ≤ 2k` is only true when `k ≥ 1`. This means you'll need to handle two cases in the inductive step:
- When `k = 0`: Check directly that `1 < 2`
- When `k ≠ 0`: Use the inequality `k + 1 ≤ 2k`

## New Tools You'll Need

### `induction'`
The syntax for induction is: `induction' n with k hk`
- Apply induction on the variable `n`
- Use `k` as the dummy variable in the inductive step
- Use `hk` as the name for the induction hypothesis

This creates two goals:
1. **Base case:** Prove the statement for `n = 0`
2. **Inductive step:** With hypothesis `hk : (statement for k)`, prove the statement for `k + 1`

### `ge_one_of_nonzero`
If `n : ℕ` and `n ≠ 0`, then `1 ≤ n`. Apply this with `apply ge_one_of_nonzero` when you have a hypothesis that `n ≠ 0`.

## Hints

- Use `induction' n with k hk` to begin
- The base case should be handled with `norm_num`
- In the inductive step, use `by_cases hk0 : k = 0` to split into two cases
- When `k = 0`, use `rewrite [hk0]` and `norm_num`
- When `k ≠ 0`, use `ge_one_of_nonzero` to get `1 ≤ k`, then build a chain of inequalities with `bound` and `linarith`
- Use `ring_nf` to simplify `2 * 2^k = 2^(k+1)`
"


theorem ge_one_of_nonzero {n : ℕ} (h : n ≠ 0) : 1 ≤ n :=
by omega

/-- If a natural number `n ≠ 0`, then `1 ≤ n`. -/
TheoremDoc ge_one_of_nonzero as "ge_one_of_nonzero" in "Theorems"

NewTheorem ge_one_of_nonzero

/-- The syntax for induction is: `induction' n with k hk`. This means: apply induction on the
variable `n`, use `k` for the new dummy variable (which could be `n` itself), and `hk` for
the induction hypothesis on `k`. -/
TacticDoc induction'

NewTactic induction'

/-- Prove this
-/
Statement (n : ℕ) : n < 2 ^ n := by
induction' n with k hk
norm_num
by_cases hk0 : k = 0
rewrite [hk0]
norm_num
have : 1 ≤ k := by apply ge_one_of_nonzero hk0
have f1 : k + 1 ≤ 2 * k := by bound
have f2 : 2 * k < 2 * 2 ^ k := by linarith [hk]
have f3 : 2 * 2 ^ k = 2 ^ (k + 1) := by ring_nf
linarith [f1, f2, f3]



Conclusion "
## Your First Induction Proof Complete!

You've successfully proven that `n < 2^n` for all natural numbers using mathematical induction. This demonstrates a fundamental principle: exponential functions grow faster than linear functions.

## What You Learned

This proof introduced several key techniques:

**Combining Proof Methods:** You used `induction'` as the overall structure, but within the inductive step, you needed `by_cases` to handle different scenarios. This is a common pattern: induction provides the framework, but you often need other tactics to complete the argument.

**Handling Edge Cases:** The `k = 0` case required separate treatment because the inequality `k + 1 ≤ 2k` doesn't hold when `k = 0`. Recognizing when to split cases is an essential skill in mathematical proof.

**Building Inequality Chains:** In the `k ≠ 0` case, you constructed a chain of inequalities: `k + 1 ≤ 2k < 2 · 2^k = 2^(k+1)`. Using the inductive hypothesis `k < 2^k` along with `1 ≤ k` allowed you to bridge from `k + 1` to `2^(k+1)`.

## The Power of Induction

Mathematical induction is one of the most versatile proof techniques. It's essential for:
- Proving formulas like `∑(i=1 to n) i = n(n+1)/2`
- Establishing inequalities involving factorials, exponentials, and recursive sequences
- Verifying properties of recursively defined structures
- Proving algorithm correctness in computer science

## Key Insight

The key insight to remember: induction transforms an infinite problem (proving something for all `n`) into two finite problems (the base case and the inductive step). Master this technique, and you'll have access to a vast collection of provable theorems.
"
