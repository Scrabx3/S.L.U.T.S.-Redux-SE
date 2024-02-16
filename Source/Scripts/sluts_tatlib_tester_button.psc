Scriptname sluts_tatlib_tester_button extends ObjectReference  

import debug

sluts_tats property lib auto

event onactivate(objectreference obj)
	trace("calling livery_on from lib: " + lib)
	lib.livery_on()
	gotostate("tats_on")
endevent

state tats_on
	event onactivate(objectreference obj)
		trace("calling livery_off from lib: " + lib)
		lib.livery_off()
		gotostate("")
	endevent
endstate

