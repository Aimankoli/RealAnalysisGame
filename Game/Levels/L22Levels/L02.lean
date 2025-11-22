import Game.Levels.L22Levels.L01

open Set

World "Lecture22"
Level 2
Title "Continuous Limits?"
Introduction "
# Level 2: Continuous Limits?

Is the limit of continuous functions continuous?

"

def FunContOn (f : ℝ → ℝ) (s : Set ℝ) : Prop := ∀ x ∈ s, FunContAt f x

Statement  : (∀ (s : Set ℝ) (f : ℕ → ℝ → ℝ) (hf : ∀ n, FunContOn (f n) s)
    (F : ℝ → ℝ) (hfF : ∀ x ∈ s, SeqLim (fun n ↦ f n x) (F x)), FunCont F)
    ∨ ¬ (∀ (s : Set ℝ) (f : ℕ → ℝ → ℝ) (hf : ∀ n, FunContOn (f n) s)
    (F : ℝ → ℝ) (hfF : ∀ x ∈ s, SeqLim (fun n ↦ f n x) (F x)), FunCont F) := by
right
push_neg
use Icc 0 1
use fun n x ↦ x ^ n
split_ands
intro n
sorry
use fun x ↦ if x = 1 then 1 else 0
split_ands
intro x hx
sorry
sorry



Conclusion "
"
