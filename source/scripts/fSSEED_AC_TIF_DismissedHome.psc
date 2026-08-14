;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname fSSEED_AC_TIF_DismissedHome Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; don't dismiss the follower again if I've already dismissed them
If !(akspeaker.IsInFaction(DismissedFollowerFaction))
  (pDialogueFollower as DialogueFollowerScript).DismissFollower(0, 0)
  (pStalkerScript as fSSEED_StalkerScript).DismissAlenawe()
EndIf
DateDismissed.SetValue(GameDaysPassed.GetValue())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property DismissedFollowerFaction  Auto  

Quest Property pDialogueFollower  Auto  

Quest Property pStalkerScript  Auto  

GlobalVariable Property DateDismissed  Auto  

GlobalVariable Property GameDaysPassed  Auto  
