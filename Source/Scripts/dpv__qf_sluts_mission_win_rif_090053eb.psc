;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname dpv__QF_sluts_mission_win_rif_090053EB Extends Quest Hidden

;BEGIN ALIAS PROPERTY recipient
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_recipient Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY manifest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_manifest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY carter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_carter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY start_hold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_start_hold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dest_hold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_dest_hold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY pc
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_pc Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE sluts_standard_mission
Quest __temp = self as Quest
sluts_standard_mission kmyQuest = __temp as sluts_standard_mission
;END AUTOCAST
;BEGIN CODE
debug.trace("stluts standard - start stage - 10")

kmyquest.setup_scene()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
