import Game.Levels.L24Levels.L04

open Set

World "Lecture24"
Level 5
Title "Heine-Borel Theorem: Part 2b"
Introduction "
# Level 5: Heine-Borel Theorem: Part 2b

And finally, the full converse: show that any closed, bounded set is compact. We do this by showing that a closed subset of a compact set is compact. Then since a bounded set is a subset of a closed interval, and closed intervals are compact, we are done.

"

namespace RealAnalysisGame

/--
Any closed subset of a compact set is compact.
-/
TheoremDoc RealAnalysisGame.IsCompact_of_ClosedSubset as "IsCompact_of_ClosedSubset" in "Topology"

Statement IsCompact_of_ClosedSubset {S T : Set ℝ} (hST : S ⊆ T) (hT : IsCompact T) (hS : IsClosed S) : IsCompact S := by
sorry

end RealAnalysisGame

Conclusion "
"
