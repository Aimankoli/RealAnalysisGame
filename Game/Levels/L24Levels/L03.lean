import Game.Levels.L24Levels.L02

open Set

World "Lecture24"
Level 3
Title "Least Upper Bound Property"
Introduction "
# Level 3: Least Upper Bound Property

Show that if `S : Set ℝ` is nonempty and bounded above, then it has a least upper bound (aka *supremum*).

# New definitions:

`M` is an upper bound of `S` if:

- `IsUB S (M : ℝ) := ∀ s ∈ S, s ≤ M`.

`L` is a (soon to be, the) least upper bound of `S` if:

- `IsLUB S L := IsUB L ∧ ∀ M, IsUB M → L ≤ M`.

that is, `L` is itself an upper bound, and any other upper bound `M` is at least as large as `L`.

"

namespace RealAnalysisGame

def IsUB (S : Set ℝ) (M : ℝ) : Prop := ∀ s ∈ S, s ≤ M

/-- `(S : Set ℝ) (M : ℝ) : Prop := ∀ s ∈ S, s ≤ M`

The point `M` is an upper bound of the set `S` if every element `s` in `S` satisfies `s ≤ M`.
-/
DefinitionDoc IsUB as "IsUB"

def IsLUB (S : Set ℝ) (L : ℝ) : Prop := IsUB S L ∧ ∀ M, IsUB S M → L ≤ M

/-- `(S : Set ℝ) (L : ℝ) : Prop := IsUB S L ∧ ∀ M, IsUB S M → L ≤ M`

The point `L` is a least upper bound (supremum) of the set `S` if `L` is an upper bound of `S`, and for any other upper bound `M` of `S`, we have `L ≤ M`.
-/
DefinitionDoc IsLUB as "IsLUB"

NewDefinition IsLUB IsUB

/--
Every nonempty set of real numbers that is bounded above has a least upper bound.
-/
TheoremDoc RealAnalysisGame.HasLUB_of_BddNonempty as "HasLUB_of_BddNonempty" in "Topology"

Statement HasLUB_of_BddNonempty (S : Set ℝ) (hS : S.Nonempty) (M : ℝ) (hM : IsUB S M) : ∃ L, IsLUB S L := by
choose s₀ hs₀ using hS
let ab : ∀ (n : ℕ), {p : ℝ × ℝ //
    (p.1 ∈ S) ∧
    IsUB S p.2 ∧
    p.1 ≤ p.2 ∧
    p.2 - p.1 ≤ (M - s₀) / 2^n} := by
    intro n
    induction' n with n hn
    · use (s₀, M)
      split_ands
      · apply hs₀
      · apply hM
      · bound
      · bound
    · let hp := hn.2
      set p : ℝ × ℝ := hn.1
      let mid : ℝ := (p.1 + p.2) / 2
      by_cases midS : ∃ s ∈ S, mid ≤ s
      · choose s sInS hs using midS
        use (s, p.2)
        split_ands
        · apply sInS
        · apply hp.2.1
        · bound
        · change p.2 - s ≤ (M - s₀) / 2^(n + 1)
          have hp' := hp.2.2.2
          change (p.1 + p.2) / 2 ≤ s at hs
          field_simp at ⊢ hp' hs
          rewrite [show (2 : ℝ) ^ (n + 1) = 2 * 2 ^ n by ring_nf]
          have f : (p.1 + p.2) * 2 ^ n ≤ 2 * s * 2 ^ n := by bound
          linarith [hp', hs, hp.2.2.1, f]
      · use (p.1, mid)
        split_ands
        · apply hp.1
        · push_neg at midS
          intro s hs
          linarith [midS s hs]
        · change p.1 ≤ (p.1 + p.2) / 2
          linarith [hp]
        · change (p.1 + p.2) / 2 - p.1 ≤ (M - s₀) / 2^(n + 1)
          have hp' := hp.2.2.2
          field_simp at ⊢ hp'
          rewrite [show (2 : ℝ) ^ (n + 1) = 2 * 2 ^ n by ring_nf]
          linarith [hp']

let a : ℕ → ℝ := fun n ↦ (ab n).val.1
let b : ℕ → ℝ := fun n ↦ (ab n).val.2

have a_prop : ∀ n, a n ∈ S := by
  intro n
  have h := (ab n).property.1
  apply h

have b_prop : ∀ n, IsUB S (b n) := by
  intro n
  have h := (ab n).property.2.1
  apply h

have aMono : Monotone a := by
  apply Monotone_of_succ
  intro n
  have h := (ab n).property.2.2.1
  by_cases midS : ∃ s ∈ S, (a n + b n) / 2 ≤ s
  · choose s sInS hs using midS
    have ha' : a (n + 1) = (ab (n + 1)).val.1 := by rfl
    have ha'' : (ab (n + 1)).val.1 = s := by
      sorry
    have f1 : a n ≤ b n := by bound
    linarith [f1, ha', ha'', hs]
  · have ha' : a (n + 1) = a n := by sorry
    linarith [ha']

have bAnti : Antitone b := by sorry

have aBnded : ∀ n, a n ≤ b 0 := by
  intro n
  have hb : (b n) ≤ b 0 := by bound
  specialize b_prop n (a n) (a_prop n)
  linarith [b_prop, hb]

have bBnded : ∀ n, a 0 ≤ b n := by
  intro n
  have ha : a 0 ≤ (a n) := by bound
  apply b_prop n (a 0) (a_prop 0)

have aCauchy := IsCauchy_of_MonotoneBdd aMono aBnded
have bCauchy := IsCauchy_of_AntitoneBdd bAnti bBnded

choose La hLa using SeqConv_of_IsCauchy aCauchy
choose Lb hLb using SeqConv_of_IsCauchy bCauchy

have L_le_b : ∀ n, Lb ≤ b n := by sorry

have L_le_b' : ∀ ε > 0, ∃ N, ∀ n ≥ N, b n < Lb + ε := by
  by_contra h
  push_neg at h
  choose ε εpos hε using h
  choose N hN using hLb ε εpos
  choose n n_N hn using hε N
  specialize hN n n_N
  rewrite [abs_lt] at hN
  linarith [hN, hn]

have a_le_L : ∀ n, a n ≤ La := by sorry

have a_le_L' : ∀ ε > 0, ∃ N, ∀ n ≥ N, La - ε < a n := by
  by_contra h
  push_neg at h
  choose ε εpos hε using h
  choose N hN using hLa ε εpos
  choose n n_N hn using hε N
  specialize hN n n_N
  rewrite [abs_lt] at hN
  linarith [hN, hn]

have La_eq_Lb : La = Lb := by
  have f1 : SeqLim (fun n ↦ b n - a n) 0 := by sorry
  sorry

use La

split_ands

· intro s hs
  rewrite [La_eq_Lb]
  by_contra h
  push_neg at h
  specialize L_le_b' (s - Lb) (by bound)
  choose N hN using L_le_b'
  specialize hN N (by bound)
  specialize b_prop N s hs
  linarith [hN, b_prop, h]
· intro M hM
  by_contra h
  push_neg at h
  specialize a_le_L' (La - M) (by bound)
  choose N hN using a_le_L'
  specialize hN N (by bound)
  rewrite [show La - (La - M) = M by ring_nf] at hN
  specialize hM (a N) (a_prop N)
  linarith [hM, hN]


end RealAnalysisGame

Conclusion "
"
