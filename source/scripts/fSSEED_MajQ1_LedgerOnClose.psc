Scriptname fSSEED_MajQ1_LedgerOnClose extends ReferenceAlias  

Scene Property Reacts  Auto  
Quest Property MajQ1 Auto

Event OnRead()
	utility.wait(1)
	MajQ1.SetStage(60)
	Reacts.Start()
EndEvent
