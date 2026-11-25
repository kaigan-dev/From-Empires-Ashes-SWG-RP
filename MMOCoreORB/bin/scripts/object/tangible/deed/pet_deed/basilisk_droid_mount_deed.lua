
--object_tangible_deed_pet_deed_battle_droid_deed = object_tangible_deed_pet_deed_shared_dewback_deed:new {
object_tangible_deed_pet_deed_basilisk_droid_mount_deed = object_tangible_deed_pet_deed_shared_basilisk_droid_deed:new {
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
	generatedObjectTemplate = "mobile/pet/basilisk_droid.iff",
	controlDeviceObjectTemplate = "object/intangible/pet/basilisk_droid.iff",
	mobileTemplate = "basilisk_droid",
	isMountable = 1,
	skillTemplate = "pets/epic/droid_sbd",
	equipmentTemplate = "creature_large",
	isBaby = 0,
	rarity = "Epic",
	canPowerAttack = 1,
	canFlurryAttack = 0,
	canAttack3 = 0,
	canAttack4 = 0,
	canAttack5 = 0,
	--Apply at most ONE reaction stance.
    canDodge = 0,
    canBlock = 1,
    canParry = 0,
	petType = "creature",  --Yes, really. It's supposed to be an animalistic AI.
}

ObjectTemplates:addTemplate(object_tangible_deed_pet_deed_basilisk_droid_mount_deed, "object/tangible/deed/pet_deed/basilisk_droid_mount_deed.iff")