;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname dpv__SF_sluts_standard_missio_09003E1D Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SendModEvent("dhlp-Suspend")

game.SetPlayerAIDriven(true)
sluts_mission_scenes_sc q = getowningquest() as sluts_mission_scenes_sc

q.needs_bridle_flag = true
q.make_friends()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
sluts_mission_scenes_sc q

q = getowningquest() as sluts_mission_scenes_sc

debug.trace("sluts_mission: setup phase 4 ends: needs_bridle_flag = " +  q.needs_bridle_flag)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
sluts_mission_scenes_sc q

q = getowningquest() as sluts_mission_scenes_sc

q.xfer_manifest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
SendModEvent("dhlp-Resume")

sluts_mission_scenes_sc q = getowningquest() as sluts_mission_scenes_sc
q.break_friends()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
sluts_mission_scenes_sc q

q = getowningquest() as sluts_mission_scenes_sc

debug.trace("sluts_mission: setup phase 5: needs_bridle_flag = " +  q.needs_bridle_flag)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
game.setplayeraidriven(false)
getowningquest().setObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
