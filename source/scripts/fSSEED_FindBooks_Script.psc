Scriptname fSSEED_FindBooks_Script extends Quest  

LeveledItem Property Lvl4Books Auto
ReferenceAlias[] Property BookList Auto

; called by each BookList alias's script once its filtered title turns up in the player's inventory
Function OnBookFound(ReferenceAlias akAlias)
    akAlias.RemoveAllInventoryEventFilters()
    ; init stage (10) + one stage per book found; stops at the last "found" stage, leaving 50/return-to for elsewhere
    int foundCapStage = 10 + (10 * BookList.Length)
    int newStage = GetStage() + 10
    if newStage <= foundCapStage
        SetStage(newStage)
    endif
EndFunction

; Picks 3 unique books from Lvl4Books and forces them into BookList[0..2]
Function GetRandomBook()
    int numForms = Lvl4Books.GetNumForms()

    int[] pickedIndices = new int[3]
    int picked = 0
    while picked < 3
        int idx = Utility.RandomInt(0, numForms - 1)

        bool isDuplicate = false
        int i = 0
        while i < picked
            if pickedIndices[i] == idx
                isDuplicate = true
            endif
            i += 1
        endwhile

        if !isDuplicate
            pickedIndices[picked] = idx
            picked += 1
        endif
    endwhile

    int j = 0
    while j < 3
        Form bookForm = Lvl4Books.GetNthForm(pickedIndices[j])
        ; alias sits on the player; filter narrows its OnItemAdded to this one title
        BookList[j].ForceRefTo(Game.GetPlayer())
        BookList[j].AddInventoryEventFilter(bookForm)
        j += 1
    endwhile
EndFunction