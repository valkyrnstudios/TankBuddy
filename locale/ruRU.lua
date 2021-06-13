local L = LibStub("AceLocale-3.0"):NewLocale("TankBuddy", "ruRU")

-- by Zeizwell

L["DisableInBG"] = "Отключить на полях боя";
L["Done"] = "Выполнено!";
L["EnableTankBuddy"] = "Включить Tank Buddy";
L["EnterNewMBRecoveryText"] =
    "Введите новый текст объявления для восстановленных насмешек:";
L["General"] = "Общий";
L["Help"] = "Помощь";
L["output_buffremoved"] = " удаленный, совпадает ";
L["TankBuddy"] = "Танк Бадди";
L["Test"] = "тест";
L["EnableAnnounce"] = "Включить объявление"

L["IntroText"] =
    "Thank you for using Tank Buddy, formerly known as Taunt Buddy.\nTaunt Buddy was originally created by Artun Subasi, but since he stopped development, Kolthor from Doomhammer EU took over. Updated for 2.4 combatlog & Paladin support by Raeldar.\n\nTo the right there are a number of tabs, depending on your class. Each tab has options for announcement message, and channels to announce to under given circumstances."
L["HelpText"] =
    "Buff removal:\nTo remove unwanted buffs, there are two options; Always, and only in defensive stance/bear form/Righteous Fury.\nTank Buddy will look for buffs containing any of the text specified. To look for several buffs, just seperate with a comma (,). Note! You don't need to type the entire name of the buff, just portions. Example: \"Intellect, Spirit\" will look for any buffs that has the word \"Intellect\" or \"Spirit\" in it, and remove them. This will match \"Arcane Intellect\" and \"Prayer of Spirit\", but also the Scroll of Intellect and Sprit buffs and any other buff that has \"Intellect\" or \"Spirit\" in it's name.\n\nTabs:\nThe leftmost column of checkboxes controls which channels to send the announcement message to, if you are in a raid. The middle column, if you are in a party, and the rightmost column, if you are alone.\nIf you check any of the \"Custom\"-boxes, a window will appear where you can type in the custom channel(s), either by channel name or number. To specify more than one channel, seperate with a space.\nWhen you have selected some channels, you can click the \"Copy\"-button to copy your selection, and then click another tab, and click the \"Paste\"-button to use the same selection there.\nNote! This will overwrite any custom channels you might have typed, with the ones from the copied source.\nYou can specify a message in the editbox at the bottom, and use the variables listed below.\nIf you select \"Enable announcement for recovery of failed taunts\" in the taunt-tab, you can type a message to announce in the event that you successfully hit with a Mocking Blow, after a failed taunt. Note! This will only work until Taunt is no longer on cooldown, and only if your current target has the same name and level as the one that resisted the taunt.\n\nVariables:\nTaunt, Growl and Mocking Blow:\n$tn: Target Name (Same as %t)\n$tl: Target Level\n$tt: Target Type (Humanoid, Beast, Demon etc.)\n$ttn: Target's Target Name\n$ttl: Target's Target Level\n$ttt: Target's Target Type\n\nShield Wall, Challenging Shout, Challenging Roar, Last Stand and Lifegiving Gem:\n$sec: Duration of ability in seconds\n\nLast Stand and Lifegiving Gem:\n$hp: Amount of hitpoints gained by the ability.";

L["defaultText"] = {
    ["recovery"] = "- Мой издевательский удар восстановил мою сопротивляющуюся насмешку! -"
}

L["Auras"] = {
    ["Salvation"] = "Бальзам на душу",
    ["RF"] = "Праведное неистовство"
}

L["Abilities"] = {
    ["CR"] = {
        ["Name"] = "Вызывающий рев",
        ["Default"] = "- Я активировал «Вызывающий рев»! Мне понадобится много исцеления за $sec секунд! -",
        ["Prompt"] = "Введите новый текст объявления для использования вызывающего рева:"
    },
    ["CS"] = {
        ["Name"] = "Вызывающий крик",
        ["Default"] = "- Я активировал «Вызывающий крик»! Мне понадобится много исцеления за $sec секунд! -",
        ["Prompt"] = "Введите новый текст объявления для использования вызывающего крика:"
    },
    ["FR"] = {
        ["Name"] = "Ярость Скверны",
        ["Default"] = "",
        ["Prompt"] = ""
    },
    ["Growl"] = {
        ["Name"] = "Рык",
        ["Default"] = "- Моему рычанию сопротивлялись $tn! -",
        ["Prompt"] = "Введите новый текст объявления для сдерживаемого рычания:"
    },
    ["LS"] = {
        ["Name"] = "Ни шагу назад",
        ["Default"] = "- Я активировал Last Stand! Через $sec секунд я потеряю $hpHP! -",
        ["Prompt"] = "Введите новый текст объявления для использования последней стойки:"
    },
    ["MB"] = {
        ["Name"] = "Дразнящий удар",
        ["Default"] = "- Мой насмешливый удар не выдержал $tn! -",
        ["Prompt"] = "Введите новый текст объявления для неудавшихся насмешливых ударов:"
    },
    ["RD"] = {
        ["Name"] = "Праведная защита",
        ["Default"] = "- Моей Праведной Защите сопротивлялись $tn! -",
        ["Prompt"] = "Введите новый текст объявления для сопротивляющейся Праведной защиты:"
    },
    ["SW"] = {
        ["Name"] = "Глухая оборона",
        ["Default"] = "- Я активировал стену щита и буду получать на 75% меньше урона в течение $sec секунд.! -",
        ["Prompt"] = "Введите новый текст объявления для использования защитной стены:"
    },
    ["Taunt"] = {
        ["Name"] = "Провокация",
        ["Default"] = "- Моей насмешке сопротивлялись $tn! -",
        ["Prompt"] = "Введите новый текст объявления для сопротивляющихся насмешек:"
    }
}

L["Items"] = {
    ["LG"] = {
        ["Name"] = "Животворный камень",
        ["Default"] = "- Я активировал Животворящий Драгоценный камень! Через $sec секунд я потеряю $hpHP! -",
        ["Prompt"] = "Введите новый текст объявления для использования живительного камня:"
    }
}

L["RemoveBuffs"] = {
    ["Title"] = "Снятие баффа",
    ["Always"] = "Всегда удаляйте баффы, содержащие:",
    ["DRUID"] = "Только в форме медведя:",
    ["WARRIOR"] = "Только защитная стойка:",
    ["PALADIN"] = "Только когда праведная ярость активна:"
}

L["Channel"] = {
    ["Emote"] = "Эмоции",
    ["Yell"] = "Yell",
    ["Party"] = "Группа",
    ["Raid"] = "Рейд",
    ["RaidWarning"] = "Обьявление рейду"
}
