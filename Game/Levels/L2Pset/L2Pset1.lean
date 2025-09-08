import Game.Metadata

World "L2Pset"
Level 1
Title "Problem 1"

Introduction "# Problem 1

We found in Lecture 2 that Newton's Binomial Theorem gave the expansion

$
\\sqrt{1+x}\\approx
1
+\\frac{1}{2}x
-\\frac{1}{8}x^2
+\\frac{1}{16}x^3
-\\frac{5 x^4}{128}+\\cdots
$

to fourth order.
Work out the next term in the expansion. This will be a constant `c` with the property that the polynomial

$\\left(1  +\\frac{1}{2}x
-\\frac{1}{8}x^2
+\\frac{1}{16}x^3
-\\frac{5 x^4}{128} + c \\cdot x^5 \\right)^2 - (1 + x)$

only has terms $x ^ 6$ or higher. (We don't *yet* have a way of saying that in Lean, so I have to give you the expansion explicitly.)
"

/-- Find the correct constant. -/
Statement  :
   ∃ c, ∀ (x : ℝ),
   (1 + x / 2 - x ^ 2 / 8 + x ^ 3 / 16
   - 5 * x ^ 4 / 128 + c * x ^ 5) ^ 2
   - (1 + x)
    =
    x ^ 6 * (
    21 / 512 - 3 * x / 256
    + 81 * x ^ 2 / 16384 - 35 * x ^ 3 / 16384
    + 49 * x ^ 4 / 65536)
    := by
  use 7 / 256
  intro x
  ring_nf



Conclusion "Done."
