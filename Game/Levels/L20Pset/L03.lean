import Game.Levels.L20Pset.L02
open Finset

World "L20Pset"
Level 3
Title "Const Times Limit"
Introduction "
# Level 3: Const Times Limit

Prove that if `f → L` as `x → c`, then `k · f → k · L`.
"
/--
If `f → L` as `x → c`, then `k · f → k · L`.
-/
TheoremDoc ConstTimesLimAt as "ConstTimesLimAt" in "Functions"

/-- Prove `ConstTimesLimAt`
-/
Statement ConstTimesLimAt (f : ℝ → ℝ) (c L k : ℝ) (hf : FunLimAt f L c) :
  FunLimAt (fun x ↦ k * f x) (k * L) c := by
sorry

Conclusion "
"
