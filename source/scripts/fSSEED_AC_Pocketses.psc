Scriptname fSSEED_AC_Pocketses extends ReferenceAlias  

Book Property ExplodingRune Auto

Bool RuneTemporarilyAdded = False

Event OnActivate(ObjectReference akActionRef)

	Actor PlayerRef = Game.GetPlayer()

	if akActionRef != PlayerRef
		return
	endif

	Actor Alenawe = GetActorReference()

	if Alenawe == None
		return
	endif

	; A pickpocket attempt begins as a sneaking activation.
	if PlayerRef.IsSneaking()

		Debug.Trace("FSSEED:Pickpocket - sneaking activation on Alenawe")

		if Alenawe.GetItemCount(ExplodingRune) == 0
			Alenawe.AddItem(ExplodingRune, 1, True)
			RuneTemporarilyAdded = True
		endif

		; Give the game a moment to open the pickpocket menu.
		Utility.WaitMenuMode(0.25)

		; Stay here while a paused menu is open.
		while Utility.IsInMenuMode()
			Utility.WaitMenuMode(0.1)
		endwhile

		; If the player didn't steal it, clean it back out.
		if RuneTemporarilyAdded
			if Alenawe.GetItemCount(ExplodingRune) > 0
				Alenawe.RemoveItem(ExplodingRune, 1, True)
				Debug.Trace("FSSEED:Pickpocket - unused rune removed")
			else
				Debug.Trace("FSSEED:Pickpocket - player took Alenawe's rune")
			endif

			RuneTemporarilyAdded = False
		endif
	endif
EndEvent
