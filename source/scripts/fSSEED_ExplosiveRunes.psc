Scriptname fSSEED_ExplosiveRunes extends ObjectReference  

Float property Damage auto
Float property PushForce auto
book property Runes auto
actor property PlayerRef auto

function OnRead()

	PlayerRef.PlaceAtMe(Boom as form, 1, false, false)
	PlayerRef.DamageAV("Health", Damage)
	PlayerRef.PushActorAway(PlayerRef, PushForce)
	Self.Disable()

endFunction
Explosion Property Boom  Auto  
