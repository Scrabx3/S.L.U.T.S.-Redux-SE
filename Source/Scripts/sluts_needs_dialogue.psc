;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname sluts_needs_dialogue Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
sluts_dlog_sc q = getowningquest() as sluts_dlog_sc

Game.DisablePlayerControls()

;q.q.pc.additem(drink,abSilent = true)
;q.q.pc.equipitem(drink)

;int x = utility.randomint(0,3)
;q.q.pc.additem(q.q.treats[x],abSilent = true)
;q.q.pc.equipitem(q.q.treats[x])
;x = utility.randomint(0,3)
;q.q.pc.additem(q.q.treats[x],abSilent = true)
;q.q.pc.equipitem(q.q.treats[x])

;utility.wait(4)

ObjectReference PH = Game.FindClosestReferenceOfTypeFromRef(_PH, q.q.pc, 2000)
PH.activate(q.q.pc)

;utility.wait(4)

;q.q.pc.additem(drink,abSilent = true)
;q.q.pc.equipitem(drink)

;x = utility.randomint(0,3)
;q.q.pc.additem(q.q.treats[x],abSilent = true)
;q.q.pc.equipitem(q.q.treats[x])
;x = utility.randomint(0,3)
;q.q.pc.additem(q.q.treats[x],abSilent = true)
;q.q.pc.equipitem(q.q.treats[x])

Game.EnablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Furniture Property _PH  Auto