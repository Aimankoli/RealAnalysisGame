import Game.Levels.L22Pset.L02

open Finset Set

World "L22Pset"
Level 3
Title "Differentiability Exercise"
Introduction "
# Level 3: Differentiability Exercise

Show that `x ↦ x ^ 3` is differentiable.

"

/-- Prove this
-/
Statement : ∃ g : ℝ → ℝ,
  FunDeriv (fun x ↦ x ^ 3) g := by
use (fun x ↦ 3 * x ^ 2)
intro x ε hε

sorry

Conclusion "
"
