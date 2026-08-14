Scriptname fSSEED_AlenaweAliasObserves extends ReferenceAlias  

Event OnCombatEnter()
	BeginObservedCombat()
EndEvent

Event OnCombatStop()
	;stop observing
EndEvent

function BeginObservedCombat()
 ;modest update, maybe once every 2 seconds
 ;Health below 30%   ? OverextensionCount
 ;Magicka below 20%  ? OvercastCount
 ;Stamina below 20%  ? ExhaustionCount
 ;Entered sneaking but lost concealment early ? ExposureCount
 ;Used two or more combat categories ? AdaptationCount

endFunction