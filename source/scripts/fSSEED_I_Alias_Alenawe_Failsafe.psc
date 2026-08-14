Scriptname fSSEED_I_Alias_Alenawe_Failsafe extends ReferenceAlias  

Quest Property MQ201  Auto  

Quest Property Interlude Auto
fSSEED_InterludeScript Property InterludeController Auto

ObjectReference Property WaitMarker  Auto  

FormList Property ForbiddenCells  Auto  
Quest Property pDialogueFollower Auto
Scene Property EmbassyHandoffScene Auto

Bool bCorrectingPosition = False
Bool bEmbassyHandoffDone = False
Bool bPostBreachAnchored = False

Int Property EmbassyPrepStage = 70 Auto
Int Property EmbassyHandoffTriggerStage = 90 Auto
Int Property EmbassyHandoffLastChanceStage = 95 Auto
Location Property KatlasFarmLocation Auto


Event OnCellAttach()
	CheckPosition()
EndEvent


Event OnCellLoad()
	CheckPosition()
EndEvent


Event OnLocationChange(Location akOldLocation, Location akNewLocation)
	CheckPosition()
EndEvent


Function CheckPosition()
	if bCorrectingPosition
		return
	endif

	Actor Alenawe = GetActorReference()
	if Alenawe == None
		return
	endif

	int MQStage = MQ201.GetStage()
	if MQStage >= EmbassyPrepStage && MQStage < EmbassyHandoffLastChanceStage
		if InterludeController != None && KatlasFarmLocation != None && Game.GetPlayer().GetCurrentLocation() == KatlasFarmLocation
			InterludeController.BeginEmbassyHandoffWatch()
			Debug.Trace("fSSEED_I: EmbassyHandoffWatch called from Alenawe Alias script")
		endif
	endif

	if Alenawe == None || WaitMarker == None || ForbiddenCells == None
		Debug.Trace("fSEED_I: One of the failsafe properties didn't fill")
		return
	endif

	Cell CurrentCell = Alenawe.GetParentCell()
	String CellName = "<none>"
	if CurrentCell != None
		CellName = CurrentCell.GetName()
	endif
	
	;Set stage for PreMissionFG
	If Interlude.GetStage() >= 10 && CurrentCell != None && CurrentCell.GetName() == "Sleeping Giant Inn"
		Debug.Trace("fSSEED_I: Alenawe is in cell " + CellName + " at MQ stage " + MQStage)
		If InterludeController != None
			InterludeController.BeginPreMissionWatch()
			Debug.Trace("fSSEED_I: MissionWAtch called from Alenawe Alias script")
		EndIf
	EndIf

	; Avoid a MoveTo tug-of-war during embassy infiltration.
	if bEmbassyHandoffDone
		return
	endif

	; Legacy failsafe path if the handoff never happened.
	if CurrentCell != None && ForbiddenCells.HasForm(CurrentCell)
		bCorrectingPosition = True
		Debug.Trace("fSSEED Interlude: Alenawe entered forbidden MQ201 cell before handoff. Returning her to wait marker.")
		Alenawe.MoveTo(WaitMarker)
		Alenawe.EvaluatePackage()
		bCorrectingPosition = False
	endif

	; Post-breach handling is also polled from Interlude quest updates.
	If MQStage >= 227 && Interlude.GetStage() < 20
		TryPostBreachForceGreet()
		return
	EndIf

	if MQStage < 227 && bPostBreachAnchored
		bPostBreachAnchored = False
	endif

	

EndFunction


Function TryPostBreachForceGreet()
	if Interlude.GetStage() >= 20
		return
	endif

	if MQ201.GetStage() < 227
		return
	endif

	Actor Alenawe = GetActorReference()
	if Alenawe == None || WaitMarker == None
		return
	endif

	if !bPostBreachAnchored
		Alenawe.MoveTo(WaitMarker)
		Alenawe.EvaluatePackage()
		bPostBreachAnchored = True
		Debug.Trace("fSSEED_I: Alenawe anchored at wait marker for post-breach ForceGreet")
	endif

	if Alenawe.GetDistance(Game.GetPlayer()) < 500.0
		Interlude.SetStage(20)
		Debug.Trace("fSSEED_I: Interlude stage set to 20 from Alenawe failsafe script")
	endif
EndFunction


Function TryEmbassyHandoff(int MQStage)
	if bEmbassyHandoffDone
		return
	endif

	if MQStage < EmbassyPrepStage || MQStage >= EmbassyHandoffLastChanceStage
		return
	endif

	if MQStage < EmbassyHandoffTriggerStage
		return
	endif

	Actor Alenawe = GetActorReference()

	bEmbassyHandoffDone = True

	if EmbassyHandoffScene != None && !EmbassyHandoffScene.IsPlaying()
		EmbassyHandoffScene.Start()
		Debug.Trace("fSSEED_I: Embassy handoff scene started")
	endif

	if pDialogueFollower != None
		(pDialogueFollower as DialogueFollowerScript).FollowerWait()
		if Alenawe != None
			Alenawe.EvaluatePackage()
		endif
		Debug.Trace("fSSEED_I: Alenawe set to follower wait for embassy handoff")
	else
		Debug.Trace("fSSEED_I: pDialogueFollower not filled; embassy handoff wait was skipped")
	endif
EndFunction
