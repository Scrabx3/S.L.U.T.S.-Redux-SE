Scriptname sluts_tat_comparator extends ObjectReference  

actor[] property girls auto

event onload()
	debug.notification("tattifier is working")
	int i = 0
	int len = girls.length
	string tat
	actor a
	int level

	while i < len

		a = girls[i]

		level = i+1

		slavetats.simple_add_tattoo(a, "S.L.U.T.S.", "Livery (CBBE)", last = false, silent = true )	
		slavetats.simple_add_tattoo(a, "Dirty S.L.U.T.S.", "Dirty Head " + level, last = false, silent = true )
		slavetats.simple_add_tattoo(a, "Dirty S.L.U.T.S.", "Dirt " + level, last = true, silent = true )
		i += 1
	endwhile
	gotostate("done")
	debug.notification("tattifier is done")
endevent

state done
	event onload()
	endevent
endstate
