Scriptname fSSEED_SM_KillRelayScript extends Quest  

ReferenceAlias Property TrackerPlayerAlias Auto

fSSEED_LocationTracker Function GetTracker()
	if TrackerPlayerAlias
		return TrackerPlayerAlias as fSSEED_LocationTracker
	endif
	return None
EndFunction

; Event OnInit()
; 	Debug.Trace("FSSEED:SMKillRelay - Quest initialized; running=" + IsRunning())
; EndEvent

Event OnStoryKillActor(ObjectReference akVictim, ObjectReference akKiller, Location akLocation, int aiCrimeStatus, int aiRelationshipRank)
	Debug.Trace("FSSEED:SMKillRelay - EVENT RECEIVED" + " victim=" + akVictim + " killer=" + akKiller + " crimeStatus=" + aiCrimeStatus)

	if akKiller != Game.GetPlayer()
		Debug.Trace("FSSEED:SMKillRelay - Ignored: killer was not player")
		Stop()
		return
	endif

	fSSEED_LocationTracker tracker = GetTracker()
	if tracker == None
		Debug.Trace("FSSEED:SMKillRelay - tracker missing; set TrackerPlayerAlias property")
		Stop()
		return
	endif

	tracker.HandleStoryKillEvent(akVictim, akKiller, akLocation, aiCrimeStatus, aiRelationshipRank)
	Stop()
EndEvent