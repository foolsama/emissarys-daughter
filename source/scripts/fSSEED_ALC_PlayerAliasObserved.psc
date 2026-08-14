Scriptname fSSEED_ALC_PlayerAliasObserved extends ReferenceAlias  

Event OnSpellCast(form akSpell)

int SpellCastsThisCombat 
int ArcaneScore

If SpellCastsThisCombat < 3
    ArcaneScore += 1
    SpellCastsThisCombat += 1
EndIf

EndEvent
