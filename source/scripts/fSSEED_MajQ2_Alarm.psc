Scriptname fSSEED_MajQ2_Alarm extends ObjectReference  

Quest Property CallingQuest Auto
Int Property StageToSet Auto
Faction Property KeepFaction Auto
fSSEED_MajQ2_Script Property MajQ2Script Auto

Event OnTriggerEnter(ObjectReference akActionRef)
	If akActionRef == Game.GetPlayer() && CallingQuest.GetStage() < StageToSet
		If MajQ2Script.Result == 0
			MajQ2Script.Result = 2
		EndIf
		CallingQuest.SetStage(50)
		Debug.Trace("fSSEED_MajQ2: Keep purge protocal initiated by trigger entry")
	EndIf
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	If akActionRef == Game.GetPlayer() && CallingQuest.GetStage() >=80 && MajQ2Script.Result != 3
		Game.GetPlayer().AddToFaction(KeepFaction)
		Debug.Trace("fSSEED_MajQ2: Player added to " + KeepFaction + " to regain exterior harmony")
	EndIf
EndEvent
		
