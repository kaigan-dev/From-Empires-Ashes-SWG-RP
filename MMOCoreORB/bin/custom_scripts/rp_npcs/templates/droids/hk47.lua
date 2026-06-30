npc_template = {
	name = "HK Assassin Droid",
    --The IG88 template really wants to be referred to using capitol letters for some reason. call it with "/dm createnpc droids/IG88".

    baseTemplates = {
        "som/hk47",
    },

    skillTemplates = {
        "specops_strong",
    },

    equipmentTemplates = {
        {"som/hk47", {"faction/ithorian/pifi_guardian"}},
        
    },

}