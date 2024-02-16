;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname dpv__QF_sluts_standard_missio_02002DED Extends Quest Hidden

;BEGIN ALIAS PROPERTY dest_hold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_dest_hold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY escrow_chest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_escrow_chest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY recipient
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_recipient Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY root_marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_root_marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY start_hold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_start_hold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY manifest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_manifest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY pc_spawn_point
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_pc_spawn_point Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY humilation_chest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_humilation_chest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY recipient_mark
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_recipient_mark Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY interlocutor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_interlocutor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY cart_spawn_point
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_cart_spawn_point Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY carter_spawn_point
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_carter_spawn_point Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY carter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_carter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Cart
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Cart Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY pc
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_pc Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dest_hold_capital
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_dest_hold_capital Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE sluts_mission_scenes_sc
Quest __temp = self as Quest
sluts_mission_scenes_sc kmyQuest = __temp as sluts_mission_scenes_sc
;END AUTOCAST
;BEGIN CODE
;kmyquest.UpdateCurrentInstanceGlobal(sluts_basepay)
kmyquest.stage_20()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
debug.trace("stluts standard - start stage - 10")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;
; on the way back to collect her gear
;
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
