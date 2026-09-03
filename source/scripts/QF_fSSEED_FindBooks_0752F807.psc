;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 15
Scriptname QF_fSSEED_FindBooks_0752F807 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Book1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Book1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Book3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Book3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Book2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Book2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alenawe
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alenawe Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Wishlist
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Wishlist Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
SetObjectiveCompleted(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE fSSEED_FindBooks_Script
Quest __temp = self as Quest
fSSEED_FindBooks_Script kmyQuest = __temp as fSSEED_FindBooks_Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.GetRandomBook()
Utility.Wait(0.5)
Game.GetPlayer().AddItem(Alias_Wishlist.GetReference(),1)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
