Scriptname fSSEED_MajQ2_Script extends Quest Conditional

ObjectReference Property DoorEnabler  Auto
ObjectReference Property ReinforcementsEnabler Auto 
ReferenceAlias[] Property SpawnMooks Auto
Actor Property PlayerRef Auto
Actor Property Alenawe Auto
Location Property KeepLocation Auto
Cell Property KeepInterior Auto
Bool Property ParleyActive Auto Hidden
Scene Property ClerkScene Auto
Scene Property BreakScene Auto
Scene Property KeepExit Auto
Faction Property KeepFaction Auto
Faction Property MS09PlayerAllyFaction Auto
Bool Property PlayerWasMS09Ally Auto Conditional
GlobalVariable Property Playstyle Auto
GlobalVariable Property GameDaysPassed Auto
GlobalVariable Property DateKeepExited Auto
Float Property CurrentDate Auto
Spell Property Witness Auto
Message Property WitnessMESG Auto
Spell Property WitnessINFO Auto
Spell Property Primer Auto
Message Property PrimerMESG Auto
Spell Property PrimerINFO Auto
Spell Property Sleep Auto
Message Property SleepMESG Auto
Spell Property Sleeper Auto
Spell Property Reward Auto

;InitialStrategy: 1 = Formal, 2 = Sneak, 3 = Force
Int Property InitialStrategy Auto Conditional

;Result: 1 = Parley Concluded 2 = no combat 3 = parley broken/forced entry
Int Property result  Auto  Conditional

; Evidence 1 = Guidance, 2 = Memo, 3 = Reconciliation
Bool Property GuidanceFound = False Auto Hidden
Bool Property MemoFound = False Auto Hidden
Bool Property ReconciliationFound = False Auto Hidden
Bool Property LedgerRecovered Auto Hidden
Bool Property DirectiveRecovered Auto Hidden
Int Property EvidenceFound = 0 Auto Hidden

Event OnUpdate()
	If GetStage() < 80 || !IsObjectiveDisplayed(90)
		Return
	EndIf

	Actor PlayerActor = Game.GetPlayer()
	If PlayerActor.IsInLocation(KeepLocation) || PlayerActor.IsInCombat()
		; Player hasn't cleared the keep grounds yet; keep polling until safe.
		Debug.Trace("fSSEED_MajQ2: Trying again for stage 90")
		RegisterForSingleUpdate(5.0)
		Return
	EndIf

	Debug.Trace("fSSEED_MajQ2: Keep result = " + Result)
	KeepExit.Start()
	SetStage(90)
EndEvent

Function SaveMS09()
	PlayerWasMS09Ally = PlayerRef.IsInFaction(Ms09PlayerAllyFaction)
EndFunction

Function CleanMS09()
	If !PlayerWasMS09Ally
		PlayerRef.RemoveFromFaction(MS09PlayerAllyFaction)
	EndIf
EndFunction

Function RegisterEvidence(Int evidenceID)
	; Ignore duplicates.
	If evidenceID == 1
		If GuidanceFound
			Return
		EndIf
		GuidanceFound = True
		EvidenceFound += 1
	ElseIf evidenceID == 2
		If MemoFound
			Return
		EndIf
		MemoFound = True
		EvidenceFound += 1
	ElseIf evidenceID == 3
		If ReconciliationFound
			Return
		EndIf
		ReconciliationFound = True
		EvidenceFound += 1
	EndIf

	If evidenceID == 4
		If DirectiveRecovered
			Return
		EndIf
		DirectiveRecovered = True
		SetObjectiveCompleted(75)
		CheckExitReady()
	Endif
	If evidenceID == 5
		If LedgerRecovered
			Return
		EndIf
		LedgerRecovered = True
		SetObjectiveCompleted(70)
		CheckExitReady()
	EndIf

	Debug.Trace("fSSEED_MajQ2: Evidence " + evidenceID + " registered, total = " + EvidenceFound)

	; Master Objective: 40; Supplimental objective 42 (1/3), 44, (2/3)
	; Other: Ledger (70, in chest), Orders (75, on boss, pop on memo read)
	If EvidenceFound == 1
		SetObjectiveDisplayed(42)
	ElseIf EvidenceFound == 2
		SetObjectiveDisplayed(42, false)
		SetObjectiveDisplayed(44)
	ElseIf EvidenceFound == 3
		SetObjectiveDisplayed(44, false)
		SetObjectiveCompleted(42)
		SetObjectiveCompleted(44)
		SetObjectiveCompleted(40)
	EndIf
EndFunction

Function BeginParley()
	ParleyActive = True	
EndFunction

Function BreakParley()
	If !ParleyActive || Result != 0
		Return
	EndIf

	ParleyActive = False
	Result = 3

	If ClerkScene.IsPlaying()
		ClerkScene.Stop()
	EndIf

	BreakScene.Start()

	Debug.Trace("fSSEED_MajQ2: Player broke parley; Reinforments enabled.")
	If GetStage() == 20 || GetStage() == 22
		SetStage(40)
	EndIf
	SetStage(50)
	ReinforcementsEnabler.Enable()
EndFunction

Function CompleteParley()
	If !ParleyActive
		Return
	EndIf

	; Clear this first so ownership changes cannot be mistaken
	; for the player breaking parley.
	ParleyActive = False
	Result = 1

	Debug.Trace("fSSEED_MajQ2: Parley completed")
EndFunction

Function CheckExitReady()
	If GetStage() < 80 && LedgerRecovered && DirectiveRecovered
		SetStage(80)
		RegisterForSingleUpdate(30.0)
		CurrentDate = GameDaysPassed.GetValue()
		DateKeepExited.SetValue(CurrentDate)
		Debug.Trace("fSSEED_MajQ2: Stage 80 set, checking for safety")
	Else
		Debug.Trace("fSSEED_MajQ2: CheckExitReady called but Stage is " + GetStage() + " " + "LedgerRecovered is " + LedgerRecovered + ", DirectiveRecoevred is " +  DirectiveRecovered)
	Endif
EndFunction

Function DispenseReward()
	Float style = Playstyle.GetValue()
	If style == 1.0 || style == 4.0
		Reward = Witness
		Alenawe.AddSpell(Reward)
		WitnessMESG.Show()
		Game.GetPlayer().AddSpell(WitnessINFO)
	EndIf
	If Style == 3.0
		Reward = Primer
		Alenawe.AddSpell(Reward)
		PrimerMESG.Show()
		Game.GetPlayer().AddSpell(PrimerINFO)
	EndIf
	If Style == 2.0
		Reward = Sleep
		Alenawe.AddSpell(Reward)
		PlayerRef.AddSpell(Sleeper)
		SleepMESG.Show()
	EndIf
	Debug.Trace("fSSEED_MajQ2: " + Reward + " added to Alenawe")
EndFunction

