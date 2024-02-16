Scriptname sluts_taxi_script extends ObjectReference  


zadlibs property zlib auto
zbfBondageShell property zbf auto

event onactivate(objectreference slutref)
	actor pc = game.getplayer()
	actor slut = slutref as actor

	if slut == none
		debug.trace("sluts cart: not an actor")
		return
	endif

	if slut.WornHasKeyword(zlib.zad_deviousYoke) || slut.WornHasKeyword(zbf.zbfWornYoke)
		TetherToHorse(slut)
		sendModEvent("slut_tethered_taxi", slut)
		return
	endif

	if slut == pc
		Game.ForceFirstPerson()	; just to mask the transition
	endif
	slut.setvehicle(self)
	debug.sendanimationevent(slut, "IdleCartTravelDriverEnterInstant")

endevent

