import Game.Levels.L24Levels.L03

open Set

World "Lecture24"
Level 4
Title "Heine-Borel Theorem: Part 2a"
Introduction "
# Level 4: Heine-Borel Theorem: Part 2a

And finally, the converse, part (a): show that a closed, bounded interval `[a, b]` is compact.

"

namespace RealAnalysisGame

/--
Any closed interval `[a, b]` (which is closed and bounded) is compact.
-/
TheoremDoc RealAnalysisGame.IsCompact_of_ClosedInterval as "IsCompact_of_ClosedInterval" in "Topology"

Statement IsCompact_of_ClosedInterval {a b : ℝ} (hab : a < b) : IsCompact (Icc a b) := by
intro ι xs rs rspos hcover
let S : Set ℝ := {t : ℝ | t ∈ Icc a b ∧ ∃ (J : Finset ι), Icc a t ⊆ ⋃ j ∈ J, Ball (xs j) (rs j)}
have hSnonempty : S.Nonempty := by
  use a
  split_ands
  · bound
  · bound
  · have ha : a ∈ Icc a b := by sorry
    specialize hcover ha
    rewrite [mem_Union] at hcover
    choose j hj using hcover
    use {j}
    intro x hx
    have hxa : x = a := by sorry
    rewrite [hxa]
    use Ball (xs j) (rs j)
    rewrite [mem_range]
    split_ands
    use j
    sorry
    apply hj.1
    apply hj.2
have hSbdd : ∀ s ∈ S, s ≤ b := by
  intro s hs
  exact hs.1.2
choose L hL using HasLUB_of_BddNonempty S hSnonempty b hSbdd
have hLb : L = b := by sorry
have hb : b ∈ S := by sorry
simp only [mem_setOf_eq, S] at hb
choose V hV using hb.2
use V, hV

end RealAnalysisGame

Conclusion "
"
