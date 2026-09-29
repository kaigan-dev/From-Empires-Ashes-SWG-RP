


object_tangible_deed_pet_deed_nerf_pet_deed = object_tangible_deed_pet_deed_shared_nerf_deed:new {

--object_tangible_deed_pet_deed_nerf_pet_deed = object_tangible_deed_pet_deed_shared_falumpaset_deed:new {


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
	generatedObjectTemplate = "mobile/pet/nerf.iff",
	--generatedObjectTemplate = "mobile/pet/falumpaset_be.iff",
	--controlDeviceObjectTemplate = "object/intangible/pet/nerf_hue.iff",
	controlDeviceObjectTemplate = "object/intangible/pet/falumpaset_hue.iff",
	--mobileTemplate = "nerf",
	mobileTemplate = "falumpaset_be",
	isMountable = 0,
	skillTemplate = "creatures/medium",
	equipmentTemplate = "creature_medium",
}

ObjectTemplates:addTemplate(object_tangible_deed_pet_deed_nerf_pet_deed, "object/tangible/deed/pet_deed/nerf_pet_deed.iff")
