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
			if(results[2] == "item") then
				--CreatureObject(conversingPlayer):sendSystemMessage(results[3])
				
				local pGhost = CreatureObject(conversingPlayer):getPlayerObject()

				if (pGhost ~= nil) then
					PlayerObject(pGhost):closeSuiWindowType( NEWSNET_INFO )
				end
				local suiManager = LuaSuiManager()
				--local itemName = getItemTemplateName(results[4])
				local itemDescription = getItemTemplateInformation(results[4])

                SceneObject(conversingPlayer):setStoredInt("vendor:itemCost", results[3])
                SceneObject(conversingPlayer):setStoredString("vendor:itemTemplate", results[4])
				SceneObject(conversingPlayer):setStoredString("vendor:itemIsMount", results[5])
				SceneObject(conversingPlayer):setStoredString("vendor:transmog", results[6])
				SceneObject(conversingPlayer):setStoredString("vendor:name", results[7])
				SceneObject(conversingPlayer):setStoredString("vendor:content", results[8])
				
				suiManager:sendMessageBox(conversingPlayer, conversingPlayer, "Merchandise Info", itemDescription, "@confirm", "rpg_tutorial_convo_handler", "notifyPurchaseItem", NEWSNET_INFO)
				
			elseif(results[2] == "category") then
                SceneObject(conversingPlayer):setStoredInt("vendor:category", results[3])
            end
        end
	end

    return nextConversationScreen
end

function rpg_tutorial_convo_handler:notifyPurchaseItem(pPlayer, pSui, eventIndex, arg0) 
    local cancelPressed = (eventIndex == 1)

	if (pPlayer == nil or pSui == nil or cancelPressed) then
		return
	end

    local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end

	local pInventory = SceneObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return
	end

    local template =  SceneObject(pPlayer):getStoredString("vendor:itemTemplate")
    local cost =  SceneObject(pPlayer):getStoredInt("vendor:itemCost")
	local isMount = SceneObject(pPlayer):getStoredString("vendor:itemIsMount")
	local transmog = SceneObject(pPlayer):getStoredString("vendor:transmog")
    local itemName = getItemTemplateName(template)
	local customName = SceneObject(pPlayer):getStoredString("vendor:name")
	local content = SceneObject(pPlayer):getStoredString("vendor:content")

    if (CreatureObject(pPlayer):getCashCredits() < cost) then
		CreatureObject(pPlayer):sendSystemMessage("You do not have enough credits to buy that.")
		return
    elseif (SceneObject(pInventory):isContainerFullRecursive()) then
        CreatureObject(pPlayer):sendSystemMessage("You cannot buy this. Your inventory is full.")
        return
    end
	
	local pItem
	
	if(content == "none") then
		pItem = giveItem(pInventory, template, -1)		
	else 
		pItem = createLootBox(pPlayer, "object/tangible/item/roleplay/loot_box_s01.iff", content, true)
	end
	
	if(pItem == nil) then
		CreatureObject(pPlayer):sendSystemMessage("There was an unknown error trying to sell you this time. You should not have been charged for the purchase.")
		return
	else 
		CreatureObject(pPlayer):subtractCashCredits(cost)
		CreatureObject(pPlayer):sendSystemMessageWithTOAndDI("@rp_vendor:purchase_message", itemName, cost);
	end	

	if(isMount == "mount") then
		SceneObject(pItem):setStoredInt("mount", 1)
	end
			
	if(transmog ~= "none") then
		SceneObject(pItem):setStoredString("transmog_tag", transmog)
	end
		
	if(customName ~= "[][]") then
		SceneObject(pItem):setCustomObjectName(customName)
	end
end

function rpg_tutorial_convo_handler:runScreenHandlers(conversationTemplate, conversingPlayer, conversingNPC, selectedOption, conversationScreen)
    -- Plays the screens of the conversation.
    local player = LuaSceneObject(conversingPlayer)
    local screen = LuaConversationScreen(conversationScreen)
    local screenID = screen:getScreenID()
    local pConvScreen = screen:cloneScreen()
    local clonedConversation = LuaConversationScreen(pConvScreen)


	--CreatureObject(conversingPlayer):sendSystemMessage("Screen: " .. screenID)
	
	
    --Customized Data
    local vendorThemeID = SceneObject(conversingNPC):getStoredString("vendor:theme") --"general" --getQuestStatus(CreatureObject(conversingNPC):getObjectID() .. ":vendorTheme")
    local vendorTheme = RPGVendorThemes:getTheme(vendorThemeID)
    local vendorListID = SceneObject(conversingNPC):getStoredString("vendor:shopList") --"shop_general" --getQuestStatus(CreatureObject(conversingNPC):getObjectID() .. ":vendorList")
    local vendorList = RPGVendorShopLists:getShopList(vendorListID) --rpgVendorShopListDirectory[vendorListID]
	
		


    --Setting the initial greeting based on theme.
    if(screenID == "greeting") then
        clonedConversation:setCustomDialogText(vendorTheme.dialog.greeting)
    elseif(screenID == "abort") then
        clonedConversation:setCustomDialogText(vendorTheme.dialog.abort)
    elseif(screenID == "browse") then
        clonedConversation:setCustomDialogText(vendorTheme.dialog.browse)
    elseif(screenID == "items") then
        clonedConversation:setCustomDialogText(vendorTheme.dialog.items)
    elseif(screenID == "shop") then
        clonedConversation:setCustomDialogText(vendorTheme.dialog.startShopping)
	elseif(screenID == "firstthing") then
        clonedConversation:setCustomDialogText(vendorTheme.dialog.firstthing)
    elseif(screenID == "secondthing") then
        clonedConversation:setCustomDialogText(vendorTheme.dialog.secondthing)
    elseif(screenID == "thirdthing") then
        clonedConversation:setCustomDialogText(vendorTheme.dialog.thirdthing)
	elseif(screenID == "fourththing") then
        clonedConversation:setCustomDialogText(vendorTheme.dialog.fourththing)
    end

    --Displaying the items.
--[[maybe just dump the extra logic?
    if(screenID == "browse") then
        --We want to get all the categories available
        clonedConversation:removeAllOptions()
        for i = 1, #vendorList.manifest, 1 do
			if(vendorList.manifest[i].requiesSaberTraining == true) then
				if(playerHasSaberTraining == true) then
					clonedConversation:addOptionWithData("$vnd:category:" .. i, vendorList.manifest[i].name, "items")
				end
			else 
				clonedConversation:addOptionWithData("$vnd:category:" .. i, vendorList.manifest[i].name, "items")
			end
        end
        clonedConversation:addOption("Nevermind.", "abort")
    elseif(screenID == "items") then
        clonedConversation:setCustomDialogText(vendorTheme.dialog.items)
        clonedConversation:removeAllOptions()
        local selectedCategory = SceneObject(conversingPlayer):getStoredInt("vendor:category")
        for i = 1, #vendorList.manifest[selectedCategory].items, 1 do
            local templateName = vendorList.manifest[selectedCategory].items[i].template
            local objectName = getItemTemplateName(templateName)
            local price = getObjectPrice(templateName)
			local transmog = "none"
			
			if(vendorList.manifest[selectedCategory].items[i].overridePrice == true) then
				price = vendorList.manifest[selectedCategory].items[i].cost
			end
			
			if(vendorList.manifest[selectedCategory].items[i].transmog ~= nil) then
				transmog = vendorList.manifest[selectedCategory].items[i].transmog
			end
			
			local isMount = "nomount"
			if(vendorList.manifest[selectedCategory].items[i].isMount == true) then
				isMount = "mount"
			end
			
			local content = "none"
			if(vendorList.manifest[selectedCategory].items[i].content ~= nil) then
				content = vendorList.manifest[selectedCategory].items[i].content
			end
			
			local trueName = objectName
			local customTrueName = "[][]"
			
			if(objectName ~= "[Invalid Template]") then
				if(vendorList.manifest[selectedCategory].items[i].customName ~= nil and vendorList.manifest[selectedCategory].items[i].customName ~= "") then
					trueName = vendorList.manifest[selectedCategory].items[i].customName
					customTrueName = trueName
				end
			end
			
			clonedConversation:addOptionWithData("$vnd:item:" .. price .. ":" .. templateName .. ":" .. isMount .. ":" .. transmog .. ":" .. customTrueName .. ":" .. content, trueName .. " [" .. price .. " CR]" , "items")
        end
        clonedConversation:addOption("I'd rather look at something else.", "browse")		
    end
--]]

    return pConvScreen
end











--[[This really ought to be good
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
--]]


--[[ Junk attempt
function rpg_tutorial_convo_handler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	return pConvScreen
end
--]]


--[[This should be good
function rpg_tutorial_convo_handler:runScreenHandlers(conversationTemplate, conversingPlayer, conversingNPC, selectedOption, conversationScreen)
	local player = LuaSceneObject(conversingPlayer)
    local screen = LuaConversationScreen(conversationScreen)
    local screenID = screen:getScreenID()
    local pConvScreen = screen:cloneScreen()
    local clonedConversation = LuaConversationScreen(pConvScreen)
	--clonedConversation:removeAllOptions()
--]]





--[[Borrie convo data
	local vendorThemeID = SceneObject(conversingNPC):getStoredString("vendor:theme") --"general" --getQuestStatus(CreatureObject(conversingNPC):getObjectID() .. ":vendorTheme")
    local vendorTheme = RPGVendorThemes:getTheme(vendorThemeID)


    if(screenID == "greeting") then
        clonedConversation:setCustomDialogText(vendorTheme.dialog.greeting)
    elseif(screenID == "abort") then
        clonedConversation:setCustomDialogText(vendorTheme.dialog.abort)
    elseif(screenID == "browse") then
        clonedConversation:setCustomDialogText(vendorTheme.dialog.browse)
    elseif(screenID == "items") then
        clonedConversation:setCustomDialogText(vendorTheme.dialog.items)
    elseif(screenID == "shop") then
        clonedConversation:setCustomDialogText(vendorTheme.dialog.startShopping)
    end


	
        
        clonedConversation:addOption("I'd rather look at something else.", "browse")		
    end

	return pConvScreen
end
--]]









	--[[   AEI Attempt
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
--]]