local L = LibStub("AceLocale-3.0"):NewLocale("TankBuddy", "deDE")

if not L then return end

-- German Translation
-- by StarDust, Lorni and Nelson from Malfurion EU
-- last changed: June 15th, 2008
-- NB! Partial translation only!
L["TankBuddy"] = "Tank Buddy";
L["EnableTankBuddy"] = "Tank Buddy aktivieren";
L["Raid"] = "Schlachtzug";
L["Party"] = "Gruppe";
L["Alone"] = "Allein";
L["AnnouncementChannel"] = "Nachrichtenkanal";
L["AnnouncementTexts"] = "Benachrichtigungstext";
L["SetCustomChannel"] = "Eigener Kanal";
L["EnterChannelName"] = "Kanalname oder Nummer angeben:";
L["Close"] = "Schlie\195\159en";
L["Help"] = "Hilfe";
L["Test"] = "Testen";
L["Copy"] = "Kopieren";
L["Paste"] = "Einfügen";
L["General"] = "Allgemein";
L["Taunt"] = "Spott";
L["MB"] = "Spöttischer Schlag";
L["LS"] = "Letztes Gefecht";
L["SW"] = "Schildwall";
L["LG"] = "Lebensspendender Edelstein";
L["CS"] = "Herausforderungsruf";
L["Growl"] = "Knurren";
L["CR"] = "Herausforderndes Gebrüll";
L["RD"] = "Rechtschaffene Verteidigung";
L["RF"] = "Zorn der Gerechtigkeit";
L["Parry"] = "Parry";
L["EnterNewText"] = {
    ["Taunt"] = "Neuer Text wenn Spott wiederstanden wird:",
    ["MB"] = "Neuer Text wenn Spöttischer Schlag verfehlt:",
    ["LS"] = "Neuer Text wenn Letztes Gefecht aktiviert wird:",
    ["SW"] = "Neuer Text wenn Schildwall aktiviert wird:",
    ["LG"] = "Neuer Text für Benutzung von Lebensspendender Edelstein:",
    ["CS"] = "Neuer Text wenn Herausforderndes Gebrüll aktiviert wird:",
    ["Growl"] = "Neuer Text wenn Knurren wiederstanden wird:",
    ["CR"] = "Neuer Text wenn Herausforderndes Gebrüll aktiviert wird:",
    ["RD"] = "Neuer Text wenn Rechtschaffene Verteidigung wiederstanden wird:"
}
L["EnterNewMBRecoveryText"] =
    "Neuer Text für Wiederherstellung von verfehltem Spott:";
L["RemoveBuffs"] = "Buff Entfernung";
L["RemoveBuffsAlways"] = "Entferne Buffs die folgendes beinhalten:";
L["DisableInBG"] = "Deaktiviert in Schlachtfeldern";
L["RemoveBuffsDefensive"] = "Nur in Verteidigungshaltung";
L["RemoveBuffsBear"] = "Nur in Bärform";
L["RemoveBuffsPally"] = "Nur mit Zorn der Gerechtigkeit:";
L["EnableMBRecovery"] =
    "Ankündigung für Wiederherstellung von verfehltem Spott";

L["IntroText"] =
    "Danke für die Benutzung von Tank Buddy, ehemals bekannt als Taunt Buddy.\nTaunt Buddy wurde ursprünglich von Artun Subasientwickelt, aber seit er die Entwicklung eingestellt hat, übernahm Kolthor von Doomhammer EU.\n\nAuf der rechten Seite sind eine Anzahl von Tabs, abhängig von deiner Klasse. Jedes Tab hat Optionen für Ankündigungsnachrichten und Kanäle in die benachrichtigt werden soll unter bestimmten Bedingungen."
L["HelpText"] =
    "Buff Entfernung:\nUm unerwünschte Buffs zu entfernen gibt es zwei Möglichkeiten: Immer, oder nur in Verteidigungshaltung / Bärform / Zorn der Gerechtigkeit.\nTank Buddy wird nach Buffs suchen, die den angegebenen Text enthalten. Um nach mehreren Buffs zu suchen, einfach die Suchworte mit Komma (,) trennen. Hinweis: Du musst nicht den gesamten Buff-Text eingeben, ein Teilstück reicht. Beispiel: \"Intelligenz, Weisheit\" wird nach allen Buffs suchen, die das Wort \"Intelligenz\" oder \"Weisheit\" beinhalten und diese entfernen. Dies trifft auf \"Arkane Intelligenz\" zu und auf \"Gebet der Weisheit\" , aber auch auf Rollen der Intelligenz und Weisheits Buffs und alle anderen Buffs, die \"Intelligenz\" oder \"Weisheit\" in ihrem Namen haben.\n\nTabs:\nDie ganz linke Spalte der Auswahlkästen bestimmt in welche Kanäle benachrichtigt wird, wenn du in einem Raid bist. Die mittlere wenn du in einer Gruppe bist und die ganz rechte wenn du allein unterwegs bist.\nWenn du ein \"Eigener\"-kästchen anwählst wird ein Fenster aufgehen in dem du einen oder mehrere Kanäle eingeben kannst, entweder als Kanalname oder mit der Nummer. Trenne die Kanäle mit einem Leerzeichen.\nWenn du ein paar Kanäle ausgewählt hast, kannst du sie mit dem \"Kopieren\"-Knopf kopieren, dann einen anderen Tab auswählen und mit dem \"Einfügen\"-Knopf die gleiche Wahl wieder einfügen.\nAchtung! Dies wird alle vorherigen Eingaben mit den kopierten Kanälen überschreiben.\nDu kannst in der Box unten eine Nachricht eingeben und dabei folgende Variablen verwenden:\n\nSpott, Knurren and Herausforderndes Gebrüll:\n$tn: Target Name (dasselbe wie %t)\n$tl: TargetLevel\n$tt: Ziel Typ (Humanoid, Tier, Dämon etc.)\n$ttn: Target's Target Name\n$ttl: Target's Target Level\n$ttt: Target's Target Typ\n\nSchildwall, Herausforderungsruf, Herausforderndes Gebrüll, Letztes Gefecht und Lebensspendender Edelstein:\n$sec: Dauer der Fähigkeit in Sekunden\n\nLetztes Gefecht Lebensspendender Edelstein:\n$hp: Anzahl der zusätzlichen Lebenspunkte durch diese Fähigkeit";

L["Channel_Ctraid"] = "CTRaid";
L["Channel_RaidWarning"] = "Schlachtzugswarnung";
L["Channel_Raid"] = "Schlachtzug";
L["Channel_Guild"] = "Gilde";
L["Channel_Party"] = "Gruppe";
L["Channel_Yell"] = "Schreien";
L["Channel_Say"] = "Sagen";
L["Channel_Custom"] = "Eigener";

L["defaultText"] = {
    ["Taunt"] = "- Mein Spott wurde von $tn widerstanden -",
    ["MB"] = "- Mein Spöttischer Schlag hat $tn verfehlt -",
    ["LS"] = "- Auf ins letzte Gefecht! In $sec Sekunden verliere ich $hpHP! -",
    ["SW"] = "- Schildwall ist raus, ich bekomme nur 75% Schaden für $sec Sekunden! -",
    ["LG"] = "- Ich habe Lebensspendender Edelstein aktiviert! In $sec Sekunden verliere ich $hpHP! -",
    ["CS"] = "- Herausforderungsruf ist raus! Ich brauche Heilung für die nächsten $sec Sekunden! -",
    ["Growl"] = "- Mein Knurren wurde von $tn widerstanden -",
    ["CR"] = "- Herrausforderndes Gebrüll ist raus! Ich brauche Heilung für die nächsten $sec Sekunden! -",
    ["RD"] = "- Mein Rechtschaffene Verteidigung wurde von $tn widerstanden -"
}
L["defaultText_r"] =
    "- Mein Spöttischer Schlag hat meinen widerstandenen Spott wieder hergestellt! -";

L["salvation"] = "Segen der Rettung";
L["intellect"] = "Intelligenz";
L["wisdom"] = "Weisheit";
L["Taunt"] = "Spott";
L["MB"] = "Spöttischer Schlag";
L["LS"] = "Letztes Gefecht";
L["SW"] = "Schildwall";
L["LG"] = "Lebensspendender Edelstein";
L["CS"] = "Herausforderungsruf";
L["Growl"] = "Knurren";
L["CR"] = "Herausforderndes Gebrüll";
L["RD"] = "Rechtschaffene Verteidigung";
L["RF"] = "Zorn der Gerechtigkeit";
L["FR"] = "Teufelswut"
L["Parry"] = "Parry";

L["output_buffremoved"] = " removed, matched "; -- As in ["Greater Blessing of Salvation" removed, matched "Salvation"]
L["output_startup"] = " geladen. Gib /TB Help ein um eine Hilfe anzuzeigen.";
L["output_alreadyOff"] = "Tank Buddy ist bereits deaktiviert.";
L["output_alreadyOn"] = "Tank Buddy ist bereits aktiviert.";
L["output_off"] = "Tank Buddy ist aktiv.";
L["output_on"] = "Tank Buddy ist nicht aktiv.";

L["cmd_on"] = "an";
L["cmd_off"] = "aus";
