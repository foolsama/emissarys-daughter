Scriptname fSSEED_StalkerScript extends Quest  

FormList      Property MissionOngoingPairs  Auto       ; pairs of [Location, Marker] for dimissal locations
                                                        ; Formlist should be Pairs of [Location, Marker] in order:
                                                        ;   [0] = Location A
                                                        ;   [1] = Marker for A
                                                        ;   [2] = Location B
                                                        ;   [3] = Marker for B
Actor Property Alenawe  Auto
Actor Property Alonythil Auto
ReferenceAlias Property aPlayer  Auto                  ; points to tracker quest's aPlayer alias
ObjectReference Property pDefaultHome  Auto            ; default dismissal marker (REFR) if logic fails
LocationAlias Property AlenaweDismissHome  Auto        ; Location alias used by AI packages for dismissed behavior
GlobalVariable Property Elligibility Auto
GlobalVariable Property Affinity  Auto
GlobalVariable Property StabilityScore Auto
GlobalVariable Property StabilityAdjusted Auto
GlobalVariable Property StabilityTier Auto
GlobalVariable Property CWPlayerAllegiance Auto
GlobalVariable Property PostLocation Auto
Quest Property MissionBegins Auto
Quest Property MQ104  Auto
Quest Property Seeker Auto
Quest Property Stones Auto
Quest Property C02  Auto
Quest Property C03  Auto
Quest Property MG02  Auto
Quest Property MG04  Auto
Quest Property TG02  Auto
Quest Property TG03  Auto
Quest Property DB03  Auto
Quest Property DB05  Auto
Quest Property CWSiegeObj Auto
Quest Property Favor252  Auto
Quest Property Favor253  Auto
Quest Property Favor254  Auto
Quest Property Favor255  Auto
Quest Property Favor256  Auto
Quest Property Favor257  Auto
Quest Property Favor258  Auto
Quest Property Favor250  Auto
Quest Property RiftenThane Auto
Faction Property DismissedFollowerFaction Auto
Faction Property CurrentFollowerFaction Auto

; ----------------------- HELPER: get tracker script --------------------------
Event OnInit()
    ForcePlayer()
EndEvent

Event OnPlayerLoadGame()
    ForcePlayer()
    Debug.Trace(aPlayer as String)
EndEvent

Function ForcePlayer()
    if !aPlayer
        Actor p = Game.GetPlayer()
        if p
            aPlayer.ForceRefTo(p)
            debug.trace("aPlayer alias forced to player")
        endif
    endif
EndFunction

fSSEED_LocationTracker Function GetTracker()
    if aPlayer
        return aPlayer as fSSEED_LocationTracker
    endif
    return None
EndFunction

int Function GetStabilityTier()
    if StabilityTier
        return StabilityTier.GetValueInt()
    endif

    fSSEED_LocationTracker tracker = GetTracker()
    if tracker
        return tracker.GetTierFromScore(GetStabilityScore())
    endif

    return 2
EndFunction

float Function GetStabilityScore()
    if StabilityAdjusted
        return StabilityAdjusted.GetValue()
    endif

    if StabilityScore
        return StabilityScore.GetValue()
    endif
    return 0.0
EndFunction

bool Function IsStrategicLiability()
    return GetStabilityTier() == 1
EndFunction

Bool Function CheckEligibility()
    If Elligibility.GetValue() >= 4
        ; Already calculated
        debug.Trace("FSSEED:Stalker - Eligibility already confirmed")
		If MissionBegins.GetStage() != 15 && !Alenawe.IsInFaction(CurrentFollowerFaction)
			debug.Trace("fSSEED:Stalker - Player super-elligible but hasn't talked with Alenawe; Removing need for handoff scene.")
			MissionBegins.SetStage(15)
		EndIf
        return true
    Endif

    Int score = 0

    if Affinity.GetValue() < 0
        score = 0
        debug.Trace("FSSEED:Stalker - Affinity negative, ineligible")
        return false
    endif    
    
    ; Check main quest stage
    if MQ104.GetStage() >= 160
        score += 2
    endif

    if Seeker.GetStage() >= 10
        score += 2
    endif

    if Stones.GetStage() >= 200
        score += 2
    endif
    
    ; Check if other Thane
    if RiftenThane.IsCompleted()
        score += 1
    endif
    if Favor250.IsCompleted()
        score += 1
    endif
    if Favor252.IsCompleted()
        score += 1
    endif
    if Favor253.IsCompleted()
        score += 1
    endif
    if Favor254.IsCompleted()
        score += 1
    endif
    if Favor255.IsCompleted()
        score += 1
    endif
    if Favor256.IsCompleted()
        score += 1
    endif
    if Favor257.IsCompleted()
        score += 1
    endif
    if Favor258.IsCompleted()
        score += 1
    endif

    ; Guild milestones
    if DB03.IsCompleted()
        score += 1
    endif
    if DB05.IsCompleted()
        score += 2
    endif
    if C02.IsCompleted()
        score += 1
    endif
    if C03.IsCompleted()
            score += 1
    endif
    if MG02.IsCompleted()
        score += 1
    endif
    if MG04.GetStage() >= 50
        score += 2
    endif
    if TG02.IsCompleted()
        score += 1
    endif
    if TG03.IsCompleted()
        score += 1
    endif

    ; Check Civil War quest stage
    If CWSiegeObj && CWSiegeObj.IsCompleted()
        Int allegiance = CWPlayerAllegiance.GetValueInt()
        if allegiance == 0
        Endif
        if allegiance == 1 ; Imperial
            score += 1
        elseif allegiance == 2 ; Stormcloak
            score -= 2
        endif
    endif

    If Elligibility
        Elligibility.SetValue(score)
        debug.Trace("FSSEED:Stalker - Eligibility score calculated as " + score)
    EndIf

    If score >= 2
        debug.Trace("FSSEED:Stalker - Player is now being followed by Alenawe")
        return true
    EndIf
    debug.Trace("FSSEED:Stalker - Player eligibility score too low: " + score)
    return false
EndFunction

; -- HELPER: Look up the (REFR) marker for a given (LCTN) Location using the FormList --
ObjectReference Function GetMarkerForLocation(Location akLoc)
    if akLoc == None
        return pDefaultHome
    endif

    if MissionOngoingPairs == None
        return pDefaultHome
    endif

    int count = MissionOngoingPairs.GetSize()
    int i = 0

    ; Expecting pairs [LCTN, REFR, LCTN, REFR, ...]
    while i < count
        Location locEntry = MissionOngoingPairs.GetAt(i) as Location
        if locEntry == akLoc
            ObjectReference marker = MissionOngoingPairs.GetAt(i + 1) as ObjectReference
            if marker != None
                return marker
            endif
        endif
        i += 2
    endwhile

    return pDefaultHome
EndFunction

ObjectReference Function GetDismissDestination()
    ObjectReference dest = pDefaultHome

    fSSEED_LocationTracker tracker = GetTracker()
    
    if tracker
        ; Prefer the last inn; fall back to last town
        Location loc = tracker.LastInnLocation
        if loc == None
            loc = tracker.LastTownLocation
        endif

        if loc != None
            dest = GetMarkerForLocation(loc)
        endif
    endif

    return dest
EndFunction

Location Function GetPostLocationFromGV()
    if PostLocation == None || MissionOngoingPairs == None
        return None
    endif

    int idx = PostLocation.GetValueInt()
    if idx < 0
        return None
    endif

    int pairIdx = idx * 2
    if pairIdx >= MissionOngoingPairs.GetSize()
        return None
    endif

    return MissionOngoingPairs.GetAt(pairIdx) as Location
EndFunction

ObjectReference Function GetPostMarkerFromGV()
    Location postLoc = GetPostLocationFromGV()
    return GetMarkerForLocation(postLoc)
EndFunction

Function MissionTravel()
    Cell CurrentCell = Alenawe.GetParentCell()
    ; called when Alenawe is on mission, but not currently a follower
    if MissionBegins == None || Alenawe == None
        Debug.Trace("FSSEED:Stalker - MissionTravel called but missing MissionBegins quest or Alenawe reference")
        return
    endif

    if CurrentFollowerFaction && Alenawe.IsInFaction(CurrentFollowerFaction)
        Debug.Trace("FSSEED:Stalker - MissionTravel called but Alenawe is currently a follower")
        return
    endif

    Location postLoc = GetPostLocationFromGV()
    ObjectReference marker = GetPostMarkerFromGV()
    if marker == None
        Debug.Trace("FSSEED:Stalker - MissionTravel called but no post marker found")
        return
    endif

    Location currentLoc = Alenawe.GetCurrentLocation()
    Location targetLoc = marker.GetCurrentLocation()
    if currentLoc != None && targetLoc != None && currentLoc == targetLoc
        Debug.Trace("FSSEED:Stalker - MissionTravel called but Alenawe is already at the post marker location")
        return
    Else
        Alenawe.MoveTo(marker)
		Alonythil.MoveTo(marker)
        Debug.Trace("FSSEED:Stalker - moving Alenawe to post marker " + marker + ", " + CurrentCell.GetName())
    endif
EndFunction

Function DismissAlenawe()
    ; called when dismissing Alenawe
    Location homeLoc = GetPostLocationFromGV()
    ObjectReference marker = GetPostMarkerFromGV()

    if homeLoc == None
        fSSEED_LocationTracker tracker = GetTracker()
        if tracker
            homeLoc = tracker.LastTownLocation
        endif
    endif

    if homeLoc && AlenaweDismissHome
        AlenaweDismissHome.ForceLocationTo(homeLoc)
        Debug.Notification("Stalker: sending Alenawe to " + homeLoc.GetName())
    else
        Debug.Notification("Stalker: no LastTownLocation, using DefaultHome")
        if AlenaweDismissHome && pDefaultHome
            AlenaweDismissHome.ForceLocationTo(pDefaultHome.GetCurrentLocation())
        endif
    endif

    if Alenawe && marker
        Location currentLoc = Alenawe.GetCurrentLocation()
        Location targetLoc = marker.GetCurrentLocation()
        if currentLoc == None || targetLoc == None || currentLoc != targetLoc
            Alenawe.MoveTo(marker)
        endif
    endif

    if Alenawe
        Alenawe.EvaluatePackage()
    endif
EndFunction  
