TankBuddy = LibStub("AceAddon-3.0"):NewAddon("TankBuddy", "AceConsole-3.0",
                                             "AceEvent-3.0")

TankBuddy.version = "3.0.1"

local L = LibStub("AceLocale-3.0"):GetLocale("TankBuddy")

local options = {
    name = L["TankBuddy"],
    handler = TankBuddy,
    type = "group",
    childGroups = "tree",
    get = "getProfileOption",
    set = "setProfileOption",
    args = {
        gui = {
            type = "execute",
            name = L["TankBuddy"],
            guiHidden = true,
            func = function()
                InterfaceOptionsFrame_OpenToCategory("TankBuddy")
                -- need to call it a second time as there is a bug where the first time it won't switch !BlizzBugsSuck has a fix
                InterfaceOptionsFrame_OpenToCategory("TankBuddy")
            end
        },
        enable = {type = "toggle", name = L["EnableTankBuddy"], order = 1},
        disableInBG = {type = "toggle", name = L["DisableInBG"], order = 2},
        credits = {
            type = 'group',
            name = 'Credits',
            order = 4,
            args = {
                introHeader = {type = 'header', name = "Intro", order = 1},
                intro = {
                    type = 'description',
                    width = "full",
                    name = L["IntroText"],
                    order = 2
                },
                helpHeader = {type = 'header', name = "Help", order = 3},
                help = {
                    type = 'description',
                    width = "full",
                    name = L["HelpText"],
                    order = 4
                }
            }
        }
    }
}
local localeClass, classFile = UnitClass("player")

local defaultTauntResistText = {
    ["WARRIOR"] = L["defaultText"]["Taunt"],
    ["DRUID"] = L["defaultText"]["Growl"],
    ["PALADIN"] = L["defaultText"]["RD"]
}

local defaultCSResistText = {
    ["WARRIOR"] = L["defaultText"]["CS"],
    ["DRUID"] = L["defaultText"]["CR"],
    ["PALADIN"] = ""
}

if classFile == "WARRIOR" then
    options.args.classOptions = {
        name = localeClass,
        type = "group",
        order = 3,
        args = {
            buffRemoval = {
                type = 'group',
                name = L["RemoveBuffs"],
                order = 1,
                args = {
                    removeBuffsAlways = {
                        type = 'input',
                        name = L["RemoveBuffsAlways"],
                        width = "full"
                    },
                    removeBuffsDefensive = {
                        type = 'input',
                        name = L["RemoveBuffsDefensive"],
                        width = "full"
                    }
                }
            },
            taunt = {
                type = 'group',
                name = L["Taunt"],
                order = 2,
                args = {
                    announceTauntRecovery = {
                        type = 'toggle',
                        width = "full",
                        name = L["EnableMBRecovery"]
                    },
                    tauntResistText = {
                        type = 'input',
                        width = "full",
                        name = L["EnterNewText"]["Taunt"]
                    },
                    header = {type = 'header', name = "Announcement table TODO"}
                }
            },
            mockingBlow = {
                type = 'group',
                name = L["MB"],
                order = 3,
                args = {
                    mbResistText = {
                        type = 'input',
                        width = "full",
                        name = L["EnterNewMBRecoveryText"]
                    },
                    header = {type = 'header', name = "Announcement table TODO"}
                }
            },
            lastStand = {
                type = 'group',
                name = L["LS"],
                order = 4,
                args = {
                    lsAnnounceText = {
                        type = 'input',
                        width = "full",
                        name = L["EnterNewText"]["LS"]
                    },
                    header = {type = 'header', name = "Announcement table TODO"}
                }
            },
            shieldWall = {
                type = 'group',
                name = L["SW"],
                order = 5,
                args = {
                    swAnnounceText = {
                        type = 'input',
                        width = "full",
                        name = L["EnterNewText"]["SW"]
                    },
                    header = {type = 'header', name = "Announcement table TODO"}
                }
            },
            challengingShout = {
                type = 'group',
                name = L["CS"],
                order = 6,
                args = {
                    csAnnounceText = {
                        type = 'input',
                        width = "full",
                        name = L["EnterNewText"]["CS"]
                    },
                    header = {type = 'header', name = "Announcement table TODO"}
                }
            },
            items = {
                type = 'group',
                name = L["LG"],
                order = 7,
                args = {
                    itemAnnounceText = {
                        type = 'input',
                        width = "full",
                        name = L["EnterNewText"]["LG"]
                    },
                    header = {type = 'header', name = "Announcement table TODO"}
                }
            }
        }
    }
elseif classFile == "DRUID" then
    options.args.classOptions = {
        name = localeClass,
        type = "group",
        order = 3,
        args = {
            buffRemoval = {
                type = 'group',
                name = L["RemoveBuffs"],
                order = 1,
                args = {
                    removeBuffsAlways = {
                        type = 'input',
                        name = L["RemoveBuffsAlways"],
                        width = "full"
                    },
                    removeBuffsDefensive = {
                        type = 'input',
                        name = L["RemoveBuffsBear"],
                        width = "full"
                    }
                }
            },
            taunt = {
                type = 'group',
                name = L["Growl"],
                order = 2,
                args = {
                    tauntResistText = {
                        type = 'input',
                        width = "full",
                        name = L["EnterNewText"]["Growl"]
                    },
                    header = {type = 'header', name = "Announcement table TODO"}
                }
            },
            challengingShout = {
                type = 'group',
                name = L["CR"],
                order = 3,
                args = {
                    csAnnounceText = {
                        type = 'input',
                        width = "full",
                        name = L["EnterNewText"]["CR"]
                    },
                    header = {type = 'header', name = "Announcement table TODO"}
                }
            }
        }
    }
elseif classFile == "PALADIN" then
    options.args.classOptions = {
        name = localeClass,
        type = "group",
        order = 3,
        args = {
            buffRemoval = {
                type = 'group',
                name = L["RemoveBuffs"],
                order = 1,
                args = {
                    removeBuffsAlways = {
                        type = 'input',
                        name = L["RemoveBuffsAlways"],
                        width = "full"
                    },
                    removeBuffsDefensive = {
                        type = 'input',
                        name = L["RemoveBuffsPally"],
                        width = "full"
                    }
                }
            },
            taunt = {
                type = 'group',
                name = L["RD"],
                order = 2,
                args = {
                    tauntResistText = {
                        type = 'input',
                        width = "full",
                        name = L["EnterNewText"]["RD"]
                    },
                    header = {type = 'header', name = "Announcement table TODO"}
                }
            },
            items = {
                type = 'group',
                name = L["LG"],
                order = 3,
                args = {
                    itemAnnounceText = {
                        type = 'input',
                        width = "full",
                        name = L["EnterNewText"]["LG"]
                    },
                    header = {type = 'header', name = "Announcement table TODO"}
                }
            }
        }
    }
else
    options.args.classOptions = {
        name = localeClass,
        type = "group",
        order = 3,
        args = {
            introHeader = {
                type = 'header',
                name = "Silly " .. localeClass,
                order = 1
            },
            intro = {
                type = 'description',
                width = "full",
                name = "You aren't a tank class",
                order = 2
            }
        }
    }
end

local defaults = {
    profile = {
        enable = true,
        disableInBG = true,
        removeBuffsAlways = "",
        removeBuffsDefensive = L["salvation"],
        announceTauntRecovery = true,
        tauntResistText = defaultTauntResistText[classFile],
        csAnnounceText = defaultCSResistText[classFile],
        mbResistText = L["defaultText"]["MB"],
        lsAnnounceText = L["defaultText"]["LS"],
        swAnnounceText = L["defaultText"]["SW"],
        itemAnnounceText = L["defaultText"]["LG"]
    }
}

function TankBuddy:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("TankBuddyDB", defaults, true)

    LibStub("AceConfig-3.0"):RegisterOptionsTable("TankBuddy", options)

    self:RegisterChatCommand("tankbuddy", "ChatCommand")
    self:RegisterChatCommand("tb", "ChatCommand")

    self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(
                            "TankBuddy", "TankBuddy")
end

function TankBuddy:OnEnable()
    self:RegisterEvent("COMBAT_LOG_EVENT", "CombatLogEvent");
    self:RegisterEvent("UNIT_AURA", "AurasChanged");
    self:RegisterEvent("UPDATE_SHAPESHIFT_FORM", "FormChanged");
    self:RegisterEvent("PLAYER_DEAD", "SnarkDead");
    self:RegisterEvent("PLAYER_ALIVE", "SnarkAlive");
end

function TankBuddy:CombatLogEvent(...) self:Sendmsg("Combat log event") end

function TankBuddy:AurasChanged(...) self:Sendmsg("AurasChanged event") end

function TankBuddy:FormChanged(...) self:Sendmsg("FormChanged event") end

function TankBuddy:SnarkDead(...) self:Sendmsg("SnarkDead event") end

function TankBuddy:SnarkAlive(...) self:Sendmsg("SnarkAlive event") end

function TankBuddy:ChatCommand(input)
    if not input or input:trim() == "" then
        InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
        InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
    elseif input and input:trim() == "reset" then
        self.db:ResetProfile()
    end
end

function TankBuddy:getProfileOption(info) return self.db.profile[info[#info]] end

function TankBuddy:setProfileOption(info, value)
    local key = info[#info]
    self.db.profile[key] = value
end

function TankBuddy:Sendmsg(msg)
    if (DEFAULT_CHAT_FRAME) then
        DEFAULT_CHAT_FRAME:AddMessage(msg, 0.0, 1.0, 0.0, 1.0);
    end
end
