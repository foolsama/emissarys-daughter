Scriptname fSSEED_MajQ1_Script extends Quest  

Keyword Property LocTypeHabitation Auto
Actor Property Alenawe  Auto 
Faction Property DismissedFollowerFaction Auto
GlobalVariable Property Playstyle Auto
LocationAlias Property Mine  Auto  
Quest Property ThisQuest Auto

Bool Function CanDeliverMajQ1()
    if GetStage() != 0
        return false
    endif

    if !IsAlenaweFollowing()
        return false
    endif

    return true
EndFunction

Bool Function IsAlenaweFollowing()
    Actor a =Alenawe
    if a == None
        return false
    endif

    return !a.IsInFaction(DismissedFollowerFaction)
EndFunction

Function SetPlayerPlaystyle()
    Actor P = Game.GetPlayer()
    If P.GetAV("Magicka") > P.GetAV("Stamina")
        Playstyle.SetValue(3)
        Debug.Trace("fSSEED_MajQ1: Player assumed Mage")
    ElseIf P.GetAV("Sneak") > 55
        Playstyle.SetValue(2)
        Debug.Trace("fSSEED_MajQ1: Player assumed Thief")
    Else
        Playstyle.SetValue(1)
        Debug.Trace("fSSEED_MajQ1: Player assumed Warrior")
    EndIf
EndFunction

Event OnUpdate()
	if CanDeliverMajQ1()
        SetStage(10)
        SetPlayerPlaystyle()
        UnregisterForUpdate()
        return
    endif
EndEvent
 


