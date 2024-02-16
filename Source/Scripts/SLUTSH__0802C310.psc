;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SLUTSH__0802C310 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
sluts_dlog_sc q = getowningquest() as sluts_dlog_sc

q.q.fondle()
utility.wait(1)

;q.q.slab.QuickStart(q.q.pc, akSpeaker, AnimationTags = "Doggy")
q.q.humilation_scene.start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
