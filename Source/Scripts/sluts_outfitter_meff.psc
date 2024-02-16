Scriptname sluts_outfitter_meff extends activemagiceffect  

Activator Property ObjectCart Auto
objectreference property chest auto
outfit property nekkidity auto

zadlibs property zlib auto
zadxlibs property xlib auto

Event OnEffectStart(Actor target, Actor caster)
	actor pc = game.getplayer()

	debug.trace("sluts: sluts_outfitter_meff and shouldn't be")
	return
;/
	;; why are you wearing all those clothes?
	if target != pc
		target.setoutfit(nekkidity)
	endif
	target.removeallitems(chest)

	;slavetats.simple_add_tattoo(target, "S.L.U.T.S.", "Livery", last = true, silent = true )
	tats.livery_on()

	;; place the cart in the world and give it a moment to settle.
	ObjectReference cart = target.PlaceAtMe(self.ObjectCart)

	;; actually, while that's settling let's throw in some pony boots
	xlib.ManipulateDevice(target, xlib.WTEbonitePonyBoots, true, false)
	xlib.ManipulateDevice(target, xlib.cuffsWTEboniteArms, true, false)
	xlib.ManipulateDevice(target, xlib.cuffsWTEboniteCollar, true, false)

	Utility.Wait(0.5)

	;; attach it to the towing actor. for this to work the skeleton must have
	;; the HorseSpine2 bone in it at roughly horse height. it does not need to
	;; have any animations or constraints, and in fact may be better if it is
	;; completely devoid of features.
	cart.TetherToHorse(target)

	Return
/;
EndEvent


