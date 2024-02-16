;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname dpv__TIF__0901B9B7 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
GetOwningQuest().SetStage(10)

sluts_ss_bridge_script q = getowningquest() as sluts_ss_bridge_script
if q.kicker.data.getstage() == 40
	objectreference escrow = q.kicker.mission.escrow_chest.getreference()
	escrow.removeallitems(q.kicker.mission.chest)
	q.kicker.mission.chain_mission()
else
	q.kicker.start_rq(akspeaker, true, -1)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
