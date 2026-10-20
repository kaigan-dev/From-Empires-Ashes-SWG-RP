/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef RpPetAttackCOMMAND_H_
#define RpPetAttackCOMMAND_H_

#include "server/zone/borrie/BorCombat.h"

class RpPetAttackCommand : public QueueCommand {

public:
	RpPetAttackCommand(const String& name, ZoneProcessServer* server) : QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		if (!creature->isPlayerCreature())
			return GENERALERROR;
	
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

        ManagedReference<AiAgent*> pet;
        for (int i = 0; i < ghost->getActivePetsSize(); ++i) {
			pet = ghost->getActivePet(i);
			if(pet->asCreatureObject()->isDead()) {
				creature->sendSystemMessage("Your pet can't attack while dead.");
			    return SUCCESS;
            }
		}

        if (pet == nullptr) {
			creature->sendSystemMessage("You can't have your pet attack without an active pet.");
			return SUCCESS;
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

        /* We will use the active pet as our attacker rather than a stored creature.
		ManagedReference<SceneObject*> storedObject;
		if (storedTarget != 0) {
			storedObject = server->getZoneServer()->getObject(storedTarget, false);
		} else {
			creature->sendSystemMessage("You need a stored target to be the attacker!");
			return SUCCESS;
		}
        */

		ManagedReference<CreatureObject*> targetCreature;

		if (object->isCreatureObject()) {
			targetCreature = object->asCreatureObject();
		} else {
			creature->sendSystemMessage("You need a target to attack!");
			return SUCCESS;
		}

		ManagedReference<CreatureObject*> storedTargetCreature;

		if (pet->isCreatureObject() && pet != nullptr && pet.get() != nullptr) {
			storedTargetCreature = pet->asCreatureObject();
		} else {
			creature->sendSystemMessage("Your pet isn't meeting the checks to perform an attack.");
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
				creature->sendSystemMessage("Not yet implemented, sorry.");
			} else if(command == "nolos") {
				BorCombat::AttackTarget(storedTargetCreature, targetCreature, creature, -1, false, true);
			} else if(command == "advantage" || command == "adv") {
				BorCombat::AttackTarget(storedTargetCreature, targetCreature, creature, -1, false, noLos, 1);
			} else if(command == "disadvantage" || command == "dis" || command == "disadv") {
				BorCombat::AttackTarget(storedTargetCreature, targetCreature, creature, -1, false, noLos, 2);
			}
		} else {
			BorCombat::AttackTarget(storedTargetCreature, targetCreature, creature, -1, false);
		}

		return SUCCESS;
	}

};

#endif 
