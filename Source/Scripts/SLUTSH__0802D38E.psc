;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SLUTSH__0802D38E Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
sluts_mission_scenes_sc q = getowningquest() as sluts_mission_scenes_sc

keyword kw = q.zlib.zad_devioussuit

if Game.GetPlayer().wornhaskeyword(kw)
	q.data.r_conflict_device(kw)
endif

utility.wait(10)

int x = utility.randomint(0,3)

q.zlib.equipDevice(q.pc, dress_i[x], dress_s[x], kw, false, false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Armor[] Property dress_i  Auto  

Armor[] Property dress_s  Auto  
