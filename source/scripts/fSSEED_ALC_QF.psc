;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname fSSEED_ALC_QF Extends Quest Hidden

;BEGIN ALIAS PROPERTY aPlayer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_aPlayer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlenaweDismissHome
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_AlenaweDismissHome Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alenawe
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alenawe Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alonythil
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alonythil Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Track Alonythil
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Track Alenawe
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; Mission Complete
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
