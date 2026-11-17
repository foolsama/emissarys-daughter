Scriptname fSSEED_MajQ2_KeepToggle extends ObjectReference  

Quest Property MajQ2  Auto  

Scene Property Halt  Auto  

Event OnTriggerEnter(ObjectReference akActionRef)
	If MajQ2.GetStage() == 20 && akActionRef == Game.GetPlayer()
		If !Game.GetPlayer().IsSneaking()
			Halt.Start()
		EndIf
	EndIf
EndEvent
