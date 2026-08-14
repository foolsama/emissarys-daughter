Scriptname fSSEED_AC_AliasPlayerScript extends ReferenceAlias

Scene Property FossilTier1Scene Auto
Scene Property FossilTier2Scene Auto

Keyword FOS_T1
Keyword FOS_T2

Bool FormsChecked = False
Bool DispatchScheduled = False
Bool CoolingDown = False
Int PendingTier = 0

Event OnInit()
	ResolveFossilForms()
EndEvent

Function ResolveFossilForms()
	FormsChecked = True

	FOS_T1 = Game.GetFormFromFile(0x00050D3D, "Fossilsyum.esp") as Keyword
	FOS_T2 = Game.GetFormFromFile(0x00050D3E, "Fossilsyum.esp") as Keyword

	Debug.Trace("FSSEED:LootReaction - Fossil forms:" + " T1=" + FOS_T1 + " T2=" + FOS_T2)
EndFunction

Event OnItemAdded(	Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	If !FormsChecked
		ResolveFossilForms()
	EndIf

	If akBaseItem == None || CoolingDown
		Return
	EndIf
	
	Int tier = 0

	If akSourceContainer && akBaseItem.GetGoldValue() >= 1000 && tier == 0
		QueueLootReaction(2)
	EndIf

	; Check the more valuable category first.
	If FOS_T2 && akBaseItem.HasKeyword(FOS_T2)
		tier = 2
	ElseIf FOS_T1 && akBaseItem.HasKeyword(FOS_T1)
		tier = 1
	EndIf

	If tier > 0
		Debug.Trace("FSSEED:LootReaction - Fossil added:" 	+ " item=" + akBaseItem	+ " tier=" + tier + " count=" + aiItemCount	+ " source=" + akSourceContainer)
		QueueLootReaction(tier)
	EndIf
EndEvent

Function QueueLootReaction(Int aiTier)
	If CoolingDown
		Return
	EndIf

	; An excavation may award several fossils together.
	; Retain the highest tier received during the short window.
	If aiTier > PendingTier
		PendingTier = aiTier
	EndIf

	If !DispatchScheduled
		DispatchScheduled = True
		RegisterForSingleUpdate(0.75)
	EndIf
EndFunction

Event OnUpdate()
	If DispatchScheduled
		DispatchScheduled = False
		CoolingDown = True

		Int tier = PendingTier
		PendingTier = 0

		If tier >= 2
			If FossilTier2Scene
				FossilTier2Scene.Start()
			EndIf
		ElseIf tier == 1
			If FossilTier1Scene
				FossilTier1Scene.Start()
			EndIf
		EndIf

		; Prevent several additions from producing overlapping remarks.
		RegisterForSingleUpdate(15.0)
		Return
	EndIf

	If CoolingDown
		CoolingDown = False
	EndIf
EndEvent