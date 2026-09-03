Scriptname fSSEED_MajQ2_IntakeOnRead extends ObjectReference  

Scene Property NoteRead  Auto  
fSSEED_MajQ2_Script Property Q2Script Auto
Quest Property MajQ2  Auto  

Event OnRead()
	Q2Script.RegisterEvidence(1)
	NoteRead.Start()
	Debug.Trace("fSSEED_MajQ2: Intake Memo Read")
EndEvent