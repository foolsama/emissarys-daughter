Scriptname fSSEED_SPEL_SleepScript extends activemagiceffect  

Actor Property Alenawe Auto
Spell Property SleepSpell Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Debug.Trace("fSSEED StealthCommand: caster=" + akCaster + " target=" + akTarget)

	If !akTarget
		Debug.Trace("fSSEED StealthCommand: No actor target")
		Return
	EndIf

	If !Alenawe || Alenawe.IsDead()
		Return
	EndIf

	If Alenawe.GetDistance(akCaster) > 2500.0
		Return
	EndIf

	If akTarget.IsDead() || akTarget.IsInCombat()
		Return
	EndIf

	Debug.Trace("fSSEED StealthCommand: Alenawe sleeping " + akTarget)

	SleepSpell.Cast(Alenawe, akTarget)

EndEvent
