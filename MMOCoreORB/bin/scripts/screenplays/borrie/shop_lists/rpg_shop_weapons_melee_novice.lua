local shopListTag = "shop_weapons_melee_novice"

rpg_shop_weapons_melee_novice = {
	manifest = {
		{
			name = "Two Handed Melee",
			minItems = 1,
			items = {
				{template = "object/weapon/roleplay/melee/twohanded/axe.iff", cost = 150, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/melee/twohanded/cleaver.iff", cost = 800, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/melee/twohanded/gamorean_axe.iff", cost = 700, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/melee/twohanded/katana.iff", cost = 700, max = 10, chance = 100, overridePrice = true },
			}
		},

		{
			name = "One Handed Melee",
			minItems = 1,
			items = {
				{template = "object/weapon/roleplay/melee/onehanded/bandit_sword.iff", cost = 600, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/melee/onehanded/marauder_sword.iff", cost = 700, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/melee/onehanded/rsf_sword.iff", cost = 600, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/melee/onehanded/sword.iff", cost = 150, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/melee/onehanded/vibrosword.iff", cost = 600, max = 10, chance = 100, overridePrice = true },				
			}
		},

		{
			name = "Polearms",
			minItems = 1,
			items = {
				{template = "object/weapon/roleplay/melee/polearm/heavy_vibrolance.iff", cost = 800, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/melee/polearm/metal_staff.iff", cost = 150, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/melee/polearm/reinforced_staff.iff", cost = 200, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/melee/polearm/shock_lance.iff", cost = 800, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/melee/polearm/vibrolance.iff", cost = 600, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/melee/polearm/vibro_longaxe.iff", cost = 150, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/melee/polearm/wood_staff.iff", cost = 100, max = 10, chance = 100, overridePrice = true },
			}
		},

		{
			name = "Knives",
			minItems = 1,
			items = {
				{template = "object/weapon/roleplay/ranged/onehanded/dagger.iff", cost = 200, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/melee/onehanded/stone_knife.iff", cost = 150, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/melee/onehanded/survival_knife.iff", cost = 500, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/melee/onehanded/vibroblade.iff", cost = 800, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/melee/onehanded/stun_baton.iff", cost = 600, max = 10, chance = 100, overridePrice = true },
			}
		},

		{
			name = "Brawling Weapons",
			minItems = 1,
			items = {
				{template = "object/weapon/roleplay/melee/unarmed/metal_fan.iff", cost = 150, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/melee/unarmed/punch_dagger.iff", cost = 200, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/melee/unarmed/vibroknuckler.iff", cost = 700, max = 10, chance = 100, overridePrice = true },
				{template = "object/weapon/roleplay/melee/unarmed/wookiee_knuckler.iff", cost = 600, max = 10, chance = 100, overridePrice = true },
			}
		},
	}	
}

RPGVendorShopLists:addShopList(shopListTag, rpg_shop_weapons_melee_novice)