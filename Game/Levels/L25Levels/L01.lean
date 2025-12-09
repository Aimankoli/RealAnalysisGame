import Game.Levels.L24Lecture
import Game.Levels.L24PsetIntro

open Set


World "Lecture25"
Level 1
Title "Uniform Convergence Implies Integrability"

Introduction "
# Level 1: Uniform Convergence Implies Integrability

Show that if you have a sequence of functions `fₙ` that converge uniformly to `F`, and each `fₙ` is integrable, then `F` is also integrable, and that `∫ F = lim (∫ fₙ)`. This justifies Newton's calculation from Lecture 2, where we integrated the infinite series term-by-term! Indeed, for any finite sum, we can certainly integrate term-by-term, since the integral is linear. With this theorem, we can now extend that to infinite sums, provided the convergence is uniform (something that remains to be shown for Newton's example...).

Note that we assume *nothing* about continuity of either the `fₙ` nor `F` here; integrability is a strictly weaker condition, but suffices for the conclusion!

"

namespace RealAnalysisGame

/--
If `fₙ` converges uniformly to `F`, and each `fₙ` is integrable on `[a, b]`, then `F` is integrable on `[a, b]`, and the integral of `F` equals the limit of the integrals of `fₙ`.
-/
TheoremDoc RealAnalysisGame.Integrable_of_UnifConv as "Integrable_of_UnifConv" in "Functions"

Statement Integrable_of_UnifConv {f : ℕ → ℝ → ℝ} {F : ℝ → ℝ}
    {a b : ℝ} (hab : a < b)
    {ℓ : ℕ → ℝ}
    (hfint : ∀ n, HasIntegral (f n) a b (ℓ n))
    (hfF : UnifConv f F) :
    ∃ (L : ℝ), SeqLim ℓ L ∧ HasIntegral F a b L
 := by
have RSdiff : ∀ ε > 0, ∃ N, ∀ n ≥ N, ∀ M, |RiemannSum (f n) a b M - RiemannSum F a b M| < ε := by
  intro ε hε
  choose N hN using hfF (ε / (b - a)) (by bound)
  use N
  intro n hn M
  specialize hN n hn
  sorry
have Lconv : SeqConv ℓ := by
  apply SeqConv_of_IsCauchy
  intro ε hε
  choose N hN using RSdiff (ε / 4) (by bound)
  use N
  intro n hn m hmn
  choose M1 hM1 using hfint n (ε / 4) (by bound)
  choose M2 hM2 using hfint m (ε / 4) (by bound)
  let M := M1 + M2
  specialize hM1 M (by bound)
  specialize hM2 M (by bound)
  have hNn := hN n hn M
  have hNm := hN m (by bound) M
  have b1 : |ℓ m - ℓ n| ≤ |RiemannSum (f n) a b M - ℓ n| + |RiemannSum (f n) a b M - RiemannSum F a b M| +
    |RiemannSum (f m) a b M - RiemannSum F a b M| + |RiemannSum (f m) a b M - ℓ m| := by
    sorry
  linarith [b1, hM1, hM2, hNn, hNm]
choose L hL using Lconv
use L, hL
intro ε hε
choose N1 hN1 using hL (ε / 3) (by bound)
choose N2 hN2 using RSdiff (ε / 3) (by bound)
let N := N1 + N2
have Nbnd1 : N1 ≤ N := by bound
have Nbnd2 : N2 ≤ N := by bound
specialize hN1 N (by bound)
specialize hN2 N (by bound)
choose Mmax hMmax using hfint N (ε / 3) (by bound)
use Mmax
intro M hM
specialize hMmax M hM
specialize hN2 M
have b2 : |RiemannSum F a b M - L| ≤ |RiemannSum (f N) a b M - RiemannSum F a b M| +
  |RiemannSum (f N) a b M - ℓ N| + |ℓ N - L| := by
  sorry
linarith [b2, hMmax, hN1, hN2, Nbnd1, Nbnd2]

end RealAnalysisGame

Conclusion "
"
