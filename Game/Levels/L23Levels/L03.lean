import Game.Levels.L23Levels.L02

open Finset Set

World "Lecture23"
Level 3
Title "Compactness"
Introduction "
# Level 3: Compactness

When is a continuous function *uniformly* continuous? It turns out: a function that is
continuous on a *compact* set is automatically uniformly continuous (on that same set). So what is compactness?

In topology, a set is called *compact* if every cover by (open) balls of the set has a finite subcover. In simpler terms, this means that if you can cover the set with a collection of open balls, you can always find a finite number of those sets that still cover the entire set. Can you see how that notion can be *very* useful when trying to prove uniformity?

## New definitions:

`def Ball (x : ℝ) (r : ℝ) : Set ℝ := Ioo (x - r) (x + r)`

Of course, `Ioo` means an interval with open ends on both sides.

Here's the formal definition of compactness: Notice that we don't say how to index the balls; they could be indexed by the natural numbers, or by the real numbers, or by any other type!

`def IsCompact (S : Set ℝ) : Prop :=`

`∀ (ι : Type) (xs : ι → ℝ) (δs : ι → ℝ), (∀ i, 0 < δs i) → (S ⊆ ⋃ i, Ball (xs i) (δs i)) →`

`∃ (V : Finset ι), S ⊆ ⋃ i ∈ V, Ball (xs i) (δs i)`

To package a set as a `Type`, here's what you do: If `S : Set ℝ` is some set, then writing

`let ι : Type := S`

creates a new Type, whose terms are pairs `⟨x, hx⟩` where `x : ℝ` and `hx : x ∈ S`.

## Helpful lemmas

`mem_Union : (x ∈ ⋃ i, s i) ↔ ∃ i, x ∈ s i `

`lemma FinMinPos (ι : Type) (V : Finset ι) (δs : ι → ℝ) (hδs : ∀ i, δs i > 0) :
    ∃ δ > 0, ∀ i ∈ V, δ ≤ δs i`


"

-- `def IsOpen (U : Set ℝ) : Prop := ∀ x ∈ U, ∃ r > 0, Ball x r ⊆ U`


-- `lemma IsOpen_of_Ball (x : ℝ) (r : ℝ) : IsOpen (Ball x r) `

namespace RealAnalysisGame

def Ball (x : ℝ) (r : ℝ) : Set ℝ := Ioo (x - r) (x + r)

/-- `Ball (x : ℝ) (r : ℝ) : Set ℝ := Ioo (x - r) (x + r)`

A ball of radius `r` centered at `x` is the open interval `(x - r, x + r)`.
-/
DefinitionDoc Ball as "Ball"



-- def IsOpen (U : Set ℝ) : Prop := ∀ x ∈ U, ∃ r > 0, Ball x r ⊆ U

theorem mem_Union {α : Type*} {ι : Sort*} {x : α} {s : ι → Set α} : (x ∈ ⋃ i, s i) ↔ ∃ i, x ∈ s i := Set.mem_iUnion

/--
An element `x` is in the union of sets `s i` if and only if there exists an index `i` such that `x` is in `s i`.
-/
TheoremDoc RealAnalysisGame.mem_Union as "mem_Union" in "Theorems"

-- `mem_UnionIn : (x ∈ ⋃ i ∈ V, s i) ↔ ∃ i ∈ V, x ∈ s i `

-- theorem mem_UnionIn {α : Type*} {ι : Sort*} {x : α} {s : ι → Set α} : (x ∈ ⋃ i ∈ V, s i) ↔ ∃ i ∈ V, x ∈ s i := Set.mem_iUnion


lemma FinMinPos (ι : Type) (V : Finset ι) (δs : ι → ℝ) (hδs : ∀ i, δs i > 0) :
    ∃ δ > 0, ∀ i ∈ V, δ ≤ δs i := by
  by_cases h_nonempty : V.Nonempty
  sorry
  use 1, by bound
  intro i hi
  exfalso
  simp only [Finset.not_nonempty_iff_eq_empty] at h_nonempty
  rewrite [h_nonempty] at hi
  contradiction
  -- let δ := Finset.min' δs h_nonempty
  -- use δ
  -- have hδpos : δ > 0 := sorry
  -- use hδpos
  -- intro δ' hδ'
  -- sorry

-- lemma IsOpen_of_Ball (x : ℝ) (r : ℝ) : IsOpen (Ball x r) := by
-- by_cases hr : r > 0
-- intro y hy
-- simp only [Ball, Set.mem_Ioo] at hy
-- let δ := min (y - (x - r)) ((x + r) - y)
-- have hδpos : δ > 0 := by apply lt_min <;> linarith [hy]
-- have δ1 : δ ≤ y - (x - r) := by bound
-- have δ2 : δ ≤ (x + r) - y := by bound
-- use δ, hδpos
-- intro z hz
-- simp only [Ball, Set.mem_Ioo] at hz ⊢
-- split_ands
-- linarith [hz.1, δ1]
-- linarith [hz.2, δ2]
-- simp only [gt_iff_lt, not_lt] at hr
-- intro y hy
-- simp only [Ball, Set.mem_Ioo] at hy
-- exfalso
-- linarith [hy.1, hy.2, hr]

/--
Given an indexing type `ι`, a finite subset `V` of `ι`, and a function `δs : ι → ℝ` that assigns a positive real number to each index, there exists a positive real number `δ` such that for all indices `i` in the finite set `V`, `δ` is less than or equal to `δs i`.
-/
TheoremDoc RealAnalysisGame.FinMinPos as "FinMinPos" in "Theorems"

NewTheorem RealAnalysisGame.FinMinPos RealAnalysisGame.mem_Union

def IsCompact (S : Set ℝ) : Prop :=
  ∀ (ι : Type) (xs : ι → ℝ) (δs : ι → ℝ), (∀ i, 0 < δs i) → (S ⊆ ⋃ i, Ball (xs i) (δs i)) →
    ∃ (V : Finset ι), S ⊆ ⋃ i ∈ V, Ball (xs i) (δs i)

/-- `IsCompact (S : Set ℝ) : Prop :=
  ∀ (ι : Type) (xs : ι → ℝ) (δs : ι → ℝ), (∀ i, 0 < δs i) → (S ⊆ ⋃ i, Ball (xs i) (δs i)) →
    ∃ (V : Finset ι), S ⊆ ⋃ i ∈ V, Ball (xs i) (δs i)`

A set `S` is compact if for every cover of `S` by balls, there exists a finite subcover.
-/
DefinitionDoc IsCompact as "IsCompact"

NewDefinition IsCompact Ball

/--
A continuous function on a compact set is uniformly continuous on that set.
-/
TheoremDoc RealAnalysisGame.UnifContOn_of_Compact as "UnifContOn_of_Compact" in "Topology"

Statement UnifContOn_of_Compact (f : ℝ → ℝ) (hf : FunCont f) (S : Set ℝ) (hS : IsCompact S) : UnifContOn f S := by
intro ε hε
have h1 : ∀ x ∈ S, ∃ δ > 0, ∀ y ∈ S, |y - x| < δ → |f y - f x| < ε / 2 := by
  intro x hx
  choose δ δpos hδ using hf x (ε / 2) (by bound)
  use δ, δpos
  intro y hy hxy
  apply hδ y hxy
choose δs δspos hδs using h1
let ι : Type := S
let xs : ι → ℝ := fun i ↦ i
let δ's : ι → ℝ := fun i ↦ (δs (xs i) i.2 / 2)
have δ'spos : ∀ i, 0 < δ's i := by
  intro i
  change 0 < δs (xs i) i.2 / 2
  linarith [δspos i.1 i.2]
have hScover : S ⊆ ⋃ i, Ball (xs i) (δ's i) := by
  intro x hx
  rewrite [mem_Union]
  use ⟨x, hx⟩
  change x ∈ Ioo (x - (δs x hx) / 2) (x + (δs x hx) / 2)
  rewrite [Set.mem_Ioo]
  split_ands
  linarith [(δspos x hx)]
  linarith [(δspos x hx)]
choose V hV using hS ι xs δ's δ'spos hScover
choose δ δpos hδ using FinMinPos ι V δ's δ'spos
use δ, δpos
intro x hx y hy hxy
have hx1 := hV hx
have hx1' : ∃ i ∈ V, x ∈ Ball (xs i) (δ's i) := by
  -- rewrite [mem_Union] at hx1
  -- choose i si hi x_in_si using hx1
  -- -- simp only [Set.mem_range] at hi
  -- -- choose i hi using hi
  -- use i
  -- split_ands
  -- sorry
  sorry
--
choose i i_in_V x_in_Ball using hx1'
have hxxi : |x - xs i| < (δs (xs i) i.2) / 2 := by
  -- simp only [Ball, Set.mem_Ioo] at x_in_Ball
  -- exact x_in_Ball
  sorry
have hxxi' : |x - xs i| < (δs (xs i) i.2) := by
  -- simp only [Ball, Set.mem_Ioo] at x_in_Ball
  -- exact x_in_Ball
  sorry
have hxy' : |y - x| < (δs i i.2) / 2 := by
  sorry
have hyxi : |y - xs i| < (δs i i.2) := by
  rewrite [show y - xs i = (y - x) + (x - xs i) by ring_nf]
  have h1 : |(y - x) + (x - xs i)| ≤ |y - x| + |x - xs i| := by apply abs_add
  have h2 : |x - xs i| = |xs i - x| := by apply abs_sub_comm
  linarith [hxy', hxxi, h1, h2]
have fyfxi := hδs (xs i) i.2 y hy hyxi
have fxix := hδs (xs i) i.2 x hx hxxi'
rewrite [show f y - f x = (f y - f (xs i)) + (f (xs i) - f x) by ring_nf]
have h1 : |(f y - f (xs i)) + (f (xs i) - f x)| ≤ |f y - f (xs i)| + |f (xs i) - f x| := by apply abs_add
rewrite [show |f (xs i) - f x| = |f x - f (xs i)| by apply abs_sub_comm] at h1
linarith [fyfxi, fxix, h1]

end RealAnalysisGame

Conclusion "
"
