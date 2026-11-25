
--object_tangible_deed_pet_deed_battle_droid_deed = object_tangible_deed_pet_deed_shared_dewback_deed:new {
object_tangible_deed_pet_deed_dwarf_spider_droid_deed = object_tangible_deed_pet_deed_shared_dwarf_spider_droid_deed:new {
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
	generatedObjectTemplate = "mobile/pet/dwarf_spider_droid.iff",
	controlDeviceObjectTemplate = "object/intangible/pet/dwarf_spider_droid.iff",
	mobileTemplate = "dwarf_spider_droid",

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

ObjectTemplates:addTemplate(object_tangible_deed_pet_deed_dwarf_spider_droid_deed, "object/tangible/deed/pet_deed/dwarf_spider_droid_deed.iff")