Scriptname sluts_test_modevent_listener extends Quest  

event oninit()
	registerForModEvent("sluts_chain_tester_event", "on_chain_event")
endevent

event on_chain_event(string eventName, string strArg, float numArg, Form sender)
	setstage(30)
	unregisterformodevent(eventName)
endevent



