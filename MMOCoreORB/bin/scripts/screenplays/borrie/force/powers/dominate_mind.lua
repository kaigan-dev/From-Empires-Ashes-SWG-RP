BorForce_DominateMind = {
	name = "Dominate Mind",
	animationName = "force_mind_blast_1_particle_level_1",
	maxRange = 64,
	--corruptionPoints = 1,
}

function BorForce_DominateMind:showHelp(pPlayer)
	local helpMessage = self.name .. ": "
	helpMessage = helpMessage .. "As a major action, roll Control + FPI vs Resolve to force the targe tto perform one action per 10 points of success in the roll's result. These are two turns' worth of actions in combat or GM discretion out of combat. The target cannot be ordered to kill or severely injure themselves."
	CreatureObject(pPlayer):sendSystemMessage(helpMessage)
end

function BorForce_DominateMind:execute(pPlayer)
	
	
	local hasPower = CreatureObject(pPlayer):hasSkill("rp_frc_dominate")
	
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
		CreatureObject(pPlayer):sendSystemMessage("Invalid target. You cannot target yourself with this ability. You are already the master of your domain.")
		return
	end
	
	if(SceneObject(pPlayer):getDistanceTo(pTarget) > self.maxRange) then
		CreatureObject(pPlayer):sendSystemMessage("Your target is too far away.")
		return
	end
	
	local fpi = BorForceUtility:getForcePointInput(pPlayer)
	
	if(fpi < 1) then
		BorForceUtility:promptForcePointInput(pPlayer, self.name, "BorForce_DominateMind", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_DominateMind:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_DominateMind:performAbility(pPlayer, fpi)
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
	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_control"))
	local forceTotal = math.floor(forceDieValue + skillValue +  fpi)
	local actionCount = math.floor(math.min(1, forceTotal / 10))

	local defenderDieValue = math.floor(math.random(1, 20))
	local defenderResolve = math.floor(tonumber(CreatureObject(pTarget):getSkillMod("rp_resolve")))
	local defenderTotal = math.floor(defenderDieValue + defenderResolve)
	
	local message = CreatureObject(pPlayer):getFirstName() .. " used " .. self.name .. ", rolling 1d20: " .. forceDieValue .. " + " .. skillValue .. " + " .. fpi
	message = message .. " = " .. forceTotal .. " vs 1d20: " .. defenderDieValue .. " + " .. defenderResolve .. " = " .. defenderTotal
	local targetName = CreatureObject(pTarget):getFirstName() 
	
	if(forceTotal > defenderTotal) then
		message = message .. ". They succesfully take control of " .. targetName .. " and may determine their next " .. actionCount .. " actions!" 
	
		CreatureObject(pPlayer):doAnimation("force_mind_blast_1_particle_level_1")	
		broadcastMessageWithName(pPlayer, message)
	end
	if (forceTotal <= defenderTotal) then
		message = message .. ". But they fail to take control of " .. targetName .. "'s mind!"
	
		CreatureObject(pPlayer):doAnimation("force_mind_blast_1_particle_level_1")	
		broadcastMessageWithName(pPlayer, message)
	end


	--Drain Force Pool Accordingly.
	PlayerObject(pGhost):setForcePower(forcePower - fpi)	
end