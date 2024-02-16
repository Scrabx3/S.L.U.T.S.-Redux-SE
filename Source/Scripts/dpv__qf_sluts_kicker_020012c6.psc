;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname dpv__QF_sluts_kicker_020012C6 Extends Quest Hidden

;BEGIN ALIAS PROPERTY advert
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_advert Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY chest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_chest Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; player has joined faction, talk to driver to kick off radiant haulage quest
SetObjectiveCompleted(20)
CompleteQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE sluts_kicker_sc
Quest __temp = self as Quest
sluts_kicker_sc kmyQuest = __temp as sluts_kicker_sc
;END AUTOCAST
;BEGIN CODE
kmyquest.stage_00()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; no script - enable dialogue with barfolk, stewards and drivers
; moves on when player reads advert
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; player has read advert, talk to driver to join faction
setObjectiveDisplayed(20)
SetObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
