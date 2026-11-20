
--object_tangible_deed_pet_deed_battle_droid_deed = object_tangible_deed_pet_deed_shared_dewback_deed:new {
object_tangible_deed_pet_deed_bantha_armored_mount_deed = object_tangible_deed_pet_deed_shared_bantha_armored_deed:new {
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
	generatedObjectTemplate = "mobile/pet/bantha_armored.iff",
	controlDeviceObjectTemplate = "object/intangible/pet/bantha_armored.iff",
	mobileTemplate = "bantha_armored",
	isMountable = 1,
	skillTemplate = "pets/rare/medium",
	equipmentTemplate = "creature_medium",
	isBaby = 0,
	rarity = "Rare",
	canPowerAttack = 1,
	canFlurryAttack = 0,
	canAttack3 = 0,
	canAttack4 = 0,
	canAttack5 = 0,
	--Apply at most ONE reaction stance.
    canDodge = 0,
    canBlock = 1,
    canParry = 0,
	petType = "creature",
}

ObjectTemplates:addTemplate(object_tangible_deed_pet_deed_bantha_armored_mount_deed, "object/tangible/deed/pet_deed/bantha_armored_mount_deed.iff")