;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname sluts_needs_dialogue_food Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
sluts_dlog_sc q = getowningquest() as sluts_dlog_sc

;q.q.pc.additem(drink,abSilent = true)
;q.q.pc.equipitem(drink)

utility.wait(0.1)
int x = utility.randomint(0,3)
q.q.pc.additem(q.q.treats[x],abSilent = true)
q.q.pc.equipitem(q.q.treats[x])
utility.wait(0.1)
x = utility.randomint(0,3)
q.q.pc.additem(q.q.treats[x],abSilent = true)
q.q.pc.equipitem(q.q.treats[x])
utility.wait(0.1)
x = utility.randomint(0,3)
q.q.pc.additem(q.q.treats[x],abSilent = true)
q.q.pc.equipitem(q.q.treats[x])
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

;Potion Property drink  Auto  
