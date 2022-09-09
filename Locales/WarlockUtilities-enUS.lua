local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("WarlockUtilities", "enUS", true, true)
if not L then return end

--AddOn name
L["WU"] = "WarlockUtilities"

--AddOn Enable/Disable messages
L["AddonEnabled"] = function(v,a)
	return "|cff7702bfWarlockUtilities:|r version " .. v .. " by " .. a .. " loaded."
end
L["AddonDisabled"] = function()
	return L["WU"] .. " disabled."
end

--Comm messaging
L["CommPrefix"] = "Ace3 Prefix"
L["CommMessage"] = "Ace3 Comms Message"

--Options
L["Options_Desc_Name"] = "Options for the WarlockUtilities addon."
L["ShardManager"] = "Shard Manager"
L["ShardManager_Desc_Name"] = "Shard Manager options."
L["ShardManager_OptionGroup_Type_Name"] = "Shard Manager Type"
L["ShardManager_OptionGroup_Type_Desc"] = "Set whether the Shard Manager searched by bag or by number of shards."
L["ShardManager_Option_TypeByBag"] = "Manage Shards by Bag"
L["ShardManager_Option_TypeByNumber"] = "Manage Shards by Number"
L["ShardManager_Option_AutoDelete_Enable_Name"] = "Enable AutoDelete"
L["ShardManager_Option_AutoDelete_Enable_Desc"] = "Enabled/disable auto delete of shards. Will keep a minimum of X shards in inventory (specified below)."
L["ShardManager_Option_AutoDelete_Number_Name"] = "Number of Shards"
L["ShardManager_Option_AutoDelete_Number_Desc"] = "The number of shards to keep in inventory if autodeleting."
L["ShardManager_SetOption_Reverse"] = function(value)
	if (value) then
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cenabled|r: Reverse Delete"
	else
		return "|cff7702bfWarlockUtilities:|r Option |cff9c0909disabled|r: Reverse Delete"
	end
end
L["ShardManager_SetOption_AutoDelete"] = function(value)
	if (value) then
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cenabled|r: AutoDelete Shards"
	else
		return "|cff7702bfWarlockUtilities:|r Option |cff9c0909disabled|r: AutoDelete Shards"
	end
end
L["ShardManager_SetOption_AutoDelete_Number"] = function(value)
	return "|cff7702bfWarlockUtilities:|r AutoDelete - Minimum inventory set to: |cff12ad0cenabled|r" .. value
end
L["StoneManager"] = "Stone Manager"
L["StoneManager_Desc_Name"] = "Stone Manager options."
L["ShardManager_OptionGroup_AutoDelete_Name"] = "AutoDelete"
L["ShardManager_OptionGroup_AutoDelete_Desc"] = "Auto shard deletion options."
L["StoneManager_Option_Soulwell_Enable_Name"] = "Enable Soulwell"
L["StoneManager_Option_Soulwell_Enable_Desc"] = "Enable use of soulwell instead of healthstone, if known and not on cooldown."
L["StoneManager_OptionGroup_Level_Name"] = "Stone Rank Options"
L["StoneManager_OptionGroup_Level_Desc"] = "Stone rank options."
L["StoneManager_Option_HS_Name"] = "Healthstone Rank"
L["StoneManager_Option_HS_Desc"] = "Rank of Healthstone to create."
L["StoneManager_Option_SS_Name"] = "Soulstone Rank"
L["StoneManager_Option_HS_Desc"] = "Rank of Soulstone to create."
L["StoneManager_Option_HS_1"] = "Minor"
L["StoneManager_Option_HS_2"] = "Lesser"
L["StoneManager_Option_HS_3"] = "Normal"
L["StoneManager_Option_HS_4"] = "Greater"
L["StoneManager_Option_HS_5"] = "Major"
L["StoneManager_Option_HS_6"] = "Master"
L["StoneManager_Option_SS_1"] = "Minor"
L["StoneManager_Option_SS_2"] = "Lesser"
L["StoneManager_Option_SS_3"] = "Normal"
L["StoneManager_Option_SS_4"] = "Greater"
L["StoneManager_Option_SS_5"] = "Major"
L["StoneManager_Option_SS_6"] = "Master"
L["StoneManager_OptionGroup_Trading_Name"] = "Trade Options"
L["StoneManager_OptionGroup_Trading_Desc"] = "Automatic stone trading options."
L["StoneManager_Option_EnableParty_Name"] = "Party"
L["StoneManager_Option_EnableParty_Desc"] = "Enable automatic healthstone trading for party members."
L["StoneManager_Option_EnableRaid_Name"] = "Raid"
L["StoneManager_Option_EnableRaid_Desc"] = "Enable automatic healthstone trading for raid members."
L["StoneManager_SetOption_SoulwellEnabled"] = function(value)
	if (value) then
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cenabled|r: Soulwell"
	else
		return "|cff7702bfWarlockUtilities:|r Option |cff9c0909disabled|r: Soulwell"
	end
end
L["StoneManager_SetOption_HSLevel"] = function(value)
	if (value == 1) then
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cupdated|r: Healthstone - Rank - Minor"
	elseif (value == 2) then
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cupdated|r: Healthstone - Rank - Lesser"
	elseif (value == 3) then
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cupdated|r: Healthstone - Rank - Normal"
	elseif (value == 4) then
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cupdated|r: Healthstone - Rank - Greater"
	elseif (value == 5) then
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cupdated|r: Healthstone - Rank - Major"
	else
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cupdated|r: Healthstone - Rank - Master"
	end
end
L["StoneManager_SetOption_SSLevel"] = function(value)
	if (value == 1) then
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cupdated|r: Soulstone - Rank - Minor"
	elseif (value == 2) then
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cupdated|r: Soulstone - Rank - Lesser"
	elseif (value == 3) then
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cupdated|r: Soulstone - Rank - Normal"
	elseif (value == 4) then
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cupdated|r: Soulstone - Rank - Greater"
	elseif (value == 5) then
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cupdated|r: Soulstone - Rank - Major"
	else
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cupdated|r: Soulstone - Rank - Master"
	end
end
L["StoneManager_SetOption_TradingParty"] = function(value)
	if (value) then
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cenabled|r: Trading - Party"
	else
		return "|cff7702bfWarlockUtilities:|r Option |cff9c0909disabled|r: Trading - Party"
	end
end
L["StoneManager_SetOption_TradingRaid"] = function(value)
	if (value) then
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cenabled|r: Trading - Raid"
	else
		return "|cff7702bfWarlockUtilities:|r Option |cff9c0909disabled|r: Trading - Raid"
	end
end
L["DemonManager"] = "Demon Manager"
L["DemonManager_Desc_Name"] = "Demon Manager options."
L["DemonManager_Hint_Name"] = "Hint: Scroll the mouse wheel on the Summon Demon button to change the demon to summon."
L["DemonManager_Option_Incubus_Name"] = "Use Incubus"
L["DemonManager_Option_Incubus_Desc"] = "Enable to summon Incubus instead of Succubus."
L["DemonManager_SetOption_Incubus"] = function(value)
	if (value) then
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cenabled|r: Incubus"
	else
		return "|cff7702bfWarlockUtilities:|r Option |cff9c0909disabled|r: Incubus"
	end
end
L["DemonManager_SetOption_IncubusError"] = "|cff7702bfWarlockUtilities:|r Option |cff9c0909disabled|r: Incubus (Spell not trained.)"
L["Option_Help_Name"] = "Help"
L["Option_Help_Desc"] = "Shows a list of supported commands and options."
L["Option_Help_Lines"] = function()
	return {
		"|cff7702bfWarlockUtilities usage:|r",
		"/wu | /warlockutils | /warlockutilities",
		"  { config | help | shards | stones | demons}",
		"- |cff7702bfconfig|r: Opens the configuration menu.",
		"- |cff7702bfhelp|r: Shows a list of supported options.",
		"- |cff7702bfshards|r: Opens the Shard Manager utility frame.",
		"- |cff7702bfstones|r: Opens the Stone Manager utility frame.",
		"- |cff7702bfdemons|r: Opens the Demon Manager utility frame."
	}
end
L["Option_Config_Name"] = "Config"
L["Option_Config_Desc"] = "Opens the configuration menu."
L["SpellAnnouncer"] = "Spell Announcer"
L["SpellAnnouncer_Desc_Name"] = "Spell Announcer Options"
L["SpellAnnouncer_OptionGroup_Summon_Name"] = "Summon Announce Options"
L["SpellAnnouncer_OptionGroup_Summon_Desc"] = "Automatic summon announcing options."
L["SpellAnnouncer_Option_Summon_EnableParty_Name"] = "Party"
L["SpellAnnouncer_Option_Summon_EnableParty_Desc"] = "Enable summon announces when in party."
L["SpellAnnouncer_Option_Summon_EnableRaid_Name"] = "Raid"
L["SpellAnnouncer_Option_Summon_EnableRaid_Desc"] = "Enable summon announces when in raid."
L["SpellAnnouncer_OptionGroup_SS_Name"] = "Soulstone Announce Options"
L["SpellAnnouncer_OptionGroup_SS_Desc"] = "Automatic soulstone announcing options."
L["SpellAnnouncer_Option_SS_EnableSolo_Name"] = "Solo"
L["SpellAnnouncer_Option_SS_EnableSolo_Desc"] = "Enable soulstone announces when solo."
L["SpellAnnouncer_Option_SS_EnableParty_Name"] = "Party"
L["SpellAnnouncer_Option_SS_EnableParty_Desc"] = "Enable soulstone announces when in party."
L["SpellAnnouncer_Option_SS_EnableRaid_Name"] = "Raid"
L["SpellAnnouncer_Option_SS_EnableRaid_Desc"] = "Enable soulstone announces when in raid."
L["SpellAnnouncer_OptionGroup_DC_Name"] = "Death Coil Announce Options"
L["SpellAnnouncer_OptionGroup_DC_Desc"] = "Automatic death coil announcing options."
L["SpellAnnouncer_Option_DC_EnableSolo_Name"] = "Solo"
L["SpellAnnouncer_Option_DC_EnableSolo_Desc"] = "Enable death coil announces when solo."
L["SpellAnnouncer_Option_DC_EnableParty_Name"] = "Party"
L["SpellAnnouncer_Option_DC_EnableParty_Desc"] = "Enable death coil announces when in party."
L["SpellAnnouncer_Option_DC_EnableRaid_Name"] = "Raid"
L["SpellAnnouncer_Option_DC_EnableRaid_Desc"] = "Enable death coil announces when in raid."
L["SpellAnnouncer_SetOption_Summon_Party"] = function(v)
	if (v) then
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cenabled|r: Summon Announce - Party"
	else
		return "|cff7702bfWarlockUtilities:|r Option |cff9c0909disabled|r: Summon Announce - Party"
	end
end
L["SpellAnnouncer_SetOption_Summon_Raid"] = function(v)
	if (v) then
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cenabled|r: Summon Announce - Raid"
	else
		return "|cff7702bfWarlockUtilities:|r Option |cff9c0909disabled|r: Summon Announce - Raid"
	end
end
L["SpellAnnouncer_SetOption_SS_Solo"] = function(v)
	if (v) then
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cenabled|r: Soulstone Announce - Solo"
	else
		return "|cff7702bfWarlockUtilities:|r Option |cff9c0909disabled|r: Soulstone Announce - Solo"
	end
end
L["SpellAnnouncer_SetOption_SS_Party"] = function(v)
	if (v) then
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cenabled|r: Soulstone Announce - Party"
	else
		return "|cff7702bfWarlockUtilities:|r Option |cff9c0909disabled|r: Soulstone Announce - Party"
	end
end
L["SpellAnnouncer_SetOption_SS_Raid"] = function(v)
	if (v) then
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cenabled|r: Soulstone Announce - Raid"
	else
		return "|cff7702bfWarlockUtilities:|r Option |cff9c0909disabled|r: Soulstone Announce - Raid"
	end
end
L["SpellAnnouncer_SetOption_DC_Solo"] = function(v)
	if (v) then
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cenabled|r: Death Coil Announce - Solo"
	else
		return "|cff7702bfWarlockUtilities:|r Option |cff9c0909disabled|r: Death Coil Announce - Solo"
	end
end
L["SpellAnnouncer_SetOption_DC_Party"] = function(v)
	if (v) then
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cenabled|r: Death Coil Announce - Party"
	else
		return "|cff7702bfWarlockUtilities:|r Option |cff9c0909disabled|r: Death Coil Announce - Party"
	end
end
L["SpellAnnouncer_SetOption_DC_Raid"] = function(v)
	if (v) then
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cenabled|r: Death Coil Announce - Raid"
	else
		return "|cff7702bfWarlockUtilities:|r Option |cff9c0909disabled|r: Death Coil Announce - Raid"
	end
end
L["AnnounceSummon"] = function(t, d)
	return "Summoning " .. t .. " to " .. d .. ". Please click."
end
L["AnnounceSS"] = function(t)
	return "Soulstone on " .. t .. "."
end
L["AnnounceSSEmote"] = function(t)
	return "stores " .. t .. "'s soul."
end
L["AnnounceDC"] = "Yeet!"
L["AnnounceDCEmote"] = "yeets a green blob into the void."
L["UnknownDestination"] = " ...somewhere?... "
L["AppTray"] = "App Tray"
L["AppTray_Desc_Name"] = "App Tray Options"
L["AppTray_OptionGroup_Position_Name"] = "App Tray Positioning Options"
L["AppTray_OptionGroup_Position_Desc"] = "Controls which side of the screen the app tray docks to, and the offset from the center of that side."
L["AppTray_Option_Border_Name"] = "Anchor to Screen Border"
L["AppTray_Option_Border_Desc"] = "Sets which side of the screen to anchor the app tray to."
L["AppTray_Option_Border_Top"] = "Top"
L["AppTray_Option_Border_Bottom"] = "Bottom"
L["AppTray_Option_Border_Left"] = "Left"
L["AppTray_Option_Border_Right"] = "Right"
L["AppTray_SetOption_Border"] = function(v)
	if (v == 1) then
		return "|cff7702bfWarlockUtilities:|r AppTray anchored to |cff12ad0cTop|r border."
	elseif (v == 2) then
		return "|cff7702bfWarlockUtilities:|r AppTray anchored to |cff12ad0cBottom|r border."
	elseif (v == 3) then
		return "|cff7702bfWarlockUtilities:|r AppTray anchored to |cff12ad0cLeft|r border."
	else
		return "|cff7702bfWarlockUtilities:|r AppTray anchored to |cff12ad0cRight|r border."
	end
end
L["AppTray_Option_Offset_Name"] = "Offset"
L["AppTray_Option_Offset_Desc"] = "Sets the offset from the center of the anchored screen border."

--Misc
L["CombatLockdown"] = "Please wait until you are out of combat..."
L["MissingTradeItem"] = function(item)
	return "Missing AutoTrade Item: " .. item
end

--XML
L["Fill"] = "Fill Bags"
L["Clear"] = "Clear Shards"
L["Keep"] = "Keep Shards"
L["AutoDelete"] = "AutoDelete"
L["Bag"] = function(bag)
	return "Bag " .. bag
end
L["ByBag"] = "By Bag"
L["ByNumber"] = "By Number"
L["TotalShards"] = function(shards)
	return "Total Shards: " .. shards
end
L["ShardsToClear"] = function(shards)
	return "Shards To Clear: " .. shards
end
L["ShardsToKeep"] = function(shards)
	return "Shards To Keep: " .. shards
end
L["Trade"] = "Trade"
L["Use"] = "Use"
L["ShardManager_FrameHeader"] = function(v)
	return "Shard Manager v" .. v
end
L["AutoDelete_FrameHeader"] = function(v)
	return "AutoDelete v" .. v
end
L["StoneManager_FrameHeader"] = function(v)
	return "Stone Manager v" .. v
end
L["StoneManager_Counter"] = function(v)
	return "Total: " .. v
end
L["DemonManager_FrameHeader"] = function(v)
	return "Demon Manager v" .. v
end
L["StatsPanel_FrameHeader"] = function(v)
	return "Shard Usage Stats v" .. v
end
L["Sacrifice"] = "Sacrifice"
L["Dismiss"] = "Dismiss"
L["Heal"] = "Heal"
L["Soulwell"] = "Soulwell"
L["Healthstone"] = "Healthstone"
L["CreateHealthstone"] = function(level)
	t = {
		"Create Healthstone (Minor)",
		"Create Healthstone (Lesser)",
		"Create Healthstone",
		"Create Healthstone (Greater)",
		"Create Healthstone (Major)"
	}
	return t[level]
end
L["CreateSoulstone"] = function(level)
	t = {
		"Create Soulstone (Minor)",
		"Create Soulstone (Lesser)",
		"Create Soulstone",
		"Create Soulstone (Greater)",
		"Create Soulstone (Major)"
	}
	return t[level]
end
L["Soulstone"] = "Soulstone"
L["SummonDemon"] = function(level, shards, incubus)
	demons = {
		"Imp",
		"Voidwalker",
		"Succubus",
		"Felhunter",
		"Felguard",
		"Infernal",
		"Doomguard",
		"Subjugate"
	}
	if (level == 3 and incubus) then
		text = "Incubus"
	else
		text = demons[level]
	end
	if not (level == 1) then
		text = text .. " (" .. shards .. ")"
	end
	return text
end