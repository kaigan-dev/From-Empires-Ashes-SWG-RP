#ifndef BORIO_H_
#define BORIO_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/managers/skill/SkillManager.h"
#include "server/zone/managers/player/PlayerManager.h"
#include "server/zone/objects/creature/CreatureObject.h"

class BorIO : public Logger {
public:

    static void LoadCharacterData(CreatureObject* commander, CreatureObject* target, String dataTemplate) {
        if(target == nullptr) {
            commander->sendSystemMessage("You need a target to load character data.");
            return;
        }

        ManagedReference<PlayerObject*> ghost = target->getPlayerObject();

        if(ghost == nullptr) {
            commander->sendSystemMessage("You need a target that is a player character to load character data.");
            return;
        }

        PlayerManager* pMan = commander->getZoneServer()->getPlayerManager();
        SkillManager* skillManager = SkillManager::instance();

        Lua* lua = DirectorManager::instance()->getLuaInstance();

        dataTemplate = dataTemplate.toLowerCase();

        lua->runFile("custom_scripts/character_data/" + dataTemplate + ".lua");

        LuaObject luaObject = lua->getGlobalObject("characterData");

        if(luaObject.isValidTable()) {
            String firstName = luaObject.getStringField("firstName");
            String lastName = luaObject.getStringField("lastName");
            int cash = luaObject.getIntField("cash");
            int bank = luaObject.getIntField("bank");
            int experience = luaObject.getIntField("experience");
            int corruption = luaObject.getIntField("corruption");
            String faction = luaObject.getStringField("faction");
            String factionRank = luaObject.getStringField("factionRank");
            int freeAttributes = luaObject.getIntField("freeAttributes");
            int freeSkills = luaObject.getIntField("freeSkills");
            int jediState = luaObject.getIntField("jediState");
            int lightsaberBuilder = luaObject.getIntField("lightsaberBuilder");

            target->setFirstName(firstName);
            target->setLastName(lastName);
            target->addCashCredits(cash);
            target->addBankCredits(bank);

            pMan->awardExperience(target, "rp_general", experience);

            target->setShockWounds(corruption);

            target->setStoredString("faction_current", faction);
            target->setStoredString("rank_" + faction, factionRank);
            target->setStoredInt("starter_attr_points",freeAttributes);
            target->setStoredInt("starter_skill_points",freeSkills);

            target->setStoredInt("knowsLightsaberConstruction", lightsaberBuilder);

            LuaObject skills = luaObject.getObjectField("skills");

            

            if(skills.isValidTable()) {
                for (int i = 1; i <= skills.getTableSize(); ++i) {
                    String skillName = skills.getStringAt(1);
                    skillManager->awardSkill(skillName, target, true, true, true, true);
                }
            }

            skills.pop();

            LuaObject customization = luaObject.getObjectField("customization");

            if(customization.isValidTable()) {
                for (int i = 1; i <= customization.getTableSize(); ++i) {
                    LuaObject objData = luaObject.getObjectAt(i);
                    if (objData.isValidTable()) {
                        String varName = objData.getStringAt(1);

                        if(varName == "height") {
                            float height = objData.getFloatAt(2);
                            target->setHeight(height, true);
                        } else if(varName == "hair_object") {
                            String hairTmpl = objData.getStringAt(2);
                            String hairCustomVar = objData.getStringAt(3);
                            int16 hairColor = objData.getIntAt(4);
                            hairTmpl = hairTmpl.replaceAll("shared_", "");    
                            Reference<SharedObjectTemplate*> shot = TemplateManager::instance()->getTemplate(hairTmpl.hashCode());

                            if(shot == nullptr) {
                                objData.pop();
                                continue;
                            }

                            TangibleObject* hair = (target->getZoneServer()->createObject(shot->getServerObjectCRC(), 1)).castTo<TangibleObject*>();

                            if (hair == nullptr) {
                                objData.pop();
                                continue;
                            }

                            Locker locker(hair);
                            hair->createChildObjects();

                            hair->setCustomizationVariable(hairCustomVar, hairColor, true);

                            ManagedReference<SceneObject*> inventory = target->getSlottedObject("inventory");
                            if (inventory == nullptr) {
                                objData.pop();
                                    continue;
                            }

                            //Transfer
                            if (inventory->transferObject(hair, -1, true)) {
                                inventory->broadcastObject(hair, true);
                            } else {
                                hair->destroyObjectFromDatabase(true);
                                objData.pop();
                                continue;
                            }

                            //Equip
                            target->getZone()->getCreatureManager()->addWearableItem(target, hair);
                        } else {
                            int16 value = objData.getIntAt(2);
                            target->setCustomizationVariable(varName, value, true);
                        }                   
                    }
                    objData.pop();
                }
            }

            customization.pop();
        } else {
            commander->sendSystemMessage("Could not find character data template ");
            return;
        }


        commander->sendSystemMessage("Loaded template onto target.");
    }

};

#endif 
