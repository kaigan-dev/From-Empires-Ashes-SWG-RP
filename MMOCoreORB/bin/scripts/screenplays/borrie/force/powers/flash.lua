BorForce_Flash = {
	name = "Force Flash",
	range = 20
}

function BorForce_Flash:showHelp(pPlayer)
	local helpMessage = self.name .. ": "
	helpMessage =  helpMessage .. "As a major action, roll Control + FPI vs Composure. On a success, the target may not perform any action other than movement on their following turn."
	CreatureObject(pPlayer):sendSystemMessage(helpMessage)
end

function BorForce_Flash:execute(pPlayer)
	local hasPower = CreatureObject(pPlayer):hasSkill("rp_frc_flash")
	
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
		CreatureObject(pPlayer):sendSystemMessage("It's generally advised not to blind yourself.")
		return
	end
	
	if(SceneObject(pPlayer):getDistanceTo(pTarget) > self.range) then
		CreatureObject(pPlayer):sendSystemMessage("Your target is too far away.")
		return
	end
	
	local fpi = BorForceUtility:getForcePointInput(pPlayer)
	
	if(fpi < 1) then
		BorForceUtility:promptForcePointInput(pPlayer, self.name, "BorForce_Flash", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Flash:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_Flash:performAbility(pPlayer, fpi)
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
		CreatureObject(pPlayer):sendSystemMessage("Sadly, you cannot use the Force to convince yourself to make what is probably a bad decision.")
		return
	end
	
	if(SceneObject(pPlayer):getDistanceTo(pTarget) > self.range) then
		CreatureObject(pPlayer):sendSystemMessage("Your target is too far away.")
		return
	end
	
	local forcePower = math.floor(PlayerObject(pGhost):getForcePower())
	
	fpi = math.floor(fpi)
	
	if(forcePower < fpi) then
		CreatureObject(pPlayer):sendSystemMessage("You don't have enough Force Power to commit " .. fpi .. " points.")
		return
	end
	
	
	--Begin Force Code
	local forceDieValue = math.random(1, 20)
	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_control"))
	local forceTotal = math.floor(forceDieValue + skillValue +  fpi)

	local defenderDieValue = math.floor(math.random(1, 20))
	local defenderComposure = math.floor(tonumber(CreatureObject(pTarget):getSkillMod("rp_composure")))
	local defenderTotal = math.floor(defenderDieValue + defenderComposure)
	
	local message = CreatureObject(pPlayer):getFirstName() .. " used " .. self.name .. ", rolling 1d20: " .. forceDieValue .. " + " .. skillValue .. " + " .. fpi
	message = message .. " = " .. forceTotal .. " vs 1d20: " .. defenderDieValue .. " + " .. defenderComposure .. " = " .. defenderTotal
	local targetName = CreatureObject(pTarget):getFirstName() 
	
	if(forceTotal > defenderTotal) then
		message = message .. ". They succesfully blind " .. targetName .. ", preventing them from taking non-move actions on their next turn!" 
	
		CreatureObject(pPlayer):doCombatAnimation(pPlayer, pTarget, "force_mind_blast_1_particle_level_1_light")
		broadcastMessageWithName(pPlayer, message)
	end
	if (forceTotal <= defenderTotal) then
		message = message .. ". But " .. targetName .. " is not distracted and may act normally!"
	
		CreatureObject(pPlayer):doAnimation("force_persuasion")	
		broadcastMessageWithName(pPlayer, message)
	end
	

	--Drain Force Pool Accordingly.
	PlayerObject(pGhost):setForcePower(forcePower - fpi)
	
end