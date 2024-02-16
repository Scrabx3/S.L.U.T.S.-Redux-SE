Scriptname sluts_ss_bridge_tester extends ObjectReference  

sluts_ss_bridge_script property ss auto

imagespacemodifier property lightfade auto

event onactivate(objectreference obj)
	debug.trace("sending mod event")
	sendmodevent("S.L.U.T.S. Enslavement")
	; SLUTS_Slavery()
endevent 

function SLUTS_Slavery()                                                                ;S.L.U.T.S.
	int handle = ModEvent.Create("S.L.U.T.S. Enslavement")
	if(handle)
		ModEvent.Send(handle)
	endif

	LightFade.ApplyCrossFade(3)
	;utility.wait(3)
	LightFade.Remove()
	utility.wait(10)
endfunction

