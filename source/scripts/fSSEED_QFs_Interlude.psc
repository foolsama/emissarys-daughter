;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 32
Scriptname fSSEED_QFs_Interlude Extends Quest Hidden

;BEGIN ALIAS PROPERTY Courier
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Courier Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Delphine
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Delphine Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alenawe
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alenawe Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN AUTOCAST TYPE fSSEED_InterludeScript
Quest __temp = self as Quest
fSSEED_InterludeScript kmyQuest = __temp as fSSEED_InterludeScript
;END AUTOCAST
;BEGIN CODE
; Late recruitment Clinical start
kmyQuest.AffinitySave = Affinity.GetValue()
Affinity.Mod(-40)
kmyQuest.StabilitySave = Stability.GetValueInt()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;player has brought up behavior difference
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE fSSEED_InterludeScript
Quest __temp = self as Quest
fSSEED_InterludeScript kmyQuest = __temp as fSSEED_InterludeScript
;END AUTOCAST
;BEGIN CODE
;MinM1 or 2 has completed
;restore affinity
If kmyQuest.AffinitySave > 0
Affinity.Mod(40)
If Stability.GetValue() < kmyQuest.StabilitySave
Stability.SetValue(kmyQuest.StabilitySave)
EndIf
EndIf
;shut quest down
DateDone.SetValue(GameDaysPassed.GetValue())
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;Player exited cave, set up forcegreet
PostMissionFG.Start()
SetObjectiveCompleted(20)
DateEmbassyBreached.SetValue(GameDaysPassed.GetValue())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE fSSEED_InterludeScript
Quest __temp = self as Quest
fSSEED_InterludeScript kmyQuest = __temp as fSSEED_InterludeScript
;END AUTOCAST
;BEGIN CODE
;Alenawe has received note from Elenwen
UnRegisterForUpdate()
;set affinity back (temporarily)
kmyQuest.AffinitySave = Affinity.GetValue()
Affinity.Mod(-40)
kmyQuest.StabilitySave = Stability.GetValueInt()
If Stability.GetValue()== 3
Stability.SetValue(2)
EndIf
Debug.Trace("fSSEED_I: Affinity temporarily adjusted down")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE fSSEED_InterludeScript
Quest __temp = self as Quest
fSSEED_InterludeScript kmyQuest = __temp as fSSEED_InterludeScript
;END AUTOCAST
;BEGIN CODE
;Late recruitment Supportive start
kmyQuest.AffinitySave = Affinity.GetValue()
Affinity.Mod(-40)
kmyQuest.StabilitySave = Stability.GetValueInt()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN AUTOCAST TYPE fSSEED_InterludeScript
Quest __temp = self as Quest
fSSEED_InterludeScript kmyQuest = __temp as fSSEED_InterludeScript
;END AUTOCAST
;BEGIN CODE
; Late recruitment dick start
kmyQuest.AffinitySave = Affinity.GetValue()
Affinity.Mod(-40)
kmyQuest.StabilitySave = Stability.GetValueInt()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
; If MQ201 has completed, and Alenawe not yet recruited, bypass previous stages and start here
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Pre-mission FG done
;Hints and tips conversation topic available
UnregisterforUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
;briefing given, begin interrupt scene
UnregisterforUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;First ask about letter
InterludeCourierQuest.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE fSSEED_InterludeScript
Quest __temp = self as Quest
fSSEED_InterludeScript kmyQuest = __temp as fSSEED_InterludeScript
;END AUTOCAST
;BEGIN CODE
;set up courier
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Alenawe ready for conversation
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player has debriefed Alenawe
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Blade in the Dark finished, set aliases and begin dialogue options, listen for quest stages
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property GameDaysPassed  Auto  

GlobalVariable Property DateDone  Auto  

Scene Property PreMissionFG  Auto  

GlobalVariable Property Affinity  Auto  

GlobalVariable Property Stability  Auto  

Scene Property PostMissionFG  Auto   

Scene Property CourierDelivery  Auto  

GlobalVariable Property DateEmbassyBreached  Auto  

Quest Property InterludeCourierQuest  Auto  
