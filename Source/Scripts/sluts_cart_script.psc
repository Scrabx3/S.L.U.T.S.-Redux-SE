Scriptname sluts_cart_script extends ObjectReference  

zadlibs property zlib auto
zbfBondageShell property zbf auto
sluts_mission_scenes_sc property mission auto
keyword property slut_yoke auto

event onactivate(objectreference slutref)
	actor pc = game.getplayer()
	actor slut = slutref as actor

	if slut == none
		debug.trace("sluts cart: not an actor")
		return
	endif

;	if slut.WornHasKeyword(zlib.zad_deviousYoke) || slut.WornHasKeyword(zbf.zbfWornYoke) || slut.WornHasKeyword(zlib.zad_deviousYokeBB)
	if slut.WornHasKeyword(slut_yoke)

		mission.do_tether(self, slut)
		return

	endif
	if slut != pc
		debug.trace("actor " + slut.getdisplayname() + " examines cart")
		return
	endif


	if !mission.isrunning()
		debug.notification("The cart is currently unloaded")
		return
	endif

	int p = mission.pilferage
	if p <= 0
		debug.notification("The cart is loaded and the seal is intact")
	elseif p < 30
		debug.notification("The seal has been broken. Most of the cargo is intact.")
	elseif p < 60
		debug.notification("Several choice items are missing from the cargo.")
	elseif p < 100
		debug.notification("Your compartment has been well and truly pillaged.")
	elseif p >= 100
		debug.notification("Your cargo has been stolen and the cart has been damaged")
	endif

endevent
