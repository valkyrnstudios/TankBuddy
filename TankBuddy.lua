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
        removeBuffsDefensive = L["salvation"], -- TODO toggle box salvation
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
    self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
    self:RegisterEvent("UPDATE_SHAPESHIFT_FORM", "EvaluateAuras");
    self:RegisterEvent("UNIT_AURA", "EvaluateAuras");

    self:RegisterEvent("PLAYER_DEAD");
    self:RegisterEvent("PLAYER_ALIVE");

    removeBuffsDefensive = TankBuddy:SplitOptionsString(self.db.profile
                                                            .removeBuffsDefensive)
    removeBuffsAlways = TankBuddy:SplitOptionsString(self.db.profile
                                                         .removeBuffsAlways)
end

function TankBuddy:COMBAT_LOG_EVENT_UNFILTERED(...)
    -- self:SendMessage("Combat log event")
    local timestamp, subevent, _, sourceGUID, sourceName, sourceFlags,
          sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags = ...
    local spellId, spellName, spellSchool
    local amount, overkill, school, resisted, blocked, absorbed, critical,
          glancing, crushing, isOffHand

    if subevent == "SWING_DAMAGE" then
        amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing, isOffHand =
            select(12, ...)
    elseif subevent == "SPELL_DAMAGE" then
        spellId, spellName, spellSchool, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing, isOffHand =
            select(12, ...)
    end

    if arg2 then
        -- self:SendMessage("Arg2 " .. arg2)
    elseif arg3 then
        self:SendMessage("Arg3 " .. arg3)
    elseif arg4 then
        self:SendMessage("Arg4 " .. arg4)
    elseif arg5 then
        self:SendMessage("Arg5 " .. arg5)
    elseif arg6 then
        self:SendMessage("Arg6 " .. arg6)
    elseif arg7 then
        self:SendMessage("Arg7 " .. arg7)
    elseif arg8 then
        self:SendMessage("Arg8 " .. arg8)
    elseif arg9 then
        self:SendMessage("Arg9 " .. arg9)
    elseif arg10 then
        self:SendMessage("Arg10 " .. arg10)
    end

    do return end

    if ((arg2 == "SPELL_AURA_APPLIED") and (arg7 == UnitName("player")) and
        (arg10 == L["FR"])) then -- Checks for Fel Rage
        TBfeltime = GetTime();
    elseif ((classFile == "WARRIOR") and (arg4 == UnitName("player"))) then
        if ((arg2 == "SPELL_MISSED") and (arg10 == L["Taunt"]) and
            (arg12 == "RESIST")) then -- Checks if your taunt was resisted
            badMob = arg7;
            abilityName = L["Taunt"];
            TBRecovery = nil;
            if self.db.profile.announceTauntRecovery then
                tauntFailInfo = {
                    ["Target"] = UnitName("target") .. UnitLevel("target"),
                    ["Time"] = GetTime()
                }
            end
        elseif ((arg2 == "SPELL_CAST_SUCCESS") and (arg10 == L["SW"])) then
            abilityName = L["SW"];
        elseif ((arg2 == "SPELL_CAST_SUCCESS") and (arg10 == L["LS"])) then
            abilityName = L["LS"];
        elseif ((arg2 == "SPELL_CAST_SUCCESS") and (arg10 == L["CS"])) then
            abilityName = L["CS"];
        elseif ((arg2 == "SPELL_CAST_SUCCESS") and (arg4 == UnitName("player")) and
            (arg10 == L["MB"])) then -- Checks if your mocking blow was hit
            if (self.db.profile.announceTauntRecovery) then
                TBRecovery = 1;
                badMob = arg7;
                abilityName = L["Taunt"]; -- Recovered taunts are handled like failed taunts.
            end
            if ((arg2 == "SPELL_MISSED") and (arg4 == UnitName("player")) and
                (arg10 == L["MB"])) then -- If your mocking blow didnt hit, then do ..
                badMob = arg7;
                abilityName = L["MB"];
            end
        end
    elseif ((classFile == "DRUID") and (arg4 == UnitName("player"))) then
        if ((arg2 == "SPELL_MISSED") and (arg10 == L["Growl"]) and
            (arg12 == "RESIST")) then -- Checks if your taunt was resisted
            badMob = arg7;
            abilityName = L["Growl"];
        elseif ((arg2 == "SPELL_CAST_SUCCESS") and (arg10 == L["CR"])) then -- Checks for Challenging Roar
            abilityName = L["CR"];
        end
    elseif ((classFile == "PALADIN") and (arg4 == UnitName("player"))) then
        if ((arg2 == "SPELL_MISSED") and (arg10 == L["RD"]) and
            (arg12 == "RESIST")) then -- Checks if righteous defense resisted
            badMob = arg7;
            abilityName = L["RD"];
        end
    elseif ((arg7 == UnitName("player")) and (arg10 == L["LG"])) then
        abilityName = L["LG"];
    end

    if abilityName then self:Announce(abilityName, tauntFailInfo) end
end

function TankBuddy:Announce(abilityName, tauntFailInfo)
    -- TODO https://github.com/Gamemechanicwow/Tankbuddy/blob/889e00965bb3ae21c69594dcd602e863b8f4d8b5/TankBuddy.lua#L357-L364
    self:SendMessage(abilityName)

    if abilityName then
        local TBText;
        if (abilityName == L["Taunt"] and TBRecovery) then
            if tauntFailInfo then
                local TBTime = GetTime() - tauntFailInfo.Time;
                if TBTime < TB_GetTauntCD() then
                    if (UnitName("target") .. UnitLevel("target") ==
                        tauntFailInfo.Target) then
                        TBText =
                            TBSettings[TBSettingsCharRealm].Announcements[abilityName]["RecoveryText"];
                    else
                        TBText = nil;
                    end
                else
                    tauntFailInfo = nil;
                end
            end
        else
            TBText =
                TBSettings[TBSettingsCharRealm].Announcements[abilityName]["Text"];
        end
        if (TBText) then
            if (abilityName == L["Taunt"] or abilityName == L["MB"] or
                abilityName == L["Growl"] or abilityName == L["RD"]) then
                if string.find(TBText, "$ttn") then
                    if (UnitName("targettarget")) then
                        TBText = string.gsub(TBText, "$ttn",
                                             UnitName("targettarget"));
                    else
                        TBText = string.gsub(TBText, "$ttn", "<no target>");
                    end
                end
                if string.find(TBText, "$ttl") then
                    if (UnitLevel("targettarget") < 0) then
                        TBText = string.gsub(TBText, "$ttl", "??");
                    else
                        TBText = string.gsub(TBText, "$ttl",
                                             UnitLevel("targettarget"));
                    end
                end
                if string.find(TBText, "$ttt") then
                    if (UnitCreatureType("targettarget")) then
                        TBText = string.gsub(TBText, "$ttt",
                                             UnitCreatureType("targettarget"));
                    else
                        TBText = string.gsub(TBText, "$ttt", "Unknown");
                    end
                end
                if string.find(TBText, "$tn") then
                    TBText = string.gsub(TBText, "$tn", TBbadmob);
                end
                if string.find(TBText, "$tl") then
                    if (UnitLevel("target") < 0) then
                        TBText = string.gsub(TBText, "$tl", "??");
                    else
                        TBText = string.gsub(TBText, "$tl", UnitLevel("target"));
                    end
                end
                if string.find(TBText, "$tt") then
                    if (UnitCreatureType("target")) then
                        TBText = string.gsub(TBText, "$tt",
                                             UnitCreatureType("target"));
                    else
                        TBText = string.gsub(TBText, "$tt", "Unknown");
                    end
                end
            elseif abilityName == L["SW"] then
                TBText = string.gsub(TBSettings[TBSettingsCharRealm]
                                         .Announcements[abilityName]["Text"],
                                     "$sec", TB_GetSWDuration());
            elseif abilityName == L["LS"] then
                TBText = string.gsub(TBSettings[TBSettingsCharRealm]
                                         .Announcements[abilityName]["Text"],
                                     "$sec", "20");
                TBText = string.gsub(TBText, "$hp", math.floor(
                                         (UnitHealthMax("player") / 130) * 30));
            elseif abilityName == L["LG"] then
                TBText = string.gsub(TBSettings[TBSettingsCharRealm]
                                         .Announcements[abilityName]["Text"],
                                     "$sec", "20");
                TBText = string.gsub(TBText, "$hp", "1500");
            elseif (abilityName == L["CS"] or abilityName == L["CR"]) then
                TBText = string.gsub(TBSettings[TBSettingsCharRealm]
                                         .Announcements[abilityName]["Text"],
                                     "$sec", "6");
            end

            if (TBTest) then TBText = "TEST " .. TBText .. " TEST"; end

            local TB_grp = L["Alone"];
            if GetNumPartyMembers() > 0 then
                if (UnitInRaid("player")) then
                    TB_grp = L["Raid"];
                elseif (UnitInParty("player")) then
                    TB_grp = L["Party"];
                end
            end
            for i = 1, getn(TB_Channels), 1 do
                if (TBSettings[TBSettingsCharRealm].Announcements[abilityName][TB_grp][TB_Channels[i][2]]) then
                    -- Channel option: CTRAID --
                    if (TB_Channels[i][3] == "MS ") then
                        if (IsAddOnLoaded("CT_RaidAssist")) then
                            CT_RA_AddMessage("MS " .. TBText); -- Announcement in CT raid channel (if you can)
                        end
                        -- Channel option: CHANNEL --
                    elseif (TB_Channels[i][3] == "CHANNEL") then
                        local TB_CustChannels = TB_strsplit("%s+",
                                                            TBSettings[TBSettingsCharRealm]
                                                                .Announcements[abilityName][TB_grp]
                                                                .Channels);
                        for j = 1, getn(TB_CustChannels), 1 do
                            local TB_channelId, TB_channelName = GetChannelName(
                                                                     TB_CustChannels[j]);
                            if (TB_channelId > 0) then -- Checks if you are still in that channel
                                SendChatMessage(TBText, "CHANNEL", nil,
                                                TB_channelId);
                            end
                        end
                        -- Everything else --
                    else
                        self:SendChatMessage(TBText, TB_Channels[i][3]); -- Announcement in say, yell, party, raid or raid_warning channels
                    end
                end
            end
        end
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
