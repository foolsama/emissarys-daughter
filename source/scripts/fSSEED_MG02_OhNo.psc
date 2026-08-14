Scriptname fSSEED_MG02_OhNo extends ObjectReference  

event OnLoad()
	Debug.Trace("fSSEED_WI_MG02: OhNo triggerbox loaded")
endEvent

Event OnTriggerEnter(ObjectReference akTriggerRef)
	Debug.Trace("fSSEED_WI_MG02: OhNo triggerbox entered by " +akTriggerRef)
	if akTriggerRef == Game.GetPlayer()
		fSSEED_WI_MG02.SetStage(100)
	endif
EndEvent

Quest Property fSSEED_WI_MG02  Auto
