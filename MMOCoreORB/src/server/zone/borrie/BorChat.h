#ifndef BORCHAT_H_
#define BORCHAT_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/managers/creature/CreatureManager.h"
#include "server/zone/packets/chat/ChatSystemMessage.h"
#include "server/zone/packets/chat/ChatRoomMessage.h"

//#include "templates/roleplay/RoleplayManager.h"

#include "server/chat/ChatManager.h"
#include "server/zone/borrie/BorrieRPG.h"
#include "server/chat/room/ChatRoom.h"



class BorChat : public Logger {
public:
    static void RateOutgoingMessage(CreatureObject* target, const UnicodeString& message, uint32 spatialChatType) {
        if(target->isPlayerCreature()) {
            if(target->getPlayerObject()->isAnonymous())
                return;               

            String msg = message.toString();

            if(msg == "()") {
                target->sendSystemMessage("Intentional attempts to abuse the Immersive Experience System are against the rules.");
                return;
            }

            if(msg.contains("(") || msg.contains(")")) 
                return;

            int messageLength = msg.length();
            if(messageLength == 0) 
                return;

            
            int score = 0;
            if(messageLength >= 3 && messageLength < 10) {
                score = 1;
            } else if(messageLength >= 10 && messageLength < 25) {
                score = 2;
            } else if(messageLength >= 25 && messageLength < 50) {
                score = 3;
            } else if(messageLength >= 100 && messageLength < 150) {
                score = 4;
            } else if(messageLength >= 150) {
                score = 5;
            }

            int existingScore = target->getStoredInt("exp_chat_score");
            int finalScore = 0;
            if(existingScore + score >= 50) {
                finalScore = 50;
            } else {
                finalScore = existingScore + score;
            }

            target->setStoredInt("exp_chat_score", finalScore);
            target->setStoredInt("online_exp_ticks", 0);                
        } 
    }

    static void PrintSpatialChatToDMs(CreatureObject* target, const UnicodeString& message) {
        ChatManager* chatManager = target->getZoneServer()->getChatManager();
        ChatRoom* obsvRoom = chatManager->getChatRoomByFullPath("SWG.From Empire's Ashes.Chat.observer");
	    if(obsvRoom != nullptr) {
		    obsvRoom->broadcastMessage(new ChatRoomMessage(target->getFirstName(), target->getZoneServer()->getGalaxyName(), message, obsvRoom->getRoomID()));
	    }	
    }

    static void PrintSpatialChatToDiscord(CreatureObject* target, const UnicodeString& message, String spatialChatType, uint32 moodType, int languageID) {
        ChatManager* chatManager = target->getZoneServer()->getChatManager();
        ChatRoom* obsvRoom = chatManager->getChatRoomByFullPath("SWG.From Empire's Ashes.Chat.global");

        bool anonymous = false;
        if(target->isPlayerCreature()) {
            anonymous = target->getPlayerObject()->isAnonymous();
        }

        String name = target->getFirstName();
        String lastName = target->getLastName();
        if(lastName != "") {
            name += " " + lastName;
        }

        String moodName = chatManager->getMoodType(moodType);

        UnicodeString newMessage = spatialChatType + "|" + message + "|" + moodName + "|" + String::valueOf(languageID);

        if(!anonymous) {
            obsvRoom->broadcastMessage(new ChatRoomMessage(name, target->getZoneServer()->getGalaxyName(), newMessage, obsvRoom->getRoomID(), false));
        }
    }

    static void PrintPlayerCountToDiscord(CreatureObject* target) {
		ChatManager* chatManager = target->getZoneServer()->getChatManager();
        ChatRoom* obsvRoom = chatManager->getChatRoomByFullPath("SWG.From Empire's Ashes.Chat.playercount");
		PlayerMap* playerMap = chatManager->getPlayerMap();
		int playerCount = chatManager->getPlayerCount() - 1;
		
		int dmCount = 0;

		playerMap->resetIterator(false);

		while (playerMap->hasNext(false)) {
			ManagedReference<CreatureObject*> playerObject = playerMap->getNextValue(false);
			ManagedReference<PlayerObject*> ghost = playerObject->getPlayerObject();
			if(ghost->getAdminLevel() > 1) {
				playerCount--;
				if(playerObject->getStoredString("rp_dm_status") != "") {
					dmCount++;
				}
			}
		}

		if(playerCount < 0) playerCount = 0;
        message = String::valueOf(playerCount) + "|" + String::valueOf(dmCount);
        obsvRoom->broadcastMessage(new ChatRoomMessage(name, target->getZoneServer()->getGalaxyName(), newMessage, obsvRoom->getRoomID(), false));
	}

    static void PrintDMMessageToDiscord(CreatureObject* target, const UnicodeString& message) {
        ChatManager* chatManager = target->getZoneServer()->getChatManager();
        ChatRoom* obsvRoom = chatManager->getChatRoomByFullPath("SWG.From Empire's Ashes.Chat.global");

        obsvRoom->broadcastMessage(new ChatRoomMessage("DM " + target->getFirstName(), target->getZoneServer()->getGalaxyName(), "DM|" + message, obsvRoom->getRoomID(), false));
    }
};

#endif /*BORCHAT_H_*/