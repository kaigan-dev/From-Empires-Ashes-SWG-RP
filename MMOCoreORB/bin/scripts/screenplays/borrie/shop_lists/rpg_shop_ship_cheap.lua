local shopListTag = "shop_ship_cheap"

rpg_shop_general = {
	manifest = {
		{
			name = "Starfighter",
			minItems = 1,
			items = {
				{template = "object/tangible/deed/rp_ship_deed/rp_scyk_deed.iff", cost = 7500, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/deed/rp_ship_deed/rp_z95_deed.iff", cost = 8000, max = 10, chance = 100, overridePrice = true },
			}
		},
		{
			name = "Boardable Ship",
			minItems = 2,
			items = {
				{template = "object/tangible/deed/rp_ship_deed/rp_ykl37r_deed.iff", cost = 18000, max = 10, chance = 100, overridePrice = true },	
				--{template = "object/tangible/deed/rp_ship_deed/rp_yt1300_deed.iff", cost = 25000, max = 10, chance = 100 , overridePrice = true},
				--{template = "object/tangible/deed/rp_ship_deed/rp_yt2400_deed.iff", cost = 30000, max = 10, chance = 100, overridePrice = true },
			}
		},
	}	
}

RPGVendorShopLists:addShopList(shopListTag, rpg_shop_general)
