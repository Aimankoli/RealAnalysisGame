import Game.Levels.L22Pset.L01
import Game.Levels.L22Pset.L02
import Game.Levels.L22Pset.L03
import Game.Levels.L22Pset.L04

World "L22Pset"
Title "Pset 22"

Introduction "
# Problem Set 22

$\\# 1)$ Prove `IntegrableOn` for `f : x ↦ x^2`; that is, formally (in natural language) compute $\\int_a^b x^2 \\, dx$.
[Hint: The identity $\\sum_{i=0}^{n-1} (i+1)^2 = \\frac{(n)(n+1)(2n+1)}{6}$ may be useful. You're welcome
that we're using right Riemann sums!..]

$\\# 2)$ Prove the Product Rule for derivatives: If `f` and `g` are differentiable at `c`, then so is `f * g`, and
`(f * g)'(c) = f'(c) * g(c) + f(c) * g'(c)`, formally (in natural language).

$\\# 3)$ Prove the Reciprocal Rule for derivatives: If `f` is differentiable at `c` and `f(c) ≠ 0`, then
`fun x ↦ 1 / f x` is differentiable at `c`, with derivative `-f'(c) / (f(c))^2`, formally (in natural language).

$\\# 4)$ Prove the Chain Rule for derivatives: If `f` is differentiable at `c` and `g` is differentiable at `f(c)`, then
`fun x ↦ g (f x)` is differentiable at `c`, with derivative `g'(f(c)) * f'(c)`, formally (in natural language).

$\\# 5)$ Prove that integrals are linear (part I): If `f` and `g` are integrable on `[a, b]`, then so is `fun x ↦ f x + g x`, and
$\\int_a^b (f(x) + g(x)) \\, dx = \\int_a^b f(x) \\, dx + \\int_a^b g(x) \\, dx$.

$\\# 6)$ Prove that integrals are linear (part II): If `f` is integrable on `[a, b]` and `k` is a constant, then so is `fun x ↦ k * f x`, and
$\\int_a^b k * f(x) \\, dx = k * \\int_a^b f(x) \\, dx$.

$\\# 7)$ Prove that derivatives are linear (part I): If `f` and `g` are differentiable at `c`, then so is `fun x ↦ f x + g x`, with derivative
`f'(c) + g'(c)`.

$\\# 8)$ Prove that derivatives are linear (part II): If `f` is differentiable at `c` and `k` is a constant, then so is `fun x ↦ k * f x`, with derivative `k * f'(c)`.

"
