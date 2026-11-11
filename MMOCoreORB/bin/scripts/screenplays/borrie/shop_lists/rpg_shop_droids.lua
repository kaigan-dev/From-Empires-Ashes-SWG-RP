local shopListTag = "shop_mounts"

rpg_shop_mount = {
	manifest = {
		{
			name = "Droids",
			minItems = 1,
			items = {
				{template = "object/tangible/deed/pet_deed/astromech_r2_droid_deed.iff", cost = 4500, max = 10, chance = 100, overridePrice = true, isMount = true},
				{template = "object/tangible/deed/pet_deed/gonk_droid_deed.iff", cost = 1200, max = 10, chance = 100, overridePrice = true, isMount = true},
				{template = "object/tangible/deed/pet_deed/mse_droid_deed.iff", cost = 500, max = 10, chance = 100, overridePrice = true, isMount = true},
				{template = "object/tangible/deed/pet_deed/pet_21b_surgical_droid_deed.iff", cost = 4500, max = 10, chance = 100, overridePrice = true, isMount = true},
				--{template = "object/tangible/deed/pet_deed/pit_droid_deed.iff", cost = 4500, max = 10, chance = 100, overridePrice = true, isMount = true},
				{template = "object/tangible/deed/pet_deed/protocol_droid_deed.iff", cost = 1800, max = 10, chance = 100, overridePrice = true, isMount = true},
			}
		},
	}	
}

RPGVendorShopLists:addShopList(shopListTag, rpg_shop_mount)