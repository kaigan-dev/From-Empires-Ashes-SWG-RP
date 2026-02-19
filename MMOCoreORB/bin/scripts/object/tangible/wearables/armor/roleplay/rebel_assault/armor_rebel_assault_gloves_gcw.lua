--Armor template file for Borrie BoBaka's SWGEmu RPG System--


object_tangible_wearables_armor_roleplay_rebel_assault_armor_rebel_assault_gloves_gcw = object_tangible_wearables_armor_rebel_assault_shared_armor_rebel_assault_gloves_gcw:new {


	templateType = ARMOROBJECT,


	objectMenuComponent  = "ArmorObjectMenuComponent",


	healthEncumbrance = 0,
	armorEncumbrance = 0,
	mindEncumbrance = 0,


	maxCondition = 200,


	rating = HEAVY,
	rpskill = 6,


	kinetic = 2,
	energy = 6,
	electricity = 0,
	stun = 2,
	blast = 0,
	heat = 3,
	cold = 3,
	acid = 3,
	lightsaber = -1,
	
	rarity="Rare",


}


ObjectTemplates:addTemplate(object_tangible_wearables_armor_roleplay_rebel_assault_armor_rebel_assault_gloves_gcw, "object/tangible/wearables/armor/roleplay/rebel_assault/armor_rebel_assault_gloves_gcw.iff")
