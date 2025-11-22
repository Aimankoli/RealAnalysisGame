import Game.Levels.L21Lecture
import Game.Levels.L20PsetIntro


World "Lecture22"
Level 1
Title "Continuous Composition"
Introduction "
# Level 1: Continuous Composition

The composition of continuous functions is continuous

"

/--
The composition of continuous functions is continuous.
-/
TheoremDoc Cont_Comp as "Cont_Comp" in "Functions"

Statement Cont_Comp (f g : ℝ → ℝ) (hf : FunCont f) (hg : FunCont g) :
    FunCont (f ∘ g) := by
intro x ε hε
choose ε1 ε1pos hε1 using hf (g x) ε hε
choose δ δpos hδ using hg x ε1 ε1pos
use δ, δpos
intro t ht
specialize hδ t ht
apply hε1 (g t) hδ


Conclusion "
"
