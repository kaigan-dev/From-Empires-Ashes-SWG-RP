

object_tangible_deed_pet_deed_eopie_baby_deed = object_tangible_deed_pet_deed_shared_eopie_deed:new {


	templateType = PETDEED,
	numberExperimentalProperties = {1, 1},
	experimentalProperties = {"XX", "XX"},
	experimentalWeights = {1, 1},
	experimentalGroupTitles = {"null", "null"},
	experimentalSubGroupTitles = {"null", "null"},
	experimentalMin = {0, 0},
	experimentalMax = {0, 0},
	experimentalPrecision = {0, 0},
	experimentalCombineType = {0, 0},
	generatedObjectTemplate = "mobile/pet/eopie_be.iff",
	controlDeviceObjectTemplate = "object/intangible/pet/eopie_hue.iff",
	mobileTemplate = "eopie_be",	
	
	isMountable = 0,
	skillTemplate = "pets/common/medium",
	equipmentTemplate = "creature_small",
	isBaby = 1,
	rarity = "Common",
	canPowerAttack = 0,
	canFlurryAttack = 0,
	canAttack3 = 0,
	canAttack4 = 0,
	canAttack5 = 0,
	--Apply at most ONE reaction stance.
	canDodge = 0,
	canBlock = 0,
	canParry = 0,
}

ObjectTemplates:addTemplate(object_tangible_deed_pet_deed_eopie_baby_deed, "object/tangible/deed/pet_deed/eopie_baby_deed.iff")
