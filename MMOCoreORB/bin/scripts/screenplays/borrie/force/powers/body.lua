BorForce_Body = {
	name = "Force Body"	
}

function BorForce_Body:showHelp(pPlayer)
	local helpMessage = self.name .. ": "
	helpMessage =  helpMessage .. "Roll against DC:10 Check (Inward Roll + 1d20) to heal your action pool for <ForcePointInput> * 2."
	CreatureObject(pPlayer):sendSystemMessage(helpMessage)
end

function BorForce_Body:execute(pPlayer)

	local hasPower = CreatureObject(pPlayer):hasSkill("rp_frc_body")
	
	if(hasPower == false) then
		BorForceUtility:reportPowerNotKnown(pPlayer)
		return
	end


	local fpi = BorForceUtility:getForcePointInput(pPlayer)
	
	if(fpi < 1) then
		BorForceUtility:promptForcePointInput(pPlayer, self.name, "BorForce_Body", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Body:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_Body:performAbility(pPlayer, fpi)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local forcePower = math.floor(PlayerObject(pGhost):getForcePower())
	
	fpi = math.floor(fpi)
	
	local clientEffect = "clienteffect/pl_force_heal_self.cef"
	
	if(forcePower < fpi) then
		CreatureObject(pPlayer):sendSystemMessage("You don't have enough Force Power to commit " .. fpi .. " points.")
		return
	end
	
	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_inward"))
	local roll = math.floor(math.random(1,20))	
		
	local message = CreatureObject(pPlayer):getFirstName() .. " used " .. self.name .. "!"
	if(skillValue + roll >= 10) then
		message = message .. " They rejuvinate themselves for ".. fpi * 2 .." action points! (1d20 = " .. roll .. " + " .. skillValue .. " = " .. roll + skillValue .. " vs DC: 10)"
		CreatureObject(pPlayer):playEffect(clientEffect, "")	
		CreatureObject(pPlayer):setHAM(3, math.min(CreatureObject(pPlayer):getHAM(3) + fpi * 2, CreatureObject(pPlayer):getMaxHAM(3)))
	else 
		message = message .. " Unfortunately, their focus is broken, and they fail to rejuvinate themselves. (1d20 = " .. roll .. " + " .. skillValue .. " = " .. roll + skillValue .. " vs DC: 10)"
	end
	
	broadcastMessageWithName(pPlayer, message)
	
	PlayerObject(pGhost):setForcePower(forcePower - fpi)	
end