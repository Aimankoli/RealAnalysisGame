import Game.Levels.L7Levels.L00_Uniqueness

World "Lecture7"
Level 2
Title "Eventually"

Introduction "
# Level 2: Eventually—Convergent Sequences Stay Near Their Limits

When a sequence converges to a nonzero limit, it doesn't just get arbitrarily close to
that limit—it **eventually stays away from zero** as well. This \"eventually bounded away
from zero\" property is crucial for many theorems involving quotients and reciprocals.

The intuition is straightforward: if a sequence is converging to some nonzero value `L`,
then eventually the sequence terms must be at least half as large (in absolute value) as
`L` itself. They can't simultaneously be approaching `L` and shrinking toward zero.

## What We're Proving

**Theorem:** If `a : ℕ → ℝ` converges to `L` with `L ≠ 0`, then there exists `N` such
that for all `n ≥ N`, we have `|a (n)| ≥ |L| / 2`.

In other words, once `n` is large enough, the sequence stays at least half as far from
zero as the limit is.

## The Strategy

The key is to use the convergence condition with `ε = |L| / 2`:

1. Since `L ≠ 0`, we have `|L| > 0`, so `ε = |L| / 2` is a valid positive epsilon
2. Convergence gives us `N` such that `|a (n) - L| < |L| / 2` for all `n ≥ N`
3. This means `a (n)` is within distance `|L| / 2` of `L`
4. By the reverse triangle inequality, this forces `|a (n)| ≥ |L| / 2`

The algebraic key is recognizing that:
$$|L| = |a (n) + (L - a (n))| \\leq |a (n)| + |L - a (n)| < |a (n)| + \\frac{|L|}{2}$$

Rearranging gives us `|a (n)| > |L| / 2`.

## Why This Matters

This result is essential for the next level, where we'll prove that reciprocals of
convergent sequences converge. We need to know that the denominators don't approach zero,
which would cause the reciprocals to blow up. This theorem provides exactly that guarantee!
"

/-- If `a : ℕ → ℝ` converges to `L` and `L ≠ 0`, then there is an `N` so that
for all `n ≥ N`, `|a (n)| ≥ |L| / 2`. -/
TheoremDoc EventuallyGeHalfLimPos as "EventuallyGeHalfLimPos" in "Theorems"

/-- Prove this
-/
Statement EventuallyGeHalfLimPos (a : ℕ → ℝ) (L : ℝ) (aToL : SeqLim a L) (LneZero: L ≠ 0) :
    ∃ N, ∀ n ≥ N, |L| / 2 ≤ |a (n)| := by
specialize aToL (|L| / 2)
have : 0 < |L| := by apply abs_pos_of_nonzero LneZero
have : 0 < |L| / 2 := by bound
specialize aToL this
choose N hN using aToL
use N
intro n hn
specialize hN n hn
have l1 : |L| = |a n + (L - a n)| := by ring_nf
have l2 : |a n + (L - a n)| ≤ |a n| + |L - a n| := by apply abs_add
have l3 : |L - a n| = |-(a n - L)| := by ring_nf
have l4 : |-(a n - L)| = |(a n - L)| := by apply abs_neg
linarith [l1, l2, l3, l4, hN]

Conclusion "
## What You've Proven

Excellent work! You've proven that convergent sequences with nonzero limits are
**eventually bounded away from zero**. This is more than just a technical lemma—it's
a deep insight about the behavior of convergent sequences.

## The Reverse Triangle Inequality in Action

This proof showcased a powerful technique: using the triangle inequality \"in reverse\"
to establish lower bounds rather than upper bounds. The key manipulation was:

$$|L| = |a (n) + (L - a (n))| \\leq |a (n)| + |L - a (n)|$$

This allowed us to isolate `|a (n)|` and bound it from below.

## Looking Ahead

This result is the crucial prerequisite for proving that reciprocals preserve convergence.
When we want to show that `1/a (n) → 1/L`, we need to ensure that the denominators `a (n)`
don't get too small. This theorem guarantees exactly that: eventually, `|a (n)| ≥ |L|/2 > 0`,
so the reciprocals `1/a (n)` are well-defined and bounded.

You now have the key tool needed for the next major theorem!
"


-- Exercise: same but `|a n| ≤ 3 |L| / 2`. Check that it doesn't require `L ≠ 0`...
-- Exercise: Suppose `a → L` and `b → M` with `L < M`. Show that eventually, `a n < b n`.
