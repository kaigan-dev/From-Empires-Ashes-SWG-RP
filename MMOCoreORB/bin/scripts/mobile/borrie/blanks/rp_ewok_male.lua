rp_ewok_male = Creature:new {
	customName = "Male Ewok",
	socialGroup = "",
	faction = "",
	level = 100,
	chanceHit = 1,
	damageMin = 1,
	damageMax = 6,
	baseXp = 1,
	baseHAM = 1,
	baseHAMmax = 1,
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
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_ewok_m_01.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "",
	attacks = {
	}
}

CreatureTemplates:addCreatureTemplate(rp_ewok_male, "rp_ewok_male")