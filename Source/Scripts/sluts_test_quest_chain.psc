Scriptname sluts_test_quest_chain extends ObjectReference  

import game
import debug

keyword property kw auto
bool property started auto

EVENT onActivate(objectReference triggerRef)
	if !started
		kw.SendStoryEvent()
		started = true
	else
		sendmodevent("sluts_chain_tester_event")
	endif
endEVENT

