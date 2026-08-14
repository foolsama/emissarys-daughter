Scriptname fSSEED_SM_CrimeGoldRelayScript extends Quest  

ReferenceAlias Property TrackerPlayerAlias Auto
Quest Property MB Auto
Scene Property Escape Auto
GlobalVariable Property StabilityTier Auto
GlobalVariable Property Warned Auto

fSSEED_LocationTracker Function GetTracker()
	if TrackerPlayerAlias
		return TrackerPlayerAlias as fSSEED_LocationTracker
	endif
	return None
EndFunction

Event OnStoryCrimeGold(ObjectReference akVictim, ObjectReference akCriminal, \
	Form akFaction, int aiGoldAmount, int aiCrime)
	fSSEED_LocationTracker tracker = GetTracker()
	if tracker == None
		Debug.Trace("FSSEED:SMCrimeGoldRelay - tracker missing; set TrackerPlayerAlias property")
		Stop()
		return
	endif

	tracker.HandleStoryCrimeGoldEvent(akVictim, akCriminal, akFaction, aiGoldAmount, aiCrime)

	If MB.IsRunning() && StabilityTier.GetValue() <= 2 && Warned.GetValue() == 3
		Escape.Start()
	ElseIf StabilityTier.GetValue() == 1 && Warned.GetValue() == 3
		Escape.Start()
	EndIf

	Stop()
EndEvent
