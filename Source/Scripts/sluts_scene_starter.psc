Scriptname sluts_scene_starter extends Quest  

import debug

bool property force auto
int property max_timeout = 20 auto
int property timeout auto
scene property target auto

function start_scene(scene sc, bool force_flag=false)
	trace("sluts_scene_starter: trying to start scene: " + sc)
	if sc == none
		trace("sluts_scene_starter: no scene sent to scene started? bad form")
	endif
	force = force_flag
	timeout = 0
	target = sc
	gotostate("starting")
	registerforsingleupdate(0.5)
endfunction

function checkit()
endfunction

state starting
	function checkit()
		if target == none
			trace("sluts_scene_starter:  no target? WTF")
		endif
		if target.isplaying()
			trace("sluts_scene_starter: scene is playing")
			target.sendmodevent("sluts_scene_starter", "running")
			gotostate("")
			return
		endif
		timeout += 1
		if timeout > max_timeout
			trace("sluts_scene_starter: scene timed out")
			target.sendmodevent("sluts_scene_starter", "timeout")
			gotostate("")
			return
		endif
		trace("sluts_scene_starter: trying to start scene")
		if force
			target.forcestart()
		else
			target.start()
		endif
		registerforsingleupdate(0.5)
	endfunction

	event onupdate()
		checkit()
	endevent 
endstate
