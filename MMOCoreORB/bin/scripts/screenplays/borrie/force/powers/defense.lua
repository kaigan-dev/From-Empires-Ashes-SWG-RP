BorForce_Defense = {
	name = "Force Defense",
	effectName = "clienteffect/pl_force_shield_self.cef",
}

function BorForce_Defense:showHelp(pPlayer)
	local helpMessage = self.name .. ": "
	helpMessage =  helpMessage .. "As a defensive reaction, attempt to intercept ranged energy attacks with an equipped lightsaber at a cost of 3 AP. The defender rolls Lightsaber against the attack roll, harmlessly deflecting the shot if successful. If the defender's roll is at least 4 higher than the attack roll, the shot is deflected back at its source dealing half damage."
	CreatureObject(pPlayer):sendSystemMessage(helpMessage)
end

function BorForce_Defense:execute(pPlayer)
	
	local hasPower = CreatureObject(pPlayer):hasSkill("rp_frc_defense")
	
	if(hasPower == false) then
		BorForceUtility:reportPowerNotKnown(pPlayer)
		return
	end

	local fpi = BorForceUtility:getForcePointInput(pPlayer)
	
	if(fpi < 1) then
		BorForceUtility:promptForcePointInput(pPlayer, self.name, "BorForce_Defense", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Defense:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_Defense:performAbility(pPlayer, fpi)
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
	
	
	--Drain Force Pool
	PlayerObject(pGhost):setForcePower(forcePower - fpi)	
	
end