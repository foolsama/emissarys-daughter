Scriptname fSSEED_MinM2_ParkTrigger_Script extends ObjectReference  

fSSEED_MinM2 Property Controller Auto

Event OnTriggerEnter(ObjectReference akActionRef)
	If Controller == None
		Debug.Trace("fSSEED_MinM2: Park trigger has no Controller")
		Return
	EndIf

	Int stage = Controller.GetStage()
	Actor Who = akActionRef as Actor
	Debug.Trace("fSSEED_MinM2: Park trigger actor=" + akActionRef + ", cast=" + Who + ", stage=" + stage)

	If stage == 30 || stage == 45
		If Who == None
			Debug.Trace("fSSEED_MinM2: Park trigger ignored non-Actor reference")
		ElseIf Who == Game.GetPlayer()
			Debug.Trace("fSSEED_MinM2: Park trigger ignored player")
		ElseIf !Who.IsPlayerTeammate()
			Debug.Trace("fSSEED_MinM2: Park trigger ignored non-teammate " + Who)
		Else
			Controller.ParkFollower(Who)
		EndIf
	Else
		Debug.Trace("fSSEED_MinM2: Park trigger ignored at stage " + stage)
	EndIf
EndEvent