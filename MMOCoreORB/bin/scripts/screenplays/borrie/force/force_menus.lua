local ObjectManager = require("managers.object.object_manager")

--Holocron Menu
RpHolocronMenuComponent = {}

function RpHolocronMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end

	menuResponse:addRadialMenuItem(20, 3, "Use")
	--Add Option to Repair it if you've maxed it out. 
	if(PlayerObject(pGhost):isPrivileged()) then
		menuResponse:addRadialMenuItem(85, 3, "DM Options")
		menuResponse:addRadialMenuItemToRadialID(85, 100, 3, "Re-Initialize")
		menuResponse:addRadialMenuItemToRadialID(85, 101, 3, "Give to Target")
	end	
end

function RpHolocronMenuComponent:handleObjectMenuSelect(pObject, pPlayer, selectedID)
	if (pPlayer == nil or pObject == nil) then
		return 0
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Error: You are not a player??")
		return
	end
	
	if (selectedID == 20) then 
		
		if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01")) then
			local skillString = SceneObject(pObject):getStoredString("skill")
			--If the Holocron is not initialized, do so
			if(skillString == "" or skillString == nil) then
				BorForce:initializeHolocron(pObject)
			end
			--Then use it.
			BorForce:openHolocronMenu(pPlayer, pObject)
		else 
			if(CreatureObject(pPlayer):hasSkill("rp_force_prog_novice")) then
				BorForce:awakenViaHolocron(pPlayer, pObject)
			else 
				CreatureObject(pPlayer):sendSystemMessage("You aren't entirely sure this isn't just some fancy trinket. It has no way to use it.")
			end
		end
	elseif(selectedID == 80) then
		
	elseif(selectedID == 100) then --Re-Initialize
		BorForce:initializeHolocron(pObject)
		CreatureObject(pPlayer):sendSystemMessage("Re-initialized Holocron.")
	elseif(selectedID == 101) then --Give to Target
		local targetID = CreatureObject(pPlayer):getTargetID()
		local pTarget = getSceneObject(targetID)
		
		if (pTarget == nil or not SceneObject(pTarget):isPlayerCreature()) then
			CreatureObject(pPlayer):sendSystemMessage("Invalid target, must be a valid player.")
			return
		end
		
		local pTargetGhost = CreatureObject(pTarget):getPlayerObject()
		
		local pInventory = CreatureObject(pTarget):getSlottedObject("inventory")
		
		if (pInventory == nil) then
			CreatureObject(pPlayer):sendSystemMessage("Error: Your inventory wasn't found. Contact an admin.")
			return 0
		end
		
		SceneObject(pInventory):transferObject(pObject, -1, 1)
		CreatureObject(pTarget):sendSystemMessage("You have recieved " .. SceneObject(pObject):getCustomObjectName())
		CreatureObject(pPlayer):sendSystemMessage(SceneObject(pTarget):getCustomObjectName() .." recieved " .. SceneObject(pObject):getCustomObjectName())
	end
	
	return 0
end

--Scroll Menu
RpForceScrollMenuComponent = {}

function RpForceScrollMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local skillString = SceneObject(pSceneObject):getStoredString("skill")

	--menuResponse:addRadialMenuItem(20, 3, "Read")
	if(PlayerObject(pGhost):isPrivileged()) then
		menuResponse:addRadialMenuItem(80, 3, "DM Options")
		menuResponse:addRadialMenuItemToRadialID(80, 102, 3, "Make Beginner Scroll")
		menuResponse:addRadialMenuItemToRadialID(80, 100, 3, "Re-Initialize")
		if(skillString ~= "") then
			menuResponse:addRadialMenuItemToRadialID(80, 103, 3, "Set Skill")
			menuResponse:addRadialMenuItemToRadialID(80, 104, 3, "Set Minimum")
			menuResponse:addRadialMenuItemToRadialID(80, 105, 3, "Set Maximum")
		end		
		menuResponse:addRadialMenuItemToRadialID(80, 101, 3, "Give to Target")
		
		
	end	
end

function RpForceScrollMenuComponent:handleObjectMenuSelect(pObject, pPlayer, selectedID)
	if (pPlayer == nil or pObject == nil) then
		return 0
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Error: You are not a player??")
		return
	end
	
	--[[
	if (selectedID == 20) then 
		if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01")) then
			local skillString = SceneObject(pObject):getStoredString("skill")
			--If the Scroll is not initialized, do so
			if(skillString == "" or skillString == nil) then
				BorForce:initializeScroll(pObject)
			end
			--Then use it.
			BorForce:openScrollMenu(pPlayer, pObject)
		else 
			CreatureObject(pPlayer):sendSystemMessage("The things taught in this scroll seem to be downright impossible to comprehend, steeped in some hokey religion.")
		end		
	else
	--]]
	if(selectedID == 100) then --Re-Initialize
		BorForce:initializeScroll(pObject)
		CreatureObject(pPlayer):sendSystemMessage("Re-initialized Scroll.")
	elseif(selectedID == 101) then --Give to Target
		local targetID = CreatureObject(pPlayer):getTargetID()
		local pTarget = getSceneObject(targetID)
		
		if (pTarget == nil or not SceneObject(pTarget):isPlayerCreature()) then
			CreatureObject(pPlayer):sendSystemMessage("Invalid target, must be a valid player.")
			return
		end
		
		local pTargetGhost = CreatureObject(pTarget):getPlayerObject()
		
		local pInventory = CreatureObject(pTarget):getSlottedObject("inventory")
		
		if (pInventory == nil) then
			CreatureObject(pPlayer):sendSystemMessage("Error: Your inventory wasn't found. Contact an admin.")
			return 0
		end
		
		SceneObject(pInventory):transferObject(pObject, -1, 1)
		CreatureObject(pTarget):sendSystemMessage("You have recieved " .. SceneObject(pObject):getCustomObjectName())
		CreatureObject(pPlayer):sendSystemMessage(SceneObject(pTarget):getCustomObjectName() .." recieved " .. SceneObject(pObject):getCustomObjectName())
	elseif(selectedID == 102) then
		BorForce:initializeScroll(pObject, true)
		CreatureObject(pPlayer):sendSystemMessage("Scroll initialized as a beginner scroll (1-3)")
	elseif(selectedID == 103) then --Set Skill
		BorForce:promptSetLearningSkill(pObject, pPlayer)
	elseif(selectedID == 104) then --Set Minimum
		BorForce:promptSetScrollMinimum(pObject, pPlayer)
	elseif(selectedID == 105) then --Set Maximum
		BorForce:promptSetScrollMaximum(pObject, pPlayer)
	end
	
	return 0
end

--Holocron Shard Menu
RpHolocronShardMenuComponent = {}

function RpHolocronShardMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)

	menuResponse:addRadialMenuItem(20, 3, "Interact")
end

--Crystal Node Menu
RpCrystalNodeMenuComponent = {}

function RpCrystalNodeMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)

	menuResponse:addRadialMenuItem(20, 3, "Gather Crystal")
end

function RpCrystalNodeMenuComponent:handleObjectMenuSelect(pObject, pPlayer, selectedID)
	if (pPlayer == nil or pObject == nil) then
		return 0
	end
	
	if (selectedID == 20) then 
		BorForce:gatherCrystal(pPlayer, pObject)
	end
	
	return 0
end

--Saber Book
RpSaberBookMenuComponent = {}

function RpSaberBookMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)

	menuResponse:addRadialMenuItem(20, 3, "Read")
	local hasLightsaberKnowledge = SceneObject(pPlayer):getStoredInt("knowsLightsaberConstruction")
	if(hasLightsaberKnowledge == 1) then
		menuResponse:addRadialMenuItem(81, 3, "Transcribe")
	end
	
end

function RpSaberBookMenuComponent:handleObjectMenuSelect(pObject, pPlayer, selectedID)
	if (pPlayer == nil or pObject == nil) then
		return 0
	end
	
	if (selectedID == 20) then 
		local hasLightsaberKnowledge = SceneObject(pPlayer):getStoredInt("knowsLightsaberConstruction")
		
		local pGhost = CreatureObject(pPlayer):getPlayerObject()

		if (pGhost == nil) then
			return
		end
		
		if(hasLightsaberKnowledge == 1) then
			CreatureObject(pPlayer):sendSystemMessage("You already understand how to construct a lightsaber.")
			return
		end
		
		if(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_02")) then
			for i,v in ipairs(rp_saber_schematics) do
				PlayerObject(pGhost):addRewardedSchematic(v, 1, 10000, true)
			end
			CreatureObject(pPlayer):sendSystemMessage("You understand now how to construct a lightsaber.")
			SceneObject(pPlayer):setStoredInt("knowsLightsaberConstruction", 1)
		else 
			--If user is not Force Initiated, ignore them
			CreatureObject(pPlayer):sendSystemMessage("Some of the elements in creating a Lightsaber require focus and abilities you do not have.")
		end	
	elseif(selectedID == 81) then
		--Prompt Them
		BorForce:transcribeLightsaberBookPrompt(pPlayer, pObject)
	end
	
	return 0
end

--Crystal Node Menu
RpBrokenSaberMenuComponent = {}

function RpBrokenSaberMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end

	menuResponse:addRadialMenuItem(20, 3, "Repair")
	if(PlayerObject(pGhost):isPrivileged()) then
		menuResponse:addRadialMenuItem(85, 3, "DM Options")
		menuResponse:addRadialMenuItemToRadialID(85, 100, 3, "Give to Target")
	end	
end

function RpBrokenSaberMenuComponent:handleObjectMenuSelect(pObject, pPlayer, selectedID)
	if (pPlayer == nil or pObject == nil) then
		return 0
	end
	
	if (selectedID == 20) then 
		BorForce:promptRepairBrokenLightsaber(pPlayer, pObject)
	elseif(selectedID == 101) then --Give to Target
		local targetID = CreatureObject(pPlayer):getTargetID()
		local pTarget = getSceneObject(targetID)
		
		if (pTarget == nil or not SceneObject(pTarget):isPlayerCreature()) then
			CreatureObject(pPlayer):sendSystemMessage("Invalid target, must be a valid player.")
			return 0
		end
		
		local pTargetGhost = CreatureObject(pTarget):getPlayerObject()
		
		local pInventory = CreatureObject(pTarget):getSlottedObject("inventory")
		
		if (pInventory == nil) then
			CreatureObject(pPlayer):sendSystemMessage("Error: Your inventory wasn't found. Contact an admin.")
			return 0
		end
		
		SceneObject(pInventory):transferObject(pObject, -1, 1)
		CreatureObject(pTarget):sendSystemMessage("You have recieved " .. SceneObject(pObject):getCustomObjectName())
		CreatureObject(pPlayer):sendSystemMessage(SceneObject(pTarget):getCustomObjectName() .." recieved " .. SceneObject(pObject):getCustomObjectName())
	end
	
	return 0
end