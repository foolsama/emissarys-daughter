;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname fSSEED_AC_Recruit_TIF_Late Extends TopicInfo Hidden

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
If !GetOwningQuest().GetStage() == 10
    GetOwningQuest().SetStage(10)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDialogueFollower  Auto  

Quest Property pAlenaweIntro  Auto  

GlobalVariable Property DateFollowed  Auto  

GlobalVariable Property GameDays  Auto  

GlobalVariable Property DateDismissed  Auto  

Quest Property Conversations  Auto  
