Scriptname sluts_wait_for_alias extends Quest  

import debug

int property max_timeout = 20 auto
int property timeout auto
referencealias property target auto

function go(referencealias al)
	trace("sluts_wait_for_alias: go!")
	timeout = 0
	target = al
	trace("sluts_wait_for_alias: target = " + target)
	gotostate("waiting")
	checkit()
endfunction

state waiting
	function checkit()
		objectreference obj = target.getreference()
		if obj != none
			trace("sluts_wait_for_alias: found!")
			obj.sendmodevent("sluts_wait_for_alias", "found")
			gotostate("")
			return
		endif
		timeout += 1
		if timeout > max_timeout
			trace("sluts_wait_for_alias: timeout!")
			obj.sendmodevent("sluts_wait_for_alias", "timeout")
			gotostate("")
			return
		endif
		registerforsingleupdate(0.1)
	endfunction

	event onupdate()
		checkit()
	endevent 
endstate

function checkit()
endfunction
