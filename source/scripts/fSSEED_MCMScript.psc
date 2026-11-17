Scriptname fSSEED_MCMScript extends SKI_ConfigBase

GlobalVariable Property fSSEED_IllAllowIt Auto
GlobalVariable Property fSSEED_AlenaweAffinity Auto
GlobalVariable Property fSSEED_StabilityScore Auto
GlobalVariable Property fSSEED_StabilityTier Auto
GlobalVariable Property fSSEED_AlenaweDismissed Auto
Actor Property Alenawe Auto
Quest Property Controller Auto
Quest Property LocationTracker Auto
fSSEED_StalkerScript Property StalkerScript Auto

int aMarkerOption = -1
int mMarkerOption = -1
int eToggleOption = -1
int aHomeLocation = -1
int aMoveAlenawe = -1
int aMovePlayer = -1
int aSlider = 3
int sSlider = 4
bool aMarkerEnabled = false
bool mMarkerEnabled = false
bool eToggleEnabled = false
bool bMoveAlenawe = false
bool bMovePlayer = false
bool aHomeSet = false

event OnConfigInit()
    ModName = "The Emissary's Daughter MCM"
    Pages = new string[2]
    Pages[0] = "Main"
    Pages[1] = "Debug"
EndEvent

event OnPageReset(string page)

SetCursorFillMode(TOP_TO_BOTTOM)

If (page == "Main")
SetCursorPosition(0)
AddHeaderOption("The Emissary's Daughter")
AddHeaderOption ("Mod Options")

AddEmptyOption()

AddHeaderOption ("Tools")
aMoveAlenawe = AddToggleOption("Move Alenawe to you", bMoveAlenawe)
aMovePlayer = AddToggleOption("Move to Alenawe", bMovePlayer)
AddTextOption("Current Home", StalkerScript.pDefaultHome.GetName())

AddEmptyOption()
aHomeLocation = AddToggleOption("Set Home Location", aHomeSet)

ElseIf (page == "Debug")
SetCursorPosition(0)
AddHeaderOption("The Emissary's Daughter")
AddHeaderOption ("Tracking info")
AddTextOption("IsEligible", fSSEED_IllAllowIt.GetValue())
AddTextOption("Current Affinity", fSSEED_AlenaweAffinity.GetValue())
AddTextOption("Current Stability Score", fSSEED_StabilityScore.GetValue())
AddTextOption("Current Stability Tier (1=liability, 3=stable)", fSSEED_StabilityTier.GetValue())

AddEmptyOption()

AddTextOption("Alenawe's Current Location", Alenawe.GetParentCell().GetName())

AddEmptyOption()

if (LocationTracker)
    aMarkerEnabled = LocationTracker.IsObjectiveDisplayed(10)
    mMarkerEnabled = LocationTracker.IsObjectiveDisplayed(20)
else
    aMarkerEnabled = false
    mMarkerEnabled = false
endIf

eToggleEnabled = (fSSEED_IllAllowIt.GetValue() >= 4)

aMarkerOption = AddToggleOption("Show Alenawe Marker", aMarkerEnabled)
mMarkerOption = AddToggleOption("Show Alonythil Marker", mMarkerEnabled)
eToggleOption = AddToggleOption("Enable Eligibility", eToggleEnabled)

SetCursorPosition(1)
aSlider = AddSliderOption("Adjust Affinity (0-100)", fSSEED_AlenaweAffinity.GetValue())
sSlider = AddSliderOption("Adjust Stability Tier (1=liability, 3=stable)", fSSEED_StabilityTier.GetValue())
EndIf
EndEvent

function MoveAlenawe()
    Alenawe.MoveTo(Game.GetPlayer())
EndFunction

function MovePlayer()
    Game.GetPlayer().Moveto(Alenawe)
EndFunction

function SetAlenaweHome()
    StalkerScript.SetPlayerHome()
    Debug.Trace("fSSEED MCM: Alenawe's home set to " + StalkerScript.ChosenHomeLoc.GetName())
EndFunction

function SetAlenaweMarker(bool enabled)
    if (LocationTracker)
        LocationTracker.SetObjectiveDisplayed(10, enabled)
    endIf
endfunction

function SetAlonythilMarker(bool enabled)
    if (LocationTracker)
        LocationTracker.SetObjectiveDisplayed(20, enabled)
    endIf
endfunction

function SetEligibilityToggle(bool enabled)
    eToggleEnabled = enabled
    if (enabled)
        fSSEED_IllAllowIt.SetValue(4)
        fSSEED_AlenaweDismissed.SetValue(1)
    else
        fSSEED_IllAllowIt.SetValue(0)
    endIf
endfunction

string function GetPostLocationDisplayName()
    if (Controller == None)
        return "Controller Unavailable"
    endIf

    fSSEED_StalkerScript stalker = Controller as fSSEED_StalkerScript
    if (stalker == None)
        return "Tracker script unavailable"
    endIf

    Location postLoc = stalker.GetPostLocationFromGV()
    if (postLoc == None)
        return "Unknown Post Location"
    endIf

    string locName = postLoc.GetName()
    if (locName == "")
        return "<Unnamed Location>"
    endIf

    return locName
endfunction

event OnOptionSelect(int option)
    if (option == aMoveAlenawe)
        MoveAlenawe()
    endif
    if (option == aMovePlayer)
        MovePlayer()
    endif
    if (option == aHomeLocation)
        SetAlenaweHome()
    endif
    if (option == aMarkerOption)
        aMarkerEnabled = !aMarkerEnabled
        SetAlenaweMarker(aMarkerEnabled)
        SetToggleOptionValue(aMarkerOption, aMarkerEnabled)
    endIf
    if (option == mMarkerOption)
        mMarkerEnabled = !mMarkerEnabled
        SetAlonythilMarker(mMarkerEnabled)
        SetToggleOptionValue(mMarkerOption, mMarkerEnabled)
    endIf
    if (option == eToggleOption)
        eToggleEnabled = !eToggleEnabled
        SetEligibilityToggle(eToggleEnabled)
        SetToggleOptionValue(eToggleOption, eToggleEnabled)
    endIf
    ForcePageReset()
EndEvent

event OnOptionSliderOpen(int option)
    if (option == aSlider)
        SetSliderDialogStartValue(fSSEED_AlenaweAffinity.GetValue())
        SetSliderDialogRange(0, 100)
        SetSliderDialogInterval(1)
    endIf
    if (option == sSlider)
        SetSliderDialogStartValue(fSSEED_StabilityTier.GetValue())
        SetSliderDialogRange(1, 3)
        SetSliderDialogInterval(1)
    endIf
EndEvent

event OnOptionSliderAccept(int option, float value)
    if (option == aSlider)
        fSSEED_AlenaweAffinity.SetValue(value)
    endIf
    if (option == sSlider)
        fSSEED_StabilityTier.SetValue(value)
    endIf
    ForcePageReset()
EndEvent

event OnOptionHighlight(int option)
    if (option == aMoveAlenawe)
        SetInfoText("Clicking this IMMEDIATELY moves Alenawe to you - use responsibly")
    endif
    if (option == aMovePlayer)
        SetInfoText("Clicking this IMMEDIATELY moves YOU to Alenawe - no backsies!")
    endif
    if (option == eToggleoption)
        SetInfoText("Clicking this bypasses Alenawe's recruitment requirements. Skips content; Use responsibly.")
    endif
    if (option == aHomeLocation)
        SetInfoText("Click here to set your exact current location as Alenawe's home (Works only if her job is complete)")
    endif
EndEvent