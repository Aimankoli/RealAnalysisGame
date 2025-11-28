import Game.Levels.L22Lecture

open Finset Set

World "Lecture23"
Level 1
Title "Riemann Sum Refinement"
Introduction "
# Level 1: Riemann Sum Refinement


"

/--
If a function `f` is uniformly continuous on `[a,b]`, then the Riemann sum at `n * k` differs
from that at `n` by at most `(b - a) * ε`, provided the partition is fine enough.
-/
TheoremDoc RiemannSumRefinement as "RiemannSumRefinement" in "Integration"

Statement RiemannSumRefinement (f : ℝ → ℝ) {a b : ℝ} (hab : a < b) {n k : ℕ}
    (hn : n ≠ 0) (hk : k ≠ 0)
    {ε δ : ℝ} (hε : ε > 0) (hδ : δ > 0)
    (hunif : ∀ x ∈ Set.Icc a b, ∀ y ∈ Set.Icc a b, |x - y| < δ → |f x - f y| < ε)
    (hfine : (b - a) / n < δ) :
  |RiemannSum f a b (n * k) - RiemannSum f a b n| ≤ (b - a) * ε  := by

sorry

Conclusion "
"
