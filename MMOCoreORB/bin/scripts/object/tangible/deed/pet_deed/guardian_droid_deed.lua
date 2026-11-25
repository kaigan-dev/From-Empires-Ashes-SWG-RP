
--object_tangible_deed_pet_deed_battle_droid_deed = object_tangible_deed_pet_deed_shared_dewback_deed:new {
object_tangible_deed_pet_deed_guardian_droid_deed = object_tangible_deed_pet_deed_shared_guardian_droid_deed:new {
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
	generatedObjectTemplate = "mobile/pet/guardian_droid.iff",
	controlDeviceObjectTemplate = "object/intangible/pet/guardian_droid.iff",
	mobileTemplate = "guardian_droid",

	isMountable = 0,
	skillTemplate = "pets/uncommon/small",
	equipmentTemplate = "creature_medium",
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
}

ObjectTemplates:addTemplate(object_tangible_deed_pet_deed_guardian_droid_deed, "object/tangible/deed/pet_deed/guardian_droid_deed.iff")