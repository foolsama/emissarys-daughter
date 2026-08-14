;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname fSSEED_WI_DragonA_QF Extends Quest Hidden

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
Alias_Alenawe.TryToEvaluatePackage()
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
if kmyQuest

kmyQuest.RecordWitnessedSoul()

else

Debug.Trace("fSSEED_WIDragonAbsorb: ERROR - quest script cast failed")

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
debug.trace("fSSEED_WIDragonAbsorb stage 255, shut down stage")
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
