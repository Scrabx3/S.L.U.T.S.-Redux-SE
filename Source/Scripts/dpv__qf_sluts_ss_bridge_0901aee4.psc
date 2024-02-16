;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname dpv__QF_sluts_ss_bridge_0901AEE4 Extends Quest Hidden

;BEGIN ALIAS PROPERTY carter_mark
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_carter_mark Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY carter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_carter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY pc
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_pc Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY pc_mark
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_pc_mark Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE sluts_ss_bridge_script
Quest __temp = self as Quest
sluts_ss_bridge_script kmyQuest = __temp as sluts_ss_bridge_script
;END AUTOCAST
;BEGIN CODE
kmyquest.stage_00()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
