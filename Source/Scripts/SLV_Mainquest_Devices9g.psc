;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SLV_Mainquest_Devices9g Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
myScripts.SLV_DeviousUnEquip(true,true,true,true,true,true,true,true,true,true,true,true,true,true,true)

;myScripts.SLV_equipDDChains(Game.GetPlayer())
myScripts.specialDevices.SLV_equipPrisonerChains01(Game.GetPlayer())

myScripts.SLV_Play2Sex(Game.GetPlayer(),akSpeaker, "Sex", true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
SLV_Utilities Property myScripts auto