object_weapon_roleplay_lightsaber_single_2h_2h_sword_saber_marauder = object_weapon_melee_plasma_saber_2h_sword_shared_2h_sword_saber_marauder:new {
	alternateGrip = "object/weapon/roleplay/lightsaber/single/1h/sword_saber_marauder.iff",

	attackType = MELEEATTACK,
	damageType = LIGHTSABER,
	armorPiercing = HEAVY,

	minDamage = 1, --Amount of Die used in Damage
	maxDamage = 10, --Type of Die used in Damage
	primaryAttributeOnly = true, --2H Weapon only uses Strength

	pointBlankRange = 0,
	pointBlankAccuracy = 5,
	idealRange = 2,
	idealAccuracy = 10,
	maxRange = 3,
	maxRangeAccuracy = 99,

	rarity = "Legendary",
	itemValue = 20000,
	
	childObjects = {
		{templateFile = "object/tangible/inventory/lightsaber_inventory_2.iff", x = 0, z = 0, y = 0, ox = 0, oy = 0, oz = 0, ow = 0, cellid = -1, containmentType = 4}
	},
}
ObjectTemplates:addTemplate(object_weapon_roleplay_lightsaber_single_2h_2h_sword_saber_marauder, "object/weapon/roleplay/lightsaber/single/2h/2h_sword_saber_marauder.iff")