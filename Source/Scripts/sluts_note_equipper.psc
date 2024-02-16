Scriptname sluts_note_equipper extends ObjectReference  

objectreference property note auto

event onactivate(objectreference obj)
	actor pc = obj as actor

	debug.messagebox("equipping")

	utility.wait(0.5)

	pc.equipitem(note)
endevent