object_tangible_medicine_roleplay_rp_stimpack_e = object_tangible_medicine_crafted_shared_crafted_stimpack_sm_s1_e:new {
	gameObjectType = 8236,
	templateType = STIMPACK,
	useCount = 3,
	medicineUse = 5,
	effectiveness = 100,
	medicineClass = STIM_E,
	attributes = {0, 3},
	
	--Roleplay Elements
	roleplayStim = true,
	dieType = 4,
	dieCount = 4,
	bonusHealing = 6,
	dieCheck = 16,

	numberExperimentalProperties = {1, 1, 2, 2, 1, 1},
	experimentalProperties = {"XX", "XX", "OQ", "PE", "OQ", "UT", "XX", "XX"},
	experimentalWeights = {1, 1, 2, 1, 2, 1, 1, 1},
	experimentalGroupTitles = {"null", "null", "exp_effectiveness", "exp_charges", "null", "null"},
	experimentalSubGroupTitles = {"null", "null", "power", "charges", "skillmodmin", "hitpoints"},
	experimentalMin = {0, 0, 75, 10, 5, 1000},
	experimentalMax = {0, 0, 100, 20, 5, 1000},
	experimentalPrecision = {0, 0, 0, 0, 0, 0},
	experimentalCombineType = {0, 0, 1, 1, 1, 4},
}

ObjectTemplates:addTemplate(object_tangible_medicine_roleplay_rp_stimpack_e, "object/tangible/medicine/roleplay/rp_stimpack_e.iff")
