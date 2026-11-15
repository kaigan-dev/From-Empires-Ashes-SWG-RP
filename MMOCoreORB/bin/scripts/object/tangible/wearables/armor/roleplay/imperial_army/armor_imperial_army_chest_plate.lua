--Armor template file for Borrie BoBaka's SWGEmu RPG System--


object_tangible_wearables_armor_roleplay_imperial_army_armor_imperial_army_chest_plate = object_tangible_wearables_jacket_shared_jacket_imp_veers:new {


	templateType = ARMOROBJECT,


	objectMenuComponent  = "ArmorObjectMenuComponent",


	healthEncumbrance = 0,
	armorEncumbrance = 0,
	mindEncumbrance = 0,


	maxCondition = 100,


	rating = LIGHT,
	rpskill = 2,


	kinetic = 1,
	energy = 1,
	electricity = 0,
	stun = 0,
	blast = 0,
	heat = 1,
	cold = 1,
	acid = 1,
	lightsaber = -1,
	lightSaber = -1,
	
	rarity = "Common",


}


ObjectTemplates:addTemplate(object_tangible_wearables_armor_roleplay_imperial_army_armor_imperial_army_chest_plate, "object/tangible/wearables/armor/roleplay/imperial_army/armor_imperial_army_chest_plate.iff")
