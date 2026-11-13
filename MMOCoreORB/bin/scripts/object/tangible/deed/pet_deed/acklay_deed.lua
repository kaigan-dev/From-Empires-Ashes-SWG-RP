
--object_tangible_deed_pet_deed_battle_droid_deed = object_tangible_deed_pet_deed_shared_dewback_deed:new {
object_tangible_deed_pet_deed_acklay_deed = object_tangible_deed_pet_deed_shared_acklay_deed:new {
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
	generatedObjectTemplate = "mobile/pet/acklay.iff",
	controlDeviceObjectTemplate = "object/intangible/pet/acklay.iff",
	mobileTemplate = "acklay",
    isMountable = 0,
    skillTemplate = "pets/legendary/large",
    equipmentTemplate = "creature_colossal",
    isBaby = 0,
    rarity = "Legendary",
    canPowerAttack = 0,
    canFlurryAttack = 1,
    canAttack3 = 0,
    canAttack4 = 0,
    canAttack5 = 0,
    --Apply at most ONE reaction stance.
    canDodge = 0,
    canBlock = 0,
    canParry = 1,
}

ObjectTemplates:addTemplate(object_tangible_deed_pet_deed_acklay_deed, "object/tangible/deed/pet_deed/acklay_deed.iff")