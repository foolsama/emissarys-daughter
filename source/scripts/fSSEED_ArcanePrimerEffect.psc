Scriptname fSSEED_ArcanePrimerEffect extends activemagiceffect  

Actor Property PlayerRef Auto
Spell Property DetonationSpell Auto

Actor PrimedTarget
Bool Detonated = False

Event OnEffectStart(Actor akTarget, Actor akCaster)
	PrimedTarget = akTarget
EndEvent

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)

	If Detonated
		Return
	EndIf

	If akCaster != PlayerRef
		Return
	EndIf

	If akEffect.GetAssociatedSkill() != "Destruction"
		Return
	EndIf

	Detonated = True

	DetonationSpell.Cast(PlayerRef, PrimedTarget)

	Dispel()

EndEvent