Scriptname fSSEED_AC_ModChecker extends Quest Conditional

Bool Property ccRisingDeadStage40Done Auto Conditional

Quest RisingDeadQuest

Event OnInit()
	CheckOptionalContent()
EndEvent

Function CheckOptionalContent()
	; Replace this placeholder with the quest's local FormID.
	RisingDeadQuest = Game.GetFormFromFile(0x01783D, "ccbgssse003-zombies.esl") as Quest

	If RisingDeadQuest
		ccRisingDeadStage40Done = RisingDeadQuest.GetStageDone(40)

		Debug.Trace("FSSEED: Rising Dead current stage=" + RisingDeadQuest.GetStage() + ", stage 40 done=" + ccRisingDeadStage40Done)
	Else
		ccRisingDeadStage40Done = False
		Debug.Trace("FSSEED: Rising Dead quest not found")
	EndIf
EndFunction