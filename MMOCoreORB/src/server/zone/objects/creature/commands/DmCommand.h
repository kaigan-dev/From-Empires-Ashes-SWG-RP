/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef DMCOMMAND_H_
#define DMCOMMAND_H_

#include "server/zone/borrie/BorrieRPG.h"
#include "server/zone/borrie/BorNPC.h"
#include "server/zone/borrie/BorEffect.h"
#include "server/zone/borrie/BorDM.h"
#include "server/zone/borrie/BorUtil.h"
#include "server/zone/borrie/BorDev.h"
#include "server/zone/borrie/BorIO.h"

class DmCommand : public QueueCommand {

public:
	DmCommand(const String& name, ZoneProcessServer* server) : QueueCommand(name, server) {

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

		try {
			String command, subCommand, subSubCommand;
			if (args.hasMoreTokens()) {
				args.getStringToken(command);
			}

			command = command.toLowerCase();
			ManagedReference<SceneObject*> object;
			ManagedReference<CreatureObject*> creo;
			ManagedReference<CreatureObject*> storedTarget;

			if (target != 0) {
				object = server->getZoneServer()->getObject(target, false);
			}

			if (command == "help") {
				HelpDisplay(creature);
			}

			storedTarget = BorrieRPG::GetStoredCreature(creature);

			if (adminLevelCheck > 1) { // Designer
				if (command == "storetarget") {
					BorrieRPG::SaveTarget(creature, object);
				} else if(command == "teleport") { 
					BorUtil::NoLoadscreenTeleport(creature, arguments);
				} else if(command == "teleportto") { 
					BorUtil::NoLoadscreenTeleportTo(creature, arguments);
				} else if (command == "copy") {
					BorrieRPG::copyTarget(creature, object, true);
				} else if (command == "buildingcheck") {
					BorrieRPG::ShowAllStructures(creature);
				} else if (command == "setlots") {
					if (args.hasMoreTokens()) {
						args.getStringToken(subCommand);
						BorrieRPG::IncreaseLots(creature, Integer::valueOf(subCommand));
					}
				} else if (command == "color") {
					String colorID;
					if (args.hasMoreTokens()) {
						args.getStringToken(subCommand);
						if (args.hasMoreTokens()) {
							args.getStringToken(colorID);
							BorrieRPG::colorTarget(creature, object, Integer::valueOf(subCommand), Integer::valueOf(colorID));
						}
					}
				} else if (command == "tp") {
					float x, y, z;
					if (args.hasMoreTokens()) {
						args.getStringToken(subCommand);
						x = Float::valueOf(subCommand);
						if (args.hasMoreTokens()) {
							args.getStringToken(subCommand);
							z = Float::valueOf(subCommand);
							if (args.hasMoreTokens()) {
								args.getStringToken(subCommand);
								y = Float::valueOf(subCommand);
								BorrieRPG::teleportObject(creature, object, x, z, y);
							} else
								creature->sendSystemMessage("ERROR: Needs y co-ordinate");
						} else
							creature->sendSystemMessage("ERROR: Needs z co-ordinate");
					} else
						creature->sendSystemMessage("ERROR: Needs x co-ordinate");
				} else if(command == "limbo") {
					BorrieRPG::teleportObject(creature, object, 7500, 0, 7500, -2);
					creature->sendSystemMessage("Target sent to 7500, 7500 on the planet (WIP Limbo)");
				} else if(command == "delete" || command == "despawn") {
					if(object != nullptr) {
						BorrieRPG::DeleteCreature(object->asCreatureObject());
					} else {
						creature->sendSystemMessage("You need a target to despawn it.");
					}
					
				}
			}
			if (adminLevelCheck > 2) { // Assistant DM
				if (command == "msg") {
					BorDM::sendMessage(creature, target, adminLevelCheck, arguments.toString());
				} else if(command == "ooc" || command == "(" || command == "//") {
					BorDM::SendDungeonMasterOOC(creature, command, arguments.toString());
				} else if(command == "ic" || command == "--" || command == "[") {
					BorDM::SendDungeonMasterIC(creature, command, arguments.toString());
				} else if(command == "bio") {
					if(object != nullptr) {
						if(object->isCreatureObject()) {
							BorCharacter::ShowAlternateBiography(creature, object->asCreatureObject());
						}
					}	
				} else if(command == "learnlanguages") {
					BorDM::GrantLanguageSkills(creature, creature);
				} else if(command == "alertturn") {
					if(args.hasMoreTokens()) {
						String targetTurnName = arguments.toString();
						BorrieRPG::AlertTurn(creature, targetTurnName);
					} else {
						if (object != nullptr) {
							if(object->isCreatureObject()) {
								BorrieRPG::AlertTurn(object->asCreatureObject());
							} else {
								creature->sendSystemMessage("You can either alert the turn with a valid name argument, or a creature target.");
							}
						} else {
							creature->sendSystemMessage("You can either alert the turn with a valid name argument, or a creature target.");
						}						
					}
				} else if(command == "lw") {
					if (args.hasMoreTokens()) {
						String speech = arguments.toString().subString(1 + command.length(), arguments.toString().length());
						BorrieRPG::BroadcastAmongAdmins(creature, speech);
						} else {
							creature->sendSystemMessage("You need to include a message in your DM private chat.");
						}
				}else if (command == "storetarget") {
					if (object != nullptr)
						BorrieRPG::SaveTarget(creature, object);
					else
						creature->sendSystemMessage("You need a target in order to save it.");
				} else if(command == "who") {
					BorrieRPG::ListOnlineCharacters(creature, true);
				} else if(command == "planetwho") {
					BorrieRPG::ShowPlayersWithPlanets(creature, false);
				} else if(command == "planetping") {
					BorrieRPG::ShowPlayersWithPlanets(creature, true);
				} else if(command == "togglewalk") { 
					if(object != nullptr) {
						if(object->isCreatureObject()) {
							BorNPC::ToggleAIWalks(object->asCreatureObject(), creature);
						}
					}					
				} else if(command == "banpassive") {
					if(object != nullptr) {
						if(object->isCreatureObject()) {
							BorrieRPG::SetPassiveExpBanStatus(object->asCreatureObject(), creature, true);
						} else {
							creature->sendSystemMessage("You need a creature target to ban passive experience from.");
						}
					} else {
						creature->sendSystemMessage("You need a target to ban passive experience from.");
					}
				} else if(command == "unbanpassive") {
					if(object != nullptr) {
						if(object->isCreatureObject()) {
							BorrieRPG::SetPassiveExpBanStatus(object->asCreatureObject(), creature, false);
						} else {
							creature->sendSystemMessage("You need a creature target to unban passive experience from.");
						}
					} else {
						creature->sendSystemMessage("You need a target to unban passive experience from.");
					}
				}else if(command == "setposture" || command == "posture") {
					if(args.hasMoreTokens()) {
						if(object != nullptr) {
							if(object->isCreatureObject()) {
								args.getStringToken(subCommand);
								BorNPC::SetNPCPosture(object->asCreatureObject(), subCommand);
							} else {
								creature->sendSystemMessage("You need to target a creature to set its posture.");
							}
						} else {
							creature->sendSystemMessage("You need to have a target to set its posture.");
						}
					} else {
						creature->sendSystemMessage("You need to specify the posture you want to set. Ex: standing, kneeling, prone, sneaking, sitting, knockdown, dead");
					}
				} else if(command == "disarm") {
					if(object != nullptr) {
						if(object->isCreatureObject()) {
							BorNPC::DisarmNPC(object->asCreatureObject());
						} else {
							creature->sendSystemMessage("You need to target an NPC creature to disarm it.");
						}
					} else {
						creature->sendSystemMessage("You need to target an NPC creature to disarm it.");
					}					
				} else if(command == "kill") {
					if(object != nullptr) {
							if(object->isCreatureObject()) {
								args.getStringToken(subCommand);
								BorNPC::SetNPCPosture(object->asCreatureObject(), "dead");
							} else {
								creature->sendSystemMessage("You need to target a creature to set it as dead.");
							}
						} else {
							creature->sendSystemMessage("You need to have a target to set it as dead.");
						}
				} else if (command == "reward" || command == "award") { 
					if(args.hasMoreTokens()) {
						if(object != nullptr) {
							if(object->isCreatureObject()) {
								args.getStringToken(subCommand);
								if(args.hasMoreTokens()) {
									args.getStringToken(subSubCommand);
									if(subCommand == "roll" || subCommand == "exp") { //Input the last roll
										if(args.hasMoreTokens()) {
											String rollValue;
											args.getStringToken(rollValue);
											BorCharacter::RewardXPForRoll(object->asCreatureObject(), creature, subSubCommand, Integer::valueOf(rollValue));
										}										
									} else if(subCommand == "credits") { //Input a multiplier
										BorCharacter::RewardCreditsByLevel(object->asCreatureObject(), creature, Integer::valueOf(subSubCommand));
									} else if(subCommand == "genexp") { //Input an amount

									} else {
										creature->sendSystemMessage("You can reward a roll, credits, or general experience.");
									}
								} else {
									if(subCommand == "lastroll") {
										BorCharacter::RewardXPForLastRoll(object->asCreatureObject(), creature);
									} else if(subCommand == "credits") {
										BorCharacter::RewardCreditsByLevel(object->asCreatureObject(), creature);
									} else if(subCommand == "genexp") {

									} else {
										creature->sendSystemMessage("You can reward the lastroll, credits, or general experience.");
									}
								}
								
							} else {

							}
						} else {
							creature->sendSystemMessage("You need to target a creature to reward it.");
						}
					} else {
						creature->sendSystemMessage("You need to specify if you'd like to reward exp, the last roll, credits, or general roleplay experience.");
					}
				} else if(command == "togglenotify") {
					if(creature->getStoredInt("dm_alert_incoming") == 1) {
						creature->setStoredInt("dm_alert_incoming", 0);
						creature->sendSystemMessage("You will no longer be alerted to all incoming and outgoing players.");
					} else {
						creature->setStoredInt("dm_alert_incoming", 1);
						creature->sendSystemMessage("You will now be alerted to all incoming and outgoing players.");
					}
				} else if(command == "inspect") {
					if(object != nullptr) {
						if (object->isCreatureObject()) {
							BorCharacter::InspectPlayer(creature, object->asCreatureObject());
						}						
					}					
				} else if(command == "status") { 
					if(args.hasMoreTokens()) {
						args.getStringToken(subCommand);
						if(subCommand == "clear") {
							creature->deleteStoredString("rp_dm_status");
							creature->sendSystemMessage("You've cleared your DM Status.");
						}
					} else {
						BorrieRPG::SetDMStatus(creature);
					}
				} else if (command == "mood") {
					if (args.hasMoreTokens()) {
						args.getStringToken(subCommand);
						if(object != nullptr) {
							if (object->isCreatureObject()) {
							creo = object->asCreatureObject();
							Locker clock(creo);
							creo->setMoodString(subCommand, true);
						} else
							creature->sendSystemMessage("ERROR: Target must be a creature.");
						} else {
							creature->sendSystemMessage("ERROR: Must have a target to set its mood.");
						}
						
					} else {
						BorUtil::CallScreenplayFunction(creature, "RpPlayerMenus", "showDMMoodMenu");
					}
				} else if (command == "anim") {
					if (args.hasMoreTokens() && object != nullptr) {
						args.getStringToken(subCommand);
						BorEffect::PlayAnim(creature, server->getZoneServer()->getObject(target, false), true, subCommand);
					} else {
						creature->sendSystemMessage("ERROR: Anim command requires that you specify an animation name.");
					}
				} else if(command == "music") {
					if (args.hasMoreTokens() && object != nullptr) {
						args.getStringToken(subCommand);
						BorEffect::PlayAreaMusicMessage(creature, subCommand);
					} else {
						creature->sendSystemMessage("ERROR: /dm music command requires that you specify a song (snd) sound file path.");
					}
				}else if (command == "cbtanim") {
					if (args.hasMoreTokens() && object != nullptr) {
						args.getStringToken(subCommand);
						BorEffect::PlayCombatAnim(creature, server->getZoneServer()->getObject(target, false), true, subCommand);
					} else {
						creature->sendSystemMessage("ERROR: Anim command requires that you specify an animation name.");
					}
				}else if(command == "areaanim") { 
					if (args.hasMoreTokens() && object != nullptr) {
						args.getStringToken(subCommand);
						BorEffect::PlayAreaAnim(creature, subCommand);
					} else {
						creature->sendSystemMessage("ERROR: AreaAnim command requires that you specify an animation name.");
					}
				}else if (command == "effect") {
					if (args.hasMoreTokens() && object != nullptr) {
						args.getStringToken(subCommand);
						BorEffect::PlayCEF(creature, object, true, subCommand);
					} else
						creature->sendSystemMessage("ERROR: Effect command requires that you specify an effect name.");
				} else if(command == "createcreature") {
						if(args.hasMoreTokens()) {
							//Template
							String creatureTemplate;
							args.getStringToken(creatureTemplate);
							creatureTemplate = "object/mobile/" + creatureTemplate + ".iff"; 
							if(args.hasMoreTokens()) {
								String skillTemplate;
								args.getStringToken(skillTemplate);
								if(args.hasMoreTokens()) {
									String equipTemplate;
									args.getStringToken(equipTemplate);
									if(args.hasMoreTokens()) {
										String customTemplate;
										args.getStringToken(customTemplate);	
										if(args.hasMoreTokens()) {
											String spawnWidth;
											args.getStringToken(spawnWidth);
											if(args.hasMoreTokens()) {
												String spawnHeight; 
												args.getStringToken(spawnHeight);
												BorUtil::CreateRoleplayNPCArray(creature, creatureTemplate, skillTemplate, equipTemplate, customTemplate, "", Integer::valueOf(spawnWidth), Integer::valueOf(spawnHeight));
											} else {
												BorUtil::CreateRoleplayNPCArray(creature, creatureTemplate, skillTemplate, equipTemplate, customTemplate, "", Integer::valueOf(spawnWidth));
											}
										} else {
											//Spawn Full		
										BorUtil::CreateRoleplayNPC(creature, creatureTemplate, skillTemplate, equipTemplate, customTemplate);		
										}
													
									} else {
										//Spawn with Skill and Equip
										BorUtil::CreateRoleplayNPC(creature, creatureTemplate, skillTemplate, equipTemplate, "");		
									}
								} else {
									//Spawn with Skill only
									BorUtil::CreateRoleplayNPC(creature, creatureTemplate, skillTemplate, "", "");		
								}
							} else {
								//Spawn Just the creature
								BorUtil::CreateRoleplayNPC(creature, creatureTemplate, "", "", "");		
							}
						} else {
							creature->sendSystemMessage("ERROR: /dm createcreature [<template>] <skill> <equipment> <customization>");
						}
				} else if(command == "createnpc") { 
					if(args.hasMoreTokens()) {
						//Template
						String npcTemplate;
						args.getStringToken(npcTemplate);
						CreatureObject* newNPC = BorUtil::CreateTemplatedRoleplayNPC(creature, npcTemplate);
						if(newNPC == nullptr) {
							creature->sendSystemMessage("Something went wrong creating the NPC \"" + npcTemplate + ".\" Did you use the wrong template, or one that doesn't exist?");
						}
					} else {
						creature->sendSystemMessage("ERROR: /dm createnpc [<template>]");
					}
				} else if(command == "setnpcskill") {
					if(args.hasMoreTokens()) {
						String skill;
						args.getStringToken(skill);
						if(args.hasMoreTokens()) {
							String svalue;
							int value = 0;
							args.getStringToken(svalue);
							value = Integer::valueOf(svalue);
							if(object != nullptr) {
								if (object->isCreatureObject()) {
									creo = object->asCreatureObject();
									if(!creo->isPlayerCreature()) {
										Locker clock(creo);
										creo->addSkillMod(SkillModManager::PERMANENTMOD, "rp_" + skill, value);
										creature->sendSystemMessage("Set " + skill + " to " + String::valueOf(value) + " on " + creo->getFirstName());
									}									
								}
							}
						}
					}
				}else if(command == "setnpcpool") {
					if(args.hasMoreTokens()) {
						String pool;
						args.getStringToken(pool);
						if(args.hasMoreTokens()) {
							String svalue;
							int value = 0;
							args.getStringToken(svalue);
							value = Integer::valueOf(svalue);
							if(object != nullptr) {
								if (object->isCreatureObject()) {
									creo = object->asCreatureObject();
									if(!creo->isPlayerCreature()) {
										Locker clock(creo);

										int hamValue = 0;
										if(pool == "health")
											hamValue = 0;
										else if(pool == "action") 
											hamValue = 3;
										else if(pool == "mind" || pool == "will")
											hamValue = 6;

										creo->setHAM(hamValue, value, true);
										creo->setBaseHAM(hamValue, value, true);
										creo->setMaxHAM(hamValue, value, true);
										creature->sendSystemMessage("Set " + pool + " maximum to " + String::valueOf(value) + " on " + creo->getFirstName());
									}									
								}
							}
						}
					}
				}else if (BorrieRPG::GetChatTypeID(command) != -1) {
					if (args.hasMoreTokens()) {
						String speech = arguments.toString().subString(1 + command.length(), arguments.toString().length());
						BorNPC::SpeakThroughNPC(creature, server->getZoneServer()->getObject(target, false), true, speech, BorrieRPG::GetChatTypeID(command));
					} else {
						creature->sendSystemMessage("Speech command requires you to say something!");
					}
				}
			}
			if (adminLevelCheck > 13) { // Privledged DM
				if (command == "name") {
					if (args.hasMoreTokens()) {
						if(object != nullptr) {
							String newName = arguments.toString().subString(1 + command.length(), arguments.toString().length());
							BorrieRPG::SetName(creature, object, newName);
						}						
					} else {
						creature->sendSystemMessage("You need to input a name!");
					}						
				} else if (command == "toggleai") {
					if (object->isCreatureObject()) {
						BorDev::ToggleAlwaysOnAI(object->asCreatureObject(), creature);
					}
				} else if(command == "areaanimimmune") {
					BorEffect::ToggleAreaAnimImmunity(creature);
				} else if(command == "randomname") { 
					if(args.hasMoreTokens()) {
						String specific;
						args.getStringToken(specific);
						if(specific == "help") {
							creature->sendSystemMessage("/dm randomname <type> - Valid Types: stormtrooper, scouttrooper, darktrooper, swamptrooper, r2, r3, r4, r5, r6, r7, r8, r9, 3po, eg6, wed, le, ra7, human, rodian, trandoshan, moncal, wookiee, bothan, twilek, zabrak, ithorian, sullustan");
						} else {
							if(object != nullptr) {
								BorrieRPG::SetRandomName(creature, object, specific);
							} else {
								creature->sendSystemMessage("You need a target to assign them a random name!");
							}
							
						}
					}
				} else if(command == "grantpoint") {
					if(object != nullptr) {
						if(object->isCreatureObject()) {
							if(args.hasMoreTokens()) {
								String specific;
								args.getStringToken(specific);
								if(specific == "attribute") {
									BorCharacter::ModifyFreePoints(creature, object->asCreatureObject(), "attr", 1);
								} else if(specific == "skill") {
									BorCharacter::ModifyFreePoints(creature, object->asCreatureObject(), "skill", 1);
								}
							} else {
								creature->sendSystemMessage("You need to specify 'attribute' or 'skill' when using '/dm grantpoint' ex: '/dm grantpoint skill'");
							}
						} else {
							creature->sendSystemMessage("You need a creature target to use this ability.");
						}
					} else {
						creature->sendSystemMessage("You need a creature target to use this ability.");
					}					
				} else if(command == "removepoint") {
					if(object != nullptr) {
						if(object->isCreatureObject()) {
							if(args.hasMoreTokens()) {
								String specific;
								args.getStringToken(specific);
								if(specific == "attribute") {
									BorCharacter::ModifyFreePoints(creature, object->asCreatureObject(), "attr", -1);
								} else if(specific == "skill") {
									BorCharacter::ModifyFreePoints(creature, object->asCreatureObject(), "skill", -1);
								}
							} else {
								creature->sendSystemMessage("You need to specify 'attribute' or 'skill' when using '/dm removepoint' ex: '/dm removepoint skill'");
							}
						} else {
							creature->sendSystemMessage("You need a creature target to use this ability.");
						}
					} else {
						creature->sendSystemMessage("You need a creature target to use this ability.");
					}
				} else if(command == "addcorruptionpoint" || command == "adddarksidepoint") {
					if(object != nullptr) {
						if(object->isCreatureObject()) {
							if(object->isPlayerCreature()) {
								if(args.hasMoreTokens()) {
									String valueString;
									args.getStringToken(valueString);
									int dsValue = Integer::valueOf(valueString);
									BorCharacter::AddDarksidePoints(object->asCreatureObject(), dsValue, true);
									creature->sendSystemMessage(object->asCreatureObject()->getFirstName() + " has fallen by " + valueString + " points of corruption");
								}
							}
						}
					}
				} else if(command == "removecorruptionpoint" || command == "removedarksidepoint") {
					if(object != nullptr) {
						if(object->isCreatureObject()) {
							if(object->isPlayerCreature()) {
								if(args.hasMoreTokens()) {
									String valueString;
									args.getStringToken(valueString);
									int dsValue = Integer::valueOf(valueString);
									BorCharacter::RemoveDarksidePoints(object->asCreatureObject(), dsValue);
									creature->sendSystemMessage(object->asCreatureObject()->getFirstName() + "'s corruption has faded by " + valueString + " points");
								}
							}
						}
					}
				}else if(command == "exp") {
					if(object != nullptr) {
						if(object->isCreatureObject()) {
							if(args.hasMoreTokens())  {
								int amount;
								amount = args.getIntToken();
								BorCharacter::RewardGeneralRPExperience(object->asCreatureObject(), creature, amount, true);
								//Prints to log. ...?
							} else {
								creature->sendSystemMessage("You need to specify an amount of experience to give.");
								//Run a Lua Script that gives a menu.
							}
						} else {
							creature->sendSystemMessage("You need a creature target to use this ability.");
						}
					} else {
						creature->sendSystemMessage("You need a creature target to use this ability.");
					}
				} else if(command == "setjedi") {
					if(object != nullptr) {
						if(object->isCreatureObject()) {
							BorCharacter::ToggleJedi(creature, object->asCreatureObject());
						} else {
							creature->sendSystemMessage("Target must be a creature");
						}
					} else {
						creature->sendSystemMessage("You must have a target to do that.");
					}
				} else if(command == "faction") { 
					if(object != nullptr) {
						if(object->isCreatureObject()) {
							if(object->isPlayerCreature()) {
								if(args.hasMoreTokens())  {
									String specific;
									args.getStringToken(specific);
									if(specific == "resetreport") {
										BorCharacter::ResetFactionReportCooldown(object->asCreatureObject(), creature);
									} else if(specific == "daily") {
										if(args.hasMoreTokens()) {
											int amount;
											amount = args.getIntToken();
											BorCharacter::ModifyDailyFactionContribution(object->asCreatureObject(), creature, amount);
										}
									} else if(specific == "overall") {
										if(args.hasMoreTokens()) {
											int amount;
											amount = args.getIntToken();
											BorCharacter::ModifyOverallFactionLoyalty(object->asCreatureObject(), creature, amount);
										}
									} else if(specific == "rank") {
										if(args.hasMoreTokens()) {
											int amount;
											amount = args.getIntToken();
										}
									}
								}
							}							
						}
					}
				} else if (command == "setheight") {
					if(object != nullptr) {
						if (object->isCreatureObject() && !object->isPlayerCreature()) {
							if ((args.hasMoreTokens())) {
								float height = args.getFloatToken();
								Locker lclock(object->asCreatureObject());
								object->asCreatureObject()->setHeight(height, true);
							} else {
								creature->sendSystemMessage("You need to give a height for this command to set one.");
							}
						} else {
							creature->sendSystemMessage("You Can only set the height of non-player creatures.");
						}
					} else {
						creature->sendSystemMessage("You need a non-player creature target to set their height.");
					}					
				} else if(command == "savechar") {
					if(object != nullptr) {
						if (object->isCreatureObject() && object->isPlayerCreature()) {
							BorUtil::SaveCharacterDataToFile(creature, object->asCreatureObject());
						} else {
							creature->sendSystemMessage("Invalid Target");
						}
					} else {
						creature->sendSystemMessage("Invalid Target");
					}					
				} else if(command == "loadchar") {
					if(object != nullptr) {
						if (object->isCreatureObject() && !object->isPlayerCreature()) {
							if ((args.hasMoreTokens())) {
								String valueString;
								args.getStringToken(valueString);
								BorIO::LoadCharacterData(creature, object->asCreatureObject(), valueString);
							}
							
						} else {
							creature->sendSystemMessage("Invalid Target");
						}
					} else {
						creature->sendSystemMessage("Invalid Target");
					}	
				} 
			}
			if (adminLevelCheck > 14) { // Full DM
				if (command == "setsecretdm") {
					if (object->isCreatureObject()) {
						creo = object->asCreatureObject();
						// Locker clock(creo);
						BorDM::SetSecretDM(creature, creo);
					} else {
						creature->sendSystemMessage("ERROR: You can only set secret DM on a creature.");
					}
				} else if (command == "togglecopy") {
					BorrieRPG::setCopyable(creature, object);
				}
			}
		} catch (Exception& e) {
			creature->sendSystemMessage("Invalid arguments for DM command. Help: /dm help");
			creature->sendSystemMessage("Error: " + String(e.what()) + " - " + e.getMessage());
		}
		return SUCCESS;
	}

	void HelpDisplay(CreatureObject* creature) const {
		ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();
		StringBuffer text;
		text << "-DM COMMAND-------------------" << endl;
		text << "/dm lw <message> - Sends a private message to all currently online DMs." << endl;
		text << "/dm storetarget - Saves your current target internally for use with commands that need two targets." << endl;
		text << "/dm buildingcheck - Shows all structures owned by the target." << endl;
		text << "/dm color <variable> <value> - Sets the customization of the target's custom var to the stated value. " << endl;
		text << "/dm limbo - Sends the NPC away without deleting them." << endl;
		text << "/dm delete - Despawns the target NPC." << endl;
		text << "/dm msg <message> - Sends the message privately to the target player as a system message, for private narration" << endl;
		text << "/dm ooc <message> - Sends a system message as the DM in an OOC context" << endl;
		text << "/dm ( <message> - Does the same as /dm ooc" << endl;
		text << "/dm ic <message> - Sends an in-character system message narration to all players nearby." << endl;
		text << "/dm -- <message> - Does the same as /dm ic" << endl;
		text << "/dm [ <message> - Does the same as /dm ic" << endl;
		text << "/dm who - Shows all players currently logged in, including hidden DMs." << endl;
		text << "/dm planetwho - Shows all players currently logged in, and which planet they are on." << endl;
		text << "/dm planetping - Shows all players currently logged in, and data on their current location." << endl;
		text << "/dm togglewalk - Makes the target walk instead of run, or vice versa, when following." << endl;
		text << "/dm setposture <posture> - Sets the posture of the target, such as kneel, prone, sit, kd, or dead. " << endl;
		text << "/dm togglenotify - Enables/disables being alerted whenever a player logs in or out of the server" << endl;
		text << "/dm inspect - Shows a readout of the target character's money, skills, faction, and other data." << endl;
		text << "/dm status [clear] - Sets your status, which shows you as online as a DM. Clear this with /dm status clear" << endl;
		text << "/dm mood <mood> - Set the mood of the target to whatever value you give it. " << endl;
		text << "/dm anim <anim> - Plays the animation on the target" << endl;
		text << "/dm effect <effect> - Plays an effect on the target." << endl;
		text << "/dm createcreature <template> [skill] [equipment] [customization] - Creates an NPC with the template, and other parameters. " << endl;
		text << "/dm createnpc <template> - Creates an NPC based on a preset template. " << endl;
		text << "/dm say <message> - Makes an NPC say something. \"say\" can be replaced with any spatial type, like yell, retort, whisper, and emote." << endl;
		text << "/dm name <name> - Sets the name of the target." << endl;
		text << "/dm randomname <type> - Sets a random name on the target based on the type provided, such as human, rodian, bothan, etc. " << endl;
		text << "/dm grantpoint <attribute/skill> - Grants a free skill or attribute point to the target" << endl;
		text << "/dm removepoint <attribute/skill> - Removes a free skill or attribute point from the target" << endl;
		text << "/dm exp <value> - Gives the target General RP Experience based on the amount provided" << endl;
		text << "/dm toggleai - Toggles the AI of an NPC to always be on or off. Helps with stubborn NPCs." << endl;
		text << "/dm setheight <value> - Set the height of an NPC" << endl;
		text << "/dm alertturn - Marks your target and announces to everyone that it is their turn" << endl;
		text << "/dm banpassve/unbanpassive - Prevents the target from recieving passive experience. Use only as a punishment for abuse." << endl;
		text << "/dm disarm - Deletes the target NPC's weapon." << endl;
		text << "/dm setnpcskill [skill] [value] - Sets an NPC's skill to the given value" << endl;
		text << "/dm setnpcpool [pool] [value] - Sets an NPC's pool to the given value" << endl;
		text << "/dm addcorruptionpoint/removecorruptionpoint [value] - Adds or removes darkside corruption points" << endl;
		text << "/dm learnlanguages - Learn all languages" << endl;

		ManagedReference<SuiMessageBox*> box = new SuiMessageBox(creature, SuiWindowType::NONE);
		box->setPromptTitle("DM COMMAND HELP");
		box->setPromptText(text.toString());
		ghost->addSuiBox(box);
		creature->sendMessage(box->generateMessage());
	}

};

#endif 
