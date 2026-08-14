Scriptname fSSEED_InterludeScript extends Quest  

Quest Property MQ201 Auto
Quest Property Interlude Auto
Quest Property pDialogueFollower Auto
GlobalVariable Property GameDaysPassed Auto
GlobalVariable Property DateEmbassyBreached Auto
GlobalVariable Property PostLocation Auto
Float Property StabilitySave Auto
Float Property AffinitySave Auto
Actor Property Delphine Auto
Scene Property PreMissionFG  Auto
Scene Property CourierDelivery Auto
Bool Property bWatchingPreMission Auto Hidden
Bool Property bWatchingEmbassyHandoff Auto Hidden
Bool Property bWatchingPostBreachFG Auto Hidden
ReferenceAlias Property AlenaweFailsafeAlias Auto
Int Property EmbassyPrepStage = 70 Auto
Int Property EmbassyHandoffTriggerStage = 90 Auto
Int Property EmbassyHandoffLastChanceStage = 95 Auto
Location Property KatlasFarmLocation Auto
Int Property SolitudePostIndex = 2 Auto

; Puts Alenawe in wait mode before scene start so her follow package doesn't outprioritize Action 4.
Function StartCourierScene()
	if AlenaweFailsafeAlias != None
		(AlenaweFailsafeAlias as fSSEED_I_Alias_Alenawe_Failsafe).GetActorReference().EvaluatePackage()
		Debug.Trace("fSSEED_I: Alenawe alias forced")
	endif
	if CourierDelivery != None
		CourierDelivery.Start()
		Debug.Trace("fSSEED_I: Courier scene started from InterludeScript")
	endif
EndFunction

Function BeginPreMissionWatch()
	If !bWatchingPreMission
		bWatchingPreMission = True
		RegisterForUpdate(10.0)
		Debug.Trace("fSSEED_I: Quest script Registering for Update")
	EndIf
EndFunction

Function BeginEmbassyHandoffWatch()
	bWatchingEmbassyHandoff = True
	RegisterForUpdate(2.0)
	Debug.Trace("fSSEED_I: Quest script registering for embassy handoff watch")
EndFunction

Function BeginPostBreachWatch()
	if PostLocation != None && PostLocation.GetValueInt() != SolitudePostIndex
		return
	endif

	if !bWatchingPostBreachFG
		bWatchingPostBreachFG = True
		RegisterForUpdate(2.0)
		SetObjectiveDisplayed(20)
		Debug.Trace("fSSEED_I: Quest script registering for post-breach watch")
	endif
EndFunction

Function StopUpdateIfIdle()
	if !bWatchingPreMission && !bWatchingEmbassyHandoff && !bWatchingPostBreachFG
		UnregisterForUpdate()
		Debug.Trace("fSSEED_I: Quest script Unregistering for Update; all watchers idle")
	endif
EndFunction

Event OnUpdate()
	int MQStage = MQ201.GetStage()
	int InterludeStage = Interlude.GetStage()

	if InterludeStage < 20 && MQStage >= 230
		if PostLocation != None && PostLocation.GetValueInt() != SolitudePostIndex
			if bWatchingPostBreachFG
				bWatchingPostBreachFG = False
				StopUpdateIfIdle()
			endif
		else
		if !bWatchingPostBreachFG
			bWatchingPostBreachFG = True
		endif
		if AlenaweFailsafeAlias != None
			(AlenaweFailsafeAlias as fSSEED_I_Alias_Alenawe_Failsafe).TryPostBreachForceGreet()
		else
			Debug.Trace("fSSEED_I: AlenaweFailsafeAlias not filled; post-breach callback skipped")
		endif
		endif
	elseif bWatchingPostBreachFG && (InterludeStage >= 20 || MQStage < 230)
		bWatchingPostBreachFG = False
		StopUpdateIfIdle()
	endif

	if MQStage >= EmbassyPrepStage && MQStage < EmbassyHandoffLastChanceStage
		if !bWatchingEmbassyHandoff && KatlasFarmLocation != None && Game.GetPlayer().GetCurrentLocation() == KatlasFarmLocation
			BeginEmbassyHandoffWatch()
		endif
		if bWatchingEmbassyHandoff && MQStage >= EmbassyHandoffTriggerStage && KatlasFarmLocation != None && Game.GetPlayer().GetCurrentLocation() == KatlasFarmLocation
			if AlenaweFailsafeAlias != None
				(AlenaweFailsafeAlias as fSSEED_I_Alias_Alenawe_Failsafe).TryEmbassyHandoff(MQStage)
			endif
			bWatchingEmbassyHandoff = False
			StopUpdateIfIdle()
		endif
	elseif bWatchingEmbassyHandoff
		bWatchingEmbassyHandoff = False
		StopUpdateIfIdle()
	endif

	If InterludeStage == 10 && MQStage >= 40 && MQStage < 90 && DelphineNearby()
		If PreMissionFG != None && !PreMissionFG.IsPlaying()
			PreMissionFG.Start()
			Debug.Trace("fSSEED_I: PreMissionFG attempted from Interlude Quest script")
			bWatchingPreMission = False
			StopUpdateIfIdle()
		EndIf
		return
	EndIf
	If bWatchingPreMission && (InterludeStage != 10 || MQStage >= 95)
		bWatchingPreMission = False
		StopUpdateIfIdle()
	EndIf
EndEvent

bool function DelphineNearby()
	If Game.GetPlayer().GetDistance(Delphine) > 500.0 || Game.GetPlayer().GetCurrentLocation() != Delphine.GetCurrentLocation()
		Debug.Trace("fSSEED_I: Says player is safe from Delphine's ears")
		return true
	else
		return false
	endif
endfunction