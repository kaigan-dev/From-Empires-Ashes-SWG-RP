--Armor template file for Borrie BoBaka's SWGEmu RPG System--


object_tangible_wearables_armor_roleplay_galactic_marine_armor_galactic_marine_leggings = object_tangible_wearables_armor_galactic_marine_shared_armor_galactic_marine_leggings:new {


	templateType = ARMOROBJECT,


	objectMenuComponent  = "ArmorObjectMenuComponent",


	healthEncumbrance = 0,
	armorEncumbrance = 0,
	mindEncumbrance = 0,


	maxCondition = 150,


	rating = MEDIUM,
	rpskill = 4,


	kinetic = 4,
	energy = 4,
	electricity = 0,
	stun = 0,
	blast = 0,
	heat = 6,
	cold = 6,
	acid = 6,
	lightsaber = -1,
	lightSaber = -1,
	
	rarity = "Epic",

}


ObjectTemplates:addTemplate(object_tangible_wearables_armor_roleplay_galactic_marine_armor_galactic_marine_leggings, "object/tangible/wearables/armor/roleplay/galactic_marine/armor_galactic_marine_leggings.iff")
