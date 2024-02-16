;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname dpv__SF_sluts_mission_scenes__09006433 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
game.SetPlayerAIDriven(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SendModEvent("dhlp-Resume")

game.setplayeraidriven(false)
sluts_mission_scenes_sc q 

q = getowningquest() as sluts_mission_scenes_sc

;Your wages are now calculated just as the cart driver checks your cargo, to make the arrears process cleaner.
;q.calc_wages()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
