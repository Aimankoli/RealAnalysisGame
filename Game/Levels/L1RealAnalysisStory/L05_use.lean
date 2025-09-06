import Game.Metadata

World "RealAnalysisStory"
Level 5
Title "The use tactic"

Introduction "
# Proving existence

Sometimes in mathematics, you need to prove that something exists. For example, suppose I wanted to ask you what the binomial coefficient in front of $x^2y^2$ is
in the expansion of $(x+y)^4$; how would I do it? Lean can't ask questions,
it can only prove theorems! So the way I would ask this is:
  prove that there exists a real number $c$ such that

  $(x+y)^4 = x^4 + 4x^3y + cx^2y^2 + 4xy^3 + y^4$.

  The way to prove that such a number
  exists is to exhibit it, that is, tell me which number to *use*,
  and then prove that that number indeed satisfies the equation.

This is called an *existential statement*. In Lean, as in mathematics,
existence is written using `∃` (read: \"there exists\").
This symbol is called the *existential quantifier*, and is written in Lean by typing \\exists, that is, a backslash, then the word `exists`, and then a space.
So this goal would look in Lean like so:

`∃ (c : ℝ), (x + y)^4 = x^4 + 4*x^3*y + c*x^2*y^2 + 4*x*y^3 + y^4`

To prove an existence statement, you need to provide a specific value that works. This is where the `use` tactic comes in.

If you think you know what value of `c` would work, you can write `use 42` (or with `42` replaced by whatever number you think is right). Lean will then substitute that value and ask you to prove that the resulting equation is true.

Try writing `use`, then a space, and then a number. Do you see what to do after that?
"

/-- The `use` tactic provides a specific value to prove an existence statement. -/
TacticDoc use

/-- There exists a real number that makes this binomial expansion work. -/
Statement (x y : ℝ) : ∃ (c : ℝ), (x + y)^4 = x^4 + 4*x^3*y + c*x^2*y^2 + 4*x*y^3 + y^4 := by
  Hint (hidden := true) "Write `use 42`, but with `42` replaced by the correct answer. Then how should you finish?"
  use 6
  ring_nf

NewTactic use

Conclusion "
Perfect! You've learned the `use` tactic for existence proofs.

Notice what happened:
1. `use 6` told Lean that $c = 6$ is our proposed value
2. The goal changed to proving $(x + y)^4 = x^4 + 4x^3y + 6x^2y^2 + 4xy^3 + y^4$
3. `ring_nf` verified that this algebraic identity is correct

The `use` tactic is fundamental in real analysis. You'll need it to:
- Find specific values of $\\varepsilon$ and $\\delta$ in limit proofs
- Construct witnesses for existence theorems
- Provide counterexamples

Your growing toolkit:
- `apply`, `rfl`, `rewrite` for basic equality reasoning
- `ring_nf` for algebraic manipulation
- `use` for existence proofs
"
