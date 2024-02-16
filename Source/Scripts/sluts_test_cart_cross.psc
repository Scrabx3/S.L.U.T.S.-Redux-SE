Scriptname sluts_test_cart_cross extends ObjectReference  

ObjectReference Property Cart  Auto  

ObjectReference Property marker Auto  

Actor Property npc  Auto  

event onactivate(ObjectReference  obj)
	npc.moveto(marker, afXOffset=-5.0, afyOffset=-6.0)
	npc.setvehicle(cart)
	debug.sendanimationevent(npc, "ZaZAPFXCII01B")
endevent
