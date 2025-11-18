import Game.Levels.L21Levels.L05

World "Lecture21"
Level 2
Title "Computing a Derivative"
Introduction "
# Level 2: The Derivative at a Point

We've studied limits of functions extensively. Now we apply this knowledge to one of the most important concepts in calculus: the **derivative**!

## The Definition

**Definition (`FunDerivAt`):** We say that `f` has derivative `L` at `c` if:

`FunLimAt (fun h ↦ (f (c + h) - f c) / h) L 0`

This is written `FunDerivAt f L c`.

**Reading the definition:** The derivative is the limit of the **difference quotient** as `h → 0`:

`f'(c) = lim[h→0] (f(c + h) - f(c)) / h`

## The Geometric Interpretation

The difference quotient `(f(c + h) - f(c)) / h` is the **slope of the secant line** through the points `(c, f(c))` and `(c + h, f(c + h))`.

As `h → 0`, these secant lines approach the **tangent line** at `x = c`, and the derivative is the slope of this tangent line!

## Computing a Derivative

Let's compute the derivative of `f(x) = x² - 1` at `x = 2`.

We need to find the limit:

`lim[h→0] (f(2 + h) - f(2)) / h`

`     = lim[h→0] ((2 + h)² - 1 - 3) / h`

`     = lim[h→0] (4 + 4h + h² - 4) / h`

`     = lim[h→0] (4h + h²) / h`

`     = lim[h→0] (h(4 + h)) / h`

`     = lim[h→0] (4 + h)`

`     = 4`

So the derivative is `4`!

## Your Challenge

Prove that the function `f(x) = x² - 1` has derivative `4` at `x = 2`:

`FunDerivAt (fun x ↦ x^2 - 1) 4 2`

**Hint:** You need to prove `FunLimAt (fun h ↦ ((2 + h)^2 - 1 - 3) / h) 4 0`.

Given `ε > 0`, you need to find `δ > 0` such that for `h ≠ 0` with `|h| < δ`, we have:
```
|((2 + h)² - 1 - 3) / h - 4| < ε
```

Simplify the difference quotient algebraically:
- `(2 + h)² - 1 - 3 = 4 + 4h + h² - 4 = 4h + h²`
- So `((2 + h)² - 1 - 3) / h = (4h + h²) / h = 4 + h` (for `h ≠ 0`)
- Thus `|((2 + h)² - 1 - 3) / h - 4| = |4 + h - 4| = |h|`

Therefore, taking `δ = ε` works perfectly!

"

def FunDerivAt (f : ℝ → ℝ) (L : ℝ) (c : ℝ) : Prop :=
  FunLimAt (fun h ↦ (f (c + h) - f c) / h) L 0

/-- `FunLimAt (fun h ↦ (f (c + h) - f c) / h) L 0`

The derivative of x² - 1 at x = 2 is 4.
-/
DefinitionDoc FunDerivAt as "FunDerivAt"

NewDefinition FunDerivAt

Statement :
    FunDerivAt (fun x ↦ x^2 - 1) 4 2 := by
sorry

Conclusion "
"































#exit

intro ε hε
use ε, hε
intro h hh0 hh
change |((((2 + h) ^ 2 - 1) - (2 ^ 2 - 1)) / h) - 4| < ε
rewrite [show (2 + h) ^ 2 - 1 - (2 ^ 2 - 1) = 4 * h + h ^ 2 by ring_nf]
rewrite [show (4 * h + h ^ 2) / h = 4 + h by field_simp]
rewrite [show 4 + h - 4 = h - 0 by ring_nf]
apply hh
