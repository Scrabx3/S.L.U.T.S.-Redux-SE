Scriptname sluts_mission_data_sc extends Quest   conditional

import debug

referencealias property pc auto
locationalias property start_hold auto
referencealias property carter auto
locationalias property dest_hold auto
locationalias property dest_hold_capital auto
referencealias property recipient auto
referencealias property manifest auto
referencealias property cart_spawn auto
referencealias property pc_wait auto
referencealias property escrow_chest auto
referencealias property humilation_chest auto
referencealias property carter_cast auto
referencealias property test_bint auto
referencealias property test_rapist auto

Bool Property chaining_flag  Auto  conditional
Bool Property needs_tack_flag  Auto  conditional
Bool Property needs_cart  Auto  conditional
Bool Property forced  Auto  conditional

Bool Property humiledonce Auto conditional

objectreference property cart_ref auto

int property mission_count auto conditional
int property willing_count auto conditional
int property willing_consecutive auto conditional
int property forced_count auto conditional
int property forced_consecutive auto conditional
int property release_count auto conditional
int property advance_count auto conditional
int property gold_in_escrow auto conditional
int property customLocation = -1 auto conditional

float property chain_bonus = 1.0 auto ;The overtime bonus. Wish I had thought to call it that at the time :P
float property chain_rate = 0.5 auto ;The growth rate of the overtime bonus
int property chain_c = 0 auto ;Number of runs in a row player has done. Used for a planned reward.
;globalvariable property chain_count auto

armor[] property i_devs	auto
armor[] property s_devs auto
armor[] property backup_i auto ;These are used to store the player's current pony costume in case she changes her MCM settings in the middle of a run.
armor[] property backup_s auto ;It needs to be stored in these to make sure the removal scripts target the right pieces.

book property fillyLetter auto
int property fillyrank = 3 auto
armor[] property fillyWear_X auto
armor[] property fillyWear_T auto
armor[] property fillyWear_0 auto
armor[] property fillyWear_1 auto
armor[] property fillyWear_2 auto
armor[] property fillyWear_3 auto
armor[] property fillyWear_4 auto

bool property hasFillyReward = false auto ;If you qualify for a Filly Wear reward after your overtime is reset, set this flag so the escrow chest will know to inform you.
int property FillyGold auto ;Store bonus gold you recieve for achieve a Filly Wear bonus.

bool property MCM_AlwaysArrears = false auto
bool property MCM_LargeMessages = false auto
bool property MCM_NoRemoveItems = false auto ;Used for the MCM "no item removal" option. Added because some players where experience issues with all their items being removed.

function copy_ref(string name, objectreference obj, referencealias dest)
	trace("sluts_mission_data: copying reference " + name + ": value = " + obj)

	if obj == none
		trace("sluts_mission_data: error copying reference " + name + ": source reference is none")
	endif
	if dest == none
		trace("sluts_mission_data: error copying reference " + name + ": destination alias is none")
	endif

	if obj == none
		trace("sluts_mission_data: clearing alias " + name)
		dest.clear()
	else
		trace("sluts_mission_data: forcing alias "+name+" to " + obj)
		dest.forcerefto(obj)
	endif
endfunction

function copy_loc(string name, location loc, locationalias dest)
	trace("sluts_mission_data: copying location " + name + ": value = " + loc)
	if loc == none
		trace("sluts_mission_data: error copying location " + name + ": source location is none")
	endif
	if dest == none
		trace("sluts_mission_data: error copying location " + name + ": destination alias is none")
	endif
	if loc == none
		trace("sluts_mission_data: clearing desination alias")
		dest.clear()
	else
		trace("sluts_mission_data: forcing desination alias")
		dest.forcelocationto(loc)
	endif
endfunction


sluts_standard_mission property kickoff_q auto
sluts_mcm property mcm auto

function check_fillyreward(objectreference a)

	if chain_c >= fillyrank

		hasFillyReward = true
		FillyGold = (fillyrank * (fillyrank - 1) * 200) + 50
;		Debug.MessageBox("While reclaiming your stuff you also find a set of restraints, along with a pay bonus of " + paybonus + " and a letter of commendation inside the escrow chest...")
;		Debug.Notification("To collect another Filly Wear bonus you must now complete " + fillyrank + " willing runs in a row.")
		;referencealias FL
		;FL.ForceRefTo(fillyLetter)
;		objectreference LetterRef = a.additem(fillyLetter,1)
;		LetterRef.activate(PC.getreference())
		a.additem(fillyLetter,1)
		a.additem(GOLD,FillyGold)
		a.additem(fillyWear_X[0],1)
		a.additem(fillyWear_X[1],1)
		a.additem(fillyWear_X[2],1)
		a.additem(fillyWear_X[3],1)
		a.additem(fillyWear_T[mcm.tailsIndex],1)
		give_fillycoloredgear(mcm.costumeIndex,a)
		;objectreference ref = fillyletter.getreference()

		fillyrank += 1
	endif

endfunction

function give_fillycoloredgear(int i,objectreference a)

	if i == 1 ;red
		a.additem(fillyWear_1[0],1)
		a.additem(fillyWear_1[1],1)
		a.additem(fillyWear_1[2],1)
	elseif i == 2 ;white
		a.additem(fillyWear_2[0],1)
		a.additem(fillyWear_2[1],1)
		a.additem(fillyWear_2[2],1)
	elseif i == 3 ;blue
		a.additem(fillyWear_3[0],1)
		a.additem(fillyWear_3[1],1)
		a.additem(fillyWear_3[2],1)
	elseif i == 4 ;pink
		a.additem(fillyWear_4[0],1)
		a.additem(fillyWear_4[1],1)
		a.additem(fillyWear_4[2],1)
	else ;black
		a.additem(fillyWear_0[0],1)
		a.additem(fillyWear_0[1],1)
		a.additem(fillyWear_0[2],1)
	endif

;costumeIndex

endfunction

;========================================================================================
;========================================================================================
; This new function will remove most devious devices that conflict with the pony outfit
;========================================================================================

zadlibs property zlib auto

function r_conflict_device(keyword kw)

	Armor idevice
	;Armor rdevice

	actor _pc = Game.GetPlayer()

	if _pc.wornhaskeyword(kw)
		idevice = zlib.GetWornDevice(_pc, kw)
		if idevice && !idevice.HasKeyword(zlib.zad_BlockGeneric) && !idevice.HasKeyword(zlib.zad_Questitem)
			zlib.UnlockDevice(_pc, idevice)
			;/No longer need to worry about rendered device with DD5, going straight to
			removal function - Scrab
			rDevice = zlib.GetRenderedDevice(idevice)
			if rdevice && !rdevice.HasKeyword(zlib.zad_BlockGeneric) && !rdevice.HasKeyword(zlib.zad_Questitem)
				zlib.removeDevice(_pc, idevice, rDevice, kw, destroyDevice = false, skipevents = false, skipmutex = true)
			else
				zlib.notify("One of your bondage devices is too powerful to remove...")
			endif
			/;
		else
			zlib.notify("One of your bondage devices is too powerful to remove...")
		endif
	endif

EndFunction
;========================================================================================
;========================================================================================

;/
function force_aliases(sluts_standard_mission src)
	trace("sluts: mission data - setting aliases")
	copy_loc("start_hold",		src.start_hold_loc,	start_hold)
	copy_ref("carter",		src.carter_ref,		carter)
	copy_loc("dest_hold",		src.dest_hold_loc,	dest_hold)
	copy_loc("dest_hold_cap",	src.dest_hold_cap_loc,	dest_hold_capital)
	copy_ref("recipient",		src.recipient_ref,	recipient)
	copy_ref("manifest",		src.manifest_ref,	manifest)
	copy_ref("pc_wait",		src.pc_wait_ref,	pc_wait)
	copy_ref("cart_spawn",		src.cart_spawn_ref,	cart_spawn)
	copy_ref("escrow_chest",	src.escrow_chest_ref,	escrow_chest)
	copy_ref("humilation_chest",	src.humilation_chest_ref, humilation_chest)
	copy_ref("carter_cast",		src.carter_cast_ref,	carter_cast)
	trace("sluts: mission data - aliases should be set")
endfunction
/;

MiscObject Property Gold  Auto

Armor[] Property Harn  Auto
