BorForce_Speed = {
	name = "Force Speed"
}

function BorForce_Speed:showHelp(pPlayer)
	local helpMessage = self.name .. ": "
	helpMessage =  helpMessage .. "Allows you to move <Force Point Input> * 2 extra meters on your next move turn."
	helpMessage = helpMessage .. " If you pass a DC 30 Check against your Alter skill with your FPI as a modifier, you can perform two major actions in your next turn."
	CreatureObject(pPlayer):sendSystemMessage(helpMessage)
end

function BorForce_Speed:execute(pPlayer)

	local hasPower = CreatureObject(pPlayer):hasSkill("rp_frc_speed")
	
	if(hasPower == false) then
		BorForceUtility:reportPowerNotKnown(pPlayer)
		return
	end

	
	local fpi = BorForceUtility:getForcePointInput(pPlayer)
	
	if(fpi < 1) then
		BorForceUtility:promptForcePointInput(pPlayer, self.name, "BorForce_Speed", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Speed:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_Speed:performAbility(pPlayer, fpi)
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
	
	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_alter"))
	local roll = math.floor(math.random(1,20))	
		
	local message = CreatureObject(pPlayer):getFirstName() .. " used " .. self.name .. "!"
	message = message .. " They can go up to " .. fpi * 2 .. " extra meters on their next move action!"
	if(skillValue + roll + fpi >= 30) then
		message = message .. " or, they can perform two major actions the next turn! (1d20 = " .. roll .. " + " .. skillValue .. " + " .. fpi .. " = " .. roll + skillValue + fpi .. " vs DC: 30)"
	else 
		message = message .. " (1d20 = " .. roll .. " + " .. skillValue .. " + " .. fpi .. " = " .. roll + skillValue + fpi.. " vs DC: 30) (Bonus failed)"
	end
	
	broadcastMessageWithName(pPlayer, message)
	
	PlayerObject(pGhost):setForcePower(forcePower - fpi)
	
	local clientEffect = "clienteffect/pl_force_speed_self.cef"
	CreatureObject(pPlayer):playEffect(clientEffect, "")	
end
