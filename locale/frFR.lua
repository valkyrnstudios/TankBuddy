local L = LibStub("AceLocale-3.0"):NewLocale("TankBuddy", "frFR")

if not L then return end

-- TODO restructure abilities
-- by Dab, Drek'Thar EU (French server)

L["DisableInBG"] = "D\195\169sactiver sur les champs de bataille";
L["Done"] = "finie!";
L["EnableTankBuddy"] = "Tank Buddy On";
L["EnterNewMBRecoveryText"] =
    "Entrez un nouveau texte d'annonce pour les provocations rat\195\169es mais r\195\169cup\195\169r\195\169es:";
L["General"] = "G\195\169n\195\169ral";
L["Help"] = "Aide";
L["output_buffremoved"] = " enlev\195\169e, puisqu'il contient ";
L["SetCustomChannel"] = "Choisir un channel personnalis\195\169";
L["TankBuddy"] = "Tank Buddy";
L["Test"] = "Test";
L["EnableAnnounce"] = "activer l'annonce"

L["IntroText"] =
    "Merci d'utiliser Tank Buddy, aussi connu comme Taunt Buddy. Taunt Buddy a ete cree par Artun Subasi, mais depuis qu'il a arrete le developpement, Kolthor de Doomhammer EU a pris la suite.\n\nA droite, vous avez un certain nombre d'onglets, selon votre classe. Chaque onglet contient des options pour les messages d'annonces, les channels d'annonces..."
L["HelpText"] =
    "Enleveur de buffs:\nPour enlever les buffs dont vous ne voulez pas, il y a deux options; Toujours, ou seulement en posture defensive/forme d'ours/Fureur vertueuse.\nTank Buddy va scanner les buffs contenant le texte que vous avez precise. Pour surveiller plusieurs buffs, separez les par une virgule (,). Note! Vous n'avez pas besoin de taper le nom entier du buff, une partie suffit. Exemple: \"Intelligence, Esprit\" verifiera tous les buffs contenant les mots \"Intelligence\" ou \"Esprit\", et les enlevera. Cela va reperer \"Intelligence des arcanes\" et \"Priere d'Esprit\", mais aussi les parchemins d'Intelligence et d'Esprit et tous les autres buffs qui contiennent les mots \"Intelligence\" ou \"Esprit\".\n\nOnglets:\nLa colonne la plus a gauche controle quels channels utiliser pour envoyer les messages si vous etes en raid, la colonne du milieu si vous etes en groupe et la colonne la plus a droite si vous etes seul.\nSi vous cochez une des cases \"Personnalise\", une fenêtre s'ouvrira ou vous pourrez entrer soit le(s) nom(s) du(des) channel(s), soit son(ses) numero(s). Pour utiliser plusieurs channels, separez les par un espace.\nSi vous avez selectionne plusieurs channels, vous pouvez cliquer sur le bouton \"Copier\" et ensuite cliquer sur le bouton \"Coller\" dans autre onglet pour utiliser les memes channels.\nRemarque! Cela remplacera tous les channels personnalises que vous aviez entres par ceux que vous venez de copier.\nVous pouvez entrez un message personnalise dans la boite d'edition en bas de chaque menu, et utiliser les variables listees plus bas.\nSi vous choisissez l'option \"Activer les annonces en cas de recuperation apres une provocation echouee\" dans l'onglet Provocation, vous pouvez entrer un message personnalise au cas ou un coup railleur a fonctionne apres une provocation resistee. Remarque ! Cela ne fonctionnera que si la recuperation de votre Provocation est incomplete et aussi si votre cible porte le meme nom et a le meme niveau que celle qui a resiste a votre provocation.\n\nVariables:\nProvocation, Grondement et Coup railleur:\n$tn: Nom de la Cible (Equivalent \195\160  %t).\n$tl: Niveau de la cible.\n$tt: Type de la cible (Humanoide, Bete, Demon etc.).\n$ttn: Nom de la cible de la cible.\n$ttl: Niveau de la cible de la cible.\n$ttt: Type de la cible de la cible.\n\nMur Protecteur, Cri de defi, Rugissement Provocateur, Dernier Rempart et Gemme donneuse de vie:\n$sec: Duree de la technique en secondes.\n\nDernier Rempart et Gemme donneuse de vie:\n$hp: Montant de points gagnes avec la technique.";

L["defaultText"] = {
    ["recovery"] = "- Ma provocation a \195\169chou\195\169e mais mon coup railleur a fonctionn\195\169! Pas de panique -"
}

L["Auras"] = {
    ["Salvation"] = "B\195\169n\195\169diction de salut",
    ["RF"] = "Fureur vertueuse"
}

L["Abilities"] = {
    ["CR"] = {
        ["Name"] = "Rugissement provocateur",
        ["Default"] = "- J'ai activ\195\169 rugissement provocateur ! Mass heal sur moi pendant $sec secondes! -",
        ["Prompt"] = "Annonce personnalis\195\169e pour Rugissement provocateur:"
    },
    ["CS"] = {
        ["Name"] = "Cri de d\195\169fi",
        ["Default"] = "- J'ai activ\195\169 cri de d\195\169fi ! Mass heal sur moi pendant $sec secondes! -",
        ["Prompt"] = "Annonce personnalis\195\169e pour Cri de d\195\169fi:"
    },
    ["FR"] = {["Name"] = "Gangrerage", ["Default"] = "", ["Prompt"] = ""},
    ["Growl"] = {
        ["Name"] = "Grondement",
        ["Default"] = "- $tn a r\195\169sist\195\169 \195\160 mon grondement ! -",
        ["Prompt"] = "Annonce personnalis\195\169e pour les 'r\195\169siste' au Grondement:"
    },
    ["LS"] = {
        ["Name"] = "Dernier rempart",
        ["Default"] = "- J'ai activ\195\169 Dernier Rempart ! Dans $sec secondes, je perds $hp PV! -",
        ["Prompt"] = "Annonce personnalis\195\169e pour Dernier Rempart:"
    },
    ["MB"] = {
        ["Name"] = "Coup railleur",
        ["Default"] = "- Mon coup railleur a \195\169chou\195\169 contre  $tn -",
        ["Prompt"] = "Annonce personnalis\195\169e pour Coup Railleur \195\169chou\195\169:"
    },
    ["RD"] = {
        ["Name"] = "D\195\169fense vertueuse",
        ["Default"] = "- $tn a r\195\169sist\195\169 \195\160 ma D\195\169fense vertueuse ! -",
        ["Prompt"] = "Annonce personnalis\195\169e pour les 'r\195\169siste' \195\160 la D\195\169fense vertueuse:"
    },
    ["SW"] = {
        ["Name"] = "Mur protecteur",
        ["Default"] = "- J'ai activ\195\169 Mur Protecteur pour $sec secondes! R\195\169duction des d\195\169gats de 75% -",
        ["Prompt"] = "Annonce personnalis\195\169e pour Mur Protecteur:"
    },
    ["Taunt"] = {
        ["Name"] = "Provocation",
        ["Default"] = "- $tn a r\195\169sist\195\169 \195\160 ma provocation ! -",
        ["Prompt"] = "Annonce personnalis\195\169e pour les 'r\195\169siste' \195\160 la provocation:"
    }
}

L["RemoveBuffs"] = {
    ["Title"] = "Enleveur de buffs",
    ["Always"] = "Toujours enlever les buffs contenant:",
    ["DRUID"] = "Seulement en forme d'ours",
    ["WARRIOR"] = "Seulement en posture d\195\169fensive",
    ["PALADIN"] = "Seulement avec Fureur vertueuse:"
}

L["Channel"] = {
    ["Emote"] = "emote",
    ["Party"] = "Groupe",
    ["Raid"] = "Raid",
    ["RaidWarning"] = "Avertissement Raid"
}

L["Items"] = {
    ["LG"] = {
        ["Name"] = "Gemme donneuse de vie",
        ["Default"] = "- J'ai activ\195\169 la Gemme donneuse de vie ! Dans $sec secondes, je perds $hp PV! -",
        ["Prompt"] = "Annonce personnalis\195\169e pour Gemme donneuse de vie:"
    }
}
