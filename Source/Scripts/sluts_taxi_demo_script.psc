Scriptname sluts_taxi_demo_script extends activemagiceffect  

static property marker auto
actor property pc auto
actorbase property naz auto
Activator Property cart Auto


Event OnEffectStart(Actor target, Actor caster)
	objectreference xm = pc.placeatme(marker)

	xm.MoveTo(pc, Math.Sin(pc.GetAngleZ()) * 500, Math.Cos(pc.GetAngleZ()) * 500)


	objectreference cref = xm.placeatme(cart)

	utility.wait(2.5)

	actor nazzer = cref.placeactoratme(naz)
	utility.wait(0.2)
	cref.activate(nazzer)

endEvent 
