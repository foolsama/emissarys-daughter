Scriptname fSSEED_ObjAorB extends ReferenceAlias  

Quest Property CallingQuest  Auto  
Int Property Obj1  Auto  
Int Property Obj2  Auto  
Int Property StageToSet  Auto  
Scene Property SceneToStart  Auto  

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	If akNewContainer == Game.GetPlayer()
		Debug.Trace("fSSEED Objective Script: moved to Player inventory.")
		If CallingQuest.IsObjectiveCompleted(Obj1) && CallingQuest.IsObjectiveCompleted(Obj2)
			Utility.Wait(0.5)
			ScenetoStart.Start()
			If StageToSet
				CallingQuest.SetStage(StageToSet)
				Debug.Trace("fSSEED Objective Script: " + CallingQuest + " set to Stage " + StageToSet)
			EndIf
		EndIf
	EndIf
EndEvent
