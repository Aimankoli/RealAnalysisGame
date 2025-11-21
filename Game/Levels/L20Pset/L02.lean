import Game.Levels.L20Pset.L01
open Finset

World "L20Pset"
Level 2
Title "ContinuousIff II"
Introduction "
# Level 2: ContinuousIff II

Prove the backwards direction: If the limit at `x=c` of `f` exists and is equal to `f c`, then `f` is continuous at `x=c`.

"

/-- Prove this
-/
Statement (f : ℝ → ℝ) (c : ℝ) (hf : FunLimAt f (f c) c) :
  FunContAt f c := by
sorry

Conclusion "
"
