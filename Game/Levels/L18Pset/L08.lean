import Game.Levels.L18Pset.L07
open Finset

World "L18Pset"
Level 8
Title "BddSeriesEven"
Introduction "
# Level 8: `BddSeriesEven`

Prove `BddSeriesEven`:

You might find the theorem `sum_range_succ'` useful. It is like `sum_range_succ`, but
pulls out the first term instead of the last.

"

/--
`∑ k ∈ range (m + 1), f k = f 0 + ∑ k ∈ range m, f (k+1)`. This pulls out the first
term in the sum instead of `sum_range_succ`, which pulls out the last term.
-/
TheoremDoc Finset.sum_range_succ' as "sum_range_succ'" in "Theorems"

NewTheorem Finset.sum_range_succ'

DisabledTheorem BddSeriesEven

/-- Prove `BddSeriesEven`
-/
Statement {a : ℕ → ℝ} (ha : Antitone a) (apos : ∀ n, 0 ≤ a n) (n : ℕ) : ∑ k ∈ range (2 * n), (-1)^k * a k ≤ a 0 := by
sorry

Conclusion "
"
