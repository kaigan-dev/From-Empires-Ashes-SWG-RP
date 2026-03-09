/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef ATTACKNPCCOMMAND_H_
#define ATTACKNPCCOMMAND_H_

#include "server/zone/borrie/BorCombat.h"

class AttackNpcCommand : public QueueCommand {

public:
	AttackNpcCommand(const String& name, ZoneProcessServer* server) : QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		if (!creature->isPlayerCreature())
			return GENERALERROR;

		// Check if a stored target exists prior to setting one. If not, exit the command. Failing to do this crashes the server.
		// FEA - Kaigan, 2/22/26	
		if (!creature->getStoredLong("storedtarget"))
		{
			creature->sendSystemMessage("You need a stored target to be the attacker!");
			return SUCCESS;
		}
			
		uint64 storedTarget = creature->getStoredLong("storedtarget");

		ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();

		if (ghost == nullptr)
			return GENERALERROR;

		int adminLevelCheck = ghost->getAdminLevel();

		if (creature->getStoredInt("secretdm") == 1) {
			adminLevelCheck = 15;
		}

		if(adminLevelCheck < 1) {
			creature->sendSystemMessage("You don't have the right permissions to do that.");
			return SUCCESS;
		}

		ManagedReference<SceneObject*> object;
		if (target != 0) {
			object = server->getZoneServer()->getObject(target, false);
		} else {
			creature->sendSystemMessage("You need a target to attack!");
			return SUCCESS;
		}

		ManagedReference<SceneObject*> storedObject;
		if (storedTarget != 0) {
			storedObject = server->getZoneServer()->getObject(storedTarget, false);
		} else {
			creature->sendSystemMessage("You need a stored target to be the attacker!");
			return SUCCESS;
		}

		ManagedReference<CreatureObject*> targetCreature;

		if (object->isCreatureObject() && storedObject != nullptr && storedObject.get() != nullptr) {
			targetCreature = object->asCreatureObject();
		} else {
			creature->sendSystemMessage("You need a target to attack!");
			return SUCCESS;
		}

		ManagedReference<CreatureObject*> storedTargetCreature;

		if (storedObject->isCreatureObject() && storedObject != nullptr && storedObject.get() != nullptr) {
			storedTargetCreature = storedObject->asCreatureObject();
		} else {
			creature->sendSystemMessage("You need a stored target to be the attacker!");
			return SUCCESS;
		}

		StringTokenizer args(arguments.toString());

		String command;

		if (args.hasMoreTokens()) {
			args.getStringToken(command);
			bool noLos = false;
			if(args.hasMoreTokens()) {
				String commandIsNolos;
				args.getStringToken(commandIsNolos);
				if(commandIsNolos == "nolos")
					noLos = true;
			}

			if(command == "faux") {
				BorEffect::PerformReactiveAnimation(storedTargetCreature, targetCreature, "hit", CombatManager::HIT_BODY, true);
			} else if (command == "power") {
				BorCombat::AttackTarget(storedTargetCreature, targetCreature, creature, -1, true, noLos);
			} else if(command == "flurry") {
				BorCombat::FlurryAttackTarget(storedTargetCreature, targetCreature, creature, noLos);
			} else if(command == "aimed") {
				creature->sendSystemMessage("Not yet implemented, sorry. Complain to Borrie.");
			} else if(command == "nolos") {
				BorCombat::AttackTarget(storedTargetCreature, targetCreature, creature, -1, false, true);
			}
		} else {
			BorCombat::AttackTarget(storedTargetCreature, targetCreature, creature, -1, false);
		}

		return SUCCESS;
	}

};

#endif 
