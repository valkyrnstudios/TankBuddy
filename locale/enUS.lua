local L = LibStub("AceLocale-3.0"):NewLocale("TankBuddy", "enUS", true)

-- by Raeldar, Artun Subasi, and Kolthor

L["DisableInBG"] = "Disable in battlegrounds";
L["Done"] = "done!";
L["EnableTankBuddy"] = "Enable Tank Buddy";
L["EnterNewMBRecoveryText"] = "Enter new announcement text for recovered taunts:";
L["General"] = "General";
L["Help"] = "Help";
L["output_buffremoved"] = "removed, matched"; -- As in ["Greater Blessing of Salvation" removed, matched "Salvation"]
L["TankBuddy"] = "Tank Buddy";
L["Test"] = "Test";
L["EnableAnnounce"] = "Enable announcement"

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
    ["Salvation"] = "Salvation",
    ["RF"] = "Righteous Fury"
}

L["Abilities"] = {
    ["CR"] = {
        ["Name"] = "Challenging Roar",
        ["Default"] = "- I activated Challenging Roar! I will need a lot of healing for $sec seconds! -",
        ["Prompt"] = "Enter new announcement text for using challenging roar:"
    },
    ["CS"] = {
        ["Name"] = "Challenging Shout",
        ["Default"] = "- I activated Challenging Shout! I will need a lot of healing for $sec seconds! -",
        ["Prompt"] = "Enter new announcement text for using challenging shout:"
    },
    ["Growl"] = {
        ["Name"] = "Growl",
        ["Default"] = "- My Growl has been resisted by $tn! -",
        ["Prompt"] = "Enter new announcement text for resisted growls:",
        ["Immune"] = "- $tn is immune to Growl! -"
    },
    ["LS"] = {
        ["Name"] = "Last Stand",
        ["Default"] = "- I activated Last Stand! In $sec seconds I will lose $hpHP! -",
        ["Prompt"] = "Enter new announcement text for using last stand:"
    },
    ["MB"] = {
        ["Name"] = "Mocking Blow",
        ["Default"] = "- My Mocking Blow failed against $tn! -",
        ["Prompt"] = "Enter new announcement text for failed mocking blows:"
    },
    ["RD"] = {
        ["Name"] = "Righteous Defense",
        ["Default"] = "- My Righteous Defense has been resisted by $tn! -",
        ["Prompt"] = "Enter new announcement text for resisted Righteous Defense:",
        ["Immune"] = "- $tn is immune to Righteous Defense! -"
    },
    ["SW"] = {
        ["Name"] = "Shield Wall",
        ["Default"] = "- I activated Shield Wall and will be taking 75% less damage for $sec seconds! -",
        ["Prompt"] = "Enter new announcement text for using shield wall:"
    },
    ["Taunt"] = {
        ["Name"] = "Taunt",
        ["Default"] = "- My Taunt has been resisted by $tn! -",
        ["Prompt"] = "Enter new announcement text for resisted taunts:",
        ["Immune"] = "- $tn is immune to Taunt! -"
    }
}

L["Items"] = {
    ["Title"] = "Items and buffs",
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
    ["Prompt"] = "Enter one item per line to announce: Buff name,Effect",
    ["Template"] = "- I gained $effect for $sec seconds - "
}

L["RemoveBuffs"] = {
    ["Title"] = "Buff removal",
    ["Always"] = "Always remove buffs containing:",
    ["DRUID"] = "Only in bear form:",
    ["WARRIOR"] = "Only defensive stance:",
    ["PALADIN"] = "Only when Righteous Fury is active:"
}

L["Channel"] = {
    ["Emote"] = "Emote",
    ["Yell"] = "Yell",
    ["Party"] = "Party",
    ["Raid"] = "Raid",
    ["RaidWarning"] = "Raid Warning"
}
