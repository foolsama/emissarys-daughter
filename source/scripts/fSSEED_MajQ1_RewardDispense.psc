;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname fSSEED_MajQ1_RewardDispense Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
MajQ1.SetStage(200)
Affinity.Mod(5)
If Playstyle.GetValue() == 1
Game.GetPlayer().AddItem(Warrior)
EndIf
If Playstyle.GetValue() == 2
Game.GetPlayer().AddItem(Rogue)
EndIf
If Playstyle.GetValue() == 3
Game.GetPlayer().AddItem(Mage)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MajQ1  Auto  

GlobalVariable Property Affinity  Auto  

Armor Property Warrior  Auto  

Armor Property Mage  Auto  

Armor Property Rogue  Auto  

GlobalVariable Property Playstyle  Auto  
