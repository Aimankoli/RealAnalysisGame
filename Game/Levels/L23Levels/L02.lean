import Game.Levels.L23Levels.L01

open Finset Set

World "Lecture23"
Level 2
Title "Integration Converges"
Introduction "
# Level 2: Integration Converges

## New definitions:

Uniform continuity:

`∀ ε > 0, ∃ δ > 0, ∀ x ∈ Icc a b, ∀ y ∈ Icc a b, |x - y| < δ → |f x - f y| < ε`

Prove `HasIntegral_of_UnifContOn` that if `f` is uniformly continuous on `[a,b]`,
then `f` is integrable on `[a,b]`.


"


def UnifContOn (f : ℝ → ℝ) (a b : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ Icc a b, ∀ y ∈ Icc a b, |x - y| < δ → |f x - f y| < ε

/-- `(f : ℝ → ℝ) (a b : ℝ) (N : ℕ) :=
  (b - a) / N * ∑ i ∈ range N, f (a + i * (b - a) / N)`


The Riemann sum of `f` from `a` to `b` with `N` subintervals.
-/
DefinitionDoc UnifContOn as "UnifContOn"

NewDefinition UnifContOn


/--
If a function `f` is uniformly continuous on `[a,b]`, then the Riemann sums of `f` converge to a limit as `N → ∞`.
-/
TheoremDoc HasIntegral_of_UnifContOn as "HasIntegral_of_UnifContOn" in "Integration"

Statement HasIntegral_of_UnifContOn (f : ℝ → ℝ) (a b : ℝ) (hab : a < b) (hf : UnifContOn f a b) :
    IntegrableOn f a b := by
apply SeqConv_of_IsCauchy
intro ε hε
choose δ hδ₁ hδ₂ using hf (ε / (2 * (b - a))) (by bound)
choose N hN using ArchProp (show 0 < δ / (b - a) by bound)
use N
intro n hn m hnm
have npos : 0 < n := by sorry
have mpos : 0 < m := by sorry
change |RiemannSum f a b m - RiemannSum f a b n| < ε
have hn_small : (b - a) / n < δ := by sorry
have hm_small : (b - a) / m < δ := by sorry
have f1 : |RiemannSum f a b m - RiemannSum f a b n| ≤
    |RiemannSum f a b m - RiemannSum f a b (m * n)| + |RiemannSum f a b n - RiemannSum f a b (n * m)| := by sorry
have hfn := RiemannSumRefinement f hab (show n ≠ 0 by sorry) (show m ≠ 0 by sorry) (show 0 < ε / (2 * (b - a)) by bound)
    (show 0 < δ by bound) hδ₂ hn_small
have hfm := RiemannSumRefinement f hab (show m ≠ 0 by sorry) (show n ≠ 0 by sorry) (show 0 < ε / (2 * (b - a)) by bound)
    (show 0 < δ by bound) hδ₂ hm_small

sorry

Conclusion "
"
