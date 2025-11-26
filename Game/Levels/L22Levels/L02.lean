import Game.Levels.L22Levels.L01

open Set

World "Lecture22"
Level 2
Title "Uniform Convergence"
Introduction "
# Level 2: Uniform Convergence

Prove that the uniform limit of continuous functions is continuous.

## New Definition: `UnifConv`

Let `fₙ` be a sequence of functions, that is `f : ℕ → ℝ → ℝ`, and let `F` be
the hypothetical limit function. We say `UnifConv f F` if `fₙ` converges to `F` uniformly:

`UnifConv (f : ℕ → ℝ → ℝ) (F : ℝ → ℝ) : Prop := `

`∀ ε > 0, ∃ N, ∀ n ≥ N, ∀ x, |f n x - F x| < ε`
"

def UnifConv (f : ℕ → ℝ → ℝ) (F : ℝ → ℝ) : Prop := ∀ ε > 0, ∃ N, ∀ n ≥ N, ∀ x,
    |f n x - F x| < ε

/-- `(f : ℕ → ℝ → ℝ) (F : ℝ → ℝ) :=
∀ ε > 0, ∃ N, ∀ n ≥ N, ∀ x, |f n x - F x| < ε`

The sequence `f : ℕ → ℝ → ℝ` of functions converges uniformly to `F : ℝ → ℝ`.
-/
DefinitionDoc UnifConv as "UnifConv"

NewDefinition UnifConv

/--
If a sequence of functions `fₙ` converges uniformly to `F`, and each `fₙ` is continuous, then `F` is continuous.
-/
TheoremDoc Cont_of_UnifConv as "Cont_of_UnifConv" in "Functions"

Statement Cont_of_UnifConv  (f : ℕ → ℝ → ℝ) (hf : ∀ n, FunCont (f n))
    (F : ℝ → ℝ) (hfF : UnifConv f F) : FunCont F:= by
intro x ε hε
choose N hN using hfF (ε / 3) (by bound)
choose δ hδ₁ hδ₂ using hf N x (ε / 3) (by bound)
use δ, hδ₁
intro y hy
have h1 : |F y - F x| ≤ |f N y - F y| + |f N y - f N x| + |f N x - F x| := by
    sorry
have h2 : |f N y - F y| < ε / 3 := by apply hN N (by bound) y
have h3 : |f N x - F x| < ε / 3 := by apply hN N (by bound) x
have h4 : |f N y - f N x| < ε / 3 := by apply hδ₂ y hy
linarith [h1, h2, h3, h4]

Conclusion "
"
