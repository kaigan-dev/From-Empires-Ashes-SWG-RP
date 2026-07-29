#ifndef RESTRPCOMMANDSUICALLBACK_H_
#define RESTRPCOMMANDSUICALLBACK_H_

class RestRPCommandSuiCallback : public SuiCallback {
private:
	//int state;
	uint64 target;
	//int adminLevel;

public:
	RestRPCommandSuiCallback(ZoneServer* server, uint64 _target) : SuiCallback(server) {
		//state = _state;
		target = _target;
		//adminLevel = _adminLevel;
	}

	void run(CreatureObject* player, SuiBox* suiBox, uint32 eventIndex, Vector<UnicodeString>* args) {
		bool cancelPressed = (eventIndex == 1);
		int index = Integer::valueOf(args->get(0).toString());

		ManagedReference<PlayerObject*> ghost = player->getPlayerObject();

		if (ghost == nullptr)
			return;

		int adminLevelCheck = ghost->getAdminLevel();

		//Assigning who the target will be when it comes to rolling these bones.
		ManagedReference<CreatureObject*> targetCreature;
		if (adminLevelCheck > 0) {
			ManagedReference<SceneObject*> object;
			if (target != 0) {
				object = player->getZoneServer()->getObject(target, false);
			}

			if (object != nullptr) {
				if (object->isCreatureObject()) {
					targetCreature = object->asCreatureObject();
				} else {
					targetCreature = player;
				}
			} else {
				targetCreature = player;
			}

		} else {
			targetCreature = player;
		}

		if (cancelPressed)
			return;

		if(index == 0) {
			BorCharacter::PerformShortRest(targetCreature);
		}
		else if(index == 1) {
			ManagedReference<PlayerObject*> ghost = targetCreature->getPlayerObject();
			int adminLevelCheck = ghost->getAdminLevel();
			uint64 time = Time::currentNanoTime() / 1000000;
			if(time < targetCreature->getStoredLong("last_rest") && adminLevelCheck == 0) {
				uint64 timeRemaining = targetCreature->getStoredLong("last_rest") - time;
				targetCreature->sendSystemMessage("You can rest again in " + String::valueOf(timeRemaining / 3600000) + " hours.");
				return;
				}

			String zone = targetCreature->getZone()->getZoneName();

			bool isBuildingAdmin = false;
			bool isBuildingAllowed = false;
			ManagedReference<SceneObject*> rootParent = targetCreature->getRootParent();
			if(rootParent != nullptr && rootParent->isBuildingObject()) {
	        	BuildingObject* building = cast<BuildingObject*>( rootParent.get());
				isBuildingAdmin = building->isOnAdminList(targetCreature);
				isBuildingAllowed = building->isOnEntryList(targetCreature);
				}

			bool isInCity = false;
			ManagedReference<CityRegion*> cr = targetCreature->asSceneObject()->getCityRegion().get();
			if(cr != nullptr) {
				isInCity = true;
			}
			
			if(zone == "tutorial" || zone == "rp_ship_a" || isBuildingAdmin || isBuildingAllowed || isInCity || adminLevelCheck > 0) {
				BorCharacter::FillAllPools(targetCreature);
				//BorCharacter::HandleDarksideFading(targetCreature);
				targetCreature->setStoredInt("hero_point_used", 0);
				targetCreature->setStoredLong("last_rest", time + 20 * 60 * 60 * 1000); 
			}
			else {
				targetCreature->sendSystemMessage("You can only perform a long rest in a city or a building that you have been granted access to.");
			}
		}
		else if(index == 2) {
			BorCharacter::PerformMeditateRest(targetCreature);
		}

		targetCreature->setStoredInt("power_attack_count", 0);
	}
};

#endif