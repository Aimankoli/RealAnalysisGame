import Game.Levels.L22Levels.L01
import Game.Levels.L22Levels.L02
import Game.Levels.L22Levels.L03

World "Lecture22"
Title "Lecture 22: Uniformity"

Introduction "
# Lecture 22: Uniformity

**SOCRATES:** I just noticed something about that last level.

**SIMPLICIO:** Ugh. Ok, what was it?

**SOCRATES:** I don't know, you tell me.

**SIMPLICIO:** We proved that $x^2-1$ was continuous everywhere. So what?

**SOCRATES:** Right. How did we do it? What `δ` did we choose, once `ε` was given?

**SIMPLICIO:** Are you getting senile, old man? We chose `δ = ε / (2|x|+1)`.

**SOCRATES:** Anything interesting about that?

**SIMPLICIO:** What, that it has an `x` in it? So what? We had no other choice but to choose `δ` depending on `x`. We took `y` near `x`, `|y-x|<δ`, and computed that `|f y - f x|` was `|y-x|*|y+x|`.
The first factor is good, since it's less than `δ`; in the second factor,
since `y` is near `x`, then `|y+x|` has size about `2*|x|`, and we
added one just to be safe.

**SOCRATES:** Ok, let's put a pin in this and come back to it later. Here's a question: suppose I have a sequence of continuous functions $f_n$, and suppose $f_n$ converges to some limit function $F$.
That is, for every $x$, the sequence of real numbers $n \\mapsto f_n(x)$ converges to $F(x)$. What can you tell me about $F$?

**SIMPLICIO:** Is $F$ continuous? Wait, I've fallen into this trap before. I even remember my counterexample from Lecture 1: Just take $f_n(x) = x^n$ on $[0,1]$. Each $f_n$ is continuous, but the limiting function is discontinuous at $x=1$.

**SOCRATES:** Exactly! So mere pointwise convergence isn't enough. But let's pretend that it was and see what goes wrong with our proof of continuity.

**SIMPLICIO:** Ok, so you want me to try (and fail) to prove that $F$ is continuous at some point $x$. Given `ε > 0`, we need to find `δ > 0` such that for all `y` with `|y - x| < δ`, we have `|F(y) - F(x)| < ε`.

**SOCRATES:** Right. Go on.

**SIMPLICIO:** Since $f_n$ converges to $F$ pointwise, for our given `x` and `ε`, we can find some big enough `N` such that for all `n ≥ N`, we have `|f_n(x) - F(x)| < ε/3`.

**SOCRATES:** Yes. And?

**SIMPLICIO:** Now, since $f_N$ is continuous at `x`, we can find some `δ > 0` such that for all `y` with `|y - x| < δ`, we have `|f_N(y) - f_N(x)| < ε/3`.

**SOCRATES:** Good so far. Now, what would you like to do next?

**SIMPLICIO:** Well, I want to show that `|F(y) - F(x)| < ε` for `y` close to `x`. I can use the triangle inequality:
`|F(y) - F(x)| ≤ |F(y) - f_N(y)| + |f_N(y) - f_N(x)| + |f_N(x) - F(x)|`.

**SOCRATES:** Excellent! And what can you say about each of these three terms?

**SIMPLICIO:** Well, the middle term is less than `ε/3` by our choice of `δ`. The last term is less than `ε/3` by our choice of `N`. So if I can make the first term less than `ε/3`, I'm done!

**SOCRATES:** And can you?

**SIMPLICIO:** Hmm... I need `|F(y) - f_N(y)| < ε/3`. Since $f_n$ converges to $F$ at the point `y`, I can find some `M` (which might depend on `y`) such that for `n ≥ M`, we have `|f_n(y) - F(y)| < ε/3`. Uh oh...

**SOCRATES:** What's the problem?

**SIMPLICIO:** The problem is that my `N` was chosen to work at the specific point `x`, but now I need it to work at this other point `y` too! And `y` could be **any** point near `x`, so I'd need `N` to work at *all* of these points near `x` simultaneously.

**SOCRATES:** Yeah, so what? No matter which `y` you pick, you can always find some `M` that works for that `y`.

**SIMPLICIO:** But that's exactly the problem! The `M` I find depends on which `y` I'm looking at. For one `y`, I might need `M = 100`. For another `y` nearby, I might need `M = 1000`. And for yet another `y`, I might need `M = 10000`.

**SOCRATES:** So?

**SIMPLICIO:** So my original `N` was fixed at the beginning - it only depends on `x` and `ε`. But now I need this same fixed `N` to work for all possible values of `y` near `x`. There's no guarantee that my fixed `N` is bigger than all the different `M`'s I'd need for different `y`'s!

**SOCRATES:** Ah, I see. So you're saying that even though $f_n(y) \\to F(y)$ for each individual `y`, there might not be a single `N` that makes the convergence happen \"fast enough\" simultaneously for all `y` in a neighborhood?

**SIMPLICIO:** Exactly! The convergence might be happening at wildly different rates at different points. At some points it might converge quickly, at others very slowly.

**SOCRATES:** Interesting. So what kind of convergence would you need to make this proof work?

**SIMPLICIO:** I'd need the convergence to be... uniform over the whole space? Or at least uniform over neighborhoods? So that I can find a single `N` that works for all points at once, not just point by point.

**SOCRATES:** Precisely! You've just discovered why we need the concept of **uniform convergence**. Shall we make this precise?

**SIMPLICIO:** Yes! What exactly do we mean by \"uniform convergence\"?

**SOCRATES:** You tell me.

**SIMPLICIO:** Well, I said that I need a single `N` that works for all points at once. So instead of saying \"for each `y`, there exists `M` such that for `n ≥ M`, we have `|f_n(y) - F(y)| < ε/3`\", I need to say \"there exists `N` such that for all `y` and all `n ≥ N`, we have `|f_n(y) - F(y)| < ε/3`\".

**SOCRATES:** Exactly! So uniform convergence means: for every `ε > 0`, there exists `N` such that for all `n ≥ N` and for all `x` in our domain, we have `|f_n(x) - F(x)| < ε`.

**SIMPLICIO:** Got it! The key difference is the *order of quantifiers*. In pointwise convergence, we have \"for all `x`, there exists `N`\" - the `N` can depend on `x`. In uniform convergence, we have \"there exists `N` such that for all `x`\" - the same `N` must work for every point.

**SOCRATES:** Perfect! This is *exactly* what Cauchy got **wrong** in his first attempt at proving that limits of continuous functions were continuous; he was missing uniformity! Ready to work on the proof?

**SIMPLICIO:** Yes, let's do it!

"
