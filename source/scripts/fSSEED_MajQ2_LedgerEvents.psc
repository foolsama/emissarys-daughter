Scriptname fSSEED_MajQ2_LedgerEvents extends ReferenceAlias  

Quest Property MajQ2 Auto  
fSSEED_MajQ2_Script Property MajQ2Script Auto
Int Property Obj1  Auto  
Int Property Obj2  Auto  
Int Property StageToSet  Auto  
Scene Property SceneToStart  Auto  

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	If akNewContainer == Game.GetPlayer()
		Debug.Trace("fSSEED Objective Script: moved to Player inventory.")
		If MajQ2.IsObjectiveCompleted(Obj1) && MajQ2.IsObjectiveCompleted(Obj2)
			Utility.Wait(0.5)
			ScenetoStart.Start()
			If StageToSet
				MajQ2.SetStage(StageToSet)
				Debug.Trace("fSSEED Objective Script: " + MajQ2 + " set to Stage " + StageToSet)
			EndIf
		EndIf
	EndIf
EndEvent