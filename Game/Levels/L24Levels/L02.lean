import Game.Levels.L24Levels.L01

open Set

World "Lecture24"
Level 2
Title "Heine-Borel Theorem: Part 1b"
Introduction "
# Level 2: Heine-Borel Theorem: Part 1b

Show that if `S : Set ℝ` is compact, then it is closed.

# New definitions:

- `IsClosed S := IsOpen Sᶜ`.

- `IsOpen S := ∀ x ∈ S, ∃ δ > 0, Ball x δ ⊆ S`.

"

namespace RealAnalysisGame

def IsOpen (S : Set ℝ) : Prop := ∀ x ∈ S, ∃ r > 0, Ball x r ⊆ S

/-- `(S : Set ℝ) : Prop := ∀ x ∈ S, ∃ r > 0, Ball x r ⊆ S`

A set is open if for every point `x` in the set, there exists a radius `r > 0` such that the ball of radius `r` centered at `x` is entirely contained within the set.
-/
DefinitionDoc IsOpen as "IsOpen"

def IsClosed (S : Set ℝ) : Prop := IsOpen Sᶜ

/-- `(S : Set ℝ) : Prop := IsOpen Sᶜ`

A set is closed if its complement is open.
-/
DefinitionDoc IsClosed as "IsClosed"

NewDefinition IsClosed IsOpen

/--
A compact set is closed.
-/
TheoremDoc RealAnalysisGame.IsClosed_of_Compact as "IsClosed_of_Compact" in "Topology"

Statement IsClosed_of_Compact (S : Set ℝ) (hcomp : IsCompact S) : IsClosed S := by
by_cases Snonempty : S.Nonempty
change IsOpen Sᶜ
intro y hy
change y ∉ S at hy
let ι : Type := S
let xs : ι → ℝ := fun x => x.1
let δs : ι → ℝ := fun x => |y - x.1| / 2
have δspos : ∀ i : ι, δs i > 0 := by
  intro i
  let x : ℝ := i.1
  have hx : x ∈ S := i.2
  have hneq : y ≠ x := by
    intro h
    rw [h] at hy
    contradiction
  have hneq' : y - x ≠ 0 := by bound
  have hdist : |y - x| > 0 := by apply abs_pos_of_nonzero hneq'
  bound
have hcover : S ⊆ ⋃ i : ι, Ball (xs i) (δs i) := by
  intro x hx
  rewrite [mem_Union]
  use ⟨x, hx⟩
  change x ∈ Ioo _ _
  rewrite [mem_Ioo]
  specialize δspos ⟨x, hx⟩
  split_ands
  change x - _ < x
  linarith [δspos]
  change x < x + _
  linarith [δspos]
specialize hcomp ι xs δs δspos hcover
choose V hV using hcomp
choose r rpos hr using FinMinPos ι V δs δspos
use r, rpos
intro z hz
change z ∉ S
intro z_in_S
specialize hV z_in_S
rewrite [mem_Union] at hV
choose i ball_i i_in_V s_in_Ball using hV
change z ∈ Ioo _ _ at hz
rewrite [mem_Ioo] at hz
have hz' : |y - z| < r := by
  rewrite [abs_lt]
  split_ands
  linarith [hz.2]
  linarith [hz.1]
rewrite [mem_range] at i_in_V
choose hi hi' using i_in_V
specialize hr i hi
set ri := δs i
set xi := xs i
let ripos : 0 < ri := by apply δspos i
have hr' : r ≤ ri := by linarith [hr]
have hdist : 2 * ri ≤ |y - xi| := by
  change 2 * (|y - xi| / 2) ≤ |y - xi|
  linarith
have hz'' : |z - xi| < ri := by
  rewrite [← hi'] at s_in_Ball
  change z ∈ Ioo _ _ at s_in_Ball
  rewrite [mem_Ioo] at s_in_Ball
  rewrite [abs_lt]
  split_ands
  linarith [hr, s_in_Ball.1]
  linarith [hr, s_in_Ball.2]
have hz''' : |y - z| ≤ ri := by linarith [hz', hr]
have hiy : |y - xi| ≤ |y - z| + |z - xi| := by
  rewrite [show y - xi = (y - z) + (z - xi) by ring_nf]
  apply abs_add
linarith [hdist, hz'', hz''', hiy, ripos]

intro z hz
push_neg at Snonempty
use 1, (by bound)
intro z hz
change z ∉ S
rewrite [Snonempty]
intro h
contradiction

end RealAnalysisGame

Conclusion "
"
