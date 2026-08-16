Scriptname fSSEED_AC_Script extends Quest  

Actor Property Alenawe Auto
Actor Property Alonythil Auto
Quest Property MissionBegins Auto
Quest Property Conversations Auto
Quest Property LocationTracker Auto
Quest Property MinM1 Auto
Quest Property MinM2 Auto
Quest Property MajQ1 Auto
Quest Property MajQ2 Auto
Quest Property Interlude Auto
Quest Property DialogFollower Auto
VisualEffect Property MGTeleportOutEffect Auto

Function PathCInterruptBegin()
    Debug.Trace("fSSEED_AC: Alenawe set to PAth C interrupt Package")
EndFunction

Function PathCResume()
    Debug.Trace("fSSEED_AC: Alenawe resume follower default package")
EndFunction

Function GhostAlenawe()
    ;move Alenawe to defaultHome
    fSSEED_StalkerScript stalker = LocationTracker as fSSEED_StalkerScript
    ObjectReference loc = stalker.GetDismissDestination()
    MGTeleportOutEffect.Play(Alenawe)
    Utility.Wait(1.0)
    Alenawe.SetAlpha(0,true)
    Utility.Wait(1.0)
    Alenawe.MoveTo(loc)
    ;Stop superfluous quests
    If MissionBegins.IsRunning()
        MissionBegins.SetStage(100)
    EndIf
    If MinM1.IsRunning()
        MinM1.Stop()
    EndIf
    If MinM2.IsRunning()
        MinM2.Stop()
    EndIf
    If MajQ1.IsRunning()
        MajQ1.Stop()
    EndIf
    If MajQ2.IsRunning()
        MajQ2.Stop()
    EndIf
    If Interlude.IsRunning()
        Interlude.Stop()
    EndIf
    LocationTracker.Stop()
    Conversations.Stop()

    ;Disable Alenawe
    Alenawe.Disable()
    If Alonythil
        Alonythil.Disable()
    EndIf
EndFunction
