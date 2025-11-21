import Game.Levels.L20Lecture

World "Lecture21"
Level 1
Title "Sequential Criterion for Limits (Backward Direction)"
Introduction "
# Level 1: Sequential Criterion for Limits (Backward Direction)

Previously, we proved that function limits imply sequential limits. Now we prove the **converse**: if function values converge for *every* appropriate sequence, then the function has a limit!

## The Sequential Criterion (Backward Direction)

**Theorem:** Suppose that for *every* sequence `(xₙ)` with `xₙ → c` and `xₙ ≠ c`, we have `f(xₙ) → L`. Then `FunLimAt f L c`.

This says: if sequences **test** the limit and all tests pass, then the function limit exists!

## Why This Is Harder

The forward direction was straightforward: we had `δ` from the function limit and used it directly.

For the backward direction, you might consider a **proof by contradiction**:
- Assume `FunLimAt f L c` is false
- Then there exists ε > 0 such that for *every* δ > 0, there exists `x` with `|x - c| < δ`, `x ≠ c`, but `|f(x) - L| ≥ ε`
- We'll construct a **problematic sequence** by choosing such an `x` for each `δ = 1/n`
- This sequence converges to `c` but `f(xₙ)` does *not* converge to `L`, contradicting our hypothesis!

## The Proof Strategy

**Given:** For all sequences `xₙ → c` with `xₙ ≠ c`, we have `f(xₙ) → L`.

**Want:** To show `FunLimAt f L c`, i.e., `∀ ε > 0, ∃ δ > 0, ∀ x ≠ c, |x - c| < δ → |f(x) - L| < ε`.

**How (by contradiction):**
1. Assume not: `∃ ε > 0` such that `∀ δ > 0`, the implication fails
2. For each `n`, take `δ = 1/(n+1)` and get a counterexample `xₙ` with `|xₙ - c| < 1/(n+1)` and `|f(xₙ) - L| ≥ ε`
3. Show `xₙ → c` (since `|xₙ - c| < 1/(n+1) → 0`)
4. By hypothesis, `f(xₙ) → L`, which contradicts `|f(xₙ) - L| ≥ ε`

## Your Challenge

Prove the backward direction of the sequential criterion:

`(∀ x : ℕ → ℝ, (∀ n, x n ≠ c) → SeqLimit x c → SeqLimit (fun n ↦ f (x n)) L) → FunLimAt f L c`

**Hint:** Use `by_contra` to assume the negation. Push negations to get `∃ ε > 0, ∀ δ > 0, ∃ x, ...`. Use `choose` to extract the ε and a function that gives counterexamples. Construct a sequence using `δ = 1/(n+1)`, prove it converges to `c`, apply the hypothesis to get `f(xₙ) → L`, and derive a contradiction.

"

Statement {f : ℝ → ℝ} {L c : ℝ}
    (h : ∀ x : ℕ → ℝ, (∀ n, x n ≠ c) → SeqLim x c → SeqLim (fun n ↦ f (x n)) L) :
    FunLimAt f L c := by
sorry

Conclusion "
"

































#exit

by_contra hf
change ¬ (∀ ε > 0, ∃ δ > 0, ∀ x ≠ c, |x - c| < δ → |f x - L| < ε) at hf
push_neg at hf
choose ε hε hδ using hf
choose g hg_ne_c hg_lt_δ hg using hδ
let x : ℕ → ℝ := fun n ↦ (g (1 / (n + 1)) (by bound))
have hxc : ∀ n, x n ≠ c := by
    intro n;
    apply (hg_ne_c (1 / (n + 1)) (by bound))
have hx_lim : SeqLim x c := by
    intro δ hδ_pos
    choose N hN using ArchProp hδ_pos
    use N
    intro n hn
    have f : |x n - c| < 1 / (n + 1) := by apply hg_lt_δ (1 / (n + 1)) (by bound)
    have f2 : 1 / (n + 1) ≤ δ := by sorry
    linarith [f, f2]
choose N hN using h x hxc hx_lim ε hε
specialize hN N (by bound)
specialize hg (1 / (N + 1)) (by bound)
linarith [hN, hg]
