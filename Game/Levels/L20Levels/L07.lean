import Game.Levels.L20Levels.L06

World "Lecture20"
Level 7
Title "The Derivative Function"
Introduction "
# Level 7: Derivatives Everywhere

In the previous level, we computed the derivative of `f(x) = x² - 1` at a single point `x = 2`. Now we'll prove something much more powerful: we'll find the derivative at **every** point!

## From Point Derivatives to Derivative Functions

So far, `FunDerivAt f L c` tells us that `f` has derivative `L` at the specific point `c`.

But for most functions, we can compute derivatives at *every* point, giving us a **derivative function**.

## The New Definition

**Definition (`FunDeriv`):** We say that `g` is the derivative of `f` (everywhere) if:
```
∀ x, FunDerivAt f (g x) x
```

This is written `FunDeriv f g`.

In other words: for each point `x`, the derivative of `f` at `x` equals `g(x)`.

## The Power Rule

For `f(x) = x² - 1`, we'll prove that `f'(x) = 2x` for all `x`.

This is an instance of the **power rule**: `d/dx[xⁿ] = n·xⁿ⁻¹`.

## Computing the General Derivative

For arbitrary `x`, we need:
```
lim[h→0] (f(x + h) - f(x)) / h
     = lim[h→0] ((x + h)² - 1 - (x² - 1)) / h
     = lim[h→0] (x² + 2xh + h² - x²) / h
     = lim[h→0] (2xh + h²) / h
     = lim[h→0] h(2x + h) / h
     = lim[h→0] (2x + h)
     = 2x
```

## Your Challenge

Prove that the derivative of `f(x) = x² - 1` is `g(x) = 2x` everywhere:

`FunDeriv (fun x ↦ x^2 - 1) (fun x ↦ 2 * x)`

**Hint:** You need to prove `∀ x, FunDerivAt (fun x ↦ x^2 - 1) (2 * x) x`.

After introducing `x`, the proof is very similar to Level 6, but with `x` instead of `2`.

Given `ε > 0`, use `δ = ε`. For `h ≠ 0` with `|h| < ε`, simplify:
- `(x + h)² - 1 - (x² - 1) = 2xh + h²`
- `(2xh + h²) / h = 2x + h` (for `h ≠ 0`)
- `|(2x + h) - 2x| = |h| < ε`

"

def FunDeriv (f : ℝ → ℝ) (g : ℝ → ℝ) : Prop :=
  ∀ x, FunDerivAt f (g x) x

/-- `∀ x, FunDerivAt f (g x) x`.

The derivative of `x² - 1` is `2x` everywhere.
-/
DefinitionDoc FunDeriv as "FunDeriv"

NewDefinition FunDeriv

Statement (f g : ℝ → ℝ) (hf : ∀ x, f x = x ^ 2 - 1) (hg : ∀ x, g x = 2 * x) :
    FunDeriv f g := by
sorry

Conclusion "
"








































#exit
intro x
intro ε hε
use ε, hε
intro h hh0 hh
change |((f (x + h) - f (x)) / h) - g x| < ε
rewrite [hf, hf, hg]
rewrite [show (x + h) ^ 2 - 1 - (x ^ 2 - 1) = 2 * x * h + h ^ 2 by ring_nf]
rewrite [show (2 * x * h + h ^ 2) / h = 2 * x + h by field_simp]
rewrite [show 2 * x + h - 2 * x = h - 0 by ring_nf]
apply hh
