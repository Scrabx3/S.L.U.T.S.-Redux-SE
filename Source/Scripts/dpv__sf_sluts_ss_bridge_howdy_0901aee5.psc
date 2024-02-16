;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname dpv__SF_sluts_ss_bridge_howdy_0901AEE5 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
sluts_ss_bridge_script q

q = getowningquest() as sluts_ss_bridge_script

q.lights_out(3.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
sluts_ss_bridge_script q

q = getowningquest() as sluts_ss_bridge_script

q.actors_to_marks()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
debug.trace("sluts bridge - FG phase starts")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
sluts_ss_bridge_script q

q = getowningquest() as sluts_ss_bridge_script

q.clear_imod(5.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
game.SetPlayerAIDriven(false)

sluts_ss_bridge_script q
q = getowningquest() as sluts_ss_bridge_script
q.call_kicker()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
game.setplayeraidriven(true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
