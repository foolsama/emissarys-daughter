Scriptname fSSEED_PlayerBehaviorScript extends Quest  

Actor Property PlayerRef Auto
Int Property MartialScore Auto
Int Property RogueScore Auto
Int Property ArcaneScore Auto
Int Property SilentSneakAttacks Auto
Int Property PreparedStarts Auto
Int Property DirectStarts Auto
Int Property AdaptiveCombats Auto
Int Property ObservedCombats Auto
Int Property FinalPlaystyle Auto
Int Property FinalPattern Auto
Int Property MartialStarts Auto
Int Property RogueStarts Auto
Int Property ArcaneStarts Auto
Int Property RangedScore Auto
Int Property RangedStarts Auto
Bool Property ObservingCombat Auto
Bool Property TrackingActive Auto Hidden
Bool Property TrackingLocked Auto Hidden
GlobalVariable Property Playstyle Auto
GlobalVariable Property CombatPattern Auto

Bool SawMartialThisCombat
Bool SawRogueThisCombat
Bool SawArcaneThisCombat
Bool SawRangedThisCombat
Bool BehaviorTrackingInitialized

Int SpellCastsThisCombat
Int LastSneakAttackStat
Int CategoriesThisCombat

Event OnUpdate()
	If !ObservingCombat || !CanObserve()
		Return
	EndIf
	ObserveLoadout()
	RegisterForSingleUpdate(2.0)
EndEvent

Bool Function CanObserve()
	Return TrackingActive && !TrackingLocked
EndFunction

Function StartBehaviorTracking()
	If TrackingLocked
		Return
	EndIf

	LastSneakAttackStat = Game.QueryStat("Sneak Attacks")
	BehaviorTrackingInitialized = True
	TrackingActive = True
	Debug.Trace("fSSEED Behavior: Tracking started.")
EndFunction

Function BeginObservedCombat()
    If TrackingLocked || !CanObserve()
        Return
    EndIf

	CaptureSilentSneakAttacks()
	ObservingCombat = True
	ObservedCombats += 1

	SawMartialThisCombat = False
	SawRogueThisCombat = False
	SawArcaneThisCombat = False
	SawRangedThisCombat = False
	CategoriesThisCombat = 0
	SpellCastsThisCombat = 0

    If PlayerRef.IsSneaking()
        PreparedStarts += 1
    Else
        DirectStarts += 1
    EndIf
	
	; Starting method is especially meaningful.
	ObserveCombatStart()
	RegisterForSingleUpdate(2.0)
EndFunction


Function EndObservedCombat()
    If !ObservingCombat
        Return
    EndIf
	ObservingCombat = False
	UnregisterForUpdate()

	If CategoriesThisCombat >= 2
	    AdaptiveCombats += 1
	EndIf
	; Any sneak attacks since combat began occurred during
	; an encounter we were already observing.
	LastSneakAttackStat = Game.QueryStat("Sneak Attacks")
    Debug.Trace("fSSEED Behavior: Combat ended. M=" + MartialScore + " R=" + RogueScore + " A=" + ArcaneScore)
	Debug.Trace("fSSEED Behavior: Method=" + PreparedStarts + " prepared starts, " + DirectStarts + " direct starts, " + AdaptiveCombats + " adaptive combats.")
EndFunction

Function RegisterSpellCast()
	If TrackingLocked || !ObservingCombat || !CanObserve()
		Return
	EndIf

	SpellCastsThisCombat += 1

	; If we've already seen magic equipped this combat,
	; casting it confirms nothing new for classification.
	If SawArcaneThisCombat
		Return
	EndIf

	; Magic was introduced after combat began.
	ArcaneScore += 1
	SawArcaneThisCombat = True
	CategoriesThisCombat += 1
EndFunction

Function RegisterBowShot()
	If TrackingLocked || !BehaviorTrackingInitialized || !CanObserve()
		Return
	EndIf

	If ObservingCombat
		If !SawRangedThisCombat
			RangedScore += 1
			SawRangedThisCombat = True
			CategoriesThisCombat += 1
		EndIf
	Else
		RangedScore += 1
	EndIf
EndFunction

Function CaptureSilentSneakAttacks()
	If !BehaviorTrackingInitialized
		LastSneakAttackStat = Game.QueryStat("Sneak Attacks")
		BehaviorTrackingInitialized = True
		Return
	EndIf

	Int CurrentSneakAttacks = Game.QueryStat("Sneak Attacks")
	Int Delta = CurrentSneakAttacks - LastSneakAttackStat

	If Delta > 0
		RogueScore += Delta
		SilentSneakAttacks += Delta
		PreparedStarts += Delta
		Debug.Trace("fSSEED Behavior: " + Delta + " sneak attack(s) occurred outside observed combat.")
	EndIf
	LastSneakAttackStat = CurrentSneakAttacks
EndFunction

Function ObserveCombatStart()
Int LeftType = PlayerRef.GetEquippedItemType(0)
	Int RightType = PlayerRef.GetEquippedItemType(1)

	Bool HasMelee = (LeftType >= 1 && LeftType <= 6) || (RightType >= 1 && RightType <= 6)
	Bool HasBow = LeftType == 7 || RightType == 7
	Bool HasArcane = LeftType == 8 || RightType == 8 || LeftType == 9 || RightType == 9

	; Bow is its own delivery method. Sneaking is already recorded
	; through PreparedStarts and the Sneak Attacks statistic.
	If HasBow

		RangedScore += 2
		RangedStarts += 1
		SawRangedThisCombat = True
		CategoriesThisCombat += 1

	; Melee assassin
	ElseIf PlayerRef.IsSneaking() && HasMelee

		RogueScore += 2
		RogueStarts += 1
		SawRogueThisCombat = True
		CategoriesThisCombat += 1

		MartialScore += 1
		SawMartialThisCombat = True
		CategoriesThisCombat += 1

	; Sword + spell = spellblade. Martial is the intended solution.
	ElseIf HasMelee

		MartialScore += 2
		MartialStarts += 1
		SawMartialThisCombat = True
		CategoriesThisCombat += 1

		; Magic is already part of the loadout, but secondary.
		If HasArcane
			ArcaneScore += 1
			SawArcaneThisCombat = True
			CategoriesThisCombat += 1
		EndIf

	; Spell/staff with no melee weapon = ranged sorcerer
	ElseIf HasArcane
		ArcaneScore += 2
		ArcaneStarts += 1
		SawArcaneThisCombat = True
		CategoriesThisCombat += 1
	EndIf
EndFunction

Function ObserveLoadout()
	Int LeftType = PlayerRef.GetEquippedItemType(0)
	Int RightType = PlayerRef.GetEquippedItemType(1)

	; Martial method introduced during combat
	If (LeftType >= 1 && LeftType <= 6) || \
	   (RightType >= 1 && RightType <= 6) || \
	   LeftType == 10 || RightType == 10

		If !SawMartialThisCombat
			MartialScore += 1
			SawMartialThisCombat = True
			CategoriesThisCombat += 1
		EndIf
	EndIf

	; Bow introduced during combat
	If LeftType == 7 || RightType == 7

		If !SawRangedThisCombat
			RangedScore += 1
			SawRangedThisCombat = True
			CategoriesThisCombat += 1
		EndIf
	EndIf

	; Magic introduced during combat
	If LeftType == 8 || RightType == 8 || \
	   LeftType == 9 || RightType == 9

		If !SawArcaneThisCombat
			ArcaneScore += 1
			SawArcaneThisCombat = True
			CategoriesThisCombat += 1
		EndIf
	EndIf
EndFunction

Function CalculatePlaystyle()
	If TrackingActive && !ObservingCombat
		CaptureSilentSneakAttacks()
	EndIf

	; Ranged bow user priority
	If RangedScore > 0 && RangedScore >= RogueScore && RangedScore >= MartialScore && RangedScore > ArcaneScore
		FinalPlaystyle = 4

	; Rogue is clear winner
	ElseIf RogueScore > MartialScore && RogueScore > ArcaneScore && RogueScore > RangedScore
		FinalPlaystyle = 2

	; Martial vs Arcane
	ElseIf ArcaneScore > MartialScore || ArcaneStarts >= MartialStarts + 20 || ArcaneScore >= RangedScore
		; Arcane only wins a close contest if the player actually
		; prefers beginning engagements as a caster.
		If ArcaneStarts > MartialStarts
			FinalPlaystyle = 3
		Else
			FinalPlaystyle = 1
		EndIf

	Else
		FinalPlaystyle = 1
	EndIf
	Playstyle.SetValue(FinalPlaystyle)
EndFunction

Function PauseBehaviorTracking()
	If !TrackingActive
		Return
	EndIf

	If ObservingCombat
		EndObservedCombat()
	Else
		CaptureSilentSneakAttacks()
	EndIf

	TrackingActive = False
	LastSneakAttackStat = Game.QueryStat("Sneak Attacks")
	Debug.Trace("fSSEED Behavior: Tracking paused.")
EndFunction

Function FreezeBehaviorProfile()
	If ObservingCombat
		EndObservedCombat()
	EndIf
	TrackingLocked = True
	CalculatePlaystyle()

	If AdaptiveCombats > (ObservedCombats / 2)
		FinalPattern = 3
	ElseIf PreparedStarts > DirectStarts
		FinalPattern = 2
	Else
		FinalPattern = 1
	EndIf
	CombatPattern.SetValue(FinalPattern)
    Debug.Trace("fSSEED Behavior: Profile frozen. Method=" + FinalPlaystyle + " Pattern=" + FinalPattern + " M=" + MartialScore + " R=" + RogueScore + " A=" + ArcaneScore)
EndFunction