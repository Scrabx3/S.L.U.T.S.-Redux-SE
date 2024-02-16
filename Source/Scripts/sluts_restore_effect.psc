Scriptname sluts_restore_effect extends activemagiceffect  

sluts_mission_scenes_sc property slut_lib auto

;
; going to assume this is only ever cast at the PC for now
;
Event OnEffectStart(Actor target, Actor caster)
	slut_lib.restore_pony_actual()
EndEvent

