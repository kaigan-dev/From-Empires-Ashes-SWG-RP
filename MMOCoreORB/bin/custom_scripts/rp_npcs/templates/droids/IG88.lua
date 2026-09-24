npc_template = {
	name = "IG-88 Assassin Droid",
    --The IG88 template really wants to be referred to using capitol letters for some reason. call it with "/dm createnpc droids/IG88".

    baseTemplates = {
        "ig_88",
    },

    skillTemplates = {
        "specops_strong",
    },

    equipmentTemplates = {
--        {"ig_88", {"vortex"}},
        {"ig_88", {"faction/republic/trooper"}},
        
    },

}