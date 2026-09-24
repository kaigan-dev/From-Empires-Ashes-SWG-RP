--Armor template file for Borrie BoBaka's SWGEmu RPG System--


object_tangible_wearables_armor_roleplay_helmets_armor_helmet_s06 = object_tangible_wearables_helmet_shared_helmet_s06:new {


	templateType = ARMOROBJECT,


	objectMenuComponent  = "ArmorObjectMenuComponent",

	customName = "Rebel Endor Helmet",

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


ObjectTemplates:addTemplate(object_tangible_wearables_armor_roleplay_helmets_armor_helmet_s06, "object/tangible/wearables/armor/roleplay/helmets/armor_helmet_s06.iff")
