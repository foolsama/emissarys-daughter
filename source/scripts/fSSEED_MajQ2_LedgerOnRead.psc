Scriptname fSSEED_MajQ2_LedgerOnRead extends ReferenceAlias  

Quest Property MajQ2  Auto  

fSSEED_MajQ2_Script Property Q2Script  Auto  

Event OnRead()
	Q2Script.RegisterEvidence(5)
	Debug.Trace("fSSEED_MajQ2: Master Ledger Read")
EndEvent