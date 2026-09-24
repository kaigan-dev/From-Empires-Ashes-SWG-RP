BorForce_Stealth = {
	name = "Force Stealth",
}

function BorForce_Stealth:showHelp(pPlayer)
	local helpMessage = self.name .. ": "
	helpMessage =  helpMessage .. "As a minor action, roll Control + FPI vs DC 20. On a success you exit combat and become untargetable until the end of your next turn. The effect is broken by attacking or other significant actions."
	CreatureObject(pPlayer):sendSystemMessage(helpMessage)
end

function BorForce_Stealth:execute(pPlayer)

	local hasPower = CreatureObject(pPlayer):hasSkill("rp_frc_stealth")
	
	if(hasPower == false) then
		BorForceUtility:reportPowerNotKnown(pPlayer)
		return
	end

	
	local fpi = BorForceUtility:getForcePointInput(pPlayer)
	
	if(fpi < 1) then
		BorForceUtility:promptForcePointInput(pPlayer, self.name, "BorForce_Stealth", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Stealth:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_Stealth:performAbility(pPlayer, fpi)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local forcePower = math.floor(PlayerObject(pGhost):getForcePower())
	
	fpi = math.floor(fpi)
	
	local clientEffect = "clienteffect/pl_force_resist_disease_self.cef"
	
	if(forcePower < fpi) then
		CreatureObject(pPlayer):sendSystemMessage("You don't have enough Force Power to commit " .. fpi .. " points.")
		return
	end
	
	--Begin Force Code
	local forceDieValue = math.random(1, 20)
	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_alter"))
	local forceTotal = math.floor(forceDieValue + skillValue + fpi)	
		
	local message = CreatureObject(pPlayer):getFirstName() .. " used " .. self.name .. ", rolling 1d20: " .. forceDieValue .. " + " .. skillValue .. " + " .. fpi .. " = " .. forceTotal .. " vs DC 20."

	if(forceTotal >= 20) then
		message = message .. " They seem to vanish from the senses of those surrounding them, exiting combat and becoming untargetable until the end of their next turn!"

		local clientEffect = "clienteffect/pl_force_speed_self.cef"
		CreatureObject(pPlayer):playEffect(clientEffect, "")	
	else 
		message = message .. " But their focus is broken and they fail to vanish from the senses of those around them."
	end
	
	broadcastMessageWithName(pPlayer, message)
	

	--Drain Force Pool Accordingly.
	PlayerObject(pGhost):setForcePower(forcePower - fpi)	
end
