import Game.Levels.L22Lecture

open Finset Set

World "Lecture23"
Level 1
Title "Riemann Sum Refinement"
Introduction "
# Level 1: Riemann Sum Refinement

Suppose that we are given `ε > 0`, `δ > 0`, and `f : ℝ → ℝ` such that for all `x, y ∈ [a,b]`, if `|x - y| < δ`, then `|f x - f y| < ε`. Show that for all natural numbers `n, k ≠ 0`, if the partition of `[a,b]` into `n` subintervals is fine enough (i.e., if `(b - a) / n < δ`), then the Riemann sum of `f` on `[a,b]` with `n * k` subintervals differs from that with `n` subintervals by at most `(b - a) * ε`.

## Useful lemma: `sum_of_prod`

`∑ i ∈ range (m * n), f i =
    ∑ j ∈ range m, ∑ k ∈ range n, f (j + k * m)`


"

lemma sum_of_prod {X : Type*} [CommSemiring X] (f : ℕ → X) (m n : ℕ) :
  ∑ i ∈ range (m * n), f i =
    ∑ j ∈ range m, ∑ k ∈ range n, f (j + k * m) := by
induction' m with m hm
simp
sorry

/--
The sum over `m * n` terms can be expressed as a double sum over `m` and `n`.
-/
TheoremDoc sum_of_prod as "sum_of_prod" in "Series"

NewTheorem sum_of_prod

/--
If a function `f` is uniformly continuous on `[a,b]`, then the Riemann sum at `n * k` differs
from that at `n` by at most `(b - a) * ε`, provided the partition is fine enough.
-/
TheoremDoc RiemannSumRefinement as "RiemannSumRefinement" in "Integration"

Statement RiemannSumRefinement (f : ℝ → ℝ) {a b : ℝ} (hab : a < b) {n k : ℕ}
    (hn : n ≠ 0) (hk : k ≠ 0)
    {ε δ : ℝ} (hε : ε > 0) (hδ : δ > 0)
    (hunif : ∀ x ∈ Icc a b, ∀ y ∈ Icc a b, |y - x| < δ → |f y - f x| < ε)
    (hfine : (b - a) / n < δ) :
  |RiemannSum f a b (n * k) - RiemannSum f a b n| ≤ (b - a) * ε  := by
change |(b - a) / ↑(n * k) * ∑ i ∈ range (n * k), f (a + (i + 1) * (b - a) / ↑(n * k)) -
      (b - a) / n * ∑ i ∈ range n, f (a + (i + 1) * (b - a) / ↑n)| ≤
  (b - a) * ε
rewrite [sum_of_prod]
rewrite [show (b - a) / ↑(n * k) * ∑ j ∈ range n, ∑ ℓ ∈ range k, f (a + (↑(j + ℓ * n) + 1) * (b - a) / ↑(n * k)) = (b - a) / n * ((∑ j ∈ range n,  (∑ ℓ ∈ range k, f (a + ((j + ℓ * n) + 1) * (b - a) / (n * k)))) / k) by
  push_cast
  field_simp]
rewrite [show (b - a) / n * ((∑ j ∈ range n,  (∑ ℓ ∈ range k, f (a + ((j + ℓ * n) + 1) * (b - a) / (n * k)))) / k) = (b - a) / n * ((∑ j ∈ range n,  (∑ ℓ ∈ range k, f (a + ((j + ℓ * n) + 1) * (b - a) / (n * k))) / k) ) by
  rewrite [sum_div]
  field_simp]
rewrite [show
  (b - a) / n *
        ∑ j ∈ range n, (∑ ℓ ∈ range k, f (a + (j + ℓ * n + 1) * (b - a) / (n * k))) / k -
      (b - a) / n * ∑ i ∈ range n, f (a + (i + 1) * (b - a) / n)
  = (b - a) / n * (
        ∑ j ∈ range n, (∑ ℓ ∈ range k, f (a + (↑j + ↑ℓ * ↑n + 1) * (b - a) / (n * k))) / k -
      ∑ i ∈ range n, f (a + (i + 1) * (b - a) / n))
  by field_simp]
-- rewrite [show (
--       ((∑ j ∈ Finset.range n, (∑ ℓ ∈ Finset.range k, f (a + (↑j + ↑ℓ * ↑n + 1) * (b - a) / (↑n * ↑k))) / ↑k) -
--         ∑ i ∈ Finset.range n, f (a + (↑i + 1) * (b - a) / ↑n)))
--   = (
--       ((∑ j ∈ Finset.range n, (∑ ℓ ∈ Finset.range k, f (a + (↑j + ↑ℓ * ↑n + 1) * (b - a) / (↑n * ↑k))) / ↑k) +
--         (∑ i ∈ Finset.range n, f (a + (↑i + 1) * (b - a) / ↑n))*(-1)) )
--   by
--     ring_nf]

sorry
#exit

rewrite [show (b - a) / ↑(n * k) * ∑ j ∈ range n, ∑ ℓ ∈ range k, f (a + (↑(j + ℓ * n) + 1) * (b - a) / ↑(n * k)) = (b - a) / n * ∑ j ∈ range n,  (1 / k * ∑ ℓ ∈ range k, f (a + ((j + ℓ * n) + 1) * (b - a) / (n * k))) by
  push_cast
  rewrite [show ∑ j ∈ range n, 1 / k * ∑ ℓ ∈ range k, f (a + (j + ℓ * n + 1) * (b - a) / (n * k)) = 1 / k * ∑ j ∈ range n,  ∑ ℓ ∈ range k, f (a + (j + ℓ * n + 1) * (b - a) / (n * k)) by
    --apply
    sorry]
  ring_nf]
rewrite [show (b - a) / n *
        ∑ j ∈ range n, 1 / k * ∑ ℓ ∈ range k, f (a + ((j + ℓ * n) + 1) * (b - a) / (n * k)) -
      (b - a) / n * ∑ i ∈ range n, f (a + (i + 1) * (b - a) / n)
      = (b - a) / n *
        ∑ j ∈ range n, (1 / k * ∑ ℓ ∈ range k, (f (a + ((j + ℓ * n) + 1) * (b - a) / (n * k)) -
       f (a + (j + 1) * (b - a) / n))) by sorry]
have h1 : ∀ j ∈ range n, |(1 / k * ∑ ℓ ∈ range k, (f (a + ((j + ℓ * n) + 1) * (b - a) / (n * k)) -
       f (a + (j + 1) * (b - a) / n)))| ≤ 1 / k * ∑ ℓ ∈ range k, |(f (a + ((j + ℓ * n) + 1) * (b - a) / (n * k)) -
       f (a + (j + 1) * (b - a) / n))| := by sorry
have h2 : ∀ j ∈ range n, ∀ ℓ ∈ range k,
      |((a + ((j + ℓ * n) + 1) * (b - a) / (n * k)) -  (a + (j + 1) * (b - a) / n))| < δ := by
  intro j hj ℓ hℓ
  push_cast
  ring_nf
  sorry
have h3 : ∀ j ∈ range n, ∀ ℓ ∈ range k,
      |f (a + ((j + ℓ * n) + 1) * (b - a) / (n * k)) -  f (a + (j + 1) * (b - a) / n)| < ε := by sorry
have h4 : ∀ j ∈ range n, ∑ ℓ ∈ range k, 1 / k * ∑ ℓ ∈ range k, |(f (a + ((j + ℓ * n) + 1) * (b - a) / (n * k)) -
       f (a + (j + 1) * (b - a) / n))| ≤ ε := by sorry
sorry

Conclusion "
"
