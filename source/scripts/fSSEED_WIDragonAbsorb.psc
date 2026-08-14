Scriptname fSSEED_WIDragonAbsorb extends Quest  Conditional

GlobalVariable Property SoulsWitnessed Auto

Function RecordWitnessedSoul()
	SoulsWitnessed.Mod(1)

	Debug.Trace("fSSEED_WIDragonAbsorb: Souls Witnessed=" + SoulsWitnessed.Getvalue())

	RegisterForSingleUpdate(10.0)
EndFunction

Event OnUpdate()
	Debug.Trace("fSSEED_WIDragonAbsorb: stopping event quest")
	Stop()
EndEvent