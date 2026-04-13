BorForce_Shock = {
	name = "Force Shock",
	animationName = "force_lightning_1_particle_level_1_medium",
	maxRange = 30
}

function BorForce_Shock:showHelp(pPlayer)
		local helpMessage = self.name .. ": "
	helpMessage =  helpMessage .. "As a major action, roll Lightning + FPI vs Constitution to deal 1d8 Electric damage to a target within 30 meters. If your roll exceeds their Constitution check, they are unable to perform major actions on their next turn."
	CreatureObject(pPlayer):sendSystemMessage(helpMessage)
end

function BorForce_Shock:execute(pPlayer)

	local hasPower = CreatureObject(pPlayer):hasSkill("rp_frc_shock")
	
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
		BorForceUtility:promptForcePointInput(pPlayer, self.name, "BorForce_Shock", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Shock:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_Shock:performAbility(pPlayer, fpi)
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
	local damageDie = math.floor(math.random(1, 8))
	local damageTotal = math.floor(damageDie)

	local defenderDieValue = math.floor(math.random(1, 20))
	local defenderCon = math.floor(tonumber(CreatureObject(pTarget):getSkillMod("rp_constitution")))
	local defenderTotal = math.floor(defenderDieValue + defenderConstitution)
	
	local message = CreatureObject(pPlayer):getFirstName() .. " used " .. self.name .. ", rolling 1d20: " .. forceDieValue .. " + " .. skillValue .. " = " .. forceTotal .. " vs DC " .. dc
	local targetName = CreatureObject(pTarget):getFirstName() 
	

	if(forceTotal > 10) then
		message = message .. ". They succesfully zap " .. targetName .. ", dealing 1d8 = " .. damageTotal .. " electric damage. "
	
		if(forceTotal > defenderTotal) then
			message = message .. targetName .. " is stunned and loses their next action!"
	
			CreatureObject(pPlayer):doAnimation("force_lightning_1_particle_level_1_medium")	

		else
			message = message .. targetName .. " braces against the blast and is not stunned!"
			CreatureObject(pPlayer):doAnimation("force_lightning_1_particle_level_1_medium")	
			
		end
	
	else
		message = message .. ". But they fail to call forth lightning!"
		CreatureObject(pPlayer):doAnimation("force_persuasion")	
	end

	broadcastMessageWithName(pPlayer, message)

	--Drain Force Pool Accordingly.
	PlayerObject(pGhost):setForcePower(forcePower - fpi)	
end