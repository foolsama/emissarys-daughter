Scriptname fSSEED_MinM2 extends Quest  Conditional

Int Property PlayerResponse  Auto  Conditional

GlobalVariable Property MinM2Path  Auto  
Scene Property SceneA Auto
Scene Property SceneB Auto
Scene Property SceneC Auto
Scene Property SceneX Auto

Function PickScene()
float Path = MinM2Path.GetValue()
If PlayerResponse == 5
	SceneX.Start()
EndIf
If Path == 1
	SceneA.Start()
EndIf
If Path == 2
	SceneB.Start()
EndIf
If Path == 3
	SceneC.Start()
EndIf
EndFunction
