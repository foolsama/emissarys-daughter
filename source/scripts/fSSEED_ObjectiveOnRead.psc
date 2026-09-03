Scriptname fSSEED_ObjectiveOnRead extends ObjectReference  

Quest Property QustForObj  Auto  
Int Property Objective Auto
Int Property evidenceID Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	If akNewContainer == Game.GetPlayer()
		Debug.Trace("fSSEED_OnRead: " + Self.GetName() + " changed to player inventory.")
		(QustForObj as fSSEED_MajQ2_Script).RegisterEvidence(evidenceID)
		If !QustForObj.IsObjectiveDisplayed(Objective)
			QustForObj.SetObjectiveDisplayed(Objective)
		EndIf
	EndIf
EndEvent
