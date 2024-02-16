;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SLUTSZ__08028737 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Faction GFac = akSpeaker.GetCrimeFaction()
int cGV = GFac.GetCrimeGoldViolent()
int cGN = GFac.GetCrimeGoldNonviolent()

;Move you fine gold value to a global, then clear your debt.
slutsCrimeG.SetValue(cGV + cGN)

GFac.ModCrimeGold(-cGN, abViolent = False)
GFac.ModCrimeGold(-cGV, abViolent = true)
utility.wait(0.1)

float FaceAngle = 90.0 ;Used to rotate the player to their rehabber. The setface command was being an asshole. Setting this variable now so we can tweek it for a few drivers.

;rift, soli, white, wind, mark
actor Rehabber = white ;Make Whiterun Carriage driver the default.
ObjectReference DaSpot = whiteX ;Send to the Whiterun carriage driver by default

;Otherwise let's figure out which hold you pissed off and send you to their driver.
if GFac == f[5]
	Rehabber = mark
	DaSpot = markX
elseif GFac == f[1] || GFac == f[6]
	Rehabber = rift
	DaSpot = riftX
elseif GFac == f[2]
	Rehabber = soli
	DaSpot = soliX
	FaceAngle = 270.0
elseif GFac == f[0]
	Rehabber = wind
	DaSpot = windX
elseif GFac == f[8] ;falk
	Rehabber = falk
	DaSpot = falkX
elseif GFac == f[7] ;winter
	Rehabber = wint
	DaSpot = wintX
elseif GFac == f[3] ;mort
	Rehabber = mort
	DaSpot = mortX
elseif GFac == f[4]
	Rehabber = dawn
	DaSpot = dawnX
else
	FaceAngle = 270.0 ;For Whiterun
endif

;PC.MoveTo(sendTo, 150.0 * Math.Sin(sendTo.GetAngleZ() + 90.0), 150.0 * Math.Cos(sendTo.GetAngleZ()), SendTo.GetHeight() - 30.0, false)
PC.MoveTo(DaSpot)
utility.wait(0.7)
PC.SetAngle(PC.GetAngleX(), PC.GetAngleY(), Rehabber.GetAngleZ() + FaceAngle)
;PC.SetLookAt(Rehabber)
game.enableplayercontrols()
;sendTo.say(RehabTopic)
Rehabber.activate(PC)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
game.disablePlayerControls()

sluts_dlog_sc q = getowningquest() as sluts_dlog_sc

;Remove any gags for now, due to dialog conflicts they create with the rehab agent.
if pc.wornhaskeyword(q.q.kw_dev[0])
	q.q.r_conflict_device(0)
	utility.wait(0.1)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property Soli Auto  
Actor Property White Auto  
Actor Property Wind Auto  
Actor Property Mark Auto  
Actor Property Rift Auto  
Actor Property Dawn  Auto  
Actor Property Falk  Auto  
Actor Property Mort  Auto  
Actor Property Wint  Auto  

Actor Property pc  Auto  

ObjectReference Property SoliX  Auto  
ObjectReference Property WhiteX  Auto  
ObjectReference Property WindX  Auto  
ObjectReference Property MarkX  Auto  
ObjectReference Property RiftX  Auto  
ObjectReference Property DawnX  Auto  
ObjectReference Property FalkX  Auto  
ObjectReference Property MortX  Auto  
ObjectReference Property WintX  Auto  

GlobalVariable Property slutsCrimeG  Auto  

Topic Property RehabTopic  Auto  
Faction[] Property f Auto

MiscObject Property Goldy  Auto  
