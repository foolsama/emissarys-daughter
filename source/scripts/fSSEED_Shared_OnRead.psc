Scriptname fSSEED_Shared_OnRead extends ReferenceAlias  

Scene Property Reacts  Auto  

Event OnRead()
	Utility.Wait(0.5)
	Reacts.Start()
	Debug.Trace("fSSEED_OnRead: " + Reacts + " called from " + Self)
EndEvent