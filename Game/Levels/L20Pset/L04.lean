import Game.Levels.L20Pset.L03
open Finset

World "L20Pset"
Level 4
Title "Bounded Near Limit"
Introduction "
# Level 4: Bounded Near Limit

Prove that if `f → L` as `x → c`, then there is an `M > 0` such that
`|f (x)| < M` near `c`.
"
/--
If `f → L` as `x → c`, then there is an `M > 0` such that
`|f (x)| < M` near `c`.
-/
TheoremDoc Bdd_of_LimAt as "Bdd_of_LimAt" in "Functions"

/-- Prove `Bdd_of_LimAt`
-/
Statement Bdd_of_LimAt (f : ℝ → ℝ) (c L : ℝ) (hf : FunLimAt f L c) :
  ∃ M > 0, ∃ δ > 0, ∀ x ≠ c, |x - c| < δ → |f x| < M := by
sorry

Conclusion "
"
