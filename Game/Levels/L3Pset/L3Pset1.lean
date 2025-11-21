import Game.Levels.L3Lecture
import Game.Levels.L2PsetIntro

World "L3Pset"
Level 1
Title "Problem 1"

Introduction "# Problem 1

The \"full\" Archimedean Property is this:
Take two positive real numbers `x` and `y`. No matter
how large `y` may be, and how small `x` may be,
if we add `x` to itself enough times (that is, multiply it by some natural number), we can always get that to exceed `y`.
"

/-- Prove the full Archimedean Property. -/
Statement (x y : ℝ) (x_pos : 0 < x) (y_pos : 0 < y) : ∃ (N : ℕ), y < x * N  := by
  use ⌈y / x⌉₊ + 1
  have : y / x ≤ ⌈y / x⌉₊ := by bound
  field_simp at this
  push_cast
  linarith [this, x_pos]

Conclusion "Done."
