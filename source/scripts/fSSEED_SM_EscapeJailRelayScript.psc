Scriptname fSSEED_SM_EscapeJailRelayScript extends Quest  

ReferenceAlias Property TrackerPlayerAlias Auto

fSSEED_LocationTracker Function GetTracker()
	if TrackerPlayerAlias
		return TrackerPlayerAlias as fSSEED_LocationTracker
	endif
	return None
EndFunction

Event OnStoryEscapeJail(Location akLocation, Form akCrimeGroup)
	fSSEED_LocationTracker tracker = GetTracker()
	if tracker == None
		Debug.Trace("FSSEED:SMEscapeJailRelay - tracker missing; set TrackerPlayerAlias property")
		Stop()
		return
	endif

	tracker.HandleStoryEscapeJailEvent(akLocation, akCrimeGroup)
	Stop()
EndEvent
