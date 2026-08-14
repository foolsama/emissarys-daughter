Scriptname fSSEED_WI_MG06_KillHimTrigger extends ObjectReference  

Actor Property Paratus  Auto  

Scene Property KillHim  Auto  

Event OnLoad()
	Debug.Trace("fSSEED_WI_MG06 TriggerBox Loaded")
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	Debug.Trace("fSSEED_WI_MG06 Trigger left by " +akActionRef)
	If akActionRef == Game.GetPlayer() && MG06.GetStage() >= 60
		Paratus.SetAV("Health", 10)
		Paratus.SetAV("Aggression", 3)
		Paratus.SetAV("Confidence", 4)
		KillHim.Start()
		Self.Disable()
	endif
EndEvent

Quest Property mg06  Auto  
