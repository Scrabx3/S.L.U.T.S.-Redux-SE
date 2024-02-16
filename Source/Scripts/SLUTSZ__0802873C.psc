;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname SLUTSZ__0802873C Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
sluts_dlog_sc q = getowningquest() as sluts_dlog_sc

;Pit stop is over, better move the escrow contents back to the hidden chest.
objectreference escrow = q.q.escrow_chest.getreference()
escrow.enable()
escrow.removeallitems(q.q.chest)

;Give the player control back when the rehabber is done talking.
game.enableplayercontrols()

float CG = slutsCrimeG.GetValue()
slutsCrimeG.SetValue(0)

;utility.wait(0.5)
slutsArrear.SetValue(CG * mcm.true_rehab_rate)
q.q.zlib.notify("S.L.U.T.S. Pony Rehabilitation Program has determined that your " + CG as int + " fine calculates into a " + slutsArrear.GetValue() as int + " Arrear.", true)

;If you haven't joined SLUTS yets, force start the "joined" quest.
if qq.GetStage() < 30
	qq.SetStage(30)
endif

;If you were in the middle of recovering your gear, do a chain mission
if qms.getstage() == 40
	q.q.chain_mission()
else ;Otherwise start a fresh mission
	qq.start_rq(akspeaker, true, -1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;The player could run away while this dialogue
;was finishing. While the effect still worked it
;would be a bit odd having them run to the
;other side of town only to stop and obediently
;walk back :P
game.disablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property slutsCrimeG  Auto  
GlobalVariable Property slutsArrear  Auto  
sluts_kicker_sc Property qq Auto
sluts_mcm Property mcm Auto
Quest Property qms Auto
