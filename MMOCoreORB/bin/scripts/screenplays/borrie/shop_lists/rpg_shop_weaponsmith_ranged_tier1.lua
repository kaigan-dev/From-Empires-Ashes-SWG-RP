local shopListTag = "shop_weaponsmith_ranged_tier1"

shop_weapons_ranged = {
	manifest = {
		{
			name = "Pistols",
			minItems = 1,
			items = {
				{template = "object/weapon/roleplay/ranged/pistol/antiriot_tangle_gun_7.iff", cost = 500, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/ranged/pistol/d18_pistol.iff", cost = 150, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/ranged/pistol/dl18_pistol.iff", cost = 150, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/ranged/pistol/dl44_blaster_pistol.iff", cost = 700, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/ranged/pistol/flare_gun.iff", cost = 600, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/ranged/pistol/ion_stunner_pistol.iff", cost = 600, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/ranged/pistol/kyd21_blaster_pistol.iff", cost = 500, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/ranged/pistol/model_q2_holdout_blaster_pistol.iff", cost = 700, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/ranged/pistol/power_5_heavy_blaster_pistol.iff", cost = 700, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/ranged/pistol/se14_blaster_pistol.iff", cost = 800, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/ranged/pistol/striker_projectile_pistol.iff", cost = 300, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/ranged/pistol/wookiee_pistol.iff", cost = 800, max = 10, chance = 100, overridePrice = true },
			}
		},

		{
			name = "Carbines",
			minItems = 1,
			items = {
				{template = "object/weapon/roleplay/ranged/carbine/alliance_needler_carbine.iff", cost = 150, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/ranged/carbine/bothan_bola_carbine.iff", cost = 150, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/ranged/carbine/dc15s_carbine.iff", cost = 200, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/ranged/carbine/e5_carbine.iff", cost = 200, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/ranged/carbine/wookiee_carbine.iff", cost = 800, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/ranged/carbine/laser_carbine.iff", cost = 300, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/ranged/carbine/elite_carbine.iff", cost = 700, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/ranged/carbine/advanced_laser_carbine.iff", cost = 800, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/ranged/carbine/corestrike_rancor_carbine.iff", cost = 600, max = 10, chance = 100, overridePrice = true },
				},
		},

		{
			name = "Rifles",
			minItems = 1,
			items = {
				{template = "object/weapon/roleplay/ranged/rifle/a280_blaster_rifle.iff", cost = 800, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/ranged/rifle/bowcaster.iff", cost = 800, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/ranged/rifle/dlt19_heavy_blaster_rifle.iff", cost = 800, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/ranged/rifle/ion_rifle.iff", cost = 900, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/ranged/rifle/j1_rifle.iff", cost = 800, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/ranged/rifle/laser_rifle.iff", cost = 400, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/ranged/rifle/sg82b_stun_rifle.iff", cost = 400, max = 10, chance = 100, overridePrice = true },
			}
		},

		{
			name = "Sniper Rifles",
			minItems = 1,
			items = {
				{template = "object/weapon/roleplay/ranged/rifle/dlt20a_heavy_blaster_rifle.iff", cost = 600, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/ranged/rifle/czerka_adventurer.iff", cost = 600, max = 10, chance = 100, overridePrice = true },
			}
		},

		{
			name = "Shotguns",
			minItems = 1,
			items = {
				{template = "object/weapon/roleplay/ranged/rifle/dp23_rifle.iff", cost = 800, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/ranged/pistol/scatter_pistol.iff", cost = 800, max = 10, chance = 100, overridePrice = true },
			}
		},
		
		{
			name = "Grenades",
			minItems = 1,
			items = {
				{template = "object/weapon/roleplay/thrown/grenade/fragmentation_grenade.iff", cost = 100, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/thrown/grenade/glop_grenade.iff", cost = 100, max = 10, chance = 100, overridePrice = true },
			}
		},
	}	
}

RPGVendorShopLists:addShopList(shopListTag, shop_weapons_ranged)