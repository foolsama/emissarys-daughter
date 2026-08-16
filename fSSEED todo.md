# Wishlist
[ ] Implications death line only for human deaths?
[ ] That was Close frightened line - find conditions that actually work
[ ] One or two more generic idle lines ("update my notes" only one that seems to fire sometimes)
[ ] One or two more "engaging!" lines

## Big project steps
[X] Review dialogue and gate higher levels behind mission progress and/or stability tier as well as affinity
[ ] DB Fight/Join atenuation
[ ] Finish lines/reacts
[ ] add conditions to warning triggers
[ ] Add find books quest
[ ] Flesh out "romance"
[ ] Change all "IdleHandCut" animations
[ ] Adjust conversations to include training/upbringing from elenwen:
	"What have you observed of me", "power and stories", "scholar", "tips advice"
	praise means expectations have increased;
	exhaustion is not relevant to performance;
	a position not used is a position wasted;
	being prepared is how one avoids becoming dependent.
	
	fSSEED_AC_Idle_StoryTIF_ conv
If (conv as fSSEED_Convo_Tracker).Convo3 < 10
	(conv as fSSEED_Convo_Tracker).Convo3 += 2
	Debug.Trace("Convo3 pushed from idle TIF")
EndIf

fSSEED_C_3_PDE_TIFF
	
fSSEED_AC_Idle_SusTIF_	Convo3B
If Convo3B.GetValue() < 10
	Convo3B.SetValue(10)
	Debug.Trace("Convo3B Early flagged from idle TIF")
EndIf
	
## Bug fixes
[?] Warnings after 1st not firing off guard assault or murder/If in combat
[?] 3B needs topic adjust/gating
[ ] Ill remember that combat line rerecord
[ ] crimegold stablity increase too much
[?] city comments outside only
[?] check MG06 OhNo, chaneg packaget to just kill dude
[?] pained reaction to greybeards speaking? mq105ustengrav
[?] +Affinity on levelup if below 25
[ ] whiterun hold package incorrect, points to riften? location 7
[x] Verify DragonAbsorb lines for SayOnce
[ ] late conversations need gating behind dismissedfollower
[ ] check conversation gates - dont match variable states
[ ] "Valuable" note only seen on picking / only once

## Testing required
[x] Chnage how Al's skin is used (don't bundle BnP skin with mod)
[?] rising threat book react use take animation and remove item
[?] Review StabliityScore function to include Daedric Destabilizers

## MinM1

## majq1
[x] mage gives rogue line but mage reward

## Interlude
[?] courier scene borked
[x] embassy plan plausible gate behind later 106

## MinM2
[ ] Finish MinM2 "soft win" - If Aff < 35, she takes the offer and runs, quest/mod complete game over
[?] Check MinM2 stages
[ ] scene trigger faling
[ ] Dominion has one embedded asset idlehandcut and followup line
[ ] Mentor FG not working


## MajQ2
[ ] clear or repoint any Linked Refs that actually cross back into the original Northwatch cell.
[ ] NorthwatchKeep: 
		Two or three patrolling interior guards.
		One clerk or records officer.
		One administrator.
		One or two captives.
		One initially disabled corpse.
		Two initially disabled purge-response guards.
[ ] Useful package exercises:
		Guard patrol: two or three linked patrol markers.
		Clerk sandbox: small radius around desk, shelf, and chair.
		Administrator sandbox: desk and records area before Stage 65.
		Administrator purge: travel/use-idle/flee after Stage 65.
		Captive restrained sandbox: extremely small radius or furniture-bound idle.
		Captive escape: travel to exterior marker after release.
		Reinforcement guard: enabled at Stage 65 with a guard or patrol package.