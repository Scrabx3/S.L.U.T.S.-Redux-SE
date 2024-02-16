;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname dpv__QF_sluts_test_alias_0901120A Extends Quest Hidden

;BEGIN ALIAS PROPERTY pc
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_pc Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY terminus
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_terminus Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY loc2
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_loc2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY loc1
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_loc1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY escrow_chest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_escrow_chest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Root
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Root Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY cart_spawn_mark
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_cart_spawn_mark Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dispatch
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_dispatch Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
objectreference root = Alias_Root.getreference()

Alias_Escrow_Chest.forcerefto(root.getlinkedref(escrow_kw))
Alias_cart_spawn_mark.forcerefto(root.getlinkedref(cart_spawn_kw))

debug.notification("running")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property cart_spawn_kw  Auto  

Keyword Property escrow_kw  Auto  
