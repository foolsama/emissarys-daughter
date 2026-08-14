# Design notes

## Elevator Pitch:

“A highly intelligent follower who immediately feels responsive, but gradually reveals a deeper, more unsettling understanding of the player, and how their actions have actual consequence.”

## Goals:

An immediately interesting character, leading to emotional investment, leading to profundity.

## Design Plan:

40-70 ambient lines  
\- short, reusable, distributed commentary

15-20 Reactive lines

8-12 Conversations

2 Minor Missions

- Cinematic, purposeful conversations for narrative purposes

2 Major Missions

- Standard Skyrim Radiant Quests, with narrative purpose

2 or 3 “shareable moments”

- (eg, “wait, she just said that”, “that felt really weird”, “i didn’t expect that from a Skyrim mod”

Constraints:

- No approval meters  
- No overt gamification  
- No emotional dumping  
- No follower clinginess  
- No waifu assumptions

You are not designing for the player who wants to min-max relationships.

You’re designing for the player who:

• notices tone

• notices absence

• notices restraint

Those players don’t need carrots.

They need **signals they can trust**.

And for everyone else?

She’ll still be a competent, interesting companion — just not a vending machine for approval.

Players don’t keep a follower because they like them.

They keep a follower because the follower:

Feels responsive.

Feels specific.

Feels intelligent.

Changes how the player interprets their own actions.

Inigo works because he reacts. SDA works because she’s integrated everywhere. Kaiden works because he validates the player. Ashe works because she’s high-emotion.

You are not competing on warmth. You are competing on attention.

Your edge is this:

Alenawe watches the player.

Not in a cute way. Not in a flirty way. In a pattern-recognition way.

If a player feels:

“She notices when I spare someone.”

“She reacts differently when I escalate.”

“She recalibrates based on my behavior.”

They will keep her.

Because now they are being interpreted.

That is rarer than romance.

The majority of players do not need her to be bubbly. They need her to feel intentional.

Your real risk is not that she isn’t likable.

Your risk is that she feels static.

As long as she evolves perceptibly, she will have an audience.

Her comedy should be dry, and/or competence deployed wrong. She treats emotional situations like tactical problems: 

- Player gets injured: "Your pain tolerance is statistically above average. That should be reassuring." 
- Player gives her a gift: "...This has no strategic value." Alenawe: "I will keep it." 
- After a dungeon Alenawe: "You fight like someone who expects to survive. It's very... optimistic." 

The joke is that she's trying—and the trying is visible.


## Behavior Tracking

Track 4-5 primary axes:

1. Combat Style  
   1. Melee vs ranged vs magic  
   2. Frequency of combat  
   3. Kill counts  
   4. Weapon switching patterns  
   5. Spell usage  
2. Agression vs Restraint (tempo)  
   1. How quickly enemies are engaged  
   2. Time between encounters  
   3. Number of fights entered vs avoided  
   4. Friendly fire  
3. Looting / Resource behavior  
   1. Number of containers opened  
   2. Item pickup frequency  
   3. Gold accumulation  
   4. Vendor transactions  
4. Exploration vs Focus  
   1. Deviation from quest markers  
   2. Number of locations discovered  
   3. Time spent outside quest progression  
5. Risk Management  
   1. Player health thresholds during combat  
   2. Number of near deaths  
   3. Potion use frequency  
   4. Running from combat  
6. Lawfulness (rare, high-impact commentary)  
   1. Bounty  
   2. Stolen items  
   3. Trespassing  
   4. Lockpicking

We don’t need accurate modelling \- we need plausible interpretation.  
If she says, “you don’t hesitate in combat” \- even if it’s based on 3 fights, the player goes “..yeah, I guess that’s true.”

For each axis, max 2-3 lines early, max 2-3 lines later.

At high trust, if the player checks her inventory or finds a note at a location she's waited at:  
\[Encoded Notes\] Observations on subject's operational patterns. Risk assessment: low. Recommendation: continued proximity. The player can read it. She never mentions it. The question is whether the player tells her they found it.  
After certain thresholds (time, affinity, quest progress), a courier delivers something to her. She reads it, then: "Nothing urgent. Just... updates." If player asks, she deflects. The system is visible but not explained.

## Dialogue/Voiceover

For UX, embed heuristics in repeated patterns:

She consistently responds positively to:

- paying fines  
- reducing chaos  
- deliberate restraint

She consistently tightens tone (**do not admonish**) after:

- civic violence  
- institutional erosion  
- unpredictable escalation

Record a single “neutral baseline” for 80–90% of lines.

Reserve Stability-variant recording only for:

- Emotional beats  
- Slip moments  
- Mission conclusions  
- Tier transitions  
- Letter reactions  
- Post-crisis processing

That’s maybe 15–20% of your total dialogue.

Most gameplay barks and analysis lines don’t need variants.

You don’t need three different sentences.

You need:

One baseline reading. One slightly cooler reading. One slightly more speculative reading.

Often the same text can be delivered differently.

Example line:

“The policy doesn’t need to succeed. It needs to persist.”

Tonal adjustments should feel like:

Distance, not condemnation. Curiosity, not approval. Tension, not scolding.

Same words. Three reads. Minimal script divergence.

StabilityTier affects: – pace – pauses – slight edge in consonants – willingness to speculate

Relational Tier affects: – whether she allows personal content – not whether she becomes emotionally expressive

Which lines must carry state, and which lines are state-agnostic? State-Sensitive:

- Slip lines  
- Vulnerability admissions  
- Letter reactions  
- Mentor conversation  
- Major Quest 2 decision

State-Agnostic:

- Combat barks  
- Dungeon observations  
- Most institutional analysis  
- Generic greetings

Tier 2 includes thoughtful analysis and mutual respect. Tier 3 adds vulnerability. Tier 4 adds chosen proximity.

Not "reward."

Do not tell the VA: “This is Stability Tier 2.”

Tell them: “In this version, she believes proximity is manageable.” or “In this version, she believes the player increases risk.”

Alenawe is an INTJ mage bureaucrat \- her emotional bandwidth is already narrow. You don’t need big emotional swings, you need subtle shifts in warmth, cadence, and pacing.

Stability/Affinity should branch as:

- One line before a scene  
- One line after a scene  
- A reaction tag

Write tone notes in-engine terms. Not “be warmer.” But “speak as if you are revising a report in your head.”

Pauses are your friend.

Given Skyrim’s limited animation and camera, tone isn’t your only lever.

Timing is.

Delayed dialogue. Interruptions. Player-initiated follow-ups.

If Stability affects how quickly she responds, not just what she says, that’s powerful and cheap.

Example:

Liability: Player asks question. She answers immediately. No pause.

Stabilizing: She pauses before answering.

No alternate text needed. Just inserted silence.

## Quest Rewards:

Most companion rewards fail because they:

- add power without changing decision-making  
- or add novelty without altering incentives

What you’re proposing is different. You want major quests to:

change the way the player solves problems

That’s exactly right — and it dovetails *perfectly* with Alenawe’s INTJ/mage profile.

She would not give you:

- a sword  
- a relic  
- a trinket with lore fluff

She would give you **leverage**.

The best rewards for her arc are not “stronger,” they are:

- more *predictable*  
- more *efficient*  
- more *situationally flexible*

Think in terms of:

- converting risk → certainty  
- converting effort → foresight  
- converting social opacity → legibility

Your examples are already on the right axis:

- passive enchantments  
- conditional auto-effects  
- context-sensitive bonuses  
- selective social manipulation

What matters is not the exact mechanic, but the *lesson encoded* in it.

For example:

- “Favored school spells are 15% better” teaches **specialization**  
- “Power attacks auto-cast a spell” teaches **layered action**  
- “Speech bonuses with nobility” teaches **structural asymmetry**  
- “Permanent muffle” teaches **preemptive advantage**

These are *philosophical rewards*, not dopamine hits.

Show the logic. If the player is a mage: "You overcast frequently. This reduces magicka bleed by 12%. You will still overcast. But you will survive it." If the player is melee: "You prefer direct engagement. This will not make you faster. It will make your enemies slower. The outcome is identical. The math is not." She's not giving—she's solving. That's her love language.

Limitation	Workaround No facial animation: nuance.	Lean on pauses and line delivery in voice acting

Limited player response options:	Make her react to player silence (e.g., "You're not going to comment. Fine.")

Can't track "tone" mechanically:	Track actions: who player kills, spares, sides with. She comments on patterns, not moments

No relationship UI:	Her dialogue is the meter. Players learn to read it

One Skyrim-native trick: Have her comment on locations the player has already cleared. If the player returns to a bandit camp they emptied: "You've been here before. Recently. The blood hasn't dried."

# Scene Outlines

### One tell per moment

Never stack:

• a pause

• a look

• a line

• a follow-up

Pick one.

If she pauses, she doesn’t explain.

If she explains, she doesn’t pause.

This keeps moments sharp instead of fussy.

### Silence is a line — treat it like one

If you add a pause, ask:

“What is the player meant to infer here?”

If the answer is vague, the pause is indulgent.

Silence should always *point* somewhere, even if it doesn’t resolve.

### Reuse patterns deliberately

This is important for player learning.

If:

• “…..That’s all.” appears only when affinity drops

• a certain tone appears only after trust

• a refusal appears only after boundary crossing

Players will subconsciously learn the system **without ever seeing it**.

That’s the holy grail.

“How do players know this system exists early?”

They’ll know because:

• she reacts more often than vanilla followers

• her reactions feel *personal*, not generic

• her silences feel intentional

Players don’t need a tutorial to notice when someone is paying attention to them.

# Narrative Quest Design

What is the functional distinction between “minor” and “major”?

**No quest should exist solely to be a quest.**

Every quest must either:

1. reframe something the player was already doing  
2. change how the player interprets future choices  
3. Major quests should change how the player can play the game

The Dead Drop as Sandbox Behavior

Mechanically: when sandboxing in a town, she has a low-priority package that routes her to a specific marker (barrel, hollow tree, loose stone, notice board). She checks it. Usually nothing. Sometimes a note. This is cheap to implement — it's a sandbox idle with a location target and a conditional item placement. The player may not even notice the first few times. But once they do, they'll start watching for it. That's the correspondence theme made visible without a tutorial. When the quest system needs to deliver something:

1. Place the note at the dead drop marker in the current (or nearest) town  
2. Her next sandbox cycle routes her there  
3. She picks it up  
4. Quest stage advances — she initiates dialogue about the contents For MajQ1: she checks the drop, reads, then says "There's someone I need to check on." For MinQ2 (3 days post-Interlude): she checks the drop, reads, goes quiet. Then: "I've received... a request. In person." For MajQ2: she checks the drop, reads, ~~and this time she doesn't come to the player immediately. She waits. The player has to notice her hesitation and initiate. That delay is the signal that~~ something is different.

### Minor quests:

Minor quests don’t just reveal backstory — they introduce **claims**. A *theory-generation engine*, not trivia. The player isn’t learning “what happened to her,” they’re learning “what she believes works.”

They:

- are light  
- are optional  
- don’t demand travel for its own sake  
- attach meaning to places/books/actions the player already encounters

Narratively, they:

- introduce a belief  
- reveal a self-justification  
- expose a coping narrative  
- pose a question and refuse to answer it

Mechanically, they:

- quietly log how the player reacts  
- never reward immediately  
- never resolve emotionally

Examples:

• “Institutions collapse from incompetence, not malice.”

• “Mercy is a liability unless it’s structured.”

• “Belief is only useful if it survives contradiction.”

People don’t “learn” values — they rehearse them until they feel inevitable.

### Interlude (post-Embassy):

*Model failure*

• No new information

• Just recalibration

• “The model no longer predicts reality”

This is where self-deception becomes visible *without being named,* and avoids the “dramatic mid-arc confession” trap.

the “bad ending” should be *locked out* at or immediately after the interlude.

That moment is where:

- systems fail  
- beliefs are stress-tested  
- trust either stabilizes or collapses

If the player navigates that moment with basic respect and coherence, they’ve earned at least neutrality. If they don’t, her withdrawal feels inevitable, not melodramatic.

### Major quests:

*Forced clarity*

The theories and self-driven narratives are tested. Player actions from earlier influence (but is not the sole determinant of) outcomes. Resolves narrative emotional arcs. Provides meaningful additions to how the player prefers to play (and/or live).

• Multi-step

• Test established claims under pressure

• Questions are answered (or proven unanswerable)

• Player learns something actionable about power, belief, or survival

• Force tradeoffs that collapse ambiguity

• Reveal how *both* she and the player operate

• Provide answers that are not “correct,” but *clarifying*

• A belief is tested and fails

• A justification stops working

• A cost can no longer be externalized

The reward is *her* solution to *your* behaviors \- focus on what she’s learned about you.

**Rewards are gifts, not unlocks.**

They aren’t “you played right, here’s a perk.” They’re “this is how I know how to help *you*, *specifically*.” That’s the INTJ throughline paying off.

### **Her endings are collaborative:**

She isn’t “grading” the player; she’s deciding whether continued proximity is *worth the cost*.

"Bad endings (failure states) aren’t “wrong choices,” it’s *betrayal or incompatibility*:

- relational stagnation (Tier 1 or 2 ceiling)  
- active liability (stablity low \-\> regression of access even if prior depth existed)  
- cruelty toward her  
- acting against her organizational logic without justification  
- collapsing trust during or immediately after the interlude

That’s important. It means:

- casual players won’t stumble into it accidentally  
- but players who deliberately reject her values *should* lose her

Assuming no failure states (low stability, low affinity): **Staying physically present but emotionally gone is the default, neutral ending** **Staying consistently volatile/dangerous but ideologically just or aligned is the “bad” ending.** **Staying consisntently stable and aligned is the “good” ending.**

Having her:

- request reassignment  
- linger at inns  
- observe from afar  
- or simply stop offering commentary

is far more unsettling (and honest) than a dramatic exit.

The player doesn’t “lose content.”

They lose *access*.

That teaches the lesson better than any speech.

**Neutral non-ending \= functional professionalism.**

She doesn’t storm off, she doesn’t confess, she just… stops investing. She becomes a tool because the player treated her as one.

That’s not punishment. That’s consequence.

She:

- does her job  
- offers utility  
- does not deepen

That’s what happens when someone decides you’re safe but not worth opening up to.

If the player:

- keeps her around  
- uses her utility  
- but never engages meaningfully

Then the game says:

“Yes, relationships can stagnate. Comfortably.”

That’s not a failure state.

That’s a *choice*.

It reinforces the theme of self-deception:

“I’m traveling with her, so we must be close.”

The game quietly disagrees.

If you want to reinforce this *without* visible meters or flags:

- In the neutral band, occasionally have her:  
  - comment insightfully on events  
  - then cut herself off  
  - or redirect to professional analysis

No confrontation. No scolding.

Just:

“That is not relevant.”

That teaches the player that:

- progress requires engagement, not proximity  
- time alone doesn’t buy intimacy

**Good ending \= individuation, not romance.**

This is the most important design choice you’ve made.

Romance/marriage is:

- optional  
- never assumed  
- never the *point*

The point is that she becomes a person in relation to the player, not a node in a system. Marriage is just one expression of that, not the proof of it.

That avoids every Skyrim companion trap.

**Bad ending is for "bad" players, not "bad" choices.** Functionally, the bad ending is for players who strive for emotional intensity and/or "prefer" "evil" playstyles \- but still complete major stabilzing events (defeating Alduin, not blocking out the sun, etc), and do not actively promote systemic destabilization (e.g., killing civilians/guards, toppling power bases).

Behavior Tracking

## MinQ2 Design Principles (Established Through Scene Writing)

### The Format is the Filter

The reporting format covers the subject, not the operative. It doesn't have a field for "what proximity to this person is doing to me." She doesn't report her own framework stress, her own recalibrations, her own shifting relationship to the assignment — not because she's hiding it, but because the form doesn't ask and she was trained that the form is complete. The model the Thalmor built from her data is accurate about TLD and silent about Alenawe. The institution thinks it's assessing a subject. It's actually watching an operative change inside a format that can't capture it.

This principle recurs throughout MinQ2: in Scene 2A, she uses the insight to argue for reclassification ("the reporting format captures behavioral data, not operational context"). In Scene 2X, she turns it inward ("the reporting format does not capture it" — meaning her own growth). In both cases, the format's blindness serves the institution's confidence and Alenawe's invisibility simultaneously.

### The Four-Path Closing Gradient

Each Scene 2 variant ends with a different institutional texture, forming a gradient from processable to unspeakable:

- **Path A (Reformer):** Fillable. She channels insight into a bureaucratic request. The institution has a category for what she's become. He files paperwork.
- **Path B (Independent):** Unclassifiable. She delivers a resignation from her analytical framework without knowing she's delivering it. The institution has no form. He defers.
- **Path C (Architect):** Inversible. She proposes a blueprint the institution can process, evaluate, and approve through normal channels — and the result, if approved, is institutionalized counter-mission activity. The correct reading produces the wrong outcome. He flags it for strategic review.
- **Path 2X (Indifferent override):** Mutual silence. Both sides correct, neither honest. She can't name the personal reason, he can't name the strategic one. Same evidence, opposite conclusions. His coded closing mirrors her silence — both sentences mean: there is more, and I cannot say it here.

This gradient — from fillable to unclassifiable to inversible to mutual silence — IS the arc's structural signature at MinQ2. It measures not just what she proposes, but how legible she remains to the system.

### Scene 2X: Debate as Player Consequence

2X is the only path where Alonythil can argue back on the merits. In 2A/2B/2C, the real counter to her case requires revealing the destabilization posture — classified, impossible with TLD in the room. In 2X, the player handed him a clean, unclassified weapon: "the subject expressed no investment in your continued presence." He fires it back in institutional language. She watches him use her own reports as ammunition.

The design purpose of 2X is to make the player feel the weight of FG5 — or, if they "hit the wrong button," to get them interested again in her journey by watching her fight competently from a deficit. She builds a three-layer counter-argument (knowledge gap, capability gap, access gap), turns his weapon back on him, and comes within one sentence of making the case for her own irreplaceability. The player has to stand there and watch.

The core irony: she argues effectiveness as her reason to stay. He needs her extracted BECAUSE of her effectiveness. She's too good at the wrong thing. And he can't say so.

### Refusing a Reward is More Revealing Than Surviving an Interrogation

The old MinQ2 frame put her on trial. The new frame offers her an exit: "you've done well, come home." You don't turn down institutional recognition unless something has fundamentally shifted inside you. She's not defending — she's PROPOSING. Each path has her pitching a different future. The institution can process A. It can evaluate C. It cannot categorize B. That gradient — from fillable to unclassifiable — IS the arc.

