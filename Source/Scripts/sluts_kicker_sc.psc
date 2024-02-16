Scriptname sluts_kicker_sc extends Quest  conditional

import debug

actor property pc auto
faction property slutfac auto
referencealias property flyer_a auto 

bool property cooldown auto conditional
bool property lockout auto conditional

faction property slut_drivers_fac auto

sluts_dlog_sc property dlog auto

keyword property sluts_mission_kw auto
keyword property sluts_slavery_kw auto

sluts_mission_data_sc property data auto
sluts_mission_scenes_sc property mission auto
sluts_cart_monitor_sc property monitor auto


;
; Hey, I know! Let's delete all the vanilla NPCS and replace them with clones!
; That way no one else can work with the trasport system uin any way. Grrr....
;
function cfto_patch()
	trace("sluts_kicker: load event detected")
;
;	this gets called when loading a save as well
;	so let's make sure the dialogue quest is running
;
	if !dlog.isRunning()
		dlog.start()
	endif
	if !monitor.isRunning()
		monitor.start()
	endif
;
;	I reallly should change the name of this thing since patching for CTFO is about the
;	least of what it does
;
	mission.reattach_on_load()
;
;	test for the mod
;
	if Game.GetModByName("CFTO.esp") == 255
		trace("sluts: CFTO not detected")
		return		; nothing to do
	endif
	trace("sluts: CFTO detected: attempting patch")
;
;	now we need to get each of stupidhead's evil clones by ID
;	and add them to the drivers formlist
;
	patch_driver(0xbbf6e)		; windhelm
	patch_driver(0xbbf6d)		; bjorlam
	patch_driver(0xbbf76)		; solitude
	patch_driver(0xbbf7f)		; riften
	patch_driver(0x9d8bf)		; markarth
endfunction 

formlist property drivers auto

function patch_driver(int formid)
	actor a = game.GetFormFromFile(formid, "CFTO.esp") as actor
	if a == none
		trace("sluts: CFTO detected but can't load form at " + formid)
		return 
	endif
	a.addtofaction(slut_drivers_fac)
	return 
endfunction

function stage_00()
	debug.trace("S.L.U.T.S: Wide Open For Business!")
	RegisterForModEvent("S.L.U.T.S. Enslavement", "on_enslavement_event")
	cfto_patch()
	setstage(10)
endfunction

function give_flyer()
	pc.additem(flyer_a.getreference())
	setObjectiveDisplayed(10)
endfunction 

function join_fac()
	pc.removeitem(flyer_a.getreference())
	pc.addtofaction(slutfac)
	setstage(30)
endfunction

keyword property  good_standing_kw auto

function start_rq(actor carter, bool good_standing=true, int myCustom = -1)
	
	data.customLocation = myCustom

	location loc = pc.GetCurrentLocation()

	trace("sluts: sending story event with " + carter + " at " + loc)

	good_standing_kw.SendStoryEvent(loc, carter, pc, 500)

	cooldown = true
	registerforsingleupdate(30)
endfunction

event onupdate()
	cooldown = false
endevent

;
; use the driver as the sender
;
event on_enslavement_event(string eventName, string arg_s, float argNum, form sender)
	setstage(30)
	if isObjectiveDisplayed(10)
		setObjectiveCompleted(10)
	endif
	if isObjectiveDisplayed(20)
		setObjectiveCompleted(20)
	endif
	trace("sluts_kicker: sending enslavement script event to story manager")
	sluts_slavery_kw.SendStoryEvent(none, sender as objectreference, pc, 10000)
endevent 

