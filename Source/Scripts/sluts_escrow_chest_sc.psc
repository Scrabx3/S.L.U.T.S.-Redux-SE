Scriptname sluts_escrow_chest_sc extends ObjectReference  

actor property pc auto
sluts_mission_scenes_sc property q auto
MagicEffect property adspell auto
bool meOpened

Event OnActivate(ObjectReference akActionRef)
;	q.reset_chain_bonus()
	;objectreference escrow = q.escrow_chest.getreference()
	;escrow.enable()
	;q.chest.removeallitems(escrow)
;	utility.wait(0.3)

	;A failsafe in case one of the scripts accidently locks the chest at the quest stage your supposed to recover it.
	if q.getstage() == 40 && GetLockLevel() > 0
		;q.zlib.notify("The stubborn chest suddenly sounds like it unlocked. Try opening it again.", true)
		lock(false)
	endif

	q.reset_chain_bonus()
	utility.wait(0.1)
	if (q.data.hasFillyReward == true)
		Debug.MessageBox("While reclaiming your stuff you also find a set of restraints, along with a pay bonus of " + q.data.FillyGold + " and a letter of commendation inside the escrow chest.     (To qualify for this reward again, complete " + q.data.fillyrank + " voluntary, flawless runs in a row.)")
		;Debug.Notification("To collect another Filly Wear bonus you must now complete " + q.data.fillyrank + " willing runs in a row.")
		q.data.hasFillyReward = false
		utility.wait(0.1)
	endif
	meOpened = true
	RegisterForMenu("ContainerMenu")
endevent

Event OnMenuClose(String s)
	If  s != "ContainerMenu" || !meOpened
		return
	EndIf

	UnregisterForMenu("ContainerMenu")
	meOpened = false
	removeallitems(pc)
	lock()
	setlocklevel(255)
	q.gear_reclaimed()
	utility.wait(0.5)
	if !q.pc.HasMagicEffect(adspell)
		q.scrub_tats()
	endif
	utility.wait(5)
	disable()
EndEvent