BorForce_Jump = {
	name = "Force Jump"	
}

function BorForce_Jump:showHelp(pPlayer)
	local helpMessage = self.name .. ": "
	helpMessage =  helpMessage .. "As a minor action, roll Alter vs DC 10 to jump vertically or over a gap up to a distance of 3 times the FPI spent."
	CreatureObject(pPlayer):sendSystemMessage(helpMessage)
end

function BorForce_Jump:execute(pPlayer)

	local hasPower = CreatureObject(pPlayer):hasSkill("rp_frc_jump")
	
	if(hasPower == false) then
		BorForceUtility:reportPowerNotKnown(pPlayer)
		return
	end

	
	local fpi = BorForceUtility:getForcePointInput(pPlayer)
	
	if(fpi < 1) then
		BorForceUtility:promptForcePointInput(pPlayer, self.name, "BorForce_Jump", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Jump:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_Jump:performAbility(pPlayer, fpi)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	fpi = math.floor(fpi)
	
	local forcePower = math.floor(PlayerObject(pGhost):getForcePower())
	
	if(forcePower < fpi) then
		CreatureObject(pPlayer):sendSystemMessage("You don't have enough Force Power to commit " .. fpi .. " points.")
		return
	end
	

	--Begin Force Code
	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_alter"))
	local forceDieValue = math.floor(math.random(1,20))	
	local forceTotal = math.floor(forceDieValue + skillValue)
		
	local message = CreatureObject(pPlayer):getFirstName() .. " used " .. self.name .. ", rolling 1d20: " .. forceDieValue .. " + " .. skillValue .. " = " .. forceTotal .. " vs DC 10."

	if(forceTotal >= 10) then
		message = message .. " They perform an impossible leap of up to ".. fpi * 3 .." meters!"
			local clientEffect = "clienteffect/pl_force_jump.cef"
		CreatureObject(pPlayer):playEffect(clientEffect, "")	
		CreatureObject(pPlayer):doAnimation("jump")
	else 
		message = message .. " But their focus is broken and they fail to perform the leap."
	end

	--Drain Force Pool Accordingly.
	PlayerObject(pGhost):setForcePower(forcePower - fpi)
	
end
