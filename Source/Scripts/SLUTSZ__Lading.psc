;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SLUTSZ__Lading Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
sluts_dlog_sc q = getowningquest() as sluts_dlog_sc
q.q.start_manifest_scene()

if q.q.pilferage <= 1

	;;Let's check for Spontaneous Failure
	int clumsy = Utility.RandomInt(1,100)
	if (clumsy < mcm.sponfail)
		if mcm.sponfailrand
			;Deliberately set the chance above the 120 maximum. Overwise max would only have a 1 in 120 chance of happening.
			q.q.pilferage = (Utility.RandomInt(55,160))
			if q.q.pilferage > 120
				q.q.pilferage = 120
			endif
		else
			q.q.pilferage = 120
		endif

		string X = ""
		if q.q.pilferage < 100
			X = "some of your cargo appears to be missing"
		elseif q.q.pilferage < 120
			X = "much of your cargo is missing"
		else
			X = "your cargo is completely gone"
		endif
		q.q.zlib.notify("In a moment of absent mindedness you glance behind you, only to notice to your horror that " + X + "! You have no idea what happened and can only shudder in a cold sweat knowing you will still have to answer for it...",true)
	endif
endif

q.q.calc_wages()

q.q.HumilPick = utility.randomint(0,7)
;q.q.HumilPick = 4

;Was used for debugging
;q.q.zlib.notify("Debug: Chain Count is at " + q.q.data.chain_count.getvalue())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

sluts_mcm Property MCM  Auto  
