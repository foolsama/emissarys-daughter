;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname fSSEED_MinM2_SF_Open_Done Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Debug.Trace("fSSEED_MinM2: Alenawe chose path " + Done.GetValue())
If Done.GetValue() == 0
Debug.Trace("fSSEED_MinM2: Alenawe accepted offer")
Open.Stop()
Close.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property Done  Auto  

Scene Property Open  Auto  

Scene Property Close  Auto  
