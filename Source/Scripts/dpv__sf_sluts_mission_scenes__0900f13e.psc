;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname dpv__SF_sluts_mission_scenes__0900F13E Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
actor r = recip.getreference() as actor

debug.sendanimationevent(r, "Arrok_StandingForeplay_A1_S1")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SendModEvent("dhlp-Resume")

game.setplayeraidriven(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SendModEvent("dhlp-Suspend")

game.SetPlayerAIDriven(true)

sluts_mission_scenes_sc q

q = getowningquest() as sluts_mission_scenes_sc

q.check_tack()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
actor r = recip.getreference() as actor

debug.sendanimationevent(r, "IdleForceDefaultState")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property recip  Auto  
