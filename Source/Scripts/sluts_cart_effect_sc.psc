Scriptname sluts_cart_effect_sc extends activemagiceffect  

outfit property nekkidity auto

zadlibs property zlib auto
zadxlibs property xlib auto

sluts_mission_scenes_sc property slut_lib auto

Event OnEffectStart(Actor target, Actor caster)
	actor pc = game.getplayer()

	debug.trace("sluts: sluts_cart_effect_sc - placing wagon")
	if target != pc
		target.setoutfit(nekkidity)
	endif

	slut_lib.place_wagon(target)
EndEvent

