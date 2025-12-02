import Game.Levels.L23Lecture

open Finset Set

World "L23Pset"
Level 1
Title "Lipschitz implies Uniformly Continuous"
Introduction "
# Level 1: Lipschitz implies Uniformly Continuous

A function `f : ℝ → ℝ` is called *Lipschitz* if there exists a constant `K > 0` such that for all `x, y ∈ ℝ`,

`|f(x) - f(y)| ≤ K * |x - y|`.

In this problem, you will prove that every Lipschitz function is uniformly continuous.

"

/-- Prove this
-/
Statement (f : ℝ → ℝ) (K : ℝ) (hK : K > 0) (hf : ∀ x y : ℝ, |f x - f y| ≤ K * |x - y|) (a b : ℝ) :
  UnifContOn f a b := by
sorry

Conclusion "
"
