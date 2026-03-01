local shopListTag = "shop_tutorial"

rpg_shop_general = {
	manifest = {
		{
			name = "Starfighter",
			minItems = 1,
			items = {
				{template = "object/tangible/deed/rp_ship_deed/rp_scyk_deed.iff", cost = 5500, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/deed/rp_ship_deed/rp_z95_deed.iff", cost = 8000, max = 10, chance = 100, overridePrice = true },
			}
		},
		{
			name = "Boardable Ship",
			minItems = 2,
			items = {
				{template = "object/tangible/deed/rp_ship_deed/rp_yt1300_deed.iff", cost = 25000, max = 10, chance = 100 , overridePrice = true},
				{template = "object/tangible/deed/rp_ship_deed/rp_yt2400_deed.iff", cost = 32000, max = 10, chance = 100, overridePrice = true },
			}
		},
	}	
}

RPGVendorShopLists:addShopList(shopListTag, rpg_shop_general)
