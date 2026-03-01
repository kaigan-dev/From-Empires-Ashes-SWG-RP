rpg_tutorial_convo_handler = Object:new {}


--[[
function rpg_tutorial_convo_handler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	return convoTemplate:getScreen("greeting")
end
--]]

function rpg_tutorial_convo_handler:getNextConversationScreen(conversationTemplate, conversingPlayer, selectedOption)
	local creature = LuaCreatureObject(conversingPlayer)
	local convosession = creature:getConversationSession()
	local lastConversationScreen = nill
	local conversation = LuaConversationTemplate(conversationTempate)


	if (conversation ~= nil ) then
		if (convosession ~= nil) then
			local session = LuaConversationSession(convosession)
			if (session ~= nil) then
				lastConversationScreen = session:getLastConversationScreen()
			end
		end
		if (lastConversationScreen == nil ) then
			nextConversationScreen = conversation:getScreen("greeting")
		else
			local luaLastConversationScreen = LuaConversationScreen(lastConversationScreen)
			local optionLink = luaLastConversationScreen:getOptionLink(selectedOption)
			nextConversationScreen = conversation:getScreen(optionLink)
		end
	end	

return nextConversationScreen
end

--[[
function rpg_tutorial_convo_handler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	return pConvScreen
end
--]]


function rpg_tutorial_convo_handler:runScreenHandlers(conversationTemplate, conversingPlayer, conversingNPC, selectedOption, conversationScreen)
	local player = LuaSceneObject(conversingPlayer)
    local screen = LuaConversationScreen(conversationScreen)
    local screenID = screen:getScreenID()
    local pConvScreen = screen:cloneScreen()
    local clonedConversation = LuaConversationScreen(pConvScreen)
	clonedConversation:removeAllOptions()

if(ScreenID == "greeting") then
		clonedConversation:setCustomDialogText("Welcome to FEA. There are a few steps you'll want to take in order to create a character.")
		clonedConversation:addOption("What should I do first? (Attributes)", "firstthing")
		clonedConversation:addOption("And after that? (Skills)", "secondthing")
		clonedConversation:addOption("I'm feeling a bit underprepared still. (Equipment)", "thirdthing")
		clonedConversation:addOption("What else needs to be done to finish up? (Resting)", "thirdthing")
		clonedConversation:addOption("I don't need to hear any more.", " abort")
		elseif (ScreenID == "firstthing") then
			clonedConversation:setCustomDialogText("The first thing to do is allocate your attributes. These serve as soft maximums for your skills, in addition to providing direct benefits such as increasing your health. If the window for training isn't already open, enter /train.")
			clonedConversation:addOption("And after that? (Skills)", "secondthing")
			clonedConversation:addOption("I don't need to hear any more.", " abort")
		elseif (ScreenID == "secondthing") then
			clonedConversation:setCustomDialogText("Next you should allocate skills. This is also done from the /train menu. I would not recommend raising any skills above their parent attribute right now, as it will cost significantly more experience.")
			clonedConversation:addOption("I'm feeling a bit underprepared still. (Equipment)", "thirdthing")
			clonedConversation:addOption("I don't need to hear any more.", " abort")
		elseif (ScreenID == "thirdthing") then
		clonedConversation:setCustomDialogText("When you leave this room, step across the hall to speak to the vendors there. Many of their offers will be too expensive for your starting budget. Marauder armor is quite affordable if you want it, and some cheap weapons and stims are also available. Additionally, clothes are freely available upstairs.")
			clonedConversation:addOption("What else needs to be done to finish up? (Resting)", "thirdthing")
			clonedConversation:addOption("I don't need to hear any more.", " abort")
		elseif (ScreenID == "fourththing") then
			clonedConversation:setCustomDialogText("Finally, take a moment to rest and recover before stepping out into the world. Use the /rest command to do fill your health, action, and will pools.")
			clonedConversation:addOption("Thanks! I'll get started right away.", " abort")
		end

	return pConvScreen
end



--[[
	local rpg_tutorial_convo_handler = ConvoScreen:new {
		id="greeting",
		customDialogText = "Welcome to FEA. There are a few steps you'll want to take in order to create a character.",
		stopConversation="false",
		options = {
			{"What should I do first?", "firstthing"},
			{"And after that?", "secondthing"},
			{"What else needs to be done to finish up?", "thirdthing"},
		}
	}
	rpg_tutorial_convo_handler:addScreen(greeting);

	local firstthing = ConvoScreen:new {
		id="firstthing",
		CustomDialogText = "The first thing to do is allocate your attributes. These serve as soft maximums for your skills, in addition to providing direct benefits such as increasing your health. If the window for training isn't already open, enter /train.",
		stopConversation="false",
		options = {
			{"And after that?", "secondthing"},
			{"I don't need to hear any more.", " abort"},
		}
	}
	rpg_tutorial_convo_handler:addScreen(firstthing);


	local secondthing = ConvoScreen:new {
		id="secondthing",
		CustomDialogText = "Next you should allocate skills. This is also done from the /train menu. I would not recommend raising any skills above their parent attribute right now, as it will cost significantly more experience.",
		stopConversation="false",
		options = {
			{"I'm feeling a bit underprepared still.", "thirdthing"},
			{"I don't need to hear any more.", " abort"},
		}
	}
	rpg_tutorial_convo_handler:addScreen(secondthing);



	local thirdthing = ConvoScreen:new {
		id="thirdthing",
		CustomDialogText = "When you leave this room, step across the hall to speak to the vendors there. Many of their offers will be too expensive for your starting budget. Marauder armor is quite affordable if you want it, and some cheap weapons and stims are also available. Additionally, clothes are freely available upstairs.",
		stopConversation="false",
		options = {
			{"What else needs to be done in order to be prepared?", "fourththing"},
			{"I don't need to hear any more.", " abort"},
		}
	}
	rpg_tutorial_convo_handler:addScreen(thirdthing);


	local thirdthing = ConvoScreen:new {
		id="fourththing",
		CustomDialogText = "Finally, take a moment to rest and recover before stepping out into the world. Use the /rest command to do fill your health, action, and will pools.",
		stopConversation="false",
		options = {
			{"Can you explain some of that again?", "greeting"},
			{"Thanks! I'll get started right away.", " abort"},
		}
	}
	rpg_tutorial_convo_handler:addScreen(thirdthing);


	local  abort = ConvoScreen:new {
		id = " abort",
		customDialogText = "Farewell, traveller",
		stopConversation = "true",
		options = {}
	}
	rpg_tutorial_convo_handler:addScreen( abort);
--]]
