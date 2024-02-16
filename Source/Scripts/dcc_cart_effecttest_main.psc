Scriptname dcc_cart_EffectTest_Main extends ActiveMagicEffect
Activator Property ObjectCart Auto

Event OnEffectStart(Actor target, Actor caster)

	;; place the cart in the world and give it a moment to settle.
	ObjectReference cart = target.PlaceAtMe(self.ObjectCart)
	Utility.Wait(1.5)

	;; attach it to the towing actor. for this to work the skeleton must have
	;; the HorseSpine2 bone in it at roughly horse height. it does not need to
	;; have any animations or constraints, and in fact may be better if it is
	;; completely devoid of features.
	cart.TetherToHorse(target)

	Return
EndEvent
