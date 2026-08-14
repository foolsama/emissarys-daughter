Scriptname fSSEED_C_PlayerAliasScript extends ReferenceAlias  

fSSEED_Convo_Tracker Property Convo Auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    if Convo != None
        Convo.UpdateConversations()
    endif
EndEvent