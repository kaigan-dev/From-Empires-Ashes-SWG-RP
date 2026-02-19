--Armor template file for Borrie BoBaka's SWGEmu RPG System--


object_tangible_wearables_armor_roleplay_assault_trooper_armor_assault_trooper_boots = object_tangible_wearables_armor_assault_trooper_shared_armor_assault_trooper_boots:new {


	templateType = ARMOROBJECT,


	objectMenuComponent  = "ArmorObjectMenuComponent",


	healthEncumbrance = 0,
	armorEncumbrance = 0,
	mindEncumbrance = 0,


	maxCondition = 200,


	rating = HEAVY,
	rpskill = 6,


	kinetic = 8,
	energy = 6,
	electricity = 0,
	stun = 2,
	blast = 0,
	heat = 3,
	cold = 3,
	acid = 3,
	lightsaber = -1,
	
	rarity = "Legendary",


}


ObjectTemplates:addTemplate(object_tangible_wearables_armor_roleplay_assault_trooper_armor_assault_trooper_boots, "object/tangible/wearables/armor/roleplay/assault_trooper/armor_assault_trooper_boots.iff")
