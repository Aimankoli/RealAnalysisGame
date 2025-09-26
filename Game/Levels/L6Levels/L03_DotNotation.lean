import Game.Levels.L6Levels.L02_LeftRight

World "Lecture6"
Level 4
Title "Dot Notation"

Introduction "
# Level 4: Dot Notation - Accessing Parts of Complex Information

Now that you've learned to construct \"and\" statements with `split_ands` and make strategic choices with \"or\" statements using `left` and `right`, it's time to learn how to efficiently extract information from complex hypotheses you already have.

Often in mathematics, you'll be given a hypothesis that contains multiple pieces of information bundled together. For instance, you might know that \"x = 2 AND y = 3\" but only need the fact that \"y = 3\" for your current goal. Rather than using lengthy tactics to unpack this information, Lean provides an elegant shorthand: dot notation.

Think of dot notation like accessing specific files in a well-organized filing cabinet. If you have a folder labeled `h` that contains multiple documents, you can quickly grab the second document with `h.2` instead of having to open the folder, sort through all the papers, and extract what you need manually.

This notation becomes especially powerful when dealing with complex mathematical objects. In real analysis, we often work with properties that have multiple components—a sequence might be both bounded AND monotonic, or a function might be both continuous AND differentiable. Dot notation lets us access exactly the property we need, when we need it.

## New Tools You'll Need

**Dot notation**: When you have a hypothesis `h : P ∧ Q`, you can access the first part with `h.1` (which gives you `P`) and the second part with `h.2` (which gives you `Q`).

Note that for longer conjunctions like `P ∧ Q ∧ R`, `h.1` gives `P` as expected, but
`h.2` gives `Q ∧ R`. That's because there are hidden parentheses: `P ∧ Q ∧ R = P ∧ (Q ∧ R)`. So how do you get to `Q` alone? Easy: dot notation! Writing `h.2.1` gives `Q`, and `h.2.2` gives `R`.
"

/-- Prove this
-/
Statement (x y : ℝ) (h : x = 2 ∧ y = 3) :
    y = 3 := by
apply h.2

Conclusion "
# 🔍 Information Extraction Mastered! 🔍

Perfect! You've just learned one of the most practical and time-saving techniques in Lean. Dot notation might seem like a small detail, but it's the kind of efficiency that makes complex proofs much more readable and manageable.

**Why This Matters:**
As mathematical statements become more complex, they often involve multiple conditions or properties. Being able to quickly extract the specific piece of information you need is essential for maintaining clarity in your proofs.

**The Power of Precision:**
Notice how `h.2` gave us exactly what we needed—no more, no less. This precision is crucial in mathematics, where we want to use exactly the right tool for each step of our argument.

**Looking Forward:**
As we dive deeper into analysis, you'll encounter hypotheses with multiple convergence conditions, boundedness properties, and continuity requirements all bundled together. Dot notation will be your key to navigating these rich mathematical structures efficiently.

Elegant mathematics isn't just about reaching the right conclusion—it's about getting there with style and clarity. You're building that elegance, one notation at a time.
"
