--Armor template file for Borrie BoBaka's SWGEmu RPG System--


object_tangible_wearables_armor_roleplay_ithorian_defender_ith_armor_s01_chest_plate = object_tangible_wearables_armor_ithorian_defender_shared_ith_armor_s01_chest_plate:new {


	templateType = ARMOROBJECT,


	objectMenuComponent  = "ArmorObjectMenuComponent",


	healthEncumbrance = 0,
	armorEncumbrance = 0,
	mindEncumbrance = 0,


	maxCondition = 200,


	rating = HEAVY,
	rpskill = 6,


	kinetic = 6,
	energy = 6,
	electricity = 0,
	stun = 2,
	blast = 0,
	heat = 2,
	cold = 0,
	acid = 2,
	lightsaber = -1,
	
	rarity = "Epic",


}


ObjectTemplates:addTemplate(object_tangible_wearables_armor_roleplay_ithorian_defender_ith_armor_s01_chest_plate, "object/tangible/wearables/armor/roleplay/ithorian_defender/ith_armor_s01_chest_plate.iff")
