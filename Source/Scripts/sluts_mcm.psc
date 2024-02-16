Scriptname sluts_mcm extends SKI_ConfigBase conditional

sluts_mission_scenes_sc property q auto

import debug

bool property use_sluts_livery = true auto Conditional
bool property use_sluts_colors = true auto Conditional
bool property use_unp_livery = false auto Conditional
int property custom_livery_color = 0 auto
bool property safeguard = false auto
bool property emergency = false auto
bool property bonehack = false auto

sluts_tats property tatlib auto

;The overtime rate
int chain_rate_OID_S ; _S for slider
;The spontaneous failure rate
int sponfail_OID_S ; _S for slider
;The rehab fine calculator rate
int rehab_rate_OID_S ; _S for slider
;The base payment rate
int basepay_OID_S ; _S for slider

int tails_OID_M ; _M for menu
int yokes_OID_M ; _M for menu
int costume_OID_M ; _M for menu

int SS_debtA_OID_S ; _S for slider
int SS_debtB_OID_S ; _S for slider
int SS_debtC_OID_S ; _S for slider
int property SS_debtA = 0 auto
int property SS_debtB = 1250 auto
int property SS_debtC = 3500 auto

int SS_pilf_OID_S ; _S for slider
int SS_pilfB_OID_S ; _S for slider
int SS_pilfM_OID_S ; _S for slider
int property SS_pilf = 100 auto
int property SS_pilfB = 100 auto
int property SS_pilfM = 50 auto
faction[] property band_fact auto

bool property notalking = false auto
globalvariable property notalkvar auto

;MCM_NoRemoveItems
bool NoRemoveItems
bool property tag_cart = false auto Conditional ;When set the sluts cart will have a quest marker on it.
bool large_messages = false ;When set information about payouts and debt will be shown in a large messgaebox.
bool alway_arrears = false ;Will make all debt immediately go into an arrears, rather than check if the player has money in her escrow first.
bool ponyPrance = true
bool allowCombat = false

bool property useThermal = false auto
armor property Thermals auto

int chainrate = 50
int property sponfail = 0 auto
bool property sponfailrand = true auto ;Is the damage rate for spontaneous failure random, or always total?
int rehab_rate = 35
float property true_rehab_rate = 0.35 auto
int property basepay = 100 auto

int property tailsIndex = 2 auto
string[] tailList
int yokesIndex = 0
string[] yokesList
int property costumeIndex = 0 auto
string[] costumeList

FormList Property form_tails_i Auto
FormList Property form_tails_s Auto
;armor[] property custom_tails_i auto
;armor[] property custom_tails_s auto
FormList Property form_yoke_i Auto
FormList Property form_yoke_s Auto
;armor[] property custom_yoke_i auto
;armor[] property custom_yoke_s auto
FormList Property form_misc Auto

armor[] property costume0_i auto
armor[] property costume0_s auto
armor[] property costume1_i auto
armor[] property costume1_s auto
armor[] property costume2_i auto
armor[] property costume2_s auto
armor[] property costume3_i auto
armor[] property costume3_s auto
armor[] property costume4_i auto
armor[] property costume4_s auto

;quest property kicker_quest auto

event OnConfigInit()
	reset_defaults()
endEvent

event OnPageReset(string page)
	SetCursorFillMode(TOP_TO_BOTTOM) 
	if page == ""
		LoadCustomContent("sluts/logo.dds", 186, 33)
		return
	else
		UnloadCustomContent()
	endif

	if safeguard == false
		safeguard = true
		use_sluts_livery = true
		use_sluts_colors = true
	endif

	if page == "Livery Tattoos"
		trace("sluts_mcm: setting up page 'Livery Tattoos': flag = " + use_sluts_livery)
		AddToggleOptionST("st_use_sluts_livery","Use S.L.U.T.S. Livery?", use_sluts_livery)
		AddToggleOptionST("st_use_sluts_green", "Use S.L.U.T.S. Colours?", use_sluts_colors)
		AddToggleOptionST("st_use_unp_livery",	"Use UNP textures?", use_unp_livery)
		AddColorOptionST("st_use_custom_color", "Use Custom Livery Colour?", custom_livery_color)
	endif

	if page == "Customize"
		trace("sluts_mcm: setting up page 'Customize': flag = " + notalking)
		costume_OID_M = AddMenuOption("Costume Color", costumeList[costumeIndex])
		tails_OID_M = AddMenuOption("Pony Tail", tailList[tailsIndex])
		yokes_OID_M = AddMenuOption("Yoke", yokesList[yokesIndex])
		AddToggleOptionST("st_ponyPrance","Use Ponygirl Animations", ponyPrance)
		AddToggleOptionST("st_allowCombat","Allow Yoke Combat", allowCombat)
		AddToggleOptionST("st_notalking","No talking on the job", notalking)
		basepay_OID_S = AddSliderOption("Base Pay %", basepay, "{0}%")
		chain_rate_OID_S = AddSliderOption("Overtime Bonus (Cumulative)", chainrate, "{0}%")
		AddToggleOptionST("st_noremoveitems","No Player Item Removal", NoRemoveItems)
		AddToggleOptionST("st_tagcart","Cart Shows Quest Marker", tag_cart)
		AddToggleOptionST("st_largemess","Payment/Debt uses MessageBoxes", large_messages)
		AddToggleOptionST("st_useThermal","Use Frostfall Harness", useThermal)
	endif

	if page == "Simple Slavery Options"
		SS_debtA_OID_S = AddSliderOption("Possible Simple Slavery Debt A", SS_debtA, "{0} Gold")
		SS_debtB_OID_S = AddSliderOption("Possible Simple Slavery Debt B", SS_debtB, "{0} Gold")
		SS_debtC_OID_S = AddSliderOption("Possible Simple Slavery Debt C", SS_debtC, "{0} Gold")
	endif

	if page == "Consequences"
		SS_pilf_OID_S = AddSliderOption("Normal Pilferage Chance", SS_pilf, "{0} %")
		SS_pilfB_OID_S = AddSliderOption("Bandit/Forsworn Pilferage Chance", SS_pilfB, "{0} %")
		SS_pilfM_OID_S = AddSliderOption("Max Pilferage", SS_pilfM * 15, "{0} Gold")
		AddToggleOptionST("st_allarrears","All debt goes to Arrears", alway_arrears)
		sponfail_OID_S = AddSliderOption("Spontaneous Failure Chance", sponfail, "{0}%")
		AddToggleOptionST("st_sponfailrand","Random Spontaneous Failure Cargo Loss", sponfailrand)
		rehab_rate_OID_S = AddSliderOption("Rehab Fine Calculator", rehab_rate, "{0}%")
	endif


	if page == "Information"
	
		AddHeaderOption("HOTKEYS:")
		AddTextOption("CTRL + E = Detether/Recover Cart","")
		AddTextOption("CTRL + SPACE = Toggle Cart Physics","")
		AddTextOption("CTRL + SHIFT + 8 = Hard Reset Tether Physics","")
		AddEmptyOption()
		AddTextOption("WARNING!: QUICKSAVE BEFORE PERFORMING","")
		AddTextOption("HARD RESET!","")
		AddEmptyOption()

		AddHeaderOption("OTHER NOTES:")
;		AddEmptyOption()
		AddTextOption("-It is not recommend to perform a haul while","")
		AddTextOption("wearing a quest based Yoke/Armbinder/cuffs.","")
		
	endif

	if page == "Debug"
		AddToggleOptionST("st_emergency_tat_remover","Emergency Tattoo Remover", emergency)
		AddToggleOptionST("st_reset","Reset to Default", emergency)
		AddToggleOptionST("st_cartdebug","Force Return Cart", emergency)
		AddToggleOptionST("st_bonehack","Essential When Carting Hack", bonehack)
	endif
endEvent

event on_scrubber_scrubbed(string eventName, string arg_s, float argNum, form sender)
endevent 

event OnOptionSliderOpen(int option)
	if (option == chain_rate_OID_S)
		SetSliderDialogStartValue(chainrate)
		SetSliderDialogDefaultValue(50)
		SetSliderDialogRange(0, 250)
		SetSliderDialogInterval(5)
	elseIf (option == basepay_OID_S)
		SetSliderDialogStartValue(basepay)
		SetSliderDialogDefaultValue(100)
		SetSliderDialogRange(5, 500)
		SetSliderDialogInterval(5)
	elseIf (option == sponfail_OID_S)
		SetSliderDialogStartValue(sponfail)
		SetSliderDialogDefaultValue(0)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)
	elseIf (option == rehab_rate_OID_S)
		SetSliderDialogStartValue(rehab_rate)
		SetSliderDialogDefaultValue(35)
		SetSliderDialogRange(10, 200)
		SetSliderDialogInterval(5)
	elseIf (option == SS_debtA_OID_S)
		SetSliderDialogStartValue(SS_debtA)
		SetSliderDialogDefaultValue(0)
		SetSliderDialogRange(0, 25000)
		SetSliderDialogInterval(50)
	elseIf (option == SS_debtB_OID_S)
		SetSliderDialogStartValue(SS_debtB)
		SetSliderDialogDefaultValue(1250)
		SetSliderDialogRange(0, 25000)
		SetSliderDialogInterval(50)
	elseIf (option == SS_debtC_OID_S)
		SetSliderDialogStartValue(SS_debtC)
		SetSliderDialogDefaultValue(3500)
		SetSliderDialogRange(0, 25000)
		SetSliderDialogInterval(50)
	elseIf (option == SS_pilf_OID_S)
		SetSliderDialogStartValue(SS_pilf)
		SetSliderDialogDefaultValue(100)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(5)
	elseIf (option == SS_pilfB_OID_S)
		SetSliderDialogStartValue(SS_pilfB)
		SetSliderDialogDefaultValue(100)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(5)
	elseIf (option == SS_pilfM_OID_S)
		SetSliderDialogStartValue(SS_pilfM * 15)
		SetSliderDialogDefaultValue(750)
		SetSliderDialogRange(30, 900)
		SetSliderDialogInterval(15)
	endIf
endEvent

event OnOptionSliderAccept(int option, float value)
	if (option == chain_rate_OID_S)
		chainrate = value as int
		float f = chainrate as float
		q.data.chain_rate = f / 100
		;q.zlib.notify("Butt = " + chainrate)
		SetSliderOptionValue(chain_rate_OID_S, chainrate, "{0}%")
	elseIf (option == basepay_OID_S)
		basepay = value as int
		SetSliderOptionValue(basepay_OID_S, basepay, "{0}%")
	elseIf (option == sponfail_OID_S)
		sponfail = value as int
		SetSliderOptionValue(sponfail_OID_S, sponfail, "{0}%")
	elseif (option == rehab_rate_OID_S)
		rehab_rate = value as int
		float f = rehab_rate as float
		true_rehab_rate = f / 100
		SetSliderOptionValue(rehab_rate_OID_S, rehab_rate, "{0}%")
	elseIf (option == SS_debtA_OID_S)
		SS_debtA = value as int
		SetSliderOptionValue(SS_debtA_OID_S, SS_debtA, "{0} Gold")
	elseIf (option == SS_debtB_OID_S)
		SS_debtB = value as int
		SetSliderOptionValue(SS_debtB_OID_S, SS_debtB, "{0} Gold")
	elseIf (option == SS_debtC_OID_S)
		SS_debtC = value as int
		SetSliderOptionValue(SS_debtC_OID_S, SS_debtC, "{0} Gold")
	elseIf (option == SS_pilf_OID_S)
		SS_pilf = value as int
		SetSliderOptionValue(SS_pilf_OID_S, SS_pilf, "{0} %")
	elseIf (option == SS_pilfB_OID_S)
		SS_pilfB = value as int
		SetSliderOptionValue(SS_pilfB_OID_S, SS_pilfB, "{0} %")
	elseIf (option == SS_pilfM_OID_S)
		SS_pilfM = (value / 15) as int
		SetSliderOptionValue(SS_pilfM_OID_S, SS_pilfM * 15, "{0} Gold")
	endIf
endEvent

;int tailsIndex = 3
;string[] tailList
event OnOptionMenuOpen(int option)
	if (option == tails_OID_M)
		SetMenuDialogOptions(tailList)
		SetMenuDialogStartIndex(tailsIndex)
		SetMenuDialogDefaultIndex(2)
	elseif (option == costume_OID_M)
		SetMenuDialogOptions(costumeList)
		SetMenuDialogStartIndex(costumeIndex)
		SetMenuDialogDefaultIndex(0)
	elseif (option == yokes_OID_M)
		SetMenuDialogOptions(yokesList)
		SetMenuDialogStartIndex(yokesIndex)
		SetMenuDialogDefaultIndex(0)
	endIf
endEvent


event OnOptionMenuAccept(int option, int index)
	if (option == tails_OID_M)
		tailsIndex = index
		if tailsIndex != 4
			q.data.i_devs[7] = form_tails_i.GetAt(tailsIndex) As Armor
			q.data.s_devs[7] = form_tails_s.GetAt(tailsIndex) As Armor
;			q.data.i_devs[7] = custom_tails_i[tailsIndex]
;			q.data.s_devs[7] = custom_tails_s[tailsIndex]
		endif
		SetMenuOptionValue(tails_OID_M, tailList[tailsIndex])
	elseif (option == costume_OID_M)
		costumeIndex = index
		costume_color(costumeIndex)
		SetMenuOptionValue(costume_OID_M, costumeList[costumeIndex])
	elseif (option == yokes_OID_M)
		yokesIndex = index
		;dcur_leonslavery_allitems.GetAt(i) As Armor
		q.data.i_devs[2] = form_yoke_i.GetAt(yokesIndex) As Armor
		q.data.s_devs[2] = form_yoke_s.GetAt(yokesIndex) As Armor

		;q.data.i_devs[2] = custom_yoke_i[yokesIndex]
		;q.data.s_devs[2] = custom_yoke_s[yokesIndex]
		SetMenuOptionValue(yokes_OID_M, yokesList[yokesIndex])
	endIf
endEvent

event OnOptionHighlight(int option)
	if (option == chain_rate_OID_S)
		SetInfoText("S.L.U.T.S. loves a commited pony girl willing to put in a little overtime! This will add a cumulative multiplier bonus to each extra delivery you make without stopping. As long as you're doing it willingly and don't lose any cargo...")
	elseif (option == basepay_OID_S)
		SetInfoText("Your lvl 255 Dragonborn not wanting to do hauls for peanuts? The higher you set this value the more you will be paid for each haul! NOTE: CHANGING THIS VALUE WILL ONLY TAKE EFFECT BETWEEN HAULS")
	elseif (option == sponfail_OID_S)
		SetInfoText("Did some ultra stealthy thief poach your cargo without your knowledge? Or maybe you were in such a hurry you didn't notice the cargo being knocked loose on that bumpy road? Set a random chance your perfect run turns out missing cargo anyways.")
	elseif (option == rehab_rate_OID_S)
		SetInfoText("How much of your fine's value will be converted to debt you will owe to S.L.U.T.S. if you choose to enter rehabilitation. EXAMPLE: If your fine is 1400 and your rate set to the default 35% you will have to work off 490 hauling cargo (1400 * 0.35 = 490). Your fine is completly cleared when you enter rehab.")
	elseif (option == tails_OID_M)
		SetInfoText("Customize your ponytail. No not that type of ponytail...")
	elseif (option == costume_OID_M)
		SetInfoText("Customize your base color theme.")
	elseif (option == yokes_OID_M)
		SetInfoText("Customize your yoke style. IF YOU ARE EXPERENCING CRASHES AFTER THE CART SPELL IS CAST ON YOU TRY THE BREAST OR CHAINLESS DESIGN")
	elseif (option == SS_debtA_OID_S || option == SS_debtB_OID_S || option == SS_debtC_OID_S)
		SetInfoText("One of the three random debts you can be stuck with after being sold to S.L.U.T.S. by a Simple Slavery Auction. A setting of 0 will still require you to complete 1 run to earn your freedom.")
	elseif (option == SS_pilf_OID_S)
		SetInfoText("The chance most NPCs will pilfer your cargo after raping you. May be useful to reduce this rate if you've set the game up to where your poor girl can't travel 10 feet without some rape happy psycho having their way with her ( you sicko :p )")
	elseif (option == SS_pilfB_OID_S)
		SetInfoText("The chance bandits and forsworn will pilfer you after raping you. They might be a little more loot happy than the average NPC after all.")
	elseif (option == SS_pilfM_OID_S)
		SetInfoText("The maximum amount of the cargo value one rapist can pilfer. Keep in mind there is a +10 pilfer penalty for each additional NPC in group sex.")
	endIf
endEvent

function reset_defaults()

	Pages = new string[6]
	Pages[0] = "Livery Tattoos"
	Pages[1] = "Customize"
	Pages[2] = "Simple Slavery Options"
	Pages[3] = "Consequences"
	Pages[4] = "Information"
	Pages[5] = "Debug"
	use_sluts_livery = true
	use_sluts_colors = true
	use_unp_livery = false
	custom_livery_color = 0

	notalking = true
	chainrate = 50
	basepay = 100
	q.data.chain_rate = 0.5
	sponfail = 0
	sponfailrand = true
	rehab_rate = 35
	true_rehab_rate = 0.35
	q.data.MCM_NoRemoveItems = false
	NoRemoveItems = false
	tag_cart = false
	large_messages = false
	q.data.MCM_LargeMessages = false
	alway_arrears = false
	q.data.MCM_AlwaysArrears = false
	bonehack = false
	ponyPrance = true
	allowCombat = false
	q.data.i_devs[4] = form_misc.GetAt(0) As Armor
	q.data.s_devs[4] = form_misc.GetAt(1) As Armor
	q.data.i_devs[5] = form_misc.GetAt(2) As Armor
	q.data.s_devs[5] = form_misc.GetAt(3) As Armor
	useThermal = false

	SS_debtA = 0
	SS_debtB = 1250
	SS_debtC = 3500

	SS_pilf = 100
	SS_pilfB = 100
	SS_pilfM = 50

	tailList = new string[7]
	tailList[0] = "Basic"
	tailList[1] = "Braided"
	tailList[2] = "Lush (Default)"
	tailList[3] = "Braided /w Bow"
	tailList[4] = "No Tail"
	tailList[5] = "Chain (Bell)"
	tailList[6] = "Chain (Sign)"
	tailsIndex = 2
	q.data.i_devs[7] = form_tails_i.GetAt(2) As Armor ;custom_yoke_i[0]
	q.data.s_devs[7] = form_tails_s.GetAt(2) As Armor ;custom_yoke_s[0]

	yokesList = new string[7]
	yokesList[0] = "Default"
	yokesList[1] = "Breast Yoke"
	yokesList[2] = "Chained (Can cause crashes for some players)"
	yokesList[3] = "Black Armbinder"
	yokesList[4] = "Red Armbinder"
	yokesList[5] = "White Armbinder"
	yokesList[6] = "Handcuffs"
	yokesIndex = 0
	q.data.i_devs[2] = form_yoke_i.GetAt(0) As Armor ;custom_yoke_i[0]
	q.data.s_devs[2] = form_yoke_s.GetAt(0) As Armor ;custom_yoke_s[0]

	costumeList = new string[5]
	costumeList[0] = "Black (Default)"
	costumeList[1] = "Red"
	costumeList[2] = "White"
	costumeList[3] = "Blue"
	costumeList[4] = "Pink"
	costumeIndex = 0
	q.data.i_devs[0] = costume0_i[0]
	q.data.s_devs[0] = costume0_s[0]
	q.data.i_devs[3] = costume0_i[1]
	q.data.s_devs[3] = costume0_s[1]
	q.data.i_devs[6] = costume0_i[2]
	q.data.s_devs[6] = costume0_s[2]

	trace("sluts_mcm: initial setup: use_sluts_livery set to: " + use_sluts_livery)

;	kicker_quest.stop()
;	utility.wait(0.2)
;	kicker_quest.reset()
;	utility.wait(0.2)
;	kicker_quest.start()
endfunction

function costume_color(int i)
	if i == 1 ;red
		q.data.i_devs[0] = costume1_i[0]
		q.data.s_devs[0] = costume1_s[0]
		q.data.i_devs[3] = costume1_i[1]
		q.data.s_devs[3] = costume1_s[1]
		q.data.i_devs[6] = costume1_i[2]
		q.data.s_devs[6] = costume1_s[2]
	elseif i == 2 ;white
		q.data.i_devs[0] = costume2_i[0]
		q.data.s_devs[0] = costume2_s[0]
		q.data.i_devs[3] = costume2_i[1]
		q.data.s_devs[3] = costume2_s[1]
		q.data.i_devs[6] = costume2_i[2]
		q.data.s_devs[6] = costume2_s[2]
	elseif i == 3 ;blue
		q.data.i_devs[0] = costume3_i[0]
		q.data.s_devs[0] = costume3_s[0]
		q.data.i_devs[3] = costume3_i[1]
		q.data.s_devs[3] = costume3_s[1]
		q.data.i_devs[6] = costume3_i[2]
		q.data.s_devs[6] = costume3_s[2]
	elseif i == 4 ;pink
		q.data.i_devs[0] = costume4_i[0]
		q.data.s_devs[0] = costume4_s[0]
		q.data.i_devs[3] = costume4_i[1]
		q.data.s_devs[3] = costume4_s[1]
		q.data.i_devs[6] = costume4_i[2]
		q.data.s_devs[6] = costume4_s[2]
	else ;black by default
		q.data.i_devs[0] = costume0_i[0]
		q.data.s_devs[0] = costume0_s[0]
		q.data.i_devs[3] = costume0_i[1]
		q.data.s_devs[3] = costume0_s[1]
		q.data.i_devs[6] = costume0_i[2]
		q.data.s_devs[6] = costume0_s[2]
	endif
endfunction


state st_reset

	event onselectst()
		q.zlib.notify("Resetting everything to default. Please exit MCM now.", true)
		reset_defaults()
		bool ON = true
		SetToggleOptionValueST(ON)
	endevent

	event ondefaultst()
;		use_sluts_livery = true
;		trace("sluts_mcm: livery toggle reset, new value is " + use_sluts_livery)
		SetToggleOptionValueST(false)
	endevent

	event onhighlightst()
		SetInfoText("Reset all settings to default. Helpful if you're using an older version of this mod.")
	endevent

endstate

state st_cartdebug

	event onselectst()
		q.zlib.notify("Summoning the cart back (You can also use Shift+E in game if the cart went flying away). Assuming you aren't cheating and trying to summon you intentionally deserted. This doesn't work inside an interior zones. Please exit MCM now.", true)
		q.force_tether()
		bool ON = true
		SetToggleOptionValueST(ON)
	endevent

	event ondefaultst()
		SetToggleOptionValueST(false)
	endevent

	event onhighlightst()
		SetInfoText("Will force the cart back to the player and tether it to her. Useful if you encounter the lovely ''Cart Launches Into Obrit'' bug. WARNING WILL NOT WORK ON A CART YOU INTENTIONALLY UNTETHERED FROM CHEATER. WILL GLITCH OUT IF USED INSIDE AN INTERIOR LOCATION.")
	endevent

endstate

state st_emergency_tat_remover

	event onselectst()
		emergency != emergency 
		trace("sluts_mcm: emergency toggler selected new value is " + emergency)
		SetToggleOptionValueST(true)
		SetOptionFlagsST(OPTION_FLAG_DISABLED)
		registerformodevent("sluts:scrubbed", "on_scrubber_scrubbed")
		trace("sluts_mcm: scrubbing")

		if tatlib == none
			tatlib = (self as quest) as sluts_tats
		endif

		tatlib.scrub(game.getplayer())
		SetToggleOptionValueST(true)
	endevent

	event on_scrubber_scrubbed(string eventName, string arg_s, float argNum, form sender)
		unregisterformodevent(eventName)
		notification("Tattoos Scrubbed")
		emergency != emergency 
		SetToggleOptionValueST(emergency, OPTION_FLAG_NONE)
	endevent

	event ondefaultst()
		emergency = false
		trace("sluts_mcm: emergency flag toggle reset, new value is " + emergency)
		SetToggleOptionValueST(emergency)
	endevent

	event onhighlightst()
		SetInfoText("This will try to clean off any sticking tattoos.")
	endevent

endstate


state st_use_sluts_livery

	event onselectst()
		use_sluts_livery = !use_sluts_livery
		trace("sluts_mcm: livery toggle selected, new value is " + use_sluts_livery)
		SetToggleOptionValueST(use_sluts_livery)
	endevent

	event ondefaultst()
		use_sluts_livery = true
		trace("sluts_mcm: livery toggle reset, new value is " + use_sluts_livery)
		SetToggleOptionValueST(use_sluts_livery)
	endevent

	event onhighlightst()
		SetInfoText("If true, your pony will be magically tattooed with the S.L.U.T.S. livery")
	endevent

endstate

state st_use_sluts_green

	event onselectst()
		use_sluts_colors = !use_sluts_colors
		SetToggleOptionValueST(use_sluts_colors)
	endevent

	event ondefaultst()
		use_sluts_colors = true
		SetToggleOptionValueST(use_sluts_colors)
	endevent

	event onhighlightst()
		SetInfoText("Uses the default bright green color for your livery")
	endevent

endstate


state st_use_unp_livery

	event onselectst()
		use_unp_livery = !use_unp_livery
		SetToggleOptionValueST(use_unp_livery)
	endevent

	event ondefaultst()
		use_unp_livery = false
		SetToggleOptionValueST(use_unp_livery)
	endevent

	event onhighlightst()
		SetInfoText("Use the UNP livery textures. NOTE: Custom colors are now supported for UNP! Just turn off *Use S.L.U.T.S. Colours* and you're good to go :)")
	endevent

endstate

state st_use_custom_color 
	event OnColorOpenST()
		SetColorDialogStartColor(custom_livery_color)
	        SetColorDialogDefaultColor(custom_livery_color)
	endEvent

	event OnColorAcceptST(int color)
		custom_livery_color = color
		SetColorOptionValueST(custom_livery_color)
		trace("sluts_mcm: setting livery color to " + custom_livery_color)
	endEvent

	event OnDefaultST()
		custom_livery_color = 0x0
		trace("sluts_mcm: setting livery color to default value " + custom_livery_color)
		SetColorOptionValueST(custom_livery_color)
	endEvent
	
	event OnHighlightST()
		SetInfoText("Choose the color you want for your livery")
	endEvent
endState

state st_notalking

	event onselectst()
		notalking = !notalking

		if notalking
			notalkvar.setvalue(1)
		else
			notalkvar.setvalue(0)
		endif

		trace("sluts_mcm: notalking toggle selected, new value is " + notalking)
		SetToggleOptionValueST(notalking)
	endevent

	event ondefaultst()
		notalking = true
		trace("sluts_mcm: notalking toggle reset, new value is " + notalking)
		SetToggleOptionValueST(notalking)
		notalkvar.setvalue(1)
	endevent

	event onhighlightst()
		SetInfoText("You won't be able to talk to most NPCs while on a delivery. Well you can try, but you'll just get dismissed with a degrading comment.")
	endevent

endstate

state st_bonehack

	event onselectst()

		bonehack = !bonehack
		trace("sluts_mcm: bonehack toggle selected, new value is " + bonehack)
		SetToggleOptionValueST(bonehack)
	endevent

	event ondefaultst()
		bonehack = false
		trace("sluts_mcm: bonehack toggle reset, new value is " + bonehack)
		SetToggleOptionValueST(bonehack)
	endevent

	event onhighlightst()
		SetInfoText("For some unlucky players the cart will often get tethered to wrong point of the body upon reloading after a death. This will cause the cart to behave in a totally batshit manner until you exit to main menu and reload. This option is a hacked in work around that sets the player to essential while on a haul, which prevents the bug from happening. WARNING: NEVER SAVE AFTER RUNNING OUT OF HEALTH. THIS HACK MAY ALLOW CHEATING. USE THIS HACK AT YOUR OWN RISK!")
	endevent

endstate

state st_ponyPrance

	event onselectst()

		ponyPrance = !ponyPrance
		trace("sluts_mcm: ponyPrance toggle selected, new value is " + ponyPrance)
		
		if (ponyPrance)
			q.data.i_devs[5] = form_misc.GetAt(2) As Armor
			q.data.s_devs[5] = form_misc.GetAt(3) As Armor
		else
			q.data.i_devs[5] = form_misc.GetAt(6) As Armor
			q.data.s_devs[5] = form_misc.GetAt(7) As Armor
		endif
		
		SetToggleOptionValueST(ponyPrance)

	endevent

	event ondefaultst()

		ponyPrance = false
		trace("sluts_mcm: ponyPrance toggle reset, new value is " + ponyPrance)
		SetToggleOptionValueST(ponyPrance)

		q.data.i_devs[5] = form_misc.GetAt(2) As Armor
		q.data.s_devs[5] = form_misc.GetAt(3) As Armor

	endevent

	event onhighlightst()

		SetInfoText("Toggle whether you will use the Ponygirl movement animations during hauls. NOTE: CHANGING THIS VALUE WILL ONLY TAKE EFFECT BETWEEN HAULS")

	endevent

endstate

state st_allowCombat

	event onselectst()

		allowCombat = !allowCombat
		trace("sluts_mcm: allowCombat toggle selected, new value is " + allowCombat)
		
		if (!allowCombat)
			q.data.i_devs[4] = form_misc.GetAt(0) As Armor
			q.data.s_devs[4] = form_misc.GetAt(1) As Armor
		else
			q.data.i_devs[4] = form_misc.GetAt(4) As Armor
			q.data.s_devs[4] = form_misc.GetAt(5) As Armor
		endif
		
		SetToggleOptionValueST(allowCombat)

	endevent

	event ondefaultst()

		allowCombat = false
		trace("sluts_mcm: allowCombat toggle reset, new value is " + allowCombat)
		SetToggleOptionValueST(allowCombat)

		q.data.i_devs[4] = form_misc.GetAt(0) As Armor
		q.data.s_devs[4] = form_misc.GetAt(1) As Armor

	endevent

	event onhighlightst()

		SetInfoText("Toggle whether you are able to use melee combat while restrainted in a S.L.U.T.S. Yoke/Armbinder/cuffs/etc. NOTE: CHANGING THIS VALUE WILL ONLY TAKE EFFECT BETWEEN HAULS")

	endevent

endstate

state st_useThermal

	event onselectst()

		useThermal = !useThermal
		trace("sluts_mcm: useThermal toggle selected, new value is " + useThermal)
		
		SetToggleOptionValueST(useThermal)

	endevent

	event ondefaultst()

		useThermal = false
		trace("sluts_mcm: useThermal toggle reset, new value is " + useThermal)
		SetToggleOptionValueST(useThermal)

	endevent

	event onhighlightst()

		SetInfoText("When agreeing to perform a haul you will be equipped with a body harness that offers maximum Frostfall body protection. NOTE: CHANGING THIS VALUE WILL ONLY TAKE EFFECT BETWEEN HAULS")

	endevent

endstate

;useThermal

state st_noremoveitems

	event onselectst()
		NoRemoveItems = !NoRemoveItems
		q.data.MCM_NoRemoveItems = NoRemoveItems

		trace("sluts_mcm: NoRemoveItems toggle selected, new value is " + NoRemoveItems)
		SetToggleOptionValueST(NoRemoveItems)
	endevent

	event ondefaultst()
		NoRemoveItems = false
		q.data.MCM_NoRemoveItems = false
		trace("sluts_mcm: NoRemoveItems toggle reset, new value is " + NoRemoveItems)
		SetToggleOptionValueST(NoRemoveItems)
	endevent

	event onhighlightst()
		SetInfoText("Disables the removal of all the PC's items when she agrees to start doing a set of runs. Cheating? Probably, but some players were experiencing issues with the item removal feature so here this option is. You will still have all your gold moved to the escrow. You're using it because you're one of those players, not some cheating douchebag, right?")
	endevent

endstate

state st_tagcart

	event onselectst()
		tag_cart = !tag_cart

		trace("sluts_mcm: Tag Cart toggle selected, new value is " + tag_cart)
		SetToggleOptionValueST(tag_cart)
	endevent

	event ondefaultst()
		tag_cart = false
		trace("sluts_mcm: tag_cart toggle reset, new value is " + tag_cart)
		SetToggleOptionValueST(tag_cart)
	endevent

	event onhighlightst()
		SetInfoText("When enabled your cart will show a quest marker, making it easier to locate if you lose it.")
	endevent

endstate

state st_largemess

	event onselectst()
		large_messages = !large_messages
		q.data.MCM_LargeMessages = large_messages

		trace("sluts_mcm: large_messages toggle selected, new value is " + large_messages)
		SetToggleOptionValueST(large_messages)
	endevent

	event ondefaultst()
		large_messages = false
		q.data.MCM_LargeMessages = false
		trace("sluts_mcm: large_messages toggle reset, new value is " + large_messages)
		SetToggleOptionValueST(large_messages)
	endevent

	event onhighlightst()
		SetInfoText("Makes notifications about payments/debt use a large mesage box, requiring confirmation to continue.")
	endevent

endstate

state st_allarrears

	event onselectst()
		alway_arrears = !alway_arrears
		q.data.MCM_AlwaysArrears = alway_arrears

		trace("sluts_mcm: alway_arrears toggle selected, new value is " + alway_arrears)
		SetToggleOptionValueST(alway_arrears)
	endevent

	event ondefaultst()
		alway_arrears = false
		q.data.MCM_AlwaysArrears = false
		trace("sluts_mcm: alway_arrears toggle reset, new value is " + alway_arrears)
		SetToggleOptionValueST(alway_arrears)
	endevent

	event onhighlightst()
		SetInfoText("Makes notifications about payments/debt use a large mesage box, requiring confirmation to continue.")
	endevent

endstate


state st_sponfailrand

	event onselectst()
		sponfailrand = !sponfailrand

		trace("sluts_mcm: sponfailrand toggle selected, new value is " + sponfailrand)
		SetToggleOptionValueST(sponfailrand)
	endevent

	event ondefaultst()
		notalking = true
		trace("sluts_mcm: sponfailrand toggle reset, new value is " + sponfailrand)
		SetToggleOptionValueST(sponfailrand)
	endevent

	event onhighlightst()
		SetInfoText("Toggled on a Spontaneous Failure event will cause a random amount of cargo loss. Toggled off it will always cause full cargo loss.")
	endevent

endstate
