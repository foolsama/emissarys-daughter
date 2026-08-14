;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_fSSEED_WIDragonAbsorb_072D96FB Extends Quest Hidden

;BEGIN ALIAS PROPERTY AlLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_AlLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alenawe
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alenawe Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DRAGON
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DRAGON Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE fSSEED_WIDragonAbsorb
Quest __temp = self as Quest
fSSEED_WIDragonAbsorb kmyQuest = __temp as fSSEED_WIDragonAbsorb
;END AUTOCAST
;BEGIN CODE
debug.trace("fSSEED_WIDragonKilled stage 0, start up stage")

;reminder: scene starts when quest starts

;See also:
;WIFunctionsScript:
;  startWIDragonKillQuest()
;  PlayerIsCurrentlyAbsorbingPower()
;  PlayerIsDoneAbsorbingPower()

;DragonActorScript
;  onDeath() in which calls to the above functions are made

;MQKillDragonScript:
;  DeathSequence() in which calls to the above functions are made

; debug.trace("WIDragonKilled stage 0, start up stage, EVPing alias")
Alias_Alenawe.TryToEvaluatePackage()

; debug.trace("WIDragonKilled stage 0, calling RegisterDragonAttack()")
kmyquest.WI.RegisterDragonAttack(Alias_AlLocation.GetLocation(), Alias_Dragon.GetActorReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE fSSEED_WIDragonAbsorb
Quest __temp = self as Quest
fSSEED_WIDragonAbsorb kmyQuest = __temp as fSSEED_WIDragonAbsorb
;END AUTOCAST
;BEGIN CODE
;the scene has completed once through, so set a timer to shut down quest
kmyQuest.SoulsWitnessed += 1

debug.trace("fSSEED_WIDragonAbsorb: Souls Witnessed=" + kmyQuest.SoulsWitnessed)
RegisterForSingleUpdate(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; debug.trace("WIDragonKilled stage 255, shut down stage")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
