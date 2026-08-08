/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef ATTACKRPCOMMAND_H_
#define ATTACKRPCOMMAND_H_

#include "server/zone/borrie/BorCombat.h"
#include "server/zone/borrie/BorEffect.h"

class AttackRpCommand : public QueueCommand {

public:
	AttackRpCommand(const String& name, ZoneProcessServer* server) : QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		if (!creature->isPlayerCreature())
			return GENERALERROR;

		ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();

		if (ghost == nullptr)
			return GENERALERROR;

		int adminLevelCheck = ghost->getAdminLevel();

		if (creature->getStoredInt("secretdm") == 1) {
			adminLevelCheck = 15;
		}

		ManagedReference<SceneObject*> object;
		if (target != 0) {
			object = server->getZoneServer()->getObject(target, false);
		} else {
			creature->sendSystemMessage("You need a target to attack!");
			return SUCCESS;
		}

		if (object == nullptr)
			return GENERALERROR;

		ManagedReference<CreatureObject*> targetCreature;

		if (object->isCreatureObject()) {
			targetCreature = object->asCreatureObject();
		} else {
			creature->sendSystemMessage("You need a target to attack!");
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
				BorEffect::PerformReactiveAnimation(targetCreature, creature, "hit", CombatManager::HIT_BODY, true);
			} else if(command == "nolos") {
				BorCombat::AttackTarget(creature, targetCreature, creature, -1, false, true);
			} else if(command == "advantage" || command == "adv") {
				BorCombat::AttackTarget(creature, targetCreature, creature, -1, false, noLos, 1);
			} else if(command == "disadvantage" || command == "dis" || command == "disadv") {
				BorCombat::AttackTarget(creature, targetCreature, creature, -1, false, noLos, 2);
			}
		} else {
			creature->sendSystemMessage("Debug: Starting actual attack somehow.");
			BorCombat::AttackTarget(creature, targetCreature, creature, -1, false);
		}

		return SUCCESS;
	}
};

#endif 
