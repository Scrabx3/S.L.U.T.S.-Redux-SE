Scriptname sluts_no_mission_sc extends Quest  

import debug

referencealias property boss_a auto


Event OnStoryScript(keyword kw, location loc, ObjectReference akRef1, ObjectReference akRef2, int aiValue1, int aiValue2)

	boss_a.forcerefto(akref1)
	trace("sluts: story event: loc = " + loc + ", ref = " + akRef1)

	registerforsingleupdate(0.5)
endevent

scene property sc auto

event onupdate()
	if sc.isplaying()
		return
	endif
	sc.start()
	registerforsingleupdate(0.5)
endevent
