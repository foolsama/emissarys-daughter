# First Minor Mission

### Before State:

Her starting belief: Skyrim is crude but functional.

Pre-DI Alenawe is "just a follower" at this point. This is curiosity: "How do you do this? I want to understand."

Post-DI (If the player recruits her late, or just ignores her), this is urgency: "How do you do this? I *need* to understand."

### The Core argument

In Alinor, institutions use correctness to delay access until a person is legible. In Skyrim, institutions use danger to force a person legible immediately.
And the player keeps passing.
She is wrestling with the fact that Skyrim’s gates seem designed to discover capability, while hers may be designed to manage it.

At this point, she still does not consciously know correctness is control. She should only be close enough to the edge to notice:
•	Alinor delays
•	Skyrim tests
•	the player keeps passing
•	her training does not explain why that works

**Alonythil kept her in a place where nothing happened. Then, by stress and miscalculation, he placed her next to someone with consequences.**

That means the player’s role is very precise:

Not revelation, not salvation, not teacher; proof.

The one sentence she almost reaches but does not say:
A gate tells you what a system is afraid of admitting.
•	in Skyrim, the fear is incompetence under pressure
•	in Alinor, the fear may be unpredictability
She should not fully articulate that yet. But the conversation can circle it.

### What Diplomatic Immunity breaks:

Even a refined institution abandons its own stated logic when stakes become real enough.

Before DI, she can still think:
•	Alinor sorts more carefully
•	Skyrim sorts more brutally
•	both may still be trying to find the right people

After DI, that defense becomes unstable, because now she has seen:
•	protocol bypassed from inside
•	correctness patched around after the fact
•	institutional behavior driven by pressure, not principle

That is when the earlier MinQ1 thought mutates into something worse:
If both systems bend under stress, then perhaps the gate is not for truth. Perhaps it is for management.

### After State:

Player witnessing someone think for themselves for the first time, and wondering what happens if you encourage it.

The thought that bridges forward: If crude systems can still diagnose real capability, what exactly are refined systems selecting for? She does not answer it yet. She just cannot stop asking it. If it's true, then refinement may not be improvement. It may simply be delay.

## Mechanics

Idle dialogue on 1st sandbox after reaching Affinity 1.
•	In a Topic Info Fragment on the idle line: MinQ1_IdlePlayed.SetValue(MinQ1_IdlePlayed.GetValue() + 1)
•	Add condition: GetValue MinQ1_IdlePlayed < 3 — allows up to 3 plays
•	Once the player follows up and completes the conversation topic, set MinQ1_IdlePlayed to 99 (or any value ≥ 3) to suppress it permanently

For the follow-up topic:
•	Separate Conversation topic: "What was that?"
•	Condition: GetValue MinQ1_IdlePlayed >= 1 (she has said it at least once)
•	Additional condition: GetValue MinQ1_Complete == 0 (conversation not yet had)

## Dialogue

1.	Idle opener (already designed — the leaked thought + banal redirect). Pre-DI, she is processing the player. Post-DI, she is processing everything, and the player is the most legible data point she has left.
2.	Player follows up: "What doesn't make sense?"
3.	She elaborates reluctantly — comparing the player's problem-solving to how she was trained. This is where "procedures, correct approaches, institutional methodology" gets articulated. Not as a lecture — as her trying to explain why the player shouldn't work.
4.	Player choice point 1: how the player responds to her framework (engage / dismiss / challenge)
5.	The Slip — Pre-DI: She crosses from recitation to observation accidentally. Post-DI: the same line hits differently because she has already watched a policy fail. She is not discovering the thought. She is admitting she already had it. The Slip becomes less "I shouldn't have said that" and more "I've known this for a while." 
6.	The Catch — Pre-DI: the mask snaps back convincingly. She reroutes cleanly. Post-DI: the catch is weaker. She tries to reroute, but the player can see it doesn't hold as well. The mask is already damaged. She knows it. The transparent redirect becomes almost painful post-DI because she is reaching for composure she no longer fully has.
7.	Player choice point 2: how the player responds to the slip (press / let it go / name what happened)
8.	The foreshadowing beat — one line where she reasserts her framework. Pre-DI: genuine belief, slightly defensive. Post-DI: she is patching. She just watched the correct approach fail at the Embassy. Saying this post-DI is her rebuilding a wall she knows has a crack. The player should hear it and think: "She doesn't believe that as much as she used to."
9.	Close — she ends the conversation. Not warmly. Cleanly.

Two Topic Info lines for the beats where register shifts — gated on a DI-completion condition (probably GetStageDone MQ201 200 or your interlude tracking variable). Same conversation flow, but:

| Beat | Needs variant? | Why |
|------|----------------|-----|
| Idle opener | No | Works in both contexts |
| Player follow-up | No | Same prompt |
| Elaboration | Yes | Curiosity → urgency |
| Player choice 1 | No | Same options |
| The Slip | Yes | Discovery → confirmation |
| The Catch | Yes | Clean reroute → weak reroute |
| Player choice 2 | No | Same options |
| Foreshadow | Maybe | Same line, but delivery changes — could be one line with different VA direction, or two takes |
| Close | No | She ends it cleanly either way |


### Beat 1 - Idle Opener

Alenawe:
*\[Quiet, controlled intensity\]*
"No, it still doesn't make sense. There are procedures, niceties that need to be observed. Did they post me here just to come see the violence inherent in the sys--- .... So, this is a nice place."

### Beat 2 - Player Follow-Up

Player then needs to pursue the conversation and activate Alenawe, which opens a new topic branch:
"What doesn't make sense?"

### Beat 3 - Elaboration

#### Pre-Diplomatic Immunity

Alenawe:
*\[Deciding how much to say. Not reluctant — calculating.\]*
"The access you have makes no sense to me."
*\[Beat.\]*
"Every institution here has asked you to do something implausible first. Something dangerous. The kind of task that cannot be faked and cannot be delegated."
"in Alinor, access is built. Correctly. Gradually. You demonstrate reliability. You wait." 
"Here, they assign you an impossible errand. You survive it: you belong."
[Beat. A conclusion she does not like arriving at.]
"That should be a poor way to sort people."
"It keeps working."

#### Post-Diplomatic Immunity

Alenawe:
*\[More direct than usual. Less filtering.\]*
"I used to think the way things work here — ordeal as proof, survival as credentialing — was an adaptation. Dangerous land. Short lives. No time for proper process."
*\[Beat.\]*
"Something broke recently that suggests... it isn't local."
"When the situation became untenable, I watched people who know better stop following procedure."
[Beat.]
"And it worked."

### Beat 4 - Player Choice 1

"And what do you make of that?"
[+Affinity]
*\[The next beat should feel natural, invited.\]*

"And this surprises you?"
[Minor Affinity +]
*\[The next beat should feel reactive; she'll over-correct.\]*

"You've been watching me very closely."
[minor Affinity +, minor Stability -]
*\[Flirty/Neutral - corrects the frame, continues anyway.\]*

"Ah. I don't need the analysis."
[-Affinity]
*\[Dismissive/Negative - the next beat should feel compulsive: she was told to stop and won't.\]*

### Beat 5 - The Slip

*\[The Beat 4 response colors the delivery but not the content:\]*

**Branching**
If the player was Flirty/Neutral [She corrects the frame first. Briefly.] 
"I've been analyzing a pattern. It happens to involve you." 
[She resumes. The correction cost half a sentence.] 

If Dismissed:
[Miffed. This line is an interruption of a continuing thought.]
" - you asked -"

**Continues**
"Here, the question closes."
[Beat.]
[Quieter] "In Alinor... they never stop deciding about you."
[She stops. Not because of the dismissal. Because she heard herself.]

### Beat 6 - The Catch

[She files it. The mask back without visible effort. This is practiced.] 
"...An academic observation. [Extra pause post-DI] Nothing actionable." 
[A small shift. Not dramatic — efficient. She's closing the topic.] 

### Beat 7 - Player Choice 2

"That's not academic - what did you mean?"
[minor Stability -]

"Sounds about right."
[minor Stability +]

"Academic is it? Perhaps we can talk about it over some wine?"
[Minor Affinity +]

### Beat 8 - Foreshadowing

If the player pressed:
"This isn't the time." [Continues]

If player was flirty:
"Hmph. It would take a *lot* of - no."
[Exasperated - may need separate pre- (accepting the tease) and post-DI (more frustrated) takes] "All I'm saying is ..."  [Slight readjustment, continues.]

Neutral/dismissive (or continued):
[VA Notes: Need two versions of this line. Pre-DI: genuine. She believes this. The defensiveness is minor. Post-DI: she is reconstructing. The line is slightly slower/heavier. The player should hear the effort in it.]
"The correct approach produces the correct result. That is the point of having one."

### Beat 9 - Close

"In any case, this line of thinking requires more testing."