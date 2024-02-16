;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SLUTSZ__080084B2 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
sluts_dlog_sc q = getowningquest() as sluts_dlog_sc

;q.q.r_conflict_device(8)
;utility.wait(0.1) ;Add a slight delay between each item so Skyrim's clunky scripting system can keep up. Otherwise it sometimes skips pieces when conflicting parts are detected.
;q.q.equip_idx(q.q.harness_idx)

q.q.zlib.equipDevice(q.q.pc, q.q.data.harn[0], q.q.data.harn[1], q.q.zlib.zad_DeviousHarness, false, false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

;Armor[] Property Harn  Auto  
