BorForce_Speed = {
	name = "Force Speed"
}

function BorForce_Speed:showHelp(pPlayer)
	local helpMessage = self.name .. ": "
	helpMessage =  helpMessage .. "As a minor action, roll Alter vs DC 10. On a success you gain extra move distance for the rest of this turn equal to 3 times the FPI spent. You may then perform a free movement action."
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
	

	--Begin Force Code
	local forceDieValue = math.random(1, 20)
	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_alter"))
	local forceTotal = math.floor(forceDieValue + skillValue)	
		
	local message = CreatureObject(pPlayer):getFirstName() .. " used " .. self.name .. ", rolling 1d20: " .. forceDieValue .. " + " .. skillValue .. " = " .. forceTotal .. " vs DC 10."

	if(forceTotal >= 10) then
		message = message .. " They move with a sudden burst of inhuman speed, gaining " .. fpi .. " extra meters of movement for the rest of the turn. They may also immediately perform a free move action."

		local clientEffect = "clienteffect/pl_force_speed_self.cef"
		CreatureObject(pPlayer):playEffect(clientEffect, "")	
	else 
		message = message .. " But their focus is broken and they fail to achieve a burst of speed."
	end
	
	broadcastMessageWithName(pPlayer, message)
	

	--Drain Force Pool Accordingly.
	PlayerObject(pGhost):setForcePower(forcePower - fpi)	


end
