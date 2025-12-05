import Game.Levels.L23Lecture

open Set

World "Lecture24"
Level 1
Title "Heine-Borel Theorem: Part 1a"
Introduction "
# Level 1: Heine-Borel Theorem: Part 1a

Show that if `S : Set ℝ` is compact, then it is bounded.

# New lemma: `FinMax` :

`lemma FinMax (ι : Type) (V : Finset ι) (δs : ι → ℝ) :
    ∃ δ, ∀ i ∈ V, δs i ≤ δ`

"

namespace RealAnalysisGame

lemma FinMax (ι : Type) (V : Finset ι) (δs : ι → ℝ) :
    ∃ δ, ∀ i ∈ V, δs i ≤ δ := by
  by_cases h_nonempty : V.Nonempty
  let δ := Finset.sup' V h_nonempty δs
  use δ
  intro i hi
  exact Finset.le_sup' δs hi
  use 1
  intro i hi
  exfalso
  simp only [Finset.not_nonempty_iff_eq_empty] at h_nonempty
  rewrite [h_nonempty] at hi
  contradiction

/--
A finite list has a maximum element.
-/
TheoremDoc RealAnalysisGame.FinMax as "FinMax" in "Theorems"

NewTheorem RealAnalysisGame.FinMax

/--
A compact set is bounded.
-/
TheoremDoc RealAnalysisGame.Bdd_of_Compact as "Bdd_of_Compact" in "Topology"

Statement Bdd_of_Compact (S : Set ℝ) (hcomp : IsCompact S) : ∃ M, ∀ s ∈ S, |s| < M := by
let ι := ℕ
let xs : ι → ℝ := fun n ↦ 0
let δs : ι → ℝ := fun n ↦ n + 1
have δspos : ∀ n, 0 < δs n := by
  intro n
  change 0 < (n : ℝ) + 1
  linarith
have hcover : S ⊆ ⋃ i, Ball (xs i) (δs i) := by
  intro s hs
  rewrite [mem_Union]
  use ⌈|s|⌉₊
  change s ∈ Ioo ((0 : ℝ) - ((⌈|s|⌉₊ + 1))) (0 + ((⌈|s|⌉₊ + 1)))
  rewrite [mem_Ioo]
  rewrite [show (0 : ℝ) - (⌈|s|⌉₊ + 1) = - (⌈|s|⌉₊ + 1) by ring_nf]
  rewrite [show (0 : ℝ) + (⌈|s|⌉₊ + 1) = (⌈|s|⌉₊ + 1) by ring_nf]
  rewrite [← abs_lt]
  have f : ∀ x ≥ (0 : ℝ), x ≤ ⌈x⌉₊ := by
    intro x hx
    bound
  specialize f (|s|) (by bound)
  linarith [f]
choose V hV using hcomp ι xs δs δspos hcover
choose M hM using FinMax ι V δs
use M
intro s hs
specialize hV hs
rewrite [mem_Union] at hV
choose i ball_i i_in_V s_in_Ball using hV
rewrite [mem_range] at i_in_V
choose hi hi' using i_in_V
specialize hM i hi
rewrite [← hi'] at s_in_Ball
change s ∈ Ioo ((0 : ℝ) - (i + 1)) (0 + (i + 1)) at s_in_Ball
rewrite [show (0 : ℝ) - (i + 1) = - (i + 1) by ring_nf] at s_in_Ball
rewrite [show (0 : ℝ) + (i + 1) = (i + 1) by ring_nf] at s_in_Ball
rewrite [mem_Ioo] at s_in_Ball
rewrite [← abs_lt] at s_in_Ball
change i + 1 ≤ M at hM
linarith [s_in_Ball, hM]

end RealAnalysisGame

Conclusion "
"
