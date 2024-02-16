;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SLUTSZ__0900BAE8 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
sluts_dlog_sc q = getowningquest() as sluts_dlog_sc

q.q.cart.moveto(q.q.pc)
q.q.cart.disable()

q.q.reset_chain_bonus()
q.q.actual_pay = -1500
q.q.pay_chest()

q.q.chain_mission()
;q.q.tack_check_scene.start()
utility.wait(5)
q.q.cart.moveto(q.q.pc)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
