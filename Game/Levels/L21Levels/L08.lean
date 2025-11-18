import Game.Levels.L21Levels.L07

World "Lecture21"
Level 4
Title "Continuity Everywhere"
Introduction "
# Level 4: Continuous Functions

Just as we moved from derivatives at a point to derivative functions, we can move from continuity at a point to continuity everywhere!

## From Point Continuity to Global Continuity

So far, `FunContAt f c` tells us that `f` is continuous at the specific point `c`.

But many functions (like polynomials) are continuous at *every* point.

## The New Definition

**Definition (`FunCont`):** We say that `f` is **continuous** (everywhere) if:
```
∀ x, FunContAt f x
```

This is written `FunCont f`.

In other words: `f` is continuous at every point in its domain.

## Why Polynomials Are Continuous

Intuitively, polynomials like `f(x) = x² - 1` are continuous because:
- You can draw them without lifting your pen
- Small changes in `x` produce small changes in `f(x)`
- There are no jumps, breaks, or asymptotes

We proved in Level 2 that `x² - 1` is continuous at `x = 2`. Now we'll prove it's continuous **everywhere**!

## The Strategy

For any point `x`, we need to show `FunContAt (fun t ↦ t^2 - 1) x`.

This means: given `ε > 0`, find `δ > 0` such that `|t - x| < δ` implies `|f(t) - f(x)| < ε`.

The algebra is similar to Level 2:
```
f(t) - f(x) = (t² - 1) - (x² - 1) = t² - x² = (t - x)(t + x)
```

So `|f(t) - f(x)| = |t - x| · |t + x|`.

If we restrict `|t - x| < 1`, then `|t + x| < |2x| + 1`.

Taking `δ = min(1, ε / (|2x| + 1))` will work!

## Your Challenge

Prove that `f(x) = x² - 1` is continuous everywhere:

`FunCont (fun x ↦ x^2 - 1)`

**Hint:** After introducing `x`, the proof is very similar to Level 2, but you need to bound `|t + x|` in terms of `x` (not a constant like `5`).

Use `min 1 (ε / (|2 * x| + 1))` as your `δ`. The key is showing that when `|t - x| < 1`, we have `|t + x| < |2 * x| + 1`.

"

def FunCont (f : ℝ → ℝ) : Prop :=
  ∀ x, FunContAt f x

/-- `FunCont f` means that `f` is continuous everywhere.

The function `x² - 1` is continuous on all of ℝ.
-/
DefinitionDoc FunCont as "FunCont"

NewDefinition FunCont

Statement :
    FunCont (fun x ↦ x^2 - 1) := by
intro x
intro ε hε
use min 1 (ε / (|2 * x| + 1))
split_ands
norm_num
have f : 0 ≤ |x| := by bound
bound
intro t ht
change |t ^ 2 - 1 - (x ^ 2 - 1)| < ε
rewrite [show t ^ 2 - 1 - (x ^ 2 - 1) = (t - x) * (t + x) by ring_nf]
rewrite [show |(t - x) * (t + x)| = |t - x| * |t + x| by bound]
have ht' : |t - x| < ε / (|2 * x| + 1) := by sorry

  --   have ht1 : |t - x| < 1 := by
  --     calc |t - x| < min 1 (ε / (|2 * x| + 1)) := ht
  --       _ ≤ 1 := min_le_left 1 (ε / (|2 * x| + 1))
  --   have htx : |t + x| < |2 * x| + 1 := by
  --     have h1 : -(t - x) < 1 := by
  --       have : |t - x| = |-(t - x)| := by bound
  --       calc -(t - x) = |-(t - x)| := by bound
  --         _ = |t - x| := by bound
  --         _ < 1 := ht1
  --     have h2 : t - x < 1 := by bound
  --     have h3 : x - 1 < t := by linarith
  --     have h4 : t < x + 1 := by linarith
  --     calc |t + x| ≤ |t| + |x| := by bound
  --       _ < (|x| + 1) + |x| := by bound
  --       _ = |2 * x| + 1 := by bound
  --   have hte : |t - x| < ε / (|2 * x| + 1) := by
  --     calc |t - x| < min 1 (ε / (|2 * x| + 1)) := ht
  --       _ ≤ ε / (|2 * x| + 1) := min_le_right 1 (ε / (|2 * x| + 1))
  --   calc |t ^ 2 - 1 - (x ^ 2 - 1)| = |t ^ 2 - x ^ 2| := by ring_nf
  --     _ = |(t - x) * (t + x)| := by ring_nf
  --     _ = |t - x| * |t + x| := by bound
  --     _ < (ε / (|2 * x| + 1)) * (|2 * x| + 1) := by bound
  --     _ = ε := by field_simp

sorry

Conclusion "
"
