
--object_tangible_deed_pet_deed_battle_droid_deed = object_tangible_deed_pet_deed_shared_dewback_deed:new {
object_tangible_deed_pet_deed_super_battle_droid_deed = object_tangible_deed_pet_deed_shared_super_battle_droid_deed:new {
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
	generatedObjectTemplate = "mobile/pet/super_battle_droid.iff",
	controlDeviceObjectTemplate = "object/intangible/pet/super_battle_droid.iff",
	mobileTemplate = "super_battle_droid",
	isMountable = 0,
	skillTemplate = "pets/epic/droid_sbd",
	equipmentTemplate = "superbattledroid",
	isBaby = 0,
	rarity = "Epic",
	canPowerAttack = 0,
	canFlurryAttack = 1,
	canAttack3 = 0,
	canAttack4 = 0,
	canAttack5 = 0,
	--Apply at most ONE reaction stance.
    canDodge = 0,
    canBlock = 1,
    canParry = 0,
	petType = "droid",
}

ObjectTemplates:addTemplate(object_tangible_deed_pet_deed_super_battle_droid_deed, "object/tangible/deed/pet_deed/super_battle_droid_deed.iff")