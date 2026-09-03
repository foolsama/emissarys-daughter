Scriptname fSSEED_ALC_PlayerAliasObserved extends ReferenceAlias  

fSSEED_PlayerBehaviorScript Property Tracker Auto

Event OnSpellCast(Form akSpell)

	If !Tracker.ObservingCombat
		Return
	EndIf

	Spell CastSpell = akSpell as Spell

	If CastSpell
		Tracker.RegisterSpellCast()
	EndIf

EndEvent

Event OnPlayerBowShot(Weapon akWeapon, Ammo akAmmo, Float afPower, Bool abSunGazing)
	(Tracker as fSSEED_PlayerBehaviorScript).RegisterBowShot()
EndEvent