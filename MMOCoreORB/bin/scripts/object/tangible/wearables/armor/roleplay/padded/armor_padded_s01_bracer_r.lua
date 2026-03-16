--Armor template file for Borrie BoBaka's SWGEmu RPG System--


object_tangible_wearables_armor_roleplay_padded_armor_padded_s01_bracer_r = object_tangible_wearables_armor_padded_shared_armor_padded_s01_bracer_r:new {


	templateType = ARMOROBJECT,


	objectMenuComponent  = "ArmorObjectMenuComponent",


	healthEncumbrance = 0,
	armorEncumbrance = 0,
	mindEncumbrance = 0,


	maxCondition = 150,


	rating = MEDIUM,
	rpskill = 4,


	kinetic = 2,
	energy = 4,
	electricity = 4,
	stun = 0,
	blast = 2,
	heat = 0,
	cold = 4,
	acid = 0,
	lightsaber = -1,
	lightSaber = -1,
	
	rarity = "Uncommon",


}


ObjectTemplates:addTemplate(object_tangible_wearables_armor_roleplay_padded_armor_padded_s01_bracer_r, "object/tangible/wearables/armor/roleplay/padded/armor_padded_s01_bracer_r.iff")
