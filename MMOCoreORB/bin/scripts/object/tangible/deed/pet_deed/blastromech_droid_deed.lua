
--object_tangible_deed_pet_deed_battle_droid_deed = object_tangible_deed_pet_deed_shared_dewback_deed:new {
object_tangible_deed_pet_deed_blastromech_droid_deed = object_tangible_deed_pet_deed_shared_blastromech_droid_deed:new {
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
	generatedObjectTemplate = "mobile/pet/blastromech_droid.iff",
	controlDeviceObjectTemplate = "object/intangible/pet/blastromech_droid.iff",
	mobileTemplate = "blastromech_droid",
	isMountable = 0,
	skillTemplate = "pets/uncommon/droid_battle",
	equipmentTemplate = "superbattledroid",
	isBaby = 0,
	rarity = "Rare",
	canPowerAttack = 1,
	canFlurryAttack = 0,
	canAttack3 = 0,
	canAttack4 = 0,
	canAttack5 = 0,
	--Apply at most ONE reaction stance.
    canDodge = 0,
    canBlock = 0, --Intentionally has no defenses due to higher offense capability.
    canParry = 0,
	petType = "droid",
}

ObjectTemplates:addTemplate(object_tangible_deed_pet_deed_blastromech_droid_deed, "object/tangible/deed/pet_deed/blastromech_droid_deed.iff")