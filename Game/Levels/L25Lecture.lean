import Game.Levels.L25Levels.L01
import Game.Levels.L25Levels.L02

World "Lecture25"
Title "Lecture 25: Swapping Limits and Integrals"

Introduction "
# Lecture 25: Swapping Limits and Integrals

**SIMPLICIO:** We meet one last time, Socrates.

**SOCRATES:** For now, old friend.

**SIMPLICIO:** Hey, quick question. Why do we need general indexing types, can't we just index everything by natural numbers?

**SOCRATES:** Ah, great question! Besides the generality that general indexing types provide, there's a crucially important reason: sometimes, the objects we want to index by have *no* possible indexing by natural numbers at all!

**SIMPLICIO:** Really? Like what?

**SOCRATES:** Let's back up a little. Professor David Hilbert liked to tell this story in terms of a magical hotel. So: imagine a hotel with infinitely many rooms, numbered `R1, R2, R3, ...`. Now, suppose that every room is occupied, with guest `G1` in room `R1`, guest `G2` in room `R2`, and so on.
There are infinitely many rooms, but also infinitely many guests, so everybody has a room, and every room is taken. `∞ = ∞`. So far so good?

**SIMPLICIO:** I mean, yeah, except for the infinitely large hotel and infinitely many people thing...

**SOCRATES:** Come on, go with me here. Now, on the first night, a new guest, `G0`, arrives, asking for a place to stay. The clerk says, \"Hey buddy, can't you read? No vacancy. Sorry!\"

Professor Hilbert overhears this from his office, and comes around to the front desk. He says, \"Wait a minute, sir; I'm sorry, yes, we can host you tonight.\"

The clerk protests: \"But Professor, all the rooms are taken! Just because the hotel has infinitely many rooms doesn't mean you can ask `G0` to go all the way to the 'end' somehow, right?\"

Hilbert replies: \"You're absolutely right, that would be impossible. I can't tell guest `G0` to go to 'the end', because that's not a room assignment. Here's the hotel's ledger; every guest needs to have exactly one room assigned to them. But! We can do something much better,\" and he gets on the hotel loudspeaker: \"Attention all guests! I'm sorry to inconvenience you, but may I please request that the guest in room `Rn` move to room `R(n+1)`? Thank you!\"

Hilbert turns to the guest, \"In just a moment, sir, room `R1` will be free for you.\" He asks the clerk to update the ledger, and returns to his office.

**SIMPLICIO:** Wow, that's clever! So wait, `∞ + 1 = ∞` after all?

**SOCRATES:** You ain't seen nothin' yet, kid. On the second night, the hotel is again full, with guest `G1` back to room `R1`, and so on.

**SIMPLICIO:** Oh so guest `G0` left, and everybody had to move again? I don't think I'd like to stay at this hotel...

**SOCRATES:** Shush. On the second night, a car pulls up with 10 people in it. The clerk knows exactly what to do; he gets on the speaker and says, \"Will the guest in room `Rn` please move to room `R(n+10)`? Thank you!\" And just like that, rooms `R1` through `R10` are free for the new guests.

Then on the third night, a bus arrives, but this time it has *infinitely* many passengers, `P1`, `P2`, `P3`, and so on. The clerk says to them, \"Gee, I'm really sorry. I could accommodate 100 or 1,000 or even 1,000,000 of you, but I can't tell the guest in room `Rn` to move to room `R(n+∞)`, that's not a room assignment! I'm really sorry, but we just won't be able to host you tonight.\"

**SIMPLICIO:** Well, yeah, now you're asking for `∞ + ∞`! Surely that's bigger than `∞`... No?

**SOCRATES:** Professor Hilbert again overhears this, and comes out from his office. He says the the bus driver, \"Please give me just a moment, and we'll make space for you all.\"

The clerk protests, \"But Professor, how can we do that? You said I couldn't send people infinitely far down the hotel?\"

Professor Hilbert, ignoring the clerk, gets on the speaker: \"Attention all guests! I'm sorry to inconvenience you, but may I please request that the guest in room `Rn` move to room `R(2n)`? Thank you!\" Hilbert turns to the clerk: \"And now, all the odd numbered rooms are free for the bus passengers. Please update the ledger accordingly.\"

**SIMPLICIO:** Whoa, cool! So `∞ + ∞ = ∞` too!

**SOCRATES:** On the fourth night, the bus has left, and the original guests are back in their rooms. Now ten buses arrive, each with infinitely many passengers. The clerk knows exactly what to do.

**SIMPLICIO:** Ok, I get it.
He gets on the speaker and tells the guest in room `Rn` to move to room `R(10n)`, right? Then passengers from bus 1 go to rooms `R1, R11, R21, ...`, the passengers from bus 2 go to rooms `R2, R12, R22, ...`, and so on. That's cool, so `10 × ∞ = ∞` too.

**SOCRATES:** Right! On the fifth night, the hotel is back as it started, and a caravan arrives of *infinitely many* buses, each with *infinitely many* passengers. Bus `1` has passengers `P(1,1), P(1,2), P(1,3), ...`, and bus `2` has passengers `P(2,1), P(2,2), P(2,3), ...`, and so on.

The clerk says to them, \"Look, I think we don't have room, because I can't tell the guest in room `Rn` to move to room `R(n × ∞)`. But this Professor here is a real whiz; he just might have something up his sleeve.\"

Hilbert comes out from his office, and says to the clerk, \"Indeed, we can handle them all! Please ask the guests to move to twice their room number as before, to free up infinitely many rooms.\"

The clerk starts to protest, thinking the absentminded Professor might have not seen that the caravan has infinitely many buses. But Hilbert cuts him off: \"Here's what we're going to do: In the first available room, please place passenger `P(1,1)`. Then `P(1,2)`, then `P(2,1)`. Then `P(3,1)`, `P(2,2)`, and `P(1,3)`, and so on, zigzagging through the passenger list. As you'll see, everyone has a clearly defined, finite room number, with nobody left behind.\"

**SIMPLICIO:** Whoa, that's crazy, even `∞ × ∞ = ∞`! So I guess infinity is so big, you can fit just about anything!

**SOCRATES:** Well, now it's the sixth night, and the hotel is empty. I guess the guests got tired of being moved around! Only one bus arrives. But this is an extremely large party bus from Sweden, blasting ABBA tunes. Everybody on this bus has a very strange name. It consists of an infinite sequence of `A`s and `B`s. For example, one passenger has the name `ABBAAABABBA...`, going on forever. And another is called `AAABBBBAA...`, and so on. In fact, for *any* sequence of `A`s and `B`s, there is a single passenger on this bus with exactly that name. Their manager comes off the bus to speak with the clerk.

The clerk says, \"Gee whiz, that's a pretty big bus, sir. But don't worry, I'm *sure* we can find a way to fit everybody. Let me just get the Professor.\"

Hilbert steps out of his office, and signs with disappointment. \"I'm very sorry,\" he says to the manager, \"but we will *not* be able to accommodate your passengers.\"

The clerk is shocked. \"But Professor, why not? We've handled infinitely many buses with infinitely many passengers before! This is just *one* bus!\"

Hilbert says to the clerk, \"Take out the ledger. Let's work backwards. Imagine that we're done placing *every single person* from that bus into a room. So in room `R1`, we have `ABBAAA...`, say, and in room `R2`, we have `AAABBB...`, and in room `R3` is `BABBAA...` and so on. Ok? I claim we're not done, and we've left someone off the ledger. If I can prove to you that there's at least one passenger hasn't been assigned a room, then do you see how the entire enterprise is futile?\"

The clerk nods reluctantly. Hilbert continues: \"The person in room `R1` is named `ABBAAA...`. So if I give you the name of a person whose first letter is `B`, then that person is certainly not in room `R1`, right?\" The clerk nods. \"Now, the person in room `R2` is named `AAABBB...`. If I give you the name of a person whose *second* letter is `B`, then that differs from the second letter of the person in room `R2`, so that person is not in room `R2`. Do you follow?\" The clerk nods again.

**SIMPLICIO:** Oh, I see it!! You're going to take the name of the person in room `Rn`, and change the `n`-th letter! That way, you'll make a name that differs from *everybody's* name in the ledger, by at least one letter! So whoever that passenger is, and it's certainly someone on the bus, they can't be in any room! Whoa! So wait, how big is that infinity?

**SOCRATES:** Indeed! Let's think. If we only had names that were four letters long, like `ABBA` or `AABB` or `BABA`, how many such names are there?

**SIMPLICIO:** Easy peasy, there are `2^4 = 16` such names, since each of the four letters can be either `A` or `B`. Oh! So the ABBA bus has `2^∞` people on it? Whoa, and we just showed that `2^∞ > ∞`!

**SOCRATES:** Exactly right. This is called the *Cantor diagonalization argument*, and it shows that there are different sizes of infinity. So let me ask you: what the heck does any of this have to do with indexing sets?

**SIMPLICIO:** Ok, I see it! The first night we just reindexed the naturals `ℕ` by `n ↦ n + 1`. The third night, we indexed all the integers `ℤ`, which are 'twice' as large as `ℕ`. What's the meaning of the fifth night?

**SOCRATES:** So then we had infinitely many buses with infinitely many passengers. We can think of the buses as denominators, and passengers as numerators. We indexed the rationals, `ℚ`! We can assign an ordering to the rationals by zigzagging through the fraction table, just like we did with the infinitely many passengers on infinitely many buses.

**SIMPLICIO:** Hah! And the sixth night?

**SOCRATES:** Think about the real numbers `ℝ`. Can we index those, assign *every* real number to a room in the hotel? I claim we can't even do it for all the reals between `0` and `1`. In fact, just look at the decimals that use only `0`s and `1`s, like `0.101100111...` and `0.111000101...`. That *is* the ABBA bus, and those real numbers can't be indexed by `ℕ`, so certainly all of the reals can't either!
Here's a fun Veritasium video you can watch all about this topic (right-click to get it to pop up in a new tab):
[![Veritasium Video](https://img.youtube.com/vi/gMlf1ELvRzc/maxresdefault.jpg)](https://youtu.be/gMlf1ELvRzc)

**SIMPLICIO:** That's wild stuff! Hey, if `2^∞` is strictly bigger than `∞`, in this sense, is there some infinty like, in between them?

**SOCRATES:** Whoa, hold your horses, lad! That question is too deep for us now. (Go google the `Continuum Hypothesis`.) All I want you to understand for now is that there are surprisingly many things that we *can* index by `ℕ` (by the way, anything that can be indexed by `ℕ` is called *countable*), but there are also many \"*uncountable*\" things, that is, those that cannot be indexed by `ℕ`. So we need general indexing types to handle all the different situations that arise in analysis.

**SIMPLICIO:** Cool! So what's today's lesson?

**SOCRATES:** Well, I still owe you a justification for Newton's term-by-term integration of infinite series. So let's jump straight there. If you recall, Newton argued that, since

$
\\sqrt{1-x^2}
= 1 - \\frac{x^2}{2} - \\frac{x^4}{8} - \\frac{x^6}{16} - \\frac{5x^8}{128} - \\cdots,
$

he could integrate term by term:

$\\int_0^{1/2} \\sqrt{1-x^2} \\, dx =
\\int_0^{1/2} 1 dx - \\int_0^{1/2}  \\frac{x^2}{2}  dx -  \\int_0^{1/2} \\frac{x^4}{8} dx  - \\int_0^{1/2} \\frac{x^6}{16}dx.$

In other words, he had a sequence of functions `fₙ(x)` (the sum of the first `n` terms of the series),
and he claimed that since `fₙ` converged to `F(x) = √(1 - x²)`, then

`∫ F = lim (∫ fₙ)`.

So is this actually true, and under what conditions can it be justified?

**SIMPLICIO:** Ok, let me guess. Of course each `fₙ` had better be integrable, otherwise the whole thing falls apart. But I bet you're going to tell me a slew of examples where pointwise convergence isn't enough?

**SOCRATES:** You know me very well by now. Indeed, you need to keep just a few examples in mind, and you'll
see clearly what's going on. Let's start with this example. Let `fₙ(x)` be the indicator function of the interval `[n, n+1]`.
That is, it's `1` if `x ∈ [n, n+1]`, and `0` otherwise. Each `fₙ` is integrable, since it's just a step function, and has integral `1`.
So `lim (∫ fₙ) = 1`.

But for any fixed `x`, what happens to the limit of `fₙ(x)`?

**SIMPLICIO:** Yep, I see it, eventually `fₙ(x)` becomes `0` for all sufficiently large `n`, once `n` exceeds `x`. So the pointwise limit function `F(x)` is identically `0`, which of course has integral `∫ F = 0 ≠ 1`. What else? Maybe this example is bad because you're shifting the intervals off to infinity? What if we keep all the action in `[0,1]`?

**SOCRATES:** Good idea. Let's try this: let `fₙ(x) = n` if `x ∈ [0, 1/n]`, and `0` otherwise, and let's integrate it on the nice, *compact* region `[0, 1]`. What's going on there?

**SIMPLICIO:** Ok, each `fₙ` is integrable, since it's again a step function. The integral is `∫ fₙ = n × (1/n) = 1`. So again `lim (∫ fₙ) = 1`. But for any fixed `x > 0`, eventually `n` gets so large that `x` is outside `[0, 1/n]` (`ArchProp`!!), so `fₙ(x) = 0` for all sufficiently large `n`. And at `x = 0`, well, `fₙ(0) = n`, which diverges. So the pointwise limit function `F(x)` is again identically `0` for all `x > 0`, and undefined at `x = 0`. But I'm guessing a single point doesn't affect the integral, we can just say `F(x) = 0` everywhere, and so again `∫ F = 0 ≠ 1`. Ah, but these functions are not continuous! Maybe that's the problem?

**SOCRATES:** Good thinking. Let's try to make them continuous. Consider the functions `fₙ(x)` defined as follows:
- `fₙ(x) = n^2 x` for `x ∈ [0, 1/n]`
- `fₙ(x) = -n^2 x + 2n` for `x ∈ [1/n, 2/n]`
- `fₙ(x) = 0` for `x ∉ [0, 2/n]`
So we've made a little \"tent\" shape that peaks at height `n` at `x = 1/n`, and goes back down to `0` by `x = 2/n`. Each `fₙ` is continuous, and integrable, with integral `∫ fₙ = 1`, because the area is a triangle with base `2/n` and height `n`.
So `lim (∫ fₙ) = 1`. But again, for any fixed `x > 0`, eventually `n` gets so large that `x` is outside `[0, 2/n]`, so `fₙ(x) = 0` for all sufficiently large `n`. And at `x = 0`, we have `fₙ(0) = 0` for all `n`. So the pointwise limit function `F(x)` is again identically `0` for all `x`, and so again `∫ F = 0 ≠ 1`. Hmm, so continuity isn't enough either.

**SIMPLICIO:** Wow, these are some tricky examples. Ok, so what is it, what's the condition we need to make this work?

**SOCRATES:** You already know it!

**SIMPLICIO:** Oh... Is it... *uniform convergence*? Let's think. Suppose `fₙ` is integrable, and converges to `F` uniformly. Let's think about
the difference between the order `N` Riemann sum for `F`, and the order `N` Riemann sum for `fₙ`. Since the convergence is uniform, for any `ε > 0`, there exists `M` such that for all `n ≥ M`, we have `|fₙ(x) - F(x)| < ε`, regardless of what `x` is.
So the difference between the Riemann sums will be:

`| (Σ (i=1 to N) fₙ(xᵢ) Δx) - (Σ (i=1 to N) F(xᵢ) Δx) | ≤ Σ (i=1 to N) |fₙ(xᵢ) - F(xᵢ)| Δx < Σ (i=1 to N) ε Δx = N × ε × ((b-a)/N) = ε (b-a)`.

Cool! That means that we can *simultaneously* show that `F` is integrable (by comparing its Riemann sums to those of `fₙ` for large `n`), and that the integrals of the `fₙ`s converge to the integral of `F` (by the same reasoning). So uniform convergence should do it all for us!

**SOCRATES:** Exactly right! So let's finish strong with a proof!

"
