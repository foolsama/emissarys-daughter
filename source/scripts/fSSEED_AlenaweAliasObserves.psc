Scriptname fSSEED_AlenaweAliasObserves extends ReferenceAlias

fSSEED_PlayerBehaviorScript Property Tracker Auto

Event OnCombatStateChanged(Actor akTarget, Int aeCombatState)

	If aeCombatState == 1
		If !Tracker.ObservingCombat
			Tracker.BeginObservedCombat()
		EndIf

	ElseIf aeCombatState == 0
		If Tracker.ObservingCombat
			Tracker.EndObservedCombat()
		EndIf
	EndIf

EndEvent