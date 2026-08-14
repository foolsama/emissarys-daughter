Scriptname fSSEED_Convo_Tracker extends Quest Hidden Conditional

Int Property Convo1 Auto Conditional
Int Property Convo2 Auto Conditional
Int Property Convo3 Auto Conditional
GlobalVariable Property Convo3B Auto Conditional
Int Property Convo4 Auto Conditional
Int Property Convo5 Auto Conditional
Int Property Convo6 Auto Conditional
Int Property Convo7 Auto Conditional
Int Property Convo8 Auto Conditional
Int Property Convo9 Auto Conditional
Int Property Convo10 Auto Conditional
Int Property Convo11 Auto Conditional

GlobalVariable Property GameDaysPassed Auto
GlobalVariable Property DaysSinceHire Auto
GlobalVariable Property Affinity Auto
GlobalVariable Property Warned Auto

Quest Property Interlude Auto
FormList Property DaedricQuests Auto

;One INT per conversation, used as quasi-quest stages:
;0 = unused, 10 = early available, 20 = early used
;30 = mid available, 40 = mid used
;50 = late available, 60 = late used
;100 = fully exhausted

Bool Function HasCompletedQuestInList(FormList akQuestList)
    If akQuestList == None
        Return False
    EndIf

    int i = 0
    int questCount = akQuestList.GetSize()
    While i < questCount
        Quest daedricQuest = akQuestList.GetAt(i) as Quest
        If daedricQuest != None && daedricQuest.IsCompleted()
            Return True
        EndIf
        i += 1
    EndWhile

    Return False
EndFunction

Function UpdateConversations()
    Debug.Trace("fSSEED_Conversations: OnLocationChange fired in ConversationsAliasTracker")
    Debug.Trace("fSSEED_Conversations: 1: " + Convo1 + " 2: " + Convo2 + " 3: " + Convo3 + "3B: " + Convo3B.GetValue() + " 4: " + Convo4 + " 5: " + Convo5)
    Debug.Trace("fSSEED_Conversations: 6: " + Convo6 + " 7: " + Convo7 + " 8: " + Convo8 + " 9: " + Convo9 + " 10: " + Convo10)
; I'm using OnLocationChange because it's *not* constant, but is repetitive enough to be reliable. Should offer a little suspension
; of disbelief so topics don't all immediately appear after specific choices or actions.

    ;Conversation 1, "So, what have you observed of me so far?"
    ;Available 3-5 days after recruitment. Mid/Late variants upgrade by affinity only
    If Convo1 == 40
        Debug.Trace("fSSEED_Conversations: Convo1 is 40")
        If Affinity.GetValue() > 60
            Convo1 = 50
            Debug.Trace("fSSEED_Conversations: Convo1 upgraded to 50")
        EndIf
    ElseIf Convo1 == 20
        Debug.Trace("fSSEED_Conversations: Convo1 is 20")
        If Affinity.GetValue() > 60
            Convo1 = 50
            Debug.Trace("fSSEED_Conversations: Convo1 upgraded to 50")
        ElseIf Affinity.GetValue() > 20
            Convo1 = 30
            Debug.Trace("fSSEED_Conversations: Convo1 upgraded to 30")
        EndIf
    ElseIf Convo1 == 0
        If GameDaysPassed.GetValue() - DaysSinceHire.GetValue() > 3
            If Affinity.GetValue() > 60
                Convo1 = 50
                Debug.Trace("fSSEED_Conversations: Convo1 upgraded to 50")
            ElseIf Affinity.GetValue() > 20
                Convo1 = 30
                Debug.Trace("fSSEED_Conversations: Convo1 upgraded to 30")
            Else
                Convo1 = 10
                Debug.Trace("fSSEED_Conversations: Convo1 upgraded to 10")
            EndIf
        EndIf
    EndIf

    ;Converation 3, "When you speak about ‘story,’ you don’t mean Olaf and the Dragon, do you?"
    ;Available after several idle lines spoken (each adds 2 to Convo3), or one week.

    If Convo3 == 40
        If Affinity.GetValue() > 60 && Interlude.IsCompleted()
            Convo3 = 50
            Debug.Trace("fSSEED_Conversations: Convo3 upgraded to 50")
        EndIf
    ElseIf Convo3 == 20
        If Affinity.GetValue() > 20
            Convo3 = 30
            Debug.Trace("fSSEED_Conversations: Convo3 upgraded to 50")
        EndIf
    ElseIf Convo3 < 10
        If GameDaysPassed.GetValue() - DaysSinceHire.GetValue() > 7
            Convo3 = 10
            Debug.Trace("fSSEED_Conversations: Convo3 upgraded to 10 from time in service")
        EndIf
    EndIf

    ;Conversation 4, appears after a listed Daedric quest completes.
    ;Convo4 = 1 is a reserved trigger state for an idle line before normal convo staging.
    If HasCompletedQuestInList(DaedricQuests)
        If Convo4 == 40
            If Affinity.GetValue() > 60
                Convo4 = 50
                Debug.Trace("fSSEED_Conversations: Convo4 upgraded to 50")
            EndIf
        ElseIf Convo4 == 20 || Convo4 == 10
            If Affinity.GetValue() > 40
                Convo4 = 50
                Debug.Trace("fSSEED_Conversations: Convo4 upgraded to 50")
            ElseIf Affinity.GetValue() > 20
                Convo4 = 30
                Debug.Trace("fSSEED_Conversations: Convo4 upgraded to 30")
            EndIf
        ElseIf Convo4 == 0
            Convo4 = 1
            Debug.Trace("fSSEED_Conversations: Convo4 set to 1 (idle trigger)")
        EndIf
    EndIf


    ;Conversation 8, "Where were you before this," is available immediately, and upgrades to mid/late variants based on affinity.
    If Affinity.GetValue() > 75
        Convo8 = 50
        Debug.Trace("fSSEED_Conversations: Convo8 upgraded to 50")
    ElseIf Convo8 == 20
        If Affinity.GetValue() > 75
            Convo8 = 50
            Debug.Trace("fSSEED_Conversations: Convo8 upgraded to 50")
        ElseIf Affinity.GetValue() > 45
            Convo8 = 30
            Debug.Trace("fSSEED_Conversations: Convo8 upgraded to 30")
        EndIf
    ElseIf Convo8 == 0
        If Affinity.GetValue() > 75
            Convo8 = 50
            Debug.Trace("fSSEED_Conversations: Convo8 upgraded to 50")
        ElseIf Affinity.GetValue() > 45
            Convo8 = 30
            Debug.Trace("fSSEED_Conversations: Convo8 upgraded to 30")
        Else
            Convo8 = 10
            Debug.Trace("fSSEED_Conversations: Convo8 upgraded to 10")
        EndIf
    EndIf

    ;Conversation 10, "What do you do when you're not working?" is available immediately, and upgrades to mid/late variants based on affinity.
    If Affinity.GetValue() > 60
        Convo10 = 50
        Debug.Trace("fSSEED_Conversations: Convo10 upgraded to 50")
    ElseIf Convo10 == 20
        If Affinity.GetValue() > 60
            Convo10 = 50
            Debug.Trace("fSSEED_Conversations: Convo10 upgraded to 50")
        ElseIf Affinity.GetValue() > 35
            Convo10 = 30
            Debug.Trace("fSSEED_Conversations: Convo10 upgraded to 30")
        EndIf
    ElseIf Convo10 == 0
        If Affinity.GetValue() > 60
            Convo10 = 50
            Debug.Trace("fSSEED_Conversations: Convo10 upgraded to 50")
        ElseIf Affinity.GetValue() > 35
            Convo10 = 30
            Debug.Trace("fSSEED_Conversations: Convo10 upgraded to 30")
        Else
            Convo10 = 10
            Debug.Trace("fSSEED_Conversations: Convo10 upgraded to 10")
        EndIf
    EndIf
EndFunction