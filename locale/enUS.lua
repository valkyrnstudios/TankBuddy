local L = LibStub("AceLocale-3.0"):NewLocale("TankBuddy", "enUS", true)

--[[
- Tank Buddy v2.4b3
  - English
    - by Raeldar
    - last changed: August 1st, 2008
    - from Tank Buddy 2.1
    - by Artun Subasi and Kolthor
--]]

L["TankBuddy"] = "Tank Buddy";
L["EnableTankBuddy"] = "Enable Tank Buddy";
L["Raid"] = "Raid";
L["Party"] = "Party";
L["Alone"] = "Alone";
L["AnnouncementChannel"] = "Announcement Channel";
L["AnnouncementTexts"] = "Announcement Texts";
L["SetCustomChannel"] = "Set Custom Channel";
L["EnterChannelName"] = "Enter channel name or number:";
L["Close"] = "Close";
L["Help"] = "Help";
L["Test"] = "Test";
L["Copy"] = "Copy";
L["Paste"] = "Paste";
L["General"] = "General";
L["Taunt"] = "Taunt";
L["MB"] = "Mocking Blow";
L["LS"] = "Last Stand";
L["SW"] = "Shield Wall";
L["LG"] = "Lifegiving Gem";
L["CS"] = "Challenging Shout";
L["Growl"] = "Growl";
L["CR"] = "Challenging Roar";
L["RD"] = "Righteous Defense";
L["RF"] = "Righteous Fury";
L["Parry"] = "Parry";

L["EnterNewText"] = {
    ["Taunt"] = "Enter new announcement text for resisted taunts:",
    ["MB"] = "Enter new announcement text for failed mocking blows:",
    ["LS"] = "Enter new announcement text for using last stand:",
    ["SW"] = "Enter new announcement text for using shield wall:",
    ["LG"] = "Enter new announcement text for using lifegiving gem:",
    ["CS"] = "Enter new announcement text for using challenging shout:",
    ["Growl"] = "Enter new announcement text for resisted growls:",
    ["CR"] = "Enter new announcement text for using challenging roar:",
    ["RD"] = "Enter new announcement text for resisted Righteous Defense:",
    ["Parry"] = "Enter new announcement text for boss parry:"
}
L["EnterNewMBRecoveryText"] =
    "Enter new announcement text for recovered taunts:";
L["RemoveBuffs"] = "Buff removal";
L["RemoveBuffsAlways"] = "Always remove buffs containing:";
L["DisableInBG"] = "Disable in battlegrounds";
L["RemoveBuffsDefensive"] = "Only defensive stance:";
L["RemoveBuffsBear"] = "Only in bear form:";
L["RemoveBuffsPally"] = "Only when Righteous Fury is active:";
L["EnableMBRecovery"] = "Enable announcement for recovery of failed taunts";
L["ParryWarnings"] = "Enable parry warning whispers";

L["IntroText"] =
    "Thank you for using Tank Buddy, formerly known as Taunt Buddy.\nTaunt Buddy was originally created by Artun Subasi, but since he stopped development, Kolthor from Doomhammer EU took over. Updated for 2.4 combatlog & Paladin support by Raeldar.\n\nTo the right there are a number of tabs, depending on your class. Each tab has options for announcement message, and channels to announce to under given circumstances."
L["HelpText"] =
    "Buff removal:\nTo remove unwanted buffs, there are two options; Always, and only in defensive stance/bear form/Righteous Fury.\nTank Buddy will look for buffs containing any of the text specified. To look for several buffs, just seperate with a comma (,). Note! You don't need to type the entire name of the buff, just portions. Example: \"Intellect, Spirit\" will look for any buffs that has the word \"Intellect\" or \"Spirit\" in it, and remove them. This will match \"Arcane Intellect\" and \"Prayer of Spirit\", but also the Scroll of Intellect and Sprit buffs and any other buff that has \"Intellect\" or \"Spirit\" in it's name.\n\nTabs:\nThe leftmost column of checkboxes controls which channels to send the announcement message to, if you are in a raid. The middle column, if you are in a party, and the rightmost column, if you are alone.\nIf you check any of the \"Custom\"-boxes, a window will appear where you can type in the custom channel(s), either by channel name or number. To specify more than one channel, seperate with a space.\nWhen you have selected some channels, you can click the \"Copy\"-button to copy your selection, and then click another tab, and click the \"Paste\"-button to use the same selection there.\nNote! This will overwrite any custom channels you might have typed, with the ones from the copied source.\nYou can specify a message in the editbox at the bottom, and use the variables listed below.\nIf you select \"Enable announcement for recovery of failed taunts\" in the taunt-tab, you can type a message to announce in the event that you successfully hit with a Mocking Blow, after a failed taunt. Note! This will only work until Taunt is no longer on cooldown, and only if your current target has the same name and level as the one that resisted the taunt.\n\nVariables:\nTaunt, Growl and Mocking Blow:\n$tn: Target Name (Same as %t)\n$tl: Target Level\n$tt: Target Type (Humanoid, Beast, Demon etc.)\n$ttn: Target's Target Name\n$ttl: Target's Target Level\n$ttt: Target's Target Type\n\nShield Wall, Challenging Shout, Challenging Roar, Last Stand and Lifegiving Gem:\n$sec: Duration of ability in seconds\n\nLast Stand and Lifegiving Gem:\n$hp: Amount of hitpoints gained by the ability.";

L["Channel_Ctraid"] = "CTRaid";
L["Channel_RaidWarning"] = "Raid Warning";
L["Channel_Raid"] = "Raid";
L["Channel_Guild"] = "Guild";
L["Channel_Party"] = "Party";
L["Channel_Yell"] = "Yell";
L["Channel_Say"] = "Say";
L["Channel_Custom"] = "Custom";

L["defaultText"] = {
    ["Taunt"] = "- My Taunt has been resisted by $tn! -",
    ["MB"] = "- My Mocking Blow failed against $tn! -",
    ["LS"] = "- I activated Last Stand! In $sec seconds I will lose $hpHP! -",
    ["SW"] = "- I activated Shield Wall and will be taking 75% less damage for $sec seconds! -",
    ["LG"] = "- I activated Lifegiving Gem! In $sec seconds I will lose $hpHP! -",
    ["CS"] = "- I activated Challenging Shout! I will need a lot of healing for $sec seconds! -",
    ["Growl"] = "- My Growl has been resisted by $tn! -",
    ["CR"] = "- I activated Challenging Roar! I will need a lot of healing for $sec seconds! -",
    ["RD"] = "- My Righteous Defense has been resisted by $tn! -",
    ["Parry"] = " - Your $skill has been parried, get behind the boss! = "
}
L["defaultText_r"] = "- My Mocking Blow RECOVERED my resisted taunt! -";

L["salvation"] = "Salvation";
L["intellect"] = "Intellect";
L["wisdom"] = "Wisdom";
L["Taunt"] = "Taunt";
L["MB"] = "Mocking Blow";
L["LS"] = "Berserker Rage"; -- "Last Stand";
L["SW"] = "Shield Wall";
L["LG"] = "Lifegiving Gem";
L["CS"] = "Challenging Shout";
L["Growl"] = "Growl";
L["CR"] = "Challenging Roar";
L["RD"] = "Righteous Defense";
L["RF"] = "Righteous Fury";
L["FR"] = "Fel Rage";
L["Parry"] = "Parry";

L["output_buffremoved"] = " removed, matched "; -- As in ["Greater Blessing of Salvation" removed, matched "Salvation"]
L["output_startup"] = " loaded. Type /TB for options.";
L["output_alreadyOff"] = "Tank Buddy is already disabled.";
L["output_alreadyOn"] = "Tank Buddy is already enabled.";
L["output_off"] = "Tank Buddy off.";
L["output_on"] = "Tank Buddy on.";

L["cmd_on"] = "on";
L["cmd_off"] = "off";

