/*
				Copyright <SWGEmu>
			Command written by BorrieBoBaka
		See file COPYING for copying conditions.*/

#ifndef FLURRYATTACKCOMMAND_H_
#define FLURRYATTACKCOMMAND_H_

class FlurryattackCommand : public QueueCommand {

public: 
	FlurryattackCommand(const String& name, ZoneProcessServer* server) : QueueCommand(name, server) {
	
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

		if(creature->getWeapon()->getFlurryAttackIsRestricted()) {
			creature->sendSystemMessage("You can't use flurry attack with this weapon.");
			return SUCCESS;
		}

		ManagedReference<SceneObject*> object;
		if (target != 0) {
			object = server->getZoneServer()->getObject(target, false);
		} else {
			creature->sendSystemMessage("You need a target to flurry attack!");
			return SUCCESS;
		}

		ManagedReference<CreatureObject*> targetCreature;

		if (object->isCreatureObject()) {
			targetCreature = object->asCreatureObject();
		} else {
			creature->sendSystemMessage("You need a target to flurry attack!");
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

			if(command == "nolos") {
				BorCombat::FlurryAttackTarget(creature, targetCreature, creature, true);
				return SUCCESS;
			} else if(command == "advantage" || command == "adv") {
				BorCombat::FlurryAttackTarget(creature, targetCreature, creature, noLos, 1);
				return SUCCESS;
			} else if(command == "disadvantage" || command == "dis" || command == "disadv") {
				BorCombat::FlurryAttackTarget(creature, targetCreature, creature, noLos, 2);
				return SUCCESS;
			}
		} 

		BorCombat::FlurryAttackTarget(creature, targetCreature, creature, false);

		return SUCCESS;
	}

};

#endif //FLURRYATTACKCOMMAND_H_