;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SLUTSH__0802D8FA Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
sluts_dlog_sc q = getowningquest() as sluts_dlog_sc

int x = utility.randomInt(1,7)
float debitrate = x * 0.05 as float
int debit = (q.q.actual_pay * debitrate) as int

objectreference escrow = q.q.escrow_chest.getreference()
escrow.removeitem(q.q.gold001, debit)
q.q.zlib.notify((debitrate * 100) as int + "% has been debited from your last payout, leaving your escrow gold at " + escrow.getitemcount(q.q.gold001), true)

q.q.humilation_scene.start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
