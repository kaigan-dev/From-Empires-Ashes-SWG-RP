BorForce_Rage = {
	name = "Force Rage",
	animationName = "force_protection",
	clientEffect = "clienteffect/pl_force_speed_self.cef",
	--corruptionPoints = 1,
}

function BorForce_Rage:showHelp(pPlayer)
	local helpMessage = self.name .. ": "
	helpMessage = helpMessage .. "As a minor action, roll Inward + vs DC 10 to add the FPI spent as a bonus to your next attack's damage. Additionally, roll Composure vs DC 10. On a failure, your next major action must be an attack against the nearest target regardless of whether they are friend or foe."
	CreatureObject(pPlayer):sendSystemMessage(helpMessage)
end

function BorForce_Rage:execute(pPlayer)

	local hasPower = CreatureObject(pPlayer):hasSkill("rp_frc_rage")
	
	if(hasPower == false) then
		BorForceUtility:reportPowerNotKnown(pPlayer)
		return
	end

	
	local fpi = BorForceUtility:getForcePointInput(pPlayer)
	
	if(fpi < 1) then
		BorForceUtility:promptForcePointInput(pPlayer, self.name, "BorForce_Rage", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Rage:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_Rage:performAbility(pPlayer, fpi)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local forcePower = math.floor(PlayerObject(pGhost):getForcePower())
	
	fpi = math.floor(fpi)
	
	if(forcePower < fpi) then
		CreatureObject(pPlayer):sendSystemMessage("You don't have enough Force Power to commit " .. fpi .. " points.")
		return
	end
	
	--Execute Force Code
	local forceDieValue = math.random(1, 20)
	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_inward"))
	local forceTotal = math.floor(forceDieValue + skillValue)
	
	local message = CreatureObject(pPlayer):getFirstName() .. " used " .. self.name .. ", rolling 1d20: " .. forceDieValue .. " + " .. skillValue  .. " = " .. forceTotal .. " vs DC 10"
	local targetName = CreatureObject(pTarget):getFirstName() 
	
	if(forceTotal > 10) then
		message = message .. ". They successfully stoke their rage, gaining a bouns of " .. fpi .. " to the damage of their next next attack!" 
		--CreatureObject(pPlayer):doAnimation("force_persuasion")	
		broadcastMessageWithName(pPlayer, message)
	else
		message = message .. ". But they fail to focus!"
		--CreatureObject(pPlayer):doAnimation("force_persuasion")	
		broadcastMessageWithName(pPlayer, message)
	end

	local composureDieValue = math.random(1, 20)
	local composureValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_composure"))
	local composureTotal = math.floor(forceDieValue + skillValue)
			
	if(composureTotal > 10) then
		message = CreatureObject(pPlayer):getFirstName() .. " successfully harnesses their anger and may act freely (1d20: " .. composureDieValue .. " + " .. composureValue  .. " = " .. composureTotal .. " vs DC 10)!"
		--CreatureObject(pPlayer):doAnimation("force_persuasion")	
		broadcastMessageWithName(pPlayer, message)
	else
		message = CreatureObject(pPlayer):getFirstName() .. " loses control of their anger and must use their next action to attack the closest target (1d20: " .. composureDieValue .. " + " .. composureValue  .. " = " .. composureTotal .. " vs DC 10)!"
		--CreatureObject(pPlayer):doAnimation("force_persuasion")
		broadcastMessageWithName(pPlayer, message)
	end

	--Drain Force Pool
	PlayerObject(pGhost):setForcePower(forcePower - fpi)	
	
end