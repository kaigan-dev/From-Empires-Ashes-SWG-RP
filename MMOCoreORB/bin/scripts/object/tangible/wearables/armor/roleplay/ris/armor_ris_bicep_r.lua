--Armor template file for Borrie BoBaka's SWGEmu RPG System--


object_tangible_wearables_armor_roleplay_ris_armor_ris_bicep_r = object_tangible_wearables_armor_ris_shared_armor_ris_bicep_r:new {


	templateType = ARMOROBJECT,


	objectMenuComponent  = "ArmorObjectMenuComponent",


	healthEncumbrance = 0,
	armorEncumbrance = 0,
	mindEncumbrance = 0,


	maxCondition = 500,


	rating = HEAVY,
	rpskill = 6,


	kinetic = 8,
	energy = 6,
	electricity = 0,
	stun = 6,
	blast = 0,
	heat = 0,
	cold = 2,
	acid = 2,
	lightsaber = 4,
	lightSaber = 4,

	rarity="Legendary",

}


ObjectTemplates:addTemplate(object_tangible_wearables_armor_roleplay_ris_armor_ris_bicep_r, "object/tangible/wearables/armor/roleplay/ris/armor_ris_bicep_r.iff")
