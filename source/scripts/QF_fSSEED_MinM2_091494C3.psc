;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_fSSEED_MinM2_091494C3 Extends Quest Hidden

;BEGIN ALIAS PROPERTY aAlonythil
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_aAlonythil Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY aAlenawe
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_aAlenawe Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;alenawe followup
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;received deaddrop
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;player defers
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;quest complete
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;player accepted, point to meeting. Send Alonythil, clear location
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;scene complete, start alenawe processing, wait some time
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Alenawe has spoken with player
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;meeting reached, start scene
Meeting.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property Meeting  Auto  

Location Property Campsite  Auto  

ObjectReference Property MMarker  Auto  

Actor Property Mentor  Auto  
