npc_template = {
	randomName = "human",

    baseTemplates = {
        "rp_human_female",
        "rp_twilek_female",
        "rp_zabrak_female",
    },

    skillTemplates = {"bear"},

    equipmentTemplates = {
        	{"rp_human_female", {"xovros_hotel_receptionist"}},
            --{"rp_twilek_female", {"xovros_admin_gown"}},
            {"rp_twilek_female", {"xovros_hotel_receptionist"}},
            {"rp_zabrak_female", {"xovros_hotel_receptionist", "xovros_admin_gown", "civ/spacer/civilian_female_s07"}},
    },

    customizationTemplates = {
       {"rp_human_female", {"random"}},
       {"rp_twilek_female", {"random"}},
       {"rp_zabrak_female", {"random"}},
    },
}