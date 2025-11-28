import Game.Levels.L22Pset.L03

open Finset Set

World "L22Pset"
Level 4
Title "Integral Exercise"
Introduction "
# Level 4: Integral Exercise

Show that `x ↦ x ^ 2` is integrable.

You may find this lemma useful: `sum_of_squares` For any natural number `n`,
`∑ i ∈ Finset.range n, (i + 1) ^ 2 = (n * (n + 1) * (2 * n + 1)) / 6`.

"

theorem sum_of_squares (n : ℕ) :
  ∑ i ∈ Finset.range n, (i + 1) ^ 2 = (n * (n + 1) * (2 * n + 1)) / 6 := by
sorry

/--
The sum of the squares of the first `n` natural numbers is given by the formula:
$$\\sum_{i=0}^{n-1} (i+1)^2 = \frac{n(n+1)(2n+1)}{6}.$$
-/
TheoremDoc sum_of_squares as "sum_of_squares" in "Series"

NewTheorem sum_of_squares

/-- Prove this
-/
Statement {a b : ℝ} (hab : a < b) : IntegrableOn (fun x ↦ x ^ 2) a b := by
use (b ^ 3 - a ^ 3) / 3

sorry

Conclusion "
"
