--Armor template file for Borrie BoBaka's SWGEmu RPG System--


object_tangible_wearables_armor_roleplay_tantel_armor_tantel_skreej_gloves = object_tangible_wearables_armor_tantel_shared_armor_tantel_skreej_gloves:new {


	templateType = ARMOROBJECT,


	objectMenuComponent  = "ArmorObjectMenuComponent",


	healthEncumbrance = 0,
	armorEncumbrance = 0,
	mindEncumbrance = 0,


	maxCondition = 100,


	rating = MEDIUM,
	rpskill = 4,


	kinetic = 5,
	energy = 3,
	electricity = 0,
	stun = 4,
	blast = 0,
	heat = 2,
	cold = 2,
	acid = 0,
	lightsaber = -1,
	lightSaber = -1,

	rarity="Uncommon",

}


ObjectTemplates:addTemplate(object_tangible_wearables_armor_roleplay_tantel_armor_tantel_skreej_gloves, "object/tangible/wearables/armor/roleplay/tantel/armor_tantel_skreej_gloves.iff")
