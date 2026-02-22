local shopListTag = "shop_junkdealer"

rpg_shop_general = {
	manifest = {
		{
			name = "Utility Items",
			minItems = 1,
			items = {		
				{template = "object/tangible/borrp/item/tripwire.iff", cost = 250, max = 10, chance = 100 },
				{template = "object/tangible/borrp/item/fifty_foot_rope.iff", cost = 250, max = 10, chance = 100 },
				{template = "object/tangible/borrp/item/droid_caller.iff", cost = 250, max = 10, chance = 100 },
				{template = "object/tangible/borrp/item/adhesive.iff", cost = 250, max = 10, chance = 100 },
				{template = "object/tangible/borrp/item/restraining_bolt.iff", cost = 250, max = 10, chance = 100 },
				{template = "object/tangible/borrp/item/sensor_pack.iff", cost = 250, max = 10, chance = 100 },
			}
		},
	}	
}

RPGVendorShopLists:addShopList(shopListTag, rpg_shop_general)


