/*
 * ArmorObjectMenuComponent.cpp
 *
 *  Created on: 2/4/2013
 *      Author: bluree
 *		Credits: TA & Valk
 */

#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/objects/building/BuildingObject.h"
#include "server/zone/objects/player/sui/colorbox/SuiColorBox.h"
#include "ArmorObjectMenuComponent.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"
#include "server/zone/objects/player/sui/callbacks/ColorArmorSuiCallback.h"
#include "server/zone/ZoneServer.h"
#include "templates/customization/AssetCustomizationManagerTemplate.h"

void ArmorObjectMenuComponent::fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* player) const {

	if (!sceneObject->isWearableObject())
		return;

	ManagedReference<SceneObject*> parent = sceneObject->getParent().get();

	if (parent != nullptr && parent->isCellObject()) {
		ManagedReference<SceneObject*> obj = parent->getParent().get();

		if (obj != nullptr && obj->isBuildingObject()) {
			ManagedReference<BuildingObject*> buio = cast<BuildingObject*>(obj.get());

			if (!buio->isOnAdminList(player))
				return;
		}
	}
	else
	{
		if (!sceneObject->isASubChildOf(player))
			return;
	}

	String text = "Color Change";
	menuResponse->addRadialMenuItem(81, 3, text);

	text = "Repair";
	menuResponse->addRadialMenuItem(82, 3, text);
	
    WearableObjectMenuComponent::fillObjectMenuResponse(sceneObject, menuResponse, player); 	
}

int ArmorObjectMenuComponent::handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* player, byte selectedID) const {

	if (selectedID == 81) {		// Color Change
		ManagedReference<SceneObject*> parent = sceneObject->getParent().get();

		if (parent == nullptr)
			return 0;

		if (parent->isPlayerCreature()) {
			player->sendSystemMessage("@armor_rehue:equipped");
			return 0;
		}

		if (parent->isCellObject()) {
			ManagedReference<SceneObject*> obj = parent->getParent().get();

			if (obj != nullptr && obj->isBuildingObject()) {
				ManagedReference<BuildingObject*> buio = cast<BuildingObject*>(obj.get());

				if (!buio->isOnAdminList(player))
					return 0;
			}
		} else {
			if (!sceneObject->isASubChildOf(player))
				return 0;
		}

		ZoneServer* server = player->getZoneServer();

		if (server != nullptr) {
			// The color index.
			String appearanceFilename = sceneObject->getObjectTemplate()->getAppearanceFilename();
			VectorMap<String, Reference<CustomizationVariable*>> variables;
			AssetCustomizationManagerTemplate::instance()->getCustomizationVariables(appearanceFilename.hashCode(), variables, false);

			// The Sui Box.
			ManagedReference<SuiColorBox*> cbox = new SuiColorBox(player, SuiWindowType::COLOR_ARMOR);
			cbox->setCallback(new ColorArmorSuiCallback(server));
			cbox->setColorPalette(variables.elementAt(1).getKey()); // First one seems to be the frame of it? Skip to 2nd.
			cbox->setUsingObject(sceneObject);

			// Add to player.
			ManagedReference<PlayerObject*> ghost = player->getPlayerObject();
			ghost->addSuiBox(cbox);
			player->sendMessage(cbox->generateMessage());
		}
	return WearableObjectMenuComponent::handleObjectMenuSelect(sceneObject, player, selectedID);
	}
	
	else if (selectedID == 82) {		// Repair
		ManagedReference<SceneObject*> parent = sceneObject->getParent().get();

		if (parent == nullptr)
			return 0;

		/* We don't really care if it is equipped.
		if (parent->isPlayerCreature()) {
			player->sendSystemMessage("@armor_rehue:equipped");
			return 0;
		}
		*/

		if (parent->isCellObject()) {
			ManagedReference<SceneObject*> obj = parent->getParent().get();

			if (obj != nullptr && obj->isBuildingObject()) {
				ManagedReference<BuildingObject*> buio = cast<BuildingObject*>(obj.get());

				if (!buio->isOnAdminList(player))
					return 0;
			}
		} else {
			if (!sceneObject->isASubChildOf(player))
				return 0;
		}

		ZoneServer* server = player->getZoneServer();

		//ManagedReference<TangibleObject*> tano = sceneObject->castTo<TangibleObject*>();

		//SceneObject* object = static_cast<SceneObject*>(objects.get(i));

		TangibleObject* tano = sceneObject->asTangibleObject();
		//ArmorObject* armor= tano.asArmorObject();
		//ArmorObject* armor = static_cast<TangibleObject*>(tano);
		
		// Yet to try
		ArmorObject* armor = tano.castTo<ArmorObject*>();
		//ArmorObject* armor = cast<ArmorObject*>(tangibleObject.get());

		int creditCost = 1;
		int repairamt = 1;

		

		if(player->getCashCredits() - creditCost >= 0) {
			player->subtractCashCredits(creditCost);
			tano->setConditionDamage(tano->getConditionDamage()-1, true);
		}
		else {
			player->sendSystemMessage("You do not have enough credits to repair this.");
		}
	return WearableObjectMenuComponent::handleObjectMenuSelect(sceneObject, player, selectedID);
	}

return WearableObjectMenuComponent::handleObjectMenuSelect(sceneObject, player, selectedID);
}
