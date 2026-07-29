/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef RESTRPCOMMAND_H_
#define RESTRPCOMMAND_H_

#include "server/zone/borrie/BorCharacter.h"
#include "server/zone/objects/creature/sui/RestRPCommandSuiCallback.h"
#include "server/zone/objects/region/CityRegion.h"

class RestRpCommand : public QueueCommand {
	

public:
	RestRpCommand(const String& name, ZoneProcessServer* server) : QueueCommand(name, server) {

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

		ManagedReference<SceneObject*> object;
		if (target != 0) {
			object = server->getZoneServer()->getObject(target, false);
		}

		ManagedReference<CreatureObject*> targetCreature;

		if (adminLevelCheck > 0) {
			if (object != nullptr) {
				if (object->isCreatureObject()) {
					targetCreature = object->asCreatureObject();
				} else {
					targetCreature = creature;
				}
			} else {
				targetCreature = creature;
			}			
		} else {
			targetCreature = creature;
		}

		StringTokenizer args(arguments.toString());

		if (args.hasMoreTokens()) {
			String command;
				args.getStringToken(command);
				if(command == "short") {
					BorCharacter::PerformShortRest(targetCreature);
				}
				else if(command == "meditate") {

					if(targetCreature->hasSkill("rp_frc_meditate")) {
						BorCharacter::PerformMeditateRest(targetCreature);
					}

				}
				else if(command == "long") {
					ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();
					int adminLevelCheck = ghost->getAdminLevel();
					uint64 time = Time::currentNanoTime() / 1000000;
					if(time < creature->getStoredLong("last_rest") && adminLevelCheck == 0) {
						uint64 timeRemaining = creature->getStoredLong("last_rest") - time;
						creature->sendSystemMessage("You can rest again in " + String::valueOf(timeRemaining / 3600000) + " hours.");
						return GENERALERROR;
					}

					String zone = creature->getZone()->getZoneName();

					bool isBuildingAdmin = false;
					bool isBuildingAllowed = false;
					ManagedReference<SceneObject*> rootParent = creature->getRootParent();
					if(rootParent != nullptr && rootParent->isBuildingObject()) {
	            		BuildingObject* building = cast<BuildingObject*>( rootParent.get());
						isBuildingAdmin = building->isOnAdminList(creature);
						isBuildingAllowed = building->isOnEntryList(creature);
					}

					bool isInCity = false;
					ManagedReference<CityRegion*> cr = creature->asSceneObject()->getCityRegion().get();
					if(cr != nullptr) {
						isInCity = true;
					}
					
					/*
					if(creature->isInsideRadius()) {
					}
					*/

					if(zone == "tutorial" || zone == "rp_ship_a" || isBuildingAdmin || isBuildingAllowed || isInCity) {
						BorCharacter::FillAllPools(targetCreature);
						//BorCharacter::HandleDarksideFading(targetCreature);
						targetCreature->setStoredInt("hero_point_used", 0);
						creature->setStoredLong("last_rest", time + 20 * 60 * 60 * 1000); 
					}
					else {
						creature->sendSystemMessage("You can only perform a long rest in a city or a building that you have been granted access to.");
					}
				}
 
				targetCreature->setStoredInt("power_attack_count", 0);
		} else {
			//Open SUI Menu
			//Pop up a Menu
				ManagedReference<SuiListBox*> box = new SuiListBox(creature, SuiWindowType::JUKEBOX_SELECTION);
				box->setCallback(new RestRPCommandSuiCallback(creature->getZoneServer(), target));
				box->setPromptTitle("Rest Menu");
				box->setPromptText("How long would you like to rest for? You can only take a long rest when in a safe location, outside of a mission.\n\nA short rest can be done anywhere outside of combat, but it will only restore your health pool by half of its value, and costs 2 will points.\n\nA long rest can be done only in a safe haven, but will completely rejuvinate all of your pools.");
				box->setCancelButton(true, "@cancel");
				box->addMenuItem("Short Rest");
				box->addMenuItem("Long Rest");
				
				if(targetCreature->hasSkill("rp_frc_meditate")) {
					box->addMenuItem("Meditate");
				}

				creature->getPlayerObject()->addSuiBox(box);
				creature->sendMessage(box->generateMessage());
		}




		return SUCCESS;
	}

};

#endif 
