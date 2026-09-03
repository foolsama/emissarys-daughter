;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname fSSEED_MinM2_SF_CloseBye_AlDismiss Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(pDialogueFollower as DialogueFollowerScript).DismissFollower(0, 0)
(pStalkerScript as fSSEED_StalkerScript).DismissAlenawe()
GetOwningQuest().SetStage(210)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

quest Property pDialogueFollower  Auto 

Quest Property pStalkerScript Auto
