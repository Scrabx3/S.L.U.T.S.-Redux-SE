Scriptname sluts_adtattoo extends activemagiceffect  

;zadlibs Property libs  Auto  
keyword[] property kw_clothes auto
armor[] property strips auto
sluts_mission_scenes_sc property q auto

; Yeah, this effect was kind of hacked in. I know :P
function checkClothes(actor a)
	if (q.pc.wornhaskeyword(kw_clothes[0]) && !q.pc.wornhaskeyword(kw_clothes[3])) || q.pc.wornhaskeyword(kw_clothes[1]) || q.pc.wornhaskeyword(kw_clothes[2])
		;q.strip_slut()
		q.pc.equipitem(strips[0],abSilent = true)
		q.pc.removeitem(strips[0],999,abSilent = true)
		q.pc.equipitem(strips[1],abSilent = true)
		q.pc.removeitem(strips[1],999,abSilent = true)
		q.pc.equipitem(strips[2],abSilent = true)
		q.pc.removeitem(strips[2],999,abSilent = true)
		Debug.Notification("You're not allowed to wear clothing right now.")	
;		RegisterForSleep() ;unrelated debug stuff
	endif
EndFunction


;Event OnSleepStart(float afSleepStartTime, float afDesiredSleepEndTime)
;	Debug.Trace("Player went to sleep at: " + Utility.GameTimeToString(afSleepStartTime))
;	Debug.Trace("Player wants to wake up at: " + Utility.GameTimeToString(afDesiredSleepEndTime))
;endEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if akTarget != q.pc
		return
	EndIf
	checkClothes(q.pc)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	q.scrub_tats()
	Debug.Notification("Your time as a walking billboard has passed.")	
endEvent

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	if GetTargetActor() != q.pc
		return
	EndIf
	checkClothes(q.pc)
EndEvent