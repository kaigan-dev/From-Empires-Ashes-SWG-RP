dwarf_spider_droid = Creature:new {
	objectName = "@mob/creature_names:dwarf_spider_droid",
	socialGroup = "falumpaset",
	faction = "",
	level = 5,
	chanceHit = 0.2,
	damageMin = 30,
	damageMax = 40,
	baseXp = 30,
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
	creatureBitmask = HERD,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/dwarf_spider_droid.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "",
	attacks = {
	}
}

CreatureTemplates:addCreatureTemplate(dwarf_spider_droid, "dwarf_spider_droid")
