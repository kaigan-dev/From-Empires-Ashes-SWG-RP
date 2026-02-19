--Armor template file for Borrie BoBaka's SWGEmu RPG System--


object_tangible_wearables_armor_roleplay_infiltrator_armor_infiltrator_s02_boots = object_tangible_wearables_armor_infiltrator_shared_armor_infiltrator_s02_boots:new {


	templateType = ARMOROBJECT,


	objectMenuComponent  = "ArmorObjectMenuComponent",


	healthEncumbrance = 0,
	armorEncumbrance = 0,
	mindEncumbrance = 0,


	maxCondition = 100,


	rating = LIGHT,
	rpskill = 2,


	kinetic = 2,
	energy = 4,
	electricity = 0,
	stun = 4,
	blast = 3,
	heat = 3,
	cold = 3,
	acid = 0,
	lightsaber = -1,

	rarity = "Epic",

}


ObjectTemplates:addTemplate(object_tangible_wearables_armor_roleplay_infiltrator_armor_infiltrator_s02_boots, "object/tangible/wearables/armor/roleplay/infiltrator/armor_infiltrator_s02_boots.iff")
