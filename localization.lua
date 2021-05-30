--
-- Localization file for Tank Buddy v2.4b3
--
-- English
-- by Raeldar
-- last changed: August 1st, 2008
-- from Tank Buddy 2.1
--   by Artun Subasi and Kolthor
TB_version = "v2.4";

TB_GUI_EnableTankBuddy = "Enable Tank Buddy";
TB_GUI_Raid = "Raid";
TB_GUI_Party = "Party";
TB_GUI_Alone = "Alone";
TB_GUI_AnnouncementChannel = "Announcement Channel";
TB_GUI_AnnouncementTexts = "Announcement Texts";
TB_GUI_SetCustomChannel = "Set Custom Channel";
TB_GUI_EnterChannelName = "Enter channel name or number:";
TB_GUI_Close = "Close";
TB_GUI_Help = "Help";
TB_GUI_Test = "Test";
TB_GUI_Copy = "Copy";
TB_GUI_Paste = "Paste";
TB_GUI_General = "General";
TB_GUI_Taunt = "Taunt";
TB_GUI_MB = "Mocking Blow";
TB_GUI_LS = "Last Stand";
TB_GUI_SW = "Shield Wall";
TB_GUI_LG = "Lifegiving Gem";
TB_GUI_CS = "Challenging Shout";
TB_GUI_Growl = "Growl";
TB_GUI_CR = "Challenging Roar";
TB_GUI_RD = "Righteous Defense";
TB_GUI_RF = "Righteous Fury";
TB_GUI_Parry = "Parry";

TB_GUI_EnterNewText = {
    [TB_GUI_Taunt] = "Enter new announcement text for resisted taunts:",
    [TB_GUI_MB] = "Enter new announcement text for failed mocking blows:",
    [TB_GUI_LS] = "Enter new announcement text for using last stand:",
    [TB_GUI_SW] = "Enter new announcement text for using shield wall:",
    [TB_GUI_LG] = "Enter new announcement text for using lifegiving gem:",
    [TB_GUI_CS] = "Enter new announcement text for using challenging shout:",
    [TB_GUI_Growl] = "Enter new announcement text for resisted growls:",
    [TB_GUI_CR] = "Enter new announcement text for using challenging roar:",
    [TB_GUI_RD] = "Enter new announcement text for resisted Righteous Defense:",
    [TB_GUI_Parry] = "Enter new announcement text for boss parry:"
}
TB_GUI_EnterNewMBRecoveryText =
    "Enter new announcement text for recovered taunts:";
TB_GUI_RemoveBuffs = "Buff removal";
TB_GUI_RemoveBuffsAlways = "Always remove buffs containing:";
TB_GUI_DisableInBG = "Disable in battlegrounds";
TB_GUI_RemoveBuffsDefensive = "Only defensive stance:";
TB_GUI_RemoveBuffsBear = "Only in bear form:";
TB_GUI_RemoveBuffsPally = "Only when Righteous Fury is active:";
TB_GUI_EnableMBRecovery = "Enable announcement for recovery of failed taunts";
TB_GUI_ParryWarnings = "Enable parry warning whispers";

TB_GUI_IntroText =
    "Thank you for using Tank Buddy, formerly known as Taunt Buddy.\nTaunt Buddy was originally created by Artun Subasi, but since he stopped development, Kolthor from Doomhammer EU took over. Updated for 2.4 combatlog & Paladin support by Raeldar.\n\nTo the right there are a number of tabs, depending on your class. Each tab has options for announcement message, and channels to announce to under given circumstances."
TB_GUI_HelpText =
    "Buff removal:\nTo remove unwanted buffs, there are two options; Always, and only in defensive stance/bear form/Righteous Fury.\nTank Buddy will look for buffs containing any of the text specified. To look for several buffs, just seperate with a comma (,). Note! You don't need to type the entire name of the buff, just portions. Example: \"Intellect, Spirit\" will look for any buffs that has the word \"Intellect\" or \"Spirit\" in it, and remove them. This will match \"Arcane Intellect\" and \"Prayer of Spirit\", but also the Scroll of Intellect and Sprit buffs and any other buff that has \"Intellect\" or \"Spirit\" in it's name.\n\nTabs:\nThe leftmost column of checkboxes controls which channels to send the announcement message to, if you are in a raid. The middle column, if you are in a party, and the rightmost column, if you are alone.\nIf you check any of the \"Custom\"-boxes, a window will appear where you can type in the custom channel(s), either by channel name or number. To specify more than one channel, seperate with a space.\nWhen you have selected some channels, you can click the \"Copy\"-button to copy your selection, and then click another tab, and click the \"Paste\"-button to use the same selection there.\nNote! This will overwrite any custom channels you might have typed, with the ones from the copied source.\nYou can specify a message in the editbox at the bottom, and use the variables listed below.\nIf you select \"Enable announcement for recovery of failed taunts\" in the taunt-tab, you can type a message to announce in the event that you successfully hit with a Mocking Blow, after a failed taunt. Note! This will only work until Taunt is no longer on cooldown, and only if your current target has the same name and level as the one that resisted the taunt.\n\nVariables:\nTaunt, Growl and Mocking Blow:\n$tn: Target Name (Same as %t)\n$tl: Target Level\n$tt: Target Type (Humanoid, Beast, Demon etc.)\n$ttn: Target's Target Name\n$ttl: Target's Target Level\n$ttt: Target's Target Type\n\nShield Wall, Challenging Shout, Challenging Roar, Last Stand and Lifegiving Gem:\n$sec: Duration of ability in seconds\n\nLast Stand and Lifegiving Gem:\n$hp: Amount of hitpoints gained by the ability.";

TB_GUI_Channel_Ctraid = "CTRaid";
TB_GUI_Channel_RaidWarning = "Raid Warning";
TB_GUI_Channel_Raid = "Raid";
TB_GUI_Channel_Guild = "Guild";
TB_GUI_Channel_Party = "Party";
TB_GUI_Channel_Yell = "Yell";
TB_GUI_Channel_Say = "Say";
TB_GUI_Channel_Custom = "Custom";

TB_defaultText = {
    [TB_GUI_Taunt] = "- My Taunt has been resisted by $tn! -",
    [TB_GUI_MB] = "- My Mocking Blow failed against $tn! -",
    [TB_GUI_LS] = "- I activated Last Stand! In $sec seconds I will lose $hpHP! -",
    [TB_GUI_SW] = "- I activated Shield Wall and will be taking 75% less damage for $sec seconds! -",
    [TB_GUI_LG] = "- I activated Lifegiving Gem! In $sec seconds I will lose $hpHP! -",
    [TB_GUI_CS] = "- I activated Challenging Shout! I will need a lot of healing for $sec seconds! -",
    [TB_GUI_Growl] = "- My Growl has been resisted by $tn! -",
    [TB_GUI_CR] = "- I activated Challenging Roar! I will need a lot of healing for $sec seconds! -",
    [TB_GUI_RD] = "- My Righteous Defense has been resisted by $tn! -",
    [TB_GUI_Parry] = " - Your $skill has been parried, get behind the boss! = "
}
TB_defaultText_r = "- My Mocking Blow RECOVERED my resisted taunt! -";

TB_salvation = "Salvation";
TB_intellect = "Intellect";
TB_wisdom = "Wisdom";
TB_Taunt = "Taunt";
TB_MB = "Mocking Blow";
TB_LS = "Last Stand";
TB_SW = "Shield Wall";
TB_LG = "Lifegiving Gem";
TB_CS = "Challenging Shout";
TB_Growl = "Growl";
TB_CR = "Challenging Roar";
TB_RD = "Righteous Defense";
TB_RF = "Righteous Fury";
TB_FR = "Fel Rage";
TB_Parry = "Parry";

TB_output_buffremoved = " removed, matched "; -- As in ["Greater Blessing of Salvation" removed, matched "Salvation"]
TB_output_startup = " loaded. Type /TB for options.";
TB_output_alreadyOff = "Tank Buddy is already disabled.";
TB_output_alreadyOn = "Tank Buddy is already enabled.";
TB_output_off = "Tank Buddy off.";
TB_output_on = "Tank Buddy on.";

TB_cmd_on = "on";
TB_cmd_off = "off";

-- French Translation
-- by Dab, Drek'Thar EU (French server)
-- last changed: June 15th, 2008
if (GetLocale() == "frFR") then -- French
    TB_GUI_EnableTankBuddy = "Tank Buddy On";
    TB_GUI_Raid = "Raid";
    TB_GUI_Party = "Groupe";
    TB_GUI_Alone = "Seul";
    TB_GUI_AnnouncementChannel = "Channel d'annonces";
    TB_GUI_AnnouncementTexts = "Texte d'annonces";
    TB_GUI_SetCustomChannel = "Choisir un channel personnalis\195\169";
    TB_GUI_EnterChannelName = "Entrez le nom ou le num\195\169ro du channel :";
    TB_GUI_Close = "Fermer";
    TB_GUI_Help = "Aide";
    TB_GUI_Test = "Test";
    TB_GUI_Copy = "Copier";
    TB_GUI_Paste = "Coller";
    TB_GUI_General = "G\195\169n\195\169ral";
    TB_GUI_Taunt = "Provocation";
    TB_GUI_MB = "Coup railleur";
    TB_GUI_LS = "Dernier rempart";
    TB_GUI_SW = "Mur protecteur";
    TB_GUI_LG = "Gemme donneuse de vie";
    TB_GUI_CS = "Cri de d\195\169fi";
    TB_GUI_Growl = "Grondement";
    TB_GUI_CR = "Rugissement provocateur";
    TB_GUI_RD = "D\195\169fense vertueuse";
    TB_GUI_RF = "Fureur vertueuse";
    TB_GUI_Parry = "Parry";
    TB_GUI_EnterNewText = {
        [TB_GUI_Taunt] = "Annonce personnalis\195\169e pour les 'r\195\169siste' \195\160 la provocation:",
        [TB_GUI_MB] = "Annonce personnalis\195\169e pour Coup Railleur \195\169chou\195\169:",
        [TB_GUI_LS] = "Annonce personnalis\195\169e pour Dernier Rempart:",
        [TB_GUI_SW] = "Annonce personnalis\195\169e pour Mur Protecteur:",
        [TB_GUI_LG] = "Annonce personnalis\195\169e pour Gemme donneuse de vie:",
        [TB_GUI_CS] = "Annonce personnalis\195\169e pour Cri de d\195\169fi:",
        [TB_GUI_Growl] = "Annonce personnalis\195\169e pour les 'r\195\169siste' au Grondement:",
        [TB_GUI_CR] = "Annonce personnalis\195\169e pour Rugissement provocateur:",
        [TB_GUI_RD] = "Annonce personnalis\195\169e pour les 'r\195\169siste' \195\160 la D\195\169fense vertueuse:"
    }
    TB_GUI_EnterNewMBRecoveryText =
        "Entrez un nouveau texte d'annonce pour les provocations rat\195\169es mais r\195\169cup\195\169r\195\169es:";
    TB_GUI_RemoveBuffs = "Enleveur de buffs";
    TB_GUI_RemoveBuffsAlways = "Toujours enlever les buffs contenant:";
    TB_GUI_DisableInBG = "D\195\169sactiver sur les champs de bataille";
    TB_GUI_RemoveBuffsDefensive = "Seulement en posture d\195\169fensive";
    TB_GUI_RemoveBuffsBear = "Seulement en forme d'ours";
    TB_GUI_RemoveBuffsPally = "Seulement avec Fureur vertueuse:";
    TB_GUI_EnableMBRecovery =
        "Activer les annonces en cas de r\195\169cup\195\169ration apr\195\168s une provocation \195\169chou\195\169e";

    TB_GUI_IntroText =
        "Merci d'utiliser Tank Buddy, aussi connu comme Taunt Buddy. Taunt Buddy a ete cree par Artun Subasi, mais depuis qu'il a arrete le developpement, Kolthor de Doomhammer EU a pris la suite.\n\nA droite, vous avez un certain nombre d'onglets, selon votre classe. Chaque onglet contient des options pour les messages d'annonces, les channels d'annonces..."
    TB_GUI_HelpText =
        "Enleveur de buffs:\nPour enlever les buffs dont vous ne voulez pas, il y a deux options; Toujours, ou seulement en posture defensive/forme d'ours/Fureur vertueuse.\nTank Buddy va scanner les buffs contenant le texte que vous avez precise. Pour surveiller plusieurs buffs, separez les par une virgule (,). Note! Vous n'avez pas besoin de taper le nom entier du buff, une partie suffit. Exemple: \"Intelligence, Esprit\" verifiera tous les buffs contenant les mots \"Intelligence\" ou \"Esprit\", et les enlevera. Cela va reperer \"Intelligence des arcanes\" et \"Priere d'Esprit\", mais aussi les parchemins d'Intelligence et d'Esprit et tous les autres buffs qui contiennent les mots \"Intelligence\" ou \"Esprit\".\n\nOnglets:\nLa colonne la plus a gauche controle quels channels utiliser pour envoyer les messages si vous etes en raid, la colonne du milieu si vous etes en groupe et la colonne la plus a droite si vous etes seul.\nSi vous cochez une des cases \"Personnalise\", une fenêtre s'ouvrira ou vous pourrez entrer soit le(s) nom(s) du(des) channel(s), soit son(ses) numero(s). Pour utiliser plusieurs channels, separez les par un espace.\nSi vous avez selectionne plusieurs channels, vous pouvez cliquer sur le bouton \"Copier\" et ensuite cliquer sur le bouton \"Coller\" dans autre onglet pour utiliser les memes channels.\nRemarque! Cela remplacera tous les channels personnalises que vous aviez entres par ceux que vous venez de copier.\nVous pouvez entrez un message personnalise dans la boite d'edition en bas de chaque menu, et utiliser les variables listees plus bas.\nSi vous choisissez l'option \"Activer les annonces en cas de recuperation apres une provocation echouee\" dans l'onglet Provocation, vous pouvez entrer un message personnalise au cas ou un coup railleur a fonctionne apres une provocation resistee. Remarque ! Cela ne fonctionnera que si la recuperation de votre Provocation est incomplete et aussi si votre cible porte le meme nom et a le meme niveau que celle qui a resiste a votre provocation.\n\nVariables:\nProvocation, Grondement et Coup railleur:\n$tn: Nom de la Cible (Equivalent \195\160  %t).\n$tl: Niveau de la cible.\n$tt: Type de la cible (Humanoide, Bete, Demon etc.).\n$ttn: Nom de la cible de la cible.\n$ttl: Niveau de la cible de la cible.\n$ttt: Type de la cible de la cible.\n\nMur Protecteur, Cri de defi, Rugissement Provocateur, Dernier Rempart et Gemme donneuse de vie:\n$sec: Duree de la technique en secondes.\n\nDernier Rempart et Gemme donneuse de vie:\n$hp: Montant de points gagnes avec la technique.";

    TB_GUI_Channel_Ctraid = "CTRaid";
    TB_GUI_Channel_RaidWarning = "Avertissement Raid";
    TB_GUI_Channel_Raid = "Raid";
    TB_GUI_Channel_Guild = "Guilde";
    TB_GUI_Channel_Party = "Groupe";
    TB_GUI_Channel_Yell = "Cri";
    TB_GUI_Channel_Say = "Dire";
    TB_GUI_Channel_Custom = "Personnalise";

    TB_defaultText = {
        [TB_GUI_Taunt] = "- $tn a r\195\169sist\195\169 \195\160 ma provocation ! -",
        [TB_GUI_MB] = "- Mon coup railleur a \195\169chou\195\169 contre  $tn -",
        [TB_GUI_LS] = "- J'ai activ\195\169 Dernier Rempart ! Dans $sec secondes, je perds $hp PV! -",
        [TB_GUI_SW] = "- J'ai activ\195\169 Mur Protecteur pour $sec secondes! R\195\169duction des d\195\169gats de 75% -",
        [TB_GUI_LG] = "- J'ai activ\195\169 la Gemme donneuse de vie ! Dans $sec secondes, je perds $hp PV! -",
        [TB_GUI_CS] = "- J'ai activ\195\169 cri de d\195\169fi ! Mass heal sur moi pendant $sec secondes! -",
        [TB_GUI_Growl] = "- $tn a r\195\169sist\195\169 \195\160 mon grondement ! -",
        [TB_GUI_CR] = "- J'ai activ\195\169 rugissement provocateur ! Mass heal sur moi pendant $sec secondes! -",
        [TB_GUI_RD] = "- $tn a r\195\169sist\195\169 \195\160 ma D\195\169fense vertueuse ! -"
    }
    TB_defaultText_r =
        "- Ma provocation a \195\169chou\195\169e mais mon coup railleur a fonctionn\195\169! Pas de panique -";

    TB_salvation = "B\195\169n\195\169diction de salut";
    TB_intellect = "Intelligence";
    TB_wisdom = "Sagesse";
    TB_Taunt = "Provocation";
    TB_MB = "Coup railleur";
    TB_LS = "Dernier rempart";
    TB_SW = "Mur protecteur";
    TB_LG = "Gemme donneuse de vie";
    TB_CS = "Cri de d\195\169fi";
    TB_Growl = "Grondement";
    TB_CR = "Rugissement provocateur";
    TB_RD = "D\195\169fense vertueuse";
    TB_RF = "Fureur vertueuse";
    TB_FR = "Gangrerage";
    TB_Parry = "Parry";

    TB_output_buffremoved = " enlev\195\169e, puisqu'il contient ";
    TB_output_startup = " charg\195\169. Tapez /TB pour les options.";
    TB_output_alreadyOff =
        "Tank Buddy est d\195\169j\195\160 arr\195\170t\195\169.";
    TB_output_alreadyOn = "Tank Buddy est d\195\169j\195\160 en marche.";
    TB_output_off = "Tank Buddy off.";
    TB_output_on = "Tank Buddy on.";

    TB_cmd_on = "on";
    TB_cmd_off = "off";

    -- German Translation
    -- by StarDust, Lorni and Nelson from Malfurion EU
    -- last changed: June 15th, 2008
    -- NB! Partial translation only!
elseif (GetLocale() == "deDE") then -- German
    TB_GUI_EnableTankBuddy = "Tank Buddy aktivieren";
    TB_GUI_Raid = "Schlachtzug";
    TB_GUI_Party = "Gruppe";
    TB_GUI_Alone = "Allein";
    TB_GUI_AnnouncementChannel = "Nachrichtenkanal";
    TB_GUI_AnnouncementTexts = "Benachrichtigungstext";
    TB_GUI_SetCustomChannel = "Eigener Kanal";
    TB_GUI_EnterChannelName = "Kanalname oder Nummer angeben:";
    TB_GUI_Close = "Schlie\195\159en";
    TB_GUI_Help = "Hilfe";
    TB_GUI_Test = "Testen";
    TB_GUI_Copy = "Kopieren";
    TB_GUI_Paste = "Einfügen";
    TB_GUI_General = "Allgemein";
    TB_GUI_Taunt = "Spott";
    TB_GUI_MB = "Spöttischer Schlag";
    TB_GUI_LS = "Letztes Gefecht";
    TB_GUI_SW = "Schildwall";
    TB_GUI_LG = "Lebensspendender Edelstein";
    TB_GUI_CS = "Herausforderungsruf";
    TB_GUI_Growl = "Knurren";
    TB_GUI_CR = "Herausforderndes Gebrüll";
    TB_GUI_RD = "Rechtschaffene Verteidigung";
    TB_GUI_RF = "Zorn der Gerechtigkeit";
    TB_GUI_Parry = "Parry";
    TB_GUI_EnterNewText = {
        [TB_GUI_Taunt] = "Neuer Text wenn Spott wiederstanden wird:",
        [TB_GUI_MB] = "Neuer Text wenn Spöttischer Schlag verfehlt:",
        [TB_GUI_LS] = "Neuer Text wenn Letztes Gefecht aktiviert wird:",
        [TB_GUI_SW] = "Neuer Text wenn Schildwall aktiviert wird:",
        [TB_GUI_LG] = "Neuer Text für Benutzung von Lebensspendender Edelstein:",
        [TB_GUI_CS] = "Neuer Text wenn Herausforderndes Gebrüll aktiviert wird:",
        [TB_GUI_Growl] = "Neuer Text wenn Knurren wiederstanden wird:",
        [TB_GUI_CR] = "Neuer Text wenn Herausforderndes Gebrüll aktiviert wird:",
        [TB_GUI_RD] = "Neuer Text wenn Rechtschaffene Verteidigung wiederstanden wird:"
    }
    TB_GUI_EnterNewMBRecoveryText =
        "Neuer Text für Wiederherstellung von verfehltem Spott:";
    TB_GUI_RemoveBuffs = "Buff Entfernung";
    TB_GUI_RemoveBuffsAlways = "Entferne Buffs die folgendes beinhalten:";
    TB_GUI_DisableInBG = "Deaktiviert in Schlachtfeldern";
    TB_GUI_RemoveBuffsDefensive = "Nur in Verteidigungshaltung";
    TB_GUI_RemoveBuffsBear = "Nur in Bärform";
    TB_GUI_RemoveBuffsPally = "Nur mit Zorn der Gerechtigkeit:";
    TB_GUI_EnableMBRecovery =
        "Ankündigung für Wiederherstellung von verfehltem Spott";

    TB_GUI_IntroText =
        "Danke für die Benutzung von Tank Buddy, ehemals bekannt als Taunt Buddy.\nTaunt Buddy wurde ursprünglich von Artun Subasientwickelt, aber seit er die Entwicklung eingestellt hat, übernahm Kolthor von Doomhammer EU.\n\nAuf der rechten Seite sind eine Anzahl von Tabs, abhängig von deiner Klasse. Jedes Tab hat Optionen für Ankündigungsnachrichten und Kanäle in die benachrichtigt werden soll unter bestimmten Bedingungen."
    TB_GUI_HelpText =
        "Buff Entfernung:\nUm unerwünschte Buffs zu entfernen gibt es zwei Möglichkeiten: Immer, oder nur in Verteidigungshaltung / Bärform / Zorn der Gerechtigkeit.\nTank Buddy wird nach Buffs suchen, die den angegebenen Text enthalten. Um nach mehreren Buffs zu suchen, einfach die Suchworte mit Komma (,) trennen. Hinweis: Du musst nicht den gesamten Buff-Text eingeben, ein Teilstück reicht. Beispiel: \"Intelligenz, Weisheit\" wird nach allen Buffs suchen, die das Wort \"Intelligenz\" oder \"Weisheit\" beinhalten und diese entfernen. Dies trifft auf \"Arkane Intelligenz\" zu und auf \"Gebet der Weisheit\" , aber auch auf Rollen der Intelligenz und Weisheits Buffs und alle anderen Buffs, die \"Intelligenz\" oder \"Weisheit\" in ihrem Namen haben.\n\nTabs:\nDie ganz linke Spalte der Auswahlkästen bestimmt in welche Kanäle benachrichtigt wird, wenn du in einem Raid bist. Die mittlere wenn du in einer Gruppe bist und die ganz rechte wenn du allein unterwegs bist.\nWenn du ein \"Eigener\"-kästchen anwählst wird ein Fenster aufgehen in dem du einen oder mehrere Kanäle eingeben kannst, entweder als Kanalname oder mit der Nummer. Trenne die Kanäle mit einem Leerzeichen.\nWenn du ein paar Kanäle ausgewählt hast, kannst du sie mit dem \"Kopieren\"-Knopf kopieren, dann einen anderen Tab auswählen und mit dem \"Einfügen\"-Knopf die gleiche Wahl wieder einfügen.\nAchtung! Dies wird alle vorherigen Eingaben mit den kopierten Kanälen überschreiben.\nDu kannst in der Box unten eine Nachricht eingeben und dabei folgende Variablen verwenden:\n\nSpott, Knurren and Herausforderndes Gebrüll:\n$tn: Target Name (dasselbe wie %t)\n$tl: TargetLevel\n$tt: Ziel Typ (Humanoid, Tier, Dämon etc.)\n$ttn: Target's Target Name\n$ttl: Target's Target Level\n$ttt: Target's Target Typ\n\nSchildwall, Herausforderungsruf, Herausforderndes Gebrüll, Letztes Gefecht und Lebensspendender Edelstein:\n$sec: Dauer der Fähigkeit in Sekunden\n\nLetztes Gefecht Lebensspendender Edelstein:\n$hp: Anzahl der zusätzlichen Lebenspunkte durch diese Fähigkeit";

    TB_GUI_Channel_Ctraid = "CTRaid";
    TB_GUI_Channel_RaidWarning = "Schlachtzugswarnung";
    TB_GUI_Channel_Raid = "Schlachtzug";
    TB_GUI_Channel_Guild = "Gilde";
    TB_GUI_Channel_Party = "Gruppe";
    TB_GUI_Channel_Yell = "Schreien";
    TB_GUI_Channel_Say = "Sagen";
    TB_GUI_Channel_Custom = "Eigener";

    TB_defaultText = {
        [TB_GUI_Taunt] = "- Mein Spott wurde von $tn widerstanden -",
        [TB_GUI_MB] = "- Mein Spöttischer Schlag hat $tn verfehlt -",
        [TB_GUI_LS] = "- Auf ins letzte Gefecht! In $sec Sekunden verliere ich $hpHP! -",
        [TB_GUI_SW] = "- Schildwall ist raus, ich bekomme nur 75% Schaden für $sec Sekunden! -",
        [TB_GUI_LG] = "- Ich habe Lebensspendender Edelstein aktiviert! In $sec Sekunden verliere ich $hpHP! -",
        [TB_GUI_CS] = "- Herausforderungsruf ist raus! Ich brauche Heilung für die nächsten $sec Sekunden! -",
        [TB_GUI_Growl] = "- Mein Knurren wurde von $tn widerstanden -",
        [TB_GUI_CR] = "- Herrausforderndes Gebrüll ist raus! Ich brauche Heilung für die nächsten $sec Sekunden! -",
        [TB_GUI_RD] = "- Mein Rechtschaffene Verteidigung wurde von $tn widerstanden -"
    }
    TB_defaultText_r =
        "- Mein Spöttischer Schlag hat meinen widerstandenen Spott wieder hergestellt! -";

    TB_salvation = "Segen der Rettung";
    TB_intellect = "Intelligenz";
    TB_wisdom = "Weisheit";
    TB_Taunt = "Spott";
    TB_MB = "Spöttischer Schlag";
    TB_LS = "Letztes Gefecht";
    TB_SW = "Schildwall";
    TB_LG = "Lebensspendender Edelstein";
    TB_CS = "Herausforderungsruf";
    TB_Growl = "Knurren";
    TB_CR = "Herausforderndes Gebrüll";
    TB_RD = "Rechtschaffene Verteidigung";
    TB_RF = "Zorn der Gerechtigkeit";
    TB_FR = "Teufelswut"
    TB_Parry = "Parry";

    TB_output_buffremoved = " removed, matched "; -- As in ["Greater Blessing of Salvation" removed, matched "Salvation"]
    TB_output_startup = " geladen. Gib /TB Help ein um eine Hilfe anzuzeigen.";
    TB_output_alreadyOff = "Tank Buddy ist bereits deaktiviert.";
    TB_output_alreadyOn = "Tank Buddy ist bereits aktiviert.";
    TB_output_off = "Tank Buddy ist aktiv.";
    TB_output_on = "Tank Buddy ist nicht aktiv.";

    TB_cmd_on = "an";
    TB_cmd_off = "aus";

elseif (GetLocale() == "koKR") then -- Korean

elseif (GetLocale() == "zhCN") then -- Chinese (simplified)

    -- Chinese Traditional Translation (?????)
    -- by ??? Paradise of Nameless - Enix
    -- last changed: Match 24th, 2007
elseif (GetLocale() == "zhTW") then -- Chinese (traditional)

    TB_GUI_EnableTankBuddy = "??????";
    TB_GUI_Raid = "???";
    TB_GUI_Party = "???";
    TB_GUI_Alone = "???";
    TB_GUI_AnnouncementChannel = "??????";
    TB_GUI_AnnouncementTexts = "??????";
    TB_GUI_SetCustomChannel = "??????";
    TB_GUI_EnterChannelName = "???????????:";
    TB_GUI_Close = "??";
    TB_GUI_Help = "??";
    TB_GUI_Test = "??";
    TB_GUI_Copy = "??";
    TB_GUI_Paste = "??";
    TB_GUI_General = "??";
    TB_GUI_Taunt = "??";
    TB_GUI_MB = "????";
    TB_GUI_LS = "????";
    TB_GUI_SW = "??";
    TB_GUI_LG = "????";
    TB_GUI_CS = "????";
    TB_GUI_Growl = "??";
    TB_GUI_CR = "????";
    TB_GUI_RD = "????";
    TB_GUI_EnterNewText = {
        [TB_GUI_Taunt] = "?????????????????:",
        [TB_GUI_MB] = "??????????????????:",
        [TB_GUI_LS] = "??????????????????:",
        [TB_GUI_SW] = "????????????????:",
        [TB_GUI_LG] = "??????????????????:",
        [TB_GUI_CS] = "??????????????????:",
        [TB_GUI_Growl] = "?????????????????:",
        [TB_GUI_CR] = "??????????????????:",
        [TB_GUI_RD] = "?????????????????:"
    }
    TB_GUI_EnterNewMBRecoveryText = "??????????????????:";
    TB_GUI_RemoveBuffs = "?? Buff";
    TB_GUI_RemoveBuffsAlways = "????:";
    TB_GUI_DisableInBG = "???????";
    TB_GUI_RemoveBuffsDefensive = "???????????:";
    TB_GUI_RemoveBuffsBear = "??????????";
    TB_GUI_RemoveBuffsPally = "Only when Righteous Fury is active:";
    TB_GUI_EnableMBRecovery = "???????????";

    TB_GUI_IntroText =
        "???? Tank Buddy, ????? Taunt Buddy.\nTaunt Buddy ??? Artun Subasi ??, ?????????, ??? Doomhammer EU ? Kolthor ??.\n\n??????????????. ????????????????."
    TB_GUI_HelpText =
        "?? Buff:\n??????? Buffs, ??????; ????, ???????/???????.\nTank Buddy ??? Buff ???????????. ????? Buff ???? (,) ??. ??! ?????????????, ????????. ??: \"??, ??\" ??????? \"??\" ? \"??\" ? Buff ???. ?? \"????\" ? \"????\" ????? \"??\" ? \"??\" ?.\n\n??:\n<???>????????? Raid ?????????????. <???>??????????????, <???>???? Solo ????.\n?????\"??\"??, ???????????????????, ???????????. ?????????, ????????????.\n????????????, ?????\"??\", ?????????, ????????, ??\"??\", ??????????????.\n??!??????????????????.\n?????????????????, ??????????????.\n?????????? \"??????????????????\" , ?????????????????????????????. ??! ????????????????, ??????????????????????.\n\n????:\n??, ??, ????:\n$tn: ???? (??? %t)\n$tl: ????\n$tt: ???? (????, ??, ???)\n$ttn: ???????\n$ttl: ???????\n$ttt: ???????\n\n??, ????, ????, ????, ????:\n$sec: ??????(?)\n\n????, ????:\n$hp: ????????????.";

    TB_GUI_Channel_Ctraid = "CTRaid????";
    TB_GUI_Channel_RaidWarning = "????";
    TB_GUI_Channel_Raid = "??";
    TB_GUI_Channel_Guild = "??";
    TB_GUI_Channel_Party = "??";
    TB_GUI_Channel_Yell = "??";
    TB_GUI_Channel_Say = "?";
    TB_GUI_Channel_Custom = "??";

    TB_defaultText = {
        [TB_GUI_Taunt] = "- ????? $tn ??? -",
        [TB_GUI_MB] = "- ??????? $tn ??? -",
        [TB_GUI_LS] = "- ????????!? $sec ????????? $hp HP! -",
        [TB_GUI_SW] = "- ??????!? $sec ?????????? 75%! -",
        [TB_GUI_LG] = "- ????????!? $sec ?????? $hp HP ???! -",
        [TB_GUI_CS] = "- ????????!? $sec ??????????! -",
        [TB_GUI_Growl] = "- ????? $tn ???-",
        [TB_GUI_CR] = "- ????????!? $sec ??????????! -",
        [TB_GUI_Taunt] = "- ????? $tn ??? -"
    }
    TB_defaultText_r = "- ???????????????? -";

    TB_salvation = "????";
    TB_intellect = "??";
    TB_wisdom = "????";

    TB_output_buffremoved = " removed, matched "; -- As in ["Greater Blessing of Salvation" removed, matched "Salvation"] Note: leave a space before and after, as in the english one.
    TB_output_startup = " ???. ??? /TB ??????.";
    TB_output_alreadyOff = "????????.";
    TB_output_alreadyOn = "????????.";
    TB_output_off = "??????.";
    TB_output_on = "??????.";

    TB_cmd_on = "on";
    TB_cmd_off = "off";

elseif (GetLocale() == "ruRU") then -- Russian (UI AddOn) -??

elseif (GetLocale() == "esES") then -- Spanish
end
