Scriptname sluts_standard_mission extends Quest  

import debug

actor property pc auto

;/
locationalias	property start_hold auto
referencealias	property carter auto
locationalias	property dest_hold auto
locationalias	property dest_hold_cap auto
referencealias	property recipient auto
referencealias	property manifest auto
referencealias	property cart_spawn auto
referencealias	property pc_wait auto
referencealias	property escrow_chest auto
referencealias	property carter_cast auto

location	property start_hold_loc auto
objectreference	property carter_ref auto
location	property dest_hold_loc auto
location	property dest_hold_cap_loc auto
objectreference	property recipient_ref auto
objectreference	property manifest_ref auto
objectreference	property cart_spawn_ref auto
objectreference	property pc_wait_ref auto
objectreference	property escrow_chest_ref auto
objectreference	property carter_cast_ref auto
/;

sluts_mission_scenes_sc property shared_q auto
;sluts_mission_data_sc property data auto

function setup_scene()
	trace("sluts: setting up scene data")


	;/
	start_hold_loc = start_hold.getLocation()
	trace("sluts standard mission: start hold location = " + start_hold_loc)

	dest_hold_loc = dest_hold.getLocation()
	trace("sluts standard mission: destination hold location = " + dest_hold_loc)

	dest_hold_cap_loc = dest_hold_cap.getLocation()

	carter_ref = carter.getreference()
	trace("sluts standard mission: carter ref = " + carter_ref)

	recipient_ref = recipient.getreference()
	trace("sluts standard mission: recipient ref = " + recipient_ref)

	manifest_ref = manifest.getreference()
	cart_spawn_ref = cart_spawn.getreference()
	pc_wait_ref = pc_wait.getreference()
	escrow_chest_ref = escrow_chest.getreference()
	carter_cast_ref = carter_cast.getreference()
	/;

	;data.kickoff_q = self

	RegisterForModEvent("sluts: gear reclaimed", "on_reclaim")
	RegisterForModEvent("sluts: mission chain event", "on_chained_quest")

	trace("sluts: registration done - starting shared quest")

	shared_q.setup()

	trace("sluts: shared quest started - setup complete")
endfunction

event on_reclaim(string eventName, string arg_s, float argNum, form sender)
	stop()
	reset()
endevent

event on_chained_quest(string eventName, string arg_s, float argNum, form sender)
	int value = math.floor(argnum)
	keyword kw = sender as keyword
	stop()
	reset()
	kw.sendstoryevent(none, none, pc, 500)
endevent


