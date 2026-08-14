Scriptname fSSEED_MG02_WaitNo extends ObjectReference  
{Trigger event for Alenawe warning}

Scene Property WaitNo  Auto  

Event OnLoad()
    Debug.Trace("fSSEED_MG02_WaitNo loaded on " + Self)
EndEvent

Event OnTriggerEnter(ObjectReference akTriggerRef)
	Debug.Trace("fSSEED WaitNo box entered by " + akTriggerRef)
	if akTriggerRef == Game.GetPlayer()
		fSSEED_WI_Saarthal.Start()
		Debug.Trace("fSSEED:Saarthal - WaitNo attempted")
		WaitNo.Start()
		Self.Disable()
	endif
EndEvent
Quest Property fSSEED_WI_Saarthal  Auto  
