import Game.Levels.L6Levels.L03_DotNotation

World "Lecture6"
Level 5
Title "Cases'"

Introduction "
# Level 5: Cases' - Handling All Possibilities

You've now mastered creating \"or\" statements with `left` and `right`, but what happens when you're given an \"or\" statement as a hypothesis and need to work with it? This is where the `cases'` tactic becomes essential—it's the perfect complement to the choice-making tactics you've already learned.

When you have a hypothesis like `h : P ∨ Q`, you know that either `P` is true or `Q` is true, but you don't know which one. To proceed with your proof, you need to consider both possibilities systematically. The `cases'` tactic does exactly this: it splits your proof into two separate cases, one for each possibility.

Think of this like a lawyer preparing for trial. If you know \"either the defendant was at home OR the defendant was at work\" during the time of the incident, you need to prepare your argument for both scenarios. You can't just pick one and hope for the best—you need a strategy that works regardless of which turns out to be true.

In mathematical analysis, this pattern appears constantly. You might know that a sequence is either eventually positive or eventually negative, and need to prove something that holds in both cases. Or you might know that a function achieves its maximum either in the interior of an interval or at one of the endpoints.

## New Tools You'll Need

**`cases'`**: When you have a hypothesis `h : P ∨ Q`, you can say `cases' h with h1 h2`. This creates two separate goals:
- In the first goal, you get a new hypothesis `h1 : P`
- In the second goal, you get a new hypothesis `h2 : Q`

You must solve both goals to complete your proof. This ensures you've covered all logical possibilities.

"


/-- When have a hypothesis `h : P ∨ Q`, you can say `cases' h with h1 h2`; this will make two new Game Boards, one with an extra hypothesis `h1 : P`, and the other with the hypothesis `h2 : Q`. You'll have to solve both to solve the original Goal! -/
TacticDoc cases'

NewTactic cases'


/-- Prove this
-/
Statement (x y : ℝ) (h : x = 2 ∨ y = 3) :
    (x - 2) * (y - 3) = 0 := by
cases' h with h1 h2
rewrite [h1]
ring_nf
rewrite [h2]
ring_nf


Conclusion "
# 🔄 Case Analysis Mastered! 🔄

Excellent! You've just learned one of the most powerful proof techniques in mathematics: case analysis. The `cases'` tactic embodies a fundamental principle of logical reasoning—when you don't know which of several possibilities is true, you prove your result holds in every case.

**Why This Matters:**
Case analysis is everywhere in mathematics. From proving that every integer is either even or odd, to showing that continuous functions on closed intervals achieve their extrema, the ability to systematically consider all possibilities is crucial for rigorous reasoning.

**The Beauty of Completeness:**
Notice how `cases'` forced you to handle both scenarios completely. This isn't just a formal requirement—it ensures that your proof is truly bulletproof. No matter which case actually occurs, your argument will hold.

**Strategic Insight:**
In our example, both cases led to the same algebraic manipulation (`ring_nf`), but that won't always be true. Often, different cases require entirely different approaches. Learning to adapt your strategy to each case while keeping sight of the overall goal is a key mathematical skill.

**Looking Forward:**
As we continue with convergence proofs and other analysis topics, you'll find `cases'` invaluable for handling statements like \"either the sequence is bounded above or below\" or \"either the limit exists or the sequence diverges.\" The systematic approach you've learned here will serve you well in these more complex scenarios.

Mathematics is about leaving no stone unturned, no possibility unconsidered. With `cases'`, you now have the tools to be completely thorough in your logical investigations.
"
