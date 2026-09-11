--Armor template file for Borrie BoBaka's SWGEmu RPG System--


object_tangible_wearables_armor_roleplay_helmets_armor_helmet_atat = object_tangible_wearables_helmet_shared_helmet_atat:new {


	templateType = ARMOROBJECT,


	objectMenuComponent  = "ArmorObjectMenuComponent",


	healthEncumbrance = 0,
	armorEncumbrance = 0,
	mindEncumbrance = 0,


	maxCondition = 200,

	rating = MEDIUM,
	rpskill = 4,


	kinetic = 4,
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


ObjectTemplates:addTemplate(object_tangible_wearables_armor_roleplay_helmets_armor_helmet_atat, "object/tangible/wearables/armor/roleplay/helmets/armor_helmet_atat.iff")
