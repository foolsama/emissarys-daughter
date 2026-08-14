;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname fSSEED_MinM2_2A_TIF2 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(MinM2 as fSSEED_MinM2).PlayerResponse = 2
If InterludeHandledWell.GetValue() == 1 && Affinity.GetValue() > 60
Alenawe.AddtoFaction(Marriage)
EndIf
(MinM2 as fSSEED_MinM2).PickScene()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MinM2  Auto  

Actor Property Alenawe  Auto  

Faction Property Marriage  Auto  

GlobalVariable Property InterludeHandledWell  Auto  

GlobalVariable Property Affinity  Auto  
