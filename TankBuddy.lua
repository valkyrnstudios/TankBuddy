TankBuddy = LibStub("AceAddon-3.0"):NewAddon("TankBuddy", "AceConsole-3.0",
                                             "AceEvent-3.0")

TankBuddy.version = "3.0.1"

local L = LibStub("AceLocale-3.0"):GetLocale("TankBuddy")
local FindAuraByName = AuraUtil.FindAuraByName
local strmatch = string.match

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

local tankFormID = {["WARRIOR"] = 2, ["DRUID"] = 1, ["PALADIN"] = 9}

local removeBuffsAlways = {}

local removeBuffsDefensive = {}

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
    self:RegisterEvent("COMBAT_LOG_EVENT");
    self:RegisterEvent("UPDATE_SHAPESHIFT_FORM", "EvaluateAuras");
    self:RegisterEvent("UNIT_AURA", "EvaluateAuras");

    self:RegisterEvent("PLAYER_DEAD");
    self:RegisterEvent("PLAYER_ALIVE");

    removeBuffsDefensive = TankBuddy:SplitOptionsString(self.db.profile
                                                            .removeBuffsDefensive)
    removeBuffsAlways = TankBuddy:SplitOptionsString(self.db.profile
                                                         .removeBuffsAlways)
end

function TankBuddy:COMBAT_LOG_EVENT(...)
    self:SendMessage("Combat log event")

    do return end

    if ((arg2 == "SPELL_AURA_APPLIED") and (arg7 == TBmyname) and
        (arg10 == TB_FR)) then -- Checks for Fel Rage
        TBfeltime = GetTime();
    elseif ((englishClass == "WARRIOR") and (arg4 == TBmyname)) then
        if ((arg2 == "SPELL_MISSED") and (arg10 == TB_Taunt) and
            (arg12 == "RESIST")) then -- Checks if your taunt was resisted
            TBbadmob = arg7;
            TBAbility = TB_GUI_Taunt;
            TBRecovery = nil;
            if (TBSettings[TBSettingsCharRealm].MBRecoveryStatus) then
                TB_TauntFailInfo = {
                    ["Target"] = UnitName("target") .. UnitLevel("target"),
                    ["Time"] = GetTime()
                }
            end
        elseif ((arg2 == "SPELL_CAST_SUCCESS") and (arg10 == TB_SW)) then
            TBAbility = TB_GUI_SW;
        elseif ((arg2 == "SPELL_CAST_SUCCESS") and (arg10 == TB_LS)) then
            TBAbility = TB_GUI_LS;
        elseif ((arg2 == "SPELL_CAST_SUCCESS") and (arg10 == TB_CS)) then
            TBAbility = TB_GUI_CS;
        elseif ((arg2 == "SPELL_CAST_SUCCESS") and (arg4 == TBmyname) and
            (arg10 == TB_MB)) then -- Checks if your mocking blow was hit
            if (TBSettings[TBSettingsCharRealm].MBRecoveryStatus) then
                TBRecovery = 1;
                TBbadmob = arg7;
                TBAbility = TB_GUI_Taunt; -- Recovered taunts are handled like failed taunts.
            end
            if ((arg2 == "SPELL_MISSED") and (arg4 == TBmyname) and
                (arg10 == TB_MB)) then -- If your mocking blow didnt hit, then do ..
                TBbadmob = arg7;
                TBAbility = TB_GUI_MB;
            end
        end
    elseif ((englishClass == "DRUID") and (arg4 == TBmyname)) then
        if ((arg2 == "SPELL_MISSED") and (arg10 == TB_Growl) and
            (arg12 == "RESIST")) then -- Checks if your taunt was resisted
            TBbadmob = arg7;
            TBAbility = TB_GUI_Growl;
        elseif ((arg2 == "SPELL_CAST_SUCCESS") and (arg10 == TB_CR)) then -- Checks for Challenging Roar
            TBAbility = TB_GUI_CR;
        end
    elseif ((englishClass == "PALADIN") and (arg4 == TBmyname)) then
        if ((arg2 == "SPELL_MISSED") and (arg10 == TB_RD) and
            (arg12 == "RESIST")) then -- Checks if righteous defense resisted
            TBbadmob = arg7;
            TBAbility = TB_GUI_RD;
        end
    elseif ((arg7 == TBmyname) and (arg10 == TB_LG)) then
        TBAbility = TB_GUI_LG;
    end

end

function TankBuddy:EvaluateAuras(event, ...)
    removeBuffsDefensive = TankBuddy:SplitOptionsString(self.db.profile
                                                            .removeBuffsDefensive)
    removeBuffsAlways = TankBuddy:SplitOptionsString(self.db.profile
                                                         .removeBuffsAlways)
    local unit = ...

    if unit and unit ~= "player" then return end

    for i = 1, #removeBuffsAlways do
        local foundAura = self:HasAura(removeBuffsAlways[i])
        if foundAura then self:CancelAuraByName(foundAura) end
    end

    if GetShapeshiftForm(true) == tankFormID[classFile] then
        for i = 1, #removeBuffsDefensive do
            local foundAura = self:HasAura(removeBuffsDefensive[i])
            if foundAura then self:CancelAuraByName(foundAura) end
        end
    end
end

function TankBuddy:HasAura(auraName)
    if FindAuraByName(auraName, "player") then -- exact match
        self:SendMessage("Found exact match '" .. auraName .. "'")
        return auraName
    else -- fuzzy match
        local i = 1
        local auraAtIndex = nil
        local patternMatch = nil
        while true do
            auraAtIndex = UnitBuff("player", i)
            if auraAtIndex == nil then return nil end
            patternMatch = strmatch(string.lower(auraAtIndex),
                                    "(.*" .. string.lower(auraName) .. ".*)")
            if patternMatch then
                self:SendMessage("Found partial match '" .. patternMatch .. "'")
                return patternMatch
            end

            i = i + 1
        end
    end

    return nil
end

function TankBuddy:CancelAuraByName(auraName)
    if UnitAffectingCombat("player") then
        self:SendWarning(auraName .. " detected")
    else
        CancelSpellByName(auraName)
    end
end

function TankBuddy:PLAYER_DEAD(...) self:SendMessage("SnarkDead event") end

function TankBuddy:PLAYER_ALIVE(...) self:SendMessage("SnarkAlive event") end

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

function TankBuddy:SendMessage(msg)
    if (DEFAULT_CHAT_FRAME) then
        DEFAULT_CHAT_FRAME:AddMessage(L["TankBuddy"] .. ": " .. msg, 0.0, 1.0,
                                      0.0, 1.0);
    end
end

function TankBuddy:SendWarning(msg)
    if (UIErrorsFrame) then
        UIErrorsFrame:AddMessage(L["TankBuddy"] .. ": " .. msg, 1.0, 0.1, 0.1,
                                 5.0);
    end
    if (DEFAULT_CHAT_FRAME) then
        DEFAULT_CHAT_FRAME:AddMessage(L["TankBuddy"] .. ": " .. msg, 1.0, 0.1,
                                      0.1, 1.0);
    end
end

function TankBuddy:SplitOptionsString(var)
    local tbl = {}
    for v in string.gmatch(var, "[^,]+") do tinsert(tbl, strtrim(v)) end

    return tbl
end
