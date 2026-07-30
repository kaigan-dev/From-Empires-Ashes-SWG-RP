/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef RPCOMMAND_H_
#define RPCOMMAND_H_

#include "server/zone/borrie/BorrieRPG.h"
#include "server/zone/borrie/BorNPC.h"
#include "server/zone/borrie/BorEffect.h"
#include "server/zone/borrie/BorUtil.h"

class RpCommand : public QueueCommand {

public:
	RpCommand(const String& name, ZoneProcessServer* server) : QueueCommand(name, server) {

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

		StringTokenizer args(arguments.toString());

		try {
			String command, subCommand;
			if (args.hasMoreTokens()) {
				args.getStringToken(command);
			}
			command = command.toLowerCase();
			ManagedReference<SceneObject*> object;
			if (target != 0) {
				object = server->getZoneServer()->getObject(target, false);
			}

			if (command == "help") {
				HelpDisplay(creature);
			} else if (command == "effect") {
				// Intentionally left blank?
			} else if (command == "copy") {
				BorrieRPG::copyTarget(creature, object);
			//} else if (command == "who") {
				//BorrieRPG::ListOnlineCharacters(creature, false);
			//} else if(command == "planetwho") {
				//BorrieRPG::ShowPlanetPopulations(creature);
			} else if(command == "dmcall") {
				if (args.hasMoreTokens()) {
					String speech = arguments.toString().subString(1 + command.length(), arguments.toString().length());
					BorrieRPG::BroadcastToAdmins(creature, speech);
				} else {
					creature->sendSystemMessage("You need to include a message in your DM call.");
				}				
			} else if (command == "mood") {
				if (args.hasMoreTokens()) {
					args.getStringToken(subCommand);
					creature->setMoodString(subCommand, true);
				} else {
					//creature->sendSystemMessage("ERROR: Mood command requires that you specify an mood name.");
					BorUtil::CallScreenplayFunction(creature, "RpPlayerMenus", "showMoodMenu");
				}
			} else if (command == "range") {
				creature->sendSystemMessage("[ >>" + String::valueOf(BorNPC::GetTargetDistance(creature, server->getZoneServer()->getObject(target, false))) + "<< ]");
			} else if(command == "tohit") {
				if(object != nullptr) {
					if(object->isCreatureObject()) {
						int dc = BorCombat::GetToHitModifier(creature, object->asCreatureObject(), creature->getWeapon()) + 10;
						creature->sendSystemMessage("Your To-Hit DC against " + object->getCustomObjectName() + " is currently " + String::valueOf(dc));
					}					
				}	
			}else if(command == "inspect") {
				BorCharacter::InspectPlayer(creature, creature);					
			} else if(command == "cprefix") {
				if(args.hasMoreTokens()) {
					String newPrefix;
					args.getStringToken(newPrefix);
					if(newPrefix == "clear") {
						BorCharacter::ClearChatPrefix(creature);
					} else {
						BorCharacter::SetChatPrefix(creature, newPrefix);
					}
				}
			} else if(command == "weapon") {
				if(creature->getWeapon() != nullptr) {
					int wepDmg = creature->getWeapon()->getMaxCondition() - creature->getWeapon()->getConditionDamage();
					creature->sendSystemMessage("Current Weapon Condition: " + String::valueOf(wepDmg) + "/" + creature->getWeapon()->getMaxCondition());
					if(creature->getWeapon()->isJediWeapon()) {
						creature->sendSystemMessage("Your weapon is considered a Force User's weapon.");
					}
				}				
			} else if (command == "target") {
				BorrieRPG::SaveTarget(creature, object);
			} else if(command == "meditate") {
				BorEffect::MakePlayerMeditate(creature);
			} else if(command == "knockdown" || command == "kd" || command == "knockeddown") {
				creature->setPosture(CreaturePosture::KNOCKEDDOWN, true, true);
			} else if(command == "toggletargetrolling") {
				BorrieRPG::ToggleTargetRolling(creature);
			} else if(command == "switchgrip") {
				BorrieRPG::SwitchWeaponType(creature);
			} else if(command == "faction") {
				BorCharacter::DisplayFactionValues(creature);
			} else if(command == "savechar") {
				BorUtil::SaveCharacterDataToFile(creature, creature);
			} else if(command == "savebuilding") {
				if(args.hasMoreTokens()) {
					String saveName;
					args.getStringToken(saveName);
					String accountName = BorrieRPG::GetPlayerAccountName(creature).toLowerCase();
					BorUtil::SaveStructureContents(creature, saveName, "custom_scripts/buildings/" + accountName + "/");
				} else {
					creature->sendSystemMessage("You need to specify a name before saving this structure.");
				}				
			}else if (BorrieRPG::GetChatTypeID(command) != -1) {
				if (args.hasMoreTokens()) {
					String speech = arguments.toString().subString(1 + command.length(), arguments.toString().length());
					BorNPC::SpeakThroughNPC(creature, server->getZoneServer()->getObject(target, false), false, speech, BorrieRPG::GetChatTypeID(command));
				} else {
					creature->sendSystemMessage("Speech command requires you to say something!");
				}
			}
			else if(command == "reload") {
				if(creature->getWeapon() != nullptr) {
					if (creature->getWeapon()->getMaxAmmo()) {
						int maxAmmo = creature->getWeapon()->getMaxAmmo();
						String ammoType = creature->getWeapon()->getAmmoType();
						int ammoUsed = creature->getWeapon()->getStoredInt("ammo_used");
						int creditCost = 30;  //Reloading a Common weapon costs 30 credits

						if(ammoUsed == 0) {
							creature->sendSystemMessage("Your weapon is already at full ammunition.");
							return SUCCESS;
						}

						if(ammoType == "ammo_disruptor") {
							ManagedReference<SceneObject*> inv = creature->getSlottedObject("inventory");
							if(inv != nullptr) {
								int containerSize = inv->getContainerObjectsSize();
								bool foundAmmo = false;
								for (int j = containerSize - 1; j >= 0; --j) {
									ManagedReference<SceneObject*> unknownItem = inv->getContainerObject(j);

									if (unknownItem->getObjectTemplate()->getObjectName() == "Disruptor Ammunition") {
                						ManagedReference<TangibleObject*> ammo = unknownItem->asTangibleObject();
                						if (ammo != nullptr) {
											BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + " reloaded their disrupter.");
							        		ammo->destroyObjectFromWorld(true);
											ammo->destroyObjectFromDatabase(true);
											creature->getWeapon()->setStoredInt("ammo_used", 0);
											foundAmmo = true;
											return SUCCESS;
										}
										else {
											creature->sendSystemMessage("Found a disruptor ammo item which is of the wrong item type.");
										}
									}
								}
							}
							else {
								creature->sendSystemMessage("Could not retrieve your inventory.");
							}
							creature->sendSystemMessage("Could not find any disruptor ammunition in your inventory.");
							return GENERALERROR;
						}

						if(creature->getWeapon()->getItemValue() >= 500) {   //Reloading an Uncommon weapon costs  40
							creditCost += 10;
						}
						if(creature->getWeapon()->getItemValue() >= 1500) {  //Reloading a Rare weapon costs 50
							creditCost += 10;
						}
						if(creature->getWeapon()->getItemValue() >= 8000) {  //Reloading an Epic weapon costs 70
							creditCost += 20;
						}
						if(creature->getWeapon()->getItemValue() >= 15000) {  //Reloading a Legendary weapon costs 100
							creditCost += 30;
						}


						if(ammoType == "ammo_tusken") {   //Reloading a Tusken weapon (which have 1 ammunition and cap out at Rare tier) costs 10
							creditCost=10;
						}

						if(creature->getCashCredits() - creditCost >= 0) {
							creature->subtractCashCredits(creditCost);
							BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + " reloaded their weapon.");
							creature->sendSystemMessage("You have been charged " + String::valueOf(creditCost) + " credits for the ammo.");
							creature->getWeapon()->setStoredInt("ammo_used", 0);
						}
						else {
							creature->sendSystemMessage("You do not have enough credits to afford the reload.");
						}
					}
					else {
						creature->sendSystemMessage("This weapon does not use ammunition and cannot be reloaded.");
					}
				}				
			}
			else if(command == "heropoint" || command == "hero") {
				if(creature->getStoredInt("hero_point_used")) {
					creature->sendSystemMessage("You have already used your hero point since your last long rest.");
				}
				else {
					BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + " has used their hero point and may reroll their last skill check if they are not in combat.");
					creature->setStoredInt("hero_point_used", 1);
				}
				
			}
		} catch (Exception& e) {
			creature->sendSystemMessage("Invalid arguments for RP command. Help: /rp help");
			if(adminLevelCheck > 0) {
				creature->sendSystemMessage("Debug: Reason for command error was: " + e.getMessage());
			}
		}

		return SUCCESS;
	}

	void HelpDisplay(CreatureObject* creature) const {
		ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();
		StringBuffer text;
		text << "-RP COMMAND-------------------" << endl;
		text << "/rp [say/yell/whisper/emote] [Message] - Allows you to speak through an NPC or alternate character." << endl;
		text << "/rp dmcall [Message] - Sends a message to all Dungeon Masters online. Please avoid overuse." << endl;
		text << "/rp who - Shows all players who are online who are not anonymous." << endl;
		text << "/rp planetwho - Shows the current populations of players on each populated planet." << endl;
		text << "/rp mood [Mood Name] - Sets your mood to the supplied mood name. Can be NPC Moods." << endl;
		text << "/rp range - Prints how far you are from your target." << endl;
		text << "/rp tohit - Shows you your current to-hit DC against your target, should you attack them." << endl;
		text << "/rp target - Saves your target internally for use in other commands." << endl;
		text << "/rp copy - Copies the targeted object, if that object has been flagged to be copiable." << endl;
		text << "/rp meditate - Allows you to start meditating." << endl;
		text << "/rp knockdown - Sets your posture to incapacitated / knocked down." << endl;
		text << "/rp toggletargetrolling - Toggles the safety which allows you to roll for NPCs or not." << endl;
		text << "/rp cprefix [prefix] - Sets a prefix that will be put infront of all chat messages. Using the argument 'clear' will disable this." << endl;
		text << "/rp weapon - Prints information on your current weapon." << endl;
		text << "/rp switchgrip - Changes your weapon grip, if your weapon has an alternate grip." << endl;
		text << "/rp inspect - Inspect yourself and information available to DMs." << endl;

		ManagedReference<SuiMessageBox*> box = new SuiMessageBox(creature, SuiWindowType::NONE);
		box->setPromptTitle("RP COMMAND HELP");
		box->setPromptText(text.toString());
		ghost->addSuiBox(box);
		creature->sendMessage(box->generateMessage());
	}

};

#endif 

