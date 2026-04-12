BorForce_ReadMind = {
	name = "Read Mind"
}

function BorForce_ReadMind:showHelp(pPlayer)
	local helpMessage = self.name .. ": "
	helpMessage = helpMessage .. "As a major action, roll Sense + FPI vs Resolve to read the target's surface thoughts."
	CreatureObject(pPlayer):sendSystemMessage(helpMessage)
end

function BorForce_ReadMind:execute(pPlayer)

	local hasPower = CreatureObject(pPlayer):hasSkill("rp_frc_read")
	
	if(hasPower == false) then
		BorForceUtility:reportPowerNotKnown(pPlayer)
		return
	end

	
	local targetID = CreatureObject(pPlayer):getTargetID()
	local pTarget = getSceneObject(targetID)
	
	if (pTarget == nil or not SceneObject(pTarget):isCreatureObject()) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid target, must be a creature.")
		return
	end
	
	if(SceneObject(pPlayer):getObjectID() == SceneObject(pTarget):getObjectID()) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot read your own mind.")
		return
	end
		
	local fpi = BorForceUtility:getForcePointInput(pPlayer)
	
	if(fpi < 1) then
		BorForceUtility:promptForcePointInput(pPlayer, self.name, "BorForce_ReadMind", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_ReadMind:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end
	
	spent = tonumber(spent)
	
	if(spent < 1) then
		CreatureObject(pPlayer):sendSystemMessage("You need to commit at least one force point to use this ability.")
		return
	end
	
	self:performAbility(pPlayer, spent)
end

function BorForce_ReadMind:performAbility(pPlayer, fpi)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local targetID = CreatureObject(pPlayer):getTargetID()
	local pTarget = getSceneObject(targetID)
		
	if (pTarget == nil or not SceneObject(pTarget):isCreatureObject()) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid target, must be a creature.")
		return
	end
	
	if(SceneObject(pPlayer):getObjectID() == SceneObject(pTarget):getObjectID()) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot read your own mind.")
		return
	end	
	
	local forcePower = math.floor(PlayerObject(pGhost):getForcePower())
	
	fpi = math.floor(fpi)
	
	if(forcePower < fpi) then
		CreatureObject(pPlayer):sendSystemMessage("You don't have enough Force Power to commit " .. fpi .. " points.")
		return
	end
	
	--[[  Old DR logic.
	if(tonumber(CreatureObject(pTarget):getSkillMod("rp_mindfulness")) > 6) then
		CreatureObject(pPlayer):doAnimation("force_persuasion")			
		broadcastMessageWithName(pPlayer, CreatureObject(pPlayer):getFirstName() .. " tried to read " .. CreatureObject(pTarget):getFirstName() .. "'s mind, but failed.")
		PlayerObject(pGhost):setForcePower(forcePower - fpi)
		return
	end
	--]]
	
	local forceDieValue = math.random(1, 20)
	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_sense"))
	local forceTotal = forceDieValue + skillValue +  fpi

	local defenderDieValue = math.random(1, 20)
	local defenderResolve = tonumber(CreatureObject(pTarget):getSkillMod("rp_resolve"))
	local defenderTotal = defenderDieValue + defenderResolve
	
	local message = CreatureObject(pPlayer):getFirstName() .. " used " .. self.name .. ", rolling 1d20: " .. forceDieValue .. " + " .. skillValue .. " + " .. fpi
	message = message .. " = " .. forceTotal .. " vs 1d20: " .. defenderDieValue .. " + " .. defenderResolve .. " = " .. defenderTotal
	local targetName = CreatureObject(pTarget):getFirstName() 
	
	if(forceTotal > defenderTotal) then
		message = message .. ". They succesfully peer into " .. targetName .. "'s mind!" 
	
		CreatureObject(pPlayer):doAnimation("force_persuasion")	
		broadcastMessageWithName(pPlayer, message)
	end
	if (forceTotal <= defenderTotal) then
		message = message .. " They peer into " .. targetName .. "'s mind and see their true intentions. The next time " .. targetName 
		message = message .. " uses a social skill against them, they can use the score of " .. forceTotal .. " instead of a composure or resolve roll."
	
		CreatureObject(pPlayer):doAnimation("force_persuasion")	
		broadcastMessageWithName(pPlayer, message)
	end
	
	PlayerObject(pGhost):setForcePower(forcePower - fpi)
	
end