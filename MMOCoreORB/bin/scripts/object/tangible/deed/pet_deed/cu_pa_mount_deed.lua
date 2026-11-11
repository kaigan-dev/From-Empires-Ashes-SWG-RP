
object_tangible_deed_pet_deed_cu_pa_mount_deed = object_tangible_deed_pet_deed_shared_cu_pa_deed:new {


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
	generatedObjectTemplate = "mobile/pet/cu_pa_be.iff",
	controlDeviceObjectTemplate = "object/intangible/pet/cu_pa_hue.iff",
	mobileTemplate = "cu_pa_be",
	isMountable = 1,
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

ObjectTemplates:addTemplate(object_tangible_deed_pet_deed_cu_pa_mount_deed, "object/tangible/deed/pet_deed/cu_pa_mount_deed.iff")
