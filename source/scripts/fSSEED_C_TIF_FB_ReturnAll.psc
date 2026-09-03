;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname fSSEED_C_TIF_FB_ReturnAll Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().RemoveItem(Book1.GetReference(),1)
Alenawe.Additem(Book1.GetReference(),1)
Game.GetPlayer().RemoveItem(Book2.GetReference(),1)
Alenawe.Additem(Book2.GetReference(),1)
Game.GetPlayer().RemoveItem(Book3.GetReference(),1)
Alenawe.Additem(Book3.GetReference(),1)
GetOwningQuest().SetStage(100)
Affinity.Mod(8)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Book1  Auto  

ReferenceAlias Property Book2  Auto  

ReferenceAlias Property Book3  Auto  

Actor Property Alenawe  Auto  

GlobalVariable Property Affinity  Auto  
