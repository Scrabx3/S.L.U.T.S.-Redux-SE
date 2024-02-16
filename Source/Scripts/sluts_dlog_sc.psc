Scriptname sluts_dlog_sc extends Quest  

referenceAlias property dispatch auto
referenceAlias property terminus auto
referenceAlias property cart  auto  

sluts_mission_scenes_sc property q auto

function update_aliases(actor d=none, actor t=none, objectreference c=none)

	if d != none
		dispatch.forcerefto(d)
	endif
	if t != none
		terminus.forcerefto(t)
	endif
	if c != none
		cart.forcerefto(c)
	endif
endfunction

