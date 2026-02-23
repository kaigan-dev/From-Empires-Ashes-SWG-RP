local shopListTag = "shop_mando_noob"

rpg_shop_general = {
	manifest = {
		
{
			name = "Blasters",
			minItems = 1,
			items = {
				{template = "object/weapon/roleplay/ranged/pistol/crusader_mxii_pistol.iff", cost = 10000, max = 2, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/ranged/pistol/westar34_blaster_pistol.iff", cost = 20000, max = 2, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/ranged/carbine/crusader_mxiii_carbine.iff", cost = 10000, max = 2, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/ranged/rifle/crusader_mxiv_rifle.iff", cost = 10000, max = 2, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/ranged/rifle/westarm5_blaster_rifle.iff", cost = 10000, max = 2, chance = 100, overridePrice = true },
			}
		},
		
		{
			name = "Jetpacks",
			minItems = 1,
			items = {
				{customName = "Mandalorian Jetpack",template = "object/tangible/wearables/backpack/shared_backpack_jetpack_s01.iff", cost = 5000, max = 10, chance = 100, overridePrice = true },
			}
		},
		
	}	
}

RPGVendorShopLists:addShopList(shopListTag, rpg_shop_general)
