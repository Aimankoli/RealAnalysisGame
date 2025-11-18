import Game.Levels.L20Levels.L03

World "Lecture20"
Level 4
Title "Sequential Criterion for Limits (Forward Direction)"
Introduction "
# Level 4: Sequential Criterion for Limits

We now have two notions of limits in our arsenal:
1. **Function limits:** `FunLimAt f L c` means `f(x) → L` as `x → c`
2. **Sequence limits:** `SeqLim x L` means `xₙ → L` as `n → ∞`

Could these concepts be connected? It's **mathematics**, how could they not!

In this level, we'll prove the first half of the **Sequential Criterion for Limits**.

## The Sequential Criterion (Forward Direction)

**Theorem:** If `f` has limit `L` at `c`, then for *every* sequence `(xₙ)` with `xₙ → c` and `xₙ ≠ c`, we have `f(xₙ) → L`.

In other words: function limits can be **tested** using sequences!

## Why This Matters

This theorem is incredibly useful because:
- It connects two different limit concepts
- It lets us use sequence intuition to understand function limits
- It may be easier to work with certain sequences than with the `ε-δ` definition

## The Proof Strategy

**Given:** `FunLimAt f L c` and a sequence `(xₙ)` with `xₙ → c` and `xₙ ≠ c`.

**Want:** To show `f(xₙ) → L`, i.e., for all ε > 0, eventually `|f(xₙ) - L| < ε`.

**How:**
1. Given ε > 0, use `FunLimAt` to get δ > 0 such that `|x - c| < δ` and `x ≠ c` implies `|f(x) - L| < ε`
2. Use `SeqLimit` to get N such that for all n ≥ N, we have `|xₙ - c| < δ`
3. For n ≥ N, we know `xₙ ≠ c` and `|xₙ - c| < δ`, so `|f(xₙ) - L| < ε`

## Your Challenge

Prove the forward direction of the sequential criterion:

`FunLimAt f L c → (∀ x : ℕ → ℝ, (∀ n, x n ≠ c) → SeqLimit x c → SeqLimit (fun n ↦ f (x n)) L)`

**Hint:** After introducing all the hypotheses, introduce `ε` and `hε`. Use `hf` with `ε` to get `δ` and its properties. Then use `hx` with `δ` to get `N`. Use this `N` to show that the sequence `f(xₙ)` converges to `L`.

"

Statement {f : ℝ → ℝ} {L c : ℝ}
    (hf : FunLimAt f L c) :
    ∀ x : ℕ → ℝ, (∀ n, x n ≠ c) → SeqLim x c → SeqLim (fun n ↦ f (x n)) L := by
sorry

Conclusion "
"


































#exit

intro x hxc hx
intro ε hε
choose δ hδ hfδ using hf ε hε
choose N hN using hx δ hδ
use N
intro n hn
specialize hN n hn
specialize hxc n
apply hfδ (x n) hxc hN
