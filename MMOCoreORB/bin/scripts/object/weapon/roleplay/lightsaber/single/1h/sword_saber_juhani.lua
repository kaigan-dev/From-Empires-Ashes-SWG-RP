object_weapon_roleplay_lightsaber_single_1h_sword_saber_juhani = object_weapon_melee_plasma_saber_sword_shared_sword_saber_juhani:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_juhani.iff",

	attackType = MELEEATTACK,
	damageType = LIGHTSABER,
	armorPiercing = HEAVY,

	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 10, --Type of Die used in Damage

	pointBlankRange = 0,
	pointBlankAccuracy = 5,
	idealRange = 2,
	idealAccuracy = 10,
	maxRange = 3,
	maxRangeAccuracy = 99,

	childObjects = {
		{templateFile = "object/tangible/inventory/lightsaber_inventory_2.iff", x = 0, z = 0, y = 0, ox = 0, oy = 0, oz = 0, ow = 0, cellid = -1, containmentType = 4}
	},
}
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_1h_sword_saber_juhani, "object/weapon/roleplay/lightsaber/single/1h/sword_saber_juhani.iff")