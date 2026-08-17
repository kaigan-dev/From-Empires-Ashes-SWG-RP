BorForce = {
	forceRichLocations = {},
	crystals = {},
	specialCrystals = {},
	crystalLocations = {},
	
	crystal_cave_layout = {
		["cave"] = {
			--Cell ID, x, y, z
			{2, 27.4, -41.8, -60.0},
			{2, 47.7, -48.2, -57.5},
			{2, 39.1, -43.8, -20.9},
			{2, 28.5, -42.4, -63.3},
			{2, 51.5, -47.7, -69.8},
			{2, 48.5, -48.7, -61.7},
			{2, 41.5, -45.3, -24.1},
			{2, 55.9, -49.6, -26.2},			
			{3, 83.7, -56.4, 68.7},
			{3, 94.8, -61.6, -10.6},
			{3, 97.1, -64.0, -30.6},
			{3, 90.5, -61.3, -8.1},
			{3, 76.3, -67.5, -33.1},
			{4, 96.8, -73.1, -55.4},			
			{2, 58.6, -68.6, -42.6},
			{4, 75.3, -77.5, -85.0},
			{4, 61.9, -76.4, -85.3},
			{4, 89.6, -75.8, -89.8},
		},
	},
	
	trainingDeviceObjects = {
		{"object/tangible/item/roleplay/force/force_scroll_light_s01.iff", "Scroll, Light"},
		{"object/tangible/item/roleplay/force/force_scroll_neutral_s01.iff", "Scroll, Neutral"},
		{"object/tangible/item/roleplay/force/force_scroll_dark_s01.iff", "Scroll, Dark"},
		{"object/tangible/item/roleplay/force/holocron_light_s01.iff", "Holocron, Light"},
		{"object/tangible/item/roleplay/force/holocron_neutral_s01.iff", "Holocron, Neutral"},
		{"object/tangible/item/roleplay/force/holocron_dark_s01.iff", "Holocron, Dark"},
	},
	
	lightsaberParts = {
		{"object/tangible/crafting/station/jedi_tool.iff", "Lightsaber Crafting Tool"},
		{"object/tangible/item/roleplay/component_saber_casing.iff", "Saber Hilt Casing"},
		{"object/tangible/item/roleplay/component_saber_emitter.iff", "Saber Blade Emitter"},
		{"object/tangible/item/roleplay/component_saber_lense.iff", "Saber Lense"},
		{"object/tangible/item/roleplay/component_saber_power_cell.iff", "Saber Power Cell"},
	},
	
	caves = {
		--Zone, Type, Building ID
		--{"rp_tatooine", "cave", 610009720},
		--{"rp_carida", "cave", 610019244},
		--{"rp_dantooine", "cave", 610019275},
		--{"rp_dathomir", "cave", 610019299},
		--{"rp_yavin4", "cave", 610019324},
		--{"rp_sulon", "cave", 610019336},
		--{"rp_xovros6", "cave", 610019348},
	},
	
	crystal_templates = {
		"object/tangible/borrp/world/rp_crystal_node_s01.iff",
		"object/tangible/borrp/world/rp_crystal_node_s02.iff",
		"object/tangible/borrp/world/rp_crystal_node_s03.iff",
	},
	
	lightsaberBookTemplate = "object/tangible/item/roleplay/force/book_lightsaber.iff",
}

function BorForce:spawnLightsaberCrystals() 
	for i,v in ipairs(self.caves) do
		local parentID = v[3]
		local zoneName = v[1]
		local crystalTypeTable = self.crystalLocations[zoneName]
		if(crystalTypeTable ~= nil) then
			for x,c in ipairs(self.crystal_cave_layout[v[2]]) do			
				local template = self.crystal_templates[math.random(1,#self.crystal_templates)]
				local crystalColor = self.crystalLocations[zoneName][math.random(1,#crystalTypeTable)]
				local sObj = spawnSceneObject(zoneName, template, c[2], c[3], c[4], parentID + c[1], 1, 0, 0, 0)
				if(sObj ~= nil) then
					TangibleObject(sObj):setCustomizationVariable("/private/index_color_1", crystalColor)	
					SceneObject(sObj):setStoredInt("crystal_color", crystalColor)
					local crystalName = self:getCrystalNameByColorID(crystalColor)
					SceneObject(sObj):setCustomObjectName(crystalName .. " Crystal")
				else 
					printLuaError("Crystal Spawn Error: " .. zoneName .. " " .. c[2] ", " .. c[3] .. ", " .. c[4] .. "Cell: " .. parentID + c[1])
				end
				
			end
		else 
			printLuaError("BorForce could not find a lightsaber crystal cave on " .. zoneName)
		end
		
	end
end

function BorForce:getCrystalNameByColorID(id)
	-- Loop through every element in the table
	for i, v in ipairs(self.crystals) do
		-- Check if the 3rd value is equal to X
		if v[3] == id then
			-- Return the 2nd value of the table
			return v[2]
		end
	end
end

function BorForce:addCorruptionPoints(pTarget, value)
	local original = CreatureObject(pTarget):getShockWounds()
	if(original + value > 100) then
		CreatureObject(pTarget):setShockWounds(100)
	elseif(original + value < 0) then
		CreatureObject(pTarget):setShockWounds(0)
	else 
		CreatureObject(pTarget):setShockWounds(original + value)
	end

	local pGhost = CreatureObject(pTarget):getPlayerObject()
	--Corruption penalties only apply to Forcies
	
	
	if(CreatureObject(pTarget):hasSkill("rp_force_prog_novice") == true) then
		if(original + value >= 10) then
			awardSkill(pGhost, "rp_corruption_01")
		end
		if(original + value >= 20) then
			awardSkill(pGhost, "rp_corruption_02")
		end
		if(original + value >= 30) then
			awardSkill(pGhost, "rp_corruption_03")
		end
		if(original + value >= 40) then
			awardSkill(pGhost, "rp_corruption_04")
		end
		if(original + value >= 50) then
			awardSkill(pGhost, "rp_corruption_04")
		end
	end


end

function BorForce:gatherCrystal(pPlayer, pObject)
	if (pPlayer == nil) then
		return
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	if(pObject == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong with the Force.")
	end
	
	local suiManager = LuaSuiManager()
	if(self:canGatherCrystal(pPlayer)) then
		local sui = SuiMessageBox.new("BorForce", "gatherCrystalCallback")
		sui.setTargetNetworkId(SceneObject(pObject):getObjectID())
		sui.setTitle("Gathering a crystal")
		sui.setPrompt("You may be able to grab a crystal from this node.\n\n[Grab Crystal for 1200 XP?]")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pPlayer)	
	else 
		CreatureObject(pPlayer):sendSystemMessage("You're not currently able to procure a crystal from this node.")
	end
end

function BorForce:gatherCrystalCallback(pPlayer, pSui, eventIndex, args) 
	if (pPlayer == nil) then
		return
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end
	
	local pPageData = LuaSuiBoxPage(pSui):getSuiPageData()

	if (pPageData == nil) then
		return
	end
	
	local suiPageData = LuaSuiPageData(pPageData)
	
	local crystalID = suiPageData:getTargetNetworkId()

	local crystalObj = getSceneObject(crystalID)
	
	if (crystalObj == nil) then
		return
	end
		
	local xpAmount = PlayerObject(pGhost):getExperience("rp_general")
	if(xpAmount < 1200) then
		CreatureObject(pPlayer):sendSystemMessage("You no longer have enough exp to procure this crystal.")
		return
	end
	
	local selection = SceneObject(crystalObj):getStoredInt("crystal_color")
	local template = self:getCrystalDataByColor(selection)
	
	if(template == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Something happened. I cannot find crystal ID " .. selection .. " Please let developer know.")
		return
	end
	
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return 0
	end
	
	local spawnedObj = giveItem(pInventory, template[1], -1, true)
	if(spawnedObj == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong. You're not able to procure this crystal right now. Contact someone who might know more.")
		CreatureObject(pPlayer):sendSystemMessage("Failed to find crystal template: " .. template[1])
		return
	end
	--TangibleObject(spawnedObj):setCustomizationVariable("/private/index_color_1", template[3])
	local colorCrystal = LuaLightsaberCrystalComponent(spawnedObj)
	colorCrystal:setColor(template[3])
	colorCrystal:updateCrystal(template[3])
	CreatureObject(pPlayer):sendSystemMessage("You've broken off a " .. template[2] .. " crystal.")
	
	CreatureObject(pPlayer):awardExperience("rp_general", -1200, false)
end

function BorForce:getCrystalDataByColor(id)
	-- Loop through every element in the table
	for i, v in ipairs(self.crystals) do
		-- Check if the 3rd value is equal to X
		if v[3] == id then
			-- Return the 2nd value of the table
			return v
		end
	end
end

function BorForce:canGatherCrystal(pPlayer)
	if (pPlayer == nil) then
		return
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01") == false) then
		return false
	end
	
	local xpAmount = PlayerObject(pGhost):getExperience("rp_general")
	return xpAmount >= 1200
end

function BorForce:promptForceDMMenu(pPlayer) 
	local suiManager = LuaSuiManager()
	local options = {{"Make Target Force Aware", 0}, {"Spawn Lightsaber Crystal", 0}, {"Spawn Special Lightsaber Crystal", 0}, {"Spawn Training Device", 0}, {"Spawn Lightsaber Book", 0}, {"Spawn Lightsaber Components", 0}, {"Train Target's Force Skills",0}, {"Teach Target a Force Power",0}, {"Add or Remove Force Skill Cap",0}}
	
	suiManager:sendListBox(pPlayer, pPlayer, "DM Force Menu", "What would you like to do?", 1, "@cancel", "", "", "BorForce", "dmMenuCallback", 32, options)
end

function BorForce:dmMenuCallback(pPlayer, pSui, eventIndex, args)
	if (pPlayer == nil) then
		return
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end
	
	local selection = args + 1
	
	local suiManager = LuaSuiManager()
	
	if(selection == 1) then --Make Target Force Aware
		local sui = SuiMessageBox.new("BorForce", "awakenViaDMCallback")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Awakening another")
		sui.setPrompt("Do you want to awaken your current target? This will grant them Force Awareness, but not cost them experience.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pPlayer)	
	elseif(selection == 2) then --Spawn Lightsaber Crystal
		local crystalOptions = self:generateColorCrystalOptions()
		suiManager:sendListBox(pPlayer, pPlayer, "DM Force Menu", "Which Crystal would you like to spawn?", 1, "@cancel", "", "", "BorForce", "spawnCrystalCallback", 32, crystalOptions)
	elseif(selection == 3) then --Spawn Special Lightsaber Crystal
		local crystalOptions = self:generateSpecialColorCrystalOptions()
		suiManager:sendListBox(pPlayer, pPlayer, "DM Force Menu", "Which Special Crystal would you like to spawn?", 1, "@cancel", "", "", "BorForce", "spawnSpecialCrystalCallback", 32, crystalOptions)
	elseif(selection == 4) then --Spawn Training Device
		local trainingDevices = self:generateTrainingDeviceOptions()
		suiManager:sendListBox(pPlayer, pPlayer, "DM Force Menu", "Which Training Device would you like to spawn?", 1, "@cancel", "", "", "BorForce", "spawnTrainingDeviceCallback", 32, trainingDevices)
	elseif(selection == 5) then --Spawn Lightsaber Book
		self:spawnLightsaberBook(pPlayer)
	elseif(selection == 6) then --Spawn Lightsaber Components
		local saberComponents = self:generateSaberComponentOptions()
		suiManager:sendListBox(pPlayer, pPlayer, "DM Force Menu", "Which Saber Component would you like to spawn?", 1, "@cancel", "", "", "BorForce", "spawnSaberComponentCallback", 32, saberComponents)
	elseif(selection == 7) then --Train Target's Force Skills
		local suiManager = LuaSuiManager()
		local options = {{"Alter", 0}, {"Control", 0}, {"Inward", 0}, {"Lightning", 0}, {"Lightsaber", 0}, {"Sense",0}, {"Telekinesis",0}}
		suiManager:sendListBox(pPlayer, pPlayer, "Training Force Skills", "Which skill would you like to train?", 1, "@cancel", "", "", "BorForce", "dmTrainSkillMenuCallback", 32, options)
	elseif(selection == 8) then --Teach Target a Force Power
		local suiManager = LuaSuiManager()
		local options = {{"Absorb", 0}, {"Body", 0}, {"Chain Lightning", 0}, {"Crush", 0}, {"Dominate Mind",0}, {"Flash", 0}, {"Focus", 0}, {"Grip", 0}, {"Heal", 0}, {"Heal Other",0}, {"Jump",0}, {"Lightning", 0}, {"Lightsaber Deflect", 0}, {"Manipulate Object", 0}, {"Meditate",0}, {"Mind Trick",0}, {"Persuade",0}, {"Precognition", 0}, {"Project Image", 0}, {"Push/Pull", 0}, {"Rage", 0}, {"Read Mind",0}, {"Shock",0}, {"Sight",0}, {"Speed", 0}, {"Stealth", 0}, {"Storm", 0}, {"Telekinetic Deflect",0}, {"Throw", 0}, {"Twist Mind",0}}
		suiManager:sendListBox(pPlayer, pPlayer, "Training Force Power", "Which power would you like to train?", 1, "@cancel", "", "", "BorForce", "dmTrainPowerMenuCallback", 32, options)
	elseif(selection == 9) then --Give or remove Force Skill Cap
		local suiManager = LuaSuiManager()
		local options = {{"Increase", 0}, {"Decrease", 0}}
		suiManager:sendListBox(pPlayer, pPlayer, "Adjust Force Skill Cap", "Increase or Decrease Force Skill Cap?", 1, "@cancel", "", "", "BorForce", "dmForceSkillCapCallback", 32, options)
	end
end


function BorForce:dmTrainPowerMenuCallback(pPlayer, pSui, eventIndex, args)
	if (pPlayer == nil) then
		return
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end

	local targetID = CreatureObject(pPlayer):getTargetID()
	local pTarget = getSceneObject(targetID)
	if (pTarget == nil or not SceneObject(pTarget):isPlayerCreature()) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid target, must be a valid player.")
		return
	end
	
	local selection = args + 1
	
	local suiManager = LuaSuiManager()
	
--local options = {{"Absorb", 1}, {"Body", 2}, {"Chain Lightning", 3}, {"Crush", 4}, {"DominateMind",5, {"Flash", 6}, {"Focus", 7}, {"Grip", 8}, {"Heal",9}, {"Heal Other",10}, {"Jump",11}, {"Lightning", 12}, {"Lightsaber Deflect", 13},
-- {"Manipulate Object", 14}, {"Meditate",15}, {"Mind Trick", 16}, {"Persuade",17}, {"Precognition", 18}, {"Project Image", 19}, {"Push/Pull", 20}, {"Rage", 21}, {"Read Mind",22}, {"Shock",23}, {"Sight",24}, {"Speed", 25}, {"Stealth", 26}, 
--{"Storm", 27}, {"Telekinetic Deflect",28}, {"Throw", 29}, {"Twist Mind",30}}
--

	if(selection == 1) then --Absorb
		local sui = SuiMessageBox.new("BorForce", "dmTrainAbsorb")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Absorb")
		sui.setPrompt("Would you like to train the Absorb power? This will not cost XP.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)	
		CreatureObject(pPlayer):sendSystemMessage("A request to train Absorb has been sent to the player.")
	elseif(selection == 2) then --Body
		local sui = SuiMessageBox.new("BorForce", "dmTrainBody")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Body")
		sui.setPrompt("Would you like to train the Body power? This will not cost XP.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)	
		CreatureObject(pPlayer):sendSystemMessage("A request to train Body has been sent to the player.")
	elseif(selection == 3) then --Chain Lightning
		local sui = SuiMessageBox.new("BorForce", "dmTrainChainLightning")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Chain Lightning")
		sui.setPrompt("Would you like to train the Chain Lightning power? This will not cost XP.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)	
		CreatureObject(pPlayer):sendSystemMessage("A request to train Chain Lightning has been sent to the player.")
	elseif(selection == 4) then --Crush
		local sui = SuiMessageBox.new("BorForce", "dmTrainCrush")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Crush")
		sui.setPrompt("Would you like to train the Crush power? This will not cost XP.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)	
		CreatureObject(pPlayer):sendSystemMessage("A request to train Crush has been sent to the player.")
	elseif(selection == 5) then --DominateMind
		local sui = SuiMessageBox.new("BorForce", "dmTrainDominateMind")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Dominate Mind")
		sui.setPrompt("Would you like to train the Dominate Mind power? This will not cost XP.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)	
		CreatureObject(pPlayer):sendSystemMessage("A request to train Dominate Mind has been sent to the player.")
	elseif(selection == 6) then --Flash
		local sui = SuiMessageBox.new("BorForce", "dmTrainFlash")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Flash")
		sui.setPrompt("Would you like to train the Flash power? This will not cost XP.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)	
		CreatureObject(pPlayer):sendSystemMessage("A request to train Flash has been sent to the player.")
	elseif(selection == 7) then --Focus
		local sui = SuiMessageBox.new("BorForce", "dmTrainFocus")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Focus")
		sui.setPrompt("Would you like to train the Focus power? This will not cost XP.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)	
		CreatureObject(pPlayer):sendSystemMessage("A request to train Focus has been sent to the player.")
	elseif(selection == 8) then --Grip
		local sui = SuiMessageBox.new("BorForce", "dmTrainGrip")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Grip")
		sui.setPrompt("Would you like to train the Grip power? This will not cost XP.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)	
		CreatureObject(pPlayer):sendSystemMessage("A request to train Grip has been sent to the player.")
	elseif(selection == 9) then --Heal
		local sui = SuiMessageBox.new("BorForce", "dmTrainHeal")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Heal")
		sui.setPrompt("Would you like to train the Heal power? This will not cost XP.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)	
		CreatureObject(pPlayer):sendSystemMessage("A request to train Heal has been sent to the player.")
	elseif(selection == 10) then --Heal Other
		local sui = SuiMessageBox.new("BorForce", "dmTrainHealOther")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Heal Other")
		sui.setPrompt("Would you like to train the Heal Other power? This will not cost XP.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)	
		CreatureObject(pPlayer):sendSystemMessage("A request to train Heal Other has been sent to the player.")
	elseif(selection == 11) then --Jump
		local sui = SuiMessageBox.new("BorForce", "dmTrainJump")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Jump")
		sui.setPrompt("Would you like to train the Jump power? This will not cost XP.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)	
		CreatureObject(pPlayer):sendSystemMessage("A request to train Jump has been sent to the player.")
		elseif(selection == 12) then --Lightning
		local sui = SuiMessageBox.new("BorForce", "dmTrainLightningPower")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Lightning")
		sui.setPrompt("Would you like to train the Lightning power? This will not cost XP.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)	
		CreatureObject(pPlayer):sendSystemMessage("A request to train Lightning has been sent to the player.")
	elseif(selection == 13) then --Lightsaber Deflect
		local sui = SuiMessageBox.new("BorForce", "dmTrainLightsaberDeflect")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Lightsaber Deflect")
		sui.setPrompt("Would you like to train the Lightsaber Deflect power? This will not cost XP.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)	
		CreatureObject(pPlayer):sendSystemMessage("A request to train Lightsaber Deflect has been sent to the player.")
	elseif(selection == 14) then --Manipulate Object
		local sui = SuiMessageBox.new("BorForce", "dmTrainManipulateObject")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Manipulate Object")
		sui.setPrompt("Would you like to train the Manipulate Object power? This will not cost XP.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)	
		CreatureObject(pPlayer):sendSystemMessage("A request to train Manipulate Object has been sent to the player.")
	elseif(selection == 15) then --Meditate
		local sui = SuiMessageBox.new("BorForce", "dmTrainMeditate")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Meditate")
		sui.setPrompt("Would you like to train the Meditate power? This will not cost XP.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)	
		CreatureObject(pPlayer):sendSystemMessage("A request to train Meditate has been sent to the player.")
	elseif(selection == 16) then --Mind Trick
		local sui = SuiMessageBox.new("BorForce", "dmTrainMindTrick")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Mind Trick")
		sui.setPrompt("Would you like to train the Mind Trick power? This will not cost XP.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)	
		CreatureObject(pPlayer):sendSystemMessage("A request to train Mind Trick has been sent to the player.")
	elseif(selection == 17) then --Persuade
		local sui = SuiMessageBox.new("BorForce", "dmTrainPersuade")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Persuade")
		sui.setPrompt("Would you like to train the Persuade power? This will not cost XP.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)	
		CreatureObject(pPlayer):sendSystemMessage("A request to train Persuade has been sent to the player.")
	elseif(selection == 18) then --Precognition
		local sui = SuiMessageBox.new("BorForce", "dmTrainPrecognition")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Precognition")
		sui.setPrompt("Would you like to train the Precognition power? This will not cost XP.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)	
		CreatureObject(pPlayer):sendSystemMessage("A request to train Precognition has been sent to the player.")
	elseif(selection == 19) then --Project Image
		local sui = SuiMessageBox.new("BorForce", "dmTrainProjectImage")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Project Image")
		sui.setPrompt("Would you like to train the Project Image power? This will not cost XP.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)	
		CreatureObject(pPlayer):sendSystemMessage("A request to train Project Image has been sent to the player.")
	elseif(selection == 20) then --Push/Pull
		local sui = SuiMessageBox.new("BorForce", "dmTrainPushPull")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Push/Pull")
		sui.setPrompt("Would you like to train the Push/Pull power? This will not cost XP.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)	
		CreatureObject(pPlayer):sendSystemMessage("A request to train Push/Pull has been sent to the player.")
	elseif(selection == 21) then --Rage
		local sui = SuiMessageBox.new("BorForce", "dmTrainRage")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Rage")
		sui.setPrompt("Would you like to train the Rage power? This will not cost XP.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)	
		CreatureObject(pPlayer):sendSystemMessage("A request to train Rage has been sent to the player.")
		elseif(selection == 22) then --Read Mind
		local sui = SuiMessageBox.new("BorForce", "dmTrainReadMind")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Read Mind")
		sui.setPrompt("Would you like to train the Read Mind power? This will not cost XP.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)	
		CreatureObject(pPlayer):sendSystemMessage("A request to train Read Mind has been sent to the player.")
	elseif(selection == 23) then --Shock
		local sui = SuiMessageBox.new("BorForce", "dmTrainShock")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Shock")
		sui.setPrompt("Would you like to train the Shock power? This will not cost XP.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)	
		CreatureObject(pPlayer):sendSystemMessage("A request to train Shock has been sent to the player.")
	elseif(selection == 24) then --Sight
		local sui = SuiMessageBox.new("BorForce", "dmTrainSight")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Sight")
		sui.setPrompt("Would you like to train the Sight power? This will not cost XP.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)	
		CreatureObject(pPlayer):sendSystemMessage("A request to train Sight has been sent to the player.")
	elseif(selection == 25) then --Speed
		local sui = SuiMessageBox.new("BorForce", "dmTrainSpeed")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Speed")
		sui.setPrompt("Would you like to train the Speed power? This will not cost XP.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)	
		CreatureObject(pPlayer):sendSystemMessage("A request to train Speed has been sent to the player.")
	elseif(selection == 26) then --Stealth
		local sui = SuiMessageBox.new("BorForce", "dmTrainStealth")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Stealth")
		sui.setPrompt("Would you like to train the Stealth power? This will not cost XP.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)	
		CreatureObject(pPlayer):sendSystemMessage("A request to train Stealth has been sent to the player.")
	elseif(selection == 27) then --Storm
		local sui = SuiMessageBox.new("BorForce", "dmTrainStorm")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Storm")
		sui.setPrompt("Would you like to train the Storm power? This will not cost XP.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)	
		CreatureObject(pPlayer):sendSystemMessage("A request to train Storm has been sent to the player.")
	elseif(selection == 28) then --Telekinetic Deflect
		local sui = SuiMessageBox.new("BorForce", "dmTrainTelekineticDeflect")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Telekinetic Deflect")
		sui.setPrompt("Would you like to train the Telekinetic Deflect power? This will not cost XP.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)	
		CreatureObject(pPlayer):sendSystemMessage("A request to train Telekinetic Deflect has been sent to the player.")
	elseif(selection == 29) then --Throw
		local sui = SuiMessageBox.new("BorForce", "dmTrainThrow")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Throw")
		sui.setPrompt("Would you like to train the Throw power? This will not cost XP.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)	
		CreatureObject(pPlayer):sendSystemMessage("A request to train Throw has been sent to the player.")
	elseif(selection == 30) then --Twist Mind
		local sui = SuiMessageBox.new("BorForce", "dmTrainTwistMind")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Twist Mind")
		sui.setPrompt("Would you like to train the Twist Mind power? This will not cost XP.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)	
		CreatureObject(pPlayer):sendSystemMessage("A request to train Twist Mind has been sent to the player.")
	else
		CreatureObject(pPlayer):sendSystemMessage("Invalid selection.")
	end
end





function BorForce:dmForceSkillCapCallback(pPlayer, pSui, eventIndex, args)
	if (pPlayer == nil) then
		return
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end

	local targetID = CreatureObject(pPlayer):getTargetID()
	local pTarget = getSceneObject(targetID)
	if (pTarget == nil or not SceneObject(pTarget):isPlayerCreature()) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid target, must be a valid player.")
		return
	end
	
	local selection = args + 1
	
	local suiManager = LuaSuiManager()

	--If the target is not Force Sensitive, they cannot gain Force Skill Cap
	if(CreatureObject(pTarget):hasSkill("rp_force_prog_novice") == false) then
		CreatureObject(pPlayer):sendSystemMessage("This target is not Force Sensitive")
		return
	end
	
	if(selection == 1) then --Add
		CreatureObject(pTarget):awardExperience("rp_frc_skill_cap", 1, true)
		CreatureObject(pPlayer):sendSystemMessage("A point of Force Skill Cap has been granted to the target player.")
	elseif(selection == 2) then --Remove
		CreatureObject(pTarget):awardExperience("rp_frc_skill_cap", -1, true)
		CreatureObject(pPlayer):sendSystemMessage("A point of Force Skill Cap has been removed from the target player.")
	end
end




function BorForce:dmTrainSkillMenuCallback(pPlayer, pSui, eventIndex, args)
	if (pPlayer == nil) then
		return
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end

	local targetID = CreatureObject(pPlayer):getTargetID()
	local pTarget = getSceneObject(targetID)
	if (pTarget == nil or not SceneObject(pTarget):isPlayerCreature()) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid target, must be a valid player.")
		return
	end
	
	local selection = args + 1
	
	local suiManager = LuaSuiManager()
	
	if(selection == 1) then --Alter
		local sui = SuiMessageBox.new("BorForce", "dmTrainAlter")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Alter")
		sui.setPrompt("Would you like to train a point of Alter? This will require sufficient XP, subject to an increase if the skill rank is above its parent attribute.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)	
		CreatureObject(pPlayer):sendSystemMessage("A request to train a point of Alter has been sent to the player.")
	elseif(selection == 2) then --Control
			local sui = SuiMessageBox.new("BorForce", "dmTrainControl")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Control")
		sui.setPrompt("Would you like to train a point of Control? This will require sufficient XP, subject to an increase if the skill rank is above its parent attribute.?")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)
		CreatureObject(pPlayer):sendSystemMessage("A request to train a point of Control has been sent to the player.")
	elseif(selection == 3) then --Inward
		local sui = SuiMessageBox.new("BorForce", "dmTrainInward")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Inward")
		sui.setPrompt("Would you like to train a point of Inward? This will require sufficient XP, subject to an increase if the skill rank is above its parent attribute.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)
		CreatureObject(pPlayer):sendSystemMessage("A request to train a point of Inward has been sent to the player.")
	elseif(selection == 4) then --Lightning
		local sui = SuiMessageBox.new("BorForce", "dmTrainLightning")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Lightning")
		sui.setPrompt("Would you like to train a point of Lightning? This will require sufficient XP, subject to an increase if the skill rank is above its parent attribute.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)
		CreatureObject(pPlayer):sendSystemMessage("A request to train a point of Lightning has been sent to the player.")
	elseif(selection == 5) then --Lightsaber
		local sui = SuiMessageBox.new("BorForce", "dmTrainLightsaber")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Lightsaber")
		sui.setPrompt("Would you like to train a point of Lightsaber? This will require sufficient XP, subject to an increase if the skill rank is above its parent attribute.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)
		CreatureObject(pPlayer):sendSystemMessage("A request to train a point of Lightsaber has been sent to the player.")
	elseif(selection == 6) then --Sense
		local sui = SuiMessageBox.new("BorForce", "dmTrainSense")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Sense")
		sui.setPrompt("Would you like to train a point of Sense? This will require sufficient XP, subject to an increase if the skill rank is above its parent attribute.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)
		CreatureObject(pPlayer):sendSystemMessage("A request to train a point of Sense has been sent to the player.")
	elseif(selection == 7) then --Telekinesis
		local sui = SuiMessageBox.new("BorForce", "dmTrainTelekinesis")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Train Telekinesis")
		sui.setPrompt("Would you like to train a point of Telekinesis? This will require sufficient XP, subject to an increase if the skill rank is above its parent attribute.")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pTarget)
		CreatureObject(pPlayer):sendSystemMessage("A request to train a point of Telekinesis has been sent to the player.")
	end
end






function BorForce:generateColorCrystalOptions() 
	local optionsz = {}
	for i,v in ipairs(self.crystals) do
		-- Add the second entry in the table crystals to the new table
		local newOption = {v[2], 0}
		table.insert(optionsz, newOption)
	end
	return optionsz
end

function BorForce:generateSpecialColorCrystalOptions() 
	local optionsz = {}
	for i,v in ipairs(self.specialCrystals) do
		-- Add the second entry in the table crystals to the new table
		local newOption = {v[2], 0}
		table.insert(optionsz, newOption)
	end
	return optionsz
end
	
function BorForce:generateTrainingDeviceOptions()
	local optionsz = {}
	for i,v in ipairs(self.trainingDeviceObjects) do
		local newOption = {v[2], 0}
		table.insert(optionsz, newOption)
	end
	return optionsz
end

function BorForce:generateSaberComponentOptions()
	local optionsz = {}
	for i,v in ipairs(self.lightsaberParts) do
		local newOption = {v[2], 0}
		table.insert(optionsz, newOption)
	end
	return optionsz
end

function BorForce:spawnCrystalCallback(pPlayer, pSui, eventIndex, args)
	if (pPlayer == nil) then
		return
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end
	
	local selection = args + 1
	
	local template = self.crystals[selection]
	
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return 0
	end
	
	local spawnedObj = giveItem(pInventory, template[1], -1, true)
	--TangibleObject(spawnedObj):setCustomizationVariable("/private/index_color_1", template[3])
	local colorCrystal = LuaLightsaberCrystalComponent(spawnedObj)
	colorCrystal:setColor(template[3])
	colorCrystal:updateCrystal(template[3])
	CreatureObject(pPlayer):sendSystemMessage("Spawned " .. template[2] .. " lightsaber crystal.")
end


function BorForce:spawnSpecialCrystalCallback(pPlayer, pSui, eventIndex, args)
	if (pPlayer == nil) then
		return
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end
	
	local selection = args + 1
	
	local template = self.specialCrystals[selection]
	
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return 0
	end
	
	local spawnedObj = giveItem(pInventory, template[1], -1, true)
	--TangibleObject(spawnedObj):setCustomizationVariable("/private/index_color_1", template[3])
	local colorCrystal = LuaLightsaberCrystalComponent(spawnedObj)
	colorCrystal:setColor(template[3])
	colorCrystal:updateCrystal(template[3])
	CreatureObject(pPlayer):sendSystemMessage("Spawned " .. template[2] .. " lightsaber crystal.")
end

function BorForce:spawnTrainingDeviceCallback(pPlayer, pSui, eventIndex, args)
	if (pPlayer == nil) then
		return
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end
	
	local selection = args + 1
	
	local template = self.trainingDeviceObjects[selection]
	
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return 0
	end
	
	local spawnedObj = giveItem(pInventory, template[1], -1, true)
	CreatureObject(pPlayer):sendSystemMessage("Spawned " .. template[2])
end

function BorForce:spawnSaberComponentCallback(pPlayer, pSui, eventIndex, args)
	if (pPlayer == nil) then
		return
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end
	
	local selection = args + 1
	
	local template = self.lightsaberParts[selection]
	
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return 0
	end
	
	local spawnedObj = giveItem(pInventory, template[1], -1, true)
	
	if(spawnedObj ~= nil) then
		local newSerial = generateSerial()
		TangibleObject(spawnedObj):setSerialNumber(newSerial)
	end
	
	CreatureObject(pPlayer):sendSystemMessage("Spawned " .. template[2])
end

function BorForce:spawnLightsaberBook(pPlayer)
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return 0
	end
	
	local spawnedObj = giveItem(pInventory, self.lightsaberBookTemplate, -1, true)
	CreatureObject(pPlayer):sendSystemMessage("Spawned Lightsaber Book")
end

function BorForce:toggleLightsaberSchematics(pPlayer)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local hasKnowledge = SceneObject(pPlayer):getStoredInt("knowsLightsaberConstruction") == 1
	
	if(hasKnowledge == nil) then
		CreatureObject(pPlayer):sendSystemMessage("You don't know how to make a lightsaber. Truly.")
		return
	end
	
	if(hasKnowledge == false) then
		CreatureObject(pPlayer):sendSystemMessage("You don't know how to make a lightsaber.")
		return
	end
	
	local isSpawned = SceneObject(pPlayer):getStoredInt("saberSchemsSpawned") == 1
	if(isSpawned == true) then
		SceneObject(pPlayer):setStoredInt("saberSchemsSpawned", 0)
		CreatureObject(pPlayer):sendSystemMessage("Your lightsaber schematics have been restored.")
		for i,v in ipairs(rp_saber_schematics) do
			local added = PlayerObject(pGhost):addRewardedSchematic(v, 1, 10000, true)
			if(added == false) then
				CreatureObject(pPlayer):sendSystemMessage("Error: Could not add schematic " .. v)
			end
		end
	else 
		SceneObject(pPlayer):setStoredInt("saberSchemsSpawned", 1)
		CreatureObject(pPlayer):sendSystemMessage("Your lightsaber schematics have been temporarily removed. Use this command again to return them.")
		for i,v in ipairs(rp_saber_schematics) do
			PlayerObject(pGhost):removeRewardedSchematic(v, true)
		end
	end
end



function BorForce:awakenViaDMCallback(pPlayer, pSui, eventIndex, args)
	if (pPlayer == nil) then
		return
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end

	local targetID = CreatureObject(pPlayer):getTargetID()
	local pTarget = getSceneObject(targetID)
	
	if (pTarget == nil or not SceneObject(pTarget):isPlayerCreature()) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid target, must be a valid player.")
		return
	end
	
	if(CreatureObject(pTarget):hasSkill("rp_force_prog_rank_01")) then
		CreatureObject(pPlayer):sendSystemMessage("This person is already aware of their connection to the Force.")
		return
	elseif(CreatureObject(pTarget):hasSkill("rp_force_prog_novice") == false) then
		CreatureObject(pPlayer):sendSystemMessage("This target is not Force Sensitive")
		return
	end
	
	CreatureObject(pPlayer):sendSystemMessage("The player has been made aware of their connection to the Force.")
	self:setForceAware(pTarget)	
end



function BorForce:promptAwakenOther(pPlayer) 
	if (pPlayer == nil) then
		return
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	--[[ Disable awakening other than by DM
	local xpAmount = PlayerObject(pGhost):getExperience("rp_general")
	
	if(xpAmount < 2400) then
		CreatureObject(pPlayer):sendSystemMessage("You don't have enough experience to awaken someone to their potential in the Force.")
		return
	end 
	
	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_02") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You don't have the capability to awaken another to their Force sensitivity.")
		return
	end
	
	local targetID = CreatureObject(pPlayer):getTargetID()
	local pTarget = getSceneObject(targetID)
		
	if (pTarget == nil or not SceneObject(pTarget):isPlayerCreature()) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid target, must be a valid player.")
		return
	end
	
	local pTargetGhost = CreatureObject(pTarget):getPlayerObject()
	
	if(SceneObject(pPlayer):getObjectID() == SceneObject(pTarget):getObjectID()) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid target.")
		return
	end
	
	local targetName = CreatureObject(pTarget):getFirstName()
	
	--Can't awaken someone who is already awakened.
	if(CreatureObject(pTarget):hasSkill("rp_force_prog_rank_01")) then
		CreatureObject(pPlayer):sendSystemMessage("You try to awaken " .. targetName .. " to their potential connection to the Force...")
		return
	end
	
	--Can't awaken someone who isn't even Force Sensitive
	if(CreatureObject(pTarget):hasSkill("rp_force_prog_novice") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You attempt to awaken " .. targetName .. " to their potential connection to the Force...")
		return
	end
	

	CreatureObject(pPlayer):sendSystemMessage("You try to awaken " .. targetName .. " to their potential connection to the Force!")	
	local sui = SuiMessageBox.new("BorForce", "setForceAwareByOtherCallback")
	sui.setTargetNetworkId(SceneObject(pPlayer):getObjectID())
	sui.setTitle("First steps into a larger world")
	sui.setPrompt("You feel a deep connection with " .. CreatureObject(pPlayer):getFirstName() .. ". If you reach out, you might discover something about yourself that previously you've only ever suspected... Do you reach out?")
	sui.setOkButtonText("Yes")
	sui.setCancelButtonText("No")
	local pageId = sui.sendTo(pTarget)	
	--]]
end

function BorForce:setForceAwareByOtherCallback(pPlayer, pSui, eventIndex, args)
	if (pPlayer == nil) then
		return
	end
	--[[ Disable awakening other than by DM
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end
	
	local pPageData = LuaSuiBoxPage(pSui):getSuiPageData()

	if (pPageData == nil) then
		return
	end
	
	local suiPageData = LuaSuiPageData(pPageData)
	
	local pAwakenerID = suiPageData:getTargetNetworkId()

	local pAwakener = getSceneObject(pAwakenerID)
	
	if (pAwakener == nil or not SceneObject(pAwakener):isPlayerCreature()) then
		CreatureObject(pPlayer):sendSystemMessage("The connection is lost...")
		return
	end
	
	local pAwakenerGhost = CreatureObject(pAwakener):getPlayerObject()
	
	local xpAmount = PlayerObject(pAwakenerGhost):getExperience("rp_general")
	
	if(xpAmount < 2400) then
		CreatureObject(pPlayer):sendSystemMessage("The connection is lost, as they have lost their ability to awaken you.")
		return
	end
	
	local targetName = CreatureObject(pPlayer):getFirstName()
	
	CreatureObject(pAwakener):awardExperience("rp_general", -2400, true)
	CreatureObject(pAwakener):sendSystemMessage("You have awoken " .. targetName .. " to their connection to the Force!")
	--Become Aware!
	self:setForceAware(pPlayer)	
	--]]
end

function BorForce:promptAwakenSelf(pPlayer) 
	if (pPlayer == nil) then
		return
	end
	
	--[[ Disable awakening other than by DM
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01")) then
		CreatureObject(pPlayer):sendSystemMessage("You are already well aware of your connection to the Force. Go forth and seek training on how to use it.")
		return
	end
	
	--See if in range of force Rich Location
	local playerX = SceneObject(pPlayer):getWorldPositionX()
	local playerY = SceneObject(pPlayer):getWorldPositionY()
	local zoneName = SceneObject(pPlayer):getZoneName()
	
	local inRange = false
	
	for i,v in ipairs(self.forceRichLocations) do
		if(zoneName == v[1]) then
			local distance = math.sqrt((v[2] - playerX) ^ 2 + (v[3] - playerY) ^ 2)
			if(distance <= v[4]) then
				inRange = true
			end
		end
	end
	
	if(inRange) then
		--See if I have the exp to do it
		local xpAmount = PlayerObject(pGhost):getExperience("rp_general")
		if(xpAmount >= 24000) then
			--If all is true, prompt to accept
			local sui = SuiMessageBox.new("BorForce", "setForceAwareByLocationCallback")
			sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
			sui.setTitle("Communing with the Force")
			sui.setPrompt("As you reach out, and quiet your mind, you hear the whispers of something powerful. You are on the precipice. Do you go forward? (Cost: 24,000 Roleplay Experience)")
			sui.setOkButtonText("Yes")
			sui.setCancelButtonText("No")
			local pageId = sui.sendTo(pPlayer)
		else 
			CreatureObject(pPlayer):sendSystemMessage("You don't have enough experience to become aware of the Force in this manner. Without a tool to assist, it requires 24,000 experience.")
		end
	else 
		CreatureObject(pPlayer):sendSystemMessage("You don't quite feel anything truly special here. Perhaps somewhere more steeped in the Force?")
	end
	--]]
end

function BorForce:awakenViaHolocron(pPlayer, pObject)
	if (pPlayer == nil) then
		return
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	--[[Disable holocron usage
	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01")) then
		CreatureObject(pPlayer):sendSystemMessage("You are already well aware of your connection to the Force. Go forth and seek training on how to use it.")
		return
	end
	
	local xpAmount = PlayerObject(pGhost):getExperience("rp_general")
	
	
	if(xpAmount >= 24000) then
		--If all is true, prompt to accept
		local sui = SuiMessageBox.new("BorForce", "setForceAwareByHolocronCallback")
		sui.setTargetNetworkId(SceneObject(pGhost):getObjectID())
		sui.setTitle("Communing with the Force")
		sui.setPrompt("The Holocron lights up, and a small figure appears atop its frame. \"I have much to teach you. Sit a while, and listen...\"\n\nDo you stay and listen? (Cost: 24,000 Roleplay Experience)")
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pPlayer)
	else 
		CreatureObject(pPlayer):sendSystemMessage("The Holocron glows briefly in your hand. You are not yet ready...")
	end
	--]]
end

function BorForce:setForceAwareByLocationCallback(pPlayer, pSui, eventIndex, args)
	if (pPlayer == nil) then
		return
	end
	--[[ Disable awakening other than by DM
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end

	local xpAmount = PlayerObject(pGhost):getExperience("rp_general")
	if(xpAmount >= 24000) then
		CreatureObject(pPlayer):awardExperience("rp_general", -24000, false)
		--Become Aware!
		self:setForceAware(pPlayer)
	else 
		CreatureObject(pPlayer):sendSystemMessage("You no longer have enough experience to push yourself beyond.")
	end
	--]]
end

function BorForce:setForceAwareByHolocronCallback(pPlayer, pSui, eventIndex, args)
	if (pPlayer == nil) then
		return
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end
	
	--[[Disable holocron usage
	local xpAmount = PlayerObject(pGhost):getExperience("rp_general")
	if(xpAmount >= 20000) then
		CreatureObject(pPlayer):awardExperience("rp_general", -20000, false)
		--Become Aware!
		self:setForceAware(pPlayer)
	else 
		CreatureObject(pPlayer):sendSystemMessage("You no longer have enough experience to learn the lesson.")
	end
	--]]
end

function BorForce:setForceAware(pPlayer)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return
	end	
	--Set Jedi State
	PlayerObject(pGhost):setJediState(2)
	--Give Skill
	awardSkill(pPlayer, "rp_force_prog_rank_01")
	--Send Message
	CreatureObject(pPlayer):sendSystemMessage("There is something beyond yourself, and you can hear its call. The Force speaks to you, and you have begun the path toward your destiny.")
	--Play Music
	CreatureObject(pPlayer):playMusicMessage("sound/mus_rp_force_aware.snd")
end




function BorForce:dmTrainAlter(pPlayer, pSui, eventIndex, args)
	if (pPlayer == nil) then
		return
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end

	--local targetID = CreatureObject(pPlayer):getTargetID()
	--local pTarget = getSceneObject(targetID)

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid target, must be a valid player.")
		return
	end

	--local targetGhost = CreatureObject(pTarget):getPlayerObject()

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_novice") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not Force Sensitive.")
		return
	end
	
	local skillToLearn = "unknown"
	local baseXpCost = 0
	local skillRank = 0
	local prettyName = "unknown"

	--Get current skill rank
	if(CreatureObject(pPlayer):hasSkill("rp_alter_master") == true) then
		skillToLearn = "already_mastered"
		CreatureObject(pPlayer):sendSystemMessage("You already have rank 10 in this skill.")
		return
	elseif (CreatureObject(pPlayer):hasSkill("rp_alter_b04") == true) then
		skillToLearn = "rp_alter_master"
		baseXpCost = 45000
		skillRank = 10
		prettyName = "Alter X"
	elseif (CreatureObject(pPlayer):hasSkill("rp_alter_b03") == true) then
		skillToLearn = "rp_alter_b04"
		baseXpCost = 35000
		skillRank = 9
		prettyName = "Alter IX"
	elseif (CreatureObject(pPlayer):hasSkill("rp_alter_b02") == true) then
		skillToLearn = "rp_alter_b03"
		baseXpCost = 25000
		skillRank = 8
		prettyName = "Alter VIII"
	elseif (CreatureObject(pPlayer):hasSkill("rp_alter_b01") == true) then
		skillToLearn = "rp_alter_b02"
		baseXpCost = 15000
		skillRank = 7
		prettyName = "Alter VII"
	elseif (CreatureObject(pPlayer):hasSkill("rp_alter_a04") == true) then
		skillToLearn = "rp_alter_b01"
		baseXpCost = 10000
		skillRank = 6
		prettyName = "Alter VI"
	elseif (CreatureObject(pPlayer):hasSkill("rp_alter_a03") == true) then
		skillToLearn = "rp_alter_a04"
		baseXpCost = 5000
		skillRank = 5
		prettyName = "Alter V"
	elseif (CreatureObject(pPlayer):hasSkill("rp_alter_a02") == true) then
		skillToLearn = "rp_alter_a03"
		baseXpCost = 4000
		skillRank = 4
		prettyName = "Alter IV"
	elseif (CreatureObject(pPlayer):hasSkill("rp_alter_a01") == true) then
		skillToLearn = "rp_alter_a02"
		baseXpCost = 3000
		skillRank = 3
		prettyName = "Alter III"
	elseif (CreatureObject(pPlayer):hasSkill("rp_alter_novice") == true) then
		skillToLearn = "rp_alter_a01"
		baseXpCost = 2000
		skillRank = 2
		prettyName = "Alter II"
	else
		skillToLearn = "rp_alter_novice"
		baseXpCost = 1000
		skillRank = 1
		prettyName = "Alter I"
	end

	if (skillToLearn == "unknown") then
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong in determining your skill level.")
		return
	end

	local totalxpCost = baseXpCost
	local attributeRank = 0
	if(CreatureObject(pPlayer):hasSkill("rp_mindfulness_master") == true) then
		attributeRank = 10
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_b04") == true) then
		attributeRank = 9
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_b03") == true) then
		attributeRank = 8
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_b02") == true) then
		attributeRank = 7
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_b01") == true) then
		attributeRank = 6
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_a04") == true) then
		attributeRank = 5
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_a03") == true) then
		attributeRank = 4
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_a02") == true) then
		attributeRank = 3
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_a01") == true) then
		attributeRank = 2
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_novice") == true) then
		attributeRank = 1
	else
		CreatureObject(pPlayer):sendSystemMessage("You somehow don't have a Mindfulness attribute. That's not right.")
		return
	end


	local attSkillDiff = skillRank - attributeRank
	if(attSkillDiff > 0) then
		totalxpCost = attSkillDiff * 2 * baseXpCost
	end

	local capRemaining = PlayerObject(pGhost):getExperience("rp_frc_skill_cap")
	
	if (capRemaining <= 0) then
		CreatureObject(pPlayer):sendSystemMessage("You have already learned the maximum number of force skills that you can (ie. Force Skill Cap is zero).")
		return
	else
		local xpAmount = PlayerObject(pGhost):getExperience("rp_general")
		
		if(xpAmount >= totalxpCost) then
			local negativeCost = totalxpCost * -1
			CreatureObject(pPlayer):awardExperience("rp_general", negativeCost, false)
			CreatureObject(pPlayer):awardExperience("rp_frc_skill_cap", -1, false)
			awardSkill(pPlayer, skillToLearn)
			CreatureObject(pPlayer):sendSystemMessage("You have learned " .. prettyName .. " (" .. skillToLearn .. ")!")
			
			if(attSkillDiff > 0) then
				CreatureObject(pPlayer):sendSystemMessage("Due to insufficient Mindfulness, you have been charged an increased " .. totalxpCost .. " and one force skill capacity for this")
			else
				CreatureObject(pPlayer):sendSystemMessage("You have sufficient Mindfulness and have been charged " .. totalxpCost .. " and one force skill capacity for this")
			end
		else
			if(attSkillDiff > 0) then
				CreatureObject(pPlayer):sendSystemMessage("You do not have sufficient XP to learn this skill. " .. prettyName .. " costs " .. totalxpCost .. ". Due to insufficient Mindfulness, this is increased from its base cost of " .. baseXpCost .. ".")
			else
				CreatureObject(pPlayer):sendSystemMessage("You do not have sufficient XP to learn this skill. " .. prettyName .. " costs " .. totalxpCost .. ".")
			end
		end
	end
end




function BorForce:dmTrainControl(pPlayer, pSui, eventIndex, args)
	if (pPlayer == nil) then
		return
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end

	--local targetID = CreatureObject(pPlayer):getTargetID()
	--local pTarget = getSceneObject(targetID)

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid target, must be a valid player.")
		return
	end

	--local targetGhost = CreatureObject(pTarget):getPlayerObject()

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_novice") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not Force Sensitive.")
		return
	end
	
	local skillToLearn = "unknown"
	local baseXpCost = 0
	local skillRank = 0
	local prettyName = "unknown"

	--Get current skill rank
	if(CreatureObject(pPlayer):hasSkill("rp_control_master") == true) then
		skillToLearn = "already_mastered"
		CreatureObject(pPlayer):sendSystemMessage("You already have rank 10 in this skill.")
		return
	elseif (CreatureObject(pPlayer):hasSkill("rp_control_b04") == true) then
		skillToLearn = "rp_control_master"
		baseXpCost = 45000
		skillRank = 10
		prettyName = "Control X"
	elseif (CreatureObject(pPlayer):hasSkill("rp_control_b03") == true) then
		skillToLearn = "rp_control_b04"
		baseXpCost = 35000
		skillRank = 9
		prettyName = "Control IX"
	elseif (CreatureObject(pPlayer):hasSkill("rp_control_b02") == true) then
		skillToLearn = "rp_control_b03"
		baseXpCost = 25000
		skillRank = 8
		prettyName = "Control VIII"
	elseif (CreatureObject(pPlayer):hasSkill("rp_control_b01") == true) then
		skillToLearn = "rp_control_b02"
		baseXpCost = 15000
		skillRank = 7
		prettyName = "Control VII"
	elseif (CreatureObject(pPlayer):hasSkill("rp_control_a04") == true) then
		skillToLearn = "rp_control_b01"
		baseXpCost = 10000
		skillRank = 6
		prettyName = "Control VI"
	elseif (CreatureObject(pPlayer):hasSkill("rp_control_a03") == true) then
		skillToLearn = "rp_control_a04"
		baseXpCost = 5000
		skillRank = 5
		prettyName = "Control V"
	elseif (CreatureObject(pPlayer):hasSkill("rp_control_a02") == true) then
		skillToLearn = "rp_control_a03"
		baseXpCost = 4000
		skillRank = 4
		prettyName = "Control IV"
	elseif (CreatureObject(pPlayer):hasSkill("rp_control_a01") == true) then
		skillToLearn = "rp_control_a02"
		baseXpCost = 3000
		skillRank = 3
		prettyName = "Control III"
	elseif (CreatureObject(pPlayer):hasSkill("rp_control_novice") == true) then
		skillToLearn = "rp_control_a01"
		baseXpCost = 2000
		skillRank = 2
		prettyName = "Control II"
	else
		skillToLearn = "rp_control_novice"
		baseXpCost = 1000
		skillRank = 1
		prettyName = "Control I"
	end

	if (skillToLearn == "unknown") then
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong in determining your skill level.")
		return
	end

	local totalxpCost = baseXpCost
	local attributeRank = 0
	if(CreatureObject(pPlayer):hasSkill("rp_mindfulness_master") == true) then
		attributeRank = 10
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_b04") == true) then
		attributeRank = 9
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_b03") == true) then
		attributeRank = 8
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_b02") == true) then
		attributeRank = 7
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_b01") == true) then
		attributeRank = 6
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_a04") == true) then
		attributeRank = 5
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_a03") == true) then
		attributeRank = 4
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_a02") == true) then
		attributeRank = 3
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_a01") == true) then
		attributeRank = 2
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_novice") == true) then
		attributeRank = 1
	else
		CreatureObject(pPlayer):sendSystemMessage("You somehow don't have a Mindfulness attribute. That's not right.")
		return
	end


	local attSkillDiff = skillRank - attributeRank
	if(attSkillDiff > 0) then
		totalxpCost = attSkillDiff * 2 * baseXpCost
	end

	local capRemaining = PlayerObject(pGhost):getExperience("rp_frc_skill_cap")
	
	if (capRemaining <= 0) then
		CreatureObject(pPlayer):sendSystemMessage("You have already learned the maximum number of force skills that you can (ie. Force Skill Cap is zero).")
		return
	else
		local xpAmount = PlayerObject(pGhost):getExperience("rp_general")
		
		if(xpAmount >= totalxpCost) then
			local negativeCost = totalxpCost * -1
			CreatureObject(pPlayer):awardExperience("rp_general", negativeCost, false)
			CreatureObject(pPlayer):awardExperience("rp_frc_skill_cap", -1, false)
			awardSkill(pPlayer, skillToLearn)
			CreatureObject(pPlayer):sendSystemMessage("You have learned " .. prettyName .. " (" .. skillToLearn .. ")!")
			
			if(attSkillDiff > 0) then
				CreatureObject(pPlayer):sendSystemMessage("Due to insufficient Mindfulness, you have been charged an increased " .. totalxpCost .. " and one force skill capacity for this")
			else
				CreatureObject(pPlayer):sendSystemMessage("You have sufficient Mindfulness and have been charged " .. totalxpCost .. " and one force skill capacity for this")
			end
		else
			if(attSkillDiff > 0) then
				CreatureObject(pPlayer):sendSystemMessage("You do not have sufficient XP to learn this skill. " .. prettyName .. " costs " .. totalxpCost .. ". Due to insufficient Mindfulness, this is increased from its base cost of " .. baseXpCost .. ".")
			else
				CreatureObject(pPlayer):sendSystemMessage("You do not have sufficient XP to learn this skill. " .. prettyName .. " costs " .. totalxpCost .. ".")
			end
		end
	end
end





function BorForce:dmTrainInward(pPlayer, pSui, eventIndex, args)
	if (pPlayer == nil) then
		return
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end

	--local targetID = CreatureObject(pPlayer):getTargetID()
	--local pTarget = getSceneObject(targetID)

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid target, must be a valid player.")
		return
	end

	--local targetGhost = CreatureObject(pTarget):getPlayerObject()

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_novice") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not Force Sensitive.")
		return
	end
	
	local skillToLearn = "unknown"
	local baseXpCost = 0
	local skillRank = 0
	local prettyName = "unknown"

	--Get current skill rank
	if(CreatureObject(pPlayer):hasSkill("rp_inward_master") == true) then
		skillToLearn = "already_mastered"
		CreatureObject(pPlayer):sendSystemMessage("You already have rank 10 in this skill.")
		return
	elseif (CreatureObject(pPlayer):hasSkill("rp_inward_b04") == true) then
		skillToLearn = "rp_inward_master"
		baseXpCost = 45000
		skillRank = 10
		prettyName = "Inward X"
	elseif (CreatureObject(pPlayer):hasSkill("rp_inward_b03") == true) then
		skillToLearn = "rp_inward_b04"
		baseXpCost = 35000
		skillRank = 9
		prettyName = "Inward IX"
	elseif (CreatureObject(pPlayer):hasSkill("rp_inward_b02") == true) then
		skillToLearn = "rp_inward_b03"
		baseXpCost = 25000
		skillRank = 8
		prettyName = "Inward VIII"
	elseif (CreatureObject(pPlayer):hasSkill("rp_inward_b01") == true) then
		skillToLearn = "rp_inward_b02"
		baseXpCost = 15000
		skillRank = 7
		prettyName = "Inward VII"
	elseif (CreatureObject(pPlayer):hasSkill("rp_inward_a04") == true) then
		skillToLearn = "rp_inward_b01"
		baseXpCost = 10000
		skillRank = 6
		prettyName = "Inward VI"
	elseif (CreatureObject(pPlayer):hasSkill("rp_inward_a03") == true) then
		skillToLearn = "rp_inward_a04"
		baseXpCost = 5000
		skillRank = 5
		prettyName = "Inward V"
	elseif (CreatureObject(pPlayer):hasSkill("rp_inward_a02") == true) then
		skillToLearn = "rp_inward_a03"
		baseXpCost = 4000
		skillRank = 4
		prettyName = "Inward IV"
	elseif (CreatureObject(pPlayer):hasSkill("rp_inward_a01") == true) then
		skillToLearn = "rp_inward_a02"
		baseXpCost = 3000
		skillRank = 3
		prettyName = "Inward III"
	elseif (CreatureObject(pPlayer):hasSkill("rp_inward_novice") == true) then
		skillToLearn = "rp_inward_a01"
		baseXpCost = 2000
		skillRank = 2
		prettyName = "Inward II"
	else
		skillToLearn = "rp_inward_novice"
		baseXpCost = 1000
		skillRank = 1
		prettyName = "Inward I"
	end

	if (skillToLearn == "unknown") then
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong in determining your skill level.")
		return
	end

	local totalxpCost = baseXpCost
	local attributeRank = 0
	if(CreatureObject(pPlayer):hasSkill("rp_mindfulness_master") == true) then
		attributeRank = 10
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_b04") == true) then
		attributeRank = 9
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_b03") == true) then
		attributeRank = 8
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_b02") == true) then
		attributeRank = 7
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_b01") == true) then
		attributeRank = 6
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_a04") == true) then
		attributeRank = 5
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_a03") == true) then
		attributeRank = 4
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_a02") == true) then
		attributeRank = 3
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_a01") == true) then
		attributeRank = 2
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_novice") == true) then
		attributeRank = 1
	else
		CreatureObject(pPlayer):sendSystemMessage("You somehow don't have a Mindfulness attribute. That's not right.")
		return
	end


	local attSkillDiff = skillRank - attributeRank
	if(attSkillDiff > 0) then
		totalxpCost = attSkillDiff * 2 * baseXpCost
	end

	local capRemaining = PlayerObject(pGhost):getExperience("rp_frc_skill_cap")
	
	if (capRemaining <= 0) then
		CreatureObject(pPlayer):sendSystemMessage("You have already learned the maximum number of force skills that you can (ie. Force Skill Cap is zero).")
		return
	else
		local xpAmount = PlayerObject(pGhost):getExperience("rp_general")
		
		if(xpAmount >= totalxpCost) then
			local negativeCost = totalxpCost * -1
			CreatureObject(pPlayer):awardExperience("rp_general", negativeCost, false)
			CreatureObject(pPlayer):awardExperience("rp_frc_skill_cap", -1, false)
			awardSkill(pPlayer, skillToLearn)
			CreatureObject(pPlayer):sendSystemMessage("You have learned " .. prettyName .. " (" .. skillToLearn .. ")!")
			
			if(attSkillDiff > 0) then
				CreatureObject(pPlayer):sendSystemMessage("Due to insufficient Mindfulness, you have been charged an increased " .. totalxpCost .. " and one force skill capacity for this")
			else
				CreatureObject(pPlayer):sendSystemMessage("You have sufficient Mindfulness and have been charged " .. totalxpCost .. " and one force skill capacity for this")
			end
		else
			if(attSkillDiff > 0) then
				CreatureObject(pPlayer):sendSystemMessage("You do not have sufficient XP to learn this skill. " .. prettyName .. " costs " .. totalxpCost .. ". Due to insufficient Mindfulness, this is increased from its base cost of " .. baseXpCost .. ".")
			else
				CreatureObject(pPlayer):sendSystemMessage("You do not have sufficient XP to learn this skill. " .. prettyName .. " costs " .. totalxpCost .. ".")
			end
		end
	end
end





function BorForce:dmTrainLightning(pPlayer, pSui, eventIndex, args)
	if (pPlayer == nil) then
		return
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end

	--local targetID = CreatureObject(pPlayer):getTargetID()
	--local pTarget = getSceneObject(targetID)

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid target, must be a valid player.")
		return
	end

	--local targetGhost = CreatureObject(pTarget):getPlayerObject()

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_novice") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not Force Sensitive.")
		return
	end
	
	local skillToLearn = "unknown"
	local baseXpCost = 0
	local skillRank = 0
	local prettyName = "unknown"

	--Get current skill rank
	if(CreatureObject(pPlayer):hasSkill("rp_lightning_master") == true) then
		skillToLearn = "already_mastered"
		CreatureObject(pPlayer):sendSystemMessage("You already have rank 10 in this skill.")
		return
	elseif (CreatureObject(pPlayer):hasSkill("rp_lightning_b04") == true) then
		skillToLearn = "rp_lightning_master"
		baseXpCost = 45000
		skillRank = 10
		prettyName = "Lightning X"
	elseif (CreatureObject(pPlayer):hasSkill("rp_lightning_b03") == true) then
		skillToLearn = "rp_lightning_b04"
		baseXpCost = 35000
		skillRank = 9
		prettyName = "Lightning IX"
	elseif (CreatureObject(pPlayer):hasSkill("rp_lightning_b02") == true) then
		skillToLearn = "rp_lightning_b03"
		baseXpCost = 25000
		skillRank = 8
		prettyName = "Lightning VIII"
	elseif (CreatureObject(pPlayer):hasSkill("rp_lightning_b01") == true) then
		skillToLearn = "rp_lightning_b02"
		baseXpCost = 15000
		skillRank = 7
		prettyName = "Lightning VII"
	elseif (CreatureObject(pPlayer):hasSkill("rp_lightning_a04") == true) then
		skillToLearn = "rp_lightning_b01"
		baseXpCost = 10000
		skillRank = 6
		prettyName = "Lightning VI"
	elseif (CreatureObject(pPlayer):hasSkill("rp_lightning_a03") == true) then
		skillToLearn = "rp_lightning_a04"
		baseXpCost = 5000
		skillRank = 5
		prettyName = "Lightning V"
	elseif (CreatureObject(pPlayer):hasSkill("rp_lightning_a02") == true) then
		skillToLearn = "rp_lightning_a03"
		baseXpCost = 4000
		skillRank = 4
		prettyName = "Lightning IV"
	elseif (CreatureObject(pPlayer):hasSkill("rp_lightning_a01") == true) then
		skillToLearn = "rp_lightning_a02"
		baseXpCost = 3000
		skillRank = 3
		prettyName = "Lightning III"
	elseif (CreatureObject(pPlayer):hasSkill("rp_lightning_novice") == true) then
		skillToLearn = "rp_lightning_a01"
		baseXpCost = 2000
		skillRank = 2
		prettyName = "Lightning II"
	else
		skillToLearn = "rp_lightning_novice"
		baseXpCost = 1000
		skillRank = 1
		prettyName = "Lightning I"
	end

	if (skillToLearn == "unknown") then
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong in determining your skill level.")
		return
	end

	local totalxpCost = baseXpCost
	local attributeRank = 0
	if(CreatureObject(pPlayer):hasSkill("rp_constitution_master") == true) then
		attributeRank = 10
	elseif (CreatureObject(pPlayer):hasSkill("rp_constitution_b04") == true) then
		attributeRank = 9
	elseif (CreatureObject(pPlayer):hasSkill("rp_constitution_b03") == true) then
		attributeRank = 8
	elseif (CreatureObject(pPlayer):hasSkill("rp_constitution_b02") == true) then
		attributeRank = 7
	elseif (CreatureObject(pPlayer):hasSkill("rp_constitution_b01") == true) then
		attributeRank = 6
	elseif (CreatureObject(pPlayer):hasSkill("rp_constitution_a04") == true) then
		attributeRank = 5
	elseif (CreatureObject(pPlayer):hasSkill("rp_constitution_a03") == true) then
		attributeRank = 4
	elseif (CreatureObject(pPlayer):hasSkill("rp_constitution_a02") == true) then
		attributeRank = 3
	elseif (CreatureObject(pPlayer):hasSkill("rp_constitution_a01") == true) then
		attributeRank = 2
	elseif (CreatureObject(pPlayer):hasSkill("rp_constitution_novice") == true) then
		attributeRank = 1
	else
		CreatureObject(pPlayer):sendSystemMessage("You somehow don't have a Constitution attribute. That's not right.")
		return
	end


	local attSkillDiff = skillRank - attributeRank
	if(attSkillDiff > 0) then
		totalxpCost = attSkillDiff * 2 * baseXpCost
	end

	local capRemaining = PlayerObject(pGhost):getExperience("rp_frc_skill_cap")
	
	if (capRemaining <= 0) then
		CreatureObject(pPlayer):sendSystemMessage("You have already learned the maximum number of force skills that you can (ie. Force Skill Cap is zero).")
		return
	else
		local xpAmount = PlayerObject(pGhost):getExperience("rp_general")
		
		if(xpAmount >= totalxpCost) then
			local negativeCost = totalxpCost * -1
			CreatureObject(pPlayer):awardExperience("rp_general", negativeCost, false)
			CreatureObject(pPlayer):awardExperience("rp_frc_skill_cap", -1, false)
			awardSkill(pPlayer, skillToLearn)
			CreatureObject(pPlayer):sendSystemMessage("You have learned " .. prettyName .. " (" .. skillToLearn .. ")!")
			
			if(attSkillDiff > 0) then
				CreatureObject(pPlayer):sendSystemMessage("Due to insufficient Constitution, you have been charged an increased " .. totalxpCost .. " and one force skill capacity for this")
			else
				CreatureObject(pPlayer):sendSystemMessage("You have sufficient Constitution and have been charged " .. totalxpCost .. " and one force skill capacity for this")
			end
		else
			if(attSkillDiff > 0) then
				CreatureObject(pPlayer):sendSystemMessage("You do not have sufficient XP to learn this skill. " .. prettyName .. " costs " .. totalxpCost .. ". Due to insufficient Mindfulness, this is increased from its base cost of " .. baseXpCost .. ".")
			else
				CreatureObject(pPlayer):sendSystemMessage("You do not have sufficient XP to learn this skill. " .. prettyName .. " costs " .. totalxpCost .. ".")
			end
		end
	end
end





function BorForce:dmTrainLightsaber(pPlayer, pSui, eventIndex, args)
	if (pPlayer == nil) then
		return
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end

	--local targetID = CreatureObject(pPlayer):getTargetID()
	--local pTarget = getSceneObject(targetID)

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid target, must be a valid player.")
		return
	end

	--local targetGhost = CreatureObject(pTarget):getPlayerObject()

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_novice") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not Force Sensitive.")
		return
	end
	
	local skillToLearn = "unknown"
	local baseXpCost = 0
	local skillRank = 0
	local prettyName = "unknown"

	--Get current skill rank
	if(CreatureObject(pPlayer):hasSkill("rp_lightsaber_master") == true) then
		skillToLearn = "already_mastered"
		CreatureObject(pPlayer):sendSystemMessage("You already have rank 10 in this skill.")
		return
	elseif (CreatureObject(pPlayer):hasSkill("rp_lightsaber_b04") == true) then
		skillToLearn = "rp_lightsaber_master"
		baseXpCost = 45000
		skillRank = 10
		prettyName = "Lightsaber X"
	elseif (CreatureObject(pPlayer):hasSkill("rp_lightsaber_b03") == true) then
		skillToLearn = "rp_lightsaber_b04"
		baseXpCost = 35000
		skillRank = 9
		prettyName = "Lightsaber IX"
	elseif (CreatureObject(pPlayer):hasSkill("rp_lightsaber_b02") == true) then
		skillToLearn = "rp_lightsaber_b03"
		baseXpCost = 25000
		skillRank = 8
		prettyName = "Lightsaber VIII"
	elseif (CreatureObject(pPlayer):hasSkill("rp_lightsaber_b01") == true) then
		skillToLearn = "rp_lightsaber_b02"
		baseXpCost = 15000
		skillRank = 7
		prettyName = "Lightsaber VII"
	elseif (CreatureObject(pPlayer):hasSkill("rp_lightsaber_a04") == true) then
		skillToLearn = "rp_lightsaber_b01"
		baseXpCost = 10000
		skillRank = 6
		prettyName = "Lightsaber VI"
	elseif (CreatureObject(pPlayer):hasSkill("rp_lightsaber_a03") == true) then
		skillToLearn = "rp_lightsaber_a04"
		baseXpCost = 5000
		skillRank = 5
		prettyName = "Lightsaber V"
	elseif (CreatureObject(pPlayer):hasSkill("rp_lightsaber_a02") == true) then
		skillToLearn = "rp_lightsaber_a03"
		baseXpCost = 4000
		skillRank = 4
		prettyName = "Lightsaber IV"
	elseif (CreatureObject(pPlayer):hasSkill("rp_lightsaber_a01") == true) then
		skillToLearn = "rp_lightsaber_a02"
		baseXpCost = 3000
		skillRank = 3
		prettyName = "Lightsaber III"
	elseif (CreatureObject(pPlayer):hasSkill("rp_lightsaber_novice") == true) then
		skillToLearn = "rp_lightsaber_a01"
		baseXpCost = 2000
		skillRank = 2
		prettyName = "Lightsaber II"
	else
		skillToLearn = "rp_lightsaber_novice"
		baseXpCost = 1000
		skillRank = 1
		prettyName = "Lightsaber I"
	end

	if (skillToLearn == "unknown") then
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong in determining your skill level.")
		return
	end

	local totalxpCost = baseXpCost
	local attributeRank = 0
	if(CreatureObject(pPlayer):hasSkill("rp_awareness_master") == true) then
		attributeRank = 10
	elseif (CreatureObject(pPlayer):hasSkill("rp_awareness_b04") == true) then
		attributeRank = 9
	elseif (CreatureObject(pPlayer):hasSkill("rp_awareness_b03") == true) then
		attributeRank = 8
	elseif (CreatureObject(pPlayer):hasSkill("rp_awareness_b02") == true) then
		attributeRank = 7
	elseif (CreatureObject(pPlayer):hasSkill("rp_awareness_b01") == true) then
		attributeRank = 6
	elseif (CreatureObject(pPlayer):hasSkill("rp_awareness_a04") == true) then
		attributeRank = 5
	elseif (CreatureObject(pPlayer):hasSkill("rp_awareness_a03") == true) then
		attributeRank = 4
	elseif (CreatureObject(pPlayer):hasSkill("rp_awareness_a02") == true) then
		attributeRank = 3
	elseif (CreatureObject(pPlayer):hasSkill("rp_awareness_a01") == true) then
		attributeRank = 2
	elseif (CreatureObject(pPlayer):hasSkill("rp_awareness_novice") == true) then
		attributeRank = 1
	else
		CreatureObject(pPlayer):sendSystemMessage("You somehow don't have an Awareness attribute. That's not right.")
		return
	end


	local attSkillDiff = skillRank - attributeRank
	if(attSkillDiff > 0) then
		totalxpCost = attSkillDiff * 2 * baseXpCost
	end

	local capRemaining = PlayerObject(pGhost):getExperience("rp_frc_skill_cap")
	
	if (capRemaining <= 0) then
		CreatureObject(pPlayer):sendSystemMessage("You have already learned the maximum number of force skills that you can (ie. Force Skill Cap is zero).")
		return
	else
		local xpAmount = PlayerObject(pGhost):getExperience("rp_general")
		
		if(xpAmount >= totalxpCost) then
			local negativeCost = totalxpCost * -1
			CreatureObject(pPlayer):awardExperience("rp_general", negativeCost, false)
			CreatureObject(pPlayer):awardExperience("rp_frc_skill_cap", -1, false)
			awardSkill(pPlayer, skillToLearn)
			CreatureObject(pPlayer):sendSystemMessage("You have learned " .. prettyName .. " (" .. skillToLearn .. ")!")
			
			if(attSkillDiff > 0) then
				CreatureObject(pPlayer):sendSystemMessage("Due to insufficient Awareness, you have been charged an increased " .. totalxpCost .. " and one force skill capacity for this")
			else
				CreatureObject(pPlayer):sendSystemMessage("You have sufficient Awareness and have been charged " .. totalxpCost .. " and one force skill capacity for this")
			end
		else
			if(attSkillDiff > 0) then
				CreatureObject(pPlayer):sendSystemMessage("You do not have sufficient XP to learn this skill. " .. prettyName .. " costs " .. totalxpCost .. ". Due to insufficient Mindfulness, this is increased from its base cost of " .. baseXpCost .. ".")
			else
				CreatureObject(pPlayer):sendSystemMessage("You do not have sufficient XP to learn this skill. " .. prettyName .. " costs " .. totalxpCost .. ".")
			end
		end
	end
end





function BorForce:dmTrainSense(pPlayer, pSui, eventIndex, args)
	if (pPlayer == nil) then
		return
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end

	--local targetID = CreatureObject(pPlayer):getTargetID()
	--local pTarget = getSceneObject(targetID)

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid target, must be a valid player.")
		return
	end

	--local targetGhost = CreatureObject(pTarget):getPlayerObject()

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_novice") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not Force Sensitive.")
		return
	end
	
	local skillToLearn = "unknown"
	local baseXpCost = 0
	local skillRank = 0
	local prettyName = "unknown"

	--Get current skill rank
	if(CreatureObject(pPlayer):hasSkill("rp_sense_master") == true) then
		skillToLearn = "already_mastered"
		CreatureObject(pPlayer):sendSystemMessage("You already have rank 10 in this skill.")
		return
	elseif (CreatureObject(pPlayer):hasSkill("rp_sense_b04") == true) then
		skillToLearn = "rp_sense_master"
		baseXpCost = 45000
		skillRank = 10
		prettyName = "Sense X"
	elseif (CreatureObject(pPlayer):hasSkill("rp_sense_b03") == true) then
		skillToLearn = "rp_sense_b04"
		baseXpCost = 35000
		skillRank = 9
		prettyName = "Sense IX"
	elseif (CreatureObject(pPlayer):hasSkill("rp_sense_b02") == true) then
		skillToLearn = "rp_sense_b03"
		baseXpCost = 25000
		skillRank = 8
		prettyName = "Sense VIII"
	elseif (CreatureObject(pPlayer):hasSkill("rp_sense_b01") == true) then
		skillToLearn = "rp_sense_b02"
		baseXpCost = 15000
		skillRank = 7
		prettyName = "Sense VII"
	elseif (CreatureObject(pPlayer):hasSkill("rp_sense_a04") == true) then
		skillToLearn = "rp_sense_b01"
		baseXpCost = 10000
		skillRank = 6
		prettyName = "Sense VI"
	elseif (CreatureObject(pPlayer):hasSkill("rp_sense_a03") == true) then
		skillToLearn = "rp_sense_a04"
		baseXpCost = 5000
		skillRank = 5
		prettyName = "Sense V"
	elseif (CreatureObject(pPlayer):hasSkill("rp_sense_a02") == true) then
		skillToLearn = "rp_sense_a03"
		baseXpCost = 4000
		skillRank = 4
		prettyName = "Sense IV"
	elseif (CreatureObject(pPlayer):hasSkill("rp_sense_a01") == true) then
		skillToLearn = "rp_sense_a02"
		baseXpCost = 3000
		skillRank = 3
		prettyName = "Sense III"
	elseif (CreatureObject(pPlayer):hasSkill("rp_sense_novice") == true) then
		skillToLearn = "rp_sense_a01"
		baseXpCost = 2000
		skillRank = 2
		prettyName = "Sense II"
	else
		skillToLearn = "rp_sense_novice"
		baseXpCost = 1000
		skillRank = 1
		prettyName = "Sense I"
	end

	if (skillToLearn == "unknown") then
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong in determining your skill level.")
		return
	end

	local totalxpCost = baseXpCost
	local attributeRank = 0
	if(CreatureObject(pPlayer):hasSkill("rp_mindfulness_master") == true) then
		attributeRank = 10
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_b04") == true) then
		attributeRank = 9
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_b03") == true) then
		attributeRank = 8
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_b02") == true) then
		attributeRank = 7
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_b01") == true) then
		attributeRank = 6
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_a04") == true) then
		attributeRank = 5
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_a03") == true) then
		attributeRank = 4
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_a02") == true) then
		attributeRank = 3
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_a01") == true) then
		attributeRank = 2
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_novice") == true) then
		attributeRank = 1
	else
		CreatureObject(pPlayer):sendSystemMessage("You somehow don't have a Mindfulness attribute. That's not right.")
		return
	end


	local attSkillDiff = skillRank - attributeRank
	if(attSkillDiff > 0) then
		totalxpCost = attSkillDiff * 2 * baseXpCost
	end

	local capRemaining = PlayerObject(pGhost):getExperience("rp_frc_skill_cap")
	
	if (capRemaining <= 0) then
		CreatureObject(pPlayer):sendSystemMessage("You have already learned the maximum number of force skills that you can (ie. Force Skill Cap is zero).")
		return
	else
		local xpAmount = PlayerObject(pGhost):getExperience("rp_general")
		
		if(xpAmount >= totalxpCost) then
			local negativeCost = totalxpCost * -1
			CreatureObject(pPlayer):awardExperience("rp_general", negativeCost, false)
			CreatureObject(pPlayer):awardExperience("rp_frc_skill_cap", -1, false)
			awardSkill(pPlayer, skillToLearn)
			CreatureObject(pPlayer):sendSystemMessage("You have learned " .. prettyName .. " (" .. skillToLearn .. ")!")
			
			if(attSkillDiff > 0) then
				CreatureObject(pPlayer):sendSystemMessage("Due to insufficient Mindfulness, you have been charged an increased " .. totalxpCost .. " and one force skill capacity for this")
			else
				CreatureObject(pPlayer):sendSystemMessage("You have sufficient Mindfulness and have been charged " .. totalxpCost .. " and one force skill capacity for this")
			end
		else
			if(attSkillDiff > 0) then
				CreatureObject(pPlayer):sendSystemMessage("You do not have sufficient XP to learn this skill. " .. prettyName .. " costs " .. totalxpCost .. ". Due to insufficient Mindfulness, this is increased from its base cost of " .. baseXpCost .. ".")
			else
				CreatureObject(pPlayer):sendSystemMessage("You do not have sufficient XP to learn this skill. " .. prettyName .. " costs " .. totalxpCost .. ".")
			end
		end
	end
end





function BorForce:dmTrainTelekinesis(pPlayer, pSui, eventIndex, args)
	if (pPlayer == nil) then
		return
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end

	--local targetID = CreatureObject(pPlayer):getTargetID()
	--local pTarget = getSceneObject(targetID)

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid target, must be a valid player.")
		return
	end

	--local targetGhost = CreatureObject(pTarget):getPlayerObject()

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_novice") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not Force Sensitive.")
		return
	end
	
	local skillToLearn = "unknown"
	local baseXpCost = 0
	local skillRank = 0
	local prettyName = "unknown"

	--Get current skill rank
	if(CreatureObject(pPlayer):hasSkill("rp_telekinesis_master") == true) then
		skillToLearn = "already_mastered"
		CreatureObject(pPlayer):sendSystemMessage("You already have rank 10 in this skill.")
		return
	elseif (CreatureObject(pPlayer):hasSkill("rp_telekinesis_b04") == true) then
		skillToLearn = "rp_telekinesis_master"
		baseXpCost = 45000
		skillRank = 10
		prettyName = "Telekinesis X"
	elseif (CreatureObject(pPlayer):hasSkill("rp_telekinesis_b03") == true) then
		skillToLearn = "rp_telekinesis_b04"
		baseXpCost = 35000
		skillRank = 9
		prettyName = "Telekinesis IX"
	elseif (CreatureObject(pPlayer):hasSkill("rp_telekinesis_b02") == true) then
		skillToLearn = "rp_telekinesis_b03"
		baseXpCost = 25000
		skillRank = 8
		prettyName = "Telekinesis VIII"
	elseif (CreatureObject(pPlayer):hasSkill("rp_telekinesis_b01") == true) then
		skillToLearn = "rp_telekinesis_b02"
		baseXpCost = 15000
		skillRank = 7
		prettyName = "Telekinesis VII"
	elseif (CreatureObject(pPlayer):hasSkill("rp_telekinesis_a04") == true) then
		skillToLearn = "rp_telekinesis_b01"
		baseXpCost = 10000
		skillRank = 6
		prettyName = "Telekinesis VI"
	elseif (CreatureObject(pPlayer):hasSkill("rp_telekinesis_a03") == true) then
		skillToLearn = "rp_telekinesis_a04"
		baseXpCost = 5000
		skillRank = 5
		prettyName = "Telekinesis V"
	elseif (CreatureObject(pPlayer):hasSkill("rp_telekinesis_a02") == true) then
		skillToLearn = "rp_telekinesis_a03"
		baseXpCost = 4000
		skillRank = 4
		prettyName = "Telekinesis IV"
	elseif (CreatureObject(pPlayer):hasSkill("rp_telekinesis_a01") == true) then
		skillToLearn = "rp_telekinesis_a02"
		baseXpCost = 3000
		skillRank = 3
		prettyName = "Telekinesis III"
	elseif (CreatureObject(pPlayer):hasSkill("rp_telekinesis_novice") == true) then
		skillToLearn = "rp_telekinesis_a01"
		baseXpCost = 2000
		skillRank = 2
		prettyName = "Telekinesis II"
	else
		skillToLearn = "rp_telekinesis_novice"
		baseXpCost = 1000
		skillRank = 1
		prettyName = "Telekinesis I"
	end

	if (skillToLearn == "unknown") then
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong in determining your skill level.")
		return
	end

	local totalxpCost = baseXpCost
	local attributeRank = 0
	if(CreatureObject(pPlayer):hasSkill("rp_mindfulness_master") == true) then
		attributeRank = 10
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_b04") == true) then
		attributeRank = 9
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_b03") == true) then
		attributeRank = 8
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_b02") == true) then
		attributeRank = 7
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_b01") == true) then
		attributeRank = 6
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_a04") == true) then
		attributeRank = 5
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_a03") == true) then
		attributeRank = 4
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_a02") == true) then
		attributeRank = 3
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_a01") == true) then
		attributeRank = 2
	elseif (CreatureObject(pPlayer):hasSkill("rp_mindfulness_novice") == true) then
		attributeRank = 1
	else
		CreatureObject(pPlayer):sendSystemMessage("You somehow don't have a Mindfulness attribute. That's not right.")
		return
	end


	local attSkillDiff = skillRank - attributeRank
	if(attSkillDiff > 0) then
		totalxpCost = attSkillDiff * 2 * baseXpCost
	end

	local capRemaining = PlayerObject(pGhost):getExperience("rp_frc_skill_cap")
	
	if (capRemaining <= 0) then
		CreatureObject(pPlayer):sendSystemMessage("You have already learned the maximum number of force skills that you can (ie. Force Skill Cap is zero).")
		return
	else
		local xpAmount = PlayerObject(pGhost):getExperience("rp_general")
		
		if(xpAmount >= totalxpCost) then
			local negativeCost = totalxpCost * -1
			CreatureObject(pPlayer):awardExperience("rp_general", negativeCost, false)
			CreatureObject(pPlayer):awardExperience("rp_frc_skill_cap", -1, false)
			awardSkill(pPlayer, skillToLearn)
			CreatureObject(pPlayer):sendSystemMessage("You have learned " .. prettyName .. " (" .. skillToLearn .. ")!")
			
			if(attSkillDiff > 0) then
				CreatureObject(pPlayer):sendSystemMessage("Due to insufficient Mindfulness, you have been charged an increased " .. totalxpCost .. " and one force skill capacity for this")
			else
				CreatureObject(pPlayer):sendSystemMessage("You have sufficient Mindfulness and have been charged " .. totalxpCost .. " and one force skill capacity for this")
			end
		else
			if(attSkillDiff > 0) then
				CreatureObject(pPlayer):sendSystemMessage("You do not have sufficient XP to learn this skill. " .. prettyName .. " costs " .. totalxpCost .. ". Due to insufficient Mindfulness, this is increased from its base cost of " .. baseXpCost .. ".")
			else
				CreatureObject(pPlayer):sendSystemMessage("You do not have sufficient XP to learn this skill. " .. prettyName .. " costs " .. totalxpCost .. ".")
			end
		end
	end
end





function BorForce:startForceMeditation(pPlayer) 
	--CreatureObject(pPlayer):sendSystemMessage("I am but a mirror whose only purpose is to show you what your eyes cannot yet see.")
end

function BorForce:promptForceMenu(pPlayer) 
	--CreatureObject(pPlayer):sendSystemMessage("Help: Use /rpforce awaken to reach out and try to make yourself aware of the Force.")
	
	--local suiManager = LuaSuiManager()
	--local options = {{"Make Target Force Aware", 0}, {"Spawn Lightsaber Crystal", 0}, {"Spawn Training Device", 0}, {"Spawn Lightsaber Book", 0}}
	
	--suiManager:sendListBox(pPlayer, pPlayer, "DM Force Menu", "What would you like to do?", 1, "@cancel", "", "", "BorForce", "dmMenuCallback", 32, options)
end

function BorForce:initializeHolocron(pObject)
	--Pick a random skill to assign this holocron
	local skillName = self:getRandomForceSkill(true) --TODO: Need to differentiate between sith and jedi holocrons
	local displayName = skillName:sub(1,1):upper()..skillName:sub(2):lower()
	--Set charges available (random 10 to 20)
	local charges = math.random(10,20)
	TangibleObject(pObject):setMaxCondition(charges)
	TangibleObject(pObject):setConditionDamage(0)
	--Set Name and Description of Holocron to show what skill it can do. 
	SceneObject(pObject):setCustomObjectName(displayName .. " Holocron")	
	--Set internal data
	SceneObject(pObject):setStoredString("skill", skillName)
	TangibleObject(pObject):setCustomizationVariable("/private/index_color_2", self:getSkillColor(skillName))
	
	local templateName = SceneObject(pObject):getTemplateObjectPath()
		
	if string.find(SceneObject(pObject):getTemplateObjectPath(), "_dark") ~= nil then
		SceneObject(pObject):setStoredInt("isDark", 1)
	end
end

function BorForce:initializeScroll(pObject, isBeginner)
	--Pick a random skill to assign this holocron
	local skillName = self:getRandomForceSkill(true) --TODO: Need to differentiate between sith and jedi holocrons
	local displayName = skillName:sub(1,1):upper()..skillName:sub(2):lower()
	--Set charges available (random 5 to 10)
	local charges = math.random(5,10)
	TangibleObject(pObject):setMaxCondition(charges)
	TangibleObject(pObject):setConditionDamage(0)
	
		
	--Set internal data
	SceneObject(pObject):setStoredString("skill", skillName)
	local minSkill = math.random(1,5)
	local maxSkill = math.random(minSkill + 1,10)
	
	if(isBeginner) then
		minSkill = 1
		maxSkill = 3
	end
	
	SceneObject(pObject):setStoredInt("skill_min", minSkill)
	SceneObject(pObject):setStoredInt("skill_max", maxSkill)
	
	--Set Name of Scroll to show what skill it can do. 
	SceneObject(pObject):setCustomObjectName("Scroll of " .. displayName .. " (" .. self:intToRoman(minSkill) .. " - " .. self:intToRoman(maxSkill) ..")")
	
	if string.find(SceneObject(pObject):getTemplateObjectPath(), "_dark") ~= nil then
		SceneObject(pObject):setStoredInt("isDark", 1)
	end
end

function BorForce:openHolocronMenu(pPlayer, pObject)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	--[[Disable holocron usage
	if(TangibleObject(pObject):isBroken()) then
		CreatureObject(pPlayer):sendSystemMessage("This holocron is broken, and can no longer teach anything.")
		return
	end
	
	local skillString = SceneObject(pObject):getStoredString("skill")
	--If they have the max skill, deny them
	if(CreatureObject(pPlayer):hasSkill("rp_" .. skillString .. "_master")) then
		CreatureObject(pPlayer):sendSystemMessage("There is nothing more this Holocron can teach you.")
		return
	end
	
	--If not, prompt them with simple menu asking them if they'd like to train the next level of the skill, but only if they have the exp.
	local currentSkillValue = self:getCurrentSkillLevel(pPlayer, skillString)
	local displayName = skillString:sub(1,1):upper()..skillString:sub(2):lower()
	
	local isDark = SceneObject(pObject):getStoredInt("isDark") == 1
	
	local sui = SuiMessageBox.new("BorForce", "holocronCallback")
	sui.setTargetNetworkId(SceneObject(pObject):getObjectID())
	sui.setTitle("Learning from the Holocron")
	if(isDark == true) then
		sui.setPrompt("The dark gatekeeper of the holocron speaks to you, grinning at you, tempting to teach you " .. displayName .. " Rank " .. currentSkillValue + 1 .. ". Do you wish to continue?")
	else 
		sui.setPrompt("The gatekeeper of the holocron speaks to you, offering to teach you " .. displayName .. " Rank " .. currentSkillValue + 1 .. ". Do you wish to continue?")
	end	
	sui.setOkButtonText("Yes")
	sui.setCancelButtonText("No")
	local pageId = sui.sendTo(pPlayer)
	--]]
end

function BorForce:holocronCallback(pPlayer, pSui, eventIndex, args)
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end
	
	local pPageData = LuaSuiBoxPage(pSui):getSuiPageData()

	if (pPageData == nil) then
		return
	end
	
	local suiPageData = LuaSuiPageData(pPageData)
	
	local holocronID = suiPageData:getTargetNetworkId()

	local holocronObj = getSceneObject(holocronID)
	
	if (holocronObj == nil) then
		return
	end
	--[[Disable holocron usage
	local skillString = SceneObject(holocronObj):getStoredString("skill")
	
	local currentSkillValue = self:getCurrentSkillLevel(pPlayer, skillString)
	
	local isDark = SceneObject(holocronObj):getStoredInt("isDark") == 1
	
	if(currentSkillValue < 10) then
		--Teach the skill if they have enough exp and qualify for it
		local skillToTeachName = self:getSkillName(skillString, currentSkillValue + 1)
		local skillManager = LuaSkillManager()
		
		if(skillManager:getQualifiedForRpSkill(pPlayer, skillToTeachName) == false) then
			CreatureObject(pPlayer):sendSystemMessage("You are not yet capable of learning this lesson. Consider focusing on the neccessary attributes to endure the training.")
			return
		end
		
		--CreatureObject(pPlayer):sendSystemMessage(skillToTeachName)
		
		local skillTaught = skillManager:awardSkill(pPlayer, skillToTeachName) --canLearnSkill(pPlayer, skillToTeachName)
		--Damage the Holocron
		if(skillTaught) then
			
			CreatureObject(pPlayer):sendSystemMessage("During your prolonged time with the Holocron active, it's crystalline matrix was damaged.")
			local dmg = TangibleObject(holocronObj):getConditionDamage()
			TangibleObject(holocronObj):setConditionDamage(dmg + 1)
			
			if(isDark == true) then
				--Give corruption
				self:addCorruptionPoints(pPlayer, 10)
			end
			
		else 
			CreatureObject(pPlayer):sendSystemMessage("You were not able to learn the lesson taught.")
		end
	end	
	--]]
end

function BorForce:transcribeLightsaberBookPrompt(pPlayer, pObject) 
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local sui = SuiMessageBox.new("BorForce", "transcribeSaberBookCallback")
	sui.setTargetNetworkId(SceneObject(pObject):getObjectID())
	sui.setTitle("Transcribing a Lightsaber Book")
	sui.setPrompt("After understanding how to create a lightsaber, you feel as though you can transcribe this book. Would you like to do so, and create a new book for 4,000 XP?")
	sui.setOkButtonText("Yes")
	sui.setCancelButtonText("No")
	local pageId = sui.sendTo(pPlayer)
end

function BorForce:transcribeSaberBookCallback(pPlayer, pSui, eventIndex, args)
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local pPageData = LuaSuiBoxPage(pSui):getSuiPageData()

	if (pPageData == nil) then
		return
	end
	
	local suiPageData = LuaSuiPageData(pPageData)
	
	local holocronID = suiPageData:getTargetNetworkId()

	local holocronObj = getSceneObject(holocronID)
	
	if (holocronObj == nil) then
		return
	end
	
	local xpAmount = PlayerObject(pGhost):getExperience("rp_general")
	if(xpAmount < 4000) then
		CreatureObject(pPlayer):sendSystemMessage("You do not have enough experience to transcribe into a book.")
		return
	end
	
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return 0
	end
	
	local spawnedObj = giveItem(pInventory, self.lightsaberBookTemplate, -1, true)
	if(spawnedObj == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong trying to transcribe the book. Please let a developer know.")
		return
	end
	
	local newSerial = generateSerial()
	TangibleObject(spawnedObj):setSerialNumber(newSerial)
	
	TangibleObject(spawnedObj):setCraftersName(CreatureObject(pPlayer):getFirstName())	

	CreatureObject(pPlayer):sendSystemMessage("You have successfully transcribed the book, and created a new one.")
	
	CreatureObject(pPlayer):awardExperience("rp_general", -4000, false)
end


function BorForce:openScrollMenu(pPlayer, pObject)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	if(TangibleObject(pObject):isBroken()) then
		CreatureObject(pPlayer):sendSystemMessage("The text on this scroll has faded from use.")
		return
	end
	
	local skillString = SceneObject(pObject):getStoredString("skill")
	local skillMin = SceneObject(pObject):getStoredInt("skill_min")
	local skillMax = SceneObject(pObject):getStoredInt("skill_max")
	local currentSkillValue = self:getCurrentSkillLevel(pPlayer, skillString)
	
	--CreatureObject(pPlayer):sendSystemMessage(currentSkillValue + 1 .. " < " .. skillMin)
	
	if(currentSkillValue + 1 > skillMax) then
		CreatureObject(pPlayer):sendSystemMessage("There is nothing this scroll can teach you that you don't already know.")
		return
	elseif(currentSkillValue + 1 < skillMin) then
		CreatureObject(pPlayer):sendSystemMessage("The content of this scroll is too advanced for you at this current time. You'll need something more intermediate.")
		return
	end	
	
	--If not, prompt them with simple menu asking them if they'd like to train the next level of the skill, but only if they have the exp.
	local displayName = skillString:sub(1,1):upper()..skillString:sub(2):lower()
	
	local isDark = SceneObject(pObject):getStoredInt("isDark") == 1
	
	local sui = SuiMessageBox.new("BorForce", "scrollCallback")
	sui.setTargetNetworkId(SceneObject(pObject):getObjectID())
	sui.setTitle("Learning from a Scroll")
	
	if(isDark == true) then
		sui.setPrompt("The dark knowledge of this scroll goes into detail about techniques within the force. You can learn " .. displayName .. " Rank " .. currentSkillValue + 1 .. ". Do you wish to continue?")
	else 
		sui.setPrompt("The knowledge of this scroll goes into detail about techniques within the force. You can learn " .. displayName .. " Rank " .. currentSkillValue + 1 .. ". Do you wish to continue?")
	end
	
	sui.setOkButtonText("Yes")
	sui.setCancelButtonText("No")
	local pageId = sui.sendTo(pPlayer)
end

function BorForce:scrollCallback(pPlayer, pSui, eventIndex, args)
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end
	
	local pPageData = LuaSuiBoxPage(pSui):getSuiPageData()

	if (pPageData == nil) then
		return
	end
	
	local suiPageData = LuaSuiPageData(pPageData)
	
	local scrollID = suiPageData:getTargetNetworkId()

	local scrollObj = getSceneObject(scrollID)
	
	if (scrollObj == nil) then
		return
	end
	
	local skillString = SceneObject(scrollObj):getStoredString("skill")
	
	local currentSkillValue = self:getCurrentSkillLevel(pPlayer, skillString)
	
	local isDark = SceneObject(scrollObj):getStoredInt("isDark") == 1
	
	if(currentSkillValue < 10) then
		--Teach the skill if they have enough exp and qualify for it
		local skillToTeachName = self:getSkillName(skillString, currentSkillValue + 1)
		local skillManager = LuaSkillManager()
		
		if(skillManager:getQualifiedForRpSkill(pPlayer, skillToTeachName) == false) then
			CreatureObject(pPlayer):sendSystemMessage("You are not yet capable of learning this lesson. Consider focusing on the neccessary attributes to endure the training.")
			return
		end
		
		local skillTaught = skillManager:awardSkill(pPlayer, skillToTeachName) --canLearnSkill(pPlayer, skillToTeachName)
		--Damage the Scroll
		if(skillTaught) then
			CreatureObject(pPlayer):sendSystemMessage("Due to your prolonged time with the scroll, it's become a bit worn and faded.")
			local dmg = TangibleObject(scrollObj):getConditionDamage()
			TangibleObject(scrollObj):setConditionDamage(dmg + 1)
			if(isDark == true) then
				--Add Corruption
				self:addCorruptionPoints(pPlayer, 5)
			end
		else 
			CreatureObject(pPlayer):sendSystemMessage("You were not able to learn the lesson taught.")
		end
	end	
end

function BorForce:getRandomForceSkill(allowDark)
	local forceSkills
	if(allowDark) then
		forceSkills = {"alter", "control", "inward", "lightning", "lightsaber", "sense", "telekinesis"}
	else
		forceSkills = {"alter", "control", "inward", "lightsaber", "sense", "telekinesis"}
	end
	
	return forceSkills[math.random(#forceSkills)]
end

function BorForce:getSkillColor(colorName)
	if(colorName == "alter") then
		return 37
	elseif(colorName == "control") then
		return 6
	elseif(colorName == "inward") then
		return 4
	elseif(colorName == "lightning") then
		return 35	
	elseif(colorName == "lightsaber") then
		return 3
	elseif(colorName == "sense") then
		return 34
	elseif(colorName == "telekinesis") then
		return 32
	else
		return 22
	end
end

function BorForce:addForceRichLocations(forceLocation) 
	table.insert(self.forceRichLocations, forceLocation)
end

function BorForce:addCrystal(crystal) 
	table.insert(self.crystals, crystal)
end

function BorForce:addSpecialCrystal(crystal) 
	table.insert(self.specialCrystals, crystal)
end

function BorForce:addCrystalLocation(crystalLoc) 
	self.crystalLocations = crystalLoc
end

function BorForce:getCurrentSkillLevel(pPlayer, skillString)
	if(CreatureObject(pPlayer):hasSkill("rp_" .. skillString .. "_master")) then
		return 10
	elseif(CreatureObject(pPlayer):hasSkill("rp_" .. skillString .. "_b04")) then
		return 9
	elseif(CreatureObject(pPlayer):hasSkill("rp_" .. skillString .. "_b03")) then
		return 8
	elseif(CreatureObject(pPlayer):hasSkill("rp_" .. skillString .. "_b02")) then
		return 7
	elseif(CreatureObject(pPlayer):hasSkill("rp_" .. skillString .. "_b01")) then
		return 6
	elseif(CreatureObject(pPlayer):hasSkill("rp_" .. skillString .. "_a04")) then
		return 5
	elseif(CreatureObject(pPlayer):hasSkill("rp_" .. skillString .. "_a03")) then
		return 4
	elseif(CreatureObject(pPlayer):hasSkill("rp_" .. skillString .. "_a02")) then
		return 3
	elseif(CreatureObject(pPlayer):hasSkill("rp_" .. skillString .. "_a01")) then
		return 2
	elseif(CreatureObject(pPlayer):hasSkill("rp_" .. skillString .. "_novice")) then
		return 1
	else  
		return 0
	end
end

function BorForce:getSkillName(skillString, level)
	local skillFormat = "rp_"..skillString.."_"
	local levelString
	if(level == 1) then
		levelString = "novice"
	elseif(level == 2) then
		levelString = "a01"
	elseif(level == 3) then
		levelString = "a02"
	elseif(level == 4) then
		levelString = "a03"
	elseif(level == 5) then
		levelString = "a04"
	elseif(level == 6) then
		levelString = "b01"
	elseif(level == 7) then
		levelString = "b02"
	elseif(level == 8) then
		levelString = "b03"
	elseif(level == 9) then
		levelString = "b04"
	elseif(level == 10) then
		levelString = "master"
	end
	
	return skillFormat .. levelString
end

function BorForce:promptRepairBrokenLightsaber(pPlayer, pObject)
--The broken lightsaber requires 1 to 2 parts to repair
	if(SceneObject(pObject):getStoredInt("initialized") ~= 1) then
		self:initializeBrokenSaber(pObject)
	end
	local hasEngineering10 = CreatureObject(pPlayer):hasSkill("rp_engineering_master")
	local hasLightsaberKnowledge = SceneObject(pPlayer):getStoredInt("knowsLightsaberConstruction") == 1
	--Requires Engineering 10 to Repair it, or a lightsaber book
	if (hasEngineering10 or hasLightsaberKnowledge) then
		-- proceed. Prompt them if they want to repair.
		local suiManager = LuaSuiManager()
		local sui = SuiMessageBox.new("BorForce", "repairSaberCallback")
		sui.setTargetNetworkId(SceneObject(pObject):getObjectID())
		sui.setTitle("Repairing a broken Lightsaber")
		
		local promptText = "You can attempt to repair this lightsaber. "
		local partReqCount = SceneObject(pObject):getStoredInt("parts_needed")
		local firstPart = SceneObject(pObject):getStoredInt("neededPart1")
		if(partReqCount == 1) then
			promptText = promptText .. "It requires a new " .. self.lightsaberParts[firstPart][2] .. ". "
		else
			local secondPart = SceneObject(pObject):getStoredInt("neededPart2")
			promptText = promptText .. "It requires a new " .. self.lightsaberParts[firstPart][2] .. " and a new " .. self.lightsaberParts[secondPart][2] .. ". "
		end
		promptText = promptText .. "Do you wish to proceed?"
		sui.setPrompt(promptText)
		sui.setOkButtonText("Yes")
		sui.setCancelButtonText("No")
		local pageId = sui.sendTo(pPlayer)	
	else 
		CreatureObject(pPlayer):sendSystemMessage("You need to be a master of engineering, or know how this device works in order to repair it.")
	end
end

function BorForce:repairSaberCallback(pPlayer, pSui, eventIndex, args)
	if (pPlayer == nil) then
		return
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end
	
	local pPageData = LuaSuiBoxPage(pSui):getSuiPageData()

	if (pPageData == nil) then
		return
	end
	
	local suiPageData = LuaSuiPageData(pPageData)
	
	local saberID = suiPageData:getTargetNetworkId()

	local saberObj = getSceneObject(saberID)
	
	if (saberObj == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Failed to find Saber Object. Contact Developer.")
		return
	end
	
	--Check to see if they have the neccessary components.
	local partReqCount = SceneObject(saberObj):getStoredInt("parts_needed")
	local firstPart = SceneObject(saberObj):getStoredInt("neededPart1")
	local secondPart = SceneObject(saberObj):getStoredInt("neededPart2")
	
	local hasFirstPart = self:hasItem(pPlayer, self.lightsaberParts[firstPart][1])
	
	if(partReqCount == 1) then
		if(hasFirstPart) then
			self:removeItem(pPlayer, self.lightsaberParts[firstPart][1])
			self:repairBrokenSaber(pPlayer, saberObj)
		else 
			CreatureObject(pPlayer):sendSystemMessage("You don't have the neccesary part to repair this.")
		end
	else
		local hasSecondPart = self:hasItem(pPlayer, self.lightsaberParts[secondPart][1])
		if(hasFirstPart and hasSecondPart) then
			self:removeItem(pPlayer, self.lightsaberParts[firstPart][1])
			self:removeItem(pPlayer, self.lightsaberParts[secondPart][1])
			self:repairBrokenSaber(pPlayer, saberObj)
		else 
			CreatureObject(pPlayer):sendSystemMessage("You don't have the neccesary parts to repair this.")
		end
	end
	
	
end

function BorForce:repairBrokenSaber(pPlayer, pObject) 
	if(pObject == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Something happened. Object reference lost. Inform developers.")
		return
	end
	
	--Upon repair, it changes title to "Repaired by <Name>" and spawns a real saber.
	--Acquire the Path of the real Object
	local brokenTemplate = SceneObject(pObject):getTemplateObjectPath()
	local rawName = self:getFileName(brokenTemplate)
	local newTemplate
	if string.find(rawName, "sword") then
		newTemplate = "object/weapon/roleplay/lightsaber/single/1h/" .. rawName .. ".iff"		
	elseif string.find(rawName, "polearm") then
		newTemplate = "object/weapon/roleplay/lightsaber/double/" .. rawName .. ".iff"		
	end
	
	--Delete the Broken Lightsaber Object
	SceneObject(pObject):destroyObjectFromWorld()
	SceneObject(pObject):destroyObjectFromDatabase()
	
	if(newTemplate == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Something happened. I cannot find the Lightsaber at path \"" .. newTemplate .. "\" Please let the developer know.")
		return
	end
	
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return 0
	end
	
	local spawnedObj = giveItem(pInventory, newTemplate, -1, true)
	if(spawnedObj == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Failed to create object: \"" .. newTemplate .. "\" Please let the developer know.")
		return
	end
	
	local newSerial = generateSerial()
	TangibleObject(spawnedObj):setSerialNumber(newSerial)
	
	TangibleObject(spawnedObj):setCraftersName("Repaired by " .. CreatureObject(pPlayer):getFirstName())	
	CreatureObject(pPlayer):sendSystemMessage("You successfully repaired the lightsaber.")
end

function BorForce:getFileName(path)
  -- get the last element of the split path
  filename = path:match("([^/]+)$")
  -- remove the extension
  return filename:match("(.+)%..+")
end

function BorForce:hasItem(pPlayer, itemTemplate)
	local pInventory = SceneObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return 0
	end

	local pItem = getContainerObjectByTemplate(pInventory, itemTemplate, true)

	return pItem ~= nil
end

function BorForce:removeItem(pPlayer, itemTemplate)
	local pInventory = SceneObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return
	end

	local pItem = getContainerObjectByTemplate(pInventory, itemTemplate, true)

	if (pItem ~= nil) then
		SceneObject(pItem):destroyObjectFromWorld()
		SceneObject(pItem):destroyObjectFromDatabase()
	end
end

function BorForce:initializeBrokenSaber(pObject)
	SceneObject(pObject):setStoredInt("initialized", 1)
	local partsNeededCount = math.random(1,2)
	SceneObject(pObject):setStoredInt("parts_needed", partsNeededCount)
	local firstPart = math.random(2,5)
	SceneObject(pObject):setStoredInt("neededPart1", firstPart)
	if(partsNeededCount == 2) then
		local secondPart = math.random(2,5)
		while secondPart == firstPart do
			secondPart = math.random(2,5)
		end
		SceneObject(pObject):setStoredInt("neededPart2", secondPart)
	end
end

function BorForce:promptSetLearningSkill(pObject, pPlayer)
	local suiManager = LuaSuiManager()
	local options = {{"Alter", 0}, {"Control", 0}, {"Inward", 0}, {"Lightning", 0}, {"Lightsaber", 0}, {"Sense", 0}, {"Telekinesis", 0}}
	
	suiManager:sendListBox(pObject, pPlayer, "Configure Learning Device", "Which skill should be used?", 1, "@cancel", "", "", "BorForce", "setLearningSkillCallback", 32, options)
end

function BorForce:setLearningSkillCallback(pPlayer, pSui, eventIndex, args)
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end
	
	local inputBox = LuaSuiBox(pSui)
	local pObject = inputBox:getUsingObject()
	
	local selection = args + 1
	
	local suiManager = LuaSuiManager()
	
	local skillName = "alter"
	
	if(selection == 1) then
		skillName = "alter"
	elseif(selection == 2) then
		skillName = "control"
	elseif(selection == 3) then
		skillName = "inward"
	elseif(selection == 4) then
		skillName = "lightning"
	elseif(selection == 5) then
		skillName = "lightsaber"
	elseif(selection == 6) then
		skillName = "sense"
	elseif(selection == 7) then
		skillName = "telekinesis"
	end	
	
	SceneObject(pObject):setStoredString("skill", skillName)
	local displayName = skillName:sub(1,1):upper()..skillName:sub(2):lower()
	
	local maxSkill = SceneObject(pObject):getStoredInt("skill_max")
	local minSkill = SceneObject(pObject):getStoredInt("skill_min")
	
	CreatureObject(pPlayer):sendSystemMessage("Set Scroll Training Skill to " .. displayName)
	
	SceneObject(pObject):setCustomObjectName("Scroll of " .. displayName .. " (" .. self:intToRoman(minSkill) .. " - " .. self:intToRoman(maxSkill) ..")")	
	
end

function BorForce:promptSetScrollMinimum(pObject, pPlayer)
	local suiManager = LuaSuiManager()
	suiManager:sendInputBox(pObject, pPlayer, "BorForce", "setScrollMinimumCallback", "Enter the minimum level this scroll can train a skill to: ", "@ok")
end

function BorForce:setScrollMinimumCallback(pPlayer, pSui, eventIndex, inputData)
	if(eventIndex == 1) then
		return 0
	end
	
	if(inputData == "") then
		return 0
	end
	
	local inputBox = LuaSuiBox(pSui)
	local pObject = inputBox:getUsingObject()
	
	if(pObject == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Error finding Scroll.")
		return 0
	end
	
	
	local skillName = SceneObject(pObject):getStoredString("skill")
	local displayName = skillName:sub(1,1):upper()..skillName:sub(2):lower()
	
	local maxSkill = SceneObject(pObject):getStoredInt("skill_max")
	local minSkill = tonumber(inputData)
	
	SceneObject(pObject):setStoredInt("skill_min", minSkill)
	CreatureObject(pPlayer):sendSystemMessage("Set Scroll Training Minimum to " .. inputData)
	
	SceneObject(pObject):setCustomObjectName("Scroll of " .. displayName .. " (" .. self:intToRoman(minSkill) .. " - " .. self:intToRoman(maxSkill) ..")")	
end

function BorForce:promptSetScrollMaximum(pObject, pPlayer)
	local suiManager = LuaSuiManager()
	suiManager:sendInputBox(pObject, pPlayer, "BorForce", "setScrollMaximumCallback", "Enter the maximum level this scroll can train a skill to: ", "@ok")
	
end

function BorForce:setScrollMaximumCallback(pPlayer, pSui, eventIndex, inputData)
	if(eventIndex == 1) then
		return 0
	end
	
	if(inputData == "") then
		return 0
	end
	
	local inputBox = LuaSuiBox(pSui)
	local pObject = inputBox:getUsingObject()
	
	if(pObject == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Error finding Scroll.")
		return 0
	end
	
	local skillName = SceneObject(pObject):getStoredString("skill")
	local displayName = skillName:sub(1,1):upper()..skillName:sub(2):lower()
	
	local minSkill = SceneObject(pObject):getStoredInt("skill_min")
	local maxSkill = tonumber(inputData)
	
	SceneObject(pObject):setStoredInt("skill_max", maxSkill)
	CreatureObject(pPlayer):sendSystemMessage("Set Scroll Training Maximum to " .. inputData)
	
	SceneObject(pObject):setCustomObjectName("Scroll of " .. displayName .. " (" .. self:intToRoman(minSkill) .. " - " .. self:intToRoman(maxSkill) ..")")
end

function BorForce:intToRoman(num)
    local roman = {
        {1000, "M"},
        {900, "CM"},
        {500, "D"},
        {400, "CD"},
        {100, "C"},
        {90, "XC"},
        {50, "L"},
        {40, "XL"},
        {10, "X"},
        {9, "IX"},
        {5, "V"},
        {4, "IV"},
        {1, "I"}
    }
 
    local result = ""
    for i = 1, #roman do
        local val, letter = table.unpack(roman[i])
 
        while num >= val do
            num = num - val
            result = result .. letter
        end
    end
    return result
end




function BorForce:dmTrainAbsorb(pPlayer, pSui, eventIndex)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return
	end	

	local cancelPressed = (eventIndex == 1)
	if (cancelPressed) then
		return
	end

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return
	end

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not an awakened Force Sensitive.")
		return
	end

	--Give Skill
	awardSkill(pPlayer, "rp_frc_absorb")
	--Confirm that skill has been granted, then send Message 
	if(CreatureObject(pPlayer):hasSkill("rp_frc_absorb") == true) then
		CreatureObject(pPlayer):sendSystemMessage("You have learned the Absorb power! It is now available as an option in the /rpsetstance menu.")
		CreatureObject(pPlayer):playMusicMessage("sound/mus_rp_force_aware.snd")
	else
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong when granting the Absorb power. Talk to the Admins for troubleshooting.")
	end
end


function BorForce:dmTrainBody(pPlayer, pSui, eventIndex)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return
	end	

	local cancelPressed = (eventIndex == 1)
	if (cancelPressed) then
		return
	end

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return
	end

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not an awakened Force Sensitive.")
		return
	end

	--Give Skill
	awardSkill(pPlayer, "rp_frc_body")
	--Confirm that skill has been granted, then send Message 
	if(CreatureObject(pPlayer):hasSkill("rp_frc_body") == true) then
		CreatureObject(pPlayer):sendSystemMessage("You have learned the Body power! You can use it with the /rpfbody command.")
		CreatureObject(pPlayer):playMusicMessage("sound/mus_rp_force_aware.snd")
	else
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong when granting the Body power. Talk to the Admins for troubleshooting.")
	end
end

function BorForce:dmTrainChainLightning(pPlayer, pSui, eventIndex)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return
	end	

	local cancelPressed = (eventIndex == 1)
	if (cancelPressed) then
		return
	end

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return
	end

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not an awakened Force Sensitive.")
		return
	end

	--Give Skill
	awardSkill(pPlayer, "rp_frc_chain")
	--Confirm that skill has been granted, then send Message 
	if(CreatureObject(pPlayer):hasSkill("rp_frc_chain") == true) then
		CreatureObject(pPlayer):sendSystemMessage("You have learned the Chain Lightning power! You can use it with the /rpfchain command.")
		CreatureObject(pPlayer):playMusicMessage("sound/mus_rp_force_aware.snd")
	else
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong when granting the Chain Lightning power. Talk to the Admins for troubleshooting.")
	end
end



function BorForce:dmTrainCrush(pPlayer, pSui, eventIndex)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return
	end	

	local cancelPressed = (eventIndex == 1)
	if (cancelPressed) then
		return
	end

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return
	end

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not an awakened Force Sensitive.")
		return
	end

	--Give Skill
	awardSkill(pPlayer, "rp_frc_crush")
	--Confirm that skill has been granted, then send Message 
	if(CreatureObject(pPlayer):hasSkill("rp_frc_crush") == true) then
		CreatureObject(pPlayer):sendSystemMessage("You have learned the Crush power! You can use it with the /rpfcrush command.")
		CreatureObject(pPlayer):playMusicMessage("sound/mus_rp_force_aware.snd")
	else
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong when granting the Crush power. Talk to the Admins for troubleshooting.")
	end
end


function BorForce:dmTrainDominateMind(pPlayer, pSui, eventIndex)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return
	end	

	local cancelPressed = (eventIndex == 1)
	if (cancelPressed) then
		return
	end

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return
	end

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not an awakened Force Sensitive.")
		return
	end

	--Give Skill
	awardSkill(pPlayer, "rp_frc_dominate")
	--Confirm that skill has been granted, then send Message 
	if(CreatureObject(pPlayer):hasSkill("rp_frc_dominate") == true) then
		CreatureObject(pPlayer):sendSystemMessage("You have learned the Dominate Mind power! You can use it with the /rpfdominate command.")
		CreatureObject(pPlayer):playMusicMessage("sound/mus_rp_force_aware.snd")
	else
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong when granting the Dominate Mind power. Talk to the Admins for troubleshooting.")
	end
end


function BorForce:dmTrainFlash(pPlayer, pSui, eventIndex)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return
	end	

	local cancelPressed = (eventIndex == 1)
	if (cancelPressed) then
		return
	end

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return
	end

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not an awakened Force Sensitive.")
		return
	end

	--Give Skill
	awardSkill(pPlayer, "rp_frc_flash")
	--Confirm that skill has been granted, then send Message 
	if(CreatureObject(pPlayer):hasSkill("rp_frc_flash") == true) then
		CreatureObject(pPlayer):sendSystemMessage("You have learned the Flash power! You can use it with the /rpfflash command.")
		CreatureObject(pPlayer):playMusicMessage("sound/mus_rp_force_aware.snd")
	else
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong when granting the Flash power. Talk to the Admins for troubleshooting.")
	end
end



function BorForce:dmTrainFocus(pPlayer, pSui, eventIndex)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return
	end	

	local cancelPressed = (eventIndex == 1)
	if (cancelPressed) then
		return
	end

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return
	end

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not an awakened Force Sensitive.")
		return
	end

	--Give Skill
	awardSkill(pPlayer, "rp_frc_focus")
	--Confirm that skill has been granted, then send Message 
	if(CreatureObject(pPlayer):hasSkill("rp_frc_focus") == true) then
		CreatureObject(pPlayer):sendSystemMessage("You have learned the Focus power! You can use it with the /rpgfocus command.")
		CreatureObject(pPlayer):playMusicMessage("sound/mus_rp_force_aware.snd")
	else
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong when granting the Focus power. Talk to the Admins for troubleshooting.")
	end
end



function BorForce:dmTrainGrip(pPlayer, pSui, eventIndex)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return
	end	

	local cancelPressed = (eventIndex == 1)
	if (cancelPressed) then
		return
	end

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return
	end

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not an awakened Force Sensitive.")
		return
	end

	--Give Skill
	awardSkill(pPlayer, "rp_frc_grip")
	--Confirm that skill has been granted, then send Message 
	if(CreatureObject(pPlayer):hasSkill("rp_frc_grip") == true) then
		CreatureObject(pPlayer):sendSystemMessage("You have learned the Grip power! You can use it with the /rpfgrip command.")
		CreatureObject(pPlayer):playMusicMessage("sound/mus_rp_force_aware.snd")
	else
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong when granting the Grip power. Talk to the Admins for troubleshooting.")
	end
end


function BorForce:dmTrainHeal(pPlayer, pSui, eventIndex)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return
	end	

	local cancelPressed = (eventIndex == 1)
	if (cancelPressed) then
		return
	end

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return
	end

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not an awakened Force Sensitive.")
		return
	end

	--Give Skill
	awardSkill(pPlayer, "rp_frc_heal")
	--Confirm that skill has been granted, then send Message 
	if(CreatureObject(pPlayer):hasSkill("rp_frc_heal") == true) then
		CreatureObject(pPlayer):sendSystemMessage("You have learned the Heal power! You can use it with the /rpfheal command.")
		CreatureObject(pPlayer):playMusicMessage("sound/mus_rp_force_aware.snd")
	else
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong when granting the Heal power. Talk to the Admins for troubleshooting.")
	end
end


function BorForce:dmTrainHealOther(pPlayer, pSui, eventIndex)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return
	end	

	local cancelPressed = (eventIndex == 1)
	if (cancelPressed) then
		return
	end

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return
	end

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not an awakened Force Sensitive.")
		return
	end

	--Give Skill
	awardSkill(pPlayer, "rp_frc_healother")
	--Confirm that skill has been granted, then send Message 
	if(CreatureObject(pPlayer):hasSkill("rp_frc_healother") == true) then
		CreatureObject(pPlayer):sendSystemMessage("You have learned the Heal Other power! You can use it with the /rpftargetheal command.")
		CreatureObject(pPlayer):playMusicMessage("sound/mus_rp_force_aware.snd")
	else
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong when granting the Heal Other power. Talk to the Admins for troubleshooting.")
	end
end


function BorForce:dmTrainJump(pPlayer, pSui, eventIndex)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return
	end	

	local cancelPressed = (eventIndex == 1)
	if (cancelPressed) then
		return
	end

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return
	end

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not an awakened Force Sensitive.")
		return
	end

	--Give Skill
	awardSkill(pPlayer, "rp_frc_jump")
	--Confirm that skill has been granted, then send Message 
	if(CreatureObject(pPlayer):hasSkill("rp_frc_jump") == true) then
		CreatureObject(pPlayer):sendSystemMessage("You have learned the Jump power! You can use it with the /rpfjump command.")
		CreatureObject(pPlayer):playMusicMessage("sound/mus_rp_force_aware.snd")
	else
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong when granting the Jump power. Talk to the Admins for troubleshooting.")
	end
end


function BorForce:dmTrainLightningPower(pPlayer, pSui, eventIndex)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return
	end	

	local cancelPressed = (eventIndex == 1)
	if (cancelPressed) then
		return
	end

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return
	end

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not an awakened Force Sensitive.")
		return
	end

	--Give Skill
	awardSkill(pPlayer, "rp_frc_lightning")
	--Confirm that skill has been granted, then send Message 
	if(CreatureObject(pPlayer):hasSkill("rp_frc_lightning") == true) then
		CreatureObject(pPlayer):sendSystemMessage("You have learned the Lightning power! You can use it with the /rpflightning command.")
		CreatureObject(pPlayer):playMusicMessage("sound/mus_rp_force_aware.snd")
	else
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong when granting the Lightning power. Talk to the Admins for troubleshooting.")
	end
end


function BorForce:dmTrainLightsaberDeflect(pPlayer, pSui, eventIndex)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return
	end	

	local cancelPressed = (eventIndex == 1)
	if (cancelPressed) then
		return
	end

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return
	end

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not an awakened Force Sensitive.")
		return
	end

	--Give Skill
	awardSkill(pPlayer, "rp_frc_defense")
	--Confirm that skill has been granted, then send Message 
	if(CreatureObject(pPlayer):hasSkill("rp_frc_defense") == true) then
		CreatureObject(pPlayer):sendSystemMessage("You have learned the Lightsaber Deflect power! It is now available as an option in the /rpsetstance menu.")
		CreatureObject(pPlayer):playMusicMessage("sound/mus_rp_force_aware.snd")
	else
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong when granting the Lightsaber Deflect power. Talk to the Admins for troubleshooting.")
	end
end


function BorForce:dmTrainManipulateObject(pPlayer, pSui, eventIndex)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return
	end	

	local cancelPressed = (eventIndex == 1)
	if (cancelPressed) then
		return
	end

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return
	end

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not an awakened Force Sensitive.")
		return
	end

	--Give Skill
	awardSkill(pPlayer, "rp_frc_manip")
	--Confirm that skill has been granted, then send Message 
	if(CreatureObject(pPlayer):hasSkill("rp_frc_manip") == true) then
		CreatureObject(pPlayer):sendSystemMessage("You have learned the Manipulate Object power! You can use it with the /rpfmanipulate command.")
		CreatureObject(pPlayer):playMusicMessage("sound/mus_rp_force_aware.snd")
	else
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong when granting the Manipulate Object power. Talk to the Admins for troubleshooting.")
	end
end


function BorForce:dmTrainMeditate(pPlayer, pSui, eventIndex)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return
	end	

	local cancelPressed = (eventIndex == 1)
	if (cancelPressed) then
		return
	end

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return
	end

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not an awakened Force Sensitive.")
		return
	end

	--Give Skill
	awardSkill(pPlayer, "rp_frc_meditate")
	--Confirm that skill has been granted, then send Message 
	if(CreatureObject(pPlayer):hasSkill("rp_frc_meditate") == true) then
		CreatureObject(pPlayer):sendSystemMessage("You have learned the Meditate power! Meditation is now available as an option in the /rest menu.")
		CreatureObject(pPlayer):playMusicMessage("sound/mus_rp_force_aware.snd")
	else
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong when granting the Meditate power. Talk to the Admins for troubleshooting.")
	end
end


function BorForce:dmTrainMindTrick(pPlayer, pSui, eventIndex)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return
	end	

	local cancelPressed = (eventIndex == 1)
	if (cancelPressed) then
		return
	end

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return
	end

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not an awakened Force Sensitive.")
		return
	end

	--Give Skill
	awardSkill(pPlayer, "rp_frc_trick")
	--Confirm that skill has been granted, then send Message 
	if(CreatureObject(pPlayer):hasSkill("rp_frc_trick") == true) then
		CreatureObject(pPlayer):sendSystemMessage("You have learned the Mind Trick power! You can use it with the /rpftrick command.")
		CreatureObject(pPlayer):playMusicMessage("sound/mus_rp_force_aware.snd")
	else
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong when granting the Mind Trick power. Talk to the Admins for troubleshooting.")
	end
end


function BorForce:dmTrainPersuade(pPlayer, pSui, eventIndex)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return
	end	

	local cancelPressed = (eventIndex == 1)
	if (cancelPressed) then
		return
	end

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return
	end

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not an awakened Force Sensitive.")
		return
	end

	--Give Skill
	awardSkill(pPlayer, "rp_frc_persuade")
	--Confirm that skill has been granted, then send Message 
	if(CreatureObject(pPlayer):hasSkill("rp_frc_persuade") == true) then
		CreatureObject(pPlayer):sendSystemMessage("You have learned the Persuade power! You can use it with the /rpfpersuade command.")
		CreatureObject(pPlayer):playMusicMessage("sound/mus_rp_force_aware.snd")
	else
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong when granting the Persuade power. Talk to the Admins for troubleshooting.")
	end
end


function BorForce:dmTrainPrecognition(pPlayer, pSui, eventIndex)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return
	end	

	local cancelPressed = (eventIndex == 1)
	if (cancelPressed) then
		return
	end

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return
	end

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not an awakened Force Sensitive.")
		return
	end

	--Give Skill
	awardSkill(pPlayer, "rp_frc_precog")
	--Confirm that skill has been granted, then send Message 
	if(CreatureObject(pPlayer):hasSkill("rp_frc_precog") == true) then
		CreatureObject(pPlayer):sendSystemMessage("You have learned the Precognition power! You can use it with the /rpfprecog command.")
		CreatureObject(pPlayer):playMusicMessage("sound/mus_rp_force_aware.snd")
	else
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong when granting the Precognition power. Talk to the Admins for troubleshooting.")
	end
end


function BorForce:dmTrainProjectImage(pPlayer, pSui, eventIndex)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return
	end	

	local cancelPressed = (eventIndex == 1)
	if (cancelPressed) then
		return
	end

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return
	end

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not an awakened Force Sensitive.")
		return
	end

	--Give Skill
	awardSkill(pPlayer, "rp_frc_project")
	--Confirm that skill has been granted, then send Message 
	if(CreatureObject(pPlayer):hasSkill("rp_frc_project") == true) then
		CreatureObject(pPlayer):sendSystemMessage("You have learned the Project Image power! You can use it with the /rpfproject command.")
		CreatureObject(pPlayer):playMusicMessage("sound/mus_rp_force_aware.snd")
	else
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong when granting the Project Image power. Talk to the Admins for troubleshooting.")
	end
end


function BorForce:dmTrainPushPull(pPlayer, pSui, eventIndex)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return
	end	

	local cancelPressed = (eventIndex == 1)
	if (cancelPressed) then
		return
	end

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return
	end

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not an awakened Force Sensitive.")
		return
	end

	--Give Skill
	awardSkill(pPlayer, "rp_frc_pull")
	awardSkill(pPlayer, "rp_frc_push")
	--Confirm that skill has been granted, then send Message 
	if(CreatureObject(pPlayer):hasSkill("rp_frc_pull") == true and CreatureObject(pPlayer):hasSkill("rp_frc_push") == true ) then
		CreatureObject(pPlayer):sendSystemMessage("You have learned the Push/Pull power! You can use them with the /rpfpull & /rpfpush commands.")
		CreatureObject(pPlayer):playMusicMessage("sound/mus_rp_force_aware.snd")
	else
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong when granting the Push/Pull power. Talk to the Admins for troubleshooting.")
	end
end


function BorForce:dmTrainRage(pPlayer, pSui, eventIndex)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return
	end	

	local cancelPressed = (eventIndex == 1)
	if (cancelPressed) then
		return
	end

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return
	end

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not an awakened Force Sensitive.")
		return
	end

	--Give Skill
	awardSkill(pPlayer, "rp_frc_rage")
	--Confirm that skill has been granted, then send Message 
	if(CreatureObject(pPlayer):hasSkill("rp_frc_rage") == true) then
		CreatureObject(pPlayer):sendSystemMessage("You have learned the Rage power! You can use it with the /rpfrage command.")
		CreatureObject(pPlayer):playMusicMessage("sound/mus_rp_force_aware.snd")
	else
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong when granting the Rage power. Talk to the Admins for troubleshooting.")
	end
end


function BorForce:dmTrainReadMind(pPlayer, pSui, eventIndex)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return
	end	

	local cancelPressed = (eventIndex == 1)
	if (cancelPressed) then
		return
	end

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return
	end

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not an awakened Force Sensitive.")
		return
	end

	--Give Skill
	awardSkill(pPlayer, "rp_frc_read")
	--Confirm that skill has been granted, then send Message 
	if(CreatureObject(pPlayer):hasSkill("rp_frc_read") == true) then
		CreatureObject(pPlayer):sendSystemMessage("You have learned the Read Mind power! You can use it with the /rpfread command.")
		CreatureObject(pPlayer):playMusicMessage("sound/mus_rp_force_aware.snd")
	else
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong when granting the Read Mind power. Talk to the Admins for troubleshooting.")
	end
end


function BorForce:dmTrainShock(pPlayer, pSui, eventIndex)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return
	end	

	local cancelPressed = (eventIndex == 1)
	if (cancelPressed) then
		return
	end

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return
	end

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not an awakened Force Sensitive.")
		return
	end

	--Give Skill
	awardSkill(pPlayer, "rp_frc_shock")
	--Confirm that skill has been granted, then send Message 
	if(CreatureObject(pPlayer):hasSkill("rp_frc_shock") == true) then
		CreatureObject(pPlayer):sendSystemMessage("You have learned the Shock power! You can use it with the /rpfshock command.")
		CreatureObject(pPlayer):playMusicMessage("sound/mus_rp_force_aware.snd")
	else
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong when granting the Shock power. Talk to the Admins for troubleshooting.")
	end
end


function BorForce:dmTrainSight(pPlayer, pSui, eventIndex)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return
	end	

	local cancelPressed = (eventIndex == 1)
	if (cancelPressed) then
		return
	end

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return
	end

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not an awakened Force Sensitive.")
		return
	end

	--Give Skill
	awardSkill(pPlayer, "rp_frc_sight")
	--Confirm that skill has been granted, then send Message 
	if(CreatureObject(pPlayer):hasSkill("rp_frc_sight") == true) then
		CreatureObject(pPlayer):sendSystemMessage("You have learned the Sight power! You can use it with the /rpfsight command.")
		CreatureObject(pPlayer):playMusicMessage("sound/mus_rp_force_aware.snd")
	else
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong when granting the Sight power. Talk to the Admins for troubleshooting.")
	end
end


function BorForce:dmTrainSpeed(pPlayer, pSui, eventIndex)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return
	end	

	local cancelPressed = (eventIndex == 1)
	if (cancelPressed) then
		return
	end

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return
	end

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not an awakened Force Sensitive.")
		return
	end

	--Give Skill
	awardSkill(pPlayer, "rp_frc_speed")
	--Confirm that skill has been granted, then send Message 
	if(CreatureObject(pPlayer):hasSkill("rp_frc_speed") == true) then
		CreatureObject(pPlayer):sendSystemMessage("You have learned the Speed power! You can use it with the /rpfspeed command.")
		CreatureObject(pPlayer):playMusicMessage("sound/mus_rp_force_aware.snd")
	else
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong when granting the Speed power. Talk to the Admins for troubleshooting.")
	end
end


function BorForce:dmTrainStealth(pPlayer, pSui, eventIndex)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return
	end	

	local cancelPressed = (eventIndex == 1)
	if (cancelPressed) then
		return
	end

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return
	end

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not an awakened Force Sensitive.")
		return
	end

	--Give Skill
	awardSkill(pPlayer, "rp_frc_stealth")
	--Confirm that skill has been granted, then send Message 
	if(CreatureObject(pPlayer):hasSkill("rp_frc_stealth") == true) then
		CreatureObject(pPlayer):sendSystemMessage("You have learned the Stealth power! You can use it with the /rpfstealth command.")
		CreatureObject(pPlayer):playMusicMessage("sound/mus_rp_force_aware.snd")
	else
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong when granting the Stealth power. Talk to the Admins for troubleshooting.")
	end
end


function BorForce:dmTrainStorm(pPlayer, pSui, eventIndex)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return
	end	

	local cancelPressed = (eventIndex == 1)
	if (cancelPressed) then
		return
	end

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return
	end

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not an awakened Force Sensitive.")
		return
	end

	--Give Skill
	awardSkill(pPlayer, "rp_frc_storm")
	--Confirm that skill has been granted, then send Message 
	if(CreatureObject(pPlayer):hasSkill("rp_frc_storm") == true) then
		CreatureObject(pPlayer):sendSystemMessage("You have learned the Storm power! You can use it with the /rpfstorm command.")
		CreatureObject(pPlayer):playMusicMessage("sound/mus_rp_force_aware.snd")
	else
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong when granting the Storm power. Talk to the Admins for troubleshooting.")
	end
end


function BorForce:dmTrainTelekineticDeflect(pPlayer, pSui, eventIndex)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return
	end	

	local cancelPressed = (eventIndex == 1)
	if (cancelPressed) then
		return
	end

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid target, must be a valid player.")
		return
	end

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not an awakened Force Sensitive.")
		return
	end

	--Give Skill
	awardSkill(pPlayer, "rp_frc_deflect")
	--Confirm that skill has been granted, then send Message 
	if(CreatureObject(pPlayer):hasSkill("rp_frc_deflect") == true) then
		CreatureObject(pPlayer):sendSystemMessage("You have learned the Telekinetic Deflect power! It is now available as an option in the /rpsetstance menu.")
		CreatureObject(pPlayer):playMusicMessage("sound/mus_rp_force_aware.snd")
	else
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong when granting the Telekinetic Deflect power. Talk to the Admins for troubleshooting.")
	end
end


function BorForce:dmTrainThrow(pPlayer, pSui, eventIndex)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return
	end	

	local cancelPressed = (eventIndex == 1)
	if (cancelPressed) then
		return
	end

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid target, must be a valid player.")
		return
	end

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not an awakened Force Sensitive.")
		return
	end

	--Give Skill
	awardSkill(pPlayer, "rp_frc_throw")
	--Confirm that skill has been granted, then send Message 
	if(CreatureObject(pPlayer):hasSkill("rp_frc_throw") == true) then
		CreatureObject(pPlayer):sendSystemMessage("You have learned the Throw power! You can use it with the /rpfsthrow command.")
		CreatureObject(pPlayer):playMusicMessage("sound/mus_rp_force_aware.snd")
	else
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong when granting the Throw power. Talk to the Admins for troubleshooting.")
	end
end


function BorForce:dmTrainTwistMind(pPlayer, pSui, eventIndex)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return
	end	

	local cancelPressed = (eventIndex == 1)
	if (cancelPressed) then
		return
	end

	if (pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid target, must be a valid player.")
		return
	end

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01") == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot learn force skills if you are not an awakened Force Sensitive.")
		return
	end

	--Give Skill
	awardSkill(pPlayer, "rp_frc_twist")
	--Confirm that skill has been granted, then send Message 
	if(CreatureObject(pPlayer):hasSkill("rp_frc_twist") == true) then
		CreatureObject(pPlayer):sendSystemMessage("You have learned the Twist Mind power! You can use it with the /rpftwist command.")
		CreatureObject(pPlayer):playMusicMessage("sound/mus_rp_force_aware.snd")
	else
		CreatureObject(pPlayer):sendSystemMessage("Something went wrong when granting the Twist Mind power. Talk to the Admins for troubleshooting.")
	end
end
