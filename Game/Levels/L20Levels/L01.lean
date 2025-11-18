import Game.Levels.L19Lecture

open Finset Function

World "Lecture20"
Level 1
Title "Functions"
Introduction "
# Level 1: Functions


"

/--
  If `Series a` converges absolutely, then for any `ε > 0`, there is an `N`, so that,
  for any finite set `S` whose elements are all at least `N`, `∑ k ∈ S, |a k| < ε`.
-/
TheoremDoc StrongCauchy_of_AbsSeriesConv' as "StrongCauchy_of_AbsSeriesConv" in "Series"

Statement StrongCauchy_of_AbsSeriesConv'
    {a : ℕ → ℝ} (ha : AbsSeriesConv a) {ε : ℝ} (hε : ε > 0) :
    ∃ N, ∀ (S : Finset ℕ), (∀ k ∈ S, k ≥ N) → ∑ k ∈ S, |a k| < ε := by
sorry


Conclusion "
"
