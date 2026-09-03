Scriptname fSSEED_MajQ2_Stealth extends ObjectReference  

fSSEED_MajQ2_Script Property MajQ2Script Auto
Quest Property MajQ2 Auto
Actor Property Player Auto
Actor Property Guard Auto
Cell Property Keep Auto

Event OnTriggerEnter(Objectreference akActionRef)
	If MajQ2.GetStage() == 20 && akActionRef == Player
		MajQ2Script.Result = 2
		MajQ2.SetStage(40)
		Utility.Wait(1.0)
		MajQ2.SetStage(50)
	EndIf
	If MajQ2.GetStage() == 22 && akActionRef == Guard
		ClerkScene.Start()
	EndIf
EndEvent
Scene Property ClerkScene  Auto  
