Scriptname fSSEED_SPEL_Sleep extends activemagiceffect  

Actor SleepingActor
Idle Property SleepIdle Auto
Idle Property IdleStopLoose Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

	SleepingActor = akTarget

	If SleepingActor
		SleepingActor.PlayIdle(SleepIdle)
		Utility.Wait(0.2)
		SleepingActor.SetUnconscious(True)
	EndIf

EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If SleepingActor
		SleepingActor.SetUnconscious(False)
		Utility.Wait(0.2)
		SleepingActor.PlayIdle(IdleStopLoose)
	EndIf

EndEvent