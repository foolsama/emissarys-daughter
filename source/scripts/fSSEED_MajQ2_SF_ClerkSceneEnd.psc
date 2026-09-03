;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 15
Scriptname fSSEED_MajQ2_SF_ClerkSceneEnd Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
getowningquest().setstage(40)
(GetOwningQuest() as fSSEED_MajQ2_Script).CompleteParley()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property KeepFaction  Auto  

Cell Property Keep  Auto  
