--Armor template file for Borrie BoBaka's SWGEmu RPG System--


object_tangible_wearables_armor_roleplay_mandalorian_armor_mandalorian_leggings = object_tangible_wearables_armor_mandalorian_shared_armor_mandalorian_leggings:new {


	templateType = ARMOROBJECT,


	objectMenuComponent  = "ArmorObjectMenuComponent",


	healthEncumbrance = 0,
	armorEncumbrance = 0,
	mindEncumbrance = 0,


	maxCondition = 450,


	rating = HEAVY,
	rpskill = 6,


	kinetic = 6,
	energy = 8,
	electricity = 0,
	stun = 2,
	blast = 0,
	heat = 2,
	cold = 2,
	acid = 2,
	lightsaber = 1,
	lightSaber = 1,
	
	rarity = "Legendary",


}


ObjectTemplates:addTemplate(object_tangible_wearables_armor_roleplay_mandalorian_armor_mandalorian_leggings, "object/tangible/wearables/armor/roleplay/mandalorian/armor_mandalorian_leggings.iff")
