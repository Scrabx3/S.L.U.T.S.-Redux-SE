Scriptname sluts_cartless_meff extends activemagiceffect  


Activator Property ObjectCart Auto
objectreference property chest auto
outfit property nekkidity auto

zadlibs property zlib auto
zadxlibs property xlib auto
sluts_tats  property tats auto

Event OnEffectStart(Actor target, Actor caster)
	actor pc = game.getplayer()

	;; why are you wearing all those clothes?
	if target != pc
		target.setoutfit(nekkidity)
	endif
	target.removeallitems(chest)

	tats.livery_on()
	;slavetats.simple_add_tattoo(target, "S.L.U.T.S.", "Livery", last = true, silent = true )

	xlib.ManipulateDevice(target, xlib.WTErestrictiveCorset, true, false)
	xlib.ManipulateDevice(target, xlib.WTErestrictiveCollar, true, false)
	xlib.ManipulateDevice(target, xlib.WTErestrictiveGloves, true, false)
	xlib.ManipulateDevice(target, xlib.WTErestrictiveBoots, true, false)

	Utility.Wait(0.5)
EndEvent

