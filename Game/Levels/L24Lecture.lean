import Game.Levels.L24Levels.L01
import Game.Levels.L24Levels.L02
import Game.Levels.L24Levels.L03
import Game.Levels.L24Levels.L04
import Game.Levels.L24Levels.L05

World "Lecture24"
Title "Lecture 24: Topology"

Introduction "
# Lecture 24: Topology

**SIMPLICIO:** So wait, is \"compact\" just about being bounded?

**SOCRATES:** Good question! Tell me about the function `f(x) = 1/x` on the interval `(0,1)`. It's certainly continuous (as long as we don't include `0`). The interval `(0,1)` is bounded. If that interval were compact, then `f` would be uniformly continuous on `(0,1)`. Is `f` uniformly continuous on `(0,1)`?

**SIMPLICIO:** Ooh, doesn't look it; the slope gets really steep as `x` approaches `0`. That means that if I want to keep the fluctuation of `f`, that is, `|f y - f x|`, small, I need to make `|y - x|` ever smaller and smaller, for `x` getting closer to `0`. So I can't pick a single `δ` that works for all `x` in `(0,1)`.

**SOCRATES:** Good. Can you see another way to see that `(0,1)` is not compact, directly from the definition?

**SIMPLICIO:** Umm... I guess I could try to cover `(0,1)` with balls. Like, I could cover it with the balls `(1/2, 1) ⋃ (1/3, 1) ⋃ (1/4, 1) ⋃ ...`. The ... Archimedean property (again!!) says that these balls cover all of `(0,1)`. But if only finitely many of them are used, say up to `(1/N, 1)`, then the point `1/(N+1)` is not covered. So there's no finite subcover.

**SOCRATES:** Excellent! So `(0,1)` is not compact; that is, being bounded is not enough for compactness. But it's easy to see that bounded *is* necessary. Can you see why?

**SIMPLICIO:** Oh, I see it! Let `S` be our compact set. We can conver `S` by the balls `(-n, n)` for all natural numbers `n`. Since `S` is compact, there must be a finite subcover. That means that there is some largest `N` such that `(-N, N)` covers all of `S`. Therefore, `S` is bounded.

**SOCRATES:** Perfect. So boundedness is necessary but, as we just saw with the example of `(0,1)`, not sufficient for compactness. There's one more ingredient we need.

**SIMPLICIO:** What is it?

**SOCRATES:** The set also needs to be *closed*. Here's some more topology-speak for you: A set is *closed* if its complement is *open*.

**SIMPLICIO:** Greaaaat, more definitions.

**SOCRATES:** Last one, for now. A set `S` is *open* if: for every point in `S`, there is a ball around that point which is entirely contained in `S`. That is: `S` is open if:

`∀ x ∈ S, ∃ δ > 0, Ball x δ ⊆ S`

Let's check your understanding: is a ball itself open?

**SIMPLICIO:** Hmm let's see. I have a point `y ∈ Ball x r`. I have to find a `δ > 0` such that `Ball y δ ⊆ Ball x r`. The condition that `y` is in the ball means that `|x - y| < r`, which looks something like this:

---|(x-r)----(y)---(x)-------(x+r)|----

So if we let `δ := min (y - (x - r)) (x + r - y)`, then `Ball y δ` will fit inside `Ball x r`. So yes, a ball is open!

**SOCRATES:** Excellent! So now you have all the ingredients to understand compactness in `ℝ`: A famous result called the *Heine-Borel Theorem* says that a set `S ⊆ ℝ` is compact if and only if:

it is closed and bounded.

Heine proved this in 1872, and Borel generalized it to higher dimensions in 1895. This is a very important theorem in real analysis, because it allows us to easily check whether a set is compact or not. For example, the complement of `[a, b]` is the union of `(-∞, a)` and `(b, ∞)`, both of which are open, so `[a, b]` is closed. And of course `[a, b]` is bounded. Therefore, by Heine-Borel, `[a, b]` is compact. This gives us the important result we wanted:

**Theorem:** For any function that is continuous on a closed and bounded interval `[a, b]`, the sequence of Riemann sums converges to a limit, which we call the integral of the function on `[a, b]`.

(Note again that `f` must be continuous on the *entire* closed interval `[a, b]`. The function `f(x) = 1/x` is continuous on `(0,1]`, all but one point; but the Riemann sums do not converge, because `∫₀¹ 1/x dx = ∞`!)

The proof is very simple: `[a, b]` is closed and bounded, and hence compact by Heine-Borel. Any function that is continuous on a compact set is uniformly continuous there. And if a function is uniformly continuous on an interval, then the Riemann sums converge to a limit. Just chain everything we've learned together!

**SIMPLICIO:** Wow, that's really elegant. How is Heine-Borel proved? I guess we already proved half of one direction, if a set is compact then it's bounded. How do we prove that it's also closed?

**SOCRATES:** You tell me!

**SIMPLICIO:** Ok, let's try. Suppose `S` is compact. We want to show that its complement `Sᶜ` is open. So take any point `x ∈ Sᶜ`. We need to show that there's a whole ball around `x` that stays away from `S`. And the only way to make use of compactness is to cover `S` with balls. Oh, I think I see it!

For every point `y ∈ S`, look at the ball centered at `y` of radius `|y - x| / 2`, say. That's a ball that contains `y` but stays away from `x`. The collection of all such balls covers `S`, and hence only finitely many such balls cover `S`. So we have `V : Finset I` and for each `i ∈ V`, we have a point `yᵢ ∈ S` and a ball `Ball yᵢ (|yᵢ - x| / 2)`, and these finitely many balls cover `S`. Now let `δ > 0` be the minimum of all the `|yᵢ - x| / 2` for `i ∈ V`. Then the ball `Ball x δ` stays away from all the balls covering `S`, and hence from `S` itself. Therefore, `Sᶜ` is open, and so `S` is closed.

**SOCRATES:** Well done! You hardly need me anymore! :) Channel your inner me; what's the next thing I'd say?

**SIMPLICIO:** You'd tell me to try to prove the other direction. Ok, let's say that `S` is closed and bounded. We want to show that it's compact. So take any cover of `S` by balls. We need to find a finite subcover. I ... don't see what to do.

**SOCRATES:** Ok, this direction is a bit harder. Let's build up to it with a few more definitions. (I know, I know.) Given a set `S` and a real number `M`, we say that `M` is an *upper bound* for `S` if for all `s ∈ S`, `s ≤ M`. Easy, right? We say that `L` is a *least upper bound* (or *supremum*) for `S` if `L` is an upper bound for `S`, and for any other upper bound `M`, we have `L ≤ M`. In other words, `L` is the smallest of all upper bounds.

**SIMPLICIO:** Ok, so far so good... So what?

**SOCRATES:** Now, here's an important property of the real numbers: *every nonempty set of real numbers that is bounded above has a least upper bound*. This is called the *Least Upper Bound Property*. Let's talk about how you might go about proving it.

**SIMPLICIO:** Hmm... Let me think. Ok, I start with at least one point `s₀ ∈ S`, since `S` is nonempty, and at least one upper bound `M₀`. I think I see what to do! Let's think about the middle point between `s₀` and `M₀`, that is, `(s₀ + M₀) / 2`. Is that an upper bound for `S`? If not, then there exists some point `s₁ ∈ S` such that `s₁ > (s₀ + M₀) / 2`. Otherwise, if it *is* an upper bound, then we can set `M₁ := (s₀ + M₀) / 2`. In either case, we have a smaller interval `[s₁, M₀]` or `[s₀, M₁]`. We can keep repeating this process, halving (or more) the interval each time. This gives us a sequence of nested intervals whose lengths go to zero. The bottoms are all points in `S` and increasing and bounded, hence have a limit `L`. The tops are all upper bounds and decreasing and bounded, hence have a limit `U`. Since the lengths of the intervals go to zero, `L = U`. Now, I need to show that `L` is *the* least upper bound for `S`. I think I can do that by showing that `L` is an upper bound, and that any smaller number is not an upper bound. Ok, I'm satisfied.

**SOCRATES:** Excellent! Now, armed with the Least Upper Bound Property, you can finally prove that any closed and bounded set is compact. First let's prove that a closed interval `[a, b]` is compact. Take any cover of `[a, b]` by balls. We want to find a finite subcover. Consider the set `T` of all points `t ∈ [a, b]` such that the interval `[a, t]` can be covered by finitely many of the balls. Clearly, `a ∈ T`, so `T` is nonempty. Also, every point in `T` is at most `b`, so `T` is bounded above by `b`. By the Least Upper Bound Property, `T` has a least upper bound `L`. We want to show that `L = b`. If not, then since the balls cover `[a, b]`, there is some ball covering `L`. Since the ball has positive radius, it covers some interval around `L`, say `[L - δ, L + δ]`. Since `L` is the least upper bound of `S`, there must be some point `t ∈ S` with `t > L - δ`. But then we can cover `[a, t]` with finitely many balls (since `t ∈ S`), and also cover `[t, L + δ]` with the ball around `L`. This gives us a finite cover for `[a, L + δ]`, contradicting the fact that `L` is an upper bound for `S`. Therefore, `L = b`, and hence `[a, b]` can be covered by finitely many balls.

**SIMPLICIO:** Ok, I'm with you. But what do we do for *any* closed and bounded set?

**SOCRATES:** Ah, and here's the last step. Any closed subset of a compact set is itself compact! Can you see why?

**SIMPLICIO:** Hmm, let's see. Let `S` be a closed subset of a compact set `T`. Take any cover of `S` by balls. We want to find a finite subcover. Since `S` is closed, its complement `Sᶜ` is open. Therefore, for every point `x ∈ Sᶜ`, there is a ball around `x` that stays within `Sᶜ`, that is, away from `S`. The collection of all such balls, together with the balls covering `S`, forms an open cover of the entire set `T`. Since `T` is compact, there is a finite subcover of `T`. This finite subcover must include finitely many balls covering `S`, since the balls covering `Sᶜ` do not cover any points in `S`. Therefore, we have found a finite subcover for `S`. Hence, `S` is compact. Nice! Since a bounded set is a subset of some closed interval `[a, b]`, and we've just shown that `[a, b]` is compact, it follows that any closed and bounded set is compact.

**SOCRATES:** Well done, Simplicio! You've just proved the Heine-Borel Theorem. And to bring it all the way back to calculus, this means that any continuous function on a closed and bounded interval `[a, b]` is uniformly continuous there, and hence Riemann integrable. Now let's do all this \"for real\"...

"
