import Game.Levels.L20Lecture
import Game.Levels.L18PsetIntro

open Finset

World "L20Pset"
Level 1
Title "ContinuousIff I"
Introduction "
# Level 1: ContinuousIff I

Prove the forward direction: If a function is continuous at `x=c`,
then its limit at `x=c` exists and is equal to `f c`.

"

/-- Prove this
-/
Statement (f : ℝ → ℝ) (c : ℝ) (hf : FunContAt f c) :
  FunLimAt f (f c) c := by

sorry

Conclusion "
"
