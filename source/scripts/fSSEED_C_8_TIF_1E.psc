;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname fSSEED_C_8_TIF_1E Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
fSSEED_Convo_Tracker tracker = Conv as fSSEED_Convo_Tracker
if tracker == None
    tracker = GetOwningQuest() as fSSEED_Convo_Tracker
endif
if tracker != None
    tracker.Convo8 = 20
else
    Debug.Trace("fSSEED_C_8_TIF_1E: Convo tracker is None")
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property conv  Auto  


