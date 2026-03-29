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
	static void AttackTarget(CreatureObject* attacker, CreatureObject* defender, CreatureObject* commander, int bodyPartTarget, bool powerAttack, bool ignoreLOS = false) {
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
        

        String attackVerb = powerAttack ? "power attacked" : "attacked";
        if(bodyPartTarget != -1) 
            attackVerb = "aimed at "+defender->getFirstName()+"'s "+GetSlotDisplayName(bodyPartTarget);
        else
            attackVerb += " " + defender->getFirstName();

        //To Hit
        int toHitDC = GetToHitModifier(attacker, defender, weapon) + 10;
        int aimMod = 0;
        if(bodyPartTarget != -1) { //A Body Part was specified.
            aimMod = bodyPartTarget;
            DrainActionOrWill(attacker, 1);
        }

        int skillCheck = 0;

        if(weapon->isJediWeapon()) skillCheck = attacker->getSkillMod("rp_lightsaber");
        else if(weapon->isUnarmedWeapon()) skillCheck = attacker->getSkillMod("rp_unarmed");
        else if(weapon->isMeleeWeapon()) skillCheck = attacker->getSkillMod("rp_melee");
        else if(weapon->isRangedWeapon()) skillCheck = attacker->getSkillMod("rp_ranged");

        int toHitRoll = BorDice::Roll(1, 20);

        /*
        //Lightsaber Hurt self check.
        if(weapon->isJediWeapon()) {
            //Modify toHitDC if its our lightsaber.
            if(weapon->getCraftersName() == attacker->getFirstName()) {
                toHitDC -= 2;
                if(toHitDC < 0)
                    toHitDC = 0;
            }

            bool selfHit = false;
            int saberSkill = attacker->getSkillMod("rp_lightsaber");
            if(saberSkill == 0) {
                if(toHitRoll < 18) {
                    //Ouch
                    selfHit = true;
                    
                } 
            } else if(saberSkill < 3) {
                if(toHitRoll == 1) {
                    selfHit = true;
                }
            }

            if(selfHit) {
                BorEffect::PerformReactiveAnimation(attacker, attacker, "hit", GetSlotHitlocation(BorDice::Roll(1, 10)), true);
                int totalDamage = GetDamageRoll(weapon->getMaxDamage(), weapon->getMinDamage(), weapon->getBonusDamage());
                BorrieRPG::BroadcastMessage(attacker, attacker->getFirstName() + " accidently hurts themselves with the lightsaber, doing "+String::valueOf(totalDamage)+" damage!");
                BorCharacter::ModPool(attacker, "health", totalDamage * -1, true);       
                return;
            }
        } */

        if(powerAttack) {
            int powerAttackCost = attacker->getStoredInt("power_attack_count");
            attacker->setStoredInt("power_attack_count", powerAttackCost + 1);
            DrainActionOrWill(attacker, 3 + powerAttackCost); //Changed to 3 from 1 as per rebalancing, 3/8/2023
            if(toHitRoll + skillCheck + (15 - skillCheck) < toHitDC) {
                //Miss
                BorrieRPG::BroadcastMessage(attacker, attacker->getFirstName() + " "+attackVerb+ " and missed!  \\#DBDBDB" + GenerateOutputSpam(toHitRoll, skillCheck, toHitDC) + "\\#FFFFFF"); 
                BorEffect::PerformReactiveAnimation(defender, attacker, "miss", GetSlotHitlocation(bodyPartTarget), true);
                return;
            } 
        }

        if(toHitRoll + skillCheck >= toHitDC || toHitRoll == 20) {
            if(bodyPartTarget != -1) {
                //If we specified a target, we need to see if we can hit it.
                if(toHitRoll + skillCheck + aimMod < toHitDC || toHitRoll == 20) {
                    //We failed to hit the target, so get a new target that isn't the one we specified.
                    int newTarget = BorDice::Roll(1, 10);
                    while(bodyPartTarget == newTarget) {
                        newTarget = BorDice::Roll(1, 10);
                    }
                    bodyPartTarget = newTarget;
                } 
            } else {
                //Randomly getting a body part.
                bodyPartTarget = BorDice::Roll(1, 10);
            }
        } else {
            //Miss
            BorrieRPG::BroadcastMessage(attacker, attacker->getFirstName() + " "+attackVerb+ " and missed! \\#DBDBDB" + GenerateOutputSpam(toHitRoll, skillCheck, toHitDC) + "\\#FFFFFF");
            BorEffect::PerformReactiveAnimation(defender, attacker, "miss", GetSlotHitlocation(bodyPartTarget), true);
            return;
        }

        //We've hit! Calculate Damage and apply it to the body part. Get the armor of that part. 
        int damageDieCount = weapon->getMinDamage();
        int damageDieType = weapon->getMaxDamage();

        if(powerAttack)
            damageDieCount++;

        int bonusDamage = weapon->getBonusDamage();
        
        if(weapon->isJediWeapon()) {
            bonusDamage += attacker->getSkillMod("rp_lightsaber");

        } else if(weapon->isUnarmedWeapon() || weapon->isMeleeWeapon()) {
            bonusDamage += attacker->getSkillMod("rp_strength_damage_bonus");
        } 

        int totalDamage = GetDamageRoll(damageDieType, damageDieCount, bonusDamage);

        //Damage the attacker's weapon
        weapon->setConditionDamage(weapon->getConditionDamage() + totalDamage);
        
        //Calculate the Reaction
        //The 1 is hitCount
        String reactionResult = HandleCombatReaction(attacker, defender, totalDamage, toHitRoll + skillCheck, bodyPartTarget, powerAttack, false, 1);
        
        //Apply Followup as per the reaction.
        String toHitString = "\\#DBDBDB" + GenerateOutputSpam(toHitRoll, skillCheck, toHitDC) + "\\#FFFFFF";

        String combatSpam = attacker->getFirstName() + " "+attackVerb+ " and hit their " + GetSlotDisplayName(bodyPartTarget) + "!";
        
        if(ignoreLOS) {
            BorrieRPG::BroadcastMessage(attacker, combatSpam + " " + toHitString +  reactionResult + " (Line of Sight Ignored)");
        } else {
            BorrieRPG::BroadcastMessage(attacker, combatSpam + " " + toHitString +  reactionResult);
        }
        
	}

    static void FlurryAttackTarget(CreatureObject* attacker, CreatureObject* defender, CreatureObject* commander, bool ignoreLOS = false) {
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
        int roll1 = BorDice::Roll(1, 20); 
        int roll2 = BorDice::Roll(1, 20); 
        int roll3 = BorDice::Roll(1, 20); 

        int lowestRoll = std::min(std::min(roll1, roll2), roll3);

        int skillCheck = 0;
        if(weapon->isJediWeapon()) skillCheck = attacker->getSkillMod("rp_lightsaber");
        else if(weapon->isUnarmedWeapon()) skillCheck = attacker->getSkillMod("rp_unarmed");
        else if(weapon->isMeleeWeapon()) skillCheck = attacker->getSkillMod("rp_melee");
        else if(weapon->isRangedWeapon()) skillCheck = attacker->getSkillMod("rp_ranged");
        
        /*
        //Lightsaber Hurt self check.
        if(weapon->isJediWeapon()) {
            //Modify toHitDC if its our lightsaber.
            if(weapon->getCraftersName() == attacker->getFirstName()) {
                toHitDC -= 2;
                if(toHitDC < 0)
                    toHitDC = 0;
            }
            
            bool selfHit = false;
            int saberSkill = attacker->getSkillMod("rp_lightsaber");
            if(saberSkill == 0) {
                if(lowestRoll < 18) {
                    //Ouch
                    selfHit = true;
                    
                } 
            } else if(saberSkill < 3) {
                if(lowestRoll == 1) {
                    selfHit = true;
                }
            }

            if(selfHit) {
                BorEffect::PerformReactiveAnimation(attacker, attacker, "hit", GetSlotHitlocation(BorDice::Roll(1, 10)), true);
                int totalDamage = GetDamageRoll(weapon->getMaxDamage(), weapon->getMinDamage(), weapon->getBonusDamage());
                BorrieRPG::BroadcastMessage(attacker, attacker->getFirstName() + " accidently hurts themselves with the lightsaber, doing "+String::valueOf(totalDamage)+" damage!");
                BorCharacter::ModPool(attacker, "health", totalDamage * -1, true);       
                return;
            }
        } */

        bool hit1 = roll1 + skillCheck >= toHitDC;
        bool hit2 = roll2 + skillCheck >= toHitDC + 5;
        bool hit3 = roll3 + skillCheck >= toHitDC + 10;

        DrainActionOrWill(attacker, 1);

        //Absolute Miss
        if(!hit1 && !hit2 && !hit3) {
            BorrieRPG::BroadcastMessage(attacker, attacker->getFirstName() + " flurry attacked " +  defender->getFirstName() + " and missed! \\#DBDBDB" + GenerateFlurryOutputSpam(roll1, roll2, roll3, skillCheck, toHitDC) + "\\#FFFFFF");
            BorEffect::PerformReactiveAnimation(defender, attacker, "miss", GetSlotHitlocation(BorDice::Roll(1, 10)), true);
            BorEffect::PerformReactiveAnimation(defender, attacker, "miss", GetSlotHitlocation(BorDice::Roll(1, 10)), true);
            BorEffect::PerformReactiveAnimation(defender, attacker, "miss", GetSlotHitlocation(BorDice::Roll(1, 10)), true);
            return;
        }

        int damageDieCount = weapon->getMinDamage();
        int damageDieType = weapon->getMaxDamage();
        int bonusDamage = weapon->getBonusDamage();

        if(weapon->isJediWeapon()) {
            bonusDamage += attacker->getSkillMod("rp_lightsaber");

        } else if(weapon->isUnarmedWeapon() || weapon->isMeleeWeapon()) {
            bonusDamage += attacker->getSkillMod("rp_strength_damage_bonus");
        } 

        int damage1 = GetDamageRoll(damageDieType, damageDieCount, bonusDamage) / 2;
        int damage2 = GetDamageRoll(damageDieType, damageDieCount, bonusDamage) / 2;
        int damage3 = GetDamageRoll(damageDieType, damageDieCount, bonusDamage) / 2;

        int totalDamage = 0;
        if(hit1) totalDamage += damage1;
        if(hit2) totalDamage += damage2;
        if(hit3) totalDamage += damage3;

        if(totalDamage < 1) totalDamage = 1;
        
        weapon->setConditionDamage(weapon->getConditionDamage() + totalDamage);

        int hitCount = 0;
        if(hit1) hitCount++;
        if(hit2) hitCount++;
        if(hit3) hitCount++;

        int highestRoll = roll1;
        if(roll2 > highestRoll) highestRoll = roll2;
        if(roll3 > highestRoll) highestRoll = roll3; 

        String reactionResult = HandleCombatReaction(attacker, defender, totalDamage, highestRoll + skillCheck, BorDice::Roll(1, 10), false, true, hitCount);

        //Apply Followup as per the reaction.
        String toHitString = "\\#DBDBDB" + GenerateFlurryOutputSpam(roll1, roll2, roll3, skillCheck, toHitDC) + "\\#FFFFFF";

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

    static int GetDamageRoll(int dieType, int dieCount, int bonusDamage) {
        int totalDamage = bonusDamage;
        for(int i = 0;i<dieCount;i++) {
            totalDamage += BorDice::Roll(1, dieType);
        }

        return totalDamage;
    }

    static String GenerateOutputSpam(int roll, int skillMod, int diceCheck) {
        return "(1d20: " + String::valueOf(roll) + " + " + String::valueOf(skillMod) + " = " + String::valueOf(roll + skillMod) + " vs. DC: " + String::valueOf(diceCheck) + ") ";
    }

    static String GenerateDamageOutputSpam(int damage, int finalDamage, int armorProtection, int armorSkillFlag) {
        if(armorProtection > 0 && (damage > armorProtection && !(armorSkillFlag))) {
            return String::valueOf(damage) + " - " + String::valueOf(armorProtection) + " = " + String::valueOf(finalDamage) + " damage!";
        }   
        else if(armorProtection > 0 && (damage <= armorProtection) && !(armorSkillFlag)) {
            return String::valueOf(damage) + " - " + String::valueOf(armorProtection) + " = " + String::valueOf(finalDamage) + " (minimum) damage!";
        }
        else if(armorSkillFlag) {
            return String::valueOf(damage) + " damage, only blocking 1 point due to insufficent Strength for their armor!";
        }
        else { 
            return String::valueOf(finalDamage) + " damage!";
        }
    }

    static String GenerateFlurryOutputSpam(int roll1, int roll2, int roll3, int skillMod, int diceCheck) {
        String result = "(3d20: "+ String::valueOf(roll1) + ", ";
        result += String::valueOf(roll2) + ", ";
        result += String::valueOf(roll3) + " ";
        result += "+ " + String::valueOf(skillMod) + " vs. DC: " + String::valueOf(diceCheck) + ", " + String::valueOf(diceCheck+5)+", " + String::valueOf(diceCheck+10) +" ) "; 
        return result;
    }

    static String HandleCombatReaction(CreatureObject* attacker, CreatureObject* defender, int incomingDamage, int toHit, int slot, bool powerAttacked, bool flurryAttacked, int hitCount) {
        WeaponObject* attackerWeapon = attacker->getWeapon();
        WeaponObject* defenderWeapon = defender->getWeapon();
        int defenderReactionType = defender->getStoredInt("reaction_stance");
        //int defenderAction = defender->`AM(3);

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
                    ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage, slot);
                    ManagedReference<ArmorObject*> armor = BorCharacter::GetArmorAtSlot(defender, GetSlotName(slot));
                    int armorProtection = GetArmorProtection(defender, armor, GetDamageType(attackerWeapon));
                    int armorSkillFlag = 0;
                    if (defender->getSkillMod("rp_strength") < armor->getRpSkillLevel()) {
                        armorSkillFlag = 1;
                    }
                    reactionSpam += ", taking \\#FF9999" + GenerateDamageOutputSpam(incomingDamage, GetArmorReducedDamage(incomingDamage, armorProtection), armorProtection, armorSkillFlag);
                }
                else if(defenseRoll + defenseSkill > toHit) { //Success

                    //Damage the defender's weapon on successful Defend. If the attacker's weapon is a lightsaber and the defender's is not, destory the defender's weapon.
                    if(attackerWeapon->isJediWeapon() && !defenderWeapon->isJediWeapon()) {
                        defenderWeapon->setConditionDamage(defenderWeapon->getConditionDamage() + 1000);
                        defender->sendSystemMessage("Your weapon is destroyed by the lightsaber!");
                    }
                    else {
                        defenderWeapon->setConditionDamage(defenderWeapon->getConditionDamage() + incomingDamage);
                    }

                    //If the defender's weapon is a lightsaber and the attacker's is not, destroy the attacker's weapon
                    if(defenderWeapon->isJediWeapon() && !attackerWeapon->isJediWeapon()) {
                        attackerWeapon->setConditionDamage(attackerWeapon->getConditionDamage() + 1000);
                        attacker->sendSystemMessage("Your weapon is destroyed by the lightsaber!");
                    }
                    
                    DrainActionOrWill(defender, 1 * actionPointMod);
                    reactionSpam += defender->getFirstName() + " successfully defends against the attack (1d20 = " + String::valueOf(defenseRoll) + " + " + String::valueOf(defenseSkill) + ") ";
                    reactionSpam += ", absorbing \\#FF9999" + String::valueOf(incomingDamage) + "\\#FFFFFF damage into their weapon.";
                    BorEffect::PerformReactiveAnimation(defender, attacker, "defend", GetSlotHitlocation(slot), true);
    
                    /*  Remove partial Defend
                } else if(defenseRoll + defenseSkill > 15) {
                    reactionSpam += defender->getFirstName() + " partially defends against the attack (1d20 = " + String::valueOf(defenseRoll) + " + " + String::valueOf(defenseSkill) + ") ";
                    reactionSpam += ", absorbing \\#FF9999" + String::valueOf(incomingDamage / 2) + "\\#FFFFFF damage into their weapon, ";
                    reactionSpam += ", and personally taking \\#FF9999" + String::valueOf(incomingDamage / 2) + "\\#FFFFFF damage.";
                    ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage / 2, slot);
                    BorEffect::PerformReactiveAnimation(defender, attacker, "defend", GetSlotHitlocation(slot), true);
                    */
                } else {
                    //BorCharacter::ModPool(defender, "health", incomingDamage * -1, true);
                    DrainActionOrWill(defender, 1 * actionPointMod);
                    ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage, slot);
                    reactionSpam += defender->getFirstName() + " tries to defend against the attack, but fails (1d20 = " + String::valueOf(defenseRoll) + " + " + String::valueOf(defenseSkill) + ") ";
                    ManagedReference<ArmorObject*> armor = BorCharacter::GetArmorAtSlot(defender, GetSlotName(slot));
                    int armorProtection = GetArmorProtection(defender, armor, GetDamageType(attackerWeapon));
                    int armorSkillFlag = 0;
                    if (defender->getSkillMod("rp_strength") < armor->getRpSkillLevel()) {
                        armorSkillFlag = 1;
                    }
                    reactionSpam += ", taking \\#FF9999" + GenerateDamageOutputSpam(incomingDamage, GetArmorReducedDamage(incomingDamage, armorProtection), armorProtection, armorSkillFlag);
                    BorEffect::PerformReactiveAnimation(defender, attacker, "defend", GetSlotHitlocation(slot), false);
                }
                return reactionSpam;
            } else if(defenderReactionType == 2) { //Parry
                int meleeRoll = BorDice::Roll(1, 20);
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
                            bonusDamage += attacker->getSkillMod("rp_lightsaber");
                    } else if(weapon->isUnarmedWeapon() || weapon->isMeleeWeapon()) {
                        bonusDamage += attacker->getSkillMod("rp_strength_damage_bonus");
                    } 
                    int returnDamage = GetDamageRoll(damageDieType, damageDieCount, bonusDamage) / 2;
                    ApplyAdjustedHealthDamage(attacker, defenderWeapon, returnDamage, slot);


                    //Damage the defender's weapon on successful Defend. If the attacker's weapon is a lightsaber and the defender's is not, destory the defender's weapon.
                    if(attackerWeapon->isJediWeapon() && !defenderWeapon->isJediWeapon()) {
                        defenderWeapon->setConditionDamage(defenderWeapon->getConditionDamage() + 1000);
                        defender->sendSystemMessage("Your weapon is destroyed by the lightsaber!");
                    }
                    else {
                        defenderWeapon->setConditionDamage(defenderWeapon->getConditionDamage() + incomingDamage);
                    }

                    //If the defender's weapon is a lightsaber and the attacker's is not, destroy the attacker's weapon
                    if(defenderWeapon->isJediWeapon() && !attackerWeapon->isJediWeapon()) {
                        attackerWeapon->setConditionDamage(attackerWeapon->getConditionDamage() + 1000);
                        attacker->sendSystemMessage("Your weapon is destroyed by the lightsaber!");
                    }


                    BorEffect::PerformReactiveAnimation(defender, attacker, "parry", GetSlotHitlocation(slot), true);
                    reactionSpam += ", but " + defender->getFirstName()+" parries the attack (" +String::valueOf(meleeRoll)+" + "+String::valueOf(meleeSkill)+" = "+String::valueOf(meleeRoll + meleeSkill)+" vs DC: "+String::valueOf(toHit)+"), striking back for \\#FF9999"+String::valueOf(returnDamage)+"\\#FFFFFF damage!";
                } else {
                    //Unsuccessful Parry
                    DrainActionOrWill(defender, 3);
                    ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage, slot);
                    BorEffect::PerformReactiveAnimation(defender, attacker, "parry", GetSlotHitlocation(slot), false);
                    ManagedReference<ArmorObject*> armor = BorCharacter::GetArmorAtSlot(defender, GetSlotName(slot));
                    int armorProtection = GetArmorProtection(defender, armor, GetDamageType(attackerWeapon));
                    int armorSkillFlag = 0;
                    if (defender->getSkillMod("rp_strength") < armor->getRpSkillLevel()) {
                        armorSkillFlag = 1;
                    }
                    reactionSpam += ". " + defender->getFirstName() + " tries to parry the attack, but fails (" +String::valueOf(meleeRoll)+" + "+String::valueOf(meleeSkill)+" = "+String::valueOf(meleeRoll + meleeSkill)+" vs DC: "+String::valueOf(toHit)+"), recieving \\#FF9999"+GenerateDamageOutputSpam(incomingDamage, GetArmorReducedDamage(incomingDamage, armorProtection), armorProtection, armorSkillFlag);
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
                    ManagedReference<ArmorObject*> armor = BorCharacter::GetArmorAtSlot(defender, GetSlotName(slot));
                    int armorProtection = GetArmorProtection(defender, armor, GetDamageType(attackerWeapon));
                    int armorSkillFlag = 0;
                    if (defender->getSkillMod("rp_strength") < armor->getRpSkillLevel()) {
                        armorSkillFlag = 1;
                    }
                    reactionSpam += defender->getFirstName() +" takes \\#FF9999" + GenerateDamageOutputSpam(incomingDamage, GetArmorReducedDamage(incomingDamage, armorProtection), armorProtection, armorSkillFlag);
                    ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage, slot);
                    BorEffect::PerformReactiveAnimation(defender, attacker, "dodge", GetSlotHitlocation(slot), false);
                    return reactionSpam;
                }

                ManagedReference<ArmorObject*> armor = BorCharacter::GetArmorAtSlot(defender, GetSlotName(slot));
                int rating = 0;
                if (armor != nullptr && armor.get() != nullptr)
                    rating = armor->getRating();

                if(dodgeRoll + maneuverabilitySkill >= toHit) { //Successful Dodge, not wearing Heavy Armor
                    reactionSpam += ", but " + defender->getFirstName() + " dodges out of the way! (1d20 = " + String::valueOf(dodgeRoll) + " + " + String::valueOf(maneuverabilitySkill) + ") ";
                    BorEffect::PerformReactiveAnimation(defender, attacker, "dodge", GetSlotHitlocation(slot), true);
                    if (rating == 1) { //Light Armor
                        DrainActionOrWill(defender, 2 * actionPointMod);
                    }
                    else if (rating == 2) { //Medium Armor
                        DrainActionOrWill(defender, 3 * actionPointMod);
                    }
                    else { //No Armor
                        DrainActionOrWill(defender, 1 * actionPointMod);
                    }
                }
                    /* Remove partial dodge 
                } else if(dodgeRoll + maneuverabilitySkill >= toHit / 2 ) { //Partial Dodge
                    reactionSpam += ", " + defender->getFirstName() + " struggles to dodge out of the way! (1d20 = " + String::valueOf(dodgeRoll) + " + " + String::valueOf(maneuverabilitySkill) + ") ";
                    reactionSpam += defender->getFirstName() + " stumbles, but only takes \\#FF9999" + String::valueOf(incomingDamage / 2) + "\\#FFFFFF damage.";
                    //BorCharacter::ModPool(defender, "health", (incomingDamage / 2) * -1);
                    ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage / 2, slot);
                    BorEffect::PerformReactiveAnimation(defender, attacker, "dodge", GetSlotHitlocation(slot), true);
                    DrainActionOrWill(defender, 1 * actionPointMod);
                    */
                else { //full fail
                    reactionSpam += ", " + defender->getFirstName() + " tries to dodge out of the way and fails! (1d20 = " + String::valueOf(dodgeRoll) + " + " + String::valueOf(maneuverabilitySkill) + ") ";
                    ManagedReference<ArmorObject*> armor = BorCharacter::GetArmorAtSlot(defender, GetSlotName(slot));
                    int armorProtection = GetArmorProtection(defender, armor, GetDamageType(attackerWeapon));
                    int armorSkillFlag = 0;
                    if (defender->getSkillMod("rp_strength") < armor->getRpSkillLevel()) {
                        armorSkillFlag = 1;
                    }
                    reactionSpam += defender->getFirstName() +" takes \\#FF9999" + GenerateDamageOutputSpam(incomingDamage, GetArmorReducedDamage(incomingDamage, armorProtection), armorProtection, armorSkillFlag);
                    //BorCharacter::ModPool(defender, "health", incomingDamage * -1, true);
                    ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage, slot);
                    BorEffect::PerformReactiveAnimation(defender, attacker, "dodge", GetSlotHitlocation(slot), false);
                    if (rating == 1) { //Light Armor
                        DrainActionOrWill(defender, 2 * actionPointMod);
                    }
                    else if (rating == 2) { //Medium Armor
                        DrainActionOrWill(defender, 3 * actionPointMod);
                    }
                    else { //No Armor
                        DrainActionOrWill(defender, 1 * actionPointMod);
                    }
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
                int deflectionCount = defender->getStoredInt("deflection_count");
                defender->setStoredInt("deflection_count", deflectionCount + 1);
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
                        reactionSpam += defender->getFirstName() + " successfully deflects the shot (1d20 = " + String::valueOf(deflectRoll) + " + " + String::valueOf(lightsaberSkill) + " vs DC: "+String::valueOf(toHit/2)+")";
                        reactionSpam += ", sending it harmlessly away.";
                        BorEffect::PerformReactiveAnimation(defender, attacker, "parry", GetSlotHitlocation(slot), false);
                    } else {
                        //Ouch time.
                        reactionSpam += defender->getFirstName() + " tries to deflect the shot (1d20 = " + String::valueOf(deflectRoll) + " + " + String::valueOf(lightsaberSkill) + " vs DC: "+String::valueOf(toHit)+")";
                        ManagedReference<ArmorObject*> armor = BorCharacter::GetArmorAtSlot(defender, GetSlotName(slot));
                        int armorProtection = GetArmorProtection(defender, armor, GetDamageType(attackerWeapon));
                        int armorSkillFlag = 0;
                        if (defender->getSkillMod("rp_strength") < armor->getRpSkillLevel()) {
                            armorSkillFlag = 1;
                        }
                        reactionSpam += ", but fails, recieving \\#FF9999" + GenerateDamageOutputSpam(incomingDamage, GetArmorReducedDamage(incomingDamage, armorProtection), armorProtection, armorSkillFlag);
                        ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage, slot);
                    }                   
                } else {
                    bool deflectableWeapon = attackerWeapon->isLightsaberResistant();
                    
                    if(deflectRoll + lightsaberSkill >= toHit && deflectableWeapon) {
                        //If you roll higher or equal to their to-hit roll, you avoid damage entirely.
                        reactionSpam += ", but " + defender->getFirstName() + " successfully deflects the attack entirely. (1d20 = " + String::valueOf(deflectRoll) + " + " + String::valueOf(lightsaberSkill) + " vs DC: "+String::valueOf(toHit)+")";
                        BorEffect::PerformReactiveAnimation(defender, attacker, "parry", GetSlotHitlocation(slot), true);
                        reactionSpam += attacker->getFirstName() + "'s weapon is sundered by " + attacker->getFirstName() + "'s lightsaber!";
                    /* Remove half damage on Lightsaber Deflect
                    } else if(deflectRoll + lightsaberSkill >= toHit / 2 && deflectableWeapon) {
                        //If you roll higher or equal to half of their to-hit, you take half damage.
                        reactionSpam += defender->getFirstName() + " deflects the attack in partial (1d20 = " + String::valueOf(deflectRoll) + " + " + String::valueOf(lightsaberSkill) + " vs DC: "+String::valueOf(toHit/2)+")";
                        reactionSpam += ", still recieving \\#FF9999" + String::valueOf(incomingDamage / 2) + "\\#FFFFFF damage!";
                        BorEffect::PerformReactiveAnimation(attacker, defender, "parry", GetSlotHitlocation(slot), true);
                        ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage / 2, slot);
                        */
                    } else {
                        /* Removed blatantly incorrect reporting of whose weapon is destroyed.
                        if(!deflectableWeapon) {
                            //Destroy Weapon
                            reactionSpam += defender->getFirstName() + " fails to deflect the attack, because their weapon cannot deflect a lightsaber! It is sundered!";
                        } else {
                         */
                            reactionSpam += defender->getFirstName() + " fails to deflect the attack (1d20 = " + String::valueOf(deflectRoll) + " + " + String::valueOf(lightsaberSkill) + " vs DC: "+String::valueOf(toHit)+")";
                            ManagedReference<ArmorObject*> armor = BorCharacter::GetArmorAtSlot(defender, GetSlotName(slot));
                            int armorProtection = GetArmorProtection(defender, armor, GetDamageType(attackerWeapon));
                            int armorSkillFlag = 0;
                            if (defender->getSkillMod("rp_strength") < armor->getRpSkillLevel()) {
                                armorSkillFlag = 1;
                            }
                            reactionSpam += ", recieving \\#FF9999" + GenerateDamageOutputSpam(incomingDamage, GetArmorReducedDamage(incomingDamage, armorProtection), armorProtection, armorSkillFlag);
                            //Full Damage
                            ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage, slot);
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
                    ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage, slot);
                    BorEffect::PerformReactiveAnimation(defender, attacker, "hit", GetSlotHitlocation(slot), true);
                    defender->sendSystemMessage("You cannot deflect this attack telekinetically. You recieved full damage.");
                    ManagedReference<ArmorObject*> armor = BorCharacter::GetArmorAtSlot(defender, GetSlotName(slot));
                    int armorProtection = GetArmorProtection(defender, armor, GetDamageType(attackerWeapon));
                    int armorSkillFlag = 0;
                    if (defender->getSkillMod("rp_strength") < armor->getRpSkillLevel()) {
                        armorSkillFlag = 1;
                    }
                    return ", doing (" + GetWeaponDamageString(attacker, attackerWeapon) + ") = \\#FF9999" + GenerateDamageOutputSpam(incomingDamage, GetArmorReducedDamage(incomingDamage, armorProtection), armorProtection, armorSkillFlag);
                } 
                /* Remove reduced performance below Telekinesis 5
                else if(telekineticSkill < 5) {
                    if(deflectRoll + telekineticSkill >= toHit) {
                        //Half Damage
                        reactionSpam += defender->getFirstName() + " raises their arms, trying to shield themselves (1d20 = " + String::valueOf(deflectRoll) + " + " + String::valueOf(telekineticSkill) + ")";
                        reactionSpam += ", recieving only \\#FF9999" + String::valueOf(incomingDamage / 2) + "\\#FFFFFF damage!";
                        BorEffect::PerformReactiveAnimation(attacker, defender, "parry", GetSlotHitlocation(slot), false);
                        ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage/2, slot);
                        DrainForce(defender, forceCost);
                    } else {
                        //Full Damage
                        reactionSpam += defender->getFirstName() + " tries and fails to block the attack with their hands (1d20 = " + String::valueOf(deflectRoll) + " + " + String::valueOf(telekineticSkill) + ")";
                        reactionSpam += ", recieving \\#FF9999" + String::valueOf(incomingDamage / 2) + "\\#FFFFFF damage!";
                        ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage, slot);
                        DrainForce(defender, forceCost);
                    }
                        
                } else {
                 */
                    else if(deflectRoll + telekineticSkill >= toHit) {
                        //No Damage
                        reactionSpam += defender->getFirstName() + " raises their hand and deflects the attack away (1d20 = " + String::valueOf(deflectRoll) + " + " + String::valueOf(telekineticSkill) + ")";
                        BorEffect::PerformReactiveAnimation(attacker, defender, "parry", GetSlotHitlocation(slot), false);
                        DrainForce(defender, forceCost);
                    /* Remove partial Force Deflect
                    } else {
                        //Half Damage.
                        reactionSpam += defender->getFirstName() + " quickly raises their hand, deflecting some of the attack away (1d20 = " + String::valueOf(deflectRoll) + " + " + String::valueOf(telekineticSkill) + ")";
                        reactionSpam += ", recieving only \\#FF9999" + String::valueOf(incomingDamage / 2) + "\\#FFFFFF damage!";
                        BorEffect::PerformReactiveAnimation(attacker, defender, "parry", GetSlotHitlocation(slot), false);
                        ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage/2, slot);
                        DrainForce(defender, forceCost);
                    }
                    */
                    }
                   else {
                        //Full Damage
                        reactionSpam += defender->getFirstName() + " fails to block the attack with their hands (1d20 = " + String::valueOf(deflectRoll) + " + " + String::valueOf(telekineticSkill) + ")";
                        ManagedReference<ArmorObject*> armor = BorCharacter::GetArmorAtSlot(defender, GetSlotName(slot));
                        int armorProtection = GetArmorProtection(defender, armor, GetDamageType(attackerWeapon));
                        int armorSkillFlag = 0;
                        if (defender->getSkillMod("rp_strength") < armor->getRpSkillLevel()) {
                            armorSkillFlag = 1;
                        }
                        reactionSpam += ", recieving \\#FF9999" + GenerateDamageOutputSpam(incomingDamage, GetArmorReducedDamage(incomingDamage, armorProtection), armorProtection, armorSkillFlag);
                        ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage, slot);
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
                        reactionSpam += defender->getFirstName() + " tries to absorb the attack (1d20 = " + String::valueOf(absorbRoll) + " + " + String::valueOf(absorbSkill) + ")";
                        ManagedReference<ArmorObject*> armor = BorCharacter::GetArmorAtSlot(defender, GetSlotName(slot));
                        int armorProtection = GetArmorProtection(defender, armor, GetDamageType(attackerWeapon));
                        int armorSkillFlag = 0;
                        if (defender->getSkillMod("rp_strength") < armor->getRpSkillLevel()) {
                            armorSkillFlag = 1;
                        }
                        reactionSpam += ", recieving \\#FF9999" + GenerateDamageOutputSpam(incomingDamage, GetArmorReducedDamage(incomingDamage, armorProtection), armorProtection, armorSkillFlag);
                        ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage, slot);   
                    }
                } else if(attackerWeapon->isJediWeapon()) {
                    DrainForce(defender, forceCost);
                    if(passed) {
                        reactionSpam += defender->getFirstName() + " blocks the attack with their hand (1d20 = " + String::valueOf(absorbRoll) + " + " + String::valueOf(absorbSkill) + ")";
                    } else {
                        reactionSpam += defender->getFirstName() + " fails to absorb the attack with their hand (1d20 = " + String::valueOf(absorbRoll) + " + " + String::valueOf(absorbSkill) + ")";
                        ManagedReference<ArmorObject*> armor = BorCharacter::GetArmorAtSlot(defender, GetSlotName(slot));
                        int armorProtection = GetArmorProtection(defender, armor, GetDamageType(attackerWeapon));
                        int armorSkillFlag = 0;
                        if (defender->getSkillMod("rp_strength") < armor->getRpSkillLevel()) {
                            armorSkillFlag = 1;
                        }
                        reactionSpam += ", recieving \\#FF9999" + GenerateDamageOutputSpam(incomingDamage, GetArmorReducedDamage(incomingDamage, armorProtection), armorProtection, armorSkillFlag);     
                        ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage, slot);             
                    }
                } else {
                    //Can't block this. Full attack.
                    ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage, slot);
                    BorEffect::PerformReactiveAnimation(defender, attacker, "hit", GetSlotHitlocation(slot), true);
                    defender->sendSystemMessage("You cannot absorb this attack. You recieved full damage.");
                    ManagedReference<ArmorObject*> armor = BorCharacter::GetArmorAtSlot(defender, GetSlotName(slot));
                    int armorProtection = GetArmorProtection(defender, armor, GetDamageType(attackerWeapon));
                    int armorSkillFlag = 0;
                    if (defender->getSkillMod("rp_strength") < armor->getRpSkillLevel()) {
                        armorSkillFlag = 1;
                    }
                    return ", doing (" + GetWeaponDamageString(attacker, attackerWeapon) + ") = \\#FF9999" + GenerateDamageOutputSpam(incomingDamage, GetArmorReducedDamage(incomingDamage, armorProtection), armorProtection, armorSkillFlag);
                }
                return reactionSpam;
            }
            return reactionSpam;
        } 
        
        //Simply accept the damage. 
        ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage, slot);
        BorEffect::PerformReactiveAnimation(defender, attacker, "hit", GetSlotHitlocation(slot), true);
        ManagedReference<ArmorObject*> armor = BorCharacter::GetArmorAtSlot(defender, GetSlotName(slot));
        int armorProtection = GetArmorProtection(defender, armor, GetDamageType(attackerWeapon));
        int armorSkillFlag = 0;
        if (defender->getSkillMod("rp_strength") < armor->getRpSkillLevel()) {
            armorSkillFlag = 1;
        }
        return ", doing (" + GetWeaponDamageString(attacker, attackerWeapon) + ") = \\#FF9999" + GenerateDamageOutputSpam(incomingDamage, GetArmorReducedDamage(incomingDamage, armorProtection), armorProtection, armorSkillFlag);
    }
 
    static void ApplyAdjustedHealthDamage(CreatureObject* creature, WeaponObject* attackerWeapon, int damage, int slot) {
        if(creature->isPlayerCreature()) { //Use their equipped armor
            ManagedReference<ArmorObject*> armor = BorCharacter::GetArmorAtSlot(creature, GetSlotName(slot));
            if(armor != nullptr) {
                if(!armor->isBroken()) {
                    String damageType = GetDamageType(attackerWeapon);
                    /*  Moving lightsaber into the normal damage logic for flat reduction.
                    if(damageType == "Lightsaber" or damageType == "LIGHTSABER" or damageType == "lightSaber") { //Special Lightsaber Rules
                        if(armor->getLightSaber() > 0) { //Can Resist Lightsabers
                            //Take only 10 percent damage.
                            BorCharacter::ModPool(creature, "health", (damage / 4 ) * -1, true);
                            creature->sendSystemMessage("Your armor protected against the lightsaber!");
                        } else { //Take Full Damage
                            BorCharacter::ModPool(creature, "health", damage * -1, true);
                            armor->setConditionDamage(100);
                            creature->sendSystemMessage("Your armor was severely damaged by the lightsaber!");
                        }
                    } else {
                     */
                        //Get Defense
  
                        
                        /* //Original system that takes into account armor penetration.
                        int weaponArmorPiercing = attackerWeapon->getArmorPiercing();
                        int armorRating = armor->getRating();
                        int damageDivider = GetWeaponPenetrationDivisionModifier(weaponArmorPiercing, armorRating);
                        if(damageDivider != 0) {
                            int adjustedDamage = damage / damageDivider;
                            int armorProtection = GetArmorProtection(armor, GetDamageType(attackerWeapon));
                            int finalDamage = adjustedDamage - armorProtection;
                            if(finalDamage < 1) finalDamage = 1;
                            armor->setConditionDamage(armor->getConditionDamage() + armorProtection);
                            BorCharacter::ModPool(creature, "health", finalDamage * -1, true);
                        } else { //Take Full Damage
                            BorCharacter::ModPool(creature, "health", damage * -1, true);
                        }  */

                        //Armor handling (without penetration)

                        // Armor protection is only one if a character is untrained in the use of their armor.
                        int armorProtection = 1;
                        if (creature->getSkillMod("rp_strength") >= armor->getRpSkillLevel())
                        {
                            armorProtection = GetArmorProtection(creature, armor, GetDamageType(attackerWeapon));
                            if(armorProtection < 0) {
                                armorProtection = 0;
                            }
                        }
                        int finalDamage = damage - armorProtection;
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
                                    //armor->setConditionDamage(armorProtection);
                                    armor->setConditionDamage(armor->getConditionDamage()+ armorProtection);
                                else
                                {
                                    armor->setConditionDamage(armor->getConditionDamage()+ 100);
                                    creature->sendSystemMessage("Your " + armorName + " is severely damaged by the attack!"); 
                                }
                            }
                            else {
                                armor->setConditionDamage(armor->getConditionDamage()+ armorProtection);
                            }
                            creature->sendSystemMessage("Your " + armorName + " absorbed " + String::valueOf(armorProtection) + " damage.");
                            if (creature->getSkillMod("rp_strength") < armor->getRpSkillLevel())
                            {
                                creature->sendSystemMessage("Your " + armorName + " only protected against 1 point of damage because you do not have enough Strength to use it properly!");
                            }
                        } 
                        else {
                            if(damageType == "Lightsaber" or damageType == "LIGHTSABER" or damageType == "lightSaber") {
                                if(armor->getLightSaber() > 0)
                                    armor->setConditionDamage(armor->getConditionDamage()+ armorProtection);
                                else
                                {
                                    armor->setConditionDamage(armor->getConditionDamage()+ 100);
                                    creature->sendSystemMessage("Your " + armorName + " is severely damaged by the attack!"); 
                                }
                            }
                            else {
                                armor->setConditionDamage(armor->getConditionDamage()+ armorProtection);
                            }
                            
                            creature->sendSystemMessage("Your " + armorName + " absorbed " + String::valueOf(damage) + " damage."); 
                            if (creature->getSkillMod("rp_strength") < armor->getRpSkillLevel())
                            {
                                creature->sendSystemMessage("Your " + armorName + " only protected against 1 point of damage because you do not have enough Strength to use it properly!");
                            }
                        }               
                }
                else { //Take Full Damage
                    BorCharacter::ModPool(creature, "health", damage * -1, true);
                }
            } else { //Take Full Damage
                BorCharacter::ModPool(creature, "health", damage * -1, true);
            }
        } else { //Use their skill mod armor. 

            String armorSlot = GetSlotName(slot);
            String damageType = GetDamageType(attackerWeapon);
            if(damageType == "Lightsaber" or damageType == "LIGHTSABER" or damageType == "lightSaber") {
                if(creature->getStoredInt("rp_armor_" + armorSlot + "_Lightsaber") > 0) {
                    //Take only 10 percent damage.
                    BorCharacter::ModPool(creature, "health", (damage / 10) * -1, true);
                } else {
                    BorCharacter::ModPool(creature, "health", damage * -1, true);
                }
            } else {
                int armorRating = creature->getStoredInt("rp_armor_rating_" + armorSlot);
                //Remove references to armor piercing, as it exists on weapons as a legacy attribute and should not be used.
                //int weaponArmorPiercing = attackerWeapon->getArmorPiercing();
                //int damageDivider = GetWeaponPenetrationDivisionModifier(weaponArmorPiercing, armorRating);
                int damageDivider = 1;
                if(damageDivider != 0) {
                    int adjustedDamage = damage / damageDivider;
                    int armorProtection = creature->getStoredInt("rp_armor_" + armorSlot + "_" + GetDamageType(attackerWeapon));
                    int finalDamage = adjustedDamage - armorProtection;
                    BorCharacter::ModPool(creature, "health", finalDamage * -1, true);
                } else { //Take Full Damage

                    BorCharacter::ModPool(creature, "health", damage * -1, true);
                }
            }            
        }
    }

    static int GetArmorProtection(CreatureObject* creature, ArmorObject* armor, String damageType) {
        if (creature->isPlayerCreature() && armor != nullptr) {
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

    static String GetWeaponDamageString(CreatureObject* attacker, WeaponObject* weapon) {
        if ((weapon->getBonusDamage() > 0) && weapon->isJediWeapon())
            return String::valueOf(weapon->getMinDamage()) + "d" + String::valueOf(weapon->getMaxDamage()) + " + " + String::valueOf(weapon->getBonusDamage()) + " + " + String::valueOf(attacker->getSkillMod("rp_lightsaber"));
        else if ((weapon->getBonusDamage() == 0) && weapon->isJediWeapon())
            return String::valueOf(weapon->getMinDamage()) + "d" + String::valueOf(weapon->getMaxDamage()) + " + " + String::valueOf(attacker->getSkillMod("rp_lightsaber"));
        else if (weapon->getBonusDamage() > 0 && (weapon->isUnarmedWeapon() || weapon->isMeleeWeapon()))
            return String::valueOf(weapon->getMinDamage()) + "d" + String::valueOf(weapon->getMaxDamage()) + " + " + String::valueOf(weapon->getBonusDamage()) + " + " + String::valueOf(attacker->getSkillMod("rp_strength_damage_bonus"));
        else if (weapon->getBonusDamage() == 0 && (weapon->isUnarmedWeapon() || weapon->isMeleeWeapon()))
            return String::valueOf(weapon->getMinDamage()) + "d" + String::valueOf(weapon->getMaxDamage()) + " + " + String::valueOf(attacker->getSkillMod("rp_strength_damage_bonus"));
        else if (weapon->getBonusDamage() > 0 && !(weapon->isUnarmedWeapon() || weapon->isMeleeWeapon()))
            return String::valueOf(weapon->getMinDamage()) + "d" + String::valueOf(weapon->getMaxDamage()) + " + " + String::valueOf(weapon->getBonusDamage());
        else
            return String::valueOf(weapon->getMinDamage()) + "d" + String::valueOf(weapon->getMaxDamage());
    }

    static bool CanPerformReaction(CreatureObject* defender, int reactionType, int incomingDamage, WeaponObject* attackerWeapon, WeaponObject* defenderWeapon) {
        int defenderAction = GetAvailableActionPoints(defender);
        if(reactionType == 0) return false; //Returns false so the catch of "none" will use the same code
        //Defend
        else if(reactionType == 1 && defenderAction > 0 && GetWeaponCondition(defenderWeapon) >= incomingDamage && !defenderWeapon->getDefendIsRestricted()) return true;
        //Parry
        else if(reactionType == 2 && defenderWeapon->isMeleeWeapon() && attackerWeapon->isMeleeWeapon() && defenderAction > 1 && GetWeaponCondition(defenderWeapon) >= incomingDamage && !defenderWeapon->getParryIsRestricted()) return true;
        //Dodge
        else if(reactionType == 3 && defender->isStanding() && defenderAction > 0 && !defenderWeapon->getDodgeIsRestricted()) return true;
        //Special Force
        else if(reactionType == 4 || reactionType == 5 || reactionType == 6 ) {
            int defenderForce = GetAvailableForcePoints(defender);
            if(reactionType == 4) {
                //Deflection Limiter
                int deflectionCount = defender->getStoredInt("deflection_count");
                if(deflectionCount > 3) {
                    return false;
                }
                int lightsaberSkill = defender->getSkillMod("rp_lightsaber");
                int actionCost = 11 - lightsaberSkill;
                if(actionCost <= 0) actionCost = 1;
                if(defenderWeapon->isJediWeapon()) {
                    if(defenderAction >= (actionCost)) {
                        return true;
                    } else return false;
                } else return false;
            } else if(reactionType == 5) {
                int telekineticsSkill = defender->getSkillMod("rp_telekinetics");
                int forceCost = 11 - telekineticsSkill;
                if(forceCost <= 0) forceCost = 1;
                if(defenderForce >= (forceCost)) {
                    return true;
                } else return false;
            } else {
                int inwardSkill = defender->getSkillMod("rp_inward");
                int forcePool = 999;
                if(defender->isPlayerCreature()) {
                    forcePool = defender->getPlayerObject()->getForcePower();
                }
                if(forcePool >= (12 - inwardSkill)) {
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
        if(attacker->isKneeling() && !tooClose) {
            postureModifier -= 2;
        } 
        else if(attacker->isProne() && !tooClose) {
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

        if(demoSkill < skillLevel) {
            int failureRoll = BorDice::Roll(1, 20);
            if(failureRoll + demoSkill < 15) {
                //Blow up in your face!
                radius = radius / 4;
                failedDemoCheck = true;
                centerTarget = attacker;
            }
        } 

        if(!failedDemoCheck) {
            //To hit roll will affect radius. 
            if(toHitRoll + throwSkill <= toHitDC / 4) {
                radius = radius / 8;
            } else if(toHitRoll + throwSkill < toHitDC / 2) {
                radius = radius / 4;
            } else if(toHitRoll + throwSkill < toHitDC) {
                radius = radius / 2;
            }
        }

		SortedVector<QuadTreeEntry*> closeObjects;
		Zone* zone = centerTarget->getZone();

		ManagedReference<CreatureObject*> targetCreature = nullptr;

		if (centerTarget->getCloseObjects() == nullptr) {
			zone->getInRangeObjects(centerTarget->getPositionX(), centerTarget->getPositionY(), radius, &closeObjects, true);
		}
		else {
			CloseObjectsVector* closeVector = (CloseObjectsVector*) centerTarget->getCloseObjects();
			closeVector->safeCopyReceiversTo(closeObjects, CloseObjectsVector::CREOTYPE);
		}

        int targetCount = 0; 

        //Yes I know we do this loop twice, but its to accurately report the target count.
        for (int i = 0; i < targetCount; i++) {
			SceneObject* targetObject = static_cast<SceneObject*>(closeObjects.get(i));
			if (targetObject->isCreatureObject() && centerTarget->isInRange(targetObject, radius)) {
				targetCount++;
			}
		}

        String message = "";

        if(!failedDemoCheck) {
            //Attacker throws a grenade toward Defender (roll + skill = result), which explodes in the vicinity of X targets!
            message = attacker->getFirstName() + " throws a " + grenade->getCustomObjectName().toString() + " toward " + defender->getFirstName();
            message = message + " (" + String::valueOf(toHitRoll) + " + " + String::valueOf(throwSkill) + " = " + String::valueOf(toHitRoll + throwSkill);
            message = message + " vs DC: " + String::valueOf(toHitDC) + ")";
            message = message + ", which explodes in the vicinity of "+String::valueOf(targetCount)+" targets!";
        } else {
            //Attacker attempts to activate the grenade, but it goes off prematurely! The resulting explosion affects X targets!
            message = attacker->getFirstName() + " attempts to activate the " + grenade->getCustomObjectName().toString() + ", but it goes off prematurely! The resulting explosion affects \\#FFFF00" + String::valueOf(targetCount) + "\\#. targets!";
        }

        BorrieRPG::BroadcastMessage(attacker, message);

		for (int i = 0; i < targetCount; i++) {
			SceneObject* targetObject = static_cast<SceneObject*>(closeObjects.get(i));
			if (targetObject->isCreatureObject() && centerTarget->isInRange(targetObject, radius)) {
				targetCreature = cast<CreatureObject*>(targetObject);
				Locker locker(targetCreature, centerTarget);

				//Handle Grenade Reaction.
                HandleGrenadeReaction(targetCreature, grenade, BorCharacter::GetTargetDistance(targetCreature, centerTarget));
			}
		}
    }

    static void HandleGrenadeReaction(CreatureObject* victim, WeaponObject* grenade, float distance) {
        String message = victim->getFirstName() + " is in proximity of the grenade's blast radius!";
        //Distance affects the dodge roll. You either dodge, or you use telekinesis. 
        int maneuverabilitySkill = victim->getSkillMod("rp_maneuverability");
        int telekinesisSkill = victim->getSkillMod("rp_telekinesis");
        bool dodgedSuccessfully = false;

        int totalDamage = GetDamageRoll(grenade->getMaxDamage(), grenade->getMinDamage(), grenade->getBonusDamage());

        int diceCheck = (int)(grenade->getDamageRadius() * distance);

        if(diceCheck > 28)
            diceCheck = 28;

        if(diceCheck < 10)
            diceCheck = 10;

        int dodgeRoll = BorDice::Roll(1, 20);

        if(maneuverabilitySkill >= telekinesisSkill) {
            //Dodge
            message = message + " They hurdle to get out of the way ";
            message = message + "("+String::valueOf(dodgeRoll)+" + "+String::valueOf(maneuverabilitySkill)+" vs DC: "+String::valueOf(diceCheck)+")";
            dodgedSuccessfully = maneuverabilitySkill >= diceCheck;
        } else {
            //Stand Ground with the Force.
            message = message + " They brace themselves keenly ";
            message = message + "("+String::valueOf(dodgeRoll)+" + "+String::valueOf(telekinesisSkill)+" vs DC: "+String::valueOf(diceCheck)+")";
            dodgedSuccessfully = telekinesisSkill >= diceCheck;
        }

        int slot = GetSlotHitlocation(BorDice::Roll(1, 10));
        ApplyAdjustedHealthDamage(victim, grenade, totalDamage, slot);

        if(!dodgedSuccessfully) {
            //Take Damage
            ManagedReference<ArmorObject*> armor = BorCharacter::GetArmorAtSlot(victim, GetSlotName(slot));
            int armorProtection = GetArmorProtection(victim, armor, GetDamageType(grenade));
            int armorSkillFlag = 0;
            if (victim->getSkillMod("rp_strength") < armor->getRpSkillLevel()) {
                armorSkillFlag = 1;
            }
            message = message + ", which fails, the blast focused on their " + GetSlotDisplayName(slot) + ", causing \\#FF9999" + GenerateDamageOutputSpam(totalDamage, GetArmorReducedDamage(totalDamage, armorProtection), armorProtection, armorSkillFlag); 
        } else {
            //Take Minimum Damage. 
            totalDamage = grenade->getMinDamage();
            ManagedReference<ArmorObject*> armor = BorCharacter::GetArmorAtSlot(victim, GetSlotName(slot));
            int armorProtection = GetArmorProtection(victim, armor, GetDamageType(grenade));
            int armorSkillFlag = 0;
            if (victim->getSkillMod("rp_strength") < armor->getRpSkillLevel()) {
                armorSkillFlag = 1;
            }
            message = message + ", successfully avoiding most of the blast, which is focused on their " + GetSlotDisplayName(slot) + ", and taking only \\#FF9999" + GenerateDamageOutputSpam(totalDamage, GetArmorReducedDamage(totalDamage, armorProtection), armorProtection, armorSkillFlag); 
        }

        BorrieRPG::BroadcastMessage(victim, message);
    }
};

#endif /*BORCOMBAT_H_*/