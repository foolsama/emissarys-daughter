;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 19
Scriptname fSSEED_MajQ1_QF_Stages Extends Quest Hidden

;BEGIN ALIAS PROPERTY Letter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Letter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Habitation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Habitation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Mine
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Mine Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BossChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HabitationCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HabitationCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QuestGiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestGiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CourierHome
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CourierHome Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alenawe
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alenawe Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ledger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ledger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Courier
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Courier Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Diary
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Diary Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SponsorNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SponsorNote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MookChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MookChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Leader
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Leader Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
Float Days = GameDaysPassed.GetValue()
MajQ1DaysPassed.SetValue(Days)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Note read, start PD1_FG
FGScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE fSSEED_MajQ1_Script
Quest __temp = self as Quest
fSSEED_MajQ1_Script kmyQuest = __temp as fSSEED_MajQ1_Script
;END AUTOCAST
;BEGIN CODE
;Init Courier
(CourierScript as WICourierScript).addAliasToContainer(Alias_Letter)
Debug.trace("fSSEED_MajQ1: " + Alias_Letter + "added to courier")

Location MineLocation = Alias_Mine.GetLocation()

If MineLocation.IsCleared() && !Game.GetPlayer().IsInLocation(MineLocation)
Debug.Trace("fSSEED_MajQ1: - Mine was cleared; scheduling reset")
MineLocation.SetCleared(False)
MineInteriorCell.Reset()
Bandit1.Reset()
Bandit2.Reset()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Note discussed. Set up radiant location
Alias_Courier.getReference().moveto(Alias_CourierHome.getReference())
SetObjectiveDisplayed(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Set stage, initialize aliases
RegisterForUpdate(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE fSSEED_MajQ1_Script
Quest __temp = self as Quest
fSSEED_MajQ1_Script kmyQuest = __temp as fSSEED_MajQ1_Script
;END AUTOCAST
;BEGIN CODE
;Mine entered, turn off map marker
SetObjectiveDisplayed(15, false)
If PlayStyle.GetValue() == 0
kmyQuest.SetPlayerPlaystyle()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Alenawe wandered off and needs prompting
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;diary read. Shut off objective, enable Alenawe dialogue
SetObjectiveCompleted(15)
SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

WICourierScript Property CourierScript  Auto  
 
Scene Property FGScene Auto

GlobalVariable Property MajQ1DaysPassed  Auto  

GlobalVariable Property GameDaysPassed  Auto  

Cell Property MineInteriorCell Auto

ObjectReference Property Bandit1  Auto  
ObjectReference Property Bandit2  Auto  

GlobalVariable Property Playstyle  Auto  
