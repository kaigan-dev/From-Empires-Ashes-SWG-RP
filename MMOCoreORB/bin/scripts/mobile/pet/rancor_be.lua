rancor_be = Creature:new {
	objectName = "@mob/creature_names:bio_engineered_rancor",
	socialGroup = "rancor",
	faction = "",
	level = 5,
	chanceHit = 0.2,
	damageMin = 30,
	damageMax = 40,
	baseXp = 45,
	baseHAM = 45,
	baseHAMmax = 55,
	armor = 0,
	resists = {0,0,0,0,0,0,0,0,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	template = {"object/mobile/rancor_hue.iff"},

	skillTemplates = {
			"creatures/large"
	},
	
	
	equipmentTemplates = {

		{"rancor_hue", {"creature_large"}},
	},

	customizationTemplates = {
	},
	lootGroups = {},
	scale = 1,
	weapons = {},
	conversationTemplate = "",
	attacks = {
	}
}

CreatureTemplates:addCreatureTemplate(rancor_be, "rancor_be")