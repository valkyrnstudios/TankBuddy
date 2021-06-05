TankBuddy = LibStub("AceAddon-3.0"):NewAddon("TankBuddy", "AceConsole-3.0",
                                             "AceEvent-3.0")

TankBuddy.version = "3.0.1"

local L = LibStub("AceLocale-3.0"):GetLocale("TankBuddy")
local FindAuraByName = AuraUtil.FindAuraByName
local strmatch = string.match
local playerName = UnitName("player")

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
                helpHeader = {type = 'header', name = L["Help"], order = 3},
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
    ["WARRIOR"] = L["Abilities"]["Taunt"]["Default"],
    ["DRUID"] = L["Abilities"]["Growl"]["Default"],
    ["PALADIN"] = L["Abilities"]["RD"]["Default"]
}

local defaultCSResistText = {
    ["WARRIOR"] = L["Abilities"]["CS"]["Default"],
    ["DRUID"] = L["Abilities"]["CR"]["Default"],
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
                name = L["RemoveBuffs"]["Title"],
                order = 1,
                args = {
                    removeBuffsAlways = {
                        type = 'input',
                        name = L["RemoveBuffs"]["Always"],
                        width = "full"
                    },
                    removeBuffsDefensive = {
                        type = 'input',
                        name = L["RemoveBuffs"][classFile],
                        width = "full"
                    }
                }
            },
            taunt = {
                type = 'group',
                name = L["Abilities"]["Taunt"]["Name"],
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
                        name = L["Abilities"]["Taunt"]["Prompt"]
                    },
                    header = {type = 'header', name = "Announcement table TODO"}
                }
            },
            mockingBlow = {
                type = 'group',
                name = L["Abilities"]["MB"]["Name"],
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
                name = L["Abilities"]["LS"]["Name"],
                order = 4,
                args = {
                    lsAnnounceText = {
                        type = 'input',
                        width = "full",
                        name = L["Abilities"]["LS"]["Prompt"]
                    },
                    header = {type = 'header', name = "Announcement table TODO"}
                }
            },
            shieldWall = {
                type = 'group',
                name = L["Abilities"]["SW"]["Name"],
                order = 5,
                args = {
                    swAnnounceText = {
                        type = 'input',
                        width = "full",
                        name = L["Abilities"]["SW"]["Prompt"]
                    },
                    header = {type = 'header', name = "Announcement table TODO"}
                }
            },
            challengingShout = {
                type = 'group',
                name = L["Abilities"]["CS"]["Name"],
                order = 6,
                args = {
                    csAnnounceText = {
                        type = 'input',
                        width = "full",
                        name = L["Abilities"]["CS"]["Prompt"]
                    },
                    header = {type = 'header', name = "Announcement table TODO"}
                }
            },
            items = {
                type = 'group',
                name = L["Items"]["LG"]["Name"],
                order = 7,
                args = {
                    itemAnnounceText = {
                        type = 'input',
                        width = "full",
                        name = L["Items"]["LG"]["Prompt"]
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
                name = L["RemoveBuffs"]["Title"],
                order = 1,
                args = {
                    removeBuffsAlways = {
                        type = 'input',
                        name = L["RemoveBuffs"]["Always"],
                        width = "full"
                    },
                    removeBuffsDefensive = {
                        type = 'input',
                        name = L["RemoveBuffs"][classFile],
                        width = "full"
                    }
                }
            },
            taunt = {
                type = 'group',
                name = L["Abilities"]["Growl"]["Name"],
                order = 2,
                args = {
                    tauntResistText = {
                        type = 'input',
                        width = "full",
                        name = L["Abilities"]["Growl"]["Prompt"]
                    },
                    header = {type = 'header', name = "Announcement table TODO"}
                }
            },
            challengingShout = {
                type = 'group',
                name = L["Abilities"]["CR"]["Name"],
                order = 3,
                args = {
                    csAnnounceText = {
                        type = 'input',
                        width = "full",
                        name = L["Abilities"]["CR"]["Prompt"]
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
                name = L["RemoveBuffs"]["Title"],
                order = 1,
                args = {
                    removeBuffsAlways = {
                        type = 'input',
                        name = L["RemoveBuffs"]["Always"],
                        width = "full"
                    },
                    removeBuffsDefensive = {
                        type = 'input',
                        name = L["RemoveBuffs"][classFile],
                        width = "full"
                    }
                }
            },
            taunt = {
                type = 'group',
                name = L["Abilities"]["RD"]["Name"],
                order = 2,
                args = {
                    tauntResistText = {
                        type = 'input',
                        width = "full",
                        name = L["Abilities"]["RD"]["Prompt"]
                    },
                    header = {type = 'header', name = "Announcement table TODO"}
                }
            },
            items = {
                type = 'group',
                name = L["Items"]["LG"]["Name"],
                order = 3,
                args = {
                    itemAnnounceText = {
                        type = 'input',
                        width = "full",
                        name = L["Items"]["LG"]["Prompt"]
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
        removeBuffsDefensive = L["Auras"]["Salvation"], -- TODO toggle box salvation
        announceTauntRecovery = true,
        tauntResistText = defaultTauntResistText[classFile],
        csAnnounceText = defaultCSResistText[classFile],
        mbResistText = L["Abilities"]["MB"]["Default"], -- TODO toggle announce
        lsAnnounceText = L["Abilities"]["LS"]["Default"],
        swAnnounceText = L["Abilities"]["SW"]["Default"],
        itemAnnounceText = L["Items"]["LG"]["Default"]
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

    removeBuffsDefensive = TankBuddy:SplitOptionsString(self.db.profile
                                                            .removeBuffsDefensive)
    removeBuffsAlways = TankBuddy:SplitOptionsString(self.db.profile
                                                         .removeBuffsAlways)
end

function TankBuddy:GetAnnounceText(abilityName)
    if abilityName == L["Abilities"]["MB"]["Name"] then
        return self.db.profile.mbResistText
    elseif abilityName == L["Abilities"]["LS"]["Name"] then
        return self.db.profile.lsAnnounceText
    elseif abilityName == L["Abilities"]["LS"]["Name"] .. "D" then
        return L["Abilities"]["LS"]["Name"] .. " " .. L["Done"]
    elseif abilityName == L["Abilities"]["SW"]["Name"] then
        return self.db.profile.swAnnounceText
    elseif abilityName == L["Abilities"]["SW"]["Name"] .. "D" then
        return L["Abilities"]["SW"]["Name"] .. " " .. L["Done"]
    elseif abilityName == L["Items"]["LG"]["Name"] then
        return self.db.profile.itemAnnounceText
    elseif abilityName == L["Abilities"]["CS"]["Name"] then
        return self.db.profile.csAnnounceText
    elseif abilityName == L["Abilities"]["Taunt"]["Name"] then
        return self.db.profile.tauntResistText
    else
        self:SendWarning("Unrecognized abilityName: " .. abilityName)
        return nil
    end
end

function TankBuddy:COMBAT_LOG_EVENT_UNFILTERED(event)
    return self:CombatLogHandler(CombatLogGetCurrentEventInfo())
end

function TankBuddy:CombatLogHandler(...)
    local abilityName, badMob, tauntRecovered, announceArgs
    local timestamp, subevent, _, sourceGUID, sourceName, sourceFlags,
          sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags = ...

    local amount, overkill, school, resisted, blocked, absorbed, critical,
          glancing, crushing, isOffHand

    local spellId, spellName, spellSchool

    local eventKind = subevent:sub(0, 5)

    if eventKind == "SWING" then
        amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing, isOffHand =
            select(12, ...)
    elseif eventKind == "SPELL" then
        spellId, spellName, spellSchool, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing, isOffHand =
            select(12, ...)
    end

    if subevent == "SPELL_AURA_APPLIED" and sourceName == playerName and
        spellName == L["Abilities"]["FR"]["Name"] then -- Checks for Fel Rage
        feltTime = GetTime();
    elseif classFile == "WARRIOR" and sourceName == playerName then
        if spellName == L["Abilities"]["Taunt"]["Name"] then -- and resisted then -- Checks if your taunt was resisted
            if subevent == "SPELL_MISSED" then
                -- TODO exclude pvp
                abilityName = L["Abilities"]["Taunt"]["Name"];
                if self.db.profile.announceTauntRecovery then
                    announceArgs = {
                        ["Target"] = UnitName("target") .. UnitLevel("target"),
                        ["Time"] = GetTime(),
                        ["tauntRecovered"] = false,
                        ["badMob"] = destName
                    }
                end
            end
        elseif spellName == L["Abilities"]["SW"]["Name"] then
            if subevent == "SPELL_CAST_SUCCESS" then
                abilityName = L["Abilities"]["SW"]["Name"];
            elseif subevent == "SPELL_AURA_REMOVED" then
                abilityName = L["Abilities"]["SW"]["Name"] .. "D";
            end
        elseif spellName == L["Abilities"]["LS"]["Name"] then
            if subevent == "SPELL_CAST_SUCCESS" then
                abilityName = L["Abilities"]["LS"]["Name"];
            elseif subevent == "SPELL_AURA_REMOVED" then
                abilityName = L["Abilities"]["LS"]["Name"] .. "D";
            end
        elseif subevent == "SPELL_CAST_SUCCESS" and spellName ==
            L["Abilities"]["CS"]["Name"] then
            abilityName = L["Abilities"]["CS"]["Name"];
        elseif subevent == "SPELL_CAST_SUCCESS" and sourceName == playerName and
            spellName == L["Abilities"]["MB"]["Name"] then -- Checks if your mocking blow was hit
            -- TODO false positive
            if self.db.profile.announceTauntRecovery then
                announceArgs["tauntRecovered"] = true
                announceArgs["badMob"] = destName

                abilityName = L["Abilities"]["Taunt"]["Name"]; -- Recovered taunts are handled like failed taunts.
            end
            if subevent == "SPELL_MISSED" and sourceName == playerName and
                spellName == L["Abilities"]["MB"]["Name"] then -- If your mocking blow didnt hit, then do ..
                announceArgs = {["badMob"] = destName}
                abilityName = L["Abilities"]["MB"]["Name"];
            end
        end
    elseif classFile == "DRUID" and sourceName == playerName then
        if subevent == "SPELL_MISSED" and spellName ==
            L["Abilities"]["Growl"]["Name"] then -- Checks if your taunt was resisted
            announceArgs = {["badMob"] = destName}
            abilityName = L["Abilities"]["Growl"]["Name"];
        elseif subevent == "SPELL_CAST_SUCCESS" and spellName ==
            L["Abilities"]["CR"]["Name"] then -- Checks for Challenging Roar
            abilityName = L["Abilities"]["CR"]["Name"];
        end
    elseif classFile == "PALADIN" and sourceName == playerName then
        if subevent == "SPELL_MISSED" and spellName ==
            L["Abilities"]["RD"]["Name"] then -- Checks if righteous defense resisted
            announceArgs = {["badMob"] = destName}
            abilityName = L["Abilities"]["RD"]["Name"];
        end
    elseif sourceName == playerName and spellName == L["Items"]["LG"]["Name"] then -- TODO listen to item activated event
        abilityName = L["Items"]["LG"]["LG"]["Name"];
    end

    if abilityName then self:Announce(abilityName, announceArgs) end
end

function TankBuddy:Announce(abilityName, announceArgs)
    -- TODO https://github.com/Gamemechanicwow/Tankbuddy/blob/889e00965bb3ae21c69594dcd602e863b8f4d8b5/TankBuddy.lua#L357-L364
    if not abilityName then
        self:SendWarning("Improper Announce received")
        return
    end

    local announcementText;

    if abilityName == L["Abilities"]["Taunt"]["Name"] and announceArgs and
        announceArgs.tauntRecovered then
        if announceArgs.tauntFailInfo then
            local TBTime = GetTime() - announceArgs.tauntFailInfo.Time;
            if TBTime < TankBuddy:GetTauntCD() then
                if UnitName("target") .. UnitLevel("target") ==
                    announceArgs.tauntFailInfo.Target then
                    announcementText = L["Default"]["recovery"];
                else
                    announcementText = nil;
                end
            end
        end
    else
        announcementText = self:GetAnnounceText(abilityName);
    end

    if not announcementText then do return end end

    if abilityName == L["Abilities"]["Taunt"]["Name"] or abilityName ==
        L["Abilities"]["MB"]["Name"] or abilityName ==
        L["Abilities"]["Growl"]["Name"] or abilityName ==
        L["Abilities"]["RD"]["Name"] then
        if string.find(announcementText, "$ttn") then
            if UnitName("targettarget") then
                announcementText = string.gsub(announcementText, "$ttn",
                                               UnitName("targettarget"));
            else
                announcementText = string.gsub(announcementText, "$ttn",
                                               "<no target>");
            end
        end
        if string.find(announcementText, "$ttl") then
            if UnitLevel("targettarget") < 0 then
                announcementText = string.gsub(announcementText, "$ttl", "??");
            else
                announcementText = string.gsub(announcementText, "$ttl",
                                               UnitLevel("targettarget"));
            end
        end
        if string.find(announcementText, "$ttt") then
            if UnitCreatureType("targettarget") then
                announcementText = string.gsub(announcementText, "$ttt",
                                               UnitCreatureType("targettarget"));
            else
                announcementText = string.gsub(announcementText, "$ttt",
                                               "Unknown");
            end
        end
        if string.find(announcementText, "$tn") then
            announcementText = string.gsub(announcementText, "$tn",
                                           announceArgs.badMob);
        end
        if string.find(announcementText, "$tl") then
            if UnitLevel("target") < 0 then
                announcementText = string.gsub(announcementText, "$tl", "??");
            else
                announcementText = string.gsub(announcementText, "$tl",
                                               UnitLevel("target"));
            end
        end
        if string.find(announcementText, "$tt") then
            if UnitCreatureType("target") then
                announcementText = string.gsub(announcementText, "$tt",
                                               UnitCreatureType("target"));
            else
                announcementText = string.gsub(announcementText, "$tt",
                                               "Unknown");
            end
        end
    elseif abilityName == L["Abilities"]["SW"]["Name"] then
        announcementText = string.gsub(self:GetAnnounceText(abilityName),
                                       "$sec", TankBuddy:GetSWDuration());
    elseif abilityName == L["Abilities"]["LS"]["Name"] then
        announcementText = string.gsub(self:GetAnnounceText(abilityName),
                                       "$sec", "20");
        announcementText = string.gsub(announcementText, "$hp", math.floor(
                                           (UnitHealthMax("player") / 130) * 30));
    elseif abilityName == L["Items"]["LG"]["Name"] then
        announcementText = string.gsub(self:GetAnnounceText(abilityName),
                                       "$sec", "20");
        announcementText = string.gsub(announcementText, "$hp", "1500");
    elseif abilityName == L["Abilities"]["CS"]["Name"] or abilityName ==
        L["Abilities"]["CR"]["Name"] then
        announcementText = string.gsub(self:GetAnnounceText(abilityName),
                                       "$sec", "6");
    end

    local channel = L["Channel"]["Emote"];
    if GetNumGroupMembers() > 0 then
        if UnitInRaid("player") then
            -- TODO raidwarning, if option enabled
            -- L["Channel"]["RaidWarning"]
            channel = L["Channel"]["Raid"];
        elseif UnitInParty("player") then
            channel = L["Channel"]["Party"];
        end
    end

    SendChatMessage(announcementText, string.upper(channel), nil);

end

function TankBuddy:GetSWDuration()
    -- nameTalent, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(tabIndex, talentIndex);
    local SW_dur = 10; -- Default duration
    local _, _, _, _, currRank, _ = GetTalentInfo(3, 13); -- Get rank of Improved Shield Wall
    if currRank == 1 then
        SW_dur = SW_dur + 3; -- Rank 1 gives 3 seconds extra
    elseif currRank == 2 then
        SW_dur = SW_dur + 5; -- Rank 2 gives 5 seconds extra (total)
    end
    _, _, _, _, currRank, _ = GetTalentInfo(1, 18); -- Get rank of Improved Disciplines (New in 2.0)
    if currRank > 0 then
        SW_dur = SW_dur + (2 * currRank); -- Each rank gives 2 seconds extra
    end
    return SW_dur;
end

function TankBuddy:GetTauntCD()
    local TauntCD_dur = 10; -- Default cooldown of Taunt
    local newtauntcd = 10;
    local _, _, _, _, currRank, _ = GetTalentInfo(3, 12); -- Get rank of Improved Taunt
    newtauntcd = TauntCD_dur - currRank;
    if (classFile == "PALADIN") then newtauntcd = 15; end
    return newtauntcd;
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
        if foundAura then
            self:CancelAuraByName(foundAura, removeBuffsAlways[i])
        end
    end

    if GetShapeshiftForm(true) == tankFormID[classFile] then -- TODO L["Auras"]["RF"]
        for i = 1, #removeBuffsDefensive do
            local foundAura = self:HasAura(removeBuffsDefensive[i])
            if foundAura then
                self:CancelAuraByName(foundAura, removeBuffsDefensive[i])
            end
        end
    end
end

function TankBuddy:HasAura(auraName)
    if FindAuraByName(auraName, "player") then -- exact match
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
            if patternMatch then return patternMatch end

            i = i + 1
        end
    end

    return nil
end

function TankBuddy:CancelAuraByName(auraName, match)
    if UnitAffectingCombat("player") then
        self:SendWarning(auraName .. " detected")
    else
        self:SendMessage('"' .. auraName .. '"' .. L["output_buffremoved"] ..
                             '"' .. match .. '"')
        CancelSpellByName(auraName)
    end
end

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
