;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 44
Scriptname fSSEED_QF_MajQ2 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Hijacker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hijacker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alenawe
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alenawe Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Keep
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Keep Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Conversation complete
;Enable cell hijack
Alias_Hijacker.GetReference().Enable()
;Enable/Reset exterior guards
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
;Path A resolution
; Alenawe chooses to make the operation institutionally legible in a form that cannot be quietly buried.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
; Captive released = True
; (imp prison door script)
; captive receives simple travel package
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
; master ledger reached
; OnAcitvate/Conatiner open trigger, not OnRead() or AddItem
; Play Alenawe line identifying it
; Objective compelte OnRead
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
; Inner section breached
; Sanitation stage
SetObjectiveDisplayed(70)
; admin package: travel to idle marker, use (burn), flee
; enable burning-paper effects/destroyed records
; Enable inner reinforcement group
; enemy reaction bark
; lock one route out/area for tension
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;Classification system exposed
; Triggered by a middle-zone box, a routing document, or the player reaching the cells.
; Increment evidence
; Play Alenawe's first genuinely unsettled line
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Outer-layer evidence encountered
; Alenawe makes an operational observation
; Count 1st evidence category
; Establish site is not merely a prison

; 1st evidence should be plausible: names, intake dates, confiscated belongings,
; health/skill assessments
; routing recommendations
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Keep entered
SetObjectiveCompleted(20)
SetObjectiveDisplayed(40)
;Burn notice given and scrambling package activated

; The outer area should look defensible at this stage
; organized supplies, beds, intake records, guards, desks. 
; The original design specifically depends on the operation first appearing calm and procedurally legitimate.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
; Strategic Connection found
; Inner correspondence read
; Increment evidence
; Alenawe recognizes that the operation is preserving or manufacturing instability rather than merely responding to it.
SetObjectiveCompleted(40)
SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
; Path C resolution
; Alenawe divides and curates the evidence through the network she proposed in MinQ2.
; mark network as active, enable Path C comments/packages
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
; ledger recovered
; The player should be allowed to stealth in, take the ledger, and leave.
; LedgerRecovered = true
SetObjectiveCompleted(70)
SetObjectiveDisplayed(90)
; turn off reinforcements
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
;Player exits keep
SetObjectiveCompleted(90)
; fire Alenawe delay line
; Set processing timer for post-mission conversation
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Fill Alenawe, player, ledger, administrator, captive, and site aliases.
;Reset quest script variables.
;Prepare the delivery.
; freeze Tracker.Class / .Pattern tracking
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
; Path B resolution
; Alenawe witholds or destroys the records
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
; post-mission conversation available
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Note read
;Enable pre-mission conversation
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Alenawe receives delivery note
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN CODE
; Narrative closure
SetObjectiveCompleted(100)
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

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property GameDaysPassed  Auto  
