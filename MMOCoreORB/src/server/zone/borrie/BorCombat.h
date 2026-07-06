#ifndef BORCOMBAT_H_
#define BORCOMBAT_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/managers/creature/CreatureManager.h"
#include "server/zone/packets/chat/ChatSystemMessage.h"

#include "server/zone/borrie/BorrieRPG.h"
#include "server/zone/borrie/BorCharacter.h"
#include "server/zone/borrie/BorDice.h"
#include "server/zone/borrie/BorEffect.h"

class BorCombat : public Logger {
public:
	static void AttackTarget(CreatureObject* attacker, CreatureObject* defender, CreatureObject* commander, int bodyPartTarget, bool powerAttack, bool ignoreLOS = false, int advDis = 0) {
        ManagedReference<WeaponObject*> weapon = attacker->getWeapon();
        if(weapon->isBroken()) {
            commander->sendSystemMessage("Your weapon is broken, and you can't attack with a broken weapon.");
            return;
        }

        if(!ignoreLOS) {
            if (!CollisionManager::checkLineOfSight(attacker, defender)) {
                commander->sendSystemMessage("You don't have a direct line of sight of your target.");
                return;
            }
        }
        
        bool aimFlag = false;
        if(bodyPartTarget != -1)
        {
            aimFlag = true;
        }

        String attackVerb = powerAttack ? "power attacked" : "attacked";
        if(aimFlag) {
            attackVerb = "aimed at "+defender->getFirstName()+"'s "+GetSlotDisplayName(bodyPartTarget);
        }
        else {
            attackVerb += " " + defender->getFirstName();
        }

        //Consume ammo if appliable.
        if(attacker->isPlayerCreature()) {  //NPCs don't use ammo
                int maxAmmo = attacker->getWeapon()->getMaxAmmo();
		        int ammoUsed = attacker->getWeapon()->getStoredInt("ammo_used");
                String ammoType = attacker->getWeapon()->getAmmoType();

                int ammoToUse = 1;
                if(powerAttack) {
                    ammoToUse = attacker->getWeapon()->getMaxAmmo() / 2;
                }

                //commander->sendSystemMessage("DEBUG: Your weapon's ammo type is " + ammoType + ". MaxAmmo is " + String::valueOf(maxAmmo) + ". Current ammo used is " + String::valueOf(ammoUsed) + ". The current attack will use " + String::valueOf(ammoToUse));
                if(ammoType == "ammo_energy" || ammoType == "ammo_kinetic" || ammoType == "ammo_tusken" ||ammoType == "ammo_disrupter") {   //If we are using a weapon that has ammo.
                    
                    if(ammoUsed + ammoToUse <= maxAmmo) {
                        attacker->getWeapon()->setStoredInt("ammo_used", ammoUsed + ammoToUse);
                    }
                    else {
                        commander->sendSystemMessage("You don't have enough ammunition to attack.");
                        return;
                    }
                }
            }

        //To Hit
        int toHitDC = GetToHitModifier(attacker, defender, weapon) + 10;
        int aimMod = 0;

        if(aimFlag) { // Aimed attack.
            if (bodyPartTarget == 3 || bodyPartTarget == 4 || bodyPartTarget == 5 || bodyPartTarget == 6 || bodyPartTarget == 7 || bodyPartTarget == 8) {
                aimMod = 5;
            }
            else if (bodyPartTarget == 9 || bodyPartTarget == 10) {
                aimMod = 10;
            }
            DrainActionOrWill(attacker, 1);
            toHitDC += aimMod;
        }
        // If not an aimed attack, we now need to determine which body part was hit.
        else {
            bodyPartTarget = GetBodyPartTarget();
        }

        int skillCheck = 0;

        if(weapon->isJediWeapon()) skillCheck = attacker->getSkillMod("rp_lightsaber");
        else if(weapon->isUnarmedWeapon()) skillCheck = attacker->getSkillMod("rp_unarmed");
        else if(weapon->isMeleeWeapon()) skillCheck = attacker->getSkillMod("rp_melee");
        else if(weapon->isRangedWeapon()) skillCheck = attacker->getSkillMod("rp_ranged");

        int roll1 = 0;
        int roll2 = 0;
        int toHitRoll = 0;
        // Roll with Advantage
        if (advDis == 1) {
            roll1 = BorDice::Roll(1, 20);
            roll2 = BorDice::Roll(1, 20);
            toHitRoll = std::max(roll1, roll2);
        }
        // Roll with Disadvantage
        else if (advDis == 2) {
            roll1 = BorDice::Roll(1, 20);
            roll2 = BorDice::Roll(1, 20);
            toHitRoll = std::min(roll1, roll2);
        }
        else {
            toHitRoll = BorDice::Roll(1, 20);
        }
        bool nat20 = false;
        if (toHitRoll == 20) {
            nat20 = true;
        }

        if(powerAttack) {
            toHitDC += 5;
            DrainActionOrWill(attacker, 3);

            if(toHitRoll + skillCheck + (15 - skillCheck) < toHitDC) {
                //Miss
                BorrieRPG::BroadcastMessage(attacker, attacker->getFirstName() + " "+attackVerb+ " and missed!  \\#DBDBDB" + GenerateOutputSpam(toHitRoll, skillCheck, toHitDC, 0, -1, advDis, roll1, roll2) + "\\#FFFFFF"); 
                BorEffect::PerformReactiveAnimation(defender, attacker, "miss", GetSlotHitlocation(bodyPartTarget), true);
                return;
            } 
        }

        if(toHitRoll + skillCheck < toHitDC || toHitRoll == 1) {
            //Miss
            BorrieRPG::BroadcastMessage(attacker, attacker->getFirstName() + " "+attackVerb+ " and missed! \\#DBDBDB" + GenerateOutputSpam(toHitRoll, skillCheck, toHitDC, aimMod, bodyPartTarget, advDis, roll1, roll2) + "\\#FFFFFF");
            BorEffect::PerformReactiveAnimation(defender, attacker, "miss", GetSlotHitlocation(bodyPartTarget), true);
            return;
        }

        //We've hit! Calculate Damage and apply it to the body part. Get the armor of that part. 
        int bonusDamage = weapon->getBonusDamage();
        int damageDieCount = weapon->getMinDamage();
        int damageDieType = weapon->getMaxDamage();

        if(powerAttack)
            damageDieCount++;
        
        if(weapon->isJediWeapon()) {
            bonusDamage += attacker->getSkillMod("rp_lightsaber");

        } else if(weapon->isUnarmedWeapon() || weapon->isMeleeWeapon()) {
             if(attacker->isPlayerCreature()) {
                bonusDamage += attacker->getSkillMod("rp_strength_damage_bonus");
             }
            else {
                bonusDamage += attacker->getSkillMod("rp_strength") / 2;    
             }
        } 

        int totalDamage = GetDamageRoll(damageDieType, damageDieCount, bonusDamage, nat20, powerAttack);

        bool headshotFlag = false;
        int headshotDamage = totalDamage;

        // Headshot damage bonus!
        if(bodyPartTarget == 10) {
            float flHeadshotDamage = static_cast<float>(headshotDamage);
            flHeadshotDamage = std::ceil(flHeadshotDamage * 1.25);
            headshotDamage = static_cast<int>(flHeadshotDamage);
            headshotFlag = true;
        }

        //Merge headshot damage back into the value that will be used going forward. If a headshot didn't happen, these will still be equal.
        totalDamage = headshotDamage;

        //Damage the attacker's weapon
        if(!weapon->isInvisible()) {
            weapon->setConditionDamage(weapon->getConditionDamage() + totalDamage);
        }
        
        //Calculate the Reaction
        //The 1 is hitCount
        String reactionResult = HandleCombatReaction(attacker, defender, totalDamage, toHitRoll + skillCheck, bodyPartTarget, powerAttack, false, 1, headshotFlag, nat20);
        
        //Apply Followup as per the reaction.
        String toHitString = "\\#DBDBDB" + GenerateOutputSpam(toHitRoll, skillCheck, toHitDC, aimMod, bodyPartTarget, advDis, roll1, roll2) + "\\#FFFFFF";

        String combatSpam = attacker->getFirstName() + " "+attackVerb+ " and hit their " + GetSlotDisplayName(bodyPartTarget) + "!";
        
        if(ignoreLOS) {
            BorrieRPG::BroadcastMessage(attacker, combatSpam + " " + toHitString +  reactionResult + " (Line of Sight Ignored)");
        } else {
            BorrieRPG::BroadcastMessage(attacker, combatSpam + " " + toHitString +  reactionResult);
        }
        
	}

    static void FlurryAttackTarget(CreatureObject* attacker, CreatureObject* defender, CreatureObject* commander, bool ignoreLOS = false, int advDis = 0) {
        ManagedReference<WeaponObject*> weapon = attacker->getWeapon();
        if(weapon->isBroken()) {
            commander->sendSystemMessage("Your weapon is broken, and you can't attack with a broken weapon.");
            return;
        }

        if(!ignoreLOS) {
            if (!CollisionManager::checkLineOfSight(attacker, defender)) {
                commander->sendSystemMessage("You don't have a direct line of sight of your target.");
                return;
            }
        }
        
        //Dark Rebellion Rulebook Edition I, on Flurry Attack
        /* Instead of simply one attack, you’ll roll three to-hit to determine three different attacks, each providing half damage if they succeed. 
        If the target is using a combat stance that uses action points, they’ll have to spend twice as many action points to counter your attack, 
        though they’ll only need to defeat your highest to-hit roll in order to counter all three attacks. */

        int toHitDC = GetToHitModifier(attacker, defender, weapon) + 10;

        int roll1 = 0;
        int roll2 = 0; 
        int roll3 = 0;

        int r1 = BorDice::Roll(1, 20); 
        int r2 = BorDice::Roll(1, 20);
        int r3 = BorDice::Roll(1, 20); 
        int r4 = BorDice::Roll(1, 20);
        int r5 = BorDice::Roll(1, 20); 
        int r6 = BorDice::Roll(1, 20);

        // Roll with Advantage
        if (advDis == 1) {
            roll1 = std::max(r1, r2);
            roll2 = std::max(r3, r4);
            roll3 = std::max(r5, r6);
        }
        // Roll with Disadvantage
        else if (advDis == 2) {
            roll1 = std::min(r1, r2);
            roll2 = std::min(r3, r4);
            roll3 = std::min(r5, r6);
        }
        else {
            roll1 = BorDice::Roll(1, 20); 
            roll2 = BorDice::Roll(1, 20); 
            roll3 = BorDice::Roll(1, 20);
        }

        int nat20 = false;
        int nat20_1 = false;
        int nat20_2 = false;
        int nat20_3 = false;
        if (roll1 == 20) {
            nat20_1 = true;
        }
        if (roll2 == 20) {
            nat20_2 = true;
        }
        if (roll3 == 20) {
            nat20_3 = true;
        }
        if (nat20_1 == true || nat20_2 == true || nat20_3 == true) {
            nat20 = true;
        }

        int bodyPartTarget = GetBodyPartTarget();
        
        int lowestRoll = std::min(std::min(roll1, roll2), roll3);

        int skillCheck = 0;
        if(weapon->isJediWeapon()) skillCheck = attacker->getSkillMod("rp_lightsaber");
        else if(weapon->isUnarmedWeapon()) skillCheck = attacker->getSkillMod("rp_unarmed");
        else if(weapon->isMeleeWeapon()) skillCheck = attacker->getSkillMod("rp_melee");
        else if(weapon->isRangedWeapon()) skillCheck = attacker->getSkillMod("rp_ranged");
        
        bool hit1 = roll1 + skillCheck >= toHitDC;
        bool hit2 = roll2 + skillCheck >= toHitDC + 5;
        bool hit3 = roll3 + skillCheck >= toHitDC + 10;

        //Consume ammo if appliable.
        if(attacker->isPlayerCreature()) {  //NPCs don't use ammo
                int maxAmmo = attacker->getWeapon()->getMaxAmmo();
		        int ammoUsed = attacker->getWeapon()->getStoredInt("ammo_used");
                String ammoType = attacker->getWeapon()->getAmmoType();
                int ammoToUse = 3;

                //commander->sendSystemMessage("DEBUG: Your weapon's ammo type is " + ammoType + ". MaxAmmo is " + String::valueOf(maxAmmo) + ". Current ammo used is " + String::valueOf(ammoUsed) + ". The current attack will use " + String::valueOf(ammoToUse));
                if(ammoType == "ammo_energy" || ammoType == "ammo_kinetic" || ammoType == "ammo_tusken" || ammoType == "ammo_disrupter") {   //If we are using a weapon that has ammo.
                    
                    if(ammoUsed + ammoToUse <= maxAmmo) {
                        attacker->getWeapon()->setStoredInt("ammo_used", ammoUsed + ammoToUse);
                    }
                    else {
                        commander->sendSystemMessage("You don't have enough ammunition to attack.");
                        return;
                    }
                }
            }

        DrainActionOrWill(attacker, 1);

        //Absolute Miss
        if(!hit1 && !hit2 && !hit3) {
            BorrieRPG::BroadcastMessage(attacker, attacker->getFirstName() + " flurry attacked " +  defender->getFirstName() + " and missed! \\#DBDBDB" + GenerateFlurryOutputSpam(roll1, roll2, roll3, skillCheck, toHitDC, advDis, r1, r2, r3, r4, r5, r6) + "\\#FFFFFF");
            BorEffect::PerformReactiveAnimation(defender, attacker, "miss", GetBodyPartTarget(), true);
            BorEffect::PerformReactiveAnimation(defender, attacker, "miss", GetBodyPartTarget(), true);
            BorEffect::PerformReactiveAnimation(defender, attacker, "miss", GetBodyPartTarget(), true);
            return;
        }

        int damageDieCount = weapon->getMinDamage();
        int damageDieType = weapon->getMaxDamage();
        int bonusDamage = weapon->getBonusDamage();

        if(weapon->isJediWeapon()) {
            bonusDamage += attacker->getSkillMod("rp_lightsaber");

        } else if(weapon->isUnarmedWeapon() || weapon->isMeleeWeapon()) {
             if(attacker->isPlayerCreature()) {
                bonusDamage += attacker->getSkillMod("rp_strength_damage_bonus");
             }
            else {
                bonusDamage += attacker->getSkillMod("rp_strength") / 2;    
             }
        } 

        int damage1 = GetDamageRoll(damageDieType, damageDieCount, bonusDamage, nat20_1, false) / 2;
        int damage2 = GetDamageRoll(damageDieType, damageDieCount, bonusDamage, nat20_2, false) / 2;
        int damage3 = GetDamageRoll(damageDieType, damageDieCount, bonusDamage, nat20_3, false) / 2;

        int totalDamage = 0;
        if(hit1) totalDamage += damage1;
        if(hit2) totalDamage += damage2;
        if(hit3) totalDamage += damage3;

        if(totalDamage < 1) totalDamage = 1;

        if(!weapon->isInvisible()) {
            weapon->setConditionDamage(weapon->getConditionDamage() + totalDamage);
        }

        int hitCount = 0;
        if(hit1) hitCount++;
        if(hit2) hitCount++;
        if(hit3) hitCount++;

        int highestRoll = roll1;
        if(roll2 > highestRoll) highestRoll = roll2;
        if(roll3 > highestRoll) highestRoll = roll3;

        String reactionResult = HandleCombatReaction(attacker, defender, totalDamage, highestRoll + skillCheck, bodyPartTarget, false, true, hitCount, nat20);

        //Apply Followup as per the reaction.
        String toHitString = "\\#DBDBDB" + GenerateFlurryOutputSpam(roll1, roll2, roll3, skillCheck, toHitDC, advDis, r1, r2, r3, r4, r5, r6) + "\\#FFFFFF";

        String combatSpam = attacker->getFirstName() + " flurry attacked " +  defender->getFirstName();
        
        if(hitCount == 1) {
            combatSpam += " and hit once!";
        } else {
            combatSpam += " and hit " + String::valueOf(hitCount) + " times!";
        }

        if(ignoreLOS) {
            BorrieRPG::BroadcastMessage(attacker, combatSpam + " " + toHitString +  reactionResult + " (Line of Sight Ignored)");
        } else {
            BorrieRPG::BroadcastMessage(attacker, combatSpam + " " + toHitString +  reactionResult);
        } 
    }

    static int GetDamageRoll(int dieType, int dieCount, int bonusDamage, bool nat20, bool powerAttack) {
        int totalDamage = bonusDamage;
        // Maximize all damage dice (except the Power Attack die) on a critical hit.
        if (nat20 && !powerAttack) {
            totalDamage += dieType * dieCount;
        }
        // Don't maximize the Power Attack die on a crit.
        else if (nat20 && powerAttack) {
            totalDamage += (dieType - 1) * dieCount;
            totalDamage += BorDice::Roll(1, dieType);
        }
        else {
            for(int i = 0;i<dieCount;i++) {
                totalDamage += BorDice::Roll(1, dieType);
            }
        }
        return totalDamage;
    }

    static String GenerateOutputSpam(int roll, int skillMod, int diceCheck, int aimMod = 0, int bodyPartTarget = -1, int advDis = 0, int roll1 = 0, int roll2 = 0) {
        if (bodyPartTarget != -1) {
            // Advantage
            if (advDis == 1) {
                return "(1d20 (advantage): (" + String::valueOf(roll1) + ", " + String::valueOf(roll2) + ") + " + String::valueOf(skillMod) + " = " + String::valueOf(roll + skillMod) + " vs. DC: " + String::valueOf(diceCheck) + ", " + String::valueOf(diceCheck - aimMod) + " + " + String::valueOf(aimMod) + " Aim Penalty)";
            }
            // Disadvantage
            else if (advDis == 2) {
                return "(1d20 (disadvantage): (" + String::valueOf(roll1) + ", " + String::valueOf(roll2) + ") + " + String::valueOf(skillMod) + " = " + String::valueOf(roll + skillMod) + " vs. DC: " + String::valueOf(diceCheck) + ", " + String::valueOf(diceCheck - aimMod) + " + " + String::valueOf(aimMod) + " Aim Penalty)";
            }
            else {
                return "(1d20: " + String::valueOf(roll) + " + " + String::valueOf(skillMod) + " = " + String::valueOf(roll + skillMod) + " vs. DC: " + String::valueOf(diceCheck) + ", " + String::valueOf(diceCheck - aimMod) + " + " + String::valueOf(aimMod) + " Aim Penalty)";
            }
        }
        else {
            // Advantage
            if (advDis == 1) {
                return "(1d20 (advantage): (" + String::valueOf(roll1) + ", " + String::valueOf(roll2) + ") + " + String::valueOf(skillMod) + " = " + String::valueOf(roll + skillMod) + " vs. DC: " + String::valueOf(diceCheck) + ", " + String::valueOf(diceCheck - aimMod) + " + " + String::valueOf(aimMod) + " Aim Penalty)";
            }
            // Disadvantage
            else if (advDis == 2) {
                return "(1d20 (disadvantage): (" + String::valueOf(roll1) + ", " + String::valueOf(roll2) + ") + " + String::valueOf(skillMod) + " = " + String::valueOf(roll + skillMod) + " vs. DC: " + String::valueOf(diceCheck) + ", " + String::valueOf(diceCheck - aimMod) + " + " + String::valueOf(aimMod) + " Aim Penalty)";
            }
            else {
                return "(1d20: " + String::valueOf(roll) + " + " + String::valueOf(skillMod) + " = " + String::valueOf(roll + skillMod) + " vs. DC: " + String::valueOf(diceCheck) + ") ";
            }
        }
    }

    static String GenerateDamageOutputSpam(int damage, int finalDamage, int armorProtection, bool armorSkillFlag = false, bool headshotFlag = false, bool nat20 = false) {
        if (!armorSkillFlag)
        {
            if (armorProtection > 0)
            {
                if (headshotFlag && nat20) {
                    if(damage > armorProtection)  {
                        return String::valueOf(damage) + " - " + String::valueOf(armorProtection) + " = " + String::valueOf(finalDamage) + " damage! (25% headshot bonus, critical hit!)";
                     }   
                    else {
                        return String::valueOf(damage) + " - " + String::valueOf(armorProtection) + " = " + String::valueOf(finalDamage) + " (minimum) damage, despite a critical headshot!";
                    }
                }
                else if (headshotFlag && !nat20) {
                    if(damage > armorProtection)  {
                        return String::valueOf(damage) + " - " + String::valueOf(armorProtection) + " = " + String::valueOf(finalDamage) + " damage! (25% headshot bonus!)";
                     }   
                    else {
                        return String::valueOf(damage) + " - " + String::valueOf(armorProtection) + " = " + String::valueOf(finalDamage) + " (minimum) damage, despite a headshot!";
                    }
                }
                else if (!headshotFlag && nat20) {
                    if(damage > armorProtection)  {
                        return String::valueOf(damage) + " - " + String::valueOf(armorProtection) + " = " + String::valueOf(finalDamage) + " damage! (Critical hit!)";
                     }   
                    else {
                        return String::valueOf(damage) + " - " + String::valueOf(armorProtection) + " = " + String::valueOf(finalDamage) + " (minimum) damage, despite a critical hit!";
                    }
                }
                else {
                    if(damage > armorProtection)  {
                        return String::valueOf(damage) + " - " + String::valueOf(armorProtection) + " = " + String::valueOf(finalDamage) + " damage!";
                     }   
                    else {
                        return String::valueOf(damage) + " - " + String::valueOf(armorProtection) + " = " + String::valueOf(finalDamage) + " (minimum) damage!";
                    }
                }
            }
            else {
                if (headshotFlag && nat20) {
                    return String::valueOf(finalDamage) + " damage! (25% headshot bonus, critical hit!)";
                }
                else if (headshotFlag && !nat20) {
                    return String::valueOf(finalDamage) + " damage! (25% headshot bonus!)";
                }
                else if (!headshotFlag && nat20) {
                    return String::valueOf(finalDamage) + " damage! (Critical hit!)";
                }
                else {
                    return String::valueOf(finalDamage) + " damage!";
                }
            }
        }
        else {
                if (headshotFlag && nat20) {
                    return String::valueOf(damage) + " damage, only blocking 1 point due to insufficent Strength for their armor, made worse by the critical headshot!";
                }
                else if (headshotFlag && !nat20) {
                    return String::valueOf(damage) + " damage, only blocking 1 point due to insufficent Strength for their armor, made worse by the headshot!";
                }
                else if (!headshotFlag && nat20) {
                    return String::valueOf(damage) + " damage, only blocking 1 point due to insufficent Strength for their armor, made worse by the critical hit!";
                }
                else {
                    return String::valueOf(damage) + " damage, only blocking 1 point due to insufficent Strength for their armor!";
                }
        }
    }

    static String GenerateFlurryOutputSpam(int roll1, int roll2, int roll3, int skillMod, int diceCheck, int advDis = 0, int r1 = 0, int r2 = 0, int r3 = 0, int r4 = 0, int r5 = 0, int r6 = 0) {
        String result = "";

        // Advantage
        if (advDis == 1) {
            result = "(3d20 (advantage): (" + String::valueOf(r1) + ", " + String::valueOf(r2) + "), ";
            result += "(" + String::valueOf(r3) + ", " + String::valueOf(r4) + "), ";
            result += "(" + String::valueOf(r5) + ", " + String::valueOf(r6) + ") ";
        }
        //Disadvantage
        else if (advDis == 2) {
            result = "(3d20 (disadvantage): (" + String::valueOf(r1) + ", " + String::valueOf(r2) + "), ";
            result += "(" + String::valueOf(r3) + ", " + String::valueOf(r4) + "), ";
            result += "(" + String::valueOf(r5) + ", " + String::valueOf(r6) + ") ";
        }
        else {
            result = "(3d20: "+ String::valueOf(roll1) + ", ";
            result += String::valueOf(roll2) + ", ";
            result += String::valueOf(roll3) + " ";
        }
        result += "+ " + String::valueOf(skillMod) + " vs. DC: " + String::valueOf(diceCheck) + ", " + String::valueOf(diceCheck+5)+", " + String::valueOf(diceCheck+10) +" ) "; 
        return result;
    }

    static String HandleCombatReaction(CreatureObject* attacker, CreatureObject* defender, int incomingDamage, int toHit, int slot, bool powerAttacked, bool flurryAttacked, int hitCount, bool headshotFlag = false, bool nat20 = false) {
        WeaponObject* attackerWeapon = attacker->getWeapon();
        WeaponObject* defenderWeapon = defender->getWeapon();
        int defenderReactionType = defender->getStoredInt("reaction_stance");

        String reactionSpam = "";
        String damageModString = powerAttacked ? " X 2" : "";

        int actionPointMod = 1;
        if(flurryAttacked)
            actionPointMod = hitCount;

        if(CanPerformReaction(defender, defenderReactionType, incomingDamage, attackerWeapon, defenderWeapon)) {
            if(defenderReactionType == 1) { //Defend
                int defenseRoll = BorDice::Roll(1, 20);
                int defenseSkill = defender->getSkillMod("rp_defending");

                if(attackerWeapon->isRangedWeapon()) {
                    String combatLogPrefix = ", taking (" + GetWeaponDamageString(attacker, attackerWeapon, powerAttacked, hitCount) + ") = \\#FF9999";
                    reactionSpam += OrchestrateDamage(combatLogPrefix, defender, attackerWeapon, incomingDamage, slot, headshotFlag, nat20);
                }
                else if(defenseRoll + defenseSkill > toHit) { //Success

                    //Damage the defender's weapon on successful Defend. If the attacker's weapon is a lightsaber and the defender's is not, destory the defender's weapon.
                    if(attackerWeapon->isJediWeapon() && !defenderWeapon->isJediWeapon()) {
                        if(!defenderWeapon->isInvisible()) {
                            defenderWeapon->setConditionDamage(defenderWeapon->getMaxCondition());
                            defender->sendSystemMessage("Your weapon is destroyed by the lightsaber!");
                        }
                    }
                    else {
                        if(!defenderWeapon->isInvisible()) {
                            defenderWeapon->setConditionDamage(defenderWeapon->getConditionDamage() + incomingDamage);
                        }
                    }

                    //If the defender's weapon is a lightsaber and the attacker's is not, destroy the attacker's weapon
                    if(defenderWeapon->isJediWeapon() && !attackerWeapon->isJediWeapon()) {
                        if(!attackerWeapon->isInvisible()) {
                            attackerWeapon->setConditionDamage(attackerWeapon->getMaxCondition());
                            attacker->sendSystemMessage("Your weapon is destroyed by the lightsaber!");
                        }
                    }
                    
                    DrainActionOrWill(defender, 1 * actionPointMod);
                    reactionSpam += " " + defender->getFirstName() + " successfully defends against the attack (1d20 = " + String::valueOf(defenseRoll) + " + " + String::valueOf(defenseSkill) + ") ";
                    reactionSpam += ", absorbing \\#FF9999" + String::valueOf(incomingDamage) + "\\#FFFFFF damage into their weapon.";
                    BorEffect::PerformReactiveAnimation(defender, attacker, "defend", GetSlotHitlocation(slot), true);
    
                } else {
                    //BorCharacter::ModPool(defender, "health", incomingDamage * -1, true);
                    DrainActionOrWill(defender, 1 * actionPointMod);
                    BorEffect::PerformReactiveAnimation(defender, attacker, "defend", GetSlotHitlocation(slot), false);
                    reactionSpam += " " + defender->getFirstName() + " tries to defend against the attack, but fails (1d20 = " + String::valueOf(defenseRoll) + " + " + String::valueOf(defenseSkill) + ") ";
                    String combatLogPrefix = ", taking (" + GetWeaponDamageString(attacker, attackerWeapon, powerAttacked, hitCount) + ") = \\#FF9999";
                    reactionSpam += OrchestrateDamage(combatLogPrefix, defender, attackerWeapon, incomingDamage, slot, headshotFlag, nat20);
                }
                return reactionSpam;
            } else if(defenderReactionType == 2) { //Parry
                int meleeRoll = BorDice::Roll(1, 20);
                bool meleeNat20 = false;
                if (meleeRoll == 20) {
                    meleeNat20 = true;
                }
                int meleeSkill = 0;

                if(defenderWeapon->isJediWeapon()) 
                    meleeSkill = defender->getSkillMod("rp_lightsaber");
                else if(defenderWeapon->isUnarmedWeapon()) 
                    meleeSkill = defender->getSkillMod("rp_unarmed");
                else  
                    meleeSkill = defender->getSkillMod("rp_melee");
                    

                if(meleeRoll + meleeSkill >= toHit) {
                    //Successful Parry
                    DrainActionOrWill(defender, 3);
                    
                    //Calculate 
                    ManagedReference<WeaponObject*> weapon = defender->getWeapon();
	                int damageDieCount = weapon->getMinDamage();
                    int damageDieType = weapon->getMaxDamage();
                    int bonusDamage = weapon->getBonusDamage();
                    if(weapon->isJediWeapon()) {
                        bonusDamage += defender->getSkillMod("rp_lightsaber");
                    } else if(weapon->isUnarmedWeapon() || weapon->isMeleeWeapon()) {
                        if(defender->isPlayerCreature()) {
                            bonusDamage += defender->getSkillMod("rp_strength_damage_bonus");
                        }
                        else {
                            bonusDamage += defender->getSkillMod("rp_strength") / 2;    
                        }
                    }

                    int returnDamage = GetDamageRoll(damageDieType, damageDieCount, bonusDamage, meleeNat20, false) / 2;
                    ApplyAdjustedHealthDamage(attacker, defenderWeapon, returnDamage, slot);

                    //Damage the defender's weapon on successful Defend. If the attacker's weapon is a lightsaber and the defender's is not, destory the defender's weapon.
                    if(attackerWeapon->isJediWeapon() && !defenderWeapon->isJediWeapon()) {
                        if(!defenderWeapon->isInvisible()) {
                            defenderWeapon->setConditionDamage(defenderWeapon->getMaxCondition());
                            defender->sendSystemMessage("Your weapon is destroyed by the lightsaber!");
                        }
                    }
                    else {
                        if(!defenderWeapon->isInvisible()) {
                            defenderWeapon->setConditionDamage(defenderWeapon->getConditionDamage() + incomingDamage);
                        }
                    }

                    //If the defender's weapon is a lightsaber and the attacker's is not, destroy the attacker's weapon
                    if(defenderWeapon->isJediWeapon() && !attackerWeapon->isJediWeapon()) {
                        if(!attackerWeapon->isInvisible()) {
                            attackerWeapon->setConditionDamage(attackerWeapon->getMaxCondition());
                            attacker->sendSystemMessage("Your weapon is destroyed by the lightsaber!");
                        }
                    }

                    BorEffect::PerformReactiveAnimation(defender, attacker, "parry", GetSlotHitlocation(slot), true);
                    reactionSpam += ", but " + defender->getFirstName()+" parries the attack (" +String::valueOf(meleeRoll)+" + "+String::valueOf(meleeSkill)+" = "+String::valueOf(meleeRoll + meleeSkill)+" vs DC: "+String::valueOf(toHit)+"), striking back for \\#FF9999"+String::valueOf(returnDamage)+"\\#FFFFFF damage!";
                } else {
                    //Unsuccessful Parry
                    DrainActionOrWill(defender, 3);
                    BorEffect::PerformReactiveAnimation(defender, attacker, "parry", GetSlotHitlocation(slot), false);
                    reactionSpam += ". " + defender->getFirstName() + " tries to parry the attack, but fails (" +String::valueOf(meleeRoll)+" + "+String::valueOf(meleeSkill)+" = "+String::valueOf(meleeRoll + meleeSkill)+" vs DC: "+String::valueOf(toHit);
                    String combatLogPrefix = ", receiving (" + GetWeaponDamageString(attacker, attackerWeapon, powerAttacked, hitCount) + ") = \\#FF9999";
                    reactionSpam += OrchestrateDamage(combatLogPrefix, defender, attackerWeapon, incomingDamage, slot, headshotFlag, nat20);
                }
                return reactionSpam;
            } else if(defenderReactionType == 3) { //Dodge
                int maneuverabilitySkill = defender->getSkillMod("rp_maneuverability");
                int dodgeRoll = BorDice::Roll(1, 20);
                int heavyFlag = 0;

                // Prevent dodge in Heavy Armor
                for (int i = 2; i <= 10; i++) { // Check each armor slot. Starting from 2 to make the loop slightly faster since body is checked at 1, 2, and 9.
                    ManagedReference<ArmorObject*> armor = BorCharacter::GetArmorAtSlot(defender, GetSlotName(i));
                    int rating = 0;
                    if (armor != nullptr && armor.get() != nullptr) {
                        rating = armor->getRating();
                        if (rating == 3) {
                            heavyFlag = 1;
                        }
                    }
                }

                if (heavyFlag == 1) // If Heavy Armor is worn in any slot, fail the dodge regardless.
                {
                    reactionSpam += ", " + defender->getFirstName() + " is unable to dodge due to their heavy armor! (1d20 = " + String::valueOf(dodgeRoll) + " + " + String::valueOf(maneuverabilitySkill) + ") ";
                    BorEffect::PerformReactiveAnimation(defender, attacker, "dodge", GetSlotHitlocation(slot), false);
                    String combatLogPrefix = ", takes (" + GetWeaponDamageString(attacker, attackerWeapon, powerAttacked, hitCount) + ") = \\#FF9999";
                    return OrchestrateDamage(combatLogPrefix, defender, attackerWeapon, incomingDamage, slot, headshotFlag, nat20);
                }

                ManagedReference<ArmorObject*> armor = BorCharacter::GetArmorAtSlot(defender, GetSlotName(slot));
                int rating = 0;
                if (armor != nullptr && armor.get() != nullptr)
                    rating = armor->getRating();

                if(dodgeRoll + maneuverabilitySkill >= toHit) { //Successful Dodge, not wearing Heavy Armor
                    reactionSpam += ", but " + defender->getFirstName() + " dodges out of the way! (1d20 = " + String::valueOf(dodgeRoll) + " + " + String::valueOf(maneuverabilitySkill) + ") ";
                    BorEffect::PerformReactiveAnimation(defender, attacker, "dodge", GetSlotHitlocation(slot), true);
                    int actionPointCost = 1;
                    if (rating == 1) { //Light Armor
                        actionPointCost = 2 * actionPointMod;
                    }
                    else if (rating == 2) { //Medium Armor
                        actionPointCost = 3 * actionPointMod;
                    }
                    else { //No Armor
                        actionPointCost = 1 * actionPointMod;
                    }
                    if(defender->isKneeling()) {
                        actionPointCost++;
                    }
                    DrainActionOrWill(defender, actionPointCost);
                }

                else { //full fail
                    reactionSpam += ", " + defender->getFirstName() + " tries to dodge out of the way and fails! (1d20 = " + String::valueOf(dodgeRoll) + " + " + String::valueOf(maneuverabilitySkill) + ") ";
                    String combatLogPrefix = ", takes (" + GetWeaponDamageString(attacker, attackerWeapon, powerAttacked, hitCount) + ") = \\#FF9999";
                    reactionSpam += OrchestrateDamage(combatLogPrefix, defender, attackerWeapon, incomingDamage, slot, headshotFlag, nat20);
                    BorEffect::PerformReactiveAnimation(defender, attacker, "dodge", GetSlotHitlocation(slot), false);
                    int actionPointCost = 1;
                    if (rating == 1) { //Light Armor
                        actionPointCost = 2 * actionPointMod;
                    }
                    else if (rating == 2) { //Medium Armor
                        actionPointCost = 3 * actionPointMod;
                    }
                    else { //No Armor
                        actionPointCost = 1 * actionPointMod;
                    }
                    if(defender->isKneeling()) {
                        actionPointCost++;
                    }
                    DrainActionOrWill(defender, actionPointCost);
                }
                return reactionSpam;
            } else if(defenderReactionType == 4) { //Lightsaber Deflect
                //Dark Rebellion Rulebook on Lightsaber Deflect (as of 4/21/23)
                /*
                This combat reaction requires a lightsaber to be equipped. Utilizing your blade, you can deflect blaster bolts, Force Lightning, and other Lightsabers. 
                If you roll higher than half of their to-hit roll, you will deflect blaster bolts. You’ll receive half damage from lightning, 
                and half damage from other lightsabers. If you roll higher or equal to their to-hit roll, you’ll deflect blaster bolts back to their 
                originator at half damage, and avoid lightsaber damage completely. This will destroy melee weapons that attack if they’re not lightsaber resistant. 
                If they are resistant, that weapon will be treated like another lightsaber. 

                Lightsaber deflect will cost 11 action points, minus your total Lightsaber skill score. 
                */
                //int deflectionCount = defender->getStoredInt("deflection_count");
                //defender->setStoredInt("deflection_count", deflectionCount + 1);
                int deflectRoll = BorDice::Roll(1, 20);
                int lightsaberSkill = defender->getSkillMod("rp_lightsaber");
                //Check to see if the target lightsaber is ranged or another lightsaber, or lightsaber resistant.
                //int actionCost = 11 - lightsaberSkill;
                //if(actionCost <= 0) actionCost = 1;
                int actionCost = 3;
                DrainActionOrWill(defender, actionCost);
                if(attackerWeapon->isRangedWeapon()) {
                    bool canDeflect = attackerWeapon->getDamageType() != SharedWeaponObjectTemplate::KINETIC;
                    
                    if(canDeflect && deflectRoll + lightsaberSkill >= toHit + 4) {
                        //If you roll higher than the attack roll+4, you'll reflect blaster bots back to their originator at half damage.
                        reactionSpam += defender->getFirstName() + " successfully deflects the shot (1d20 = " + String::valueOf(deflectRoll) + " + " + String::valueOf(lightsaberSkill) + " vs DC: "+String::valueOf(toHit)+")";
                        reactionSpam += ", sending it back to its origin, dealing \\#FF9999" + String::valueOf(incomingDamage / 2) + "\\#FFFFFF damage to " + attacker->getFirstName() +"!";
                        BorEffect::PerformReactiveAnimation(defender, attacker, "parry", GetSlotHitlocation(slot), true);
                        ApplyAdjustedHealthDamage(attacker, attackerWeapon, incomingDamage / 2, slot);
                    } else if(deflectRoll + lightsaberSkill >= toHit) { 
                        //If you roll higher than the attacker's to-hit roll, you will deflect blaster bolts and take no damage.
                        BorEffect::PerformReactiveAnimation(defender, attacker, "parry", GetSlotHitlocation(slot), false);
                        reactionSpam += defender->getFirstName() + " successfully deflects the shot (1d20 = " + String::valueOf(deflectRoll) + " + " + String::valueOf(lightsaberSkill) + " vs DC: "+String::valueOf(toHit/2)+")";
                        reactionSpam += ", sending it harmlessly away.";
                    } else {
                        //Ouch time.
                        BorEffect::PerformReactiveAnimation(defender, attacker, "parry", GetSlotHitlocation(slot), false);
                        reactionSpam += defender->getFirstName() + " tries to deflect the shot (1d20 = " + String::valueOf(deflectRoll) + " + " + String::valueOf(lightsaberSkill) + " vs DC: "+String::valueOf(toHit)+")";
                        String combatLogPrefix = ", receiving (" + GetWeaponDamageString(attacker, attackerWeapon, powerAttacked, hitCount) + ") = \\#FF9999";
                        reactionSpam += OrchestrateDamage(combatLogPrefix, defender, attackerWeapon, incomingDamage, slot, headshotFlag, nat20);
                    }                   
                } else {
                    bool deflectableWeapon = attackerWeapon->isLightsaberResistant();
                    
                    if(deflectRoll + lightsaberSkill >= toHit && deflectableWeapon) {
                        //If you roll higher or equal to their to-hit roll, you avoid damage entirely.
                        reactionSpam += ", but " + defender->getFirstName() + " successfully deflects the attack entirely. (1d20 = " + String::valueOf(deflectRoll) + " + " + String::valueOf(lightsaberSkill) + " vs DC: "+String::valueOf(toHit)+")";
                        BorEffect::PerformReactiveAnimation(defender, attacker, "parry", GetSlotHitlocation(slot), true);
                        reactionSpam += attacker->getFirstName() + "'s weapon is sundered by " + attacker->getFirstName() + "'s lightsaber!";
                    } else {
                        reactionSpam += defender->getFirstName() + " fails to deflect the attack (1d20 = " + String::valueOf(deflectRoll) + " + " + String::valueOf(lightsaberSkill) + " vs DC: "+String::valueOf(toHit)+")";
                        String combatLogPrefix = ", receiving (" + GetWeaponDamageString(attacker, attackerWeapon, powerAttacked, hitCount) + ") = \\#FF9999";
                        reactionSpam += OrchestrateDamage(combatLogPrefix, defender, attackerWeapon, incomingDamage, slot, headshotFlag, nat20);
                    }
                    BorEffect::PerformReactiveAnimation(attacker, defender, "hit", GetSlotHitlocation(slot), true);
                }                  
                return reactionSpam;
            } else if(defenderReactionType == 5) { //Force Deflect
                //Dark Rebellion Rulebook on Force Deflect (as of 4/21/23)
                /*
                This combat reaction will deflect blaster bolts and other lightsabers. If your Telekinesis is under level 5, 
                you must roll above or equal to the target’s to-hit roll to take half damage. Otherwise, above level 5, you can roll over 
                or equal to half of their roll to take half damage. If you roll above their to-hit roll, you avoid damage entirely. 

                Force Deflect will cost 11 force points, minus your total Telekinesis skill score. 
                */
                int deflectRoll = BorDice::Roll(1, 20);
                int telekineticSkill = defender->getSkillMod("rp_telekinesis");
                bool deflectableWeapon = attackerWeapon->isRangedWeapon();

                //int forceCost = 11 - telekineticSkill;
                //if(forceCost <= 0 ) forceCost = 1;
                int forceCost = 3 * actionPointMod;

                if(!deflectableWeapon) {
                    //Can't deflect.
                    BorEffect::PerformReactiveAnimation(defender, attacker, "hit", GetSlotHitlocation(slot), true);
                    defender->sendSystemMessage("You cannot deflect this attack telekinetically. You recieved full damage.");
                    String combatLogPrefix = ", doing (" + GetWeaponDamageString(attacker, attackerWeapon, powerAttacked, hitCount) + ") = \\#FF9999";
                    reactionSpam += OrchestrateDamage(combatLogPrefix, defender, attackerWeapon, incomingDamage, slot, headshotFlag, nat20);
                } 
                else if(deflectRoll + telekineticSkill >= toHit) {
                    //No Damage
                    reactionSpam += defender->getFirstName() + " raises their hand and deflects the attack away (1d20 = " + String::valueOf(deflectRoll) + " + " + String::valueOf(telekineticSkill) + ")";
                    BorEffect::PerformReactiveAnimation(attacker, defender, "parry", GetSlotHitlocation(slot), false);
                    DrainForce(defender, forceCost);
                }
                else {
                    //Full Damage
                    reactionSpam += defender->getFirstName() + " fails to block the attack with their hands (1d20 = " + String::valueOf(deflectRoll) + " + " + String::valueOf(telekineticSkill) + ")";
                    String combatLogPrefix = ", receiving (" + GetWeaponDamageString(attacker, attackerWeapon, powerAttacked, hitCount) + ") = \\#FF9999";
                    reactionSpam += OrchestrateDamage(combatLogPrefix, defender, attackerWeapon, incomingDamage, slot, headshotFlag, nat20);
                    DrainForce(defender, forceCost);
                }
                                
                return reactionSpam;

            } else if(defenderReactionType == 6) { //Force Absorb
                //Dark Rebellion Rulebook on Force Absorb (as of 4/21/23)
                /*
                This requires the Force Power “Absorb.” Using this combat reaction, you will absorb any blaster bolts, 
                or force attacks if you roll over or equal to their to-hit roll. In turn, you’ll receive one force point 
                for absorbed blaster bolts, or half of the cost of the force power that was directed at you.

                Force Absorb will cost 12 force points, minus your total Inward skill score.
                */
                int absorbRoll = BorDice::Roll(1, 20);
                int absorbSkill = defender->getSkillMod("rp_inward");

                bool passed = absorbRoll + absorbSkill >= toHit;

                //int forceCost = 12 - absorbSkill;
                //if(forceCost <= 0) forceCost = 1;
                int forceCost = 3 * actionPointMod;

                if(attackerWeapon->isRangedWeapon()) {
                    DrainForce(defender, forceCost);
                    if(passed && attackerWeapon->getDamageType() != SharedWeaponObjectTemplate::KINETIC) {
                        reactionSpam += defender->getFirstName() + " absorbs the attack with their hand (1d20 = " + String::valueOf(absorbRoll) + " + " + String::valueOf(absorbSkill) + ")";
                    } else {
                        reactionSpam += defender->getFirstName() + " fails to absorb the attack (1d20 = " + String::valueOf(absorbRoll) + " + " + String::valueOf(absorbSkill) + ")";
                        String combatLogPrefix = ", receiving (" + GetWeaponDamageString(attacker, attackerWeapon, powerAttacked, hitCount) + ") = \\#FF9999";
                        reactionSpam += OrchestrateDamage(combatLogPrefix, defender, attackerWeapon, incomingDamage, slot, headshotFlag, nat20); 
                    }
                } else if(attackerWeapon->isJediWeapon()) {
                    DrainForce(defender, forceCost);
                    if(passed) {
                        reactionSpam += defender->getFirstName() + " blocks the attack with their hand and is unharmed (1d20 = " + String::valueOf(absorbRoll) + " + " + String::valueOf(absorbSkill) + ")";
                    } else {
                        reactionSpam += defender->getFirstName() + " fails to absorb the attack with their hand (1d20 = " + String::valueOf(absorbRoll) + " + " + String::valueOf(absorbSkill) + ")";
                        String combatLogPrefix = ", receiving (" + GetWeaponDamageString(attacker, attackerWeapon, powerAttacked, hitCount) + ") = \\#FF9999";
                        reactionSpam += OrchestrateDamage(combatLogPrefix, defender, attackerWeapon, incomingDamage, slot, headshotFlag, nat20);            
                    }
                } else {
                    //Can't block this. Full attack.
                    defender->sendSystemMessage("You cannot absorb this attack. You recieved full damage.");
                    BorEffect::PerformReactiveAnimation(defender, attacker, "hit", GetSlotHitlocation(slot), true);
                    String combatLogPrefix = ", doing (" + GetWeaponDamageString(attacker, attackerWeapon, powerAttacked, hitCount) + ") = \\#FF9999";
                    reactionSpam += OrchestrateDamage(combatLogPrefix, defender, attackerWeapon, incomingDamage, slot, headshotFlag, nat20);
                }
                return reactionSpam;
            }
            return reactionSpam;
        } 
        //Simply accept the damage.
        BorEffect::PerformReactiveAnimation(defender, attacker, "hit", GetSlotHitlocation(slot), true);
        String combatLogPrefix = ", doing (" + GetWeaponDamageString(attacker, attackerWeapon, powerAttacked, hitCount) + ") = \\#FF9999";
        return OrchestrateDamage(combatLogPrefix, defender, attackerWeapon, incomingDamage, slot, headshotFlag, nat20);
    }
 
    static String OrchestrateDamage(String combatLogPrefix, CreatureObject* defender, WeaponObject* attackerWeapon, int incomingDamage, int slot, bool headshotFlag = false, bool nat20 = false) {
        ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage, slot);
        
        ManagedReference<ArmorObject*> armor = BorCharacter::GetArmorAtSlot(defender, GetSlotName(slot));
        int armorProtection = 0;
        String damageType = GetDamageType(attackerWeapon);
        
        if (defender->isPlayerCreature() || (armor != nullptr || armor.get() != nullptr)) {
            armorProtection = GetArmorProtection(defender, armor, damageType);
        }
        else {
	        armorProtection = GetSkillModArmorValue(defender, damageType);
        }

        bool armorSkillFlag = false;

        if (armor != nullptr && armor.get() != nullptr && defender->getSkillMod("rp_strength") < armor->getRpSkillLevel()) {
            armorSkillFlag = true;
        }

        return combatLogPrefix + GenerateDamageOutputSpam(incomingDamage, GetArmorReducedDamage(incomingDamage, armorProtection), armorProtection, armorSkillFlag, headshotFlag, nat20);
    }

    static int GetSkillModArmorValue(CreatureObject* defender, String damageType) {
                int armorProtection = 0;
        	    if (damageType == "Kinetic") {
	    	        armorProtection = defender->getSkillMod("rp_armor_bonus_kinetic");
                }
	            else if (damageType == "Energy") {
	    	        armorProtection = defender->getSkillMod("rp_armor_bonus_energy");
                }
	            else if (damageType == "Electricity") {
	    	        armorProtection = defender->getSkillMod("rp_armor_bonus_electricity");
                }
	            else if (damageType == "Stun") {
	    	        armorProtection = defender->getSkillMod("rp_armor_bonus_stun");
                }
	            else if (damageType == "Blast") {
	    	        armorProtection = defender->getSkillMod("rp_armor_bonus_blast");
                }
	            else if (damageType == "Heat") {
	    	        armorProtection = defender->getSkillMod("rp_armor_bonus_heat");
                }
	            else if (damageType == "Cold") {
	    	        armorProtection = defender->getSkillMod("rp_armor_bonus_cold");
                }
	            else if (damageType == "Acid") {
	    	        armorProtection = defender->getSkillMod("rp_armor_bonus_acid");
                }
	            else if (damageType == "Lightsaber") {
	    	        armorProtection = defender->getSkillMod("rp_armor_bonus_lightsaber");
                }
                
                return armorProtection;
    }

    static void ApplyAdjustedHealthDamage(CreatureObject* creature, WeaponObject* attackerWeapon, int damage, int slot) {
        ManagedReference<ArmorObject*> armor = BorCharacter::GetArmorAtSlot(creature, GetSlotName(slot));
        String damageType = GetDamageType(attackerWeapon);
        int armorProtection = 0;
        int finalDamage = 0;

        if (creature->getSkillMod("rp_armor_bonus_kinetic") > 0 || creature->getSkillMod("rp_armor_bonus_energy") > 0 || creature->getSkillMod("rp_armor_bonus_electricity") > 0 || creature->getSkillMod("rp_armor_bonus_stun") > 0 || creature->getSkillMod("rp_armor_bonus_blast") > 0 || creature->getSkillMod("rp_armor_bonus_heat") > 0 || creature->getSkillMod("rp_armor_bonus_cold") > 0 || creature->getSkillMod("rp_armor_bonus_acid") > 0 || creature->getSkillMod("rp_armor_bonus_lightsaber") > 0) {
            armorProtection = GetSkillModArmorValue(creature, damageType);
            finalDamage = damage - armorProtection;
            if(finalDamage < 1) finalDamage = 1;
            BorCharacter::ModPool(creature, "health", finalDamage * -1, true);
        }
        else if(armor != nullptr && armor.get() != nullptr) {
            if(!armor->isBroken()) {
                // Armor protection is only one if a character is untrained in the use of their armor.
                armorProtection = 1;
                if (creature->getSkillMod("rp_strength") >= armor->getRpSkillLevel())
                {
                    armorProtection = GetArmorProtection(creature, armor, damageType);
                    if(armorProtection < 0) {
                        armorProtection = 0;
                    }
                }
                finalDamage = damage - armorProtection;
                if(finalDamage < 1) finalDamage = 1;
                BorCharacter::ModPool(creature, "health", finalDamage * -1, true);
                String armorName = armor->getCustomObjectName().toString();
                if(armorName == "") {
                    armorName = armor->getObjectTemplate()->getObjectName();
                }
                    
                // Armor should not take condition damage greater than its armor protection value.
                if (damage >= armorProtection) {
                    if(damageType == "Lightsaber" or damageType == "LIGHTSABER" or damageType == "lightSaber") {
                        if(armor->getLightSaber() > 0)
                            armor->setConditionDamage(armor->getConditionDamage() + armorProtection);
                        else
                        {
                            armor->setConditionDamage(armor->getMaxCondition());
                            if (creature->isPlayerCreature()) {
                                creature->sendSystemMessage("Your " + armorName + " is destroyed by the lightsaber!"); 
                            }
                        }
                    }
                    else {
                        armor->setConditionDamage(armor->getConditionDamage()+ armorProtection);
                    }
                    if (creature->isPlayerCreature()) {
                        creature->sendSystemMessage("Your " + armorName + " absorbed " + String::valueOf(armorProtection) + " damage.");
                    }
                    if (creature->getSkillMod("rp_strength") < armor->getRpSkillLevel())
                    {
                        if (creature->isPlayerCreature()) {
                            creature->sendSystemMessage("Your " + armorName + " only protected against 1 point of damage because you do not have enough Strength to use it properly!");
                        }
                    }
                }
                else {
                    if(damageType == "Lightsaber" or damageType == "LIGHTSABER" or damageType == "lightSaber") {
                        if(armor->getLightSaber() > 0)
                            armor->setConditionDamage(armor->getConditionDamage()+ armorProtection);
                        else
                        {
                            armor->setConditionDamage(armor->getMaxCondition());
                            if (creature->isPlayerCreature()) {
                                creature->sendSystemMessage("Your " + armorName + " is destroyed by the lightsaber!");
                            }
                        }
                    }
                    else {
                        armor->setConditionDamage(armor->getConditionDamage()+ armorProtection);
                    }
                    if (creature->isPlayerCreature()) {
                        creature->sendSystemMessage("Your " + armorName + " absorbed " + String::valueOf(damage) + " damage.");
                    }
                    if (creature->getSkillMod("rp_strength") < armor->getRpSkillLevel())
                    {
                        if (creature->isPlayerCreature()) {
                            creature->sendSystemMessage("Your " + armorName + " only protected against 1 point of damage because you do not have enough Strength to use it properly!");
                        }
                    }
                }           
            }
            else { //Take Full Damage
                BorCharacter::ModPool(creature, "health", damage * -1, true);
            }
        }
        else { //Take Full Damage
            BorCharacter::ModPool(creature, "health", damage * -1, true);
        }
    }

    static int GetBodyPartTarget() {
        int targetRoll = BorDice::Roll(1, 20);
        int bodyPartTarget = 1;
        if (targetRoll == 1 || targetRoll == 2 || targetRoll == 3) {
            bodyPartTarget = 1; // Chest
        }
        else if (targetRoll == 4 || targetRoll == 5) {
             bodyPartTarget = 2; // Chest
         }
        else if (targetRoll == 6 || targetRoll == 7) {
            bodyPartTarget = 3; // Legs
        }
        else if (targetRoll == 8 || targetRoll == 9) {
            bodyPartTarget = 4; // Feet
        }
        else if (targetRoll == 10 || targetRoll == 11) {
            bodyPartTarget = 5; // Left Forearm
        }
        else if (targetRoll == 12 || targetRoll == 13) {
            bodyPartTarget = 6; // Right Forearm
        }
        else if (targetRoll == 14 || targetRoll == 15) {
            bodyPartTarget = 7; // Left Bracer
        }
        else if (targetRoll == 16 || targetRoll == 17) {
            bodyPartTarget = 8; // Right Bracer
        }
        else if (targetRoll == 18 || targetRoll == 19) {
            bodyPartTarget = 9; // Hands
        }
        else if (targetRoll == 20) {
            bodyPartTarget = 10; // Head
        }
 
        return bodyPartTarget;
    }

    static int GetArmorProtection(CreatureObject* creature, ArmorObject* armor, String damageType) {
        if (armor != nullptr) {
            if(damageType == "Kinetic") {
                return (int)armor->getKinetic();
            }
            else if(damageType == "Energy") {     
                return (int)armor->getEnergy();
            }
            else if(damageType == "Electricity") {
                return (int)armor->getElectricity();
            }
            else if(damageType == "Stun") {
                return (int)armor->getStun();
            }
            else if(damageType == "Blast") { 
                return (int)armor->getBlast();
            }
            else if(damageType == "Heat") {
                return (int)armor->getHeat();
            }
            else if(damageType == "Cold") {
                return (int)armor->getCold();
            }
            else if(damageType == "Acid") {
                return (int)armor->getAcid();
            }
            else if(damageType == "Lightsaber") {
                return (int)armor->getLightSaber();
            }
            else return 0;
        }
        else return 0;
    }

    static int GetWeaponCondition(WeaponObject* weapon) {
        return weapon->getMaxCondition() - weapon->getConditionDamage();
    }

    static int GetArmorReducedDamage(int incomingDamage, int armorProtection)
    {
        if (armorProtection >= incomingDamage)
            return 1;
        else
            return incomingDamage - armorProtection;
    }

    static int GetWeaponPenetrationDivisionModifier(int weaponPiercing, int armorRating) {
        if(armorRating == 0) {
            if(weaponPiercing == 0) return 1; //None
            else if(weaponPiercing == 1) return 1; //Light
            else if(weaponPiercing == 2) return 0; //Medium
            else if(weaponPiercing == 3) return 0; //Heavy
            else return 1;
        } else if(armorRating == ArmorObject::LIGHT) {
            if(weaponPiercing == 0) return 2; //None
            else if(weaponPiercing == 1) return 1; //Light
            else if(weaponPiercing == 2) return 1; //Medium
            else if(weaponPiercing == 3) return 0; //Heavy
            else return 1;
        } else if(armorRating == ArmorObject::MEDIUM) {
            if(weaponPiercing == 0) return 2; //None
            else if(weaponPiercing == 1) return 2; //Light
            else if(weaponPiercing == 2) return 1; //Medium
            else if(weaponPiercing == 3) return 1; //Heavy
            else return 1;            
        } else if(armorRating == ArmorObject::HEAVY) {
            if(weaponPiercing == 0) return 2; //None
            else if(weaponPiercing == 1) return 2; //Light
            else if(weaponPiercing == 2) return 2; //Medium
            else if(weaponPiercing == 3) return 1; //Heavy
            else return 1;  
        } else return 1;
    }

    static String GetDamageType(WeaponObject* weapon) {
	    String result;

	    switch (weapon->getDamageType()) {
	    case SharedWeaponObjectTemplate::KINETIC:
	    	result = "Kinetic";
	    	break;
	    case SharedWeaponObjectTemplate::ENERGY:
	    	result = "Energy";
	    	break;
	    case SharedWeaponObjectTemplate::ELECTRICITY:
	    	result = "Electricity";
	    	break;
	    case SharedWeaponObjectTemplate::STUN:
	    	result = "Stun";
	    	break;
	    case SharedWeaponObjectTemplate::BLAST:
	    	result = "Blast";
	    	break;
	    case SharedWeaponObjectTemplate::HEAT:
	    	result = "Heat";
	    	break;
	    case SharedWeaponObjectTemplate::COLD:
	    	result = "Cold";
	    	break;
	    case SharedWeaponObjectTemplate::ACID:
	    	result = "Acid";
	    	break;
	    case SharedWeaponObjectTemplate::LIGHTSABER:
	    	result = "Lightsaber";
	    	break;
	    default:
	    	result = "Unknown";
	    	break;
	    }

        return result;
    }

    static String GetSlotName(int slot) {
        if(slot == 1) return "chest2";
        else if(slot == 2) return "chest2";
        else if(slot == 3) return "pants1";
        else if(slot == 4) return "shoes";
        else if(slot == 5) return "bracer_upper_l";
        else if(slot == 6) return "bracer_upper_r";
        else if(slot == 7) return "bicep_l";
        else if(slot == 8) return "bicep_r";
        else if(slot == 9) return "gloves";
        else if(slot == 10) return "hat";
        else return "chest2";
    }

    static String GetSlotDisplayName(int slot) {
        if(slot == 1) return "chest";
        else if(slot == 2) return "chest";
        else if(slot == 3) return "legs";
        else if(slot == 4) return "feet";
        else if(slot == 5) return "left forearm";
        else if(slot == 6) return "right forearm";
        else if(slot == 7) return "left bracer";
        else if(slot == 8) return "right bracer";
        else if(slot == 9) return "hands";
        else if(slot == 10) return "head";
        else return "chest";
    }

    static uint8 GetSlotHitlocation(int slot) {
        if(slot == 1) return CombatManager::HIT_BODY;
        else if(slot == 2) return CombatManager::HIT_BODY;
        else if(slot == 3) return CombatManager::HIT_LLEG;
        else if(slot == 4) return CombatManager::HIT_RLEG;
        else if(slot == 5) return CombatManager::HIT_LARM;
        else if(slot == 6) return CombatManager::HIT_RARM;
        else if(slot == 7) return CombatManager::HIT_LARM;
        else if(slot == 8) return CombatManager::HIT_RARM;
        else if(slot == 9) return CombatManager::HIT_BODY;
        else if(slot == 10) return CombatManager::HIT_HEAD;
        else return CombatManager::HIT_BODY;
    }

    static String GetWeaponDamageString(CreatureObject* attacker, WeaponObject* weapon, bool powerAttacked, int hitCount = 0) {
        int minDamage = weapon->getMinDamage();
        int maxDamage = weapon->getMaxDamage();
        int bonusDamage = weapon->getBonusDamage();
        int totalBonusDamage = weapon->getBonusDamage();
        if (powerAttacked) {
            minDamage++;
        }
        if (hitCount > 0) {
            for (int i = 1; i < hitCount; i++) {
                minDamage++;
                totalBonusDamage += bonusDamage;
            }
        }
        if ((bonusDamage > 0) && weapon->isJediWeapon())
            return String::valueOf(minDamage) + "d" + String::valueOf(maxDamage) + " + " + String::valueOf(totalBonusDamage) + " + " + String::valueOf(attacker->getSkillMod("rp_lightsaber"));
        else if ((bonusDamage == 0) && weapon->isJediWeapon())
            return String::valueOf(minDamage) + "d" + String::valueOf(maxDamage) + " + " + String::valueOf(attacker->getSkillMod("rp_lightsaber"));
        else if (attacker->isPlayerCreature() && bonusDamage > 0 && (weapon->isUnarmedWeapon() || weapon->isMeleeWeapon()))
            return String::valueOf(minDamage) + "d" + String::valueOf(maxDamage) + " + " + String::valueOf(totalBonusDamage) + " + " + String::valueOf(attacker->getSkillMod("rp_strength_damage_bonus"));
        else if (attacker->isPlayerCreature() && bonusDamage == 0 && (weapon->isUnarmedWeapon() || weapon->isMeleeWeapon()))
            return String::valueOf(minDamage) + "d" + String::valueOf(maxDamage) + " + " + String::valueOf(attacker->getSkillMod("rp_strength_damage_bonus"));
        else if (bonusDamage > 0 && (weapon->isUnarmedWeapon() || weapon->isMeleeWeapon()))
            return String::valueOf(minDamage) + "d" + String::valueOf(maxDamage) + " + " + String::valueOf(totalBonusDamage) + " + " + String::valueOf(attacker->getSkillMod("rp_strength") / 2);
        else if (bonusDamage == 0 && (weapon->isUnarmedWeapon() || weapon->isMeleeWeapon()))
            return String::valueOf(minDamage) + "d" + String::valueOf(maxDamage) + " + " + String::valueOf(attacker->getSkillMod("rp_strength") / 2);
        else if (bonusDamage > 0 && !(weapon->isUnarmedWeapon() || weapon->isMeleeWeapon()))
            return String::valueOf(minDamage) + "d" + String::valueOf(maxDamage) + " + " + String::valueOf(totalBonusDamage);
        else
            return String::valueOf(minDamage) + "d" + String::valueOf(maxDamage);
    }

    static bool CanPerformReaction(CreatureObject* defender, int reactionType, int incomingDamage, WeaponObject* attackerWeapon, WeaponObject* defenderWeapon) {
        int defenderAction = GetAvailableActionPoints(defender);
        if(reactionType == 0) return false; //Returns false so the catch of "none" will use the same code
        //Defend
        else if(reactionType == 1 && defenderAction > 0 && GetWeaponCondition(defenderWeapon) >= incomingDamage && !defenderWeapon->getDefendIsRestricted()) return true;
        //Parry
        else if(reactionType == 2 && defenderWeapon->isMeleeWeapon() && attackerWeapon->isMeleeWeapon() && defenderAction > 1 && GetWeaponCondition(defenderWeapon) >= incomingDamage && !defenderWeapon->getParryIsRestricted()) return true;
        //Dodge
        else if(reactionType == 3 && !defender->isProne() && !defender->isSitting() && !defender->isKnockedDown() && defenderAction > 0 && !defenderWeapon->getDodgeIsRestricted()) return true;
        //Special Force
        else if(reactionType == 4 || reactionType == 5 || reactionType == 6 ) {
            int defenderForce = GetAvailableForcePoints(defender);
            if(reactionType == 4) {
                //Deflection Limiter
                /*
                int deflectionCount = defender->getStoredInt("deflection_count");
                if(deflectionCount > 3) {
                    return false;
                }
                int lightsaberSkill = defender->getSkillMod("rp_lightsaber");
                int actionCost = 11 - lightsaberSkill;
                */
               int actionCost = 3;
                if(actionCost <= 0) actionCost = 1;
                if(defenderWeapon->isJediWeapon()) {
                    if(defenderAction >= (actionCost)) {
                        return true;
                    } else return false;
                } else return false;
            } else if(reactionType == 5) {
                int forceCost = 3;
                if(defenderForce >= (forceCost)) {
                    return true;
                } else return false;
            } else {
                int forcePool = 999;
                if(defender->isPlayerCreature()) {
                    forcePool = defender->getPlayerObject()->getForcePower();
                }
                if(forcePool >= 3) {
                    return true;
                } else return false;
            }
        } else return false;
    }

    static int GetAvailableActionPoints(CreatureObject* creature) {
        if(creature->getHAM(3) == 0)
            return creature->getHAM(6);
        else return creature->getHAM(3) + creature->getHAM(6);
    }

    static int GetAvailableForcePoints(CreatureObject* creature) {
        if(creature->isPlayerCreature()) {
            return creature->getPlayerObject()->getForcePower();
        } else {
            return 99; //TODO: Should be an actual pool on NPCs.
        }
    }

    static void DrainActionOrWill(CreatureObject* creature, int amount) {
        if(creature->getHAM(3) >= amount)
            BorCharacter::ModPool(creature, "action", amount * -1, true);
        else {
            int remainingAction = creature->getHAM(3);
            BorCharacter::ModPool(creature, "action", remainingAction * -1, true);
            BorCharacter::ModPool(creature, "will", (amount - remainingAction) * -1, true);
        }
    }

    static void DrainForce(CreatureObject* creature, int amount) {
        if(creature->isPlayerCreature()) {
            BorCharacter::ModPool(creature, "force", amount * -1, true);
        } else {
            //TODO: Handle NPC force pool.
        }
    }

    static int GetToHitModifier(CreatureObject* attacker, CreatureObject* defender, WeaponObject* attackerWeapon) {
        int distance = BorCharacter::GetTargetDistance(attacker, defender);
        int minRange = attackerWeapon->getPointBlankRange();
        int maxRange = attackerWeapon->getMaxRange();
        int prefRange = attackerWeapon->getIdealRange();

        int distanceModifier = 0;
        bool tooClose = false;

        // Below minimum range.
        if(distance < minRange) {
            distanceModifier = attackerWeapon->getPointBlankAccuracy();
            tooClose = true;
        // Within preferred range.   
        } else if(distance <= prefRange) {
            distanceModifier = 0; // Do not modify DC in preferred range.
        // Outside of preferred range, still within max range.
        } else if(distance <= maxRange) {
            distanceModifier = attackerWeapon->getIdealAccuracy(); // Borrie RP weapons use the base Galaxies IdealAccuracy property as a far range modifier.
        // Outside of max range.
        } else {
            distanceModifier = 89; // Modifier, not base value.
            tooClose = true; // General out of range property, also works for "too far".
        }

        int postureModifier = 0;

        //Handle attacker stance
        if(attacker->isKneeling() && !tooClose && !attackerWeapon->isMeleeWeapon()) {
            postureModifier -= 2;
        } 
        else if(attacker->isProne() && !tooClose && !attackerWeapon->isMeleeWeapon()) {
            postureModifier -= 5;
        }

        //Handle defender stance
        if(defender->isKneeling() && !tooClose && !attackerWeapon->isMeleeWeapon()) {
            postureModifier += 2;
        } 
        else if(defender->isKneeling() && !tooClose && attackerWeapon->isMeleeWeapon()) {
            postureModifier -= 2;
        } 
        else if(defender->isProne() && !tooClose && !attackerWeapon->isMeleeWeapon()) {
            postureModifier += 5;
        } 
        else if(defender->isProne() && !tooClose && attackerWeapon->isMeleeWeapon()) {
            postureModifier -= 5;
        } 

        return distanceModifier + postureModifier;
    }

    static void ThrowRoleplayGrenade(CreatureObject* attacker, CreatureObject* defender, CreatureObject* commander, WeaponObject* grenade) {
        int toHitDC = GetToHitModifier(attacker, defender, grenade) + 10;

        int demoSkill = attacker->getSkillMod("rp_demolitions");
        int throwSkill = attacker->getSkillMod("rp_throwing");

        int toHitRoll = BorDice::Roll(1, 20);

        String message = "";

        SharedObjectTemplate* templateData = TemplateManager::instance()->getTemplate(grenade->getServerObjectCRC());

		if (templateData == nullptr)
			return;

		SharedWeaponObjectTemplate* grenadeData = cast<SharedWeaponObjectTemplate*>(templateData);

		if (grenadeData == nullptr)
			return;

        int skillLevel = grenadeData->getRpSkillLevel();

        int radius = grenade->getDamageRadius();

        bool failedDemoCheck = false;
        CreatureObject* centerTarget = defender;
        int demoRoll = BorDice::Roll(1, 20);
        int demoTotal = demoRoll + demoSkill;

        if(demoSkill < skillLevel) {
            // Skill is less than minimum requirement, prompting a check to avoid having it blow up on top of you.
            if(demoTotal <= (10 + skillLevel)) {
                //The grenade blows up in your face!
                int slot = GetBodyPartTarget();
                int totalDamage = GetDamageRoll(grenade->getMaxDamage(), grenade->getMinDamage(), grenade->getBonusDamage(), false, false);
                message = attacker->getFirstName() + " attempts to activate the " + grenade->getCustomObjectName().toString() + ", but it goes off prematurely, the blast focused on their " + GetSlotDisplayName(slot);
                String combatLogPrefix = ", causing \\#FF9999";
                message += OrchestrateDamage(combatLogPrefix, attacker, grenade, totalDamage, slot, false);
                BorrieRPG::BroadcastMessage(attacker, message);
                return;
            }
            //If the check is successful, do nothing and proceed with normal grenade logic.
        } 

        if(toHitRoll + throwSkill < toHitDC) {
            //The throwing roll was missed, therefore we output text and do nothing.
            message = attacker->getFirstName() + " throws a " + grenade->getCustomObjectName().toString() + " toward " + defender->getFirstName();
            message = message + " (" + String::valueOf(toHitRoll) + " + " + String::valueOf(throwSkill) + " = " + String::valueOf(toHitRoll + throwSkill);
            message = message + " vs DC: " + String::valueOf(toHitDC) + ")";
            message = message + ", missing wide of the mark!";
            BorrieRPG::BroadcastMessage(attacker, message);
            return;
        }

		SortedVector<QuadTreeEntry*> closeObjects;
		Zone* zone = centerTarget->getZone();

        if(zone == nullptr) {
            attacker->sendSystemMessage("Attempt to get Zone resulted in a null pointer. It really shouldn't do that. Contact the Admins.");
            return;
        }

		ManagedReference<CreatureObject*> targetCreature = nullptr;

		if (centerTarget->getCloseObjects() == nullptr) {
			//zone->getInRangeObjects(centerTarget->getWorldPositionX(), centerTarget->getWorldPositionY(), radius, &closeObjects, true);
            zone->getInRangeObjects(centerTarget->getWorldPositionX(), centerTarget->getWorldPositionY(), ZoneServer::CLOSEOBJECTRANGE, &closeObjects, true);
            //zone->getInRangeObjects(centerTarget->getWorldPositionX(), centerTarget->getWorldPositionY(), ZoneServer::CLOSEOBJECTRANGE, &closeObjects, true, true);
		}
		else {      
			CloseObjectsVector* closeVector = (CloseObjectsVector*) centerTarget->getCloseObjects();
			closeVector->safeCopyReceiversTo(closeObjects, CloseObjectsVector::CREOTYPE);
		}

        int targetCount = 0; 

        //Yes I know we do this loop twice, but its to accurately report the target count.
        for (int i = 0; i < closeObjects.size(); i++) {
			SceneObject* targetObject = static_cast<SceneObject*>(closeObjects.get(i));
			if (targetObject->isCreatureObject() && centerTarget->isInRange(targetObject, radius)) {
				targetCount++;
			}
		}

        message = attacker->getFirstName() + " throws a " + grenade->getCustomObjectName().toString() + " toward " + defender->getFirstName();
        message = message + " (" + String::valueOf(toHitRoll) + " + " + String::valueOf(throwSkill) + " = " + String::valueOf(toHitRoll + throwSkill);
        message = message + " vs DC: " + String::valueOf(toHitDC) + ")";
        message = message + ", which explodes in the vicinity of "+String::valueOf(targetCount)+" targets!";

        BorrieRPG::BroadcastMessage(attacker, message);
            
        int foundTargets = 0;
        for (int i = 0; foundTargets < targetCount; i++) { 
			SceneObject* targetObject = static_cast<SceneObject*>(closeObjects.get(i));
			if (targetObject->isCreatureObject() && centerTarget->isInRange(targetObject, radius)) {
				targetCreature = cast<CreatureObject*>(targetObject);
				Locker locker(targetCreature, centerTarget);
                HandleGrenadeReaction(targetCreature, grenade, BorCharacter::GetTargetDistance(targetCreature, centerTarget), demoTotal);
                foundTargets++;
			}
		}
    }

    static void HandleGrenadeReaction(CreatureObject* victim, WeaponObject* grenade, float distance, int demoTotal) {
        String message = victim->getFirstName() + " is in proximity of the grenade's blast radius!";
        int maneuverabilitySkill = victim->getSkillMod("rp_maneuverability");
        int telekinesisSkill = victim->getSkillMod("rp_telekinesis");
        bool dodgedSuccessfully = false;

        int totalDamage = GetDamageRoll(grenade->getMaxDamage(), grenade->getMinDamage(), grenade->getBonusDamage(), false, false);

        int dodgeRoll = BorDice::Roll(1, 20);

        if(maneuverabilitySkill >= telekinesisSkill) {
            //Dodge
            message = message + " They hurdle to get out of the way ";
            message = message + "("+String::valueOf(dodgeRoll)+" + "+String::valueOf(maneuverabilitySkill)+" vs DC: "+String::valueOf(demoTotal)+")";
            if(dodgeRoll + maneuverabilitySkill >= demoTotal)
                dodgedSuccessfully = true;
        } else {
            //Push the grenade away.
            message = message + " They raise their hand towards the grenade ";
            message = message + "("+String::valueOf(dodgeRoll)+" + "+String::valueOf(telekinesisSkill)+" vs DC: "+String::valueOf(demoTotal)+")";
            if(dodgeRoll + telekinesisSkill >= demoTotal)
                dodgedSuccessfully = true;
        }

        int slot = GetBodyPartTarget();

        if(!dodgedSuccessfully) {
            //Take damage
            message = message + ", which fails, the blast focused on their " + GetSlotDisplayName(slot);
            String combatLogPrefix = ", causing \\#FF9999";
            message += OrchestrateDamage(combatLogPrefix, victim, grenade, totalDamage, slot, false);
        } else {
            //Take half damage
            message = message + ", successfully avoiding most of the blast, which is focused on their " + GetSlotDisplayName(slot);
            totalDamage = totalDamage / 2;
            String combatLogPrefix = ", and taking only \\#FF9999";
            message += OrchestrateDamage(combatLogPrefix, victim, grenade, totalDamage, slot, false);
        }

        BorrieRPG::BroadcastMessage(victim, message);
    }
};

#endif /*BORCOMBAT_H_*/