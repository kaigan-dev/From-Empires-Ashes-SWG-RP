local outfits = {
	"themed/prisoner2",
	"themed/prisoner3",
	"themed/prisoner4",
	"themed/prisoner5",
	"themed/prisoner6",
	"themed/prisoner7",
	"themed/prisoner8",
}

npc_template = {

	randomName = "zabrak",
	baseTemplates = {
		"rp_human_male", 10,
		"rp_human_female", 10,
		"rp_twilek_male", 5,
		"rp_twilek_female", 5,
		"rp_rodian_male", 5,
		"rp_rodian_female", 5,
		"rp_nikto_male", 40,
		"rp_weequay_male", 20,
	},
	skillTemplates = {"thug"},
	
	equipmentTemplates = {
		{"rp_human_male", outfits},
		{"rp_human_female", outfits},
		{"rp_twilek_male", outfits},
		{"rp_twilek_female", outfits},
		{"rp_rodian_male", outfits},
		{"rp_rodian_female", outfits},
		{"rp_nikto_male", outfits},
		{"rp_weequay_male", outfits},
	},	
	
	customizationTemplates = {
		{"rp_human_male", {"random_military"}},
		{"rp_human_female", {"random_military"}},
		{"rp_twilek_male", {"random"}},
		{"rp_twilek_female", {"random"}},
		{"rp_rodian_male", {"random"}},
		{"rp_rodian_female", {"random"}},
		{"rp_nikto_male", {"random"}},
		{"rp_weequay_male", {"random"}},
	},	
}