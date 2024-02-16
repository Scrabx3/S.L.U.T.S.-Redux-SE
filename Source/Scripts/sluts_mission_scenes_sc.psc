Scriptname sluts_mission_scenes_sc extends Quest  conditional

import debug

actor property pc auto

SexLabFramework Property slab Auto

sluts_mission_data_sc Property data  Auto

activator	property cart_form auto

globalvariable property sluts_debug_flag auto
globalvariable property sluts_arrears auto
globalvariable property aa_testy auto

referencealias	property cart_al auto
referencealias	property dispatch auto
referencealias	property terminus auto
referencealias	property manifest auto
locationalias	property dest_hold auto
locationalias	property dest_hold_cap auto
locationalias	property start_hold auto
referencealias	property interlocutor auto
referencealias	property termy_mark auto

referencealias	property pc_spawn_mark auto
referencealias	property cart_spawn_mark auto
referencealias	property carter_spawn_mark auto
referencealias	property escrow_chest auto
referencealias	property humilation_chest auto
referencealias	property root_marker auto

objectreference	property DD_temp_chest auto

scene property setup_sc auto
scene property delivery_scene auto
scene property manifest_check_scene auto
scene property ungag_scene auto
scene property release_scene auto
scene property humilation_scene auto ;Just the dispatcher summoning the "humilation chest".
scene property tack_check_scene auto
scene Property sex_chest_scene  Auto
scene Property model_dd_scene  Auto ;The dispatcher has you "model" a devious device as a possible humilation outcome.
scene Property sluts_needs_scene  Auto

int property pilferage auto conditional

zadlibs property zlib auto
zadxlibs property xlib auto

int property base_value auto
int property base_pay auto conditional
int property loss auto
int property actual_pay auto conditional
globalvariable property base_pay_global auto ;For displaying the base pay in the manifest.

bool property humilated = false auto conditional
int property HumilHorny = 0 auto
string[] property HumilMasterbate auto
int property HumilPick auto conditional
bool property humilsex = false auto conditional

objectreference property chest auto
objectreference property tmp_chest auto
objectreference property cart auto
bool property tethered auto conditional

MiscObject property Gold001 Auto
Book property ManifestBase auto ;Used to purge any stray manifests that might have been left in the player's inventory after completeing a run due to glitching.

Spell property arrearsspell Auto

faction property livery_faction auto
faction property dirty_faction auto
faction property PredatorFriendFaction auto
faction property CreatureFriendFaction auto
faction property BanditFriendFaction auto
faction property slut_drivers_fac auto ;For the mini hub operators not to pilfer you.
faction property carriage_drivers_fac auto ;For some reason the script REFUSES to acknowlege that the carriage drivers are in the Sluts Driver Faction, so we need this too >:(
faction property companion_fac auto ;For your followers not to pilfer you.


keyword property sluts_device_kw auto

sluts_tats property tatlib auto
sluts_dlog_sc property dlog_q auto
;sluts_sideq_bj_for_ride Property bj_q  Auto


int	property	gag_idx		= 0	autoreadonly
int	property	collar_idx	= 1	autoreadonly
int	property	yoke_idx	= 2	autoreadonly
int	property	gloves_idx	= 3	autoreadonly
int	property	arms_idx	= 4	autoreadonly
int	property	legs_idx	= 5	autoreadonly
int	property	boots_idx	= 6	autoreadonly
int	property	tail_idx	= 7	autoreadonly
int	property	harness_idx	= 8	autoreadonly
int	property	max_idx		= 8	autoreadonly

slaFrameworkScr property sla auto

;armor[] property	i_devs 		auto ;The real version is now handled by the mission_scenes_data script, for costumization options.
;armor[] property	s_devs 		auto ;These ones are now used for reserving your current costume in case the player changes their MCM custumization in the middle of a delivery.
keyword[] property	kw_dev 		auto

message property msg_stroke_flank	auto
message property msg_lift_boob		auto
message property msg_hands_all_over	auto
message property msg_gag_r_on		auto
message property msg_gag_d_on		auto
message property msg_gag_r_off		auto
message property msg_gag_d_off		auto

bool property ride_home_flag auto conditional
bool property needs_bridle_flag auto conditional
bool property termy_on_mark auto conditional

location property EastmarchHoldLocation auto
location property HaafingarHoldLocation auto
location property ReachHoldLocation auto
location property RiftHoldLocation auto
location property WhiterunHoldLocation auto
location property FalkHoldLocation auto
location property DawnHoldLocation auto
location property MorthHoldLocation auto
location property WinterHoldLocation auto
location[] property myLocations auto

location property WindhelmLocation auto
location property SolitudeLocation auto
location property MarkarthLocation auto
location property RiftenLocation auto
location property WhiterunLocation auto
location property FalkLocation auto
location property DawnLocation auto
location property MorthLocation auto
location property WinterLocation auto

formlist property driverList auto

;float property chain_bonus = 1.0 auto
;float property chain_rate = 0.5 auto
;int property chain_count = 0 auto
float pay_mult = 1.0

;globalvariable property chain_count auto ;handled by the data script now.

;bool pitstopPay = false ;Set if you stop a run to make sure you don't get payed twice.
;This string is added to comments regarding you getting fined for back talking on of the dispatchers. This way we only have to grammar check it once :)
string property backtalkfine =  " gold has been added to your arrears, bringing the total debt to " auto

bool YouUntethered ;Set when you manually untether. Used in conjunction with the force retether hotkey fix.

book property handbook auto ;The S.L.U.T.S. Employee conduct handbook.

activator property newcart auto

;VisualEffect property HumilChestEffect auto

location function get_capital(locationalias locref)
	location hloc = locref.getLocation()

	if hloc == none
		trace("sluts mission scenes: null location passed to get capital")
		return none
	endif

	trace("sluts: getting capital for " + hloc.getname())

	if hloc == EastmarchHoldLocation
		trace("sluts: itentified Windhelm")
		return WindhelmLocation
	endif
	if hloc == HaafingarHoldLocation
		trace("sluts: itentified Solitude")
		return SolitudeLocation
	endif
	if hloc == ReachHoldLocation
		trace("sluts: itentified Markarth")
		return MarkarthLocation
	endif
	if hloc == RiftHoldLocation
		trace("sluts: itentified Riften")
		return RiftenLocation
	endif
	if hloc == WhiterunHoldLocation
		trace("sluts: itentified Whiterun")
		return WhiterunLocation
	endif
	if hloc == FalkHoldLocation
		trace("sluts: itentified Whiterun")
		return FalkLocation
	endif
	if hloc == DawnHoldLocation
		trace("sluts: itentified Whiterun")
		return DawnLocation
	endif
	if hloc == MorthHoldLocation
		trace("sluts: itentified Whiterun")
		return MorthLocation
	endif
	if hloc == WinterHoldLocation
		trace("sluts: itentified Whiterun")
		return WinterLocation
	endif
	return none
endfunction

keyword property sluts_scene_cart_mark auto
keyword property sluts_scene_driver_mark auto
keyword property sluts_scene_escrow auto
keyword property sluts_scene_pc_mark auto
keyword property sluts_scene_root_mark auto
keyword property sluts_scene_driver_bj_mark auto
keyword property sluts_scene_testy auto

function setup()
	trace("sluts: starting common quest")
	start()
;
;	we need to exit this function and give the quest time
;	to set up its aliases properly
;
;	set a state so we don't get mixed up with later onupdate loops
;
	gotostate("starting")
;
;	and now register
;
	registerforsingleupdate(0.1)

	activate_key = Input.GetMappedKey("Activate")
	RegisterForKey(activate_key)
	jump_key = Input.GetMappedKey("Jump")
	RegisterForKey(jump_key)
;	reset_key = Input.GetMappedKey("Favorites")
	reset_key = Input.GetMappedKey("Hotkey8")
	RegisterForKey(reset_key)
endfunction

Event OnKeyDown(Int KeyCode)
	bool shifted = Input.IsKeyPressed(42) || Input.IsKeyPressed(54)
	bool ctrl = Input.IsKeyPressed(29) || Input.IsKeyPressed(157)

	if !shifted
		return
	endif

	If KeyCode == activate_key
		float distance = pc.getdistance(cart)
		if distance > 450 && !YouUntethered
			force_tether()
		elseif tethered
			unhitch_attempt()
		endif
;YouUntethered
	elseif keycode == jump_key
		toggle_handbrake()
	elseif keycode == reset_key && ctrl
		pc.reset()
		utility.wait(0.2)
		Game.LoadGame("Quicksave")
	endif
endevent

function force_tether()

		if cart == none
			zlib.notify("Debug: No cart to return detected...")
			return
		endif

		if YouUntethered
			return
		endif

		zlib.notify("Debug: Forced Tether Return Detected...")

		;Sometimes this command would move the player to outer space (a long way down to your death)
		;So let's overkill make sure the cart is pushed to the player and not the other way around...
		float XX = pc.GetPositionX()
		float YY = pc.GetPositionY()
		float ZZ = pc.GetPositionZ()
		cart.setposition(pc.GetPositionX() - 250,pc.GetPositionY() - 250,pc.GetPositionZ())
		cart.setangle(0,0,0)
		utility.wait(0.1)

;		cart.moveto(pc,200,200,0) ;This version was the buggy once that would sometimes warp to player into the sky instead of bringing the cart to her. No good.
		utility.wait(0.1)

		do_tether(cart, pc)
		pc.setposition(XX,YY,ZZ)
endfunction

function unhitch_attempt()
	if !tethered
		trace("sluts: no tether - nothing to do")
		return
	endif
	YouUntethered = true
	trace("sluts: is tethered - attempting to untether")
	notification("attempting to untether")
	zlib.abq.StruggleScene(pc)
	zlib.Aroused.UpdateActorExposure(pc, 1)
;	if Utility.RandomInt() < 66
		notification("You successfully free yourself from the cart.")
		release_tether(pc)
;	else
;		YouUntethered = false
;		notification("You can't quite manage to unhook the yoke from the cart.")
;	endif
endfunction

function reattach_on_load()
	activate_key = Input.GetMappedKey("Activate")
	RegisterForKey(activate_key)
	jump_key = Input.GetMappedKey("Jump")
	RegisterForKey(jump_key)

	trace("attempting re-attach")
	if !tethered
		trace("sluts: not tethered")
		return
	endif
	if cart == none
		trace("sluts: no cart")
		tethered = false
		return
	endif
	float distance = pc.getdistance(cart)
	if distance > 450
		force_tether()
;		trace("sluts: too far away: " + distance)
;		release_tether(pc)
		return
	endif

	do_tether(cart, pc)

endfunction

objectreference function check_cart()
	if cart == none
		return none
	endif
	float distance = pc.getdistance(cart)
	if distance > 450 && tethered
		force_tether()
;		release_tether(pc)
	endif

	if tethered
		if Game.IsFastTravelEnabled()
			Game.EnableFastTravel(false)
		endif
	endif
	return cart
endfunction

bool property handbrake = false auto
int property activate_key auto hidden
int property jump_key auto hidden
int property reset_key auto hidden
int timeout = 0
objectreference driver

state starting
	event onupdate()
		driver = dispatch.getreference()
		if driver != none

			gotostate("")
			setup_2()

		endif
		timeout += 1
		if timeout > 100
			messagebox("Aliases not filled after 10 seconds - I fear all is not well, Master Bruce")
		else
			registerforsingleupdate(0.1)
		endif
	endevent
endstate

dpv__QF_sluts_standard_missio_02002ded property qqq auto
objectreference[] property myDrivers auto

function setup_2()
	pilferage = 0
	needs_bridle_flag = true
	termy_on_mark = false

	int limit = 0
	sluts_standard_mission kicker_q

	;ReachHoldLocation

;
;	get the destination hold capital
;


	location cap = get_capital(dest_hold)
	dest_hold_cap.forcelocationto(cap)

	if driver == none
		messagebox("I am unable to find a reference for the dispatcher - I fear all is not well, Master Bruce")
		return
	endif

	objectreference root = driver.getlinkedref(sluts_scene_root_mark)
	if root == none
		messagebox("I am unable to find the root marker for this hold - I fear all is not well, Master Bruce")
		return
	endif

	pc_spawn_mark.forcerefto(root.getlinkedref(sluts_scene_pc_mark))
	cart_spawn_mark.forcerefto(root.getlinkedref(sluts_scene_cart_mark))
	carter_spawn_mark.forcerefto(root.getlinkedref(sluts_scene_driver_mark))
	escrow_chest.forcerefto(root.getlinkedref(sluts_scene_escrow))


	int debug_flag = sluts_debug_flag.getValueInt()

;=========================================================================================================================================================================
; The main script lines for custom destinations being picked. Doesn't cover paid rate nerf.

	if (data.customLocation > -1)

		;notification("Big Boob") ;A very mature debug test message
		dest_hold.forcelocationto(myLocations[data.customLocation]) ;HaafingarHoldLocation)
		cap = get_capital(dest_hold)
		dest_hold_cap.forcelocationto(cap)
;		dest_hold_cap.forcelocationto(SolitudeLocation)


		;notification("Custom Destination Chosen")
		;notification("Destination is " + data.customLocation)
		terminus.forcerefto(myDrivers[data.customLocation])
		qqq.Alias_recipient.forcerefto(myDrivers[data.customLocation])
		;notification(termy.GetLeveledActorBase().Getname())

	endif

;=========================================================================================================================================================================

	objectreference termy
;
;	if we set the debug flag, use Testy McTester as terminus
;
	if debug_flag
		termy = root.getlinkedref(sluts_scene_testy)
		terminus.forcerefto(termy)
	else
		termy = terminus.getreference()
	endif

	objectreference term_root = termy.getlinkedref(sluts_scene_root_mark)
	termy_mark.forcerefto(term_root.getlinkedref(sluts_scene_driver_bj_mark))

	humilation_chest.forcerefto(term_root.getlinkedref(sluts_scene_escrow))
	objectreference humily = humilation_chest.getreference()
	humily.disable()

	dlog_q.update_aliases(dispatch.getreference() as actor, terminus.getreference() as actor, none)

	trace("sluts: disabling fast travel")
	game.enablefasttravel(false)
;
;	now: another onUpdate loop to make sure the scene starts
;	we probably don't need this given the earlier loop
;
	registerforsingleupdate(0.5)

	;aa_testy
	;aa_testy.setvalue(root.GetDistance(termy))
	;11,534 13182

	;-----------------------------------------------------------------------------------
	; Let's get that base pay figured out
	pay_mult = data.mcm.basepay
	pay_mult /= 100

	float myDist = (root.GetDistance(termy) / 12358.0)
	if (data.customLocation > -1)
		myDist *= 0.85 ;If you chose your own destination you get a 15% paycut (100 - 15 = 85)
	endif
	int myDistInt = myDist as int
	base_pay = myDistInt * 50

	if base_pay > 1400
		base_pay = 1400
	elseif base_pay < 450
		if (data.customLocation > -1)
			base_pay = 450
		else
			base_pay = 375
		endif
	endif

	float tp = (base_pay * pay_mult)
	base_pay = tp as int

	base_pay_global.setvalue(base_pay)
	UpdateCurrentInstanceGlobal(base_pay_global)
	;-----------------------------------------------------------------------------------

	RegisterForModEvent("SLUTS Livery Event", "on_livery_event")
	RegisterForModEvent("SLUTS Livery Banner Event", "on_banner_event")
	RegisterForModEvent("AnimationBegin", "on_sex_start")
	RegisterForModEvent("AnimationEnd", "on_sex_end")
endfunction


;
; livery tattoo applied or removed
;
event on_livery_event(string applied, Form f)
	Actor who = f as Actor

	if who != pc
		return
	endif

	if applied == "applied"
		pc.setFactionRank(livery_faction, 1)
	else
		pc.removefromfaction(livery_faction)
	endif
endevent

;
; banner will smash
;
event on_banner_event(string applied, Form f)
	; nothing yet
endevent

event onupdate()

;	if cart != none
;		float distance = pc.getdistance(cart)
;		if distance > 450 && tethered && !YouUntethered
;			force_tether()
;		endif
;	endif

	if setup_sc.isPlaying()
		return
	endif
	trace("sluts: trying to start scene")
	setup_sc.start()
	registerforsingleupdate(1)
endevent


function xfer_manifest()

	actor carter = dispatch.getreference() as actor
	objectreference ref = manifest.getreference()
	pc.additem(ref)
	carter.removeitem(ref)	; just to be sure
endfunction

function show_manifest()

	trace("sluts: setting needs_bridle_flag to false")
	needs_bridle_flag = false

	trace("sluts: equipping manifest")
	objectreference ref = manifest.getreference()

	trace("sluts: adding gag")
	equip_idx(gag_idx)

	;zlib.notify("The distance of this haul sets your base pay at " + base_pay + ".", data.MCM_LargeMessages) ;base_pay
	ref.activate(pc)
endfunction

function stage_20()
	trace("sluts: mission stage 20")
	;setobjectivedisplayed(20)

endfunction

;
; there aren't many 3-way animations that work while still in the traces.
;
; so disengage at the start of group sex animations
;
event on_sex_begin(string eventName, string arg_s, float argNum, form sender)

	if getstage() != 20 ;This type of stuff should only occur during a haul
		return
	endif

	trace("sluts: sex start: pilferage is " + pilferage)
;
;	disengage cart by toggling enable state
;	mved this up here so it should always happen
;
	cart.disable()
	utility.wait(0.2)
	cart.enable()

	if slab == none
		slab = SexLabUtil.GetAPI()
	endif
;
;	get controller
;
	sslThreadController c = slab.HookController(arg_s)
;
;	check # actors
;
	int n_actor =  c.Positions.length
	if c.Positions.length <= 1
		return
	endif
;
;	come to think of it, the options are a bit limited for 2-ways
;	but I like to see her get fucked in the traces, so I'm only doing this
;	some of the time
;
	if c.Positions.length == 2
;
;		if we return here, we won't unhook the player
;		so we're unhooking on a 65% chance OR if the actor is a creature
;
		if utility.randomint() < 65 || !c.Positions[1].getRace().isPlayable()
			return
		endif
	endif
	release_tether(pc)
endevent


event on_sex_end(string eventName, string arg_s, float argNum, form sender)
	trace("sluts: sex ending: pilferage is " + pilferage)
	if slab == none
		slab = SexLabUtil.GetAPI()
	endif

;
;	get controller
;
	sslThreadController c = slab.HookController(arg_s)

	if humilsex && c.Positions[0] == pc
		utility.wait(2)
		humilation_scene.start()
		humilsex = false
		return
	endif

	if HumilHorny > 0 && c.Positions[0] == pc
		notification(HumilMasterbate[utility.randomint(0,HumilMasterbate.length - 1)])
		easy_way()
		return
	endif

;
;	pc in victim role?
;
	if c.victimref != pc
		trace("sluts: not a rape - not interested")
		; not interested in consesual sex or pc non-involvment
		return
	endif

	dirtify()

	if !c.Positions[1].getRace().isPlayable() || getstage() != 20 || c.Positions[1].IsInFaction(slut_drivers_fac)
		trace("sluts: creature rape or not on a cargo run - no pilfering please")
;		dirtify()
		return
	endif

	int pilfchance = utility.randomint(0,100)
	int P = data.mcm.SS_pilf

	;Certain other mods can make the carriage drivers, minihub dispatchers, and player followers a bit rapey...
	;...so let's at least stop them from pilfering you. I guess they could be that big of assholes, but nah, let's not do that...
	int X = 0
	while x < 5

		if c.Positions[X].IsInFaction(carriage_drivers_fac) == 1 ;Stubborn script refuses to acknowledge the vanilla carriage drivers are now part of the SLUTS faction, so we need this failsafe >:(
			;zlib.notify("DEBUG: You had sex with a driver.",true)
			return
		endif
		if c.Positions[X].IsInFaction(slut_drivers_fac) == 1
			;zlib.notify("DEBUG: You had sex with a dispatcher.",true)
			return
		endif
		if c.Positions[X].IsInFaction(companion_fac) == 1
			;zlib.notify("DEBUG: You had sex with one of your companions.",true)
			return
		endif
		X += 1
		if c.Positions[X].IsInFaction(data.mcm.band_fact[0]) == 1 || c.Positions[X].IsInFaction(data.mcm.band_fact[1]) == 1
			zlib.notify("DEBUG: You had sex with a bandit/forsworn.",true)
			P = data.mcm.SS_pilfB
		endif
		X += 1
	endwhile

	;Once again this type of stuff should only occur during a haul and not from a SLUTS dispatcher too.
	;Also if the random pilferage failure is higher than the MCM setting then cancel pilferage.
	if getstage() != 20 || pilfchance > P
		return
	endif

	; check # actors
	int n_rapists =  c.Positions.length - 1
	if n_rapists == 0
		trace("Solo Rape Animation: WTF?")
		n_rapists = 1	; I suppose it's plausible for mind control scenes...
	endif

	pilferage += utility.randomint(1, data.mcm.SS_pilfM)
	pilferage += 10 * (n_rapists - 1)	; add 10% for each additional attacker
;/
 /	allowing pilferage > 100% to reflect damage to the cart
 /;
	if pilferage > 120
		pilferage = 120
	endif

	notification("Somebody has been helping themselves to your goods. Your pilferage value is now " + pilferage * 15 + "/1500")

	trace("sluts: pilferage now " + pilferage)

;	dirtify()
endevent

function dirtify()
	int level = PapyrusUtil.ClampInt(pc.getfactionrank(dirty_faction) + 1, 1, 10)
	;slavetats.simple_add_tattoo(pc, "Dirty S.L.U.T.S.", "Dirty Head " + level, last = false, silent = true )
	;slavetats.simple_add_tattoo(pc, "Dirty S.L.U.T.S.", "Dirt " + level, last = true, silent = true )
	pc.setfactionrank(dirty_faction, level)
	tatlib.set_dirty_level(pc, level)
endfunction

function start_delivery_scene()
	if getstage() == 30
		return
	endif
	setstage(30)
	delivery_scene.start()
endfunction


function start_ungagging_scene()
	ungag_scene.start()
endfunction


function start_manifest_scene()
	manifest_check_scene.start()
endfunction

function ungag()
	remove_idx(gag_idx)
endfunction

function regag()
	equip_idx(gag_idx)
endfunction


bool property has_collar auto conditional
bool property has_arm_cuffs auto conditional
bool property has_leg_cuffs auto conditional
bool property has_yoke auto conditional		; Yoke? Oh! Oh no!
bool property has_gloves auto conditional
bool property has_boots auto conditional
bool property has_gag auto conditional
bool property has_tail auto conditional
int property missing_gear_fine auto conditional
bool property missing_all_gear auto conditional

bool function check_idx(int idx)
	bool rv = pc.wornhaskeyword(kw_dev[idx])
	if !rv
		missing_gear_fine += 100
	else
		missing_all_gear = false
	endif
	return rv
endfunction

function equip_idx(int idx)

	keyword kw = kw_dev[idx]

;	if pc.wornhaskeyword(kw) ;If the Player already is wearing a conflicting device let's try to remove it.
;		r_conflict_device(idx)
;		utility.wait(0.3) ;Add a slight delay between each item so Skyrim's clunky scripting system can keep up. Otherwise it sometimes skips pieces when conflicting parts are detected.
;	endif

	armor dev_i = data.i_devs[idx]
	armor dev_s = data.s_devs[idx]

	data.backup_i[idx] = dev_i ;Reserve your costume to prevent removal errors if the player decides...
	data.backup_s[idx] = dev_s ;...to alter their MCM custom costume mid delivery.

	zlib.equipDevice(pc, dev_i, dev_s, kw, false, false)

endfunction

function remove_idx(int idx)

	armor dev_i = data.backup_i[idx] ;Remove the reserved version, not the one set in sluts_mission_scenes_data
	armor dev_s = data.backup_s[idx]
	keyword kw = kw_dev[idx]

	zlib.removeDevice(pc, dev_i, dev_s, kw, false, false)
	pc.removeitem(dev_i, 999, true)

endfunction

;========================================================================================
;========================================================================================
; This new function will remove most devious devices that conflict with the pony outfit
;========================================================================================
function r_conflict_device(int idx, bool GenericToo = false)

	Armor idevice
	Armor rdevice
	keyword kw

	if idx >= 99
		kw = zlib.zad_DeviousHeavyBondage ;A little hack for removing any arm restraint device to make way for the yoke.
	elseif idx >= 98
		kw = zlib.zad_DeviousSuit ;Got to check for body suits/hobble dress too now since they conflict with the breast yoke.
	else
		kw = kw_dev[idx] ;Otherwise use the keyword id listed
	endif

		if pc.wornhaskeyword(kw)

			idevice = zlib.GetWornDevice(pc, kw)
			if idevice && (!idevice.HasKeyword(zlib.zad_BlockGeneric) || GenericToo) && !idevice.HasKeyword(zlib.zad_Questitem)
			;if idevice && !idevice.HasKeyword(zlib.zad_BlockGeneric) && !idevice.HasKeyword(zlib.zad_Questitem)
			zlib.UnlockDevice(pc, idevice)
			;/No longer need to worry about rendered device with DD5, going straight to
			removal function - Scrab
				rDevice = zlib.GetRenderedDevice(idevice)
				if rdevice && !rdevice.HasKeyword(zlib.zad_BlockGeneric) && !rdevice.HasKeyword(zlib.zad_Questitem)
					zlib.removeDevice(pc, idevice, rDevice, kw, destroyDevice = false, skipevents = false, skipmutex = true)
					pc.removeitem(idevice,1,true)
					DD_temp_chest.additem(idevice,1)
				else
					zlib.notify("One of your bondage devices is too powerful to remove...")
				endif
				/;
			else
				zlib.notify("One of your bondage devices is too powerful to remove...")
			endif
		endif
EndFunction

;function r_conflict_device_new(int keywd, int idx = 0x00010000, bool GenericToo = false)

;	Armor idevice
;	Armor rdevice
;	keyword kw

;	if keywd >= 99
;		kw = zlib.zad_DeviousHeavyBondage ;A little hack for removing any arm restraint device to make way for the yoke.
;	elseif keywd >= 98
;		kw = zlib.zad_DeviousSuit ;Got to check for body suits/hobble dress too now since they conflict with the breast yoke.
;	else
;		kw = kw_dev[keywd] ;Otherwise use the keyword id listed
;	endif

;	if pc.wornhaskeyword(kw)
;		idevice = pc.GetWornForm(0x00010000) as Armor ;zlib.GetWornDevice(pc, kw)
;;		if idevice && (!idevice.HasKeyword(zlib.zad_BlockGeneric) || GenericToo) && !idevice.HasKeyword(zlib.zad_Questitem)
;		if idevice && !idevice.HasKeyword(zlib.zad_BlockGeneric) && !idevice.HasKeyword(zlib.zad_Questitem)
;			rDevice = zlib.GetRenderedDevice(idevice)
;			if rdevice && !rdevice.HasKeyword(zlib.zad_BlockGeneric) && !rdevice.HasKeyword(zlib.zad_Questitem)
;				zlib.removeDevice(pc, idevice, rDevice, kw, destroyDevice = false, skipevents = false, skipmutex = true)
;			else
;				zlib.notify("One of your bondage devices is too powerful to remove...")
;			endif
;		else
;			zlib.notify("One of your bondage devices is too powerful to remove...")
;		endif
;	endif

;EndFunction

;========================================================================================
;========================================================================================

;
; check that she still has her DD gear
; she doesn't need to be wearing it, just to have it
;
function check_tack()
	missing_gear_fine = 0
	missing_all_gear = true
	has_collar	= check_idx(collar_idx)
	has_leg_cuffs	= check_idx(legs_idx)
	has_arm_cuffs	= check_idx(arms_idx)
	has_yoke	= check_idx(yoke_idx)
	has_gloves	= check_idx(gloves_idx)
	has_boots	= check_idx(boots_idx)
	has_tail	= check_idx(tail_idx)
	has_gag		= check_idx(gag_idx)
endfunction

objectreference property temp_chest auto

;
; OK: this gets tricky.
;
; we need to remove all items, but not equipped SLUTS tack
; and not render devices from other dd sources
; and not inventory devices that resist being removed.
;
; what do I do if the player comes back with something locked on
; that has block generic removal
;
function strip_slut()
	form f
	int idx = 0

	if slab == none
		slab = SexLabUtil.GetAPI()
	endif

	bool[] slots = new bool[34]
	while idx < 34
		slots[idx] = true
		idx += 1
	endwhile

	; start by removing anything not blocked by sexlab
	slab.StripSlots(pc, slots)

	form[] flist = pc.getContainerForms()

	; loop over the inventory
	idx = flist.length
	While idx > 0
		idx -= 1

		strip_device(flist, idx)
	endwhile
endfunction

function strip_device(form[] flist, int idx)
	bool rval
	form f = flist[idx]

	; anything SLUTS branded stays
	if f.haskeyword(sluts_device_kw)
		return
	endif

	; if it's an inventory device, see if it will come off
	if f.haskeyword(zlib.zad_InventoryDevice)
		rval = zlib.UnlockDevice(pc, f as armor)
		if !rval
			return
		endif

		; worry here that we're changing contents of the container
		; in the middle of iterating over it.
		pc.removeitem(f, 99999, true, chest)
		flist[idx] = none
	endif

	; if it resisted sexlab's attempt to unequip it
	; then it's either a render device, or else a faux body part like horns or wings
	if pc.isEquipped(f)
		return
	endif

	pc.removeitem(f, 99999, true, chest)
	flist[idx] = none
endfunction

state place_wagon_cooldown
	event onupdate()
		gotostate("")
	endevent
	function place_wagon(actor target)
	endfunction
endstate

function place_wagon(actor target)
	gotostate("place_wagon_cooldown")
	registerforsingleupdate(60)

	debug.trace("sluts: place_wagon - working")
	data.mission_count += 1
	if data.forced
		data.forced_count += 1
		data.forced_consecutive += 1
		data.willing_consecutive = 0
	else
		data.willing_count  += 1
		data.forced_consecutive = 0
		data.willing_consecutive += 1
	endif


	objectreference mark = cart_spawn_mark.getreference()

	if data.cart_ref == none
		cart = mark.PlaceAtMe(cart_form)
	else
		cart = data.cart_ref
	endif

	cart_al.forcerefto(cart)
	dlog_q.update_aliases(none, none, cart)
	data.advance_count = 0

	cart.enable()
;/
 /	needs an option to apply a UNP texture. also a UNP texture to apply.
 /;
	; slavetats.simple_add_tattoo(target, "S.L.U.T.S.", "Livery (CBBE)", last = true, silent = true )
	if pc.wornhaskeyword(sluts_device_kw)
		remove_costume() ;if the player is already in a S.L.U.T.S. costume, remove it.
		utility.wait(0.1)
;	else ;If they were wearing SLUTS devices we can assume they are already tattooed, so let's reduce the chance of duplicates.
	endif

	tatlib.livery_on()


;
;	this is a little brute force, but better than just grabbing everything
;	if anyone can't wear everything, they'll just have to be fined for being
;	out of uniform (eventually).
;
;	and if they're wearing a 'binder, they'll need to get a yoke on before they can pull the cart
;
	;strip_slut()			; I cannot make strip slots work as advertised!
					; We will just have to be anti-scoial for now

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
; Overtime Stuff
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	data.chain_c += 1 ;ount.setvalue(data.chain_count.getvalue() + 1)
	utility.wait(0.1)

	if sluts_arrears.GetValue() > 0 || data.chain_c <= 1 ;ount.getvalue() <= 1
		data.chain_bonus = 1
	else
		string z = " "
		data.chain_bonus += data.chain_rate ;.Setvalue(data.chain_bonus.getvalue() + 1)
		if data.chain_bonus >= 6
			z = " maxed out at "
			data.chain_bonus = 6
		endif
		int ch = ((data.chain_bonus - 1) * 100) as int
		zlib.notify("Having agreed to " + data.chain_c + " hauls in a row your overtime bonus is now" + z + ch + "%", data.MCM_LargeMessages)
	endif

;	zlib.notify("Debug: Chain Count is at " + data.chain_c) ;ount.getvalue())
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	removeconflicting() ;If the Player already is wearing a conflicting device let's try to remove it.
	utility.wait(0.1)

	if (!data.MCM_NoRemoveItems)
		target.removeallitems(chest)
	else
		target.removeitem(Gold001,9999999,true,chest)
	endif
	utility.wait(0.1)

	DD_temp_chest.removeallitems(pc)

	pc.addspell(arrearsspell,false)
	pc.additem(handbook,1)
	if (data.mcm.useThermal)
		pc.equipitem(data.mcm.Thermals,true,true)
	endif

	if !pc.wornhaskeyword(kw_dev[1])
		equip_idx(collar_idx)
	endif
	utility.wait(0.1) ;Add a slight delay between each item so Skyrim's clunky scripting system can keep up. Otherwise it sometimes skips pieces when conflicting parts are detected.
;	if !pc.wornhasKeyword(zlib.zad_deviousankleshackles)
	equip_idx(legs_idx)
;	endif
	utility.wait(0.1)
	equip_idx(gloves_idx)
	utility.wait(0.1)
	equip_idx(boots_idx)
	utility.wait(0.1)
	if data.mcm.tailsIndex != 4
		equip_idx(tail_idx)
		utility.wait(0.1)
	endif
	equip_idx(arms_idx)
	utility.wait(0.1)
	equip_idx(yoke_idx)

	if (data.mcm.bonehack)
		pc.GetActorBase().SetEssential()
	endif

	;; attach it to the towing actor. for this to work the skeleton must have
	;; the HorseSpine2 bone in it at roughly horse height. it does not need to
	;; have any animations or constraints, and in fact may be better if it is
	;; completely devoid of features.

	do_tether(cart, pc)
endfunction

;========================================================================================
;========================================================================================

function removeconflicting()

	;boots = 0x00000080
	;collar = 0x00008000
	;gag = 0x00004000
	;gloves = 0x00000008
	;AnalPlug = 0x00040000
	;VaginaPlug = 0x08000000
	;BodyHarness = 0x10000000
	;Slot 60 = 0x40000000

	; Let's do the gag first, since it is the most likely to cause issues.
	if pc.wornhaskeyword(kw_dev[0])
		r_conflict_device(0)
		utility.wait(0.1)
	endif

	if pc.wornhaskeyword(zlib.zad_DeviousHeavyBondage) ;If the Player already is wearing a conflicting armbinder/yoke/arm shackle/tied arm type device let's try to remove it.

		r_conflict_device(99, true)
;		r_conflict_device_new(99, 0x00010000, true)
;		r_conflict_device(99)
		utility.wait(0.1) ;Add a slight delay between each item so Skyrim's clunky scripting system can keep up. Otherwise it sometimes skips pieces when conflicting parts are detected.
	endif

	if pc.wornhaskeyword(zlib.zad_DeviousSuit) ;The breast yoke uses the body slot, so devious catsuits and hobble dress have to be removed too now.
		r_conflict_device(98)
		utility.wait(0.1) ;Add a slight delay between each item so Skyrim's clunky scripting system can keep up. Otherwise it sometimes skips pieces when conflicting parts are detected.
	endif

	;keyword kw

	;Yeah, I got lazy here.
	if pc.wornhaskeyword(kw_dev[1])
		r_conflict_device(1)
		utility.wait(0.1)
	endif
;	if pc.wornhaskeyword(kw_dev[2])
;		r_conflict_device(2)
;		utility.wait(0.1)
;	endif
	if pc.wornhaskeyword(kw_dev[3])
		r_conflict_device(3)
		utility.wait(0.1)
	endif
	if pc.wornhaskeyword(kw_dev[4])
;		r_conflict_device_new(4, 0x20000000, true)
		r_conflict_device(4, true)
;		r_conflict_device(4)
		utility.wait(0.1)
	endif
	if pc.wornhaskeyword(kw_dev[5]) ;&& !pc.wornhasKeyword(zlib.zad_deviousankleshackles)
		;r_conflict_device_new(5, 0x00800000, true)
		r_conflict_device(5, true)
		;r_conflict_device(5)
		utility.wait(0.1)
	endif
	if pc.wornhaskeyword(kw_dev[6])
		r_conflict_device(6)
		utility.wait(0.1)
	endif
	if pc.wornhaskeyword(kw_dev[7])
		r_conflict_device(7)
		utility.wait(0.1)
	endif

endfunction

function reset_chain_bonus()

;	zlib.notify("Testing")
	if (!data.hasFillyReward) ;If you've already qualified for a Filly Wear reward, you can't qualify again until after you've claimed you escrow.
		objectreference escrow = escrow_chest.getreference()
		data.check_fillyreward(escrow) ;pc)
	endif

	data.chain_bonus = 1
	data.chain_c = 0;ount.setvalue(0)

endfunction

function remove_costume()

	pc.removespell(arrearsspell)
	pc.removeitem(handbook,999,abSilent = false)
	pc.unequipitem(data.mcm.Thermals,abSilent = true)

	remove_idx(collar_idx)
;	utility.wait(0.1)
	remove_idx(legs_idx)
;	utility.wait(0.1)
	remove_idx(arms_idx)
;	utility.wait(0.1)
	remove_idx(yoke_idx)
;	utility.wait(0.1)
	remove_idx(gloves_idx)
;	utility.wait(0.1)
	remove_idx(boots_idx)
;	utility.wait(0.1)
	if sluts_arrears.getvalue() <= 0 && pc.wornhaskeyword(zlib.zad_deviousHarness)
;		remove_idx(harness_idx)
		zlib.removeDevice(pc, data.harn[0], data.harn[1], zlib.zad_deviousHarness, false, false)
		pc.removeitem(data.harn[0], 999, true)
	endif
	remove_idx(tail_idx)
;	utility.wait(0.1)

endfunction

function scrub_tats()

;		trace("sluts_mcm: emergency toggler selected new value is " + emergency)
;		SetToggleOptionValueST(emergency)
;		SetOptionFlagsST(OPTION_FLAG_DISABLED)

;		zlib.notify("Removing tattoos.")

		registerformodevent("sluts:scrubbed", "on_scrubber_scrubbed")
		trace("sluts_mcm: scrubbing")

		if tatlib == none
			tatlib = (self as quest) as sluts_tats
		endif

		tatlib.scrub(game.getplayer())

endfunction

function use_humilation_chest() ;The player degraded themselves for the terminus's pleasure. Let's reward them by replacing the escrow chest with the humilation chest.

;	zlib.notify("Poop,true")


	objectreference humily = humilation_chest.getreference()
	humily.enable()
	humily.lock(false)

	;HumilChestEffect.Play(humily, akFacingObject = pc)

	chest.removeallitems(humily)
	objectreference escrow = escrow_chest.getreference()
	escrow.removeallitems(humily)
	escrow.lock(255)
	escrow.disable()

	humilated = true

endfunction

;========================================================================================
;========================================================================================

function turn_loose()

;	pay_chest()
	game.enablefasttravel(true)

	objectreference escrow = escrow_chest.getreference()
	escrow.enable()
	escrow.lock(false)
	chest.removeallitems(escrow)

	remove_costume()

	data.customLocation = -1
	data.gold_in_escrow = escrow.getitemcount(gold001)

	;scrub_tats()

endfunction

;
; base_value = 1500, base_pay = 500 for an example
;
; pilf = 0, loss = 0, value = 1500, pay = 500
; pilf = 50, loss = pilf * 1500/100 = 750, value = (base_value - loss) 750, pay = (base_pay - loss) = -250
; pilf = 100, loss = pilf * 1500/100 = 1500, value = (base_value - loss) 0, pay = (base_pay - loss) = -1000
; pilf = 120, loss = pilf * 1500/100 = 1800, value = (base_value - loss) -300, pay = (base_pay - loss) = -1300
;

function calc_wages()

	if (data.chain_c > 1 && pilferage > 1)
		zlib.notify("Due to your poor service your overtime bonus has been revoked.", data.MCM_LargeMessages)
		reset_chain_bonus()
	endif

	float tl = (math.ceiling(pilferage * base_value / 100.0)) * pay_mult
	loss = tl as int

	if data.chain_bonus < 1
		data.chain_bonus = 1
	endif

	int calc_pay
	if (base_pay - loss > 0)
		float find_OT = (base_pay - loss) * data.chain_bonus as float
		calc_pay = find_OT as int
	else
		calc_pay = base_pay - loss
	endif

	actual_pay = calc_pay ;base_pay - loss

	;zlib.notify("Debug Testing: " + actual_pay, true)
endfunction

function pay_chest()

	;Handles both depositing payed gold in your escrow chest as well as removing it if you do a bad run.
	;Also handles adding debt to your arrears if your escrow can't cover the fine.
	if (actual_pay == 0)
		return
	endif

	;Since this script is only and always called at the end of a run, lets make sure the player is scrubbed of any stray manifests that might have been left if skyrim bugged out.
	PC.RemoveItem(ManifestBase,999)

	if (sluts_arrears.getValue() <= 0)
		sluts_arrears.setValue(0)
	endif

	if (actual_pay >= 0)
		if (sluts_arrears.getValue() > 0)
			int docked_pay = actual_pay - sluts_arrears.getValue() as int

			sluts_arrears.setValue(sluts_arrears.getValue() - actual_pay)
			if (sluts_arrears.getValue() <= 0)
				sluts_arrears.setValue(-1)
			endif

			if docked_pay > 0
				chest.additem(Gold001, docked_pay)
				zlib.notify("After finally paying off your arrears the remaining " + docked_pay + " gold was added to your escrow chest.", data.MCM_LargeMessages)
			else
				zlib.notify(actual_pay + " gold has been deducted from your debt, bringing your current arrears to " + sluts_arrears.getValue() as int, data.MCM_LargeMessages)
			endif
		else
			chest.additem(Gold001, actual_pay)
			zlib.notify(actual_pay + " gold has been added to your escrow chest. You now have " + chest.GetItemCount(Gold001) + " gold in storage", data.MCM_LargeMessages)
		endif
	else
		if (chest.GetItemCount(Gold001) + actual_pay) >= 0 && !data.MCM_AlwaysArrears
			chest.removeitem(Gold001, -actual_pay)
			zlib.notify(-actual_pay + " in fines has been removed to your escrow chest. You now have " + chest.GetItemCount(Gold001) + " gold in storage", data.MCM_LargeMessages)
		elseif chest.GetItemCount(Gold001) > 0 && !data.MCM_AlwaysArrears
			int arrears = (chest.GetItemCount(Gold001) + actual_pay)
			sluts_arrears.setvalue(sluts_arrears.getvalue() + -arrears)
			chest.removeitem(Gold001, 9999999)
			zlib.notify("Your " + -actual_pay + " fine is more then you can cover. Your escrow gold has is now 0 and you owe an arrears of " + sluts_arrears.getvalue() as int, data.MCM_LargeMessages)
		else
			sluts_arrears.setvalue(sluts_arrears.getvalue() + -actual_pay)
			zlib.notify("Your debt increases by " + -actual_pay + " . You arrears is now " + sluts_arrears.getvalue() as int, data.MCM_LargeMessages)
		endif
	endif

;	actual_pay = 0

endfunction

function easy_way(actor cad = none)
	if slab == none
		slab = SexLabUtil.GetAPI()
	endif
	humilhorny -= 1
	slab.QuickStart(pc, cad)
	;QuickStart(Actor Actor1, Actor Actor2 = none, Actor Actor3 = none, Actor Actor4 = none, Actor Actor5 = none, Actor Victim = none, string Hook = "", string AnimationTags = "")
endfunction

function hard_way(actor cad)
	if slab == none
		slab = SexLabUtil.GetAPI()
	endif
	slab.QuickStart(pc, cad, victim = pc)
endfunction

function three_way(actor cad)
	actor bounder = cad.getlinkedref() as actor
	if slab == none
		slab = SexLabUtil.GetAPI()
	endif
	slab.QuickStart(pc, cad, bounder, victim = pc)
endfunction

function restore_pony()
	release_scene.start()
endfunction

function restore_pony_actual()
	trace("sluts: clearing tethered")
	tethered = false
	cart_al.clear()
	cart.disable()
	cart.delete()
	cart = none
	data.cart_ref = none
	; slavetats.simple_remove_tattoo(pc, "S.L.U.T.S.", "Livery (CBBE)", last = true, silent = true )
;	calc_wages()
;	pay_chest()
;	pitstopPay = true
;	actual_pay = 0
	tatlib.livery_off()
	pc.setfactionrank(dirty_faction, 0)
	tatlib.set_dirty_level(pc, 0)
	remove_idx(gag_idx)
	remove_costume()
	game.enablefasttravel(true)
	setobjectivecompleted(20)

	data.customLocation = -1
	;scrub_tats()

	pc.GetActorBase().SetEssential(false);.QueueNiNodeUpdate()

	objectreference escrow = escrow_chest.getreference()
	escrow.enable()
	escrow.lock(false)
	chest.removeallitems(escrow)
	setobjectivedisplayed(40)
endfunction

function gear_reclaimed()
	setobjectivecompleted(40)
	setstage(50)
	utility.wait(0.1)
	setobjectivecompleted(50)
	completequest()
	chest.disable(true)
	stop()
	sendModEvent("sluts: gear reclaimed")
	utility.wait(0.1)
;	reset()
endfunction

keyword property standard_mission_kw auto

;/
 * start up the next mission.
 *
 *
 * that means stopping this one
 * resetting the quest
 * firing a mod event to tell the calling quest to shut down
 *
 * the actual chaining part can be left to the caller
 * which will give us more time to terminate properly
 /;
function chain_mission(keyword kw=none)
	if kw == none
		kw = standard_mission_kw
	endif
	bool showed_20 = isobjectivedisplayed(20)
	bool done_20 = isobjectivecompleted(20)

	data.customLocation = -1

;	calc_wages()
;	if (!pitstopPay)
;		pay_chest()
;	endif
;	pitstopPay = false

	;objectreference escrow = data.escrow_chest.getreference()
	objectreference escrow = escrow_chest.getreference()
	escrow.removeallitems(chest)
	escrow.disable()
	objectreference humily = humilation_chest.getreference()
	humily.removeallitems(chest)
	humily.disable()

;
;	if we showed it but didn't complete it, do that now
;
	if showed_20 && !done_20
		setobjectivecompleted(20)
	endif
;
;	make a note of the cart ref so the next quest doesn't double spawn
;
	data.cart_ref = cart

	;For now let's remove the tattoo here.
	scrub_tats()

	completequest()
	stop()
;/
 /	use the keyword to send the mod event
 /
 /	the receiving quest will use the same kw to send the script event
 /	so we can start other kinds of quest by using different keywords.
 /
 /	so we can have a keyword for advertising missions,
 /	another for staying overnight at the stables
 /	others for special cases
 /
 /	the numeric argument is what the player gets payed on successful
 /	completion. Player's share is alway 1/3 so we can work out the
 /	amount owing.
 /
 /	(NB: The idea that a 100% pilfered mission leave the player owing
 /	twice what she would have made. So it might be better to say PC share
 /	is 25%. That way she always gets paid, but after deductions she ends up owing
 /	double. Comes to the same thing as saying 1/3 as a cut of the revenues
 /	but better for the moral high ground.
 /;
	kw.sendmodevent("sluts: mission chain event", numarg=500)
	reset()
endfunction

function set_interloc(actor a)
	interlocutor.forcerefto(a)
endfunction

function set_interloc_r()
	interlocutor.forcerefto(terminus.getreference())
endfunction

function set_interloc_d()
	interlocutor.forcerefto(dispatch.getreference())
endfunction


function do_advance()
;	objectreference escrow = data.escrow_chest.getreference()
	objectreference escrow = escrow_chest.getreference()
	escrow.removeitem(gold001, 20, pc)
	data.advance_count += 1
	data.gold_in_escrow -= 20
endfunction

function pay_in_kind(actor mrpayed)
	;messagebox("S.L.U.T.S.: Payment-in-kind scene to come - sorry")
	;sexwithplayer(akspeaker, consensual = true, stages = 1, preferredtag = "Oral", nostrip = false)
;	sexwithplayer(mrpayed, consensual = true, stages = 1, randomanim = true)
	slab.QuickStart(pc, mrpayed, AnimationTags = "Doggy")
	;QuickStart(Actor Actor1, Actor Actor2 = none, Actor Actor3 = none, Actor Actor4 = none, Actor Actor5 = none, Actor Victim = none, string Hook = "", string AnimationTags = "")
endfunction

function fondle(Message msg=none, float increment=5.0)
	if msg == none
		msg = msg_stroke_flank
	endif
	msg.show()
	int eid = ModEvent.Create("slaUpdateExposure")
	ModEvent.PushForm(eid, pc)
	ModEvent.PushFloat(eid, increment)
	ModEvent.Send(eid)
endfunction

function make_friends()
	pc.addtofaction(PredatorFriendFaction)
	pc.addtofaction(CreatureFriendFaction)
	pc.addtofaction(BanditFriendFaction)
endfunction

function break_friends()
	pc.removefromfaction(PredatorFriendFaction)
	pc.removefromfaction(CreatureFriendFaction)
	pc.removefromfaction(BanditFriendFaction)
endfunction

function do_tether(objectreference cref, actor slut)
	trace("sluts: activating tether")
	cref.TetherToHorse(slut)
	trace("sluts: setting tethered to true")
	tethered = true
	YouUntethered = false
	Game.EnableFastTravel(false)
endfunction

function release_tether(actor slut)

;	cart.disable()
	cart.reset(pc) ;delete()
	cart.ApplyHavokImpulse(0.0, 0.0, 0.0, 0.0)

	utility.wait(0.2)

;	if data.cart_ref == none
;		cart = pc.PlaceAtMe(cart_form)
;	else
;		cart = data.cart_ref
;	endif

	force_tether()

	dlog_q.cart.forcerefto(cart)
	cart_al.forcerefto(cart)

	cart.disable()
	utility.wait(0.2)
	cart.enable()

	utility.wait(0.2)
	;cart.getreference().QueueNiNodeUpdate()

	trace("sluts: setting tethered to false")
	tethered = 0
	Game.EnableFastTravel(true)
endfunction

;
; this may well break stuff
;
function toggle_handbrake()
	if !cart
		handbrake = false
		return
	endif

	handbrake = !handbrake
	trace("sluts: handbrake set to " + handbrake)
	if handbrake
		cart.setmotiontype(4)	; keyframed
	else
		cart.setmotiontype(1)	; dynamic
	endif
endfunction

Potion[] Property treats  Auto
