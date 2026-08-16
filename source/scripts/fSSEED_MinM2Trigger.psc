Scriptname fSSEED_MinM2Trigger extends ObjectReference  

Quest Property MinM2  Auto  

Scene Property Open  Auto  

ObjectReference Property Alenawe  Auto  

Event OnTriggerEnter(ObjectReference akActionRef)
	Debug.Trace("fSSEED_MinM2: " + akActionRef + " just entered the scene trigger")
	If MinM2.GetStage() == 30 && akActionRef == Alenawe
		MinM2.SetStage(45)
		Debug.Trace("fSSEED_MinM2: Stage advanced to 45")
		Self.Disable()
	EndIf
EndEvent
	