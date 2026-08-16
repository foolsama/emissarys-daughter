Scriptname fSSEED_MinM2_ParkTrigger_Script extends ObjectReference  

fSSEED_MinM2 Property Controller Auto

Event OnTriggerEnter(ObjectReference akActionRef)
	If Controller.GetStage() == 30 || Controller.GetStage() == 45
		Actor Who = akActionRef as Actor
		If Who != None && Who != Game.GetPlayer() && Who.IsPlayerTeammate()
			Controller.ParkFollower(Who)
		EndIf
	EndIf
EndEvent