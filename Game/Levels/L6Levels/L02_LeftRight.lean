import Game.Levels.L6Levels.L01_SplitAnds

World "Lecture6"
Level 3
Title "Left and Right"

Introduction "
# Level 3: Left and Right - Making Choices in Mathematics

After mastering `split_ands` to handle situations where we need to prove multiple things simultaneously, we now turn to a fundamentally different scenario: proving that at least one of several possibilities is true. This is the world of \"or\" statements (`∨`), and it requires a completely different strategic approach.

While `split_ands` was about being comprehensive—proving every part of a conjunction—proving an \"or\" statement (\"disjunction\") is about making a strategic choice. When faced with proving \"P or Q,\" you don't need to prove both `P` and `Q`. You just need to prove one of them! This might seem easier, but it requires good mathematical judgment: which path should you choose?

Think of this like a detective solving a case. To prove \"the butler did it OR the gardener did it,\" you don't need to prove both are guilty -- you just need solid evidence against *one* of them. The `left` and `right` tactics are your way of saying \"I'm going to focus my investigation on this suspect.\"

In mathematical analysis, this choice-making appears everywhere. For instance, when proving that a sequence is bounded, you might show either that it's bounded above by some constant, or bounded below by another constant, or both. Sometimes one direction is much easier to establish than the other.

## New Tools You'll Need

- `left` and `right` tactics

When your goal is to prove an \"Or\" statement, `P ∨ Q`, you can do that by proving either `P` or `Q`. If you want to prove `P`, then say `left`, and the Goal will turn into `P`.
 If you want to prove `Q`, then say `right`, and the Goal will turn into `Q`.
"

/-- When your goal is to prove an \"Or\" statement, `P ∨ Q`, you can do that by proving either `P` or `Q`. If you want to prove `P`, then say `left`, and the Goal will turn into `P`. -/
TacticDoc left

/-- When your goal is to prove an \"Or\" statement, `P ∨ Q`, you can do that by proving either `P` or `Q`. If you want to prove `Q`, then say `right`, and the Goal will turn into `Q`. -/
TacticDoc right

NewTactic left right

/-- Prove this
-/
Statement (x y : ℝ) (hx : x = 2) (hy : y = 3) :
    x = 3 ∨ y = 3 := by
right
apply hy

Conclusion "
# 🎯 Strategic Decision-Making Mastered! 🎯

Excellent! You've now learned how to navigate the fundamental logical choice points in mathematical proof. The `left` and `right` tactics represent one of the most elegant aspects of mathematical reasoning: sometimes proving less is actually more efficient.

**Why This Matters:**
\"Or\" statements are everywhere in mathematics. Existence proofs often have this flavor -- \"there exists an `x` such that `P(x)` or `Q(x)`\" -— and being able to choose the right branch can dramatically simplify your proof strategy.

**The Art of Mathematical Choice:**
Notice how in our example, we had information about both `x` and `y`, but we chose to go `right` and use the fact about `y`. This wasn't arbitrary -- it was the path that led directly to our goal. Learning to recognize these opportunities is a key skill in mathematical reasoning.

**Looking Forward:**
As we continue developing our proof techniques for analysis, you'll find that `left` and `right` combine powerfully with our convergence arguments. Often we'll need to prove statements like \"either the sequence is eventually positive, or it's eventually negative,\" and these tactics will be essential tools in our arsenal.

Mathematics is as much about knowing when to commit to a path as it is about following that path to its conclusion. You're building the judgment to make these strategic choices wisely.
"
