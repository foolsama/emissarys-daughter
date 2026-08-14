Scriptname fSSEED_SM_JailRelayScript extends Quest  

ReferenceAlias Property TrackerPlayerAlias Auto

fSSEED_LocationTracker Function GetTracker()
	if TrackerPlayerAlias
		return TrackerPlayerAlias as fSSEED_LocationTracker
	endif
	return None
EndFunction

Event OnStoryJail(ObjectReference akGuard, Form akCrimeGroup, Location akLocation,  int aiCrimeGold)
	fSSEED_LocationTracker tracker = GetTracker()
	if tracker == None
		Debug.Trace("FSSEED:SMJailRelay - tracker missing; set TrackerPlayerAlias property")
		Stop()
		return
	endif

	tracker.HandleStoryJailEvent(akGuard, akCrimeGroup, akLocation, aiCrimeGold)
	Stop()
EndEvent
