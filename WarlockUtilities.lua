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
		autodelete = {
			type = "execute",
			name = L["AutoDelete"],
			desc = L["SharAutoDeletedManager"],
			func = "ExecuteAutoDelete",
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
			order = 200,
			width = "full"
		},
		delete = {
			type = "group",
			name = L["StoneManager_OptionGroup_Delete_Name"],
			desc = L["StoneManager_OptionGroup_Delete_Desc"],
			order = 300,
			inline = true,
			args = {
				reverse = {
					type = "toggle",
					name = L["ShardManager_Option_Reverse_Name"],
					desc = L["ShardManager_Option_Reverse_Desc"],
					get = "GetOptionShardReverse",
					set = "SetOptionShardReverse",
					order = 310,
					width = "full"
				},
				autoDelete = {
					type = "group",
					name = L["ShardManager_OptionGroup_AutoDelete_Name"],
					desc = L["ShardManager_OptionGroup_AutoDelete_Desc"],
					order = 320,
					inline = true,
					args = {
						enabled = {
							type = "toggle",
							name = L["ShardManager_Option_AutoDelete_Enable_Name"],
							desc = L["ShardManager_Option_AutoDelete_Enable_Desc"],
							get = "ShardManager_GetAutoDeleteEnabled",
							set = "ShardManager_SetAutoDeleteEnabled",
							order = 321,
							width = "full"
						},
						number = {
							type = "range",
							min = 1,
							max = 140,
							softMin = 1,
							softMax = 28,
							step = 1,
							isPercent = false,
							name = L["ShardManager_Option_AutoDelete_Number_Name"],
							desc = L["ShardManager_Option_AutoDelete_Number_Desc"],
							get = "ShardManager_GetAutoDeleteNumber",
							set = "ShardManager_SetAutoDeleteNumber",
							order = 322,
							width = "full"
						}
					}
				}
			}
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
		soulwell = {
			type = "group",
			name = L["StoneManager_OptionGroup_Soulwell_Name"],
			desc = L["StoneManager_OptionGroup_Soulwell_Desc"],
			order = 150,
			inline = true,
			args = {
				enable = {
					type = "toggle",
					name = L["StoneManager_Option_Soulwell_Enable_Name"],
					desc = L["StoneManager_Option_Soulwell_Enable_Desc"],
					get = "StoneManager_GetSoulwellEnabled",
					set = "StoneManager_SetSoulwellEnabled",
					order = 100,
					width = "full"
				},
			}
		},
		level = {
			type = "group",
			name = L["StoneManager_OptionGroup_Level_Name"],
			desc = L["StoneManager_OptionGroup_Level_Desc"],
			order = 200,
			inline = true,
			args = {
				hs = {
					type = "select",
					name = L["StoneManager_Option_HS_Name"],
					desc = L["StoneManager_Option_HS_Desc"],
					values = {L["StoneManager_Option_HS_1"],
						L["StoneManager_Option_HS_2"],
						L["StoneManager_Option_HS_3"],
						L["StoneManager_Option_HS_4"],
						L["StoneManager_Option_HS_5"],
						L["StoneManager_Option_HS_6"],
						L["StoneManager_Option_HS_7"],
						L["StoneManager_Option_HS_8"]
					},
					get = "GetOptionHSLevel",
					set = "SetOptionHSLevel",
					style = "radio",
					order = 201,
					width = "full"
				},
				ss = {
					type = "select",
					name = L["StoneManager_Option_SS_Name"],
					desc = L["StoneManager_Option_SS_Desc"],
					values = {L["StoneManager_Option_SS_1"],
						L["StoneManager_Option_SS_2"],
						L["StoneManager_Option_SS_3"],
						L["StoneManager_Option_SS_4"],
						L["StoneManager_Option_SS_5"],
						L["StoneManager_Option_SS_6"],
						L["StoneManager_Option_SS_7"]
					},
					get = "GetOptionSSLevel",
					set = "SetOptionSSLevel",
					style = "radio",
					order = 202,
					width = "full"
				}
			}
		},
		trade = {
			type = "group",
			name = L["StoneManager_OptionGroup_Trading_Name"],
			desc = L["StoneManager_OptionGroup_Trading_Desc"],
			order = 300,
			inline = true,
			args = {
				enableParty = {
					type = "toggle",
					name = L["StoneManager_Option_EnableParty_Name"],
					desc = L["StoneManager_Option_EnableParty_Desc"],
					get = "StoneManager_GetTradingParty",
					set = "StoneManager_SetTradingParty",
					order = 310,
					width = "full"
				},
				enableRaid = {
					type = "toggle",
					name = L["StoneManager_Option_EnableRaid_Name"],
					desc = L["StoneManager_Option_EnableRaid_Desc"],
					get = "StoneManager_GetTradingRaid",
					set = "StoneManager_SetTradingRaid",
					order = 320,
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
		},
		hint = {
			type = "description",
			name = L["DemonManager_Hint_Name"],
			order = 200
		},
		incubus = {
			type = "toggle",
			name = L["DemonManager_Option_Incubus_Name"],
			desc = L["DemonManager_Option_Incubus_Desc"],
			get = "DemonManager_GetIncubus",
			set = "DemonManager_SetIncubus",
			order = 300,
			width = "full"
		}
	}
}

local optionsSpellAnnouncer = {
	name = L["SpellAnnouncer"],
	handler = WU,
	type = "group",
	args = {
		desc = {
			type = "description",
			name = L["SpellAnnouncer_Desc_Name"],
			order = 100
		},
		summon = {
			type = "group",
			name = L["SpellAnnouncer_OptionGroup_Summon_Name"],
			desc = L["SpellAnnouncer_OptionGroup_Summon_Desc"],
			order = 200,
			inline = true,
			args = {
				enableParty = {
					type = "toggle",
					name = L["SpellAnnouncer_Option_Summon_EnableParty_Name"],
					desc = L["SpellAnnouncer_Option_Summon_EnableParty_Desc"],
					get = "SpellAnnouncer_Summon_GetParty",
					set = "SpellAnnouncer_Summon_SetParty",
					order = 210,
					width = "full"
				},
				enableRaid = {
					type = "toggle",
					name = L["SpellAnnouncer_Option_Summon_EnableRaid_Name"],
					desc = L["SpellAnnouncer_Option_Summon_EnableRaid_Desc"],
					get = "SpellAnnouncer_Summon_GetRaid",
					set = "SpellAnnouncer_Summon_SetRaid",
					order = 210,
					width = "full" 
				}
			}
		},
		soulstone = {
			type = "group",
			name = L["SpellAnnouncer_OptionGroup_SS_Name"],
			desc = L["SpellAnnouncer_OptionGroup_SS_Desc"],
			order = 300,
			inline = true,
			args = {
				enableSolo = {
					type = "toggle",
					name = L["SpellAnnouncer_Option_SS_EnableSolo_Name"],
					desc = L["SpellAnnouncer_Option_SS_EnableSolo_Desc"],
					get = "SpellAnnouncer_SS_GetSolo",
					set = "SpellAnnouncer_SS_SetSolo",
					order = 310,
					width = "full"
				},
				enableParty = {
					type = "toggle",
					name = L["SpellAnnouncer_Option_SS_EnableParty_Name"],
					desc = L["SpellAnnouncer_Option_SS_EnableParty_Desc"],
					get = "SpellAnnouncer_SS_GetParty",
					set = "SpellAnnouncer_SS_SetParty",
					order = 320,
					width = "full"
				},
				enableRaid = {
					type = "toggle",
					name = L["SpellAnnouncer_Option_SS_EnableRaid_Name"],
					desc = L["SpellAnnouncer_Option_SS_EnableRaid_Desc"],
					get = "SpellAnnouncer_SS_GetRaid",
					set = "SpellAnnouncer_SS_SetRaid",
					order = 330,
					width = "full" 
				}
			}
		},
		deathcoil = {
			type = "group",
			name = L["SpellAnnouncer_OptionGroup_DC_Name"],
			desc = L["SpellAnnouncer_OptionGroup_DC_Desc"],
			order = 400,
			inline = true,
			args = {
				enableSolo = {
					type = "toggle",
					name = L["SpellAnnouncer_Option_DC_EnableSolo_Name"],
					desc = L["SpellAnnouncer_Option_DC_EnableSolo_Desc"],
					get = "SpellAnnouncer_DC_GetSolo",
					set = "SpellAnnouncer_DC_SetSolo",
					order = 410,
					width = "full"
				},
				enableParty = {
					type = "toggle",
					name = L["SpellAnnouncer_Option_DC_EnableParty_Name"],
					desc = L["SpellAnnouncer_Option_DC_EnableParty_Desc"],
					get = "SpellAnnouncer_DC_GetParty",
					set = "SpellAnnouncer_DC_SetParty",
					order = 420,
					width = "full"
				},
				enableRaid = {
					type = "toggle",
					name = L["SpellAnnouncer_Option_DC_EnableRaid_Name"],
					desc = L["SpellAnnouncer_Option_DC_EnableRaid_Desc"],
					get = "SpellAnnouncer_DC_GetRaid",
					set = "SpellAnnouncer_DC_SetRaid",
					order = 430,
					width = "full" 
				}
			}
		}
	}
}

local optionsAppTray = {
	name = L["AppTray"],
	handler = WU,
	type = "group",
	args = {
		desc = {
			type = "description",
			name = L["AppTray_Desc_Name"],
			order = 100
		},
		position = {
			type = "group",
			name = L["AppTray_OptionGroup_Position_Name"],
			desc = L["AppTray_OptionGroup_Position_Desc"],
			order = 200,
			inline = true,
			args = {
				border = {
					type = "select",
					name = L["AppTray_Option_Border_Name"],
					desc = L["AppTray_Option_Border_Desc"],
					values = {L["AppTray_Option_Border_Top"],
						L["AppTray_Option_Border_Bottom"],
						L["AppTray_Option_Border_Left"],
						L["AppTray_Option_Border_Right"]
					},
					get = "GetOptionBorder",
					set = "SetOptionBorder",
					style = "radio",
					order = 201,
					width = "full"
				},
				offset = {
					name = L["AppTray_Option_Offset_Name"],
					desc = L["AppTray_Option_Offset_Desc"],
					type = "range",
					min = -1920,
					max = 1920,
					softMin = -1000,
					softMax = 1000,
					step = 1,
					get = "GetOptionOffset",
					set = "SetOptionOffset",
					isPercent = false
				}
			}
		}
	}
}

--set default options
local defaults = {
	profile = {
		ShardManager_Action = "clear",
		ShardManager_Type = "bag",
		ShardManager_Bags = {true, true, true, true, true},
		ShardManager_FillBags = {false, false, false, false, false},
		ShardManager_Number = 0,
		ShardManager_AutoDelete = false,
		ShardManager_AutoDelete_Number = 28,
		ShardManager_Reverse = false,
		StoneManager_SoulwellEnabled = true,
		StoneManager_SoulwellLevel = 1,
		StoneManager_Type = "hs",
		StoneManager_HSLevel = 6,
		StoneManager_SSLevel = 6,
		StoneManager_TradingRaid = true,
		StoneManager_TradingParty = true,
		DemonManager_DemonLevel = 1,
		DemonManager_Incubus = false,
		AnnounceSummon_Raid = false,
		AnnounceSummon_Party = false,
		AnnounceSS_Solo = false,
		AnnounceSS_Raid = false,
		AnnounceSS_Party = false,
		AnnounceDC_Solo = false,
		AnnounceDC_Raid = false,
		AnnounceDC_Party = false,
		AppTray_Border = 4,
		AppTray_Offset = 0
	},
	char = {
		Healthstone_Counter = 0,
		Healthstone_Session_Counter = 0,
		Soulstone_Counter = 0,
		Soulstone_Session_Counter = 0,
		Summon_Counter = 0,
		Summon_Session_Counter = 0
	}
}

local soulwellLookup = {
	"29893", --Ritual of Souls (Rank 1)
	"58887" --Ritual of Souls (Rank 2)
}

local healthFunnelLookup = {
	"755", --Health Funnel (Rank 1)
	"3698", --Health Funnel (Rank 2)
	"3699", --Health Funnel (Rank 3)
	"3700", --Health Funnel (Rank 4)
	"11693", --Health Funnel (Rank 5)
	"11694", --Health Funnel (Rank 6)
	"11695", --Health Funnel (Rank 7)
	"27259" --Health Funnel (Rank 8)
}

local hsLookup = {
	"6201", --Create Healthstone (Minor)
	"6202", --Create Healthstone (Lesser)
	"5699", --Create Healthstone
	"11729", --Create Healthstone (Greater)
	"11730", --Create Healthstone (Major)
	"27230", --Create Healthstone (Master)
	"47871", --Create Healthstone (Demonic)
	"47878" --Create Healthstone (Fel)
}

local hsItemLookup = {
	"Minor Healthstone",
	"Lesser Healthstone",
	"Healthstone",
	"Greater Healthstone",
	"Major Healthstone",
	"Master Healthstone",
	"Demonic Healthstone",
	"Fel Healthstone"
}

local ssLookup = {
	"693", --Create Soulstone (Minor)
	"20752", --Create Soulstone (Lesser)
	"20755", --Create Soulstone
	"20756", --Create Soulstone (Greater)
	"20757", --Create Soulstone (Major)
	"27238", --Create Soulstone (Master)
	"47884" --Create Soulstone (Demonic)
}

local ssItemLookup = {
	"Minor Soulstone",
	"Lesser Soulstone",
	"Soulstone",
	"Greater Soulstone",
	"Major Soulstone",
	"Master Soulstone",
	"Demonic Soulstone"
}

local ssUsageLookup = {
	"20707",
	"20762",
	"20763",
	"20764",
	"20765",
	"27239",
	"36895"
}

local summonLookup = {
	"698" --Ritual of Summoning
}

local dcLookup = {
	"6789", --Death Coil (Rank 1)
	"17925", --Death Coil (Rank 2)
	"17926", --Death Coil (Rank 3)
	"27223", --Death Coil (Rank 4)
	"47859", --Death Coil (Rank 5)
	"47860" --Death Coil (Rank 6)
}

local demonLookup = {
	"688", --Summon Imp
	"697", --Summon Voidwalker
	"712", --Summon Succubus
	"691", --Summon Felhunter
	"30146", --Summon Felguard
	"1122", --Inferno
	"18540", --Ritual of Doom
	"11725" --Subjugate Demon (Rank 3)
}

local demonNameLookup = {
	"Imp",
	"Voidwalker",
	"Succubus",
	"Felhunter",
	"Felguard",
	"Infernal",
	"Doomguard",
	"Subjugate Demon"
}

local soulShardID = "6265"

local autoTrading = false

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
		local chatCommands = {
			wu="ChatCommand",
			warlockutils="ChatCommand",
			warlockutilities="ChatCommand"
		}
		for k,v in pairs(chatCommands) do
			self:RegisterChatCommand(k, v)
		end

		--Events
		local events = {
			TRADE_SHOW="TradeOpened",
			TRADE_CLOSED="TradeClosed",
			BAG_UPDATE="BagUpdate",
			COMBAT_LOG_EVENT_UNFILTERED=function(event)
				WU:CombatLogEvent(CombatLogGetCurrentEventInfo())
			end
		}
		for k,v in pairs(events) do
			self:RegisterEvent(k, v)
		end

		--Options DB
		self.db = LibStub("AceDB-3.0"):New("WarlockUtilitiesOptionsDB", defaults, true)
		local dbActions = {
			OnNewProfile="RefreshConfig",
			OnProfileChanged="RefreshConfig",
			OnProfileCopied="RefreshConfig",
			OnProfileReset="RefreshConfig"
		}
		for k,v in pairs(dbActions) do
			self.db.RegisterCallback(self, k, v)
		end

		--Profile
		local optionsProfile = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
		LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable(L["WU"] .. "-Profiles", optionsProfile)
		LibStub("AceConfigDialog-3.0"):AddToBlizOptions(L["WU"]  .."-Profiles", "Profiles", L["WU"])

		--Options frames
		LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable(L["WU"], options)
		self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(L["WU"], L["WU"])
		local optionTables = {
			{L["WU"] .. "-ShardManager", optionsShardManager},
			{L["WU"] .. "-StoneManager", optionsStoneManager},
			{L["WU"] .. "-DemonManager", optionsDemonManager},
			{L["WU"] .. "-SpellAnnouncer", optionsSpellAnnouncer},
			{L["WU"] .. "-AppTray", optionsAppTray}
		}
		for i,v in ipairs(optionTables) do
			LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable(v[1], v[2])
		end
		local blizzOptions = {
			{L["WU"] .. "-ShardManager", L["ShardManager"]},
			{L["WU"] .. "-StoneManager", L["StoneManager"]},
			{L["WU"] .. "-DemonManager", L["DemonManager"]},
			{L["WU"] .. "-SpellAnnouncer", L["SpellAnnouncer"]},
			{L["WU"] .. "-AppTray", L["AppTray"]}
		}
		for i,v in ipairs(blizzOptions) do
			LibStub("AceConfigDialog-3.0"):AddToBlizOptions(v[1], v[2], L["WU"])
		end

		--XML
		ShowUIPanel(WU_AppTray, 1)
		xmlText = {
			{WU_ShardManager_Header, L["ShardManager_FrameHeader"](GetAddOnMetadata("WarlockUtilities", "Version"))},
			{WU_AutoDelete_Header, L["AutoDelete_FrameHeader"](GetAddOnMetadata("WarlockUtilities", "Version"))},
			{WU_ShardManager_Fill, L["Fill"]},
			{WU_ShardManager_Delete, L["Clear"]},
			{WU_ShardManager_Keep, L["Keep"]},
			{WU_AutoDelete_Delete, L["AutoDelete"]},
			{WU_ShardManager_Bag1, L["Bag"](1)},
			{WU_ShardManager_Bag2, L["Bag"](2)},
			{WU_ShardManager_Bag3, L["Bag"](3)},
			{WU_ShardManager_Bag4, L["Bag"](4)},
			{WU_ShardManager_Bag5, L["Bag"](5)},
			{WU_StoneManager_Header, L["StoneManager_FrameHeader"](GetAddOnMetadata("WarlockUtilities", "Version"))},
			{WU_StoneManager_TradeHealthstoneTextName, L["Trade"]},
			{WU_StoneManager_UseSoulstoneTextName, L["Use"]},
			{WU_DemonManager_Header, L["DemonManager_FrameHeader"](GetAddOnMetadata("WarlockUtilities", "Version"))},
			{WU_StatsPanel_Header, L["StatsPanel_FrameHeader"](GetAddOnMetadata("WarlockUtilities", "Version"))},
			{WU_DemonManager_Sacrifice, L["Sacrifice"]},
			{WU_DemonManager_Dismiss, L["Dismiss"]},
			{WU_DemonManager_Heal, L["Heal"]}
		}
		for i,v in ipairs(xmlText) do
			xmlText[i][1]:SetText(xmlText[i][2])
		end

		--Get Health Funnel level
		for _,spellID in ipairs(healthFunnelLookup) do
			if WU:SpellKnown(spellID) then
				self.db.profile.healthFunnel = spellID
			end
		end

		--Get Soulwell level
		for _,spellID in ipairs(soulwellLookup) do
			if WU:SpellKnown(spellID) then
				self.db.profile.soulwell = spellID
			end
		end

		-- Reset session counters
		self.db.char.Healthstone_Session_Counter = 0
		self.db.char.Soulstone_Session_Counter = 0
		self.db.char.Summon_Session_Counter = 0

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
				local tradePos = TradeFrame_GetAvailableSlot()
				if (tradePos == nil) then
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

function WU:BagUpdate()
	WU:ToggleAutoDelete()
end

function WU:CombatLogEvent(...)
	local _, event, _, _, srcName, srcFlags, _, _, dstName, _, _ = ...
	local isPlayer = bit.band(srcFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0
	local playerName, _ = UnitName("player")
	if (event == "SPELL_CAST_SUCCESS" and isPlayer) then
		if (srcName == playerName) then
			-- Check if spell was create healthstone
			for _, spellID in ipairs(hsLookup) do
				local lookupName = GetSpellInfo(spellID)
				if (lookupName == select(13, ...)) then
					self.db.char.Healthstone_Counter = self.db.char.Healthstone_Counter + 1
					self.db.char.Healthstone_Session_Counter = self.db.char.Healthstone_Session_Counter + 1
					WU:StatsPanel_RefreshUI()
					break
				end
			end
			-- Check if spell was create soulstone
			for _, spellID in ipairs(ssLookup) do
				local lookupName = GetSpellInfo(spellID)
				if (lookupName == select(13, ...)) then
					self.db.char.Soulstone_Counter = self.db.char.Soulstone_Counter + 1
					self.db.char.Soulstone_Session_Counter = self.db.char.Soulstone_Session_Counter + 1
					WU:StatsPanel_RefreshUI()
					break
				end
			end
			-- Check if spell was ritual of summoning
			for _, spellID in ipairs({"698"}) do
				local lookupName = GetSpellInfo(spellID)
				if (lookupName == select(13, ...)) then
					self.db.char.Summon_Counter = self.db.char.Summon_Counter + 1
					self.db.char.Summon_Session_Counter = self.db.char.Summon_Session_Counter + 1
					WU:StatsPanel_RefreshUI()
					break
				end
			end
			-- Check if spell was death coil
			for _, spellID in ipairs(dcLookup) do
				local lookupName = GetSpellInfo(spellID)
				if (lookupName == select(13, ...)) then
					if (self.db.profile.AnnounceDC_Raid and UnitInRaid("player")) then
						WU:SpellAnnouncer_AnnounceDC("SAY")
					elseif (self.db.profile.AnnounceDC_Party and UnitInParty("player") and not UnitInRaid("player")) then
						WU:SpellAnnouncer_AnnounceDC("SAY")
					elseif (self.db.profile.AnnounceDC_Solo) then
						WU:SpellAnnouncer_AnnounceDC("EMOTE")
					end
					break
				end
			end
			-- Check if spell was soulstone resurrection
			for _, spellID in ipairs(ssUsageLookup) do
				local lookupName = GetSpellInfo(spellID)
				if (lookupName == select(13, ...)) then
					if (self.db.profile.AnnounceSS_Raid and UnitInRaid("player")) then
						WU:SpellAnnouncer_AnnounceSS("RAID", dstName)
					elseif (self.db.profile.AnnounceSS_Party and UnitInParty("player") and not UnitInRaid("player")) then
						WU:SpellAnnouncer_AnnounceSS("PARTY", dstName)
					elseif (self.db.profile.AnnounceSS_Solo) then
						WU:SpellAnnouncer_AnnounceSS("EMOTE", dstName)
					end
					break
				end
			end
		end
	elseif (event == "SPELL_CAST_START" and isPlayer) then
		if (srcName == playerName) then
			local lookupName = GetSpellInfo("698")
			if (lookupName == select(13, ...)) then
				if (self.db.profile.AnnounceSummon_Raid and UnitInRaid("player")) then
					WU:SpellAnnouncer_AnnounceSummon("RAID", UnitName("target"))
				elseif (self.db.profile.AnnounceSummon_Party and UnitInParty("player") and not UnitInRaid("player")) then
					WU:SpellAnnouncer_AnnounceSummon("PARTY", UnitName("target"))
				end
			end
		end
	elseif (event == "SPELL_UPDATE_COOLDOWN" and isPlayer) then
		if (srcName == playerName) then
			--Refresh open UIs on cooldown update
			if (WU_StoneManager:IsVisible()) then
				WU:StoneManager_RefreshUI()
			end
			if (WU_ShardManager:IsVisible()) then
				WU:ShardManager_RefreshUI()
			end
			if (WU_DemonManager:IsVisible()) then
				WU:DemonManager_RefreshUI()
			end
		end
	end
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
			WU_ShardManager:Hide()
		else
			WU:ShardManager_RefreshUI()
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

function WU:ShardManager_ToggleAction()
	if (self.db.profile.ShardManager_Action == "clear") then
		self.db.profile.ShardManager_Action = "fill"
	elseif (self.db.profile.ShardManager_Action == "fill") then
		self.db.profile.ShardManager_Action = "keep"
	else
		self.db.profile.ShardManager_Action = "clear"
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

function WU:ShardManager_GetFillBagEnabled(bag)
	return self.db.profile.ShardManager_FillBags[bag]
end

function WU:ShardManager_SetFillBagEnabled(bag, value)
	self.db.profile.ShardManager_FillBags[bag] = value
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

function WU:GetOptionShardReverse(info)
	return self.db.profile.ShardManager_Reverse
end

function WU:SetOptionShardReverse(info, value)
	self.db.profile.ShardManager_Reverse = value
	print(L["ShardManager_SetOption_Reverse"](value))
end

function WU:ShardManager_GetAutoDeleteEnabled(info)
	return self.db.profile.ShardManager_AutoDelete
end

function WU:ShardManager_SetAutoDeleteEnabled(info, value)
	self.db.profile.ShardManager_AutoDelete = value
	print(L["ShardManager_SetOption_AutoDelete"](value))
end

function WU:ShardManager_GetAutoDeleteNumber(info)
	return self.db.profile.ShardManager_AutoDelete_Number
end

function WU:ShardManager_SetAutoDeleteNumber(info, value)
	self.db.profile.ShardManager_AutoDelete_Number = tonumber(value)
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

function WU:ShardManager_ExecuteShortcut()
	if (self.db.profile.ShardManager_Action == "keep") then
		WU:ShardManager_KeepShards()
	elseif (self.db.profile.ShardManager_Action == "clear") then
		WU:ShardManager_DeleteShards()
	else
		WU:ShardManager_FillShards()
	end
end

function WU:ShardManager_KeepShards()
	if (self.db.profile.ShardManager_Type == "bag") then
		for b=0,4 do
			if (self.db.profile.ShardManager_Reverse) then
				b = 4 - b
			end
			if (not self.db.profile.ShardManager_Bags[b+1]) then
				for s=1,GetContainerNumSlots(b) do
					if (self.db.profile.ShardManager_Reverse) then
						s = GetContainerNumSlots(b) - (s - 1)
					end
					local n = GetContainerItemLink(b, s)
					local isShard = false
					if n then
						isShard = WU:IsItemSoulShard(n)
					end
					if isShard then
						PickupContainerItem(b, s)
						DeleteCursorItem()
					end
				end
			end
		end
	else
		local kept = 0
		for b=0,4 do
			if (self.db.profile.ShardManager_Reverse) then
				b = 4 - b
			end
			for s=1,GetContainerNumSlots(b) do
				if (self.db.profile.ShardManager_Reverse) then
					s = GetContainerNumSlots(b) - (s - 1)
				end
				local n = GetContainerItemLink(b,s)
				local isShard = false
				if n then
					isShard = WU:IsItemSoulShard(n)
				end
				if isShard then
					if kept >= self.db.profile.ShardManager_Number then
						PickupContainerItem(b, s)
						DeleteCursorItem()
					else
						kept = kept + 1
					end
				end
			end
		end
	end
end

function WU:ShardManager_DeleteShards()
	if (self.db.profile.ShardManager_Type == "bag") then
		for b=0,4 do
			if (self.db.profile.ShardManager_Reverse) then
				b = 4 - b
			end
			if (self.db.profile.ShardManager_Bags[b]) then
				for s=1,GetContainerNumSlots(i-1) do
					if (self.db.profile.ShardManager_Reverse) then
						s = GetContainerNumSlots(b) - (s - 1)
					end
					local n = GetContainerItemLink(i-1, s)
					local isShard = false
					if n then
						isShard = WU:IsItemSoulShard(n)
					end
					if isShard then
						PickupContainerItem(i-1, s)
						DeleteCursorItem()
					end
				end
			end
		end
	else
		local cleared = 0
		for b=0,4 do
			if (self.db.profile.ShardManager_Reverse) then
				b = 4 - b
			end
			for s=1,GetContainerNumSlots(b) do
				if (self.db.profile.ShardManager_Reverse) then
					s = GetContainerNumSlots(b) - s
				end
				local n = GetContainerItemLink(b, s)
				local isShard = false
				if n then
					isShard = WU:IsItemSoulShard(n)
				end
				if isShard then
					if cleared < self.db.profile.ShardManager_Number then
						PickupContainerItem(b, s)
						DeleteCursorItem()
						cleared = cleared + 1
					end
				end
			end
		end
	end
	WU:ShardManager_RefreshUI()
end

function WU:ShardManager_FillShards()
	local bagsComplete = {false, false, false, false, false}
	local attempts = 0
	local totalSlots = 0
	for b=0,4 do
		totalSlots = totalSlots + GetContainerNumSlots(b)
	end

	for i,v in ipairs(self.db.profile.ShardManager_FillBags) do
		if v then
			while (WU:GetBagFreeSlotCount(i-1) > 0) and attempts < totalSlots do
				for b=0,4 do
					if not (b == i-1) then
						if not (bagsComplete[b+1]) then
							for s=1,GetContainerNumSlots(b) do
								attempts = attempts + 1
								n = GetContainerItemLink(b, s)
								isShard = false
								if n then
									isShard = WU:IsItemSoulShard(n)
								end
								if isShard then
									PickupContainerItem(b, s)
									if (i == 1) then
										PutItemInBackpack()
									else
										bagNum = {0, 20, 21, 22, 23}
										PutItemInBag(bagNum[i])
									end
								end
							end
						end
					end
				end
			end
			bagsComplete[i] = true
		end
	end
	WU:ShardManager_RefreshUI()
end

function WU:ShardManager_RefreshUI()
	if (self:TimeLeft(self.ShardManager_Timer) > 0) then
		WU:ShardManager_StopTimer()
	end
	WU_ShardManager_TotalShardCount:SetText(L["TotalShards"](WU:GetInventoryItemCount("Soul Shard")))
	if (self.db.profile.ShardManager_Action == "clear") then
		if not InCombatLockdown() then
			WU_ShardManager_Toggle_Action:SetText(L["Clear"])
			WU_ShardManager_Delete:Show()
			WU_ShardManager_Toggle_Type:Show()
			WU_ShardManager_Fill:Hide()
			WU_ShardManager_FillBags:Hide()
			WU_ShardManager_Keep:Hide()
		end
		if (self.db.profile.ShardManager_Type == "bag") then
			WU_ShardManager_Toggle_Type:SetText(L["ByBag"])
			if not InCombatLockdown() then
				WU_ShardManager_Number:Hide()
				WU_ShardManager_Bags:Show()
			end
			clearCount = 0
			for i,v in ipairs(self.db.profile.ShardManager_Bags) do
				_G["WU_ShardManager_Bag" .. i .. "Text"]:SetText(L["Bag"](i) .. " (" .. WU:GetBagItemCount("Soul Shard", i-1) ..")")
				if not InCombatLockdown() then
					_G["WU_ShardManager_Bag" .. i]:SetChecked(v)
				end
				if v then
					clearCount = clearCount + WU:GetBagItemCount("Soul Shard", i-1)
				end
			end
			WU_ShardManager_DeleteShardCount:SetText(L["ShardsToClear"](clearCount))
		else
			WU_ShardManager_Toggle_Type:SetText(L["ByNumber"])
			if not InCombatLockdown() then
				WU_ShardManager_Bags:Hide()
				WU_ShardManager_Number:Show()
			end
			if not (WU_ShardManager_NumberInput:HasFocus()) then
				WU_ShardManager_NumberInput:SetText(self.db.profile.ShardManager_Number)
			end
			WU_ShardManager_DeleteShardCount:SetText(L["ShardsToClear"](self.db.profile.ShardManager_Number))
		end
	elseif (self.db.profile.ShardManager_Action == "keep") then
		if not InCombatLockdown() then
			WU_ShardManager_Toggle_Action:SetText(L["Keep"])
			WU_ShardManager_Keep:Show()
			WU_ShardManager_Toggle_Type:Show()
			WU_ShardManager_Delete:Hide()
			WU_ShardManager_Fill:Hide()
			WU_ShardManager_FillBags:Hide()
		end
		if (self.db.profile.ShardManager_Type == "bag") then
			WU_ShardManager_Toggle_Type:SetText(L["ByBag"])
			if not InCombatLockdown() then
				WU_ShardManager_Number:Hide()
				WU_ShardManager_Bags:Show()
			end
			clearCount = 0
			for i,v in ipairs(self.db.profile.ShardManager_Bags) do
				_G["WU_ShardManager_Bag" .. i .. "Text"]:SetText(L["Bag"](i) .. " (" .. WU:GetBagItemCount("Soul Shard", i-1) ..")")
				if not InCombatLockdown() then
					_G["WU_ShardManager_Bag" .. i]:SetChecked(v)
				end
				if v then
					clearCount = clearCount + WU:GetBagItemCount("Soul Shard", i-1)
				end
			end
			WU_ShardManager_DeleteShardCount:SetText(L["ShardsToKeep"](clearCount))
		else
			WU_ShardManager_Toggle_Type:SetText(L["ByNumber"])
			if not InCombatLockdown() then
				WU_ShardManager_Bags:Hide()
				WU_ShardManager_Number:Show()
			end
			if not (WU_ShardManager_NumberInput:HasFocus()) then
				WU_ShardManager_NumberInput:SetText(self.db.profile.ShardManager_Number)
			end
			WU_ShardManager_DeleteShardCount:SetText(L["ShardsToKeep"](self.db.profile.ShardManager_Number))
		end
	else
		for i,v in ipairs(self.db.profile.ShardManager_FillBags) do
			_G["WU_ShardManager_FillBag" .. i .. "Text"]:SetText(L["Bag"](i) .. " (" .. WU:GetBagFreeSlotCount(i-1) ..")")
			if not InCombatLockdown() then
				_G["WU_ShardManager_FillBag" .. i]:SetChecked(v)
			end
		end
		WU_ShardManager_Toggle_Action:SetText(L["Fill"])
		if not InCombatLockdown() then
			WU_ShardManager_Fill:Show()
			WU_ShardManager_FillBags:Show()
			WU_ShardManager_Toggle_Type:Hide()
			WU_ShardManager_Bags:Hide()
			WU_ShardManager_Number:Hide()
			WU_ShardManager_Delete:Hide()
			WU_ShardManager_Keep:Hide()
		end
	end
	if InCombatLockdown() then
		-- start try again timer
		WU:ShardManager_StartTimer()
	end
end

function WU:ToggleAutoDelete()
	if (self.db.profile.ShardManager_AutoDelete) then
		if (WU:GetInventoryItemCount("Soul Shard") > self.db.profile.ShardManager_AutoDelete_Number) then
			if (not InCombatLockdown()) then
				WU_AutoDelete:Show()
			end
		end
	end
end

function WU:ExecuteAutoDelete()
	if (not InCombatLockdown()) then
		local kept = 0
		for b=0,4 do
			if (self.db.profile.ShardManager_Reverse) then
				b = 4 - b
			end
			for s=1,GetContainerNumSlots(b) do
				if (self.db.profile.ShardManager_Reverse) then
					s = GetContainerNumSlots(b) - (s - 1)
				end
				local n = GetContainerItemLink(b,s)
				local isShard = false
				if n then
					isShard = WU:IsItemSoulShard(n)
				end
				if isShard then
					if kept >= self.db.profile.ShardManager_AutoDelete_Number then
						PickupContainerItem(b, s)
						DeleteCursorItem()
					else
						kept = kept + 1
					end
				end
			end
		end
		WU_AutoDelete:Hide()
	end
end

function WU:ToggleStoneManager()
	if not InCombatLockdown() then
		if WU_StoneManager:IsVisible() then
			WU_StoneManager:Hide()
		else
			WU:StoneManager_RefreshUI()
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

function WU:GetOptionHSLevel()
	return self.db.profile.StoneManager_HSLevel
end

function WU:SetOptionHSLevel(info, value)
	self.db.profile.StoneManager_HSLevel = value
	print(L["StoneManager_SetOption_HSLevel"](value))
end

function WU:GetOptionSSLevel()
	return self.db.profile.StoneManager_SSLevel
end

function WU:SetOptionSSLevel(info, value)
	self.db.profile.StoneManager_SSLevel = value
	print(L["StoneManager_SetOption_SSLevel"](value))
end

function WU:StoneManager_GetSoulwellEnabled(info)
	return self.db.profile.StoneManager_SoulwellEnabled
end

function WU:StoneManager_SetSoulwellEnabled(info, value)
	self.db.profile.StoneManager_SoulwellEnabled = value
	print(L["StoneManager_SetOption_SoulwellEnabled"](value))
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

function WU:StoneManager_StartStaticTimer()
	self.StoneManager_StaticTimer = self:ScheduleRepeatingTimer("StoneManager_RefreshUI", 5)
end

function WU:StoneManager_StopStaticTimer()
	self:CancelTimer(self.StoneManager_StaticTimer)
end

function WU:StoneManager_CreateHealthstone(source, button)
	if not InCombatLockdown() then
		local spellID
		source:SetAttribute("type", "spell")
		if (self.db.profile.StoneManager_SoulwellEnabled) then
			local s,d,_ = GetSpellCooldown(self.db.profile.soulwell)
			if not (s > 0 and d > 0) then spellID = self.db.profile.soulwell end
		else
			spellID = hsLookup[self.db.profile.StoneManager_HSLevel]
		end
		if not spellID then spellID = hsLookup[self.db.profile.StoneManager_HSLevel] end
		source:SetAttribute("spell", spellID)
	end
end

function WU:StoneManager_CreateSoulstone(source, button)
	if not InCombatLockdown() then
		source:SetAttribute("type", "spell")
		source:SetAttribute("spell", ssLookup[self.db.profile.StoneManager_SSLevel])
	end
end

function WU:StoneManager_CheckBagsForHSLevel()
	local loc = WU:GetInventorySlotLocation(hsItemLookup[self.db.profile.StoneManager_HSLevel])
	return not((loc.bag == nil) and (loc.slot == nil))
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
	if not InCombatLockdown() then
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
end

function WU:StoneManager_CheckBagsForSSLevel()
	local loc = WU:GetInventorySlotLocation(ssItemLookup[self.db.profile.StoneManager_SSLevel])
	return not((loc.bag == nil) and (loc.slot == nil))
end

function WU:StoneManager_RefreshUI()
	if (self:TimeLeft(self.StoneManager_Timer) > 0) then
		WU:StoneManager_StopTimer()
	end
	-- If static timer is running
	if (self:TimeLeft(self.StoneManager_StaticTimer) > 0) then
		WU:StoneManager_StopStaticTimer()
	end
	if not InCombatLockdown() then
		if (self.db.profile.StoneManager_Type == "hs") then
			local icon, text
			if (self.db.profile.StoneManager_SoulwellEnabled) then
				icon = "Interface\\ICONS\\Spell_shadow_shadesofdarkness"
				text = L["Soulwell"]
				local s,d,_ = GetSpellCooldown(self.db.profile.soulwell)
				if (s > 0 and d > 0) then
					WU_StoneManager_CreateHealthstone_Cooldown:SetCooldown(s, d)
					WU_StoneManager_CreateHealthstone_Cooldown:Show()
					WU_StoneManager_CreateHealthstone:Disable()
				else
					WU_StoneManager_CreateHealthstone_Cooldown:Clear()
					WU_StoneManager_CreateHealthstone_Cooldown:Hide()
					WU_StoneManager_CreateHealthstone:Enable()
				end
			else
				icon = "Interface\\ICONS\\inv_stone_04"
				text = L["Healthstone"]
			end
			if not icon then icon = "Interface\\ICONS\\inv_stone_04" end
			if not text then text = L["Healthstone"] end
			WU_StoneManager_CreateHealthstone:SetNormalTexture(icon)
			WU_StoneManager_CreateHealthstone:SetPushedTexture(icon)
			WU_StoneManager_PanelToggle:SetText(text)
			WU_StoneManager_Healthstone:Show()
			WU_StoneManager_Soulstone:Hide()
		else
			WU_StoneManager_PanelToggle:SetText(L["Soulstone"])
			WU_StoneManager_Healthstone:Hide()
			WU_StoneManager_Soulstone:Show()
		end
	else
		WU:StoneManager_StartTimer()
	end
	WU:StoneManager_StartStaticTimer()
end

function WU:ToggleDemonManager()
	if not InCombatLockdown() then
		if WU_DemonManager:IsVisible() then
			WU_DemonManager:Hide()
			WU:DemonManager_StopStaticTimer()
		else
			WU:DemonManager_RefreshUI()
			ShowUIPanel(WU_DemonManager, 1)
			WU:DemonManager_StartStaticTimer()
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

function WU:DemonManager_StartStaticTimer()
	self.DemonManager_StaticTimer = self:ScheduleRepeatingTimer("DemonManager_RefreshUI", 10)
end

function WU:DemonManager_StopStaticTimer()
	self:CancelTimer(self.DemonManager_StaticTimer)
end

function WU:DemonManager_GetIncubus()
	return self.db.profile.DemonManager_Incubus
end

function WU:DemonManager_SetIncubus(info, value)
	if (value and WU:SpellKnown("713")) then
		self.db.profile.DemonManager_Incubus = value
		print(L["DemonManager_SetOption_Incubus"](value))
	else
		self.db.profile.DemonManager_Incubus = false
		print(L["DemonManager_SetOption_IncubusError"])
	end
	
end

function WU:DemonManager_GetDemonLevel()
	return self.db.profile.DemonManager_DemonLevel
end

function WU:DemonManager_IncrementDemonLevel()
	self.db.profile.DemonManager_DemonLevel = self.db.profile.DemonManager_DemonLevel + 1
	if self.db.profile.DemonManager_DemonLevel > 8 then
		self.db.profile.DemonManager_DemonLevel = 8
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
		if (self.db.profile.DemonManager_DemonLevel == 3 and WU:DemonManager_GetIncubus()) then
			spellID = "713"
		else
			spellID = demonLookup[self.db.profile.DemonManager_DemonLevel]
		end
		source:SetAttribute("spell", spellID)
	end
end

function WU:DemonManager_DismissDemon(source, button)
	if (WU:DemonManager_HasDemon()) then
		PetDismiss()
	end
end

function WU:DemonManager_SacrificeDemon(source, button)
	if not InCombatLockdown() then
		if (WU:DemonManager_HasDemon()) then
			if (WU:SpellKnown("18788")) then --If Demonic Sacrifice is known
				source:SetAttribute("type", "spell")
				source:SetAttribute("spell", "18788")
			end
		end
	end
end

function WU:DemonManager_HealDemon(source, button)
	if not InCombatLockdown() then
		if (WU:DemonManager_HasDemon()) then
			source:SetAttribute("type", "spell")
			source:SetAttribute("spell", self.db.profile.healthFunnel)
		end
	end
end

function WU:DemonManager_RefreshUI()
	-- If try again timer is running
	if (self:TimeLeft(self.DemonManager_Timer) > 0) then
		WU:DemonManager_StopTimer()
	end
	-- If static timer is running
	if (self:TimeLeft(self.DemonManager_StaticTimer) > 0) then
		WU:DemonManager_StopStaticTimer()
	end
	if not InCombatLockdown() then
		if (self.db.profile.DemonManager_DemonLevel == 1) then
			WU_DemonManager_Summon:SetText(L["SummonDemon"](self.db.profile.DemonManager_DemonLevel))
		elseif (self.db.profile.DemonManager_DemonLevel == 6) then
			WU_DemonManager_Summon:SetText(L["SummonDemon"](self.db.profile.DemonManager_DemonLevel, WU:GetInventoryItemCount("Infernal Stone")))
		elseif (self.db.profile.DemonManager_DemonLevel == 7) then
			WU_DemonManager_Summon:SetText(L["SummonDemon"](self.db.profile.DemonManager_DemonLevel, WU:GetInventoryItemCount("Demonic Figurine")))
		else
			WU_DemonManager_Summon:SetText(L["SummonDemon"](self.db.profile.DemonManager_DemonLevel, WU:GetInventoryItemCount("Soul Shard"), WU:DemonManager_GetIncubus()))
		end
		if self.db.profile.DemonManager_DemonLevel == 5 then
			WU_DemonManager_Summon:SetEnabled(WU:SpellKnown(demonLookup[5]))
		else
			WU_DemonManager_Summon:SetEnabled(true)
		end
		WU_DemonManager_Dismiss:SetEnabled(WU:DemonManager_HasDemon())
		WU_DemonManager_Heal:SetEnabled(WU:DemonManager_HasDemon())
		WU_DemonManager_Sacrifice:SetEnabled((WU:DemonManager_HasDemon() and WU:SpellKnown("18788")))
	else
		WU:DemonManager_StartTimer()
	end
	WU:DemonManager_StartStaticTimer()
end

function WU:SpellAnnouncer_Summon_GetParty()
	return self.db.profile.AnnounceSummon_Party
end

function WU:SpellAnnouncer_Summon_GetRaid()
	return self.db.profile.AnnounceSummon_Raid
end

function WU:SpellAnnouncer_Summon_SetParty(info, value)
	self.db.profile.AnnounceSummon_Party = value
	print(L["SpellAnnouncer_SetOption_Summon_Party"](value))
end

function WU:SpellAnnouncer_Summon_SetRaid(info, value)
	self.db.profile.AnnounceSummon_Raid = value
	print(L["SpellAnnouncer_SetOption_Summon_Raid"](value))
end

function WU:SpellAnnouncer_SS_GetSolo()
	return self.db.profile.AnnounceSS_Solo
end

function WU:SpellAnnouncer_SS_GetParty()
	return self.db.profile.AnnounceSS_Party
end

function WU:SpellAnnouncer_SS_GetRaid()
	return self.db.profile.AnnounceSS_Raid
end

function WU:SpellAnnouncer_SS_SetSolo(info, value)
	self.db.profile.AnnounceSS_Solo = value
	print(L["SpellAnnouncer_SetOption_SS_Solo"](value))
end

function WU:SpellAnnouncer_SS_SetParty(info, value)
	self.db.profile.AnnounceSS_Party = value
	print(L["SpellAnnouncer_SetOption_SS_Party"](value))
end

function WU:SpellAnnouncer_SS_SetRaid(info, value)
	self.db.profile.AnnounceSS_Raid = value
	print(L["SpellAnnouncer_SetOption_SS_Raid"](value))
end

function WU:SpellAnnouncer_AnnounceSummon(channel, target)
	local dest, zoneText, subZoneText
	if not (GetZoneText() == "") then
		zoneText = GetZoneText()
	end
	if not (GetSubZoneText() == "") then
		subZoneText = GetSubZoneText()
	end
	if (zoneText) then
		dest = zoneText
		if (subZoneText) then
			dest = dest .. " - " .. subZoneText
		end
	else
		dest = L["UnknownDestination"]
	end
	SendChatMessage(L["AnnounceSummon"](target, dest), channel)
end

function WU:SpellAnnouncer_AnnounceSS(channel, target)
	if (channel == "EMOTE") then
		SendChatMessage(L["AnnounceSSEmote"](target), channel)
	else
		SendChatMessage(L["AnnounceSS"](target), channel)
	end
end

function WU:SpellAnnouncer_AnnounceDC(channel)
	if (channel == "EMOTE") then
		SendChatMessage(L["AnnounceDCEmote"], channel)
	else
		SendChatMessage(L["AnnounceDC"], channel)
	end
end

function WU:SpellAnnouncer_DC_GetSolo()
	return self.db.profile.AnnounceDC_Solo
end

function WU:SpellAnnouncer_DC_GetParty()
	return self.db.profile.AnnounceDC_Party
end

function WU:SpellAnnouncer_DC_GetRaid()
	return self.db.profile.AnnounceDC_Raid
end

function WU:SpellAnnouncer_DC_SetSolo(info, value)
	self.db.profile.AnnounceDC_Solo = value
	print(L["SpellAnnouncer_SetOption_DC_Solo"](value))
end

function WU:SpellAnnouncer_DC_SetParty(info, value)
	self.db.profile.AnnounceDC_Party = value
	print(L["SpellAnnouncer_SetOption_DC_Party"](value))
end

function WU:SpellAnnouncer_DC_SetRaid(info, value)
	self.db.profile.AnnounceDC_Raid = value
	print(L["SpellAnnouncer_SetOption_DC_Raid"](value))
end

function WU:GetOptionBorder()
	return self.db.profile.AppTray_Border
end

function WU:SetOptionBorder(info, value)
	self.db.profile.AppTray_Offset = 0
	self.db.profile.AppTray_Border = value
	WU:AppTray_RefreshUI()
	print(L["AppTray_SetOption_Border"](value))
end

function WU:GetOptionOffset()
	return self.db.profile.AppTray_Offset
end

function WU:SetOptionOffset(info, value)
	self.db.profile.AppTray_Offset = value
	WU:AppTray_RefreshUI()
end

function WU:AppTray_StartTimer()
	WU:AppTray_RefreshUI()
	self.AppTray_Timer = self:ScheduleRepeatingTimer("AppTray_RefreshUI", 2)
end

function WU:AppTray_StopTimer()
	self:CancelTimer(self.AppTray_Timer)
end

function WU:AppTray_RefreshUI()
	if not InCombatLockdown() then
		if WU_AppTray:IsVisible() then
			border = WU:GetOptionBorder()
			offset = WU:GetOptionOffset()
			WU_AppTray_Stats:ClearAllPoints()
			if (border == 1) then
				WU_AppTray_Stats:SetPoint("BOTTOMRIGHT", WU_AppTray, "BOTTOMRIGHT", 5, -5)
			elseif (border == 2) then
				WU_AppTray_Stats:SetPoint("TOPRIGHT", WU_AppTray, "TOPRIGHT", 5, 5)
			elseif (border == 3) then
				WU_AppTray_Stats:SetPoint("BOTTOMRIGHT", WU_AppTray, "BOTTOMRIGHT", 5, -5)
			elseif (border == 4) then
				WU_AppTray_Stats:SetPoint("BOTTOMLEFT", WU_AppTray, "BOTTOMLEFT", -5, -5)
			end
			WU_AppTray:ClearAllPoints()
			if not MouseIsOver(WU_AppTray) then
				if (border == 1) then
					WU_AppTray_PullTab_Top:SetAlpha(0.75)
					WU_AppTray:SetPoint("BOTTOM", UIParent, "TOP", offset, -10)
				elseif (border == 2) then
					WU_AppTray_PullTab_Bottom:SetAlpha(0.75)
					WU_AppTray:SetPoint("TOP", UIParent, "BOTTOM", offset, 10)
				elseif (border == 3) then
					WU_AppTray_PullTab_Left:SetAlpha(0.75)
					WU_AppTray:SetPoint("RIGHT", UIParent, "LEFT", 10, offset)
				elseif (border == 4) then
					WU_AppTray_PullTab_Right:SetAlpha(0.75)
					WU_AppTray:SetPoint("LEFT", UIParent, "RIGHT", -10, offset)
				end
			else
				WU_AppTray_PullTab_Top:SetAlpha(0)
				WU_AppTray_PullTab_Bottom:SetAlpha(0)
				WU_AppTray_PullTab_Left:SetAlpha(0)
				WU_AppTray_PullTab_Right:SetAlpha(0)
				if (border == 1) then
					WU_AppTray:SetPoint("TOP", UIParent, "TOP", offset, 0);
				elseif (border == 2) then
					WU_AppTray:SetPoint("BOTTOM", UIParent, "BOTTOM", offset, 0);
				elseif (border == 3) then
					WU_AppTray:SetPoint("LEFT", UIParent, "LEFT", 0, offset);
				elseif (border == 4) then
					WU_AppTray:SetPoint("RIGHT", UIParent, "RIGHT", 0, offset);
				end
			end
		end
	end
end

function WU:ToggleStatsPanel()
	if not InCombatLockdown() then
		if WU_StatsPanel:IsVisible() then
			WU_StatsPanel:Hide()
		else
			WU_StatsPanel:Show()
			WU:StatsPanel_RefreshUI()
		end
	else
		print(L["CombatLockdown"])
	end
end

function WU:StatsPanel_ResetHealthstoneCounter()
	self.db.char.Healthstone_Counter = 0
	self.db.char.Healthstone_Session_Counter = 0
	WU:StatsPanel_RefreshUI()
end

function WU:StatsPanel_ResetSoulstoneCounter()
	self.db.char.Soulstone_Counter = 0
	self.db.char.Soulstone_Session_Counter = 0
	WU:StatsPanel_RefreshUI()
end

function WU:StatsPanel_ResetSummonCounter()
	self.db.char.Summon_Counter = 0
	self.db.char.Summon_Session_Counter = 0
	WU:StatsPanel_RefreshUI()
end

function WU:StatsPanel_RefreshUI()
	WU_StatsPanel_HS_Counter:SetText("Total: " .. self.db.char.Healthstone_Counter)
	WU_StatsPanel_HS_Session_Counter:SetText("Current session: " .. self.db.char.Healthstone_Session_Counter)
	WU_StatsPanel_SS_Counter:SetText("Total: " .. self.db.char.Soulstone_Counter)
	WU_StatsPanel_SS_Session_Counter:SetText("Current session: " .. self.db.char.Soulstone_Session_Counter)
	WU_StatsPanel_Summon_Counter:SetText("Total: " .. self.db.char.Summon_Counter)
	WU_StatsPanel_Summon_Session_Counter:SetText("Current session: " .. self.db.char.Summon_Session_Counter)
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

function WU:GetItemID(itemLink)
	local regex = "([^:]+)"
	local segments = {}
	for w in itemLink:gmatch(regex) do
		table.insert(segments, w)
	end
	return segments[2]
end

function WU:IsItemSoulShard(itemLink)
	local itemID = WU:GetItemID(itemLink)
	return (itemID == soulShardID)
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

function WU:GetBagFreeSlotCount(bag)
	slots, _ = GetContainerNumFreeSlots(bag)
	return slots
end

function WU:ConcatTables(t1, t2)
	for _,v in ipairs(t2) do
		table.insert(t1, v)
	end
	return t1
end

function WU:RefreshConfig()
end
