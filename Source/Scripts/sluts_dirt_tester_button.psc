Scriptname sluts_dirt_tester_button extends ObjectReference  

actor property playerref auto
sluts_tats property tats auto
int property level = 0 auto

event onactivate(objectreference obj)
	debug.messagebox("dirt cycle activate")
	level += 1

	if level > 10
		level = 0
	endif

	tats.set_dirty_level(playerref, level)
endevent
