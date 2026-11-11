local shopListTag = "shop_mounts_dantooine"

rpg_shop_mount_tatooine = {
	manifest = {
		{
			name = "Mounts",
			minItems = 1,
			items = {
				{template = "object/tangible/deed/pet_deed/bantha_mount_deed.iff", cost = 1200, max = 10, chance = 100, overridePrice = true, isMount = true},
				{template = "object/tangible/deed/pet_deed/bol_mount_deed.iff", cost = 1200, max = 10, chance = 100, overridePrice = true, isMount = true},
				{template = "object/tangible/deed/pet_deed/cu_pa_mount_deed.iff", cost = 1200, max = 10, chance = 100, overridePrice = true, isMount = true},
				{template = "object/tangible/deed/pet_deed/dewback_mount_deed.iff", cost = 1200, max = 10, chance = 100, overridePrice = true, isMount = true},
				{template = "object/tangible/deed/pet_deed/falumpaset_mount_deed.iff", cost = 1200, max = 10, chance = 100, overridePrice = true, isMount = true},
			}
		},
		{
			name = "Non-Mounts",
			minItems = 1,
			items = {
				{template = "object/tangible/deed/pet_deed/nerf_pet_deed.iff", cost = 1200, max = 10, chance = 100, overridePrice = true, isMount = true},
				{template = "object/tangible/deed/pet_deed/kaadu_deed.iff", cost = 1200, max = 10, chance = 100, overridePrice = true, isMount = true},
				{template = "object/tangible/deed/pet_deed/huurton_deed.iff", cost = 1200, max = 10, chance = 100, overridePrice = true, isMount = true},
				{template = "object/tangible/deed/pet_deed/gurrcat_deed.iff", cost = 1200, max = 10, chance = 100, overridePrice = true, isMount = true},
				{template = "object/tangible/deed/pet_deed/eopie_deed.iff", cost = 1200, max = 10, chance = 100, overridePrice = true, isMount = true},
				{template = "object/tangible/deed/pet_deed/falumpaset_deed.iff", cost = 1200, max = 10, chance = 100, overridePrice = true, isMount = true},
				{template = "object/tangible/deed/pet_deed/dewback_deed.iff", cost = 1200, max = 10, chance = 100, overridePrice = true, isMount = true},
				{template = "object/tangible/deed/pet_deed/cu_pa_deed.iff", cost = 1200, max = 10, chance = 100, overridePrice = true, isMount = true},
				{template = "object/tangible/deed/pet_deed/bantha_deed.iff", cost = 1200, max = 10, chance = 100, overridePrice = true, isMount = true},
				{template = "object/tangible/deed/pet_deed/gualama_deed.iff", cost = 1200, max = 10, chance = 100, overridePrice = true, isMount = true},
			}
		},
		{
			name = "Tiny Pets",
			minItems = 1,
			items = {
				{template = "object/tangible/deed/pet_deed/squall_deed.iff", cost = 500, max = 10, chance = 100, overridePrice = true, isMount = true},
				{template = "object/tangible/deed/pet_deed/bearded_jax_deed.iff", cost = 500, max = 10, chance = 100, overridePrice = true, isMount = true},
				{template = "object/tangible/deed/pet_deed/vir_vur_deed.iff", cost = 500, max = 10, chance = 100, overridePrice = true, isMount = true},
			}
		},
	}	
}

RPGVendorShopLists:addShopList(shopListTag, rpg_shop_mount_tatooine)