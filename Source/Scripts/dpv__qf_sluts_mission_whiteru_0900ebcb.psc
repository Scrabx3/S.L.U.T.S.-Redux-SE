;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname dpv__QF_sluts_mission_whiteru_0900EBCB Extends Quest Hidden

;BEGIN ALIAS PROPERTY pc_wait_spawn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_pc_wait_spawn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY start_hold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_start_hold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY carter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_carter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dest_hold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_dest_hold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dest_hold_condition_filled
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_dest_hold_condition_filled Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY cart_spawn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_cart_spawn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY carter_cast_point
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_carter_cast_point Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY pc
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_pc Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY recipient
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_recipient Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY manifest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_manifest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY escrow_chest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_escrow_chest Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE sluts_standard_mission
Quest __temp = self as Quest
sluts_standard_mission kmyQuest = __temp as sluts_standard_mission
;END AUTOCAST
;BEGIN CODE
kmyquest.setup_scene()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
