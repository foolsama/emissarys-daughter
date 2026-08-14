;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname ffSSEED_MissionBegins_QFs Extends Quest Hidden

;BEGIN ALIAS PROPERTY aAlanawe
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_aAlanawe Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY aMentor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_aMentor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY aPlayer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_aPlayer Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Alduin defeated or Thalmor now irrelevant/mission abandoned.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Late recruitment stage. Initial conversation had.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
; First lines spoken
; If Alonythil too far, move him closer
If Alias_aAlanawe.GetRef().GetDistance(Alias_aMentor.GetRef()) > 500
Alias_aMentor.GetRef().MoveTo(Alias_aAlanawe.GetRef())
Alias_aMentor.TryToEvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; Player has become relevant, observation mission begins.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; player has caught up with alenawe, mentor scene plays out.
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
