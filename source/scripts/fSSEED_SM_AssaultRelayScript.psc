Scriptname fSSEED_SM_AssaultRelayScript extends Quest  

ReferenceAlias Property TrackerPlayerAlias Auto

fSSEED_LocationTracker Function GetTracker()
	if TrackerPlayerAlias
		return TrackerPlayerAlias as fSSEED_LocationTracker
	endif
	return None
EndFunction

; Event OnInit()
; 	Debug.Trace("FSSEED:SMAssaultRelay - Quest initialized; running=" + IsRunning())
; EndEvent

Event OnStoryAssaultActor(ObjectReference akVictim, ObjectReference akAttacker, \
	Location akLocation, int aiCrime)
	if akAttacker != Game.GetPlayer()
		Stop()
		return
	endif

	fSSEED_LocationTracker tracker = GetTracker()
	if tracker == None
		Debug.Trace("FSSEED:SMAssaultRelay - tracker missing; set TrackerPlayerAlias property")
		Stop()
		return
	endif

	tracker.HandleStoryAssaultEvent(akVictim, akAttacker, akLocation, aiCrime)
	Stop()
EndEvent
