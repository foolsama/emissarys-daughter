Scriptname fSSEED_MajQ2_StrategyOnRead extends ReferenceAlias

fSSEED_MajQ2_Script Property Q2Script  Auto  

Event OnRead()
	Q2Script.RegisterEvidence(4)
	Debug.Trace("fSSEED_MajQ2: Strategy memo read")
EndEvent