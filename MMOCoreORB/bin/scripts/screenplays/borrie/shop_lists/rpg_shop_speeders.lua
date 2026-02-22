local shopListTag = "shop_vehicles"

rpg_shop_speeders = {
	manifest = {
		{
			name = "Vehicles",
			minItems = 1,
			items = {				
				{template = "object/tangible/deed/vehicle_deed/speederbike_deed.iff", cost = 600, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/deed/vehicle_deed/landspeeder_xp38_deed.iff", cost = 1500, max = 10, chance = 100, overridePrice = true },		
				{template = "object/tangible/deed/vehicle_deed/landspeeder_ab1_deed.iff", cost = 2200, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/tcg/series5/vehicle_deed_air2_swoop_speeder.iff", cost = 3250, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/deed/vehicle_deed/landspeeder_x34_deed.iff", cost = 3500, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/deed/vehicle_deed/flare_s_swoop.iff", cost = 4525, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/deed/vehicle_deed/speederbike_swoop_deed.iff", cost = 5750, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/deed/vehicle_deed/landspeeder_v35_deed.iff", cost = 6500, max = 10, chance = 100, overridePrice = true },		
				{template = "object/tangible/deed/vehicle_deed/landspeeder_desert_skiff_deed.iff", cost = 12550, max = 10, chance = 100, overridePrice = true },		
			}
		},
		
		{
			name = "Utility Vehicles",
			minItems = 1,
			items = {				
				{template = "object/tangible/deed/vehicle_deed/hover_chair_deed.iff", cost = 150, max = 10, chance = 100, overridePrice = true },
				{template = "object/tangible/tcg/series1/vehicle_deed_mechno_chair.iff", cost = 200, max = 10, chance = 100, overridePrice = true },		
				{template = "object/tangible/deed/vehicle_deed/hoverlifter_speeder.iff", cost = 6200, max = 10, chance = 100, overridePrice = true },	
				{template = "object/tangible/deed/vehicle_deed/landspeeder_lava_skiff_deed.iff", cost = 7000, max = 10, chance = 100, overridePrice = true },	
				{template = "object/tangible/deed/vehicle_deed/speeder_ric_920_deed.iff", cost = 8500, max = 10, chance = 100, overridePrice = true },	
				{template = "object/tangible/deed/vehicle_deed/military_transport_deed.iff", cost = 12000, max = 10, chance = 100, overridePrice = true },					
			}
		},
		
		{
			name = "Customization Kits",
			minItems = 1,
			items = {				
				{template = "object/tangible/item/vehicle_customization.iff", cost = 5, max = 10, chance = 100, overridePrice = true },		
			}
		},
	}	
}

RPGVendorShopLists:addShopList(shopListTag, rpg_shop_speeders)