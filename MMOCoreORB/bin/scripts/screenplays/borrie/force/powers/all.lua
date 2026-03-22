BorForceUtility = {

}

function BorForceUtility:getForcePointInput(pPlayer) 
	if(pPlayer ~= nil) then
		return SceneObject(pPlayer):getStoredInt("force_command_fpi")
	else
		return 0
	end
end

function BorForceUtility:reportPowerNotKnown(pPlayer)
	CreatureObject(pPlayer):sendSystemMessage("You don't have the pre-requisites to use this force power.")
end

function BorForceUtility:capMaximumAllowedForcePoints(pPlayer, inputPoints)
	if(inputPoints == 0) then 
		return 0
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	
	if (pGhost == nil) then
		return 0
	end
	 
	local forcePowerMax = PlayerObject(pGhost):getForcePowerMax()	
	
	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_master")) then -- Master of the Force
		return math.min(PlayerObject(pGhost):getForcePowerMax(), inputPoints)
	elseif(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_04")) then -- Journeyman
		return math.min(PlayerObject(pGhost):getForcePowerMax() / 2, inputPoints)
	elseif(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_03")) then -- Adept
		return math.min(PlayerObject(pGhost):getForcePowerMax() / 4, inputPoints)
	elseif(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_02")) then -- Initiated
		return math.min(4, inputPoints)
	elseif(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01")) then -- Aware
		return 1
	elseif(CreatureObject(pPlayer):hasSkill("rp_force_prog_novice")) then -- Force Sensitive
		return 0
	else 
		return 0
	end
	
end

function BorForceUtility:promptForcePointInput(pPlayer, powerName, screenplay, callback)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	
	if (pGhost == nil) then
		return
	end

	local forcePower = PlayerObject(pGhost):getForcePower()	
	
	local usableForcePower = math.floor(self:capMaximumAllowedForcePoints(pPlayer, forcePower))
	
	local suiManager = LuaSuiManager()
	local optionsTo = {"Force Pool", usableForcePower, 1}
	local optionsFrom = {"Applied Power", 0, 1}	
	suiManager:sendTransferBox(pPlayer, pPlayer, "Force Point Input", powerName .. ": How many force points do you wish to commit to using this power?", "Okay", screenplay, callback, optionsFrom, optionsTo)	
end