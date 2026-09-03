Scriptname fSSEED_MajQ2ParleyActor extends ReferenceAlias  

fSSEED_MajQ2_Script Property MajQ2Script Auto
Quest Property MajQ2 Auto
ObjectReference Property ReinforcementsEnabler  Auto  
Actor Property PlayerRef Auto

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
	Actor AggressorActor = akAggressor as Actor
	If AggressorActor == PlayerRef || AggressorActor.IsPlayerTeammate()
		If MajQ2Script.ParleyActive
			MajQ2Script.BreakParley()
			Debug.Trace("fSSEED Parley Script: Player agressed, breaking parley") 
		EndIf
		If MajQ2.GetStage() < 50
			MajQ2.SetStage(50)
			ReinforcementsEnabler.Enable()
		EndIf
	EndIf
EndEvent


