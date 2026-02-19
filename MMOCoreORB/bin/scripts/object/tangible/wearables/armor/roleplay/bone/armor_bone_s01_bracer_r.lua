--Armor template file for Borrie BoBaka's SWGEmu RPG System--


object_tangible_wearables_armor_roleplay_bone_armor_bone_s01_bracer_r = object_tangible_wearables_armor_bone_shared_armor_bone_s01_bracer_r:new {


	templateType = ARMOROBJECT,


	objectMenuComponent  = "ArmorObjectMenuComponent",


	healthEncumbrance = 0,
	armorEncumbrance = 0,
	mindEncumbrance = 0,


	maxCondition = 200,


	rating = HEAVY,
	rpskill = 6,


	kinetic = 6,
	energy = 3,
	electricity = 4,
	stun = 1,
	blast = 0,
	heat = 0,
	cold = 0,
	acid = 0,
	lightsaber = -1,
	
	rarity = "Uncommon",


}


ObjectTemplates:addTemplate(object_tangible_wearables_armor_roleplay_bone_armor_bone_s01_bracer_r, "object/tangible/wearables/armor/roleplay/bone/armor_bone_s01_bracer_r.iff")
