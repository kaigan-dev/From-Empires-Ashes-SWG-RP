object_weapon_melee_plasma_saber_2h_sword_2h_sword_saber_arbiter = object_weapon_melee_plasma_saber_2h_sword_shared_2h_sword_saber_arbiter:new {
alternateGrip = "object/weapon/lightsaber/single/1h/sword_saber_arbiter.iff",

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
ObjectTemplates:addTemplate(object_weapon_melee_plasma_saber_2h_sword_2h_sword_saber_arbiter, "object/weapon/melee/plasma_saber/2h_sword/2h_sword_saber_arbiter.iff")
