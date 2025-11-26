import Game.Levels.L22Levels.L01

open Finset

World "Lecture22"
Level 2
Title "Integration"
Introduction "
# Level 2: Integration!

Prove that $\\int_0^1 x^2 \\, dx = 1 / 3$, a fact known to Archimedes!

"

Statement :
    HasIntegral (fun x ↦ x^2) 0 1 (1 / 3) := by
intro ε hε
choose N hN using ArchProp hε
use N
have f1 : ∀ n > 0, ∑ i ∈ range n, (((0 : ℝ) + (i + 1) * (1 - 0) / n) ^ (2 : ℝ)) = n * (n + 1) * (2 * n + 1) / (6 * n ^ 2) := by
    intro n hn
    induction' n with n hn'
    norm_num
    rewrite [sum_range_succ]
    sorry
intro n hn
unfold RiemannSum
--simp only [sub_zero, one_div, mul_one, zero_add]
-- change |(1 - 0) / n * ∑ i ∈ range n, (((0 : ℝ) + (i + 1) * (1 - 0) / n) ^ (2 : ℝ)) - 1 / 3| < ε
have npos : 0 < n := by sorry
rewrite [f1 n npos]
rewrite [show ((1 : ℝ) - 0) / n * ((n - 1) / 2) - 1 / 2 = -(1 / (2 * n)) by field_simp; ring_nf]
rewrite [abs_neg]
have f2 : (0 : ℝ) ≤ 1 / (2 * n) := by bound
rewrite [show  |(1 : ℝ) / (2 * n)| = 1 / (2 * n) by apply abs_of_nonneg f2]
-- grind
sorry

Conclusion "
"
