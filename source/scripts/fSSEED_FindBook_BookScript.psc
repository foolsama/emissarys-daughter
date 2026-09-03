Scriptname fSSEED_FindBook_BookScript extends ReferenceAlias  

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
    (GetOwningQuest() as fSSEED_FindBooks_Script).OnBookFound(Self)
EndEvent

