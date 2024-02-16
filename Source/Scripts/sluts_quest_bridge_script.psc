Scriptname sluts_quest_bridge_script extends ObjectReference  

quest property  q auto hidden

function go(quest aq)
	q = aq
	if !q.isrunning()
		q.start()
		return
	endif
	registerforsingleupdate(0.5)
endfunction

event onupdate()
	if !q.isrunning()
		q.start()
		return
	endif
	registerforsingleupdate(0.5)
endevent