;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname ffSSEED_MajQ1_QF_Stages Extends Quest Hidden

;BEGIN ALIAS PROPERTY Leader
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Leader Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Mine
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Mine Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alenawe
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alenawe Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HabitationCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HabitationCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Letter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Letter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QuestGiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestGiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Courier
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Courier Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ledger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ledger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Habitation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Habitation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CourierHome
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CourierHome Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Set stage, initialize aliases
RegisterForUpdate(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;diary read. Shut off objective, enable Alenawe dialogue
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Note read. Set up radiant location
UnRegisterForUpdate()
Alias_Courier.getReference().moveto(Alias_CourierHome.getReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;player and Alenawe in good spot, move courier and fire scene
ObjectReference Courier = Alias_Courier.getReference()
Courier.moveto(Alias_HabitationCenterMarker.getReference())
Courier.enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

WICourierScript Property CourierScript  Auto  

Scene Property CourierScene  Auto  
