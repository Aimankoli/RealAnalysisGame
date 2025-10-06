import Game.Levels.L7Levels.L03_SeqInvLim

World "Lecture7"
Level 5
Title "ByCases"

Introduction "
# Level 5: Case Analysis Without Existing Hypotheses

## The Need for `by_cases`

You've already learned how to use `cases'` to handle disjunctions when you have a hypothesis
`h : P ∨ Q`. This allows you to split your proof into two branches: one where you assume `P`
is true, and another where you assume `Q` is true.

But what if you need to perform case analysis on a statement that isn't already among your
hypotheses? Sometimes you need to consider whether a certain proposition is true or false,
even when you haven't been explicitly told which case holds.

This is where the **law of excluded middle** comes in: for any proposition `P`, either `P` is
true or `¬P` is true. The `by_cases` tactic allows you to exploit this fundamental logical
principle directly in your proofs.

Just so you know: the law of excluded middle is somewhat controversial in certain mathematical
circles. \"Constructivist\" mathematicians argue that to prove `P ∨ ¬P`, you should need to either
construct a proof of `P` or construct a proof of `¬P`, not merely assert that one of these must be true.
However, among mainstream mathematicians (and in classical logic, which Lean allows),
the law of excluded middle is accepted without question. For our purposes in real analysis,
we'll use it freely, as it's an incredibly powerful and natural tool for organizing proofs.

## How by_cases Works

The `by_cases` tactic has the syntax:

`by_cases h : fact`

where `h` is the name you choose for the new hypothesis, and `fact` is the proposition you
want to analyze. This creates two subgoals:
- **First subgoal:** Assume `fact` is true, giving you hypothesis `h : fact`
- **Second subgoal:** Assume `fact` is false, giving you hypothesis `h : ¬fact`

You must prove your goal in both cases.

## When to Use by_cases

Use `by_cases` when:
- You need to consider whether some condition holds, but it's not already a hypothesis
- Different proof strategies apply depending on whether a statement is true or false
- You need to handle edge cases (like checking if a number equals zero)
- You want to prove a theorem with weaker assumptions by splitting into cases

## A Motivating Example

In this level, we'll prove a generalization of `EventuallyGeHalfLimPos`. The previous version
required the assumption `L ≠ 0`. But what if we want to prove the result without that
assumption? We can use `by_cases` to split into two cases:
- If `L = 0`, the result is trivially true (since `|L|/2 = 0`)
- If `L ≠ 0`, we can apply our previous theorem

This demonstrates how `by_cases` allows us to handle all possibilities systematically, making
our theorems more general and our proofs more robust.

## New Tools You'll Need

### `by_cases`
The `by_cases` tactic allows you to split a proof into two cases based on whether a
proposition is true or false.

**Syntax:** `by_cases h : P`
- Creates two subgoals
- First subgoal has hypothesis `h : P`
- Second subgoal has hypothesis `h : ¬P`
"

/-- The `by_cases` tactic has syntax `by_cases h : fact`, where `h` is your name for a new hypothesis,
and `fact` is the fact claimed in the hypothesis. Calling `by_cases` creates two subgoals, one with
the additional hypothesis `h : fact`, and the second has the hypothesis `h : ¬ fact`. -/
TacticDoc by_cases

NewTactic by_cases

/-- If `a : ℕ → ℝ` converges to `L` (with *no* assumption that `L ≠ 0`), then there is an `N` so that
for all `n ≥ N`, `|a (n)| ≥ |L| / 2`. -/
TheoremDoc EventuallyGeHalfLim as "EventuallyGeHalfLim" in "Theorems"


/-- Prove `EventuallyGeHalfLimPos`, but without the assumption that `L ≠ 0`.
-/
Statement EventuallyGeHalfLim (a : ℕ → ℝ) (L : ℝ) (aToL : SeqLim a L) :
    ∃ N, ∀ n ≥ N, |L| / 2 ≤ |a (n)| := by
by_cases h : L = 0
use 1
intro n hn
rewrite [h]
bound
apply EventuallyGeHalfLimPos a L aToL h

Conclusion "
## Case Analysis Mastered!

You've now learned how to perform case analysis even when you don't have an existing hypothesis
to split on. The `by_cases` tactic is a powerful addition to your proof toolkit.

## What You Accomplished

In this level, you proved `EventuallyGeHalfLim` without assuming `L ≠ 0`, making it strictly
more general than `EventuallyGeHalfLimPos`. The proof was elegant:
- When `L = 0`, the inequality becomes trivial since both sides equal zero
- When `L ≠ 0`, you could invoke your earlier theorem

This pattern -- handling edge cases separately, then applying more powerful results in the main
case -- is ubiquitous throughout mathematics.

## The Power of Case Analysis

The `by_cases` tactic allows you to:
- **Prove more general theorems** by removing unnecessary assumptions and handling special cases
- **Organize complex proofs** by separating different scenarios that require different strategies
- **Handle edge cases systematically** rather than hoping they don't arise
- **Make logical structure explicit** by formally splitting on conditions that matter

## When to Reach for `by_cases`

You'll find `by_cases` particularly useful when:
- Your proof strategy differs significantly based on whether some condition holds
- You need to handle a potential edge case (like zero denominators, empty sets, etc.)
- You want to generalize a theorem by removing a hypothesis and treating it as a case
- The problem naturally divides into distinct scenarios

## Looking Ahead

Combined with `cases'` for existing hypotheses and `split_ands` for conjunctions, you now
have a complete toolkit for working with logical connectives in Lean. These techniques will
serve you throughout your journey in formal mathematics, from basic analysis to abstract
algebra and beyond.

The ability to systematically handle all cases is what makes mathematical proofs rigorous and
complete. You're well on your way to mastering the art of formal proof!
"
