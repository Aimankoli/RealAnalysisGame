import Game.Levels.L22Levels.L02
import Mathlib.Tactic.Rify

open Finset

attribute [grind] inv_lt_of_inv_lt₀
attribute [grind] one_mul
attribute [grind] Mathlib.Tactic.Zify.natCast_le._simp_1
attribute [grind] Mathlib.Tactic.Qify.intCast_le._simp_1
attribute [grind] Mathlib.Tactic.Rify.ratCast_le._simp_1
attribute [grind] Int.cast_natCast
attribute [grind] Rat.cast_natCast

World "Lecture22"
Level 3
Title "Integration"
Introduction "
# Level 3: Integration!

## New definitions:

Riemann sum with *right* endpoints:

`RiemannSum (f : ℝ → ℝ) (a b : ℝ) (N : ℕ) : ℝ := `

`(b - a) / N * ∑ i in range N, f (a + (i + 1) * (b - a) / N)`

And

`HasIntegral (f : ℝ → ℝ) (a b : ℝ) (I : ℝ) : Prop :=
  SeqLim (fun N ↦ RiemannSum f a b N) I`

Prove that $\\int_0^1 x \\, dx = 1 / 2$ using Riemann sums!

"

noncomputable def RiemannSum (f : ℝ → ℝ) (a b : ℝ) (N : ℕ) : ℝ :=
  (b - a) / N * ∑ i ∈ range N, f (a + (i + 1) * (b - a) / N)

/-- `(f : ℝ → ℝ) (a b : ℝ) (N : ℕ) :=
  (b - a) / N * ∑ i ∈ range N, f (a + i * (b - a) / N)`


The Riemann sum of `f` from `a` to `b` with `N` subintervals.
-/
DefinitionDoc RiemannSum as "RiemannSum"

def HasIntegral (f : ℝ → ℝ) (a b : ℝ) (I : ℝ) : Prop :=
  SeqLim (fun N ↦ RiemannSum f a b N) I

/-- `(f : ℝ → ℝ) (a b : ℝ) (I : ℝ) :=
  SeqLim (fun N ↦ RiemannSum f a b N) I`

A function `f : ℝ → ℝ` has integral `I` from `a` to `b` if the sequence of Riemann sums converges to `I`.
-/
DefinitionDoc HasIntegral as "HasIntegral"

NewDefinition RiemannSum HasIntegral

Statement :
    HasIntegral (fun x ↦ x) 0 1 (1 / 2) := by
intro ε hε
choose N hN using ArchProp hε
use N
have f1 : ∀ n > 0, ∑ i ∈ range n, ((0 : ℝ) + (i + 1) * (1 - 0) / n) = (n + 1) / 2 := by
    intro n hn
    induction' n with n hn'
    norm_num
    contradiction
    rewrite [sum_range_succ]
    sorry
intro n hn
change |((1) - 0) / n * ∑ i ∈ range n, ((0 : ℝ) + (i + 1) * (1 - 0) / n) - 1 / 2| < ε
have npos : 0 < n := by sorry
rewrite [f1 n npos]
rewrite [show ((1 : ℝ) - 0) / n * ((n + 1) / 2) - 1 / 2 = (1 / (2 * n)) by field_simp; ring_nf]
have f2 : (0 : ℝ) ≤ 1 / (2 * n) := by bound
rewrite [show  |(1 : ℝ) / (2 * n)| = 1 / (2 * n) by apply abs_of_nonneg f2]
-- grind
sorry

Conclusion "
"
