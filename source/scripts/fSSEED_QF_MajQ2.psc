;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 52
Scriptname fSSEED_QF_MajQ2 Extends Quest Hidden

;BEGIN ALIAS PROPERTY AdminKey000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AdminKey000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpawnedMook2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpawnedMook2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hijacker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hijacker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Clerk
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Clerk Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AdminKey
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AdminKey Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Assignment
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Assignment Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alenawe
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alenawe Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpawnedMook3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpawnedMook3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpawnedMook1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpawnedMook1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Boss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Boss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AdminChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AdminChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ledger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ledger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpawnedBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpawnedBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GateGuard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GateGuard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Keep
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Keep Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Strategy
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Strategy Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpawnedMook4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpawnedMook4 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Alenawe receives delivery note
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Note read
;Enable pre-mission conversation
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Keep entered
SetObjectiveCompleted(20)
SetObjectiveDisplayed(40)

; The outer area should look defensible at this stage
; organized supplies, beds, intake records, guards, desks. 
; The original design specifically depends on the operation first appearing calm and procedurally legitimate.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;purge initiated
SetObjectiveDisplayed(70)
Game.GetPlayer().RemoveFromFaction(KeepFaction)
Game.GetPlayer().RemoveFromFaction(NorthwatchFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN AUTOCAST TYPE fSSEED_MajQ2_Script
Quest __temp = self as Quest
fSSEED_MajQ2_Script kmyQuest = __temp as fSSEED_MajQ2_Script
;END AUTOCAST
;BEGIN CODE
; ledger recovered
; The player should be allowed to stealth in, take the ledger, and leave.
; LedgerRecovered = true
LetsGo.Start()
SetObjectiveDisplayed(90)
; turn off reinforcements
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN AUTOCAST TYPE fSSEED_MajQ2_Script
Quest __temp = self as Quest
fSSEED_MajQ2_Script kmyQuest = __temp as fSSEED_MajQ2_Script
;END AUTOCAST
;BEGIN CODE
;Player exits keep
If IsObjectiveDisplayed(40)
SetObjectiveDisplayed(40, false)
EndIf
If IsObjectiveDisplayed(42)
SetObjectiveDisplayed(42, false)
EndIf
If IsObjectiveDisplayed(44)
SetObjectiveDisplayed(44, false)
EndIf
SetObjectiveCompleted(90)
; freeze Tracker.Class / .Pattern tracking
(Tracker as fSSEED_PlayerBehaviorScript).FreezeBehaviorProfile()
;Remove "stolen" books
Game.GetPlayer().RemoveItem(log, 1)
Alias_Alenawe.GetReference().AddItem(log, 1)
Game.GetPlayer().RemoveItem(memo, 1)
Alias_Alenawe.GetReference().AddItem(memo, 1)
Game.GetPlayer().RemoveItem(guidance, 1)
Alias_Alenawe.GetReference().AddItem(guidance, 1)
Game.GetPlayer().RemoveItem(Alias_Ledger.GetReference(), 1)
Alias_Alenawe.GetReference().AddItem(Alias_Ledger.GetReference(), 1)
Game.GetPlayer().RemoveItem(Alias_Strategy.GetReference(), 1)
Alias_Alenawe.GetReference().AddItem(Alias_Strategy.GetReference(), 1)
Game.GetPlayer().RemoveItem(log, 1)
Alias_Alenawe.GetReference().AddItem(log, 1)
; fire Alenawe delay line
; Set processing timer for post-mission conversation
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN CODE
; Narrative closure
SetObjectiveCompleted(100)
MS09TriggerDisabler.Enable()
; Set MajQ2 completion date
; unlock conversations
; unlock tier 4 content
; arc complete
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN CODE
; Clean-up and shutdown
Alias_Hijacker.GetReference().Disable()
; Disbale surviving actors and quest objects
; Unset quest object flag where appropriate
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Conversation complete
;Enable cell hijack
MajQ2Script.SaveMS09()
Alias_Hijacker.GetReference().Enable()
MS09TriggerDisabler.Disable()
;Enable/Reset exterior guards
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Fill Alenawe, player, ledger, administrator, captive, and site aliases.
;Reset quest script variables.
;Prepare the delivery.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_48
Function Fragment_48()
;BEGIN CODE
;Hold pattern before Purge
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_50
Function Fragment_50()
;BEGIN CODE
; Guard escorts us to Clerk
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
; post-mission conversation available
MajQ2Script.CleanMS09()
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property GameDaysPassed  Auto  

Quest Property Tracker  Auto  

GlobalVariable Property Playstyle  Auto  

fSSEED_MajQ2_Script Property MajQ2Script  Auto
Faction Property KeepFaction  Auto  

Faction Property ThalmorFaction  Auto  

Faction Property NorthwatchFaction  Auto  

ObjectReference Property MS09TriggerDisabler  Auto  

ObjectReference Property Reinforcements  Auto  

Scene Property Sneaky  Auto  

ObjectReference Property Guidance  Auto  

ObjectReference Property log  Auto  

ObjectReference Property Memo  Auto  

Scene Property KeepExit  Auto  

Scene Property LetsGo  Auto  
