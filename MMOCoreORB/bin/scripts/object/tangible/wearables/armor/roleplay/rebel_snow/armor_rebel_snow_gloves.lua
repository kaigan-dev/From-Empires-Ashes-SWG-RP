--Armor template file for Borrie BoBaka's SWGEmu RPG System--


object_tangible_wearables_armor_roleplay_rebel_snow_armor_rebel_snow_gloves = object_tangible_wearables_armor_rebel_snow_shared_armor_rebel_snow_gloves:new {


	templateType = ARMOROBJECT,


	objectMenuComponent  = "ArmorObjectMenuComponent",


	healthEncumbrance = 0,
	armorEncumbrance = 0,
	mindEncumbrance = 0,


	maxCondition = 100,


	rating = LIGHT,
	rpskill = 2,


	kinetic = 2,
	energy = 2,
	electricity = 0,
	stun = 4,
	blast = 0,
	heat = 0,
	cold = 6,
	acid = 2,
	lightsaber = -1,
	lightSaber = -1,

	rarity="Rare",

}


ObjectTemplates:addTemplate(object_tangible_wearables_armor_roleplay_rebel_snow_armor_rebel_snow_gloves, "object/tangible/wearables/armor/roleplay/rebel_snow/armor_rebel_snow_gloves.iff")
