--Armor template file for Borrie BoBaka's SWGEmu RPG System--


object_tangible_wearables_armor_roleplay_marauder_a_armor_marauder_s01_bracer_r = object_tangible_wearables_armor_marauder_shared_armor_marauder_s01_bracer_r:new {


	templateType = ARMOROBJECT,


	objectMenuComponent  = "ArmorObjectMenuComponent",


	healthEncumbrance = 0,
	armorEncumbrance = 0,
	mindEncumbrance = 0,


	maxCondition = 100,


	rating = MEDIUM,
	rpskill = 4,


	kinetic = 2,
	energy = 2,
	electricity = 0,
	stun = 2,
	blast = 0,
	heat = 1,
	cold = 1,
	acid = 1,
	lightsaber = -1,
	lightSaber = -1,
	
	rarity = "Common",


}


ObjectTemplates:addTemplate(object_tangible_wearables_armor_roleplay_marauder_a_armor_marauder_s01_bracer_r, "object/tangible/wearables/armor/roleplay/marauder_a/armor_marauder_s01_bracer_r.iff")
