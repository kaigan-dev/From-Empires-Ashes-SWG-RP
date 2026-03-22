#ifndef FORCESENSITIVEPROMPTSUICALLBACK_H_
#define FORCESENSITIVEPROMPTSUICALLBACK_H_

#include "server/zone/objects/player/sui/SuiCallback.h"
#include "server/zone/objects/player/sui/transferbox/SuiTransferBox.h"
#include "server/zone/packets/player/PlayMusicMessage.h"
#include "server/zone/managers/skill/SkillManager.h"

class ForceSensitivePromptSuiCallback : public SuiCallback {

public:
	ForceSensitivePromptSuiCallback(ZoneServer* server) : SuiCallback(server) {

	}

	void run(CreatureObject* player, SuiBox* suiBox, uint32 eventIndex, Vector<UnicodeString>* args) {
		bool cancelPressed = (eventIndex == 1);

		PlayerManager* playerManager = player->getZoneServer()->getPlayerManager();

		if (playerManager == nullptr)
			return;

		if (args->size() < 1)
			return;

        if(cancelPressed) {
            player->sendSystemMessage("Destiny can be a difficult thing to consider. There is truly no wrong answer. You will be asked again the next time you log in until your choice is made.");
            return;
        }
            

		int index = Integer::valueOf(args->get(0).toString());

        //If they said yes, give them FS box 

        if(index == 0) {
            SkillManager* skillManager = SkillManager::instance();
            ManagedReference<PlayerObject*> targetGhost = player->getPlayerObject();
                if(targetGhost != nullptr)
                    targetGhost->setJediState(1);
                else 
                    return;

            skillManager->awardSkill("rp_force_prog_novice", player, true, true, true, 1);
            String message = "";
            message = "You will find that there is more to the galaxy than what you can see with your eyes. ";
            message += "Walking such paths is both rewarding and dangerous. Tread carefully.";
		    PlayMusicMessage* musicMessage = new PlayMusicMessage("sound/music_short_lightside.snd");
		    player->sendMessage(musicMessage);
            player->sendSystemMessage(message);
            player->setStoredInt("fs_chosen", 1);
            playerManager->awardExperience(playerCreature, "rp_frc_skill_cap", 35);
        } else {
            String message = "Some consider insensitivity to the Force to be a blessing. ";
            message += "Unburdened by knowledge of the unseen, may your skills and judgement take you where you want to go.";
            PlayMusicMessage* musicMessage = new PlayMusicMessage("sound/mus_quest_theme_docking.snd");
		    player->sendMessage(musicMessage);
            player->sendSystemMessage(message);
            player->setStoredInt("fs_chosen", 1);
        }
	}	

};

#endif /* FORCESENSITIVEPROMPTSUICALLBACK_H_ */