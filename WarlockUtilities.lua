WU = LibStub("AceAddon-3.0"):NewAddon("WarlockUtilities", "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0", "AceHook-3.0", "AceComm-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("WarlockUtilities", true)

--set options
local options = {
	name = L["WU"],
	handler = WU,
	type = "group",
	args = {
		desc = {
			type = "description",
			name = L["Options_Desc_Name"],
			order = 100
		},
		shards = {
			type = "execute",
			name = L["ShardManager"],
			desc = L["ShardManager"],
			func = "ToggleShardManager",
			guiHidden = true
		},
		shard = {
			type = "execute",
			name = L["ShardManager"],
			desc = L["ShardManager"],
			func = "ToggleShardManager",
			guiHidden = true
		},
		stones = {
			type = "execute",
			name = L["StoneManager"],
			desc = L["StoneManager"],
			func = "ToggleStoneManager",
			guiHidden = true
		},
		stone = {
			type = "execute",
			name = L["StoneManager"],
			desc = L["StoneManager"],
			func = "ToggleStoneManager",
			guiHidden = true
		},
		demons = {
			type = "execute",
			name = L["DemonManager"],
			desc = L["DemonManager"],
			func = "ToggleDemonManager",
			guiHidden = true
		},
		demon = {
			type = "execute",
			name = L["DemonManager"],
			desc = L["DemonManager"],
			func = "ToggleDemonManager",
			guiHidden = true
		},
		help = {
			type = "execute",
			name = L["Option_Help_Name"],
			desc = L["Option_Help_Desc"],
			func = "ExecuteHelp",
			guiHidden = true,
		},
		config = {
			type = "execute",
			name = L["Option_Config_Name"],
			desc = L["Option_Config_Desc"],
			func = "ExecuteConfig",
			guiHidden = true,
		}
	}
}

local optionsShardManager = {
	name = L["ShardManager"],
	handler = WU,
	type = "group",
	args = {
		desc = {
			type = "description",
			name = L["ShardManager_Desc_Name"],
			order = 100
		},
		type = {
			type = "select",
			name = L["ShardManager_OptionGroup_Type_Name"],
			desc = L["ShardManager_OptionGroup_Type_Desc"],
			values = {bag=L["ShardManager_Option_TypeByBag"], number=L["ShardManager_Option_TypeByNumber"]},
			get = "GetOptionShardType",
			set = "SetOptionShardType",
			style = "radio",
			order = 200
		}
	}
}

local optionsStoneManager = {
	name = L["StoneManager"],
	handler = WU,
	type = "group",
	args = {
		desc = {
			type = "description",
			name = L["StoneManager_Desc_Name"],
			order = 100
		},
		trade = {
			type = "group",
			name = L["StoneManager_OptionGroup_Trading_Name"],
			desc = L["StoneManager_OptionGroup_Trading_Desc"],
			order = 200,
			inline = true,
			args = {
				enableParty = {
					type = "toggle",
					name = L["StoneManager_Option_EnableParty_Name"],
					desc = L["StoneManager_Option_EnableParty_Desc"],
					get = "StoneManager_GetTradingParty",
					set = "StoneManager_SetTradingParty",
					order = 210,
					width = "full"
				},
				enableRaid = {
					type = "toggle",
					name = L["StoneManager_Option_EnableRaid_Name"],
					desc = L["StoneManager_Option_EnableRaid_Desc"],
					get = "StoneManager_GetTradingRaid",
					set = "StoneManager_SetTradingRaid",
					order = 220,
					width = "full"
				}
			}
		}
	}
}

local optionsDemonManager = {
	name = L["DemonManager"],
	handler = WU,
	type = "group",
	args = {
		desc = {
			type = "description",
			name = L["DemonManager_Desc_Name"],
			order = 100
		}
	}
}

--set default options
local defaults = {
	profile = {
		ShardManager_Type = "bag",
		ShardManager_Bags = {true, true, true, true, true},
		ShardManager_Number = 0,
		StoneManager_Type = "hs",
		StoneManager_HSLevel = 5,
		StoneManager_SSLevel = 5,
		StoneManager_TradingRaid = true,
		StoneManager_TradingParty = true,
		DemonManager_DemonLevel = 1
	}
}

local hsLookup = {
	"6201", --Create Healthstone (Minor)
	"6202", --Create Healthstone (Lesser)
	"5699", --Create Healthstone
	"11729", --Create Healthstone (Greater)
	"11730" --Create Healthstone (Major)
}

local hsItemLookup = {
	"Minor Healthstone",
	"Lesser Healthstone",
	"Healthstone",
	"Greater Healthstone",
	"Major Healthstone"
}

local ssLookup = {
	"693", --Create Soulstone (Minor)
	"20752", --Create Soulstone (Lesser)
	"20755", --Create Soulstone
	"20756", --Create Soulstone (Greater)
	"20757" --Create Soulstone (Major)
}

local ssItemLookup = {
	"Minor Soulstone",
	"Lesser Soulstone",
	"Soulstone",
	"Greater Soulstone",
	"Major Soulstone"
}

local demonLookup = {
	"688", --Summon Imp
	"697", --Summon Voidwalker
	"712", --Summon Succubus
	"691", --Summon Felhunter
	"1122", --Inferno
	"18540", --Ritual of Doom
	"11725" --Ensalve Demon (Rank 3)
}

local demonNameLookup = {
	"Imp",
	"Voidwalker",
	"Succubus",
	"Felhunter",
	"Infernal",
	"Doomguard",
	"Enslave Demon"
}

local autoTrading = False

function WU:OnEnable()
	--Enabled message
	self:Print(L["AddonEnabled"](GetAddOnMetadata("WarlockUtilities", "Version"), GetAddOnMetadata("WarlockUtilities", "Author")))
end

function WU:OnDisable()
	--Disabled message
	self:Print(L["AddonDisabled"])
end

function WU:OnInitialize()
	--Only load if player class is Warlock
	local className, classFilename, classID = UnitClass("player")
	if (classFilename == "WARLOCK") then

		--Chat commands
		self:RegisterChatCommand("wu", "ChatCommand")
		self:RegisterChatCommand("warlockutils", "ChatCommand")
		self:RegisterChatCommand("warlockutilities", "ChatCommand")

		--Events
		self:RegisterEvent("TRADE_SHOW", "TradeOpened")
		self:RegisterEvent("TRADE_CLOSED", "TradeClosed")

		--Options DB
		self.db = LibStub("AceDB-3.0"):New("WarlockUtilitiesOptionsDB", defaults, true)
		self.db.RegisterCallback(self, "OnNewProfile", "RefreshConfig")
		self.db.RegisterCallback(self, "OnProfileChanged", "RefreshConfig")
		self.db.RegisterCallback(self, "OnProfileCopied", "RefreshConfig")
		self.db.RegisterCallback(self, "OnProfileReset", "RefreshConfig")

		--Profile
		local optionsProfile = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
		LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable(L["WU"] .. "-Profiles", optionsProfile)
		LibStub("AceConfigDialog-3.0"):AddToBlizOptions(L["WU"]  .."-Profiles", "Profiles", L["WU"])

		--Options frames
		LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable(L["WU"], options)
		self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(L["WU"], L["WU"])

		LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable(L["WU"] .. "-ShardManager", optionsShardManager)
		LibStub("AceConfigDialog-3.0"):AddToBlizOptions(L["WU"] .. "-ShardManager", L["ShardManager"], L["WU"])

		LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable(L["WU"] .. "-StoneManager", optionsStoneManager)
		LibStub("AceConfigDialog-3.0"):AddToBlizOptions(L["WU"] .. "-StoneManager", L["StoneManager"], L["WU"])

		LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable(L["WU"] .. "-DemonManager", optionsDemonManager)
		LibStub("AceConfigDialog-3.0"):AddToBlizOptions(L["WU"] .. "-DemonManager", L["DemonManager"], L["WU"])

		--XML
		ShowUIPanel(WU_AppTray, 1)
		xmlText = {
			{WU_ShardManager_Header, L["ShardManager_FrameHeader"](GetAddOnMetadata("WarlockUtilities", "Version"))},
			{WU_ShardManager_Bag1, L["Bag"](1)},
			{WU_ShardManager_Bag2, L["Bag"](2)},
			{WU_ShardManager_Bag3, L["Bag"](3)},
			{WU_ShardManager_Bag4, L["Bag"](4)},
			{WU_ShardManager_Bag5, L["Bag"](5)},
			{WU_ShardManager_Close, L["Close"]},
			{WU_StoneManager_Header, L["StoneManager_FrameHeader"](GetAddOnMetadata("WarlockUtilities", "Version"))},
			{WU_StoneManager_TradeHealthstoneTextName, L["Trade"]},
			{WU_StoneManager_UseSoulstoneTextName, L["Use"]},
			{WU_StoneManager_Close, L["Close"]},
			{WU_DemonManager_Header, L["DemonManager_FrameHeader"](GetAddOnMetadata("WarlockUtilities", "Version"))},
			{WU_DemonManager_Sacrifice, L["Sacrifice"]},
			{WU_DemonManager_Dismiss, L["Dismiss"]},
			{WU_DemonManager_Heal, L["Heal"]},
			{WU_DemonManager_Close, L["Close"]}
		}
		for i,v in ipairs(xmlText) do
			xmlText[i][1]:SetText(xmlText[i][2])
		end

	end

end

--Ace3 Comm
function WU:OnCommReceived(prefix, message, distribution, sender)

end

function WU:ChatCommand(input)
	if not input or input:trim() == "" then
		self:ExecuteHelp()
	else
		LibStub("AceConfigCmd-3.0"):HandleCommand("wu", "WarlockUtilities", input)
	end
end

function WU:TradeOpened()
	if not autoTrading then
		if (UnitInParty("NPC") and self.db.profile.StoneManager_TradingParty) or (UnitInRaid("NPC") and self.db.profile.StoneManager_TradingRaid) then
			autoTrading = true
		end
	end
	if autoTrading then
		local loc = WU:GetInventorySlotLocation(hsItemLookup[self.db.profile.StoneManager_HSLevel])
		if not ((loc.bag == nil) and (loc.slot == nil)) then
			if TradeFrame:IsShown() then
				ClearCursor()
				PickupContainerItem(loc.bag, loc.slot)
				tradePos=TradeFrame_GetAvailableSlot()
				if tradePos==nil then
					return
				end
				ClickTradeButton(tradePos)
			end
		else
			print(L["MissingTradeItem"](hsItemLookup[self.db.profile.StoneManager_HSLevel]))
		end
	end
end

function WU:TradeClosed()
	autoTrading = false
end

function WU:GetOptionShardType()
	return self.db.profile.ShardManager_Type
end

function WU:SetOptionShardType(info, value)
	if (value) then
		self.db.profile.ShardManager_Type = value
	end
end

function WU:ToggleShardManager()
	if not InCombatLockdown() then
		if WU_ShardManager:IsVisible() then
			WU:ShardManager_StopTimer()
			WU_ShardManager:Hide()
		else
			WU:ShardManager_RefreshUI()
			WU:ShardManager_StartTimer()
			ShowUIPanel(WU_ShardManager, 1)
		end
	else
		print(L["CombatLockdown"])
	end
end

function WU:ShardManager_ToggleType()
	if (self.db.profile.ShardManager_Type == "bag") then
		self.db.profile.ShardManager_Type = "number"
	else
		self.db.profile.ShardManager_Type = "bag"
	end
	WU:ShardManager_RefreshUI()
end

function WU:ShardManager_StartTimer()
	self.ShardManager_Timer = self:ScheduleRepeatingTimer("ShardManager_RefreshUI", 1)
end

function WU:ShardManager_StopTimer()
	self:CancelTimer(self.ShardManager_Timer)
end

function WU:ShardManager_GetBagEnabled(bag)
	return self.db.profile.ShardManager_Bags[bag]
end

function WU:ShardManager_SetBagEnabled(bag, value)
	self.db.profile.ShardManager_Bags[bag] = value
	WU:ShardManager_RefreshUI()
end

function WU:ShardManager_GetShardNumber()
	return self.db.profile.ShardManager_Number
end

function WU:ShardManager_SetShardNumber(value)
	if (value < 0) then
		self.db.profile.ShardManager_Number = 0
	else
		self.db.profile.ShardManager_Number = value
	end
	WU:ShardManager_RefreshUI()
end

function WU:ShardManager_DecrementShardNumber()
	self.db.profile.ShardManager_Number = self.db.profile.ShardManager_Number - 1
	if (self.db.profile.ShardManager_Number < 0) then
		self.db.profile.ShardManager_Number = 0
	end
	WU:ShardManager_RefreshUI()
end

function WU:ShardManager_IncrementShardNumber()
	self.db.profile.ShardManager_Number = self.db.profile.ShardManager_Number + 1
	WU:ShardManager_RefreshUI()
end

function WU:ShardManager_DeleteShards()
	if (self.db.profile.ShardManager_Type == "bag") then
		for i,v in ipairs(self.db.profile.ShardManager_Bags) do
			if v then
				for s=1,GetContainerNumSlots(i-1) do
					n = GetContainerItemLink(i-1, s)
					if n and string.find(n, "Soul Shard") then
						PickupContainerItem(i-1, s)
						DeleteCursorItem()
					end
				end
			end
		end
	else
		cleared = 0
		for b=0,4 do
			for s=1,GetContainerNumSlots(b) do
				n = GetContainerItemLink(b, s)
				if n and string.find(n, "Soul Shard") then
					if cleared < self.db.profile.ShardManager_Number then
						PickupContainerItem(b, s)
						DeleteCursorItem()
						cleared = cleared + 1
					end
				end
			end
		end
	end
end

function WU:ShardManager_RefreshUI()
	shardCount = 
	WU_ShardManager_TotalShardCount:SetText(L["TotalShards"](WU:GetInventoryItemCount("Soul Shard")))
	if (self.db.profile.ShardManager_Type == "bag") then
		WU_ShardManager_Toggle_Type:SetText(L["ByBag"])
		WU_ShardManager_Number:Hide()
		ShowUIPanel(WU_ShardManager_Bags, 1)
		clearCount = 0
		for i,v in ipairs(self.db.profile.ShardManager_Bags) do
			_G["WU_ShardManager_Bag" .. i .. "Text"]:SetText(L["Bag"](i) .. " (" .. WU:GetBagItemCount("Soul Shard", i-1) ..")")
			_G["WU_ShardManager_Bag" .. i]:SetChecked(v)
			if v then
				clearCount = clearCount + WU:GetBagItemCount("Soul Shard", i-1)
			end
		end
		WU_ShardManager_DeleteShardCount:SetText(L["ShardsToClear"](clearCount))
	else
		WU_ShardManager_Toggle_Type:SetText(L["ByNumber"])
		WU_ShardManager_Bags:Hide()
		ShowUIPanel(WU_ShardManager_Number, 1)
		if not (WU_ShardManager_NumberInput:HasFocus()) then
			WU_ShardManager_NumberInput:SetText(self.db.profile.ShardManager_Number)
		end
		WU_ShardManager_DeleteShardCount:SetText(L["ShardsToClear"](self.db.profile.ShardManager_Number))
	end
end

function WU:ToggleStoneManager()
	if not InCombatLockdown() then
		if WU_StoneManager:IsVisible() then
			WU:StoneManager_StopTimer()
			WU_StoneManager:Hide()
		else
			WU:StoneManager_RefreshUI()
			WU:StoneManager_StartTimer()
			ShowUIPanel(WU_StoneManager, 1)
		end
	else
		print(L["CombatLockdown"])
	end
end

function WU:StoneManager_ToggleType()
	if (self.db.profile.StoneManager_Type == "hs") then
		self.db.profile.StoneManager_Type = "ss"
	else
		self.db.profile.StoneManager_Type = "hs"
	end
	WU:StoneManager_RefreshUI()
end

function WU:StoneManager_GetTradingParty(info)
	return self.db.profile.StoneManager_TradingParty
end

function WU:StoneManager_SetTradingParty(info, value)
	self.db.profile.StoneManager_TradingParty = value
	print(L["StoneManager_SetOption_TradingParty"](value))
end

function WU:StoneManager_GetTradingRaid(info)
	return self.db.profile.StoneManager_TradingRaid
end

function WU:StoneManager_SetTradingRaid(info, value)
	self.db.profile.StoneManager_TradingRaid = value
	print(L["StoneManager_SetOption_TradingRaid"](value))
end

function WU:StoneManager_StartTimer()
	self.StoneManager_Timer = self:ScheduleRepeatingTimer("StoneManager_RefreshUI", 1)
end

function WU:StoneManager_StopTimer()
	self:CancelTimer(self.StoneManager_Timer)
end

function WU:StoneManager_CreateHealthstone(source, button)
	if not InCombatLockdown() then
		source:SetAttribute("type", "spell")
		source:SetAttribute("spell", hsLookup[self.db.profile.StoneManager_HSLevel])
	else
		print(L["CombatLockdown"])
	end
end

function WU:StoneManager_DecrementHSRank()
	self.db.profile.StoneManager_HSLevel = self.db.profile.StoneManager_HSLevel - 1
	if self.db.profile.StoneManager_HSLevel < 1 then
		self.db.profile.StoneManager_HSLevel = 1
	end
	WU:StoneManager_RefreshUI()
end

function WU:StoneManager_IncrementHSRank()
	self.db.profile.StoneManager_HSLevel = self.db.profile.StoneManager_HSLevel + 1
	if self.db.profile.StoneManager_HSLevel > 5 then
		self.db.profile.StoneManager_HSLevel = 5
	end
	WU:StoneManager_RefreshUI()
end

function WU:StoneManager_CreateSoulstone(source, button)
	if not InCombatLockdown() then
		source:SetAttribute("type", "spell")
		source:SetAttribute("spell", ssLookup[self.db.profile.StoneManager_SSLevel])
	else
		print(L["Lockdown"])
	end
end

function WU:StoneManager_DecrementSSRank()
	self.db.profile.StoneManager_SSLevel = self.db.profile.StoneManager_SSLevel - 1
	if self.db.profile.StoneManager_SSLevel < 1 then
		self.db.profile.StoneManager_SSLevel = 1
	end
	WU:StoneManager_RefreshUI()
end

function WU:StoneManager_IncrementSSRank()
	self.db.profile.StoneManager_SSLevel = self.db.profile.StoneManager_SSLevel + 1
	if self.db.profile.StoneManager_SSLevel > 5 then
		self.db.profile.StoneManager_SSLevel = 5
	end
	WU:StoneManager_RefreshUI()
end

function WU:StoneManager_CheckBagsForHSLevel()
	local loc = WU:GetInventorySlotLocation(hsItemLookup[self.db.profile.StoneManager_HSLevel])
	if (loc.bag == nil) and (loc.slot == nil) then
		return false
	else
		return true
	end
end

function WU:StoneManager_TradeHealthstone(source, button)
	if TradeFrame:IsShown() then
		autoTrading = false
		AcceptTrade()
	elseif UnitExists("target") then
		autoTrading = true
		InitiateTrade("target")
	end
end

function WU:StoneManager_UseSoulstone(source, button)
	local loc = WU:GetInventorySlotLocation(ssItemLookup[self.db.profile.StoneManager_SSLevel])
	if not ((loc.bag == nil) and (loc.slot == nil)) then
		source:SetAttribute("type", "item")
		source:SetAttribute("item", loc.bag .. " " .. loc.slot)
		if UnitExists("target") then
			source:SetAttribute("unit", "target")
		else
			source:SetAttribute("unit", "player")
		end
	end
end

function WU:StoneManager_CheckBagsForSSLevel()
	local loc = WU:GetInventorySlotLocation(ssItemLookup[self.db.profile.StoneManager_SSLevel])
	if (loc.bag == nil) and (loc.slot == nil) then
		return false
	else
		return true
	end
end

function WU:StoneManager_RefreshUI()
	WU_StoneManager_CreateHealthstoneTextName:SetText(L["CreateHealthstone"](self.db.profile.StoneManager_HSLevel))
	WU_StoneManager_CreateHealthstone:SetEnabled(not WU:StoneManager_CheckBagsForHSLevel(self.db.profile.StoneManager_HSLevel))
	WU_StoneManager_CreateSoulstoneTextName:SetText(L["CreateSoulstone"](self.db.profile.StoneManager_SSLevel))
	WU_StoneManager_CreateSoulstone:SetEnabled(not WU:StoneManager_CheckBagsForSSLevel(self.db.profile.StoneManager_SSLevel))
	WU_StoneManager_HSRankIncrement:SetEnabled(not (self.db.profile.StoneManager_HSLevel >= 5))
	WU_StoneManager_SSRankIncrement:SetEnabled(not (self.db.profile.StoneManager_SSLevel >= 5))
	WU_StoneManager_HSRankDecrement:SetEnabled(not (self.db.profile.StoneManager_HSLevel <= 1))
	WU_StoneManager_SSRankDecrement:SetEnabled(not (self.db.profile.StoneManager_SSLevel <= 1))
	WU_StoneManager_TradeHealthstone:SetEnabled(WU:StoneManager_CheckBagsForHSLevel(self.db.profile.StoneManager_HSLevel))
	WU_StoneManager_UseSoulstone:SetEnabled(WU:StoneManager_CheckBagsForSSLevel(self.db.profile.StoneManager_SSLevel))
	if (self.db.profile.StoneManager_Type == "hs") then
		WU_StoneManager_Healthstone:Show()
		WU_StoneManager_Soulstone:Hide()
		WU_StoneManager_PanelToggle:SetText(L["Healthstone"])
	else
		WU_StoneManager_PanelToggle:SetText(L["Soulstone"])
		WU_StoneManager_Healthstone:Hide()
		WU_StoneManager_Soulstone:Show()
	end
end

function WU:ToggleDemonManager()
	if not InCombatLockdown() then
		if WU_DemonManager:IsVisible() then
			WU:DemonManager_StopTimer()
			WU_DemonManager:Hide()
		else
			WU:DemonManager_RefreshUI()
			WU:DemonManager_StartTimer()
			ShowUIPanel(WU_DemonManager, 1)
		end
	else
		print(L["CombatLockdown"])
	end
end

function WU:DemonManager_StartTimer()
	self.DemonManager_Timer = self:ScheduleRepeatingTimer("DemonManager_RefreshUI", 1)
end

function WU:DemonManager_StopTimer()
	self:CancelTimer(self.DemonManager_Timer)
end

function WU:DemonManager_GetDemonLevel()
	return self.db.profile.DemonManager_DemonLevel
end

function WU:DemonManager_IncrementDemonLevel()
	self.db.profile.DemonManager_DemonLevel = self.db.profile.DemonManager_DemonLevel + 1
	if self.db.profile.DemonManager_DemonLevel > 7 then
		self.db.profile.DemonManager_DemonLevel = 7
	end
	WU:DemonManager_RefreshUI()
end

function WU:DemonManager_DecrementDemonLevel()
	self.db.profile.DemonManager_DemonLevel = self.db.profile.DemonManager_DemonLevel - 1
	if self.db.profile.DemonManager_DemonLevel < 1 then
		self.db.profile.DemonManager_DemonLevel = 1
	end
	WU:DemonManager_RefreshUI()
end

function WU:DemonManager_HasDemon()
	hasDemon, _ = HasPetUI()
	return hasDemon
end

function WU:DemonManager_SummonDemon(source, button)
	if not InCombatLockdown() then
		source:SetAttribute("type", "spell")
		source:SetAttribute("spell", demonLookup[self.db.profile.DemonManager_DemonLevel])
	else
		print(L["CombatLockdown"])
	end
end

function WU:DemonManager_DismissDemon(source, button)
	if (WU:DemonManager_HasDemon()) then
		PetDismiss()
	end
end

function WU:DemonManager_SacrificeDemon(source, button)
	if (WU:DemonManager_HasDemon()) then
		if (WU:SpellKnown("18788")) then --If Demonic Sacrifice is known
			source:SetAttribute("type", "spell")
			source:SetAttribute("spell", "18788")
		end
	end
end

function WU:DemonManager_HealDemon(source, button)
	if (WU:DemonManager_HasDemon()) then
		source:SetAttribute("type", "spell")
		source:SetAttribute("spell", "11695")
	end
end

function WU:DemonManager_RefreshUI()
	if (self.db.profile.DemonManager_DemonLevel == 1) then
		WU_DemonManager_Summon:SetText(L["SummonDemon"](self.db.profile.DemonManager_DemonLevel))
	elseif (self.db.profile.DemonManager_DemonLevel == 5) then
		WU_DemonManager_Summon:SetText(L["SummonDemon"](self.db.profile.DemonManager_DemonLevel, WU:GetInventoryItemCount("Infernal Stone")))
	elseif (self.db.profile.DemonManager_DemonLevel == 6) then
		WU_DemonManager_Summon:SetText(L["SummonDemon"](self.db.profile.DemonManager_DemonLevel, WU:GetInventoryItemCount("Demonic Figurine")))
	else
		WU_DemonManager_Summon:SetText(L["SummonDemon"](self.db.profile.DemonManager_DemonLevel, WU:GetInventoryItemCount("Soul Shard")))
	end
	WU_DemonManager_IncrementSummon:SetEnabled(not (self.db.profile.DemonManager_DemonLevel >= 7))
	WU_DemonManager_DecrementSummon:SetEnabled(not (self.db.profile.DemonManager_DemonLevel <= 1))
	WU_DemonManager_Dismiss:SetEnabled(WU:DemonManager_HasDemon())
	WU_DemonManager_Heal:SetEnabled(WU:DemonManager_HasDemon())
	WU_DemonManager_Sacrifice:SetEnabled((WU:DemonManager_HasDemon() and WU:SpellKnown("18788")))
end

function WU:SpellKnown(id, pet)
	if (pet) then
		return IsSpellKnown(id, pet)
	else
		return IsSpellKnown(id)
	end
end

function WU:ExecuteHelp()
	for i,v in ipairs(L["Option_Help_Lines"]()) do
		print(v)
	end
end

function WU:ExecuteConfig()
	--Blizzard UI bug, execute 2x
	InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
	InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
end

function WU:GetInventorySlotLocation(item)
	local bag = nil
	local slot = nil
	local found = false
	for b=0,4 do
		for s=1,GetContainerNumSlots(b) do
			n = GetContainerItemLink(b, s)
			if n and string.find(n, ".*%[" .. item ..  "%].*") then
				bag = b
				slot = s
				found = true
				break
			end
		end
		if (found) then
			break
		end
	end
	return {bag=bag, slot=slot}
end

function WU:GetInventoryItemCount(item)
	local count = 0
	for b=0,4 do
		for s=1,GetContainerNumSlots(b) do
			_, itemCount, _, _, _, _, itemLink = GetContainerItemInfo(b, s)
			if itemLink and string.find(itemLink, ".*%[" .. item ..  "%].*") then
				count = count + itemCount
			end
		end
	end
	return count
end

function WU:GetBagItemCount(item, bag)
	local count = 0
	for s=1,GetContainerNumSlots(bag) do
		_, itemCount, _, _, _, _, itemLink = GetContainerItemInfo(bag, s)
		if itemLink and string.find(itemLink, ".*%[" .. item ..  "%].*") then
			count = count + itemCount
		end
	end
	return count
end

function WU:RefreshConfig()
end
