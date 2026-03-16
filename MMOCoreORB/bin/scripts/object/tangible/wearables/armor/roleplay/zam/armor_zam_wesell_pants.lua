--Armor template file for Borrie BoBaka's SWGEmu RPG System--


object_tangible_wearables_armor_roleplay_zam_armor_zam_wesell_pants = object_tangible_wearables_armor_zam_shared_armor_zam_wesell_pants:new {


	templateType = ARMOROBJECT,


	objectMenuComponent  = "ArmorObjectMenuComponent",


	healthEncumbrance = 0,
	armorEncumbrance = 0,
	mindEncumbrance = 0,


	maxCondition = 100,


	rating = LIGHT,
	rpskill = 2,


	kinetic = 0,
	energy = 4,
	electricity = 4,
	stun = 2,
	blast = 0,
	heat = 1,
	cold = 1,
	acid = 0,
	lightsaber = -1,
	lightSaber = -1,

	rarity="Uncommon",

}


ObjectTemplates:addTemplate(object_tangible_wearables_armor_roleplay_zam_armor_zam_wesell_pants, "object/tangible/wearables/armor/roleplay/zam/armor_zam_wesell_pants.iff")
