/*
 * WeaponObjectMenuComponent.cpp
 *
 *  Created on: 3/11/2012
 *      Author: kyle
 */

#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/tangible/powerup/PowerupObject.h"
#include "server/zone/objects/tangible/weapon/WeaponObject.h"
#include "WeaponObjectMenuComponent.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"
#include "server/zone/objects/player/sessions/SlicingSession.h"

void WeaponObjectMenuComponent::fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* player) const {

	if (!sceneObject->isTangibleObject())
		return;

	ManagedReference<WeaponObject*> weapon = cast<WeaponObject*>(sceneObject);
	if(weapon == nullptr)
		return;

	if(weapon->isASubChildOf(player)) {

		if(weapon->hasPowerup()) {
			menuResponse->addRadialMenuItem(71, 3, "@powerup:mnu_remove_powerup"); // Remove Powerup
		}

		if(weapon->getConditionDamage() > 0 && weapon->canRepair(player)) {
			menuResponse->addRadialMenuItem(70, 3, "@sui:repair"); // Slice
		}
	}
	String text = "Repair";
	menuResponse->addRadialMenuItem(80, 3, text);

	TangibleObjectMenuComponent::fillObjectMenuResponse(sceneObject, menuResponse, player);

}

int WeaponObjectMenuComponent::handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* player, byte selectedID) const {
	if (!sceneObject->isTangibleObject())
		return 0;

	ManagedReference<WeaponObject*> weapon = cast<WeaponObject*>(sceneObject);
	if(weapon == nullptr)
		return 1;

	if(weapon->isASubChildOf(player)) {

		if (selectedID == 69 && player->hasSkill("combat_smuggler_slicing_02")) {
			if (weapon->isSliced()) {
				player->sendSystemMessage("@slicing/slicing:already_sliced");
				return 0;
			}

			ManagedReference<Facade*> facade = player->getActiveSession(SessionFacadeType::SLICING);
			ManagedReference<SlicingSession*> session = dynamic_cast<SlicingSession*>(facade.get());

			if (session != nullptr) {
				player->sendSystemMessage("@slicing/slicing:already_slicing");
				return 0;
			}

			//Create Session
			session = new SlicingSession(player);
			session->initalizeSlicingMenu(player, weapon);

			return 0;

		}

		if(selectedID == 70) {

			weapon->repair(player);
			return 1;
		}

		if(selectedID == 71) {

			ManagedReference<PowerupObject*> pup = weapon->removePowerup();
			if(pup == nullptr)
				return 1;

			Locker locker(pup);

			pup->destroyObjectFromWorld( true );
			pup->destroyObjectFromDatabase( true );

			StringIdChatParameter message("powerup", "prose_remove_powerup"); //You detach your powerup from %TT.
			message.setTT(weapon->getDisplayedName()); 
			player->sendSystemMessage(message);

			return 1;
		}
	}



	if (selectedID == 80) {		// Repair
		ManagedReference<SceneObject*> parent = sceneObject->getParent().get();

		if (parent == nullptr)
			return 0;



		if (parent->isCellObject()) {
			ManagedReference<SceneObject*> obj = parent->getParent().get();
		} else {
			if (!sceneObject->isASubChildOf(player))
				return 0;
		}

		ZoneServer* server = player->getZoneServer();

		TangibleObject* tano = sceneObject->asTangibleObject();
		WeaponObject* weapon = cast<WeaponObject*>(tano);

		String itemValue = weapon->getItemValue();

		int creditCost = 1;
		int repairAmt = tano->getConditionDamage();
		bool doNotRepair = false;

		//repairAmt = tano->getConditionDamage();

		player->sendSystemMessage("Your weapon has " + std::to_string(repairAmt) + " damage to repair.");
		

		if(itemValue == 150) {
			float tempCost = static_cast<float>(itemValue) * (static_cast<float>(repairAmt) / static_cast<float>(tano->getMaxCondition()));
			creditCost = static_cast<int>(tempCost);
		}
		else if(itemValue == 600) {
			float tempCost = static_cast<float>(itemValue) * (static_cast<float>(repairAmt) / static_cast<float>(tano->getMaxCondition()));
			creditCost = static_cast<int>(tempCost);
		}
		else if(itemValue == 3000) {
			float tempCost = static_cast<float>(itemValue) * (static_cast<float>(repairAmt) / static_cast<float>(tano->getMaxCondition()));
			tempCost = tempCost * 3 / 4;
			creditCost = static_cast<int>(tempCost);
		}
		else if(itemValue == 10000) {
			float tempCost = static_cast<float>(itemValue) * (static_cast<float>(repairAmt) / static_cast<float>(tano->getMaxCondition()));
			tempCost = tempCost * 2 / 3;
			creditCost = static_cast<int>(tempCost);
		}
		else if(itemValue == 20000) {
			float tempCost = static_cast<float>(itemValue) (static_cast<float>(repairAmt) / static_cast<float>(tano->getMaxCondition()));
			tempCost = tempCost / 2;
			creditCost = static_cast<int>(tempCost);
		}
		else {
			player->sendSystemMessage("Something went wrong when determining your weapon's value, preventing it from being repaired. The system thinks that its value is" + itemValue + ". Reach out to the admins to research further.");
			doNotRepair = true;
		}

		player->sendSystemMessage("Based on its rarity and damage, you will be charged " + std::to_string(creditCost) + " credits to repair this item.");

		if(!doNotRepair) {
			if(player->getCashCredits() - creditCost >= 0) {
				player->subtractCashCredits(creditCost);
				tano->setConditionDamage(0, true);
			}
			else {
				player->sendSystemMessage("You do not have enough credits to repair this.");
			}
		}

	return TangibleObjectMenuComponent::handleObjectMenuSelect(sceneObject, player, selectedID);
	}


	return TangibleObjectMenuComponent::handleObjectMenuSelect(sceneObject, player, selectedID);
}
