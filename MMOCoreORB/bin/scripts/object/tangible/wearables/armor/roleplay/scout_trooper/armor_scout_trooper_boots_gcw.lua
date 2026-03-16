--Armor template file for Borrie BoBaka's SWGEmu RPG System--


object_tangible_wearables_armor_roleplay_scout_trooper_armor_scout_trooper_boots_gcw = object_tangible_wearables_armor_scout_trooper_shared_armor_scout_trooper_boots_gcw:new {


	templateType = ARMOROBJECT,


	objectMenuComponent  = "ArmorObjectMenuComponent",


	healthEncumbrance = 0,
	armorEncumbrance = 0,
	mindEncumbrance = 0,


	maxCondition = 100,


	rating = LIGHT,
	rpskill = 2,


	kinetic = 2,
	energy = 2,
	electricity = 0,
	stun = 2,
	blast = 0,
	heat = 2,
	cold = 2,
	acid = 0,
	lightsaber = -1,
	lightSaber = -1,

	rarity="Rare",

}


ObjectTemplates:addTemplate(object_tangible_wearables_armor_roleplay_scout_trooper_armor_scout_trooper_boots_gcw, "object/tangible/wearables/armor/roleplay/scout_trooper/armor_scout_trooper_boots_gcw.iff")
