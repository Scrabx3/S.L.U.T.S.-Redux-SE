;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SLUTSZ_SS_00 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;messagebox("You are indentered to work off an arrears of " + sluts_arrears_amount.getvalueint() + " gold for S.L.U.T.S.")
;messagebox("Nuh")
sluts_ss_bridge_script q = getowningquest() as sluts_ss_bridge_script

q.kicker.mission.zlib.notify("You are indentered to work off an arrears of " + q.sluts_arrears_amount.getvalueint() + " gold for S.L.U.T.S.",true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
