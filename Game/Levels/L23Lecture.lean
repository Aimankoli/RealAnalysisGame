import Game.Levels.L23Levels.L01
import Game.Levels.L23Levels.L02
import Game.Levels.L23Levels.L03

World "Lecture23"
Title "Lecture 23: Uniformity II: Continuity"

Introduction "
# Lecture 23: Uniformity II: Continuity

**SOCRATES:** Last time, we saw that limits of continuous functions are continuous, but only if the convergence is *uniform*. And we saw how Riemann sums, if they converge
to a limit, define the integral of a function on an interval. Let's talk about what conditions might ensure that Riemann sums converge.

**SIMPLICIO:** Hmm... Is it enough for the function to be continuous?

**SOCRATES:** Well, that's a good guess. The answer is *no*... and *yes*. Let's think about how we could prove that the sequence of Riemann sums converges. First of all, do we know what it should converge *to*?

**SIMPLICIO:** Umm... I guess we don't know yet -- that's the mystery of the integral! We just want to show that it converges to *something*. Oh! I know what to do in these cases: we need to show that the sequence of Riemann sums is Cauchy.

**SOCRATES:** Exactly! So let's think about how the difference

`|RiemannSum f a b m - RiemannSum f a b n|`

can be made small.

**SIMPLICIO:** Well, if `m` and `n` are very large, then the partitions are very fine, so the Riemann sums should be close to each other. Right? I guess if you make the partitions finer, after a certain point the Riemann sums shouldn't change much.

**SOCRATES:** Yes, that's the right intuition. But we need to be a bit more precise.
Is there something we could do to compare Riemann sums with different numbers of subintervals? What if one of the numbers is a multiple of the other?

**SIMPLICIO:** Oh! If `m` is a multiple of `n`, say `m = n * k`, then we can compare `RiemannSum f a b (n * k)` to `RiemannSum f a b n`. Maybe we can show that if the partition with `n` subintervals is fine enough, then the Riemann sum with `n * k` subintervals is close to that with `n` subintervals. I think i see how to do it. But! We'll need a single `δ` that works for *all* points in `[a,b]`, not a different `δ` for each point.

**SOCRATES:** Bingo! You just invented the notion of *uniform continuity*! Tell me what it should mean.

**SIMPLICIO:** Wait, what's uniform continuity? Does that have anything to do with uniform convergence that we just discussed?

**SOCRATES:** Oh, sorry! You're right, that can be confusing. We need to make sure to distiguish these two somewhat similar-sounding but actually rather different concepts. I think of uniform convergence as a \"vertical\" notion: you have a family of different functions `fₙ` converging to `F`, and the convergence happens uniformly over the entire domain. Uniform continuity, on the other hand, is more of a \"horizontal\" notion: it applies to a single function `f`. What should it mean, given our discussion about Riemann sums?

**SIMPLICIO:** Hmm... So ordinary continuity of a function `f` at a point `x` means the following:

Given an `ε > 0` and a point `x`, we can find a `δ > 0` (which may depend on `x`!!) such that for all `y` with `|x - y| < δ`, we have `|f x - f y| < ε`.


And so the \"uniformity\" should say that the `δ > 0` can be chosen regardless of what `x` is. Ah! Something like this?

Given an `ε > 0`, we can find a `δ > 0` such that for *all* `x` and `y` in the domain, if `|x - y| < δ`, then `|f x - f y| < ε`.

Again, it's just about reordering the quantifiers?

**SOCRATES:** Yes, that's exactly right! You've just defined *uniform continuity*. So just like in pointwise convergence where `N` can depend on the point `x` but uniform convergence requires a single `N` that works for all `x`, here ordinary continuity allows `δ` to depend on `x` but uniform continuity requires a single `δ` that works for all `x` and `y`. So that's how they're similar but different!

**SIMPLICIO:** Ok, I think I get it.

**SOCRATES:** What we'll prove today is that if a function is uniformly continuous on `[a,b]`, then its Riemann sums converge to a limit, and this limit is what we call the integral of the function on `[a,b]`. But this raises another fundamental question: When is a continuous function *uniformly* continuous? Remember how we proved that `f(x) = x ^ 2 - 1` is continuous everywhere? Remember what value of `δ` we chose once `ε` was given?

**SIMPLICIO:** For the third time, we chose `δ = ε / (2|x|+1)`. Oh, I see! So `δ` depended on `x`, which means that `f(x) = x ^ 2 - 1` is not uniformly continuous on all of `ℝ`.

**SOCRATES:** Right. But! When we integrate a function on a finite interval like `[a, b]`, we only care about its behavior on that interval. Let's say we wanted to integrate `f(x) = x ^ 2 - 1` on the interval `[-10,10]`. Can we find a `δ` that works for *all* `x`, just in that range?

**SIMPLICIO:** Hmm... Well, on `[-10,10]`, the maximum value of `|x|` is `10`. Instead of a different value of `δ = ε / (2|x|+1)` for each `x`, we can just use the largest possible denominator, which is when `|x| = 10`. That is, we can use `δ = ε / (2*10 + 1) = ε / 21` for *all* `x` in `[-10,10]`.

**SOCRATES:** Exactly! So on the interval `[-10,10]`, the function `f(x) = x ^ 2 - 1` *is* uniformly continuous. In fact, there's a general theorem here: It turns out that any function that is continuous on a \"*compact*\" interval like `[-10, 10]` is automatically uniformly continuous on that interval. But this is not a theorem in calculus; it's a result in topology! So to understand some of the next steps of calculus, we need to learn a bit of topology first.

**SIMPLICIO:** Ok, what's topology?

**SOCRATES:** Well, of all the subjects in mathematics, topology is among the youngest. Geometry and algebra have been studied for thousands of years, and calculus for a few hundred years. But topology only really started to be developed \"officially\" in the 19th and early 20th centuries. In fact, once you see just how important topology is for understanding calculus, you'll feel embarrassed for all of the great mathematicians of the past who did calculus without it! The proper notion of compactness was not fully understood until the late 19th century, well after Riemann's fundamental work on integration.

**SIMPLICIO:** Wow, that's surprising. Ok, so what is compactness?

**SOCRATES:** Like so many other concepts in this course, I hope you'll come to
appreciate how complicated and subtle the idea is, despite the fact that we can now
make the definition quite intuitively clear. It took people decades to figure out *exactly* what compactness should mean! Let's go back to uniform continuity. You have continuity at every single point `x` in your set `S`. So for every `x`, there's a little ball `(x - δₓ, x + δₓ)` where continuity holds with `δₓ` depending on `x`. And of course all these balls cover your set `S ⊆ ⋃ x, (x - δₓ, x + δₓ)`.
Here's the key idea for compactness. What if: whenever you can cover `S` by any number of balls (possibly infinitely many, even uncountably many), you can *always* find a subcover that uses only *finitely many* of those balls? **That** is the key idea and definition of compactness!

**SIMPLICIO:** Ah! And if I have only finitely many balls covering `S`, then I can just take the minimum of all the `δ`s for those balls, and that minimum `δ` will work for the entire set `S`! I see now how compactness leads to uniform continuity. At least I think I do.

**SOCRATES:** Good; let's find out for *sure*. :)

"
