Scriptname fSSEED_OnReadObjComp extends ObjectReference  

Quest Property CallingQuest Auto
Int Property ObjToComplete Auto

Event OnRead()
	Debug.Trace("fSSEED: " + Self +  " read. Setting Objective " + ObjToComplete + " complete.")
	CallingQuest.SetObjectiveCompleted(ObjToComplete)
EndEvent
