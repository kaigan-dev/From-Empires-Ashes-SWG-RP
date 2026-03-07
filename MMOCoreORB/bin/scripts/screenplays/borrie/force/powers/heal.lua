BorForce_Heal = {
	name = "Force Heal Self"	
}

function BorForce_Heal:showHelp(pPlayer)
	local helpMessage = self.name .. ": "
	helpMessage =  helpMessage .. "Roll against DC:10 Check (Alter Roll + 1d20) to heal your health pool for <ForcePointInput> * 2."
	CreatureObject(pPlayer):sendSystemMessage(helpMessage)
end

function BorForce_Heal:execute(pPlayer)
	--[[ Remove Force prereqs
	local hasPower = CreatureObject(pPlayer):hasSkill("rp_alter_a01")
	
	if(hasPower == false) then
		BorForceUtility:reportPowerNotKnown(pPlayer)
		return
	end
	--]]

	local fpi = BorForceUtility:getForcePointInput(pPlayer)
	
	if(fpi < 1) then
		BorForceUtility:promptForcePointInput(pPlayer, self.name, "BorForce_Heal", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Heal:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_Heal:performAbility(pPlayer, fpi)
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
	
	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_alter"))
	local roll = math.floor(math.random(1,20))	
		
	local message = CreatureObject(pPlayer):getFirstName() .. " used " .. self.name .. "!"
	if(skillValue + roll >= 10) then
		message = message .. " They heal themselves for ".. fpi * 2 .." health points! (1d20 = " .. roll .. " + " .. skillValue .. " = " .. roll + skillValue .. " vs DC: 10)"
		CreatureObject(pPlayer):playEffect(clientEffect, "")	
		CreatureObject(pPlayer):setHAM(0, math.min(CreatureObject(pPlayer):getHAM(0) + fpi * 2, CreatureObject(pPlayer):getMaxHAM(0)))
	else 
		message = message .. " Unfortunately, their focus is broken, and they fail to heal themselves. (1d20 = " .. roll .. " + " .. skillValue .. " = " .. roll + skillValue .. " vs DC: 10)"
	end
	
	broadcastMessageWithName(pPlayer, message)
	
	PlayerObject(pGhost):setForcePower(forcePower - fpi)	
end

