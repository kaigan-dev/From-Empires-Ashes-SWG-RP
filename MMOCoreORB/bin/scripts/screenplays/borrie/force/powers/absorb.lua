BorForce_Absorb = {
		name = "Force Abrosb",
}

function BorForce_Absorb:showHelp(pPlayer)
	local helpMessage = self.name .. ": "
	helpMessage =  helpMessage .. "As a defensive reaction, attempt to absorb the energy of an incoming non-kinetic attack at a cost of 3 Force pool. This rolls your Inward against DC 15, or DC 18 if the attack is weilding a lightsaber. On a success, you absorb the incoming bolt harmlessly, negating the damage."
	CreatureObject(pPlayer):sendSystemMessage(helpMessage)
end

function BorForce_Absorb:execute(pPlayer)
	CreatureObject(pPlayer):sendSystemMessage("Use the /rpsetstance menu to enable the Absorb defensive reaction.")
end