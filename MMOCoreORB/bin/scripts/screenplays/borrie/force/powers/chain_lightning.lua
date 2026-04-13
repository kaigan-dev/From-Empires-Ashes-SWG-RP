BorForce_ChainLightning = {
	name = "Chain Lightning",
	animationName = "force_intimidate",
	maxRange = 30,
	--corruptionPoints = 1,
}

function BorForce_ChainLightning:showHelp(pPlayer)
	local helpMessage = self.name .. ": "
	helpMessage =  helpMessage .. "As a major action, roll Lightning vs DC (10 + number of targets) to deal 1d8 + FPI Electric damage to a number of targets up to half your Lightning skill within 30 meters."
	CreatureObject(pPlayer):sendSystemMessage(helpMessage)
end

function BorForce_ChainLightning:execute(pPlayer)

	local hasPower = CreatureObject(pPlayer):hasSkill("rp_frc_chain")
	
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
		CreatureObject(pPlayer):sendSystemMessage("Invalid target. You cannot target yourself with this ability.")
		return
	end
	
	if(SceneObject(pPlayer):getDistanceTo(pTarget) > self.maxRange) then
		CreatureObject(pPlayer):sendSystemMessage("Your target is too far away.")
		return
	end
	
	local fpi = BorForceUtility:getForcePointInput(pPlayer)
	
	if(fpi < 1) then
		BorForceUtility:promptForcePointInput(pPlayer, self.name, "BorForce_ChainLightning", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_ChainLightning:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_ChainLightning:performAbility(pPlayer, fpi)
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
	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_lightning"))
	local forceTotal = math.floor(forceDieValue + skillValue)
	local numTargets = math.floor(skillValue / 2)
	local dc = math.floor(10 + numTargets)
	local damageDie = math.floor(math.random(1, 8))
	local damageTotal = math.floor(damageDie + fpi)
	
	local message = CreatureObject(pPlayer):getFirstName() .. " used " .. self.name .. ", rolling 1d20: " .. forceDieValue .. " + " .. skillValue .. " = " .. forceTotal .. " vs DC " .. dc
	local targetName = CreatureObject(pTarget):getFirstName() 
	
	if(forceTotal > dc) then
		message = message .. ". They succesfully blast " .. targetName .. " and up to "  .. numTargets .. " other targets with lightning, dealing 1d8 + " .. fpi " = " .. damageTotal .. " electric damage!"
	
		CreatureObject(pPlayer):doAnimation("force_lightning_1_particle_level_3")	
		broadcastMessageWithName(pPlayer, message)
	end
	if (forceTotal <= dc) then
		message = message .. ". But they fail to call forth lightning!"
	
		CreatureObject(pPlayer):doAnimation("force_persuasion")	
		broadcastMessageWithName(pPlayer, message)
	end
	
	--Drain Force Pool Accordingly.
	PlayerObject(pGhost):setForcePower(forcePower - fpi)	
end