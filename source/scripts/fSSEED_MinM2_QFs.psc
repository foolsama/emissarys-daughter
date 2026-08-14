;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname fSSEED_MinM2_QFs Extends Quest Hidden

;BEGIN ALIAS PROPERTY Request
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Request Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY aAlenawe
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_aAlenawe Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY aAlonythil
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_aAlonythil Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;scene complete, start alenawe processing, wait some time
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;meeting reached, start scene
MinM2.SetObjectiveCompleted(30)
Meeting.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
If MinM2.ISObjectiveDisplayed(30)
  MinM2.SetObjectiveCompleted(30)
EndIf
If MinM2.ISObjectiveDisplayed(100)
  MinM2.SetObjectiveFailed(100)
EndIf
;Remove/unflad quest items
;Shut down mod quests
If ALT.IsRunning()
ALT.Stop()
EndIf
If Conv.IsRunning()
Conv.SetStage(100)
EndIf
MB.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;received deaddrop
;CourierScript.AddItemToContainer(Alias_Request.GetReference())
Mentor.MoveTo(MMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;alenawe followup
MinM2.SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;player accepted, point to meeting. 
MinM2.SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;quest complete
MinM2.SetObjectiveCompleted(100)
DateDone.SetValue(GameDaysPassed.GetValue())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Init quest, set aliases, pop idle line.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
; idle line spoken, waiting for player engagement.
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

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property Meeting  Auto  

Quest Property MinM2  Auto  

Actor Property Mentor  Auto  

ObjectReference Property MMarker  Auto  

GlobalVariable Property GameDaysPassed  Auto  

GlobalVariable Property DateDone  Auto  

WICourierScript Property CourierScript  Auto  

Quest Property conv  Auto  

Quest Property MB  Auto  

Quest Property alt  Auto  
