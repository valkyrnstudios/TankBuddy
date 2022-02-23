local L = LibStub("AceLocale-3.0"):NewLocale("TankBuddy", "zhCN")

if not L then
    return
end

-- by Huijie

L["DisableInBG"] = "战场中停止使用";
L["Done"] = "确定!";
L["EnableTankBuddy"] = "开启坦克助手";
L["EnterNewMBRecoveryText"] = "输入补救嘲讽失败时所要发送的通知:";
L["General"] = "一般";
L["Help"] = "帮助";
L["output_buffremoved"] = "removed, matched"; -- As in ["Greater Blessing of Salvation" removed, matched "Salvation"]
L["TankBuddy"] = "坦克助手";
L["Test"] = "测试";
L["EnableAnnounce"] = "开启通知"

-- TODO create UI parent, merge titles under
-- TODO update intro/help dext for BCC and BlizzUI
L["IntroText"] =
    "Thank you for using Tank Buddy, formerly known as Taunt Buddy.\nTaunt Buddy was originally created by Artun Subasi, but since he stopped development, Kolthor from Doomhammer EU took over. Updated for 2.4 combatlog & Paladin support by Raeldar.\n\nTo the right there are a number of tabs, depending on your class. Each tab has options for announcement message, and channels to announce to under given circumstances."
L["HelpText"] =
    "Buff removal:\nTo remove unwanted buffs, there are two options; Always, and only in defensive stance/bear form/Righteous Fury.\nTank Buddy will look for buffs containing any of the text specified. To look for several buffs, just seperate with a comma (,). Note! You don't need to type the entire name of the buff, just portions. Example: \"Intellect, Spirit\" will look for any buffs that has the word \"Intellect\" or \"Spirit\" in it, and remove them. This will match \"Arcane Intellect\" and \"Prayer of Spirit\", but also the Scroll of Intellect and Sprit buffs and any other buff that has \"Intellect\" or \"Spirit\" in it's name.\n\nTabs:\nThe leftmost column of checkboxes controls which channels to send the announcement message to, if you are in a raid. The middle column, if you are in a party, and the rightmost column, if you are alone.\nIf you check any of the \"Custom\"-boxes, a window will appear where you can type in the custom channel(s), either by channel name or number. To specify more than one channel, seperate with a space.\nWhen you have selected some channels, you can click the \"Copy\"-button to copy your selection, and then click another tab, and click the \"Paste\"-button to use the same selection there.\nNote! This will overwrite any custom channels you might have typed, with the ones from the copied source.\nYou can specify a message in the editbox at the bottom, and use the variables listed below.\nIf you select \"Enable announcement for recovery of failed taunts\" in the taunt-tab, you can type a message to announce in the event that you successfully hit with a Mocking Blow, after a failed taunt. Note! This will only work until Taunt is no longer on cooldown, and only if your current target has the same name and level as the one that resisted the taunt.\n\nVariables:\nTaunt, Growl and Mocking Blow:\n$tn: Target Name (Same as %t)\n$tl: Target Level\n$tt: Target Type (Humanoid, Beast, Demon etc.)\n$ttn: Target's Target Name\n$ttl: Target's Target Level\n$ttt: Target's Target Type\n\nShield Wall, Challenging Shout, Challenging Roar, Last Stand and Lifegiving Gem:\n$sec: Duration of ability in seconds\n\nLast Stand and Lifegiving Gem:\n$hp: Amount of hitpoints gained by the ability.";

-- TODO merge into abilities
L["defaultText"] = {
    ["recovery"] = "- 我的惩戒痛击中抵抗我嘲讽的怪物! -"
}

L["Auras"] = {
    ["Salvation"] = "拯救",
    ["RF"] = "正义之怒"
}

L["Abilities"] = {
    ["CR"] = {
        ["Name"] = "挑战咆哮",
        ["Default"] = "- 我使用了挑战咆哮! 我需要大量加血在 $sec 秒内! -",
        ["Prompt"] = "输入新的通知在使用挑战咆哮的时:"
    },
    ["CS"] = {
        ["Name"] = "挑战怒吼",
        ["Default"] = "- 我使用了挑战怒吼! 我需要大量加血在 $sec 秒内! -",
        ["Prompt"] = "输入新的通知在使用挑战怒吼的时:"
    },
    ["Growl"] = {
        ["Name"] = "低吼",
        ["Default"] = "- 我的低吼被 $tn 抵抗了! -",
        ["Prompt"] = "输入新的通知在低吼被抵抗的时:",
        ["Immune"] = "- $tn 对低吼免疫! -"
    },
    ["LS"] = {
        ["Name"] = "破釜沉舟",
        ["Default"] = "- 我开启了破釜沉舟! 在 $sec 秒后我会掉血 $hpHP! -",
        ["Prompt"] = "输入新的通知在使用破釜沉舟时:"
    },
    ["MB"] = {
        ["Name"] = "惩戒痛击",
        ["Default"] = "- 我的惩戒痛击被 $tn! 抵抗了 -",
        ["Prompt"] = "输入新的通知在惩戒痛击失败时:"
    },
    ["RD"] = {
        ["Name"] = "正义防御",
        ["Default"] = "- 我的正义防御被 $tn! 抵抗了 -",
        ["Prompt"] = "输入新的通知在正义防御被抵抗时:",
        ["Immune"] = "- $tn 对正义防御免疫! -"
    },
    ["SW"] = {
        ["Name"] = "盾墙",
        ["Default"] = "- 我开启了盾墙!  在 $sec 秒内受到伤害降低 75%! -",
        ["Prompt"] = "输入新的通知在开启盾墙时:"
    },
    ["Taunt"] = {
        ["Name"] = "嘲讽",
        ["Default"] = "- 我的嘲讽被 $tn! 抵抗了 -",
        ["Prompt"] = "输入新的通知在嘲讽被抵抗时:",
        ["Immune"] = "- $tn 免疫嘲讽! -"
    }
}

L["Items"] = {
    ["Title"] = "物品和 BUFF",
    ["Default"] = [[坚韧,900 血量
精金护罩,1280 护甲
时之赐福,15.85%% 躲闪
方阵,15.85%% 格挡
保卫者的活力,1750 血量
超级坚韧,1750 血量
梦魇草,2000 血量
黎明石螃蟹,6.61%% 躲闪
天蓝宝石海龟,8.72%% 躲闪
强化反射,150 敏捷
转移,165 防等并降低仇恨
巨熊祝福,4070 护甲
]], -- TODO link into StatLogic for actual values
    ["Prompt"] = "每行输入一个项目通告: BUFF 名称,效果",
    ["Template"] = "- 我获得了 $effect 在 $sec 秒内 - "
}

L["RemoveBuffs"] = {
    ["Title"] = "BUFF 移除",
    ["Always"] = "始终移除的 BUFF:",
    ["DRUID"] = "只有在熊形态时:",
    ["WARRIOR"] = "只有在防御姿态时:",
    ["PALADIN"] = "只有在正义之怒开启时:"
}

L["Channel"] = {
    ["Emote"] = "表情",
    ["Yell"] = "大喊",
    ["Party"] = "小队",
    ["Raid"] = "团队",
    ["RaidWarning"] = "团队警告"
}
