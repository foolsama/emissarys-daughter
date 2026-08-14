;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname fSSEED_AC_TIF_Hello_ShallWe Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(pDialogueFollower as DialogueFollowerScript).SetFollower(akspeaker)
Float currentDay = GameDays.GetValue()
if DateDismissed.GetValue() >= 0.0
   
   if currentDay - DateDismissed.GetValue() >= 1.0

        DateFollowed.SetValue(currentDay)

    endif

    else

    ; first time

    DateFollowed.SetValue(currentDay)

    endif
Conversations.Start()
If !AC.GetStage() == 10
    AC.SetStage(10)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property Conversations  Auto  

GlobalVariable Property DateDismissed  Auto  

GlobalVariable Property DateFollowed  Auto  

GlobalVariable Property GameDays  Auto  

Quest Property pDialogueFollower  Auto  

Quest Property AC  Auto  
