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
L["StoneManager"] = "Stone Manager"
L["StoneManager_Desc_Name"] = "Stone Manager options."
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
L["StoneManager_Option_SS_1"] = "Minor"
L["StoneManager_Option_SS_2"] = "Lesser"
L["StoneManager_Option_SS_3"] = "Normal"
L["StoneManager_Option_SS_4"] = "Greater"
L["StoneManager_Option_SS_5"] = "Major"
L["StoneManager_OptionGroup_Trading_Name"] = "Trade Options"
L["StoneManager_OptionGroup_Trading_Desc"] = "Automatic stone trading options."
L["StoneManager_Option_EnableParty_Name"] = "Party"
L["StoneManager_Option_EnableParty_Desc"] = "Enable automatic healthstone trading for party members."
L["StoneManager_Option_EnableRaid_Name"] = "Raid"
L["StoneManager_Option_EnableRaid_Desc"] = "Enable automatic healthstone trading for raid members."
L["StoneManager_SetOption_HSLevel"] = function(value)
	if (value == 1) then
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cupdated|r: Healthstone - Rank - Minor"
	elseif (value == 2) then
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cupdated|r: Healthstone - Rank - Lesser"
	elseif (value == 3) then
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cupdated|r: Healthstone - Rank - Normal"
	elseif (value == 4) then
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cupdated|r: Healthstone - Rank - Greater"
	else
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cupdated|r: Healthstone - Rank - Major"
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
	else
		return "|cff7702bfWarlockUtilities:|r Option |cff12ad0cupdated|r: Soulstone - Rank - Major"
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
L["AnnounceSummon"] = function(t, d)
	return "Summoning " .. t .. " to " .. d .. ". Please click."
end
L["AnnounceSS"] = function(t)
	return "Soulstone on " .. t .. "."
end
L["AnnounceSSEmote"] = function(t)
	return "stores " .. t .. "'s soul."
end
L["UnknownDestination"] = " ...somewhere?... "

--Misc
L["CombatLockdown"] = "Please wait until you are out of combat..."
L["MissingTradeItem"] = function(item)
	return "Missing AutoTrade Item: " .. item
end

--XML
L["Fill"] = "Fill Bags"
L["Clear"] = "Clear Shards"
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
L["Trade"] = "Trade"
L["Use"] = "Use"
L["ShardManager_FrameHeader"] = function(v)
	return "Shard Manager v" .. v
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
L["SummonDemon"] = function(level, shards)
	demons = {
		"Imp",
		"Voidwalker",
		"Succubus",
		"Felhunter",
		"Felguard",
		"Infernal",
		"Doomguard",
		"Enslave"
	}
	text = demons[level]
	if not (level == 1) then
		text = text .. " (" .. shards .. ")"
	end
	return text
end