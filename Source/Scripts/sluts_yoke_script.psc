Scriptname sluts_yoke_script extends zadEquipScript ;YokeScript 

message property unhitch_msg auto
sluts_mission_scenes_sc property mission auto

Function DeviceMenu(int MsgChoice=0)
	if mission.tethered
		unhitch()
		return 
	endif

	return parent.DeviceMenu(MsgChoice)
endfunction

function unhitch()
	mission.unhitch_attempt()
endfunction
