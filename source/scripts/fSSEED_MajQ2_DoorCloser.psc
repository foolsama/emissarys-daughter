Scriptname fSSEED_MajQ2_DoorCloser extends ObjectReference  

ObjectReference Property Clerk Auto
ObjectReference Property PrivateDoor Auto
Quest Property MajQ2 Auto

Event OnTriggerEnter(Objectreference akActionRef)
	If akActionRef == Clerk && MajQ2.GetStage() >= 20 && MajQ2.GetStage() < 80
		PrivateDoor.Activate(Clerk)
		Debug.Trace("fSSEED_MajQ2: Door close attempted")
		Self.Disable()
	EndIf
EndEvent