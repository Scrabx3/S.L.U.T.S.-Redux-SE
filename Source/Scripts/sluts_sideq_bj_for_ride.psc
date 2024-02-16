Scriptname sluts_sideq_bj_for_ride extends Quest   conditional

import debug

bool property timed_out auto conditional

Event OnStoryScript(Keyword kw, Location loc, ObjectReference ref1, ObjectReference ref2, int i1, int i2)
	actor a = ref1 as actor

	messagebox("bj requested for " + a.getdisplayname())
endevent
