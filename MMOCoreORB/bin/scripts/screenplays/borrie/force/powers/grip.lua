BorForce_Grip = {
	name = "Force Grip",
	animationName = "force_choke",
	maxRange = 40,
	--corruptionPoints = 1,
}

function BorForce_Grip:showHelp(pPlayer)
	local helpMessage = self.name .. ": "
	helpMessage =  helpMessage .. "As a major action, roll Telekinesis + FPI vs Strength to render target within 40 meters immobile, preventing them from performing actions."
	CreatureObject(pPlayer):sendSystemMessage(helpMessage)
end


function BorForce_Grip:execute(pPlayer)

	local hasPower = CreatureObject(pPlayer):hasSkill("rp_frc_grip")
	
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
		CreatureObject(pPlayer):sendSystemMessage("Invalid target. You cannot target yourself with this ability. Is this really the right time to grip yourself?")
		return
	end
	
	if(SceneObject(pPlayer):getDistanceTo(pTarget) > self.maxRange) then
		CreatureObject(pPlayer):sendSystemMessage("Your target is too far away.")
		return
	end
	
	local fpi = BorForceUtility:getForcePointInput(pPlayer)
	
	if(fpi < 1) then
		BorForceUtility:promptForcePointInput(pPlayer, self.name, "BorForce_Grip", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Grip:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_Grip:performAbility(pPlayer, fpi)
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
		CreatureObject(pPlayer):sendSystemMessage("Invalid target. You cannot target yourself with this ability.")
		return
	end
	
	if(SceneObject(pPlayer):getDistanceTo(pTarget) > self.maxRange) then
		CreatureObject(pPlayer):sendSystemMessage("Your target is too far away.")
		return
	end
	
	local forcePower = math.floor(PlayerObject(pGhost):getForcePower())
	
	fpi = math.floor(fpi)
	
	if(forcePower < fpi) then
		CreatureObject(pPlayer):sendSystemMessage("You don't have enough Force Power to commit " .. fpi .. " points.")
		return
	end
	
	local targetName = CreatureObject(pTarget):getFirstName() 
	
	--Begin Force Code
	local forceDieValue = math.random(1, 20)
	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_telekinesis"))
	local forceTotal = math.floor(forceDieValue + skillValue +  fpi)

	local defenderDieValue = math.floor(math.random(1, 20))
	local defenderStrength = math.floor(tonumber(CreatureObject(pTarget):getSkillMod("rp_strength")))
	local defenderTotal = math.floor(defenderDieValue + defenderStrength)
	
	
	local message = CreatureObject(pPlayer):getFirstName() .. " used " .. self.name .. ", rolling 1d20: " .. forceDieValue .. " + " .. skillValue .. " + " .. fpi
	message = message .. " = " .. forceTotal .. " vs 1d20: " .. defenderDieValue .. " + " .. defenderStrength .. " = " .. defenderTotal
	local targetName = CreatureObject(pTarget):getFirstName() 
	
	if(forceTotal > defenderTotal) then
		message = message .. ". " .. targetName .. "is rendered immobile by invisible bonds!"
	
		CreatureObject(pPlayer):doAnimation("force_choke_1_particle_level_1")	
		broadcastMessageWithName(pPlayer, message)
	end
	if (forceTotal <= defenderTotal) then
		message = message .. ". But they fail to affect " .. targetName .. "!"
	
		CreatureObject(pPlayer):doAnimation("force_choke_1_particle_level_1")	
		broadcastMessageWithName(pPlayer, message)
	end
	
	--Drain Force Pool Accordingly.
	PlayerObject(pGhost):setForcePower(forcePower - fpi)	
end