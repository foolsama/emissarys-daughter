Scriptname fSSEED_LocationTracker extends ReferenceAlias  
{Returns the last town/inn/hub the player has been}

Quest Property MissionBegins Auto
Quest Property StalkerQuest Auto
Quest Property AlenaweController Auto
Quest Property Conv Auto
Quest Property MinM1 Auto
Quest Property MajQ1 Auto
Quest Property Interlude Auto
Quest Property InterludeCourier Auto
Quest Property MinM2 Auto
Quest Property MajQ2 Auto
Quest Property MQ104 Auto
Quest Property MQ106 Auto
Quest Property MQ201 Auto
Quest Property C03 Auto
Quest Property MG04 Auto
Quest Property TG03 Auto
Quest Property DB05 Auto
Quest Property CWSiegeObj Auto
Quest Property RiftenThane Auto
Quest Property Favor250 Auto
Quest Property Favor252 Auto
Quest Property Favor253 Auto
Quest Property Favor254 Auto
Quest Property Favor255 Auto
Quest Property Favor256 Auto
Quest Property Favor257 Auto
Quest Property Favor258 Auto
Scene Property Warn Auto
Actor Property Alenawe Auto
Faction Property CurrentFollowerFaction Auto
ReferenceAlias Property Delphine Auto
ReferenceAlias Property Courier Auto

GlobalVariable Property GameDaysPassed Auto
GlobalVariable Property DateFollowed Auto
GlobalVariable Property MinM1DaysPassed Auto
GlobalVariable Property MajQ1DaysPassed Auto
GlobalVariable Property MinM2DaysPassed Auto
GlobalVariable Property InterludeDaysPassed Auto
GlobalVariable Property DateEmbassyBreached Auto

; ===== Full Stability telemetry hooks (CK-wired, non-GV) =====
; Major arc completions intended by Affinity System design (+30/+20/+20/+15 style events)
Quest Property MQFinaleQuest Auto
Quest Property DawnguardResolutionQuest Auto
Quest Property DragonbornResolutionQuest Auto
Quest Property CivilWarResolutionQuest Auto

; Selected Daedric quests that count as "threat contained" stabilizers or "Bad for the world" destabilizers.
; Fill with QUEST forms only; each completed quest can contribute once.
FormList Property MajorDaedricContainmentQuests Auto
FormList Property BadDaedricQuests  Auto  

; Optional relay/story-event quest references for telemetry events
; (OnStoryKillActor, OnStoryCrimeGold, OnStoryJail, OnStoryEscapeJail, etc.)
Quest Property StabilityKillEventQuest Auto
Quest Property StabilityCrimeGoldEventQuest Auto
Quest Property StabilityJailEventQuest Auto
Quest Property StabilityEscapeJailEventQuest Auto
Quest Property StabilityAssaultEventQuest Auto
Quest Property StabilityIntimidateEventQuest Auto

; Keywords to classify locations
Keyword Property LocTypeHold  Auto
Keyword Property LocTypeHoldMajor Auto
Keyword Property LocTypeHoldMinor Auto
Keyword Property LocTypeInn Auto

FormList Property HoldCapitalsList  Auto

Faction Property CrimeFactionEastmarch Auto
Faction Property CrimeFactionFalkreath Auto
Faction Property CrimeFactionHaafingar Auto
Faction Property CrimeFactionHjaalmarch Auto
Faction Property CrimeFactionPale Auto
Faction Property CrimeFactionReach Auto
Faction Property CrimeFactionRift Auto
Faction Property CrimeFactionWhiterun Auto
Faction Property CrimeFactionWinterhold Auto

; Actor classification for Story Manager kill/assault relays
Faction Property GuardDialogueFaction Auto

; GuardFactions should include guard/crime-reporting factions used to detect guard-target crimes.
FormList Property GuardFactions Auto

; Optional exclusions for "civilian" penalties (bandits, hostile cultists, creatures, etc.)
; Fill with FACTION forms; if victim is in any listed faction, skip civilian-penalty logic.
FormList Property CivilianPenaltyExclusionFactions Auto

; Location context used for "repeated city combat incident" logic
Keyword Property LocTypeCity Auto
Keyword Property LocTypeTown Auto
Keyword Property LocTypeHabitation Auto

; Last town-type location the player entered
Location Property LastTownLocation Auto

; Last inn-type location the player entered
Location Property LastInnLocation Auto

GlobalVariable Property PostLocation Auto
GlobalVariable Property StabilityScore Auto
GlobalVariable Property StabilityAdjusted Auto
GlobalVariable Property StabilityTier Auto
GlobalVariable Property Affinity Auto

; Tuning: how often the script reevaluates long-term Stability in in-game hours.
; Lower = reacts and recovers faster. Higher = slower, more inertial behavior.
float Property StabilityUpdateHours = 6.0 Auto

int LastMurders = 0
int LastAssaults = 0
int LastDaysJailed = 0
int LastCrimeGoldTotal = 0

float RollingVolatility = 0.0
float RollingDiscretion = 0.0
float RollingFriction = 0.0

; Warn scene throttling to prevent repeated starts during clustered events.
float LastWarnTime = -9999.0
float Property WarnCooldownSeconds = 8.0 Auto

Event OnInit()
    InitializeStabilityTracking()
EndEvent

Function HandleStoryKillEvent(ObjectReference akVictim, ObjectReference akKiller, Location akLocation, int aiCrimeStatus, int aiRelationshipRank)
    if akKiller != Game.GetPlayer()
        return
    endif

    Actor victimActor = akVictim as Actor
    bool guardVictim = IsGuardActor(victimActor)
    bool civilianExcluded = IsActorInFactionList(victimActor, CivilianPenaltyExclusionFactions)
    bool populatedLocation = IsPopulatedLocation(akLocation)

    Debug.Trace("FSSEED:Stability - KillEvent victim=" + akVictim + ", guard=" + guardVictim + ", excluded=" + civilianExcluded + ", populated=" + populatedLocation + ", crimeStatus=" + aiCrimeStatus + ", rel=" + aiRelationshipRank)

    TryStartWarn("Kill")

    ; First pass: forward into existing telemetry math immediately so kill-related deltas
    ; are applied as soon as the Story Manager event fires.
    UpdateStabilityTelemetry()
EndFunction

Function HandleStoryAssaultEvent(ObjectReference akVictim, ObjectReference akAttacker, Location akLocation, int aiCrime)
    if akAttacker != Game.GetPlayer()
        return
    endif

    Actor victimActor = akVictim as Actor
    bool guardVictim = IsGuardActor(victimActor)

    Debug.Trace("FSSEED:Stability - AssaultEvent victim=" + akVictim + ", guard=" + guardVictim + ", location=" + akLocation + ", crime=" + aiCrime)

    TryStartWarn("Assault")

    UpdateStabilityTelemetry()
EndFunction

Function HandleStoryJailEvent(ObjectReference akGuard, Form akCrimeGroup, Location akLocation, int aiCrimeGold)
    Debug.Trace("FSSEED:Stability - JailEvent location=" + akLocation + ", crimeGold=" + aiCrimeGold)

    ; Jail entry stays silent; warnings are delivered on subsequent destabilizing events.
EndFunction

Function HandleStoryEscapeJailEvent(Location akLocation, Form akCrimeGroup)
    Debug.Trace("FSSEED:Stability - EscapeJailEvent location=" + akLocation)

    TryStartWarn("EscapeJail")
EndFunction

Function HandleStoryCrimeGoldEvent(ObjectReference akVictim, ObjectReference akCriminal, Form akFaction, int aiGoldAmount, int aiCrime)
    if akCriminal != Game.GetPlayer()
        return
    endif

    Debug.Trace("FSSEED:Stability - CrimeGoldEvent victim=" + akVictim + ", goldAmount=" + aiGoldAmount + ", crime=" + aiCrime)

    ; Check if this is a bounty payment (net decrease in outstanding crime gold)
    int crimeGoldNow = GetCurrentCrimeGoldTotal()
    if crimeGoldNow < LastCrimeGoldTotal
        Debug.Trace("FSSEED:Stability - Bounty decreased from " + LastCrimeGoldTotal + " to " + crimeGoldNow)
    else
        TryStartWarn("CrimeGold")
    endif

    UpdateStabilityTelemetry()
EndFunction

Event OnPlayerLoadGame()
    InitializeStabilityTracking()
EndEvent

Function TryStartWarn(string asSource)
    if Warn == None
        Debug.Trace("FSSEED:Stability - Warn scene not assigned, skipping")
        return
    endif

    if Warn.IsPlaying()
        Debug.Trace("FSSEED:Stability - Warn scene already playing, skipping")
        return
    endif

    float now = Utility.GetCurrentRealTime()
    if now - LastWarnTime < WarnCooldownSeconds
        Debug.Trace("FSSEED:Stabliity - Warn scene cooldown active, skipping")
        return
    endif
    LastWarnTime = now
    (conv as fSSEED_Convo_Tracker).Convo2 = 0
    Debug.Trace("FSSEED:Stability - Warn scene started from " + asSource)
    Warn.Start()
EndFunction

Function InitializeStabilityTracking()
    ; Tuning: initialize only if the system has never assigned a tier before.
    ; Neutral baseline is now 0.0, with permanent stabilizers adding to the base score.
    if StabilityScore && StabilityTier && StabilityTier.GetValueInt() < 1
        float startingScore = GetStabilizerScore()
        StabilityScore.SetValue(startingScore)
        if StabilityAdjusted
            StabilityAdjusted.SetValue(startingScore)
        endif
        StabilityTier.SetValue(GetTierFromScore(startingScore) as float)
    endif

    LastMurders = Game.QueryStat("Murders")
    LastAssaults = Game.QueryStat("Assaults")
    LastDaysJailed = Game.QueryStat("Days Jailed")
    LastCrimeGoldTotal = GetCurrentCrimeGoldTotal()

    RegisterForSingleUpdateGameTime(StabilityUpdateHours)
EndFunction

Event OnUpdateGameTime()
    UpdateStabilityTelemetry()
    QuestStarters()
    RegisterForSingleUpdateGameTime(StabilityUpdateHours)
EndEvent

int Function GetHoldIndex(Location akHoldLoc)
    if HoldCapitalsList == None || akHoldLoc == None
        return -1
    endif

    int i = 0
    int count = HoldCapitalsList.GetSize()
    while i < count
        Location holdLoc = HoldCapitalsList.GetAt(i) as Location
        if holdLoc == akHoldLoc
            return i
        endif
        i += 1
    endwhile

    return -1
EndFunction

Location Function ResolveHold(Location akLoc)
    if akLoc == None || HoldCapitalsList == None
        return None
    endif

    int i = 0
    int count = HoldCapitalsList.GetSize()
    while i < count
        Location holdLoc = HoldCapitalsList.GetAt(i) as Location
        if holdLoc
            ; direct match OR the new location is somewhere under this hold
            if holdLoc == akLoc || holdLoc.IsChild(akLoc)
                return holdLoc
            endif
        endif
        i += 1
    endwhile

    return None
EndFunction

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
 
    ; 1) Resolve hold and write LastTownLocation + GV index
    Location holdLoc = ResolveHold(akNewLoc)
    if holdLoc
        LastTownLocation = holdLoc
        Debug.Trace("FSSEED:Tracker - LastTownLocation set to HOLD " + holdLoc.GetName())

        int idx = GetHoldIndex(holdLoc)
        if idx >= 0 && PostLocation
            PostLocation.SetValue(idx as float)
            Debug.Trace("FSSEED:Tracker - PostLocation set to " + idx)
        endif
    endif

    ; 2) Inns
    if akNewLoc && LocTypeInn && akNewLoc.HasKeyword(LocTypeInn)
        LastInnLocation = akNewLoc
        Debug.Trace("FSSEED:Tracker - LastInnLocation set to " + akNewLoc.GetName())
    endif

    UpdateStabilityTelemetry()

    ; 3) mission gating
    QuestStarters()
    fSSEED_StalkerScript stalker = StalkerQuest as fSSEED_StalkerScript
    if stalker && MissionBegins.GetStage() < 10
        bool isEligible = stalker.CheckEligibility()
        debug.trace("Mission Begins current stage: " + MissionBegins.GetCurrentStageID())
        if isEligible
            Debug.Trace("FSSEED:Tracker - Player eligible for Stalker mission")
            if MissionBegins.GetCurrentStageID() < 10
                MissionBegins.SetStage(10)
                DEBUG.Trace("FSSEED:Tracker - MissionBegins is now " + MissionBegins.GetCurrentStageID())
            endif
            if MissionBegins.GetCurrentStageID() == 10
                stalker.MissionTravel()
            endif
        endif
    endif

    ; Kick post-MQ201 breach followup watcher from player location transitions.
    if MQ201 != None && Interlude != None
        if MQ201.GetStage() >= 227 && Interlude.GetStage() < 20 && PostLocation != None && PostLocation.GetValueInt() == 2
            fSSEED_InterludeScript interludeController = Interlude as fSSEED_InterludeScript
            if interludeController != None
                interludeController.BeginPostBreachWatch()
                Debug.Trace("FSSEED:Tracker - Began post-breach watch from player location change")
            endif
        endif
    endif
EndEvent

Function UpdateStabilityTelemetry()
    ; Tuning: these are the tracked vanilla stats that feed long-term Stability.
    ; Add new event sources here if later quests/dialogue should push Stability directly.
    int murdersNow = Game.QueryStat("Murders")
    int assaultsNow = Game.QueryStat("Assaults")
    int daysJailedNow = Game.QueryStat("Days Jailed")
    int crimeGoldNow = GetCurrentCrimeGoldTotal()

    int deltaMurders = murdersNow - LastMurders
    int deltaAssaults = assaultsNow - LastAssaults
    int deltaDaysJailed = daysJailedNow - LastDaysJailed

    LastMurders = murdersNow
    LastAssaults = assaultsNow
    LastDaysJailed = daysJailedNow

    ; Tuning: passive decay on the hidden telemetry channels.
    ; Bigger decay = the player recovers from old behavior faster.
    ; Smaller decay = bad patterns linger longer and Stability feels less forgiving.
    RollingVolatility = ClampFloat(RollingVolatility - 1.0, 0.0, 100.0)
    RollingFriction = ClampFloat(RollingFriction - 1.0, 0.0, 100.0)
    RollingDiscretion = ClampFloat(RollingDiscretion - 0.5, 0.0, 50.0)

    ; Tuning: severe destabilizers.
    ; Murder should hit harder than assault because the design treats repeated lethal escalation as a major red flag.
    if deltaMurders > 0
        RollingVolatility += (deltaMurders as float) * 12.0
        RollingFriction += (deltaMurders as float) * 6.0
    endif

    ; Tuning: moderate destabilizers.
    ; Assault is still bad, but weighted below murder so one sloppy fight does not dominate the model.
    if deltaAssaults > 0
        RollingVolatility += (deltaAssaults as float) * 4.0
        RollingFriction += (deltaAssaults as float) * 2.0
    endif

    ; Tuning: jail reflects partial capitulation to authority, but keeps a net trust cost.
    ; Serving time should stabilize slightly (compliance) while still signaling institutional conflict history.
    if deltaDaysJailed > 0
        RollingFriction += (deltaDaysJailed as float) * 3.0
        RollingDiscretion += (deltaDaysJailed as float) * 1.0
    endif

    ; Tuning: current outstanding bounty adds pressure even when no fresh crime was detected.
    ; Thresholds matter more than exact gold realism here: they decide when chaos becomes systemic.
    if crimeGoldNow >= 2000
        RollingFriction += 4.0
    elseif crimeGoldNow >= 1000
        RollingFriction += 2.0
    elseif crimeGoldNow >= 500
        RollingFriction += 1.0
    endif

    ; Tuning: paying down bounty or clearing it entirely improves discretion.
    ; Increase these if you want cleanup behavior to rehabilitate Stability more quickly.
    if crimeGoldNow == 0 && LastCrimeGoldTotal >= 300
        RollingDiscretion += 0.2
    elseif crimeGoldNow < LastCrimeGoldTotal
        RollingDiscretion += 0.2
    endif

    ; Tuning: quiet, law-abiding travel slowly restores discretion.
    ; This is the main "cool off over time" reward when the player stops causing problems.
    if deltaMurders <= 0 && deltaAssaults <= 0 && crimeGoldNow == 0
        RollingDiscretion += 1.0
    endif

    RollingVolatility = ClampFloat(RollingVolatility, 0.0, 100.0) ;exceptional violence drives score down hard
    RollingFriction = ClampFloat(RollingFriction, 0.0, 100.0) ;other behaviors lower it less so (see rollingDelta math)
    RollingDiscretion = ClampFloat(RollingDiscretion, 0.0, 50.0) ;corrective behaviors (serving time, paying bounty) raise score

    LastCrimeGoldTotal = crimeGoldNow

    ; Tuning: rawScore is the unsmoothed Stability estimate before inertia is applied.
    ; Neutral baseline is the permanent base score. Temporary telemetry then pulls above or below
    ; that baseline and gradually decays away.
    ; The 0.7 multiplier makes friction meaningful but still weaker than direct volatility.
    float baseScore = 0.0
    if StabilityScore
        baseScore = StabilityScore.GetValue()
    endif

    ; Cap how much the rolling telemetry can improve score so "no crime sprees"
    ; smoothes volatility but cannot, by itself, drive tier-3 outcomes.
    float rollingDelta = RollingDiscretion - RollingVolatility - (RollingFriction * 0.7)
    if baseScore >= 15.0
        rollingDelta = ClampFloat(rollingDelta, -100.0, 0.0)
    else 
        rollingDelta = ClampFloat(rollingDelta, -100.0, 100.0)
    endif

    float rawScore = 0.0
    rawScore += baseScore
    rawScore += rollingDelta
    rawScore = ClampFloat(rawScore, -100.0, 100.0)

    float currentAdjusted = 0.0
    if StabilityAdjusted
        currentAdjusted = StabilityAdjusted.GetValue()
    elseif StabilityScore
        currentAdjusted = StabilityScore.GetValue()
    endif

    ; Tuning: smoothing/inertia on final Stability changes.
    ; Higher than 0.175 = score swings faster toward recent behavior.
    ; Lower than 0.175 = score changes feel slower and more resistant to single events.
    float newAdjusted = currentAdjusted + ((rawScore - currentAdjusted) * 0.175)

    ; Final adjusted score remains full-range so major stabilizers can still reach tier 3.
    newAdjusted = ClampFloat(newAdjusted, -100.0, 100.0)

    if StabilityAdjusted
        StabilityAdjusted.SetValue(newAdjusted)
    endif

    int tier = GetTierFromScore(newAdjusted)
    if StabilityTier
        StabilityTier.SetValue(tier as float)
    endif

    Debug.Trace("FSSEED:Stability - Base=" + baseScore + ", RollingDelta=" + rollingDelta + ", Adjusted=" + newAdjusted + ", Tier=" + tier + ", Vol=" + RollingVolatility + ", Disc=" + RollingDiscretion + ", Fric=" + RollingFriction)
EndFunction

float Function GetStabilizerScore()
    ; Tuning: permanent or semi-permanent stabilizers from major quest/faction progress.
    ; Raise these if "saving the world outweighs local chaos" should dominate harder.
    ; Lower them if you want behavioral telemetry to matter more than completed content.
    float score = 0.0

    if MQFinaleQuest && MQFinaleQuest.IsCompleted()
        score += 30.0
    endif

    if CWSiegeObj && CWSiegeObj.IsCompleted()
        score += 15.0
    endif

    if DawnguardResolutionQuest && DawnguardResolutionQuest.IsCompleted()
        score += 20.0
    endif

    if DragonbornResolutionQuest && DragonbornResolutionQuest.IsCompleted()
        score += 20.0
    endif

    if RiftenThane && RiftenThane.IsCompleted()
        score += 3.0
    endif
    if Favor250 && Favor250.IsCompleted()
        score += 3.0
    endif
    if Favor252 && Favor252.IsCompleted()
        score += 3.0
    endif
    if Favor253 && Favor253.IsCompleted()
        score += 3.0
    endif
    if Favor254 && Favor254.IsCompleted()
        score += 3.0
    endif
    if Favor255 && Favor255.IsCompleted()
        score += 3.0
    endif
    if Favor256 && Favor256.IsCompleted()
        score += 3.0
    endif
    if Favor257 && Favor257.IsCompleted()
        score += 3.0
    endif
    if Favor258 && Favor258.IsCompleted()
        score += 3.0
    endif

    ; Destabilizers: completed quests that are "bad for the world" (e.g., Molag Bal, Mehrunes Dagon, etc.)
    if BadDaedricQuests
        int count = BadDaedricQuests.GetSize()
        int i = 0
        while i < count
            Quest q = BadDaedricQuests.GetAt(i) as Quest
            if q && q.IsCompleted()
                score -= 3.0
            endif
            i += 1
        endwhile
    return score
    endif
EndFunction

int Function GetTierFromScore(float aiScore)
    ; Tuning: tier thresholds for dialogue/package gating.
    ; Current mapping is: 1 = liability, 2 = neutral/unknown, 3 = high stability.
    ; Current thresholds follow the design doc's centered model around 0.
    ; Move these thresholds, not the dialogue conditions, if pacing between paths feels off.
    if aiScore >= 25.0
        return 3
    elseif aiScore > -25.0
        return 2
    endif
    return 1
EndFunction

int Function GetCurrentCrimeGoldTotal()
    int total = 0

    total += GetFactionCrimeGold(CrimeFactionEastmarch)
    total += GetFactionCrimeGold(CrimeFactionFalkreath)
    total += GetFactionCrimeGold(CrimeFactionHaafingar)
    total += GetFactionCrimeGold(CrimeFactionHjaalmarch)
    total += GetFactionCrimeGold(CrimeFactionPale)
    total += GetFactionCrimeGold(CrimeFactionReach)
    total += GetFactionCrimeGold(CrimeFactionRift)
    total += GetFactionCrimeGold(CrimeFactionWhiterun)
    total += GetFactionCrimeGold(CrimeFactionWinterhold)

    return total
EndFunction

bool Function IsGuardActor(Actor akActor)
    if akActor == None
        return false
    endif

    if GuardDialogueFaction && akActor.IsInFaction(GuardDialogueFaction)
        return true
    endif

    return IsActorInFactionList(akActor, GuardFactions)
EndFunction

int Function GetFactionCrimeGold(Faction akFaction)
    if akFaction
        return akFaction.GetCrimeGold()
    endif
    return 0
EndFunction

bool Function IsActorInFactionList(Actor akActor, FormList akFactionList)
    if akActor == None || akFactionList == None
        return false
    endif

    int i = 0
    int count = akFactionList.GetSize()
    while i < count
        Faction checkFaction = akFactionList.GetAt(i) as Faction
        if checkFaction && akActor.IsInFaction(checkFaction)
            return true
        endif
        i += 1
    endwhile

    return false
EndFunction

bool Function IsPopulatedLocation(Location akLoc)
    if akLoc == None
        return false
    endif

    if LocTypeCity && akLoc.HasKeyword(LocTypeCity)
        return true
    endif

    if LocTypeTown && akLoc.HasKeyword(LocTypeTown)
        return true
    endif

    if LocTypeHabitation && akLoc.HasKeyword(LocTypeHabitation)
        return true
    endif

    return false
EndFunction

float Function ClampFloat(float value, float minValue, float maxValue)
    if value < minValue
        return minValue
    endif
    if value > maxValue
        return maxValue
    endif
    return value
EndFunction

Function QuestStarters()
    Float LetterDays
    ;For Interlude starts and progression
    If MQ106.GetStage() >= 50 && !Interlude.IsRunning() && !Interlude.IsCompleted()
        Interlude.SetStage(10)
        Debug.Trace("FSSEED:Tracker - Interlude initialized from MQ106")
    EndIf
    ;Handle late recruitment of Alenawe after MQ201
    If MQ201.IsCompleted() && !Interlude.IsRunning() && !Interlude.IsCompleted()
        Interlude.SetStage(51)
        Debug.Trace("FSSEED:Tracker - Interlude initialized from late recruitment")
    EndIf
    If MQ201.GetStage() == 230 && Interlude.IsRunning()
        Alenawe.EvaluatePackage()
    EndIf
    If MQ201.GetStage() == 95  && Interlude.IsRunning()
        Alenawe.EvaluatePackage()
    EndIf
    Float CurrentDays = GameDaysPassed.GetValue()
    ;Force MinM1 five days after hire if Affinity isn't high enough
    If !MinM1.IsRunning() && !MinM1.IsCompleted()
        If CurrentDays - DateFollowed.GetValue() >= 5.0 || Affinity.GetValue() > 20.0
            MinM1.SetStage(5)
            Debug.Trace("FSSEED:Tracker - MinM1 initialized from hire")
        EndIf
    EndIf
    ; Start MajQ1 three days after MinM1 completed unless Interlude has completed
    If MinM1.IsCompleted() && !Interlude.IsRunning() && !Interlude.IsCompleted() && !MajQ1.IsRunning() && !MajQ1.IsCompleted()
        Debug.Trace("FSSEED:Tracker - Days since MinM1 = " + (CurrentDays - MinM1DaysPassed.GetValue()))
        If CurrentDays - MinM1DaysPassed.GetValue() >= 3.0
            MajQ1.SetStage(0)
            Debug.Trace("FSSEED:Tracker - MajQ1 initialized from MinM1")
        EndIf
    EndIf
    ; Start MinM2 three days after Interlude completed
    If Interlude.IsCompleted() && !MinM2.IsRunning() && !MinM2.IsCompleted()
        Debug.Trace("FSSEED:Tracker - Days since Interlude = " + (CurrentDays - InterludeDaysPassed.GetValue()))
        If CurrentDays - InterludeDaysPassed.GetValue() >= 3.0
            MinM2.SetStage(0)
            Debug.Trace("FSSEED:Tracker - MinM2 initialized from Interlude")
        EndIf
    EndIf
    ; Send Elenwen's letter 3 days after MQ201.
    Location playerLocation = Game.GetPlayer().GetCurrentLocation()
    Location alenaweLocation = Alenawe.GetCurrentLocation()
    bool courierTimingReady = DateEmbassyBreached.GetValue() > 0 && CurrentDays - DateEmbassyBreached.GetValue() >= 3.0 && Interlude.GetStage() == 28
    bool courierLocationReady = alenaweLocation != None && playerLocation != None && alenaweLocation.IsSameLocation(playerLocation, LocTypeHabitation)
    bool courierDeliverySpaceReady = playerLocation != None && playerLocation.HasKeyword(LocTypeHabitation) && !Game.GetPlayer().IsInInterior()
    If MQ201.GetStage() >= 227 && courierTimingReady && courierLocationReady && courierDeliverySpaceReady
        If !Courier.GetRef().IsEnabled()
            Courier.GetRef().Enable()
        EndIf
        If InterludeCourier != None
            InterludeCourier.SetStage(5)
            Interlude.SetStage(28)
            LetterDays = GameDaysPassed.GetValue()
            Debug.Trace("FSSEED:Tracker - Interlude letter delivery started.")
        Else
            Debug.Trace("FSSEED:Tracker - InterludeCourier property is not filled; delivery not started.")
        EndIf
    ElseIf MQ201.GetStage() >= 227 && courierTimingReady
        Debug.Trace("FSSEED:Tracker - Interlude delivery waiting: sameLocation=" + courierLocationReady + ", exteriorHabitation=" + courierDeliverySpaceReady + ", player=" + playerLocation + ", Alenawe=" + alenaweLocation)
    EndIf
    ; Alenawe processing time complete after letter
    If GameDaysPassed.GetValue() - LetterDays >= 1.0 && Interlude.GetStage() == 35 || Interlude.GetStage() == 40
        Interlude.SetStage(50)
        Debug.Trace("FSSEED:Tracker - Interlude stage set to 50 from location tracker")
        EndIf
    ; Start MajQ2 three days after MinM2 completed
    If MinM2.IsCompleted() && !MajQ2.IsRunning() && !MajQ2.IsCompleted()
        Debug.Trace("FSSEED:Tracker - Days since MinM2 = " + (CurrentDays - MinM2DaysPassed.GetValue()))
        If CurrentDays - MinM2DaysPassed.GetValue() >= 3.0
            MajQ2.SetStage(0)
            Debug.Trace("FSSEED:Tracker - MajQ2 initialized from MinM2")
        EndIf
    EndIf
EndFunction

