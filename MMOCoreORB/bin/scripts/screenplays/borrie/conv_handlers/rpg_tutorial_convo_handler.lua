rpg_tutorial_convo_handler = Object:new {
}
function rpg_tutorial_convo_handler:getNextConversationScreen(conversationTemplate, conversingPlayer, selectedOption)
    -- Assign the player to variable creature for use inside this function.
    local creature = LuaCreatureObject(conversingPlayer)
    -- Get the last conversation to determine whetehr or not we're  on the first screen
    local convosession = creature:getConversationSession()
    lastConversation = nil
    local conversation = LuaConversationTemplate(conversationTemplate)

    

    -- If there is a conversation open, do stuff with it
    if ( conversation ~= nil ) then
    -- check to see if we have a next screen
        if ( convosession ~= nil ) then
            local session = LuaConversationSession(convosession)
            if ( session ~= nil ) then
                lastConversationScreen = session:getLastConversationScreen()
            end
        end
        -- Last conversation was nil, so get the first screen
        if ( lastConversationScreen == nil ) then
            nextConversationScreen = conversation:getScreen("greeting")
        else
            -- Start playing the rest of the conversation based on user input
            local luaLastConversationScreen = LuaConversationScreen(lastConversationScreen)
            -- Set variable to track what option the player picked and get the option picked
            local optionLink = luaLastConversationScreen:getOptionLink(selectedOption)
            nextConversationScreen = conversation:getScreen(optionLink)
        end
    end
-- end of the conversation logic.
	if ( lastConversationScreen ~= nil ) then
		local luaLastConversationScreen = LuaConversationScreen(lastConversationScreen)
		local optionData = luaLastConversationScreen:getOptionData(selectedOption)
        if(string.find(optionData, "$vnd")) then
			local results = HelperFuncs:splitString(optionData, ":")
        end
	end

    return nextConversationScreen
end


function rpg_tutorial_convo_handler:runScreenHandlers(conversationTemplate, conversingPlayer, conversingNPC, selectedOption, conversationScreen)
    -- Plays the screens of the conversation.
    local player = LuaSceneObject(conversingPlayer)
    local screen = LuaConversationScreen(conversationScreen)
    local screenID = screen:getScreenID()
    local pConvScreen = screen:cloneScreen()
    local clonedConversation = LuaConversationScreen(pConvScreen)

    --Setting the initial greeting based on theme.
    if(screenID == "greeting") then
        clonedConversation:setCustomDialogText("Welcome to FEA! There are a few steps you'll want to take in order to create a character.")
    elseif(screenID == "abort") then
        clonedConversation:setCustomDialogText("Farewell, traveller.")
	elseif(screenID == "firstthing") then
        clonedConversation:setCustomDialogText("The first thing to do is allocate your attributes. These serve as soft maximums for your skills, in addition to providing direct benefits such as increasing your health. If the window for training isn't already open, enter /train.")
    elseif(screenID == "secondthing") then
        clonedConversation:setCustomDialogText("Next you should allocate skills. This is also done from the /train menu. I would not recommend raising any skills above their parent attribute right now, as it will cost significantly more experience.")
    elseif(screenID == "thirdthing") then
        clonedConversation:setCustomDialogText("When you leave this room, step across the hall to speak to the vendors there. Many of their offers will be too expensive for your starting budget. Marauder armor is quite affordable if you want it, and some cheap weapons and stims are also available. Additionally, clothes are freely available upstairs.")
	elseif(screenID == "fourththing") then
        clonedConversation:setCustomDialogText("Finally, take a moment to rest and recover before stepping out into the world. Use the /rest command to do fill your health, action, and will pools.")
	end


    return pConvScreen
end