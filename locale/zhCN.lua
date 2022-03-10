local L = LibStub("AceLocale-3.0"):NewLocale("TankBuddy", "zhCN")

if not L then
    return
end

-- by Huijie Wei

L["DisableInBG"] = "战场内禁用";
L["Done"] = "结束!";
L["EnableTankBuddy"] = "开启坦克助手";
L["EnterNewMBRecoveryText"] = "输入新的通告文本当嘲讽被重置:";
L["General"] = "通用";
L["Help"] = "帮助";
L["output_buffremoved"] = "移除, 匹配"; -- As in ["Greater Blessing of Salvation" removed, matched "Salvation"]
L["TankBuddy"] = "坦克助手";
L["Test"] = "测试";
L["EnableAnnounce"] = "开启通告"

-- TODO create UI parent, merge titles under
-- TODO update intro/help dext for BCC and BlizzUI
L["IntroText"] =
    "Thank you for using Tank Buddy, formerly known as Taunt Buddy.\nTaunt Buddy was originally created by Artun Subasi, but since he stopped development, Kolthor from Doomhammer EU took over. Updated for 2.4 combatlog & Paladin support by Raeldar.\n\nTo the right there are a number of tabs, depending on your class. Each tab has options for announcement message, and channels to announce to under given circumstances."
L["HelpText"] =
    "Buff removal:\nTo remove unwanted buffs, there are two options; Always, and only in defensive stance/bear form/Righteous Fury.\nTank Buddy will look for buffs containing any of the text specified. To look for several buffs, just seperate with a comma (,). Note! You don't need to type the entire name of the buff, just portions. Example: \"Intellect, Spirit\" will look for any buffs that has the word \"Intellect\" or \"Spirit\" in it, and remove them. This will match \"Arcane Intellect\" and \"Prayer of Spirit\", but also the Scroll of Intellect and Sprit buffs and any other buff that has \"Intellect\" or \"Spirit\" in it's name.\n\nTabs:\nThe leftmost column of checkboxes controls which channels to send the announcement message to, if you are in a raid. The middle column, if you are in a party, and the rightmost column, if you are alone.\nIf you check any of the \"Custom\"-boxes, a window will appear where you can type in the custom channel(s), either by channel name or number. To specify more than one channel, seperate with a space.\nWhen you have selected some channels, you can click the \"Copy\"-button to copy your selection, and then click another tab, and click the \"Paste\"-button to use the same selection there.\nNote! This will overwrite any custom channels you might have typed, with the ones from the copied source.\nYou can specify a message in the editbox at the bottom, and use the variables listed below.\nIf you select \"Enable announcement for recovery of failed taunts\" in the taunt-tab, you can type a message to announce in the event that you successfully hit with a Mocking Blow, after a failed taunt. Note! This will only work until Taunt is no longer on cooldown, and only if your current target has the same name and level as the one that resisted the taunt.\n\nVariables:\nTaunt, Growl and Mocking Blow:\n$tn: Target Name (Same as %t)\n$tl: Target Level\n$tt: Target Type (Humanoid, Beast, Demon etc.)\n$ttn: Target's Target Name\n$ttl: Target's Target Level\n$ttt: Target's Target Type\n\nShield Wall, Challenging Shout, Challenging Roar, Last Stand and Lifegiving Gem:\n$sec: Duration of ability in seconds\n\nLast Stand and Lifegiving Gem:\n$hp: Amount of hitpoints gained by the ability.";

-- TODO merge into abilities
L["defaultText"] = {
    ["recovery"] = "- My Mocking Blow RECOVERED my resisted taunt! -"
}

L["Auras"] = {
    ["Salvation"] = "拯救",
    ["RF"] = "正义之怒"
}

L["Abilities"] = {
    ["CR"] = {
        ["Name"] = "挑战咆哮",
        ["Default"] = "- 我开启了群嘲! 在 $sec 秒内加好我! -",
        ["Prompt"] = "输入新的通告文本当开启挑战咆哮后:"
    },
    ["CS"] = {
        ["Name"] = "挑战怒吼",
        ["Default"] = "- 我开启了群嘲! 在 $sec 秒内加好我! -",
        ["Prompt"] = "输入新的通告文本当开启挑战怒吼后:"
    },
    ["Growl"] = {
        ["Name"] = "低吼",
        ["Default"] = "- 我的低吼被 $tn 抵抗了! -",
        ["Prompt"] = "输入新的通告文本当低吼被抵抗后:",
        ["Immune"] = "- $tn 免疫了低吼! -"
    },
    ["LS"] = {
        ["Name"] = "破釜沉舟",
        ["Default"] = "- 我开启了破釜沉舟! $sec 秒后我会损失 $hp 血量! -",
        ["Prompt"] = "输入新的通告文本当开启破釜沉舟后:"
    },
    ["MB"] = {
        ["Name"] = "惩戒痛击",
        ["Default"] = "- 我的惩戒痛击攻击 $tn 失败了! -",
        ["Prompt"] = "输入新的通告文本当惩戒痛击攻击失败后:"
    },
    ["RD"] = {
        ["Name"] = "正义防御",
        ["Default"] = "- 我的正义防御被 $tn 抵抗了! -",
        ["Prompt"] = "输入新的通告文本当正义防御被抵抗后:",
        ["Immune"] = "- $tn 免疫了正义防御! -"
    },
    ["SW"] = {
        ["Name"] = "盾墙",
        ["Default"] = "- 我开启了盾墙! 在 $sec 秒内受到伤害降低 75%! -",
        ["Prompt"] = "输入新的通告文本当开启盾墙后:"
    },
    ["Taunt"] = {
        ["Name"] = "嘲讽",
        ["Default"] = "- 我的嘲讽被 $tn 抵抗了! -",
        ["Prompt"] = "输入新的通告文本当嘲讽被抵抗后:",
        ["Immune"] = "- $tn 免疫了嘲讽! -"
    }
}

L["Items"] = {
    ["Title"] = "物品和增益",
    ["Default"] = [[Tenacity,900 health
Adamantine Shell,1280 armor
Time's Favor,15.85%% dodge
Phalanx,15.85%% block
Protector's Vigor,1750 health
Nightmare Seed,2000 health
Dawnstone Crab,6.61%% dodge
Empyrean Tortoise,8.72%% dodge
Heightened Reflexes,150 agility
Displacement,165 defense but less threat
Ursine Blessing,4070 armor
]], -- TODO link into StatLogic for actual values
    ["Prompt"] = "每行输入一个项目通告: 增益名称,效果",
    ["Template"] = "- 我获得了 $effect, 持续 $sec 秒 - "
}

L["RemoveBuffs"] = {
    ["Title"] = "增益移除",
    ["Always"] = "总是移除以下增益:",
    ["DRUID"] = "仅在熊形态:",
    ["WARRIOR"] = "仅在防御姿态:",
    ["PALADIN"] = "仅在开启正义之怒:"
}

L["Channel"] = {
    ["Emote"] = "Emote",
    ["Yell"] = "Yell",
    ["Party"] = "Party",
    ["Raid"] = "Raid",
    ["RaidWarning"] = "Raid Warning"
}
