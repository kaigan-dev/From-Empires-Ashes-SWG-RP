BorForce_ManipulateObject = {
	name = "Manipulate Object",
	animationName = "force_choke"
}

function BorForce_ManipulateObject:showHelp(pPlayer)
	local helpMessage = self.name .. ": "
	helpMessage = helpMessage .. "As a major action, roll Sense + FPI vs Resolve to read the target's surface thoughts."
	CreatureObject(pPlayer):sendSystemMessage(helpMessage)
end

function BorForce_ManipulateObject:execute(pPlayer)

	local hasPower = CreatureObject(pPlayer):hasSkill("rp_frc_manip")
	
	if(hasPower == false) then
		BorForceUtility:reportPowerNotKnown(pPlayer)
		return
	end

	
	local fpi = BorForceUtility:getForcePointInput(pPlayer)
	
	if(fpi < 1) then
		BorForceUtility:promptForcePointInput(pPlayer, self.name, "BorForce_ManipulateObject", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_ManipulateObject:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_ManipulateObject:performAbility(pPlayer, fpi)
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