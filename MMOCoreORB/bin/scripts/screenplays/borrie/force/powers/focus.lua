BorForce_Focus = {
	name = "Force Focus",
	animationName = "clienteffect/pl_force_feedback_self.cef"
}

function BorForce_Focus:showHelp(pPlayer)
	local helpMessage = self.name .. ": "
	helpMessage = helpMessage .. "As a minor action, roll Inward vs DC 15 to add FPI as a bonus to your next attack or active skill roll."
	CreatureObject(pPlayer):sendSystemMessage(helpMessage)
end

function BorForce_Focus:execute(pPlayer)
	local hasPower = CreatureObject(pPlayer):hasSkill("rp_frc_focus")
	
	if(hasPower == false) then
		BorForceUtility:reportPowerNotKnown(pPlayer)
		return
	end
	
	local fpi = BorForceUtility:getForcePointInput(pPlayer)
	
	if(fpi < 1) then
		BorForceUtility:promptForcePointInput(pPlayer, self.name, "BorForce_Focus", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Focus:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_Focus:performAbility(pPlayer, fpi)
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
	
	local message = CreatureObject(pPlayer):getFirstName() .. " used " .. self.name .. ", rolling 1d20: " .. forceDieValue .. " + " .. skillValue  .. " = " .. forceTotal .. " vs DC 15"
	local targetName = CreatureObject(pTarget):getFirstName() 
	
	if(forceTotal > 15) then
		message = message .. ". They successfully hone their focus, gaining a bouns of " .. fpi .. " on their next active skill roll!" 
	
		CreatureObject(pPlayer):doAnimation("force_persuasion")	
		broadcastMessageWithName(pPlayer, message)
	end
	if (forceTotal <= 15) then
		message = message .. ". But they fail to focus!"
	
		CreatureObject(pPlayer):doAnimation("force_persuasion")	
		broadcastMessageWithName(pPlayer, message)
	end
	
	--Drain Force Pool
	PlayerObject(pGhost):setForcePower(forcePower - fpi)	
	
end