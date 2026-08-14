;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname fSSEED_SF_Interlude_Courier Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Courier.getReference().moveto(CourierMarker.getReference())
Courier.getReference().disable()
unRegisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Courier  Auto  

ReferenceAlias Property CourierMarker  Auto  
