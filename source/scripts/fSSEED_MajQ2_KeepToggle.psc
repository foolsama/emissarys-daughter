Scriptname fSSEED_MajQ2_KeepToggle extends ObjectReference  

Faction Property KeepFaction  Auto  

Quest Property MajQ2  Auto  

Scene Property Halt  Auto  

Event OnTriggerEnter(ObjectReference akActionRef)
	If MajQ2.GetStage() == 20 && akActionRef == Game.GetPlayer()
		Game.GetPlayer().SetFactionRank(KeepFaction, 0)
		If !Game.GetPlayer().IsSneaking()
			Halt.Start()
		EndIf
	EndIf
EndEvent

Faction Property NorthwatchFaction  Auto  

Faction Property ThalmorFaction  Auto  
