/*
				Copyright <SWGEmu>
			Command written by BorrieBoBaka
		See file COPYING for copying conditions.*/

#ifndef POWERATTACKCOMMAND_H_
#define POWERATTACKCOMMAND_H_

class PowerattackCommand : public QueueCommand {

public: 
	PowerattackCommand(const String& name, ZoneProcessServer* server) : QueueCommand(name, server) {
	
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

		StringTokenizer args(arguments.toString());
		String command; 

		bool noLos = false;
		if (args.hasMoreTokens()) {
			args.getStringToken(command);
			if(args.hasMoreTokens()) {
				String commandIsNolos;
				args.getStringToken(commandIsNolos);
				if(commandIsNolos == "nolos")
					noLos = true;
			}
		}

		if(command == "check") {
			int powerAttackCount = creature->getStoredInt("power_attack_count");
			creature->sendSystemMessage("Your next power attack will cost " + String::valueOf(powerAttackCount + 3) + " action points.");
			return SUCCESS;
		}

		if(creature->getWeapon()->getPowerAttackIsRestricted()) {
			creature->sendSystemMessage("You can't use power attack with this weapon.");
			return SUCCESS;
		}

		ManagedReference<SceneObject*> object;
		if (target != 0) {
			object = server->getZoneServer()->getObject(target, false);
		} else {
			creature->sendSystemMessage("You need a target to attack!");
			return SUCCESS;
		}

		ManagedReference<CreatureObject*> targetCreature;

		if (object->isCreatureObject()) {
			targetCreature = object->asCreatureObject();
		} else {
			creature->sendSystemMessage("You need a target to attack!");
			return SUCCESS;
		}
		
		if(command == "nolos") {
			BorCombat::AttackTarget(creature, targetCreature, creature, -1, true, true);
		} else if(command == "advantage" || command == "adv") {
				BorCombat::AttackTarget(creature, targetCreature, creature, -1, true, noLos, 1);
		} else if(command == "disadvantage" || command == "dis" || command == "disadv") {
				BorCombat::AttackTarget(creature, targetCreature, creature, -1, true, noLos, 2);
		} else {
			BorCombat::AttackTarget(creature, targetCreature, creature, -1, true, false);
		}

		return SUCCESS;
	}

};

#endif //POWERATTACKCOMMAND_H_