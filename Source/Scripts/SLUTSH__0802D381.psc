;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SLUTSH__0802D381 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
sluts_mission_scenes_sc q = getowningquest() as sluts_mission_scenes_sc

keyword kw = q.zlib.zad_deviousboots

if Game.GetPlayer().wornhaskeyword(kw)
	q.data.r_conflict_device(kw)
endif

utility.wait(10)

int x = utility.randomint(0,1)

q.zlib.equipDevice(q.pc, shoes_i[x], shoes_s[x], kw, false, false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Armor[] Property shoes_i  Auto  

Armor[] Property shoes_s  Auto  
