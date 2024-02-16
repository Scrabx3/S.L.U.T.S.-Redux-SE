Scriptname sluts_cart_monitor_sc extends Quest conditional


referencealias property al auto
sluts_mission_scenes_sc property missions auto

bool property tracking_flag auto conditional

event oninit()
	registerforsingleupdate(5.0)
endevent

event onupdate()
	objectreference ref = missions.check_cart()

	tracking_flag = (ref != none)
	SetObjectiveDisplayed(10, tracking_flag)
	if tracking_flag
		al.forcerefifempty(ref)
	else
		al.trytoclear()
	endif
endevent
