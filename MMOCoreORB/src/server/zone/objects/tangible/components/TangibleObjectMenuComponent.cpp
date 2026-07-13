/*
 * TangibleObjectMenuComponent.cpp
 *
 *  Created on: 26/05/2011
 *      Author: victor
 */

#include "TangibleObjectMenuComponent.h"
#include "server/zone/objects/player/sessions/SlicingSession.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"
#include "server/zone/objects/player/PlayerObject.h"

#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/building/BuildingObject.h"
#include "server/zone/objects/player/sui/colorbox/SuiColorBox.h"
#include "server/zone/objects/player/sui/inputbox/SuiInputBox.h"
#include "server/zone/objects/player/sui/callbacks/ColorArmorSuiCallback.h"
#include "server/zone/objects/player/sui/callbacks/SetDescriptionCallback.h"
#include "server/zone/objects/player/sui/callbacks/SetNameCallback.h"
#include "server/zone/ZoneServer.h"
#include "templates/customization/AssetCustomizationManagerTemplate.h"
#include "server/zone/borrie/BorrieRPG.h"

#include "server/zone/objects/player/sui/callbacks/SetConditionSuiCallback.h"
#include "server/zone/objects/player/sui/callbacks/SetArmorValueSuiCallback.h"
#include "server/zone/objects/player/sui/callbacks/ClearArmorValuesSuiCallback.h"
#include "server/zone/objects/player/sui/callbacks/SetDamageSuiCallback.h"

void TangibleObjectMenuComponent::fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* player) const {
	ObjectMenuComponent::fillObjectMenuResponse(sceneObject, menuResponse, player);

	uint32 gameObjectType = sceneObject->getGameObjectType();

	if (!sceneObject->isTangibleObject())
		return;

	TangibleObject* tano = cast<TangibleObject*>( sceneObject);

	/*
	// Figure out what the object is and if its able to be Sliced.
	if(tano->isSliceable() && !tano->isSecurityTerminal()) { // Check to see if the player has the correct skill level

		bool hasSkill = true;
		ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");

		if ((gameObjectType == SceneObjectType::PLAYERLOOTCRATE) && !player->hasSkill("combat_smuggler_novice"))
			hasSkill = false;
		else if (sceneObject->isContainerObject())
			hasSkill = false; // Let the container handle our slice menu
		else if (sceneObject->isMissionTerminal() && !player->hasSkill("combat_smuggler_slicing_01"))
			hasSkill = false;
		else if (sceneObject->isWeaponObject() && (!inventory->hasObjectInContainer(sceneObject->getObjectID()) || !player->hasSkill("combat_smuggler_slicing_02")))
			hasSkill = false;
		else if (sceneObject->isArmorObject() && (!inventory->hasObjectInContainer(sceneObject->getObjectID()) || !player->hasSkill("combat_smuggler_slicing_03")))
			hasSkill = false;

		if(hasSkill)
			menuResponse->addRadialMenuItem(69, 3, "@slicing/slicing:slice"); // Slice
	} */

	ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");

	if (inventory->hasObjectInContainer(sceneObject->getObjectID())) {
		if((!sceneObject->isWeaponObject() && !sceneObject->isLightsaberCrystalObject()) || player->getPlayerObject()->hasGodMode()) {
			menuResponse->addRadialMenuItem(81, 3, "Change Color");
			menuResponse->addRadialMenuItemToRadialID(81, 82, 3, "Primary");
			menuResponse->addRadialMenuItemToRadialID(81, 83, 3, "Secondary");
			menuResponse->addRadialMenuItemToRadialID(81, 84, 3, "Tertiary");
		}	

		if(player->getPlayerObject()->hasGodMode()) {
			menuResponse->addRadialMenuItem(91, 3, "DM Options");
			menuResponse->addRadialMenuItemToRadialID(91, 92, 3, "Set Description");
			menuResponse->addRadialMenuItemToRadialID(91, 93, 3, "Set Writeable");
			menuResponse->addRadialMenuItemToRadialID(91, 94, 3, "Copy Object");
			menuResponse->addRadialMenuItemToRadialID(91, 95, 3, "Rename Object");
			menuResponse->addRadialMenuItemToRadialID(91, 96, 3, "Give to Target");
			menuResponse->addRadialMenuItemToRadialID(91, 97, 3, "Set as Mount");
			menuResponse->addRadialMenuItemToRadialID(91, 98, 3, "Check Price");
			menuResponse->addRadialMenuItemToRadialID(91, 99, 3, "Set Condition");

			/*
			if(tano->isArmorObject()) {
				menuResponse->addRadialMenuItemToRadialID(91, 100, 3, "Set Armor Value");
				menuResponse->addRadialMenuItemToRadialID(91, 101, 3, "Clear Armor Values");
			}

			if(tano->isWeaponObject()) {
				menuResponse->addRadialMenuItemToRadialID(91, 102, 3, "Set Damage");
			}	
			*/
			menuResponse->addRadialMenuItemToRadialID(91, 103, 3, "Give a copy to Target");		
		}
	}

	

	//WearableObjectMenuComponent::fillObjectMenuResponse(sceneObject, menuResponse, player); 	

	if(player->getPlayerObject() != nullptr && player->getPlayerObject()->isPrivileged()) {
		/// Viewing components used to craft item, for admins
		ManagedReference<SceneObject*> container = tano->getSlottedObject("crafted_components");
		if(container != nullptr) {

			if(container->getContainerObjectsSize() > 0) {

				SceneObject* satchel = container->getContainerObject(0);

				if(satchel != nullptr && satchel->getContainerObjectsSize() > 0) {
					menuResponse->addRadialMenuItem(79, 3, "@ui_radial:ship_manage_components"); // View Components
				}
			}
		}
	}

	ManagedReference<SceneObject*> parent = tano->getParent().get();
	if (parent != nullptr && parent->getGameObjectType() == SceneObjectType::STATICLOOTCONTAINER) {
		menuResponse->addRadialMenuItem(10, 3, "@ui_radial:item_pickup"); //Pick up
	}
}

int TangibleObjectMenuComponent::handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* player, byte selectedID) const {
	if (!sceneObject->isTangibleObject()) {
		player->sendSystemMessage("The object is not a sceneObject. Menu selection failed.");
		return 0;
	}

	TangibleObject* tano = cast<TangibleObject*>( sceneObject);


	if (selectedID == 69 && player->hasSkill("combat_smuggler_novice") ) { // Slice [PlayerLootCrate]
		if (player->containsActiveSession(SessionFacadeType::SLICING)) {
			player->sendSystemMessage("@slicing/slicing:already_slicing");
			return 0;
		}

		//Create Session
		ManagedReference<SlicingSession*> session = new SlicingSession(player);
		session->initalizeSlicingMenu(player, tano);

		return 0;
	} else if (selectedID == 79) { // See components (admin)
		if(player->getPlayerObject() != nullptr && player->getPlayerObject()->isPrivileged()) {

			SceneObject* container = tano->getSlottedObject("crafted_components");
			if(container != nullptr) {

				if(container->getContainerObjectsSize() > 0) {

					SceneObject* satchel = container->getContainerObject(0);

					if(satchel != nullptr) {

						satchel->sendWithoutContainerObjectsTo(player);
						satchel->openContainerTo(player);

					} else {
						player->sendSystemMessage("There is no satchel this container");
					}
				} else {
					player->sendSystemMessage("There are no items in this container");
				}
			} else {
				player->sendSystemMessage("There is no component container in this object");
			}
		}

		return 0;
	}
	if (selectedID == 82 || selectedID == 83 || selectedID == 84) {
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

			int paletteID = 0;
			if (selectedID == 83)
				paletteID = 1;
			else if (selectedID == 84)
				paletteID = 2;

			// The Sui Box.
			ManagedReference<SuiColorBox*> cbox = new SuiColorBox(player, SuiWindowType::COLOR_ARMOR);
			cbox->setCallback(new ColorArmorSuiCallback(server));
			cbox->setColorPalette(variables.elementAt(paletteID).getKey()); 
			cbox->setUsingObject(sceneObject);

			// Add to player.
			ManagedReference<PlayerObject*> ghost = player->getPlayerObject();
			ghost->addSuiBox(cbox);
			player->sendMessage(cbox->generateMessage());
		}
	} 

	if(selectedID == 92) { //Set RP Description
		// The Sui Box.
		ZoneServer* server = player->getZoneServer();
		ManagedReference<SuiInputBox*> ibox = new SuiInputBox(player, SuiWindowType::CITY_RENAME);
		ibox->setCallback(new SetDescriptionCallback(server, sceneObject));
		ibox->setUsingObject(sceneObject);
		ibox->setMaxInputSize(99999);
		ibox->setPromptTitle("Set Roleplay Description");
		ibox->setPromptText("Set the description that players will see when examining this object.");

		// Add to player.
		ManagedReference<PlayerObject*> ghost = player->getPlayerObject();
		ghost->addSuiBox(ibox);
		player->sendMessage(ibox->generateMessage());
	}

	if(selectedID == 93) { //Set Writeable

	} 

	if(selectedID == 94) { //Copy Object
		player->sendSystemMessage("Debug: Attemping to copy tangible object.");
		BorrieRPG::copyTarget(player, sceneObject, true);
	} 

	if(selectedID == 95) { //Rename Object
		// The Sui Box.
		ZoneServer* server = player->getZoneServer();
		ManagedReference<SuiInputBox*> ibox = new SuiInputBox(player, SuiWindowType::CITY_RENAME);
		ibox->setCallback(new SetNameCallback(server, sceneObject));
		ibox->setUsingObject(sceneObject);
		ibox->setMaxInputSize(99999);
		ibox->setPromptTitle("Set New Name");
		ibox->setPromptText("Set the name you'd like this object to have.");

		// Add to player.
		ManagedReference<PlayerObject*> ghost = player->getPlayerObject();
		ghost->addSuiBox(ibox);
		player->sendMessage(ibox->generateMessage());
	}

	if(selectedID == 96) { //Give to Target
		ManagedReference<SceneObject*> playerTarget = player->getZoneServer()->getObject(player->getTargetID());
		if(playerTarget != nullptr) {
			if(playerTarget->isCreatureObject()) {
				CreatureObject* targetCreature = playerTarget->asCreatureObject();
				ManagedReference<SceneObject*> inventory = playerTarget->getSlottedObject("inventory");
				if (inventory == nullptr || inventory->isContainerFullRecursive()) {
					player->sendSystemMessage("Target inventory is full, so the item could not be sent.");
					return 0;
				}

				if (inventory->transferObject(sceneObject, -1, true)) {
					inventory->broadcastObject(sceneObject, true);
					player->sendSystemMessage("Gave " + targetCreature->getCustomObjectName() + " \"" + sceneObject->getCustomObjectName() + ".\"" );
					targetCreature->sendSystemMessage("You recieved \"" + sceneObject->getCustomObjectName() + ".\"");
				} else {
					player->sendSystemMessage("Error transferring object to target.");
				}
			} else {
				player->sendSystemMessage("Your target needs to be a player.");
			}
		} else {
			player->sendSystemMessage("You need to have a target.");
		}
	}

	if(selectedID == 97) { //Set as mount
		sceneObject->setStoredInt("mount", 1);
	}

	if(selectedID == 98) { //Check Price
		SharedObjectTemplate* obj = tano->getObjectTemplate();
		player->sendSystemMessage("The Price for this item is: " + String::valueOf(obj->getPrice()) + " credits.");
	}

	if(selectedID == 99) { //Set Condition
		ZoneServer* server = player->getZoneServer();
		ManagedReference<SuiInputBox*> ibox = new SuiInputBox(player, SuiWindowType::CITY_RENAME);
		ibox->setCallback(new SetConditionSuiCallback(server, sceneObject));
		ibox->setUsingObject(sceneObject);
		ibox->setMaxInputSize(99999);
		ibox->setPromptTitle("Set Condition Value");
		ibox->setPromptText("Set the condition value of this object. If you exceed its maximum, your input will be capped.");

		// Add to player.
		ManagedReference<PlayerObject*> ghost = player->getPlayerObject();
		ghost->addSuiBox(ibox);
		player->sendMessage(ibox->generateMessage());
	}

	if(selectedID == 100) { //Set Armor Value
		ZoneServer* server = player->getZoneServer();
		ManagedReference<SuiInputBox*> ibox = new SuiInputBox(player, SuiWindowType::CITY_RENAME);
		ibox->setCallback(new SetArmorValueSuiCallback(server, sceneObject));
		ibox->setUsingObject(sceneObject);
		ibox->setMaxInputSize(99999);
		ibox->setPromptTitle("Set Armor Value");
		ibox->setPromptText("Specify a protection type, such as \"kinetic\" and a number you wish the protection value to be, i.e. \"kinetic -1\"");

		// Add to player.
		ManagedReference<PlayerObject*> ghost = player->getPlayerObject();
		ghost->addSuiBox(ibox);
		player->sendMessage(ibox->generateMessage());
	}

	if(selectedID == 101) { //Clear Armor Values
		if(!sceneObject->isArmorObject())
            return 0;

        ManagedReference<ArmorObject*> armor = cast<ArmorObject*>(sceneObject);

		armor->setStoredString("dm_last_modified", player->getFirstName());
        armor->setKinetic(0);
		armor->setEnergy(0);
		armor->setElectricity(0);
		armor->setStun(0);
		armor->setBlast(0);
		armor->setHeat(0);
		armor->setCold(0);
		armor->setAcid(0);

		player->sendSystemMessage("All armor protection values have been set to zero.");
	}

	if(selectedID == 102) { //Set Damage
		ZoneServer* server = player->getZoneServer();
		ManagedReference<SuiInputBox*> ibox = new SuiInputBox(player, SuiWindowType::CITY_RENAME);
		ibox->setCallback(new SetDamageSuiCallback(server, sceneObject));
		ibox->setUsingObject(sceneObject);
		ibox->setMaxInputSize(99999);
		ibox->setPromptTitle("Set Weapon Damage");
		ibox->setPromptText("Set the damage of this weapon. Input damage as #D#+#. Examples: 1d4, 2d8+2");

		// Add to player.
		ManagedReference<PlayerObject*> ghost = player->getPlayerObject();
		ghost->addSuiBox(ibox);
		player->sendMessage(ibox->generateMessage());
	}

	if(selectedID == 103) { //Give a copy to Target
		BorrieRPG::copyTarget(player, sceneObject, true);  //Copy item

		ManagedReference<SceneObject*> playerTarget = player->getZoneServer()->getObject(player->getTargetID());
		if(playerTarget != nullptr) {
			if(playerTarget->isCreatureObject()) {
				CreatureObject* targetCreature = playerTarget->asCreatureObject();
				ManagedReference<SceneObject*> inventory = playerTarget->getSlottedObject("inventory");
				if (inventory == nullptr || inventory->isContainerFullRecursive()) {
					player->sendSystemMessage("Target inventory is full, so the item could not be sent.");
					return 0;
				}

				if (inventory->transferObject(sceneObject, -1, true)) {
					inventory->broadcastObject(sceneObject, true);
					player->sendSystemMessage("Gave " + targetCreature->getCustomObjectName() + " \"" + sceneObject->getCustomObjectName() + ".\"" );
					targetCreature->sendSystemMessage("You recieved \"" + sceneObject->getCustomObjectName() + ".\"");
				} else {
					player->sendSystemMessage("Error transferring object to target.");
				}
			} else {
				player->sendSystemMessage("Your target needs to be a player.");
			}
		} else {
			player->sendSystemMessage("You need to have a target.");
		}
	}
	
	return ObjectMenuComponent::handleObjectMenuSelect(sceneObject, player, selectedID);

}

