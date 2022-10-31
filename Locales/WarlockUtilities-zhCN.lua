--本汉化文件由来自 五区 范克瑞斯 红领巾公会的术士芙蓉花花 手翻完成 2022-10-31

local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("WarlockUtilities", "zhCN")
if not L then return end

--AddOn name
L["WU"] = "WarlockUtilities"

--AddOn Enable/Disable messages
L["AddonEnabled"] = function(v,a)
	return "|cff7702bfWarlockUtilities:|r 版本号：" .. v .. " 作者：" .. a .. "。 已完成加载。"
end
L["AddonDisabled"] = function()
	return L["WU"] .. " 已关闭。"
end

--Comm messaging
L["CommPrefix"] = "Ace3 Prefix"
L["CommMessage"] = "Ace3 Comms Message"

--Options
L["Options_Desc_Name"] = "点击左侧菜单右侧的加号按钮，展开WarlockUtilities设置功能。"
L["ShardManager"] = "灵魂碎片管理"
L["ShardManager_Desc_Name"] = "灵魂碎片管理设置"
L["ShardManager_OptionGroup_Type_Name"] = "灵魂碎片管理类型"
L["ShardManager_OptionGroup_Type_Desc"] = "设置灵魂碎片管理是按背包还是按碎片数进行搜索。"
L["ShardManager_Option_TypeByBag"] = "按背包管理"
L["ShardManager_Option_TypeByNumber"] = "按碎片数量管理"
L["ShardManager_Option_Reverse_Name"] = "反向删除"
L["ShardManager_Option_Reverse_Desc"] = "先删最后一个袋子的，就是反向删除。"
L["ShardManager_Option_AutoDelete_Enable_Name"] = "开启自动清理碎片"
L["ShardManager_Option_AutoDelete_Enable_Desc"] = "开启或关闭自动清理碎片，保留至少下方设置的碎片数量的灵魂碎片。"
L["ShardManager_Option_AutoDelete_Number_Name"] = "保留碎片数量"
L["ShardManager_Option_AutoDelete_Number_Desc"] = "超过保留碎片数量的灵魂碎片将被自动删除。"
L["ShardManager_SetOption_Reverse"] = function(value)
	if (value) then
		return "|cff7702bfWarlockUtilities:|r 设置 |cff12ad0c开启|r: 反向删除"
	else
		return "|cff7702bfWarlockUtilities:|r 设置 |cff9c0909disabled|r: 反向删除"
	end
end
L["ShardManager_SetOption_AutoDelete"] = function(value)
	if (value) then
		return "|cff7702bfWarlockUtilities:|r 设置 |cff12ad0c开启|r: 自动清理碎片"
	else
		return "|cff7702bfWarlockUtilities:|r 设置 |cff9c0909关闭|r: 自动清理碎片"
	end
end
L["ShardManager_SetOption_AutoDelete_Number"] = function(value)
	return "|cff7702bfWarlockUtilities:|r 自动清理碎片 - 最少保留碎片数量: |cff12ad0cenabled|r" .. value
end
L["StoneManager"] = "灵魂石管理"
L["StoneManager_Desc_Name"] = "灵魂石管理设置"
L["StoneManager_OptionGroup_Delete_Name"] = "碎片删除选项"
L["StoneManager_OptionGroup_Delete_Desc"] = "灵魂碎片删除选项"
L["ShardManager_OptionGroup_AutoDelete_Name"] = "自动删除"
L["ShardManager_OptionGroup_AutoDelete_Desc"] = "这个选项用于控制是否自动删除碎片"
L["StoneManager_Option_Soulwell_Enable_Name"] = "启动灵魂之井"
L["StoneManager_Option_Soulwell_Enable_Desc"] = "如果灵魂之井没有在冷却，会启用灵魂之井。"
L["StoneManager_OptionGroup_Level_Name"] = "灵魂石等级选项"
L["StoneManager_OptionGroup_Level_Desc"] = "灵魂石等级选项"
L["StoneManager_Option_HS_Name"] = "治疗石等级"
L["StoneManager_Option_HS_Desc"] = "设置制造的治疗石的等级"
L["StoneManager_Option_SS_Name"] = "灵魂石等级"
L["StoneManager_Option_HS_Desc"] = "设置要制造的灵魂石的等级"
L["StoneManager_Option_HS_1"] = "初级"
L["StoneManager_Option_HS_2"] = "次级"
L["StoneManager_Option_HS_3"] = "普通"
L["StoneManager_Option_HS_4"] = "强效"
L["StoneManager_Option_HS_5"] = "特效"
L["StoneManager_Option_HS_6"] = "极效"
L["StoneManager_Option_HS_7"] = "恶魔"
L["StoneManager_Option_HS_8"] = "邪能"
L["StoneManager_Option_SS_1"] = "初级"
L["StoneManager_Option_SS_2"] = "次级"
L["StoneManager_Option_SS_3"] = "普通"
L["StoneManager_Option_SS_4"] = "强效"
L["StoneManager_Option_SS_5"] = "特效"
L["StoneManager_Option_SS_6"] = "极效"
L["StoneManager_Option_SS_7"] = "恶魔"
L["StoneManager_OptionGroup_Trading_Name"] = "交易选项"
L["StoneManager_OptionGroup_Trading_Desc"] = "自动交易设置"
L["StoneManager_Option_EnableParty_Name"] = "小队"
L["StoneManager_Option_EnableParty_Desc"] = "自动交易治疗石给 小队 成员。"
L["StoneManager_Option_EnableRaid_Name"] = "团队"
L["StoneManager_Option_EnableRaid_Desc"] = "自动交易治疗石给 团队 成员。"
L["StoneManager_SetOption_SoulwellEnabled"] = function(value)
	if (value) then
		return "|cff7702bfWarlockUtilities:|r 设置 |cff12ad0c开启|r: Soulwell"
	else
		return "|cff7702bfWarlockUtilities:|r 设置 |cff9c0909关闭|r: Soulwell"
	end
end
L["StoneManager_SetOption_HSLevel"] = function(value)
	if (value == 1) then
		return "|cff7702bfWarlockUtilities:|r 设置 |cff12ad0c更新|r: 初级治疗石"
	elseif (value == 2) then
		return "|cff7702bfWarlockUtilities:|r 设置 |cff12ad0c更新|r: 次级治疗石"
	elseif (value == 3) then
		return "|cff7702bfWarlockUtilities:|r 设置 |cff12ad0c更新|r: 治疗石"
	elseif (value == 4) then
		return "|cff7702bfWarlockUtilities:|r 设置 |cff12ad0c更新|r: 强效治疗石"
	elseif (value == 5) then
		return "|cff7702bfWarlockUtilities:|r 设置 |cff12ad0c更新|r: 特效治疗石"
	elseif (value == 6) then
		return "|cff7702bfWarlockUtilities:|r 设置 |cff12ad0c更新|r: 极效治疗石"
	elseif (value == 7) then
		return "|cff7702bfWarlockUtilities:|r 设置 |cff12ad0c更新|r: 恶魔治疗石"
	else
		return "|cff7702bfWarlockUtilities:|r 设置 |cff12ad0c更新|r: 邪能治疗石"
	end
end
L["StoneManager_SetOption_SSLevel"] = function(value)
	if (value == 1) then
		return "|cff7702bfWarlockUtilities:|r 设置 |cff12ad0c更新|r: 初级灵魂石"
	elseif (value == 2) then
		return "|cff7702bfWarlockUtilities:|r 设置 |cff12ad0c更新|r: 次级灵魂石"
	elseif (value == 3) then
		return "|cff7702bfWarlockUtilities:|r 设置 |cff12ad0c更新|r: 灵魂石"
	elseif (value == 4) then
		return "|cff7702bfWarlockUtilities:|r 设置 |cff12ad0c更新|r: 强效灵魂石"
	elseif (value == 5) then
		return "|cff7702bfWarlockUtilities:|r 设置 |cff12ad0c更新|r: 特效灵魂石"
	elseif (value == 6) then
		return "|cff7702bfWarlockUtilities:|r 设置 |cff12ad0c更新|r: 极效灵魂石"
	else
		return "|cff7702bfWarlockUtilities:|r 设置 |cff12ad0c更新|r: 恶魔灵魂石"
	end
end
L["StoneManager_SetOption_TradingParty"] = function(value)
	if (value) then
		return "|cff7702bfWarlockUtilities:|r 设置 |cff12ad0c开启|r: 小队交易"
	else
		return "|cff7702bfWarlockUtilities:|r 设置 |cff9c0909关闭|r: 小队交易"
	end
end
L["StoneManager_SetOption_TradingRaid"] = function(value)
	if (value) then
		return "|cff7702bfWarlockUtilities:|r 设置 |cff12ad0c开启|r: 团队交易"
	else
		return "|cff7702bfWarlockUtilities:|r 设置 |cff9c0909关闭|r: 团队交易"
	end
end
L["DemonManager"] = "宠物管理"
L["DemonManager_Desc_Name"] = "宠物管理设置"
L["DemonManager_Hint_Name"] = "提示：在宠物相关按钮上滚动鼠标的滚轮，即可切换不同的术士恶魔宠物。"
L["DemonManager_Option_Incubus_Name"] = "男魅魔"
L["DemonManager_Option_Incubus_Desc"] = "开启使用男魅魔而不是女魅魔"
L["DemonManager_SetOption_Incubus"] = function(value)
	if (value) then
		return "|cff7702bfWarlockUtilities:|r 设置 |cff12ad0c开启|r: 男魅魔"
	else
		return "|cff7702bfWarlockUtilities:|r 设置 |cff9c0909关闭|r: 男魅魔"
	end
end
L["DemonManager_SetOption_IncubusError"] = "|cff7702bfWarlockUtilities:|r 设置 |cff9c0909关闭|r: 男魅魔 (这个技能你还没有学习)"
L["Option_Help_Name"] = "帮助"
L["Option_Help_Desc"] = "查看帮助相关选项"
L["Option_Help_Lines"] = function()
	return {
		"|cff7702bfWarlockUtilities 输入:|r",
		"/wu | /warlockutils | /warlockutilities",
		"  { 设置 | 帮助 | 碎片 | 灵魂石 | 宠物}",
		"- |cff7702bf设置|r: 打开插件设置面板",
		"- |cff7702bf帮助|r: 查看帮助相关选项",
		"- |cff7702bf碎片|r: 打开碎片管理面板。",
		"- |cff7702bf灵魂石|r: 打开灵魂石管理面板。",
		"- |cff7702bf宠物|r: 打开宠物管理面板。"
	}
end
L["Option_Config_Name"] = "设置"
L["Option_Config_Desc"] = "打开设置菜单"
L["SpellAnnouncer"] = "技能通报"
L["SpellAnnouncer_Desc_Name"] = "技能通报设置"
L["SpellAnnouncer_OptionGroup_Summon_Name"] = "集合石通报设置"
L["SpellAnnouncer_OptionGroup_Summon_Desc"] = "自动集合石拉人通报选项"
L["SpellAnnouncer_Option_Summon_EnableParty_Name"] = "队伍"
L["SpellAnnouncer_Option_Summon_EnableParty_Desc"] = "在 队伍 的时候启用拉人通报"
L["SpellAnnouncer_Option_Summon_EnableRaid_Name"] = "团队"
L["SpellAnnouncer_Option_Summon_EnableRaid_Desc"] = "在 团队 的时候启用拉人通报"
L["SpellAnnouncer_OptionGroup_SS_Name"] = "灵魂石通报设置"
L["SpellAnnouncer_OptionGroup_SS_Desc"] = "自动灵魂石通报选项"
L["SpellAnnouncer_Option_SS_EnableSolo_Name"] = "单人"
L["SpellAnnouncer_Option_SS_EnableSolo_Desc"] = "在 单人 的时候启用绑灵魂石通报"
L["SpellAnnouncer_Option_SS_EnableParty_Name"] = "队伍"
L["SpellAnnouncer_Option_SS_EnableParty_Desc"] = "在 队伍 的时候启用绑灵魂石通报"
L["SpellAnnouncer_Option_SS_EnableRaid_Name"] = "团队"
L["SpellAnnouncer_Option_SS_EnableRaid_Desc"] = "在 团队 的时候启用绑灵魂石通报"
L["SpellAnnouncer_OptionGroup_DC_Name"] = "死亡缠绕通报设置"
L["SpellAnnouncer_OptionGroup_DC_Desc"] = "自动死亡缠绕通报选项"
L["SpellAnnouncer_Option_DC_EnableSolo_Name"] = "单人"
L["SpellAnnouncer_Option_DC_EnableSolo_Desc"] = "在 单人 的时候启用死亡缠绕通报"
L["SpellAnnouncer_Option_DC_EnableParty_Name"] = "队伍"
L["SpellAnnouncer_Option_DC_EnableParty_Desc"] = "在 队伍 的时候启用死亡缠绕通报"
L["SpellAnnouncer_Option_DC_EnableRaid_Name"] = "团队"
L["SpellAnnouncer_Option_DC_EnableRaid_Desc"] = "在 团队 的时候启用死亡缠绕通报"
L["SpellAnnouncer_SetOption_Summon_Party"] = function(v)
	if (v) then
		return "|cff7702bfWarlockUtilities:|r 设置 |cff12ad0c开启|r: 拉人通报 - 队伍"
	else
		return "|cff7702bfWarlockUtilities:|r 设置 |cff9c0909关闭|r: 拉人通报 - 队伍"
	end
end
L["SpellAnnouncer_SetOption_Summon_Raid"] = function(v)
	if (v) then
		return "|cff7702bfWarlockUtilities:|r 设置 |cff12ad0c开启|r: 拉人通报 - 团队"
	else
		return "|cff7702bfWarlockUtilities:|r 设置 |cff9c0909关闭|r: 拉人通报 - 团队"
	end
end
L["SpellAnnouncer_SetOption_SS_Solo"] = function(v)
	if (v) then
		return "|cff7702bfWarlockUtilities:|r 设置 |cff12ad0c开启|r: 绑灵魂石通报 - Solo"
	else
		return "|cff7702bfWarlockUtilities:|r 设置 |cff9c0909关闭|r: 绑灵魂石通报 - Solo"
	end
end
L["SpellAnnouncer_SetOption_SS_Party"] = function(v)
	if (v) then
		return "|cff7702bfWarlockUtilities:|r 设置 |cff12ad0c开启|r: 绑灵魂石通报 - 队伍"
	else
		return "|cff7702bfWarlockUtilities:|r 设置 |cff9c0909关闭|r: 绑灵魂石通报 - 队伍"
	end
end
L["SpellAnnouncer_SetOption_SS_Raid"] = function(v)
	if (v) then
		return "|cff7702bfWarlockUtilities:|r 设置 |cff12ad0c开启|r: 绑灵魂石通报 - 团队"
	else
		return "|cff7702bfWarlockUtilities:|r Option |cff9c0909关闭|r: 绑灵魂石通报 - 团队"
	end
end
L["SpellAnnouncer_SetOption_DC_Solo"] = function(v)
	if (v) then
		return "|cff7702bfWarlockUtilities:|r 设置 |cff12ad0c开启|r: 死亡缠绕通报 - Solo"
	else
		return "|cff7702bfWarlockUtilities:|r 设置 |cff9c0909关闭|r: 死亡缠绕通报 - Solo"
	end
end
L["SpellAnnouncer_SetOption_DC_Party"] = function(v)
	if (v) then
		return "|cff7702bfWarlockUtilities:|r 设置 |cff12ad0c开启|r: 死亡缠绕通报 - 队伍"
	else
		return "|cff7702bfWarlockUtilities:|r 设置 |cff9c0909关闭|r: 死亡缠绕通报 - 队伍"
	end
end
L["SpellAnnouncer_SetOption_DC_Raid"] = function(v)
	if (v) then
		return "|cff7702bfWarlockUtilities:|r 设置 |cff12ad0c开启|r: 死亡缠绕通报 - 团队"
	else
		return "|cff7702bfWarlockUtilities:|r 设置 |cff9c0909disabled|r: 死亡缠绕通报 - 团队"
	end
end
L["AnnounceSummon"] = function(t, d)
	return "我正在拉 " .. t .. " 到 " .. d .. "来，请旁边的队友帮忙点门。"
end
L["AnnounceSS"] = function(t)
	return "灵魂石已绑 " .. t
end
L["AnnounceSSEmote"] = function(t)
	return "我绑灵魂石给 " .. t .. "'了。"
end
L["AnnounceDC"] = "对！"
L["AnnounceDCEmote"] = "yeets a green blob into the void."
L["UnknownDestination"] = "发生了未知的情况"
L["AppTray"] = "图标位置"
L["AppTray_Desc_Name"] = "图标位置设置"
L["AppTray_OptionGroup_Position_Name"] = "图标位置选项"
L["AppTray_OptionGroup_Position_Desc"] = "控制图标贴靠的方位，以及相对应的锚点偏移。"
L["AppTray_Option_Border_Name"] = "设置图标锚定在屏幕的哪个方位"
L["AppTray_Option_Border_Desc"] = "设置后会贴在你所设置的那个边。"
L["AppTray_Option_Border_Top"] = "顶部"
L["AppTray_Option_Border_Bottom"] = "底部"
L["AppTray_Option_Border_Left"] = "靠左"
L["AppTray_Option_Border_Right"] = "靠右"
L["AppTray_SetOption_Border"] = function(v)
	if (v == 1) then
		return "|cff7702bfWarlockUtilities:|r 设置锚点位于 |cff12ad0c顶部|r 边缘."
	elseif (v == 2) then
		return "|cff7702bfWarlockUtilities:|r 设置锚点位于 |cff12ad0c底部|r 边缘."
	elseif (v == 3) then
		return "|cff7702bfWarlockUtilities:|r 设置锚点位于 |cff12ad0c靠左|r 边缘."
	else
		return "|cff7702bfWarlockUtilities:|r 设置锚点位于 |cff12ad0c靠右|r 边缘."
	end
end
L["AppTray_Option_Offset_Name"] = "位置偏移"
L["AppTray_Option_Offset_Desc"] = "当设置为顶部或底部是，是水平偏移；当设置为靠左或靠右时，是垂直偏移。"

--Misc
L["CombatLockdown"] = "请等待当前战斗的退出"
L["MissingTradeItem"] = function(item)
	return "未找到可自动交易的物品：" .. item
end
L["HardwareRequired"] = "这个功能需要主动执行，你必须使用快捷键或宏才可以。"

--XML
L["Fill"] = "全部背包"
L["Clear"] = "清理碎片"
L["Keep"] = "记录碎片"
L["AutoDelete"] = "自动删除"
L["Bag"] = function(bag)
	return "背包： " .. bag
end
L["ByBag"] = "通过背包"
L["ByNumber"] = "通过数量"
L["TotalShards"] = function(shards)
	return "碎片总数：" .. shards
end
L["ShardsToClear"] = function(shards)
	return "清理碎片：" .. shards
end
L["ShardsToKeep"] = function(shards)
	return "记录碎片：" .. shards
end
L["Trade"] = "交易"
L["Use"] = "使用"
L["ShardManager_FrameHeader"] = function(v)
	return "碎片管理 v" .. v
end
L["AutoDelete_FrameHeader"] = function(v)
	return "自动删除 v" .. v
end
L["StoneManager_FrameHeader"] = function(v)
	return "灵魂石管理 v" .. v
end
L["StoneManager_Counter"] = function(v)
	return "全部：" .. v
end
L["DemonManager_FrameHeader"] = function(v)
	return "宠物管理r v" .. v
end
L["StatsPanel_FrameHeader"] = function(v)
	return "碎片使用统计 v" .. v
end
L["Sacrifice"] = "牺牲"
L["Dismiss"] = "解散"
L["Heal"] = "治疗"
L["Soulwell"] = "灵魂之井"
L["Healthstone"] = "治疗石"
L["CreateHealthstone"] = function(level)
	t = {
		"制造初级治疗石",
		"制造次级治疗石",
		"制造治疗石",
		"制造强效治疗石",
		"制造特效治疗石"
	}
	return t[level]
end
L["CreateSoulstone"] = function(level)
	t = {
		"制造初级灵魂石",
		"制造次级灵魂石",
		"制造灵魂石",
		"制造强效灵魂石",
		"制造特效灵魂石"
	}
	return t[level]
end
L["Soulstone"] = "灵魂石"
L["SummonDemon"] = function(level, shards, incubus)
	demons = {
		"小鬼",
		"胖子",
		"魅魔",
		"狗",
		"恶魔卫士",
		"地狱火",
		"末日守卫",
		"恶魔"
	}
	if (level == 3 and incubus) then
		text = "男魅魔"
	else
		text = demons[level]
	end
	if not (level == 1) then
		text = text .. " (" .. shards .. ")"
	end
	return text
end