--Armor template file for Borrie BoBaka's SWGEmu RPG System--


object_tangible_wearables_armor_roleplay_mandalorian_armor_durasteel_mandalorian_helmet = object_tangible_wearables_helmet_shared_armor_plasteel_helmet.iff:new {


	templateType = ARMOROBJECT,


	objectMenuComponent  = "ArmorObjectMenuComponent",


	healthEncumbrance = 0,
	armorEncumbrance = 0,
	mindEncumbrance = 0,


	maxCondition = 450,


	rating = HEAVY,
	rpskill = 6,


	kinetic = 4,
	energy = 5,
	electricity = 0,
	stun = 2,
	blast = 0,
	heat = 1,
	cold = 1,
	acid = 1,
	lightsaber = 4,
	lightSaber = 4,
	
	rarity = "Rare",


}


ObjectTemplates:addTemplate(object_tangible_wearables_armor_roleplay_mandalorian_armor_durasteel_mandalorian_helmet, "object/tangible/wearables/armor/roleplay/mandalorian/armor_durasteel_mandalorian_helmet.iff")
