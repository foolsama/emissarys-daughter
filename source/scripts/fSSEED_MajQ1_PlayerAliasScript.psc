Scriptname fSSEED_MajQ1_PlayerAliasScript extends ReferenceAlias  

LocationAlias Property Mine Auto
Quest Property ThisQuest Auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    Location mineLoc = Mine.GetLocation()
    Location playerLoc = Game.GetPlayer().GetCurrentLocation()

    If ThisQuest.GetCurrentStageID() == 40 && playerLoc && mineLoc && !playerLoc.IsSameLocation(mineLoc)
        ThisQuest.SetObjectiveDisplayed(15, true)
    EndIf

    If mineLoc && playerLoc && playerLoc.IsSameLocation(mineLoc)
        ThisQuest.SetStage(40)
        ThisQuest.SetObjectiveDisplayed(15, false)
    EndIf
EndEvent