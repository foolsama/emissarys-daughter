;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname fSSEED_AC_Idle_TakeBook1 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
If (Game.GetPlayer().GetItemCount(Vol1) >= 1)
Game.GetPlayer().RemoveItem(Vol1, 1)
Alenawe.Additem(Vol1, 1)
EndIf
If (Game.GetPlayer().GetItemCount(Vol2) >= 1)
Game.GetPlayer().RemoveItem(Vol2, 1)
Alenawe.Additem(Vol2, 1)
EndIf
If (Game.GetPlayer().GetItemCount(Vol3) >= 1)
Game.GetPlayer().RemoveItem(Vol3, 1)
Alenawe.Additem(Vol3, 1)
EndIf
If (Game.GetPlayer().GetItemCount(Vol4) >= 1)
Game.GetPlayer().RemoveItem(Vol4, 1)
Alenawe.Additem(Vol4, 1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Book Property Vol1  Auto  

Book Property Vol2  Auto  

Book Property Vol3  Auto  

Book Property Vol4  Auto  

Actor Property Alenawe  Auto  
