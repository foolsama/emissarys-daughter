# Conversations with Alenawe

# Purpose

These conversations are "filler with intent." They're outside the mod's quests, have more depth than locational or game-related idle remarks, with an aim to bring more relatability and "living feel" to an NPC \- while still serving the mod's contract.

# Design Principles

These conversations never resolve tension. They explore, refine, reflect.  
Actual movement happens elsewhere.

The metric for success is **"Interesting, and/or revealing in hindsight."**

The balance we're looking for is:

– enough "noise" to feel human  
– enough structure to feel intentional

Alenawe will speak more freely with higher affinity.

Each of these should appear at least twice, with the following progression:

1. Control/Deflect (early)  
2. Answer/Controlled allowance (mid)  
3. Selective disclosure/Connection (late)

If a player just wants to "gab," the experience should be:

**Early:** "She's humoring me."

**Mid:** "She's actually engaging."

**Late:** "She's choosing to talk to me."

She doesn't get overwhelmed.  
She manages the interaction.

Some patterns she can use:

**A) Redirecting**

Player: "Tell me about yourself."

Alenawe: "That depends on what you're trying to learn."

She makes them specify.

**B) Reframing**

Player: "Do you like Skyrim?"

Alenawe: "It is functional. That is not the same thing."

She answers—but on her terms.

**C) Containing**

Player: "Come on, just relax."

Alenawe: "I am relaxed. This is what that looks like."

This is very on-brand.

**D) Rewarding good questions**

If the player asks something precise:

Alenawe: "…That is a better question."

That's how she shows approval.

The trick: **let the player feel the change.**

Don't announce progression. Let the player notice:

– She answers longer  
– She asks follow-ups  
– She references past conversations  
– She admits uncertainty (rare, but powerful)

**Constraint:** Don't unlock all "late" variations at once.

* Each topic upgrades independently  
* Some lag behind others  
  This makes her feel uneven, which reads as human.

**For each conversation, ask:**

Could this be said by any smart NPC?  
→ if yes, it's too generic  
Does this sound like someone managing the conversation?  
→ if no, it's not Alenawe  
Does the late version feel like she chose to say it?  
→ if no, it's too passive

Mechanically, we can gate topic info (and therefore branches) behind conditionals.

For example, after an affinity threshold is achieved, the "where are you from" question may have a new top-level Topic Info available, "So you said you were from ..." or "Tell me more about ... " \- OR Alenawe may initiate with a new greet line.

For organizational sake, there are 4 "buckets" of conversation:

* Player analysis  
* Power Narrative vs Reality  
* Institutions vs Individual  
* Personal Friction/Small Talk

Followup branches should be selective, not exhaustive.  
Flirt branches should often appear alongside one or two non-flirt branches so the player can declare intent.  
Some branches should disappear after use.  
Some should recur in upgraded form later.

At first ask, show 2 or 3 followups max.  
Usually one curious/probing, one dismissive or practical, and sometimes one flirt.  
Once one is chosen, the others vanish for that state.  
At the next affinity tier, the topic can reappear with a refreshed set.

Curious branches are the most consistently available.  
Dismissive or teasing branches appear when relevant, but not always.  
Flirt branches should be visible early enough that the player can test the boundary, but not on every single topic.  
Reciprocal flirt branches should be tightly gated and somewhat sparse, so they feel earned rather than inevitable

## Affinity Scoring Conventions

Used in the followups below. Values are in the live 0-100 affinity scale.

* **\[+2\]** light approval — she registered it  
* **\[+3\]** clean question, deserves engagement  
* **\[+5\]** rare; where the player named something she didn't expect them to notice.  
* **\[-2\]** flat / careless / dismissive  
* **\[-4\]** rude or shallow flirt at the wrong tier  
* **\[0\]** noted, no movement  
* **Pacing rule:** dialogue deltas here are intentionally small; this document should not, by itself, carry most players to Tier 4\.  
* **Flirts:** Early flirts trend negative or neutral. Mid flirts neutral. Late flirts can land positive *if* precise.

## Gating Framework

Use these as CK condition shorthand when placing TopicInfos:

* **Immediate / Early pool:** no affinity requirement  
* **Mid pool:** fSSEED\_Affinity \>= 1  
* **Late pool:** fSSEED\_Affinity \>= 3  
* **Reciprocal flirt variant:** fSSEED\_Affinity \>= 3 **and** Stability tier is **Stable**  
* **Deep-ideology topics:** require quest progress in addition to affinity (examples noted per question)  
* **IdleSpoken gating:** some lines can be gated behind her having said the corresponding remark to the player at least once.

# VA Direction

Suggested to go through and do all **early** lines first, then **mid**, then **late**. Early Alenawe is very clipped and controlled (Cool, professional tier). Mid Alenawe is more open, but still measured (amicable co-worker). Late Alenawe is more relaxed, and may even show a hint of playfulness or warmth in the right moments (true friendship to courting).

|  |
| :---- |

# Player Analysis

## Design Principles

**Purpose:** She studies the player as a variable.

**Constraint:** Always framed as observation, not praise or criticism.

**What this lane does:**  
– grounds her in the player  
– shows pattern recognition evolving  
– reinforces that she respects behavior, not words

## Conversations

### 1\. "So. What have you observed of me so far?"

**Gating suggestion:** Available 3-5 days after recruitment. Mid/Late variants upgrade by affinity only (\>=1, \>=3).

**Alenawe (Early):** "Undetermined."  
**Alenawe (Mid):** "Capable, or very fortunate."  
**Alenawe (Late):** "You certainly have a way of getting things done."

**Followup layer (optional branches):**

* **Curious:** "Any notes, comments, advice?" \[+3\]  
  * Early: "Too soon to say."  
  * Mid: "Still counter to my purpose, here."  
  * Late: "For you? I wouldn't presume."  
* **Pressuring:** "Can you tell me this mysterious assignment yet?" \[-1\]  
  * Early: "You've become someone worth watching. Thus, I am watching."  
  * Mid: "You're moving in many circles of power. It's important to know how, and why."  
  * Late: "I'm still deciding whether it's relevant any more."  
* **Flirt:** "You notice more than you admit." \[+3\]  
  * Early: "Quite."  
  * Mid: "I find silently listening an overlooked lever."  
  * Late (Reciprocal, Affinity \>= 3 and Stable): "It is amusing, watching you puzzle it out."

### 2\. "What does it matter if I draw attention to myself?"

This conversation is not about whether the player can handle danger.  
It is about whether the player understands the cost of becoming illegible to institutions — and whether they care what that does to her.

**Gating:** Opens only when a *new* warning has fired since the player last raised this topic — it tracks ongoing behavior, not on-demand repetition. **This topic is the exception to the affinity Early/Mid/Late pattern:** the prompt that appears is driven by Alenawe's current warning level (Warned), echoing her escalating scene warnings. Affinity only colors the followups.

**Warning ladder → departure.** The warning scene escalates Warned 1 → 3, each step a colder register: procedural → optics → her own position → personal. This is *not* open-ended. Per the Affinity System's **Strategic Withdrawal** (the Escape scene):

* At **Warn 3** \+ a qualifying destabilizing event, if Stability has reached **Strategic Liability** and affinity is too low to offset it, she **leaves for good**. For most players, **Stage 3 is the last version of this conversation they will ever see.**

| Her scene warning | Prompt | Warned | Register |
| :---- | :---- | :---- | :---- |
| "This draws attention." | Stage 1 | 1 | procedural |
| "This is going to read wrong." | Stage 2 | 2 | optics |
| "I cannot account for this." | Stage 3 | 3 | her position — *withdrawal may fire here* |
| "You are making this very difficult…" | Stage 3 | 3 | personal — *high affinity version* |
| "If you insist on this pattern, I cannot remain." | Stage 3 | 4 | Final warning before ghosting |

|  |
| :---- |

**Stage 1 — procedural** *(Warned \== 1\)*

**Player:** "What does it matter if I draw attention to myself?"  
**Alenawe (Early):** "It benefits you not at all to make enemies of the institutions you walk within."  
**Alenawe (Mid):** "Power opens many doors for you. Many of them make your life easier. Some, much more difficult. The rewards behind the difficult doors are never worth the cost."

**Stage 2 — optics** *(Warned \== 2\)*

**Player:** "'Read wrong,' 'Draws attention' \- you care too much about what other people think."

| \*\*Alenawe (Early):\*\* "Because every needless spectacle narrows your options." \*\*Alenawe (Mid):\*\* "Institutions assign categories before they ask questions. Do not hand them ‘liability.’" \*\*Alenawe (Late):\*\* "You are strong enough to endure a bad reputation. Still, I would rather see what the right one might make possible." |
| :---- |

**Stage 3 — her position** *(Warned \== 3\)* — *withdrawal threshold*

**Player:** "What do you think is going to happen if you 'can't account' for my choices?"

| \*\*Alenawe (Early):\*\* "At the very least, my role as 'participating' observer will end." \*\*Alenawe (Mid):\*\* "It means I cease to be a positioned observer and become a liability to be corrected." |
| :---- |

**Player:** \[Affinity \>= 4\] "I thought you *with* me."

| \*\*Alenawe (Late):\*\* "Your earlier patterns suggested restraint. This is ... disconcerting." |
| :---- |

*Followups:*

* **Stage 1 challenge:** "So I’m meant to spend my life apologizing to guards and jarls?"  
  **Alenawe:** "No. You are meant to recognize which frictions are unnecessary."  
* **Stage 2 dismissive:** "I care very little how things ‘read.’" \[-2\]  
  **Alenawe:** "That is a luxury enjoyed mainly by people strong enough to survive being misread."  
* **Stage 3 operational challenge:** "And if your people dislike it?" \[+2\]  
  "They stop using words like 'asset' and 'resourceful' and start using words like 'liability' and 'corrective actions'."  
* **Stage 3 personal challenge:** "If my choices are upsetting you so, then perhaps you should leave." \[-5\]  
  **Alenawe:** "If this is deliberate choice, then yes. I misjudged you more seriously than I thought."  
* **Shared Dismissive:** "Bah. I can handle it." \[-2\]  
  **Alenawe (Early):** "It may take an entire city's guard complement to stop you. Don't think I'll be on *your* side of that fight."  
  **Alenawe (Mid):** "That is precisely the problem. You can handle too much, and so you stop asking whether you should."  
  **Alenawe (Late):** "You already have the kind of power doors open for. There is no need to come through the wall when you have people willing to open it."  
* **Late Dismissive:** "What I was simply bored?" \[-4\]  
  **Alenawe (Early):** "Then you are far too dangerous to be this undisciplined."  
  **Alenawe (Mid):** "That is not better. It is worse."  
  **Alenawe (Late):** "A powerful person amusing themselves is rarely a private event. I would prefer your curiosity found less ruinous outlets."  
* **Shared Curious:** "So you think I should be more careful." \[+2\]  
  **Alenawe (Early):** "Obviously. I myself am here to observe, and will assist in an effort of protection. However, I will *not* be an accomplice to reckless thuggery."  
  **Alenawe (Mid):** "Even the Dark Brotherhood dislikes negative attention, much less the other guilds. The life of an outlaw cannot possibly serve your purpose.  
  **Alenawe (Late):** "Even if thuggery serves your purpose, wanton disregard destabilizes the world around you. That includes your own position. Discretion is *always* advisable."  
* **Shared Sarcastisc/Flirty:** "Then you *are* concerned\!" \[-2\]  
  **Alenawe (Early):** "I have my own reputation to guard."  
  **Alenawe (Mid):** \[Sighs\]  
  **Alenawe (Late):** "Noticed that, have you?"

|  |
| :---- |

# Power Narrative vs Reality

## Design Principles

**Purpose:** She talks about ideas she cares about.  
**Constraint:** Must tie back to something recent (don't let it become lecture mode).

## Conversations

### 3\. "When you speak about ‘story,’ you don’t mean Olaf and the Dragon, do you? "

**Purpose**: What is this woman intellectually interested in?  
**Gating suggestion:** Available after specific idle lines spoken, or one week.

**Alenawe (Early):** "Not specifically. I mean the account that tells people what an event means."  
	“A Jarl winning a battle is an event. Whether it proves courage, wisdom, or recklessness is the story.“

**Followup layer (optional branches):**

* **Curious:** "Is that what interests you?" \[+3\]  
  * Early: “Among other things. Decisions are easy enough to record. *Why people accept them* is considerably more interesting.”   
* **Dismissive:** "It's all just talk." \[-2\]  
  * Early: "Talk repeated consistently creates durability. That’s where power lives."  
  * Late: "You yourself are shaping the stories powers will tell for a long time. Caring what they say would seem a proper consideration."  
* **Flirt:** "Tell me a story, then." \[Early 0, Mid \+2, Late \+3\]  
  * Early: "Earn one."  
  * Mid: "You're in one. Pay attention."  
  * Late: "Yours has been more interesting than I planned for."  
  * Late (Reciprocal, Affinity \>= 3 and Stable): "There was once a mortal who became inconveniently difficult to classify..."

#### **Mid Player Open:** “You said stories tell people what events mean. Who decides the story?”

**Alenawe (Mid):** “No one, entirely. Though institutions spend considerable effort making one account easier to repeat than the others.” 

**Followup layer (optional branches):**

* **Curious:** "What if their story is wrong?”

**Alenawe:**”Institutions persist through continuity. A correction that breaks continuity can cost more than an error that persists.”

* **Challenge:** “That sounds like propaganda.”

	**Alenawe:** “Reports are filed one way, titles another, orders use approved terms. Eventually one account is the one the institution can act upon.”  
	“The distinction is usually intent. Administration can distribute a story without ever deciding to persuade anyone. ”

* **Personal:** “What story are you trying to tell?”  
  **Alenawe:** “I would prefer to understand the ones already being told before contributing another.”

#### **Late Player Open:** “You used to put a lot of weight on which stories endure. Do you still?”

**Alenawe (Late \+ Interlude):** “Less than I did.“  
	“Durability tells you that people have built something around a story. It does not tell you whether the story was ever accurate.“

**Followup layer (optional branches):**  
**Curious:** "Don’t you think it’s important to be factually accurate?”  
**Alenawe:** ”Personally? Of course. However, I'm no longer certain accuracy is what makes a story powerful.”

**Challenge:** “Then what makes a story work?”  
**Alenawe:** “Belief, initially. After long enough... consequence.”

**Durability:** “What happens when the story is shown to be wrong?”  
**Alenawe:** “If enough lives and institutions have been arranged around an account, correcting it means rearranging them.”  
	“Either the story changes... or reality is treated as the error.”

**Question:** “Who matters more: the one with power, or the one who decides its story?”    
**Alenawe:** “Assuming those are separate. I’m no longer certain they are.”  
“I’m beginning to think the act itself may be only part of the exercise.”  
	“Deciding what an exercise of power *means* may itself be an exercise of power.“

**Late Close:** “Where does that leave you?”  
**Alenawe:** “In revisions.” \[G\]

|  |
| :---- |

### 3B. "You never did say what you're a scholar of."

**Purpose:** Why is someone with those interests and skillsets actually following me?  
**Gating suggestion:** Available after MajQ1, Conversation 3, or Interlude. This is the gateway for the player to peel back Alenawe's cover story, as she's a little too ... tradecraft ... for a scholar. This conversation does not require her to reveal the truth. It gives her the opportunity to decide whether concealment remains useful, respectful, or necessary.

The same prompt can recur in an upgraded form if she initially conceals.  
Conversation 3B should establish a cover-knowledge state

I would track something like:

0: Player has not challenged the cover.  
1: Player challenged it; Alenawe concealed.  
2: Alenawe acknowledged that her role is broader than scholarship.  
3: Alenawe disclosed that she is reporting through Alonythil to the Dominion.

This is slightly different from tracking whether the conversation happened. It tracks what the player actually knows.

Her decision in 3B would depend on Affinity, Stability, and narrative timing:

After Conversation 3, she is most likely to conceal or partially acknowledge.  
After MajQ1, she has less room to deny the operational nature of her work.  
During or after the Interlude, full disclosure becomes plausible.  
She can still conceal from a volatile player even late in the arc.

That preserves her choice. The player creates the opportunity; she decides what access they receive.

The Interlude then has three possible introductions to the same operational route

If CoverKnowledge \== 0, the player can notice the contradiction here for the first time:

“You said you were a scholar.”

She gives a brief disclosure and moves into the report issue. This should not launch the full standalone 3B conversation inside the Interlude. Something like:

“I am. That does not fully describe my assignment.”  
“I was assigned to assess you. My work is reported through Alonythil.”

Then continue.

If CoverKnowledge \== 1 or 2, Alenawe voluntarily revisits the earlier evasion:

“You asked me before whether scholarship was the whole answer.”  
“It was not.”

That is probably the most relationally meaningful version. She is correcting an omission without being forced to do so.

If CoverKnowledge \== 3, none of that needs repeating:

“You know what my work requires.”  
“This is the first report I cannot submit cleanly.”

Then the conversation goes directly into what she will include, what she will omit, and why.

**Alenawe (Early):** “I am.”  
*\[Nothing in the answer is false. She knows it is not the answer being requested./\]*

**Player Follow-Ups \[EarlyPD1\]**

**PLAYER \[Precise\]:** “You speak like someone conducting an assessment.”  
**Alenawe:** “Governance is difficult to study without assessing it.”

**PLAYER \[Operational\]:** “You spend a lot of time outside a Jarl's hall for someone studying government.”  
**Alenawe:** “A Jarl's hall shows policy as intended. Following *you* gives me a better view of what happens when it reaches the governed.”

**PLAYER \[Challenge\]:** “That answer is doing a great deal of work.”  
**Alenawe:** “So is the question.”  
\[+3 Affinity gain. She recognizes that the player noticed the construction without claiming more than they know.\]

**PLAYER \[Direct\]:** “What aren’t you telling me?”  
**ALENAWE:**“Several things.”  
        \*\[Beat./\]\*  
        “You have not yet given me sufficient reason to reconsider that.”

**PLAYER \[Accusatory\]:** “You’re lying.”  
**ALENAWE:** “No. I am declining to satisfy an inference.”

**Early Close**

**ALENAWE:** “My education is genuine. My interest in governance is genuine. That is enough precision for now.”  
\[Conversation becomes available again after further cover pressure.\]

**Mid — Controlled Acknowledgment**

**ALENAWE:** “I am... though that does not fully describe my assignment.”

**Player Follow-Ups \[MidPD1\]**

**PLAYER \[Conversation 3 route\]:** “You talk about power as though someone expects you to do something with the analysis.”  
**ALENAWE:** “Analysis without application is decoration.” *\*\[She hears the evasion herself/\]\** “My work is reviewed.”

**PLAYER \[MajQ1 route\]:** "At the mine, you stopped caring once you understood the mechanism.”

**ALENAWE:** “The mine was functioning again.”  
**PLAYER:** “That isn’t what I meant.”  
**ALENAWE:** “No.” *\[She considers whether to continue./\]* “I was trained to identify structures, capabilities, and points of leverage. Resolution is sometimes the objective… Sometimes understanding is.”

**PLAYER \[Direct\]:** “Who reviews your work?”  
**ALENAWE:** “Alonythil.”  
**PLAYER:** “Your academic adviser.”  
**ALENAWE:** “He is that.”  
\[The omission is now visible rather than hidden.\]

**PLAYER \[Perceptive\]:** “So ‘scholar’ was the answer that let you stay near me.”  
**ALENAWE:** “It was the answer least likely to distort your behavior.” *\[Beat./\]* “That was important at the time.”

**Mid Decision Point**  
At this point, Alenawe may either contain the disclosure or continue.

If Affinity is insufficient or Stability is Strategic Liability:

**ALENAWE:** “You have correctly concluded that my work is not exclusively academic. That does not make every remaining conclusion safe to confirm.”  
        *\*\[She is not offended. She has assessed disclosure as an unjustifiable risk./\]\**  
        “That is where this conversation ends.”

If Affinity is sufficient but she is not ready for full disclosure:

**ALENAWE:** “I was sent to Skyrim to study governance in practice. Then, the subject became more specific.”

**PLAYER:**  “To me.”  
**ALENAWE:** “Yes.”  
\[This confirms that the player is her assignment without yet explicitly naming the Dominion as the recipient.\]

Late — Voluntary Reveal

**ALENAWE:** “I am.” *\[Beat. She chooses not to make the player extract the remainder.\]* “It was the truest answer I could give without giving you the useful one.”  
        “I was assigned to assess you, specifically. I report through Alonythil to the Dominion.”  
        “Scholarship describes my training; it does not fully describe my position.”

**Player Responses**

**PLAYER \[Plain\]:** “You’ve been spying on me.”  
**ALENAWE:** “Yes. *\[No euphemism. No defence. Slightly amused/\]* Observation conducted without the subject’s informed agreement would generally qualify.”

**PLAYER \[Recognition\]:** “I already knew.”  
**ALENAWE:** “You suspected.” *\[Beat.\]* “*Now* you know.”

**PLAYER \[Personal\]:** “Why tell me?”  
**ALENAWE:** “Because continuing to let you infer it would no longer be caution, it would be contempt.”

**PLAYER \[Practical\]:** “What have you reported?”  
**ALENAWE:** “Your movements. Affiliations. Methods. The kinds of problems you pursue and the kinds you ignore.”  
“Your use of force. Your restraint. *\[Beat.\]* My conclusions.”

**PLAYER \[Concerned\]:** “Everything I’ve told you?”

\[The followup should vary according to whether the Interlude has occurred:\]  
**ALENAWE:**   
Pre-Interlude: “No. I distinguish between observation and information given in confidence.”  
Post-Interlude: “No, and after the Embassy, I made that distinction much more aggressively.”

**PLAYER \[Challenge\]:** “You could have told me earlier.”  
**ALENAWE:** “Yes… I decided that preserving the observation was more important than allowing you to consent to it.”  
        *\[She does not hide behind instruction.\]*  
        “That decision benefited me… we will see what it costs.”

**PLAYER \[Exploitative\]:** “Then stop reporting.”  
**ALENAWE:** “That is not a decision you are entitled to make for me.”  
 “You may decide whether I remain near you. Do not confuse the two.”

**PLAYER \[Measured\]:** “I don’t like it. But I’d rather know.”  
**ALENAWE:** “That is approximately the response I hoped for.”  
        *\[A slight correction, because “hoped” revealed too much./\]*  
        “-The response I considered most workable.”

**PLAYER \[Agency-Respecting\]:** “What you report is your decision. Whether I trust you is mine.”  
**ALENAWE:** “Yes. That is the arrangement as it actually exists.”  
 \[This is the strongest positive response. The player neither absolves her nor attempts to command her.\]

**Late Close**

**ALENAWE:** “I am still a scholar.”  
        *\*\[Dry, but not defensive./\]\**  
        “I would prefer not to surrender the accurate part of the answer merely because the incomplete part has become inconvenient.”

**Post-Interlude Forced Variant**  
If the player has never raised Conversation 3B before the Interlude, the report discussion can unlock a sharper version:

**PLAYER:** “You keep talking about accounts, consequences, and what can be reported ... I thought you said you were a scholar.”  
**ALENAWE:** “I did. I had hoped to give you that answer differently.”  
*\[Not “I am.” She recognizes that the question is now about what she chose to conceal, not whether her education was real.\]*

**PLAYER:** “But you were never going to give it unless I noticed.”  
**ALENAWE:** “At first? No. *\[Beat./\]* Now, I am less certain.”  
\[She then enters the Late — Voluntary Reveal branch.\]

### ---

### 4\. "You think ill of the Daedra's gifts?"

**Gating suggestion:** Appears after Daedric bargain idle line spoken.

**Alenawe (Early):** "Efficient now. Expensive later."  
**Alenawe (Mid):** "It is a short-sighted mortal who sees an offered gift and fails to price the obligation. The Daedra are not in the business of charity."  
**Alenawe (Late):** "There is always a story one can tell about "necessity" and "reward". It is only the wise that think ahead to deal with the costs attached."

**Followup layer (optional branches):**

* **Curious:** "So never worth it?" \[+2\]  
  * Early: "Rarely."  
  * Mid: "If offered the choice? I'd try my best to turn them down as politely as possible."  
  * Late: "Only if you price it first."  
* **Dismissive:** "Hah. They'll have to fight over me\!" \[-2 early, 0 mid and late\]  
  * Early: "I'm not sure that will go well for you. At all."  
  * Mid: "And you think that will go well for you? Plan harder."  
  * Late: "You have been remarkably touched by many of them. That's a fight beyond my ken."

|  |
| :---- |

### 5\. "What do you think of this Dragonborn business?"

**Gating suggestion:** Late variant at Affinity \>= 2 and after at least one witnessed dragon soul absorption event. \[Theory question\]

**Alenawe (Mid \- liability):** "Dangerous. It scales faster than governance, and is nowhere near as predictable."  
**Alenawe (Mid \- unknown):** "It appears to be a great blessing for you. Make sure it isn't a curse on the rest of us."  
**Alenawe (Late \- stable):** "Too much for the hands of one person. Thankfully, it appears to have landed in someone trustworthy. For now."	

**Followup layer (optional branches):**

* **Curious:** "What does it mean for us mortals, do you think?" \[+3\]  
  * Early: "For you: leverage you have not finished pricing. For me: a category I am still drafting. For the rest: too soon to say, and that is the problem."  
  * Mid: "You still think you're mortal? I'm not so sure, any more."  
  * Late: "It means the old answers about authority do not fit you. I am working on new ones. Slowly."  
* **Flirt:** "And personally?" \[Early 0, Mid 0, Late \+2\]  
  * Early: *\[Not available at Early tier.\]*  
  * Mid: "Remains to be seen."  
  * Late: "Working on it."  
  * Late (Reciprocal, Affinity \>= 3 and Stable): "Personally? Invested."

|  |
| :---- |

# Institutions vs Individual

## Design Principles

**Purpose:** She reveals her ideological framework.

**Constraint:** No exposition dumps—anchor in *contrast* ("this vs that").

This is where Elenwen, the Thalmor, and her upbringing live—but indirectly.

## Conversations

### 6\. "So... the First Emissary is your mother?"

**Gating:** After Interlude quest completion.

**Alenawe:** "She is. That is the short answer."

**Followup layer (optional branches):**  
**Probing:** "You don't ever really mention it." \[+1\]

| Mid: "She was a diplomat. I am not. I have no reason to bring her up." Late: "It's easier to be a neutral observer without the introduction." |
| :---- |

**Curious:** "And the long one?" \[+2\]

| Mid: "Complicated. Under review." Late: "What are you looking for? I like my mother, and have no complaints." |
| :---- |

**Curious:** "What was that like?" \[+1\]

| "Structured. Observed. Directed. She looks out for me very well, and I'm hoping to return the favor." |
| :---- |

**Teasing/dismissive:** "Must have been tough." \[-2\]

| "Must it have been? I know that not. I am very successful, and well placed." |
| :---- |

**Concerned:** "But that all seems so ... cold." \[-1\]

| "Cold is not the word I would use. We think very much alike, if with different trajectories. Our relationship is very typical." |
| :---- |

|  |
| :---- |

### 7a. "You're rather familiar with the Thalmor."

**Gating suggestion:** After minor CW or Thalmor-adjacent quests.

**Alenawe (Early):** "Yes? They are the ruling party in Alinor. I pay attention."  
**Alenawe (Mid):**  
**Alenawe (Late):**

**Followup layer (optional branches):**

* **Probing:** "What do you think of them?  
  * Early: "What every good Mer is supposed to."  
  * Mid: "I'm not as ... certain ...  as I was."  
  * Late: "I think they are correct about the problem and wrong about the answer."  
* **Curious:** "Meaning?" \[+1\]:  
  * Early: "Meaning that is the answer you are supposed to receive."  
  * Mid: "Meaning the problem is real. Their story for it is ... having difficulty holding up."  
  * Late: "Meaning durability is worth pursuing. Purity is not."  
* **Hostile:** "They're monsters." \[-2 Early, 0 Mid, 0 Late\]:  
  * Early:"From a certain point of view. Yes."  
  * Mid: "That's one story, certainly. Not the one they're telling."  
  * Late: "This, from you? How many bandits have you killed? To the Thalmor, *you* are the bandit."  
* **End of Line:**  
  **Alenawe:** "We shouldn't speak of this here."

|  |
| :---- |

# Small, Human Friction / Small Talk

## Design Principles

**Purpose:** Human grounding. These need to be about *her*, not the world.

**Constraint:** Must reveal *preference*, not just opinion.

This lane:  
– humanizes her without softening her  
– gives pacing relief  
– reinforces quirks (this is where palindromes go, later)

## Conversations

### 8\. "Where were you before this?"

**Gating suggestion:** Immediate availability for base line. Mid-pool topic (Affinity \>= 1). Late variant at Affinity \>= 3.

**Alenawe (Early):** "Somewhere much warmer."  
**Alenawe (Mid):** "Alinor, mostly. Cyrodiil briefly. It was so much warmer..."  
**Alenawe (Late):** "I was raised and schooled in Alinor. I traveled here and there, briefly. I'd not been this far North before."

**Followup layer (optional branches):**

* **CuriousB:** "And how are you faring with the change in scenery so far?" \[+2\]  
  * Early: "I am managing."  
  * Mid: "Skyrim has been ... instructional."  
  * Late: "It's ... different. I miss the isles sometimes, but there's *so much* here to study..."  
* **CuriousA:** "I actually don't know much about Alinor. What was it like?" \[+3\]  
  * Early: "It is... more stable."  
  * Mid: "It is much less tumultuous. Serene order in the natural and curated spaces \- and no undead every three leagues."  
  * Late: "I'm not sure you'd like it \- it is quieter. More orderly. Considerably fewer undead."

|  |
| :---- |

### 9\. "You wield magic very well, do you have any tips?" \[+3\]

**Gating:** Unlocks after some days of travel, and player skill level \>40 in any school.

**Alenawe (low skill):** "Perhaps. I'd like to see what the local College offers before offering anything specific."  
**Alenawe (Mid skill in Dest., Alt. or Rest.):** "Hmm.. you do favor \[Alteration | Destruction | Restoration\]. Try this, next time: " (fade to black)  
**Alenawe (Mid skill):** "I don't think you're doing terrible. You're already on your way."  
**Alenawe (high skill):** "For you? I could ask the same."

**Followup layer (optional branches):**

* **Curious:** "Do you favor any particular schools?" \[+2\]  
  * Early: "For your purposes, Restoration seems the most practical."  
  * Mid: "The use of Destruction and Restoration are obvious. I often find Alteration is overlooked."  
  * Late: "They all have their uses, but I find that Conjuration and Illusion are somewhat ... distasteful. I prefer to be more direct."  
* **Curious:** "What's your take on the College of Winterhold?" \[+1\]  
  * Early/Pre-MG progress: "I haven't been there yet."  
  * Early/Mid-MG progress: "It seems too empty..."  
  * Mid: "A troubling history, and a distrusting population. I hope they can turn it around."  
  * Late: "It's concerning: The population is hostile, the student body too small, and leadership appears too preoccupied. It needs help."

|  |
| :---- |

### 10\. "What do you do when you're not working?"

**Gating suggestion:** Immediate availability for base line.

**1st Player Open:** "What do you do when you're not working?" \-\> Early: Teasing | Agree

|                                                             \-\> Mid/Late: Curious | Flirt | Teasing |
| :---- |

**2nd Player Open (Mid+):**  "Do you like doing things other than reading?"	\-\>Mid: Agree | Flirt | Teasing

|                                                                         \-\>Late: Agree | Curious | flirt |
| :---- |

**3rd Player Open (Late):** "What's your favorite kind of book?" \-\> Agree | Curious | Flirt

**Alenawe (Early):** "Reading, usually."  
**Alenawe (Mid):** "I prefer quiet amusements. Things that don't require an audience."  
**Alenawe (Late):** "There are a few treatises I’ve been meaning to track down. Leisure has been scarce."

**Followup layer (optional branches):**

* **Agree:** "Ah, a fellow bookworm\! Have any recommendations?" \[+3\] (-\> Shares Curious responses)  
* **Curious:** "Looking for anything in particular?" \[+4\]  
  * Early: "Hmm. I'll let you know."  
  * Mid: "I'll keep a list. The next library may prove useful." (Begin misc quest "Booklist 4")  
  * Late: "If you find any works on the Merethic Era, set them aside for me." (Begin misc quest \- "Before the Ages of Man")  
* **Teasing:** "Let me guess. Dusty books and dim corners." \[+2\]  
  * Early: "Dim rarely serves."  
  * Mid: "Then do point them out when you see them."  
  * Late: "If you find such, do point them out."  
* **Flirt:** "I can think of a few ways to spend our time..." \[Early \-4, Mid \-2, Late 0\]  
  * Early: "No."  
  * Mid: "Irrelevant."  
  * Late: "So I've seen."  
  * Late (Reciprocal, Affinity \>= 3 and Stable): "Perhaps..." *(VA: This is not dismissal. She is allowing the implication, then ending the exchange before it becomes explicit)*

|  |
| :---- |

# Miscellaneous

**Purpose** World interactions, etc

### MG06: Revealing the Unseen

*If the player moves to leave the room without killing Paratus, Alenawe will. This dialogue will become available for her to explain herself.*

**Alenawe:** \[/kills Paratus/\] "The Synod *(SIH-nod)* knows this expedition failed. It need not know what it found."

**Player:** "What was that? Why did you kill him?\!"  
**Alenawe Response:** "If it's not obvious to you, I shall be disappointed."

**Player demands explanation:** "Explain it like I'm new."  
**Alenawe Response:** *\[Each new line represents a separate dialogue file, as each line only gets about 150 characters. Tone should lean towards explaining the obvious to the dense, but not too much. Conversational volume, I don't think she'd get emotional or shouty./\]*

| "The fool just gave us an explicit, credible threat \- a report to a competing organization." "Not just one rogue mage that may come at you \- a paperwork trail. The inexorable mass of an institution." "That doesn't get \*solved\* by executions, it gets \*worse\!\*" "Let the Synod believe the entire expedition was killed by Falmer. What they don't know can't hurt us." |
| :---- |

# Implementation Notes (playable scope)

* Each question supports **one followup layer** with optional tone branches.  
* Keep lines brief: target one sentence, max two short sentences, \~140 characters.  
* Deep topics are delayed to prevent front-loading disclosure.  
* Reciprocal flirt variants are conditional: Affinity \>= 3 and Stability **Stable**.  
* Keep Alenawe-initiated probes (e.g., Thane analysis) as ambient/triggered lines, not core menu prompts.  
* **Progression control:** award each branch delta once per topic state (no repeat farming); repeat picks should return \[0\].

