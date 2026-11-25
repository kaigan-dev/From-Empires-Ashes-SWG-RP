
object_tangible_deed_pet_deed_ig_88_deed = object_tangible_deed_pet_deed_shared_ig_88_deed:new {
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
	generatedObjectTemplate = "mobile/pet/ig_88.iff",
	controlDeviceObjectTemplate = "object/intangible/pet/ig_88.iff",
	mobileTemplate = "ig_88",

	isMountable = 0,
	skillTemplate = "pets/uncommon/droid_battle",
	equipmentTemplate = "default",
	isBaby = 0,
	rarity = "Uncommon",
	canPowerAttack = 0,
	canFlurryAttack = 0,
	canAttack3 = 0,
	canAttack4 = 0,
	canAttack5 = 0,
	--Apply at most ONE reaction stance.
	canDodge = 1,
	canBlock = 0,
	canParry = 0,
	petType = "droid",
}

ObjectTemplates:addTemplate(object_tangible_deed_pet_deed_ig_88_deed, "object/tangible/deed/pet_deed/ig_88_deed.iff")