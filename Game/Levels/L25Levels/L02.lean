import Game.Levels.L24Lecture
import Game.Levels.L24PsetIntro

open Set

World "Lecture25"
Level 2
Title "Intermediate Value Theorem"
Introduction "
# Level 2 **BIG BOSS**: Intermediate Value Theorem

And let's finish off the whole course with the \"greatest\" theorem of all! The one everyone assumed was true because
it was completely **obvious**, but which now we can finally prove rigorously using all the tools we've built up so far!

**The Intermediate Value Theorem**: If a function `f` is continuous on a closed interval `[a, b]`, and takes values `f(a) < 0` and `0 < f(b)`, then there exists some `c ∈ (a, b)` such that `f(c) = 0`. In other words, the function crosses the x-axis somewhere in the interval.

"

namespace RealAnalysisGame

/--
The Intermediate Value Theorem (IVT) states that if a function is continuous on a closed interval `[a, b]` and takes values `f(a) < 0` and `0 < f(b)`, then there exists `c ∈ (a, b)` so that `f(c)=0`.
-/
TheoremDoc RealAnalysisGame.IVT as "IVT" in "Functions"

Statement IVT {f : ℝ → ℝ} (hf : FunCont f) {a b : ℝ} (hab : a < b)
    (hfa : f a < 0) (hfb : 0 < f b): ∃ c ∈ Ioo a b, f c = 0 := by
let S := { x ∈ Icc a b | f x < 0 }
have a_in_S : a ∈ S := by
  split_ands
  · bound
  · bound
  · apply hfa
have Snonempty : S.Nonempty := by
  use a
have Sbounded : IsUB S b := by
  intro x hx
  apply hx.1.2
choose c hc using HasLUB_of_BddNonempty Snonempty Sbounded
have a_le_c : a ≤ c := by
  apply hc.1 a a_in_S
have c_le_b : c ≤ b := by
  apply hc.2
  intro s hs
  apply hs.1.2
have fc_lt : ¬ f c < 0 := by
  intro h
  specialize hf c (-f c / 2) (by bound)
  choose δ hδpos hδ using hf
  have cpd : c + δ / 2 ≤ b := by
    by_contra hb
    push_neg at hb
    have hbc : |b - c| < δ := by
      rewrite [abs_lt]
      split_ands
      linarith [c_le_b, hδpos]
      linarith [hb, hδpos]
    specialize hδ b hbc
    rewrite [abs_lt] at hδ
    linarith [hδ, h, hfb]
  specialize hδ (c + δ / 2) (by ring_nf; rewrite [abs_of_nonneg (by bound)]; linarith [hδpos])
  rewrite [abs_lt] at hδ
  have hfc1 : f (c + δ / 2) < 0 := by
    linarith [hδ]
  have hc_in_S : c + δ / 2 ∈ S := by
    split_ands
    · bound
    · bound
    · apply hfc1
  have hc_ineq := hc.1 (c + δ / 2) hc_in_S
  linarith [hc_ineq, hδpos]
have fc_gt : ¬ 0 < f c := by
  intro h
  specialize hf c (f c / 2) (by bound)
  choose δ hδpos hδ using hf
  have cpd : a ≤ c - δ / 2 := by
    by_contra ha
    push_neg at ha
    have hac : |a - c| < δ := by
      rewrite [abs_lt]
      split_ands
      bound
      bound
    specialize hδ a hac
    rewrite [abs_lt] at hδ
    linarith [hδ, hfa, h]
  have cUB : IsUB S (c - δ / 2) := by
    intro s hs
    by_contra hsc
    push_neg at hsc
    have s_le : s ≤ c := by
      apply hc.1 s hs
    have hcs : |s - c| < δ := by
      rewrite [abs_lt]
      split_ands
      bound
      bound
    specialize hδ s hcs
    have hfs : f s < 0 := by
      apply hs.2
    rewrite [abs_lt] at hδ
    linarith [hδ, hfs, h]
  linarith [hc.2 (c - δ / 2) cUB, hδpos]
have fc : f c = 0 := by bound
have hc' : c ∈ Icc a b := by
  split_ands
  bound
  bound
have hca : a ≠ c := by
  intro c_eq_a
  rewrite [← c_eq_a] at fc
  linarith [hfa, fc]
have hcb : b ≠ c := by
  intro c_eq_b
  rewrite [← c_eq_b] at fc
  linarith [fc, hfb]
have hcc : c ∈ Ioo a b := by
  split_ands
--  linarith [a_le_c, hca]
  sorry
  sorry
use c, hcc, fc

end RealAnalysisGame

Conclusion "
"
