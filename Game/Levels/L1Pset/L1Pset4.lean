import GameServer
import Mathlib.Data.Real.Basic
import Mathlib.Tactic.Ring

World "L1Pset"
Level 4
Title "Problem 4"

Introduction "
# Problem 4

This problem looks very similar to the previous one, but without a few hints, it
may cause great difficulty. The issue is that, last time, you likely called `specialize h1 0`, and turned `h1` into:

`h1 : g (0 + 1) = g (0) + 3`

If you do that now, the original `h1` will be *gone*, and you won't have a way of accessing *again* it to bootstrap from `g (1)` to `g (2)`. So what should you do?

Observe that `have` can perform the same
role as `specialize` (and much more)! Try starting your solution with:

`have h3 : g (0 + 1) = g (0) + 3 := by exact h1 0`

This will not affect the original statement
of `h1`, but will instead add a *new* hypothesis, `h3`, which amounts to the
desired fact that `g (0 + 1) = g (0) + 3`.
Notice what's happening in the proof: `h1` says: for all `x`, `g (x + 1) = g (x) + 3`.
So `h1` is really a *function* whose input
is a real number `x`, and whose output is a
*proof* of the fact that, for this value of `x`, `g (x + 1) = g (x) + 3` holds. So when
we feed `0` into `h1`, it has the same effect
as it did when we `specialize`d, thus giving a proof of
 `exact`ly what was claimed in the `have` statement.

Now you should be able to solve this problem.
"

/-- Solve the problem -/
Statement (g : ℝ → ℝ) (h1 : ∀ x, g (x + 1) = g (x) + 3)
 (h2 : g (0) = 5)
 :
  g (2) = 11 := by
  have h3 : g (0 + 1) = g (0) + 3 := by exact h1 0
  rewrite [h2] at h3
  ring_nf at h3
  specialize h1 1
  rewrite [h3] at h1
  ring_nf at h1
  exact h1

Conclusion "Done."
