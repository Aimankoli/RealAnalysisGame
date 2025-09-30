import Game.Levels.L7Levels.L01_Eventually

World "Lecture7"
Level 3
Title "Eventually"

Introduction "
# Level 3: Continuity of Absolute Value—Sequences of Absolute Values

The absolute value function behaves extremely well with respect to limits—if a sequence
converges, then the sequence of absolute values converges to the absolute value of the
limit. This is a manifestation of the **continuity** of the absolute value function.


## What We're Proving

**Theorem:** If `a : ℕ → ℝ` converges to `L`, and `b : ℕ → ℝ` is defined by
`b n = |a n|` for all `n`, then `b` converges to `|L|`.

In other words: taking absolute values preserves convergence.

## New Tool: `abs_Lipschitz`

A function `f : ℝ → ℝ` is called \"Lipschitz\"  (with constant `K`) if we have `|f(x) - f(y)| ≤ K · |x - y|` for all `x` and `y`. This means the function can't change too rapidly—the output values can't get farther apart than `K` times the input distance.  The theorem `abs_Lipschitz`  states that for any real numbers `x` and `y`:
$$||x| - |y|| \\leq |x - y|$$
that is, the absolute value function is Lipschitz with constant `K = 1`. This means taking absolute values is non-expansive: it never increases distances between points, and often decreases them.

(This is also sometimes called the **reverse triangle inequality for absolute values**.)

The proof of this fact will be reserved for the Exercises.

## The Strategy

This proof is remarkably clean compared to our previous results:

1. Given `ε > 0`, use convergence of `a` to get `N` such that `|a n - L| < ε` for `n ≥ N`
2. For `n ≥ N`, observe that `b n = |a n|`
3. Apply `abs_Lipschitz`: `||a n| - |L|| ≤ |a n - L| < ε`
4. Therefore `|b n - |L|| < ε`, proving `b n → |L|`

The Lipschitz property does all the heavy lifting for us!

## Why This Matters

This theorem is a special case of a much more general principle: **continuous functions
preserve limits**. The absolute value function is continuous everywhere, so it maps
convergent sequences to convergent sequences. This principle extends to all continuous
functions and is fundamental to mathematical analysis.
"


theorem abs_Lipschitz {x y : ℝ} : |(|x| - |y|)| ≤ |x - y| :=
by apply abs_abs_sub_abs_le

/-- The absolute value function is Lipschitz with constant 1. -/
TheoremDoc abs_Lipschitz as "abs_Lipschitz" in "Theorems"

NewTheorem abs_Lipschitz

/-- If `a : ℕ → ℝ` converges to `L`, and `b : ℕ → ℝ` is its absolute value, `b n = |a n|` for all `n`, then `b` converges to `|L|`. -/
TheoremDoc AbsLim as "AbsLim" in "Theorems"

/-- Prove this
-/
Statement AbsLim (a : ℕ → ℝ) (L : ℝ) (aToL : SeqLim a L) (b : ℕ →
ℝ) (bEqAbsa : ∀ n, b n = |a n|) :
    SeqLim b |L| := by
intro ε hε
specialize aToL ε hε
choose N hN using aToL
use N
intro n hn
specialize hN n hn
specialize bEqAbsa n
rewrite [bEqAbsa]
have : |(|a n|) - (|L|)| ≤ |a n - L| := by apply abs_Lipschitz
bound

Conclusion "
## What You've Proven

Great work! You've proven that the absolute value function **preserves convergence**: if
`a n → L`, then `|a n| → |L|`. This is one of the cleanest and most elegant proofs in
the course so far.

## The Power of Lipschitz Continuity

The key insight was that because absolute value is Lipschitz continuous with constant 1,
we have `||a n| - |L|| ≤ |a n - L|`. This single inequality immediately gives us the
convergence we need—no complicated epsilon manipulations, no splitting cases, just a
direct application of the Lipschitz property.

## The Bigger Picture

This theorem is your first glimpse of a profound principle in analysis: **continuous
functions preserve limits**. We've just proven this for one specific continuous function
(absolute value), but the same idea works for all continuous functions. If `f` is
continuous and `a n → L`, then `f(a n) → f(L)`. This is why calculus works the way it
does—you can \"pass limits through\" continuous functions like polynomials, exponentials,
trigonometric functions, and more.

The Lipschitz property is even stronger than continuity—it gives us quantitative control
over how fast the function can change. This makes Lipschitz functions particularly
well-behaved and useful throughout analysis, differential equations, and optimization.
"


-- Exercise : prove `abs_Lipschitz`
