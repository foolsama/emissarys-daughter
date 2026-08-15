Scriptname fSSEED_MinM2 extends Quest  Conditional

Int Property PlayerResponse  Auto  Conditional

GlobalVariable Property MinM2Path  Auto  
Scene Property SceneA Auto
Scene Property SceneB Auto
Scene Property SceneC Auto
Scene Property SceneX Auto
ObjectReference Property FollowerMarker  Auto  
Actor Property Alenawe Auto
ReferenceAlias[] Property ParkingAliases Auto
Actor[] ParkedFollowers

Function PickScene()
float Path = MinM2Path.GetValue()
If PlayerResponse == 5
	SceneX.Start()
EndIf
If Path == 1
	SceneA.Start()
EndIf
If Path == 2
	SceneB.Start()
EndIf
If Path == 3
	SceneC.Start()
EndIf
EndFunction

Bool ParkingInitiazed = False

Function InitializeParking()
	ParkedFollowers = new Actor[5]
	ParkingInitiazed = True
EndFunction

Function ParkFollower(Actor akFollower)
	
	If akFollower == None
		return
	EndIf

	;Never interfere with Alenawe
	If akFollower == Alenawe
		return
	EndIf

	; Only actual current player teammates
	If !akFollower.IsPlayerTeammate()
		return
	EndIf

	;init storage only once
	If !ParkingInitiazed
		InitializeParking()
	EndIf

	; meeting is private, pound sand
	Int i = 0
	While i < ParkingAliases.Length
		; already parked?
		If ParkedFollowers[i] == akFollower
			return
		EndIf

			; Empty parking slot
			If ParkedFollowers[i] == None
				;reserve the slot
				ParkedFollowers[i] = akFollower
				Debug.Trace("fSSEED_MinM2: Parking " + akFollower + " in slot " + i)
				ParkingAliases[i].ForceRefTo(akFollower)
				
				; Give the alias a moment to update, the evaluate package
				Utility.Wait(0.1)
				akFollower.EvaluatePackage()
				Debug.Trace("fSSEED_MinM2: Parked " + akFollower)
				Return
			EndIf
		i += 1
	EndWhile
	Debug.Trace("fSSEED_MinM2: No parking slot available for " + akFollower)
EndFunction

Function UnParkFollowers()
	If !ParkingInitiazed
		return
	EndIf

	Int i = 0
	While i < ParkedFollowers.Length && i < ParkingAliases.Length
		Actor Who = ParkedFollowers[i]
		If Who != None
			ParkingAliases[i].Clear()
			ParkedFollowers[i] = None
			Utility.Wait(0.1)
			Who.EvaluatePackage()
			Debug.Trace("fSSEED_MinM2: Dismissed " + Who)
		EndIf
		i += 1
	EndWhile
	ParkingInitiazed = False
EndFunction


