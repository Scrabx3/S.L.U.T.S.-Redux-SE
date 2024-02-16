Scriptname sluts_ss_bridge_script extends Quest  

import debug

referencealias property pc auto
referencealias property carter auto
referencealias property pc_mark auto
referencealias property carter_mark auto

keyword property sluts_scene_driver_bj_mark auto
keyword property sluts_scene_pc_bj_mark auto
keyword property sluts_scene_root_mark auto

scene property ss_bridge auto

imagespacemodifier property dark_imod auto
imagespacemodifier property light_imod auto

sluts_kicker_sc property kicker auto
sluts_mcm property mcm auto

formlist property drivers auto

actor property d0 auto
actor property d1 auto
actor property d2 auto
actor property d3 auto
actor property d4 auto

;int property boughtAsASlave auto conditional ;This is set to change some of the dialogue conditions if your first S.L.U.T.S. mission was as a slave

actor function random_driver_stupid()
	trace("sluts bridge: driver formlist = " + drivers)
	int len = drivers.getsize()
	trace("sluts bridge: driver formlist size = " + len)
	int lim = len - 1
	trace("sluts bridge: driver formlist index limit = " + lim)
	int idx = utility.randomint(0, lim)
	trace("sluts bridge: driver formlist index = " + idx)
	form f = drivers.getat(idx) as actor
	trace("sluts bridge: driver formlist selected form = " + f)
	actor a = f as actor
	if a == none
		trace("sluts bridge: error - selected form is not an actor")
	endif
	return a
endfunction

actor function random_driver()
	int idx = utility.randomint(0, 5)

	if idx == 0
		return d0
	endif

	if idx == 1
		return d1
	endif

	if idx == 2
		return d2
	endif

	if idx == 3
		return d3
	endif

	return d4

endfunction

function stage_00()
	trace("sluts bridge: stage 00")
	actor pc_ref = pc.getreference() as actor
	actor carter_ref = d1 ;random_driver()
	trace("sluts bridge: carter ref = "  + carter_ref.getdisplayname())
	carter.forcerefto(carter_ref)

	objectreference root_marker = carter_ref.getlinkedref(sluts_scene_root_mark)

	objectreference carter_mark_ref = root_marker.getlinkedref(sluts_scene_driver_bj_mark)
	carter_mark.forcerefto(carter_mark_ref)
	trace("sluts bridge: carter mark = "  + carter_mark_ref)

	objectreference pc_mark_ref = root_marker.getlinkedref(sluts_scene_pc_bj_mark)
	pc_mark.forcerefto(pc_mark_ref)
	trace("sluts bridge: pc mark = "  + pc_mark_ref)

	trace("sluts bridge: starting scene")
	((self as quest) as sluts_scene_starter).start_scene(ss_bridge)
endfunction

function lights_out(float secs=1.0)
	;dark_imod.applyCrossFade(secs)
endfunction

function clear_imod(float secs=1.0)
	ImageSpaceModifier.removeCrossFade(secs)
endfunction

function actors_to_marks()
	actor pc_ref = pc.getreference() as actor
	actor driver_ref = carter.getreference() as actor

	objectreference pc_mark_ref = pc_mark.getreference()
	objectreference driver_mark_ref = carter_mark.getreference()


	pc_ref.moveto(pc_mark_ref)
	driver_ref.moveto(driver_mark_ref)

;	boughtAsASlave = 1
	messagebox("With the transaction on the ownership of your very life completed you are escorted from the auction house and outside the gates of Riften. Your escort leaves you with the local carriage driver. You expect to be loaded up and shipped off to some living hell, but instead the driver begins speaking to you in a joval tone...")
	assign_mcmdebt()
endfunction

globalvariable property sluts_arrears_amount auto

function assign_mcmdebt()
	
;	actor pc_ref = pc.getreference() as actor
;	if (pc_ref.GetActorBase().GetSex() == 0)
;		return
;	endif

	int myDebt

	int Rand = utility.randomint(0, 29)
	if Rand > 19
		myDebt = mcm.SS_debtC
	elseif Rand < 10
		myDebt = mcm.SS_debtA
	else
		myDebt = mcm.SS_debtB
	endif

	int tmp = sluts_arrears_amount.getvalueint()
	sluts_arrears_amount.setvalueint(tmp + myDebt)

;	notification("You are indentured to work off an arrears of " + sluts_arrears_amount.getvalueint() + " gold for S.L.U.T.S.")
endfunction

function call_kicker()
	int tmout = 0

;	actor pc_ref = pc.getreference() as actor
;	if (pc_ref.GetActorBase().GetSex() != 0)
		kicker.setstage(30)
;	endif

;	int tmp = sluts_arrears_amount.getvalueint()
;	sluts_arrears_amount.setvalueint(tmp + 5000)

	while !kicker.isRunning()
		tmout += 1
		if tmout > 30
			trace("can't start sluts kicker quest")
			return
		endif
		utility.wait(0.1)
	endwhile
	actor driver_ref = carter.getreference() as actor
	kicker.start_rq(driver_ref, false)
endfunction

