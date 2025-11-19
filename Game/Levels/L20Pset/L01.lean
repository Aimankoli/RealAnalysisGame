import Game.Levels.L20Lecture
open Finset

World "L20Pset"
Level 1
Title "DiffOfSeries"
Introduction "
# Level 1: `DiffOfSeries`

Prove `DiffOfSeries`.

## New Theorem: `sum_Ico_succ`.

"

/-- Prove `DiffOfSeries`
-/
Statement (a : ℕ → ℝ) {n m : ℕ} (hmn : n ≤ m) :
  Series a m - Series a n = ∑ k ∈ Ico n m, a k := by
sorry

Conclusion "
"
