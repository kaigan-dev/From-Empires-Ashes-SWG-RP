--Armor template file for Borrie BoBaka's SWGEmu RPG System--


object_tangible_wearables_armor_roleplay_mandalorian_rebel_armor_mandalorian_rebel_boots = object_tangible_wearables_armor_mandalorian_rebel_shared_armor_mandalorian_rebel_boots:new {


	templateType = ARMOROBJECT,


	objectMenuComponent  = "ArmorObjectMenuComponent",


	healthEncumbrance = 0,
	armorEncumbrance = 0,
	mindEncumbrance = 0,


	maxCondition = 400,


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

	rarity = "Legendary",

}


ObjectTemplates:addTemplate(object_tangible_wearables_armor_roleplay_mandalorian_rebel_armor_mandalorian_rebel_boots, "object/tangible/wearables/armor/roleplay/mandalorian_rebel/armor_mandalorian_rebel_boots.iff")
