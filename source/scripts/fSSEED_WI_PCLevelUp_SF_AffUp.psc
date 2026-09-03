;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname fSSEED_WI_PCLevelUp_SF_AffUp Extends Scene Hidden

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
If Affinity.GetValue() < 25
Affinity.Mod(2)
Debug.Trace("fSSEED_WI_Levelup: Affinity added for leveling")
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property Affinity  Auto  
