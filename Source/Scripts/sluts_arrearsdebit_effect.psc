Scriptname sluts_arrearsdebit_effect extends activemagiceffect  

;Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
;	if GetTargetActor() != libs.playerRef
;		return
;	Endif
;	If akBaseObject.GetType() == 22 || akBaseObject.GetType() == 41 || ((akBaseObject.GetType() == 26 && !isDeviousDevice(akBaseObject) && akBaseObject != zad_DeviceHider))	
;		If UI.IsMenuOpen("InventoryMenu")
;			libs.notify("You can't equip this while locked in bondage mittens!")	
;		Endif		
;		while hasAnyWeaponEquipped(libs.playerRef)
;			stripweapons(libs.playerRef)
;		EndWhile				
;	Endif
;EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

;	If !akBaseItem || GetTargetActor() != pc || akSourceContainer != pc as ObjectReference
;	If akSourceContainer != pc as ObjectReference
;		return
;	Endif

	actor pc = Game.GetPlayer()
	int debt = arrears.getvalue() as int	
	int mygold = pc.getitemcount(gold)

	if debt > 0 && mygold > 0
		if mygold > debt
			arrears.setvalue(0) ;arrears.getvalue() - debt)
			pc.removeitem(gold,debt)
			debug.notification("By picking up those Septims you managed to completely pay off your arrears.")
		else
			arrears.setvalue(arrears.getvalue() - mygold)
			pc.removeitem(gold,9999999,true)
			debug.notification("The " + mygold + " septims you collected have reduced your arrears to " + arrears.getvalue() as int)
		endif
	endif
EndEvent

MiscObject Property Gold  Auto  

GlobalVariable Property arrears  Auto  
