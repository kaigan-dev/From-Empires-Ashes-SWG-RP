BorForce_ReadMind = {
	name = "Read Mind"
}

function BorForce_ReadMind:showHelp(pPlayer)
	local helpMessage = self.name .. ": "
	helpMessage = helpMessage .. "If target’s mindfulness is less than 6, read mind uses FPI + sense skill to counter bluff, persuasion, or intimidation checks. "
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
		CreatureObject(pPlayer):sendSystemMessage("You attempt to read your own mind. Echo, echo, echo, echo....")
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
		CreatureObject(pPlayer):sendSystemMessage("Trying to read your own mind results in feedback. EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE.")
		return
	end	
	
	local forcePower = math.floor(PlayerObject(pGhost):getForcePower())
	
	fpi = math.floor(fpi)
	
	if(forcePower < fpi) then
		CreatureObject(pPlayer):sendSystemMessage("You don't have enough Force Power to commit " .. fpi .. " points.")
		return
	end
	
	if(tonumber(CreatureObject(pTarget):getSkillMod("rp_mindfulness")) > 6) then
		CreatureObject(pPlayer):doAnimation("force_persuasion")			
		broadcastMessageWithName(pPlayer, CreatureObject(pPlayer):getFirstName() .. " tried to read " .. CreatureObject(pTarget):getFirstName() .. "'s mind, but failed.")
		PlayerObject(pGhost):setForcePower(forcePower - fpi)
		return
	end
	
	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_sense"))
	local yourTotal = skillValue +  fpi
	
	local message = CreatureObject(pPlayer):getFirstName() .. " used " .. self.name .. "!"
	local targetName = CreatureObject(pTarget):getFirstName() 
	
	message = message .. " They peer into " .. targetName .. "'s mind and see their true intentions. The next time " .. targetName 
	message = message .. " uses a social skill against them, they can use the score of " .. yourTotal .. " instead of a composure or resolve roll."
	
	CreatureObject(pPlayer):doAnimation("force_persuasion")	
	broadcastMessageWithName(pPlayer, message)
	
	PlayerObject(pGhost):setForcePower(forcePower - fpi)
	
end