﻿local addonName, TankBuddy = ...

local addon = nil

addon = LibStub("AceAddon-3.0"):NewAddon(TankBuddy, addonName, "AceConsole-3.0", "AceEvent-3.0")

addon.Version = GetAddOnMetadata(addonName, "Version")

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)
local FindAuraByName, fmt, gsub, find, lower = AuraUtil.FindAuraByName, string.format, string.gsub, string.find,
    string.lower

local localeClass, classFile = UnitClass("player")

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
                InterfaceOptionsFrame_OpenToCategory(L[addonName])
                InterfaceOptionsFrame_OpenToCategory(L[addonName])
            end
        },
        enable = {
            type = "toggle",
            name = L["EnableTankBuddy"],
            order = 1
        },
        disableInBG = {
            type = "toggle",
            name = L["DisableInBG"],
            order = 2
        },
        help = {
            type = "group",
            name = L["Help"],
            order = 1,
            args = {
                introHeader = {
                    type = 'header',
                    name = "Intro",
                    order = 1
                },
                intro = {
                    type = 'description',
                    width = "full",
                    name = L["IntroText"],
                    order = 2
                },
                helpHeader = {
                    type = 'header',
                    name = L["Help"],
                    order = 3
                },
                help = {
                    type = 'description',
                    width = "full",
                    name = L["HelpText"],
                    order = 4
                }
            }
        },
        buffRemoval = {
            type = 'group',
            name = L["RemoveBuffs"].Title,
            order = 2,
            args = {
                removeBuffsAlways = {
                    type = 'input',
                    name = L["RemoveBuffs"].Always,
                    width = "full"
                },
                removeBuffsDefensive = {
                    type = 'input',
                    name = L["RemoveBuffs"][classFile],
                    width = "full"
                }
            }
        },
        items = {
            type = 'group',
            name = L["Items"].Title,
            order = 4,
            args = {
                announceItems = {
                    type = 'toggle',
                    name = L["EnableAnnounce"],
                    order = 1
                },
                announceItemsChannel = {
                    type = 'select',
                    name = "Channel",
                    order = 2,
                    values = {
                        ["EMOTE"] = L["Channel"].Emote,
                        ["YELL"] = L["Channel"].Yell,
                        ["PARTY"] = L["Channel"].Party,
                        ["RAID"] = L["Channel"].Raid,
                        ["RAID_WARNING"] = L["Channel"]["Raid Warning"]
                    }
                },
                announceItemsText = { -- TODO validate
                    type = 'input',
                    width = "full",
                    name = L["Items"].Prompt,
                    multiline = true,
                    order = 3
                }
            }
        }
    }
}

local defaultannounceTauntResistText = {
    ["WARRIOR"] = L["Abilities"].Taunt.Default,
    ["DRUID"] = L["Abilities"].Growl.Default,
    ["PALADIN"] = L["Abilities"].RD.Default
}

local defaultannounceTauntImmuneText = {
    ["WARRIOR"] = L["Abilities"].Taunt.Immune,
    ["DRUID"] = L["Abilities"].Growl.Immune,
    ["PALADIN"] = L["Abilities"].RD.Immune
}

local defaultannounceCSText = {
    ["WARRIOR"] = L["Abilities"].CS.Default,
    ["DRUID"] = L["Abilities"].CR.Default,
    ["PALADIN"] = ""
}

local tankFormID = {
    ["WARRIOR"] = 2,
    ["DRUID"] = 1,
    ["PALADIN"] = 9
}

if classFile == "WARRIOR" then
    options.args.classOptions = {
        name = localeClass,
        type = "group",
        order = 3,
        args = {
            taunt = {
                type = 'group',
                name = L["Abilities"].Taunt.Name,
                order = 2,
                args = {
                    announceTaunt = {
                        type = 'toggle',
                        name = L["EnableAnnounce"],
                        order = 1
                    },
                    announceTauntResistText = {
                        type = 'input',
                        width = "full",
                        name = L["Abilities"].Taunt.Prompt,
                        order = 2
                    }

                }
            },
            mockingBlow = {
                type = 'group',
                name = L["Abilities"].MB.Name,
                order = 3,
                args = {
                    announceMB = {
                        type = 'toggle',
                        name = L["EnableAnnounce"],
                        order = 1
                    },
                    announceMBResistText = {
                        type = 'input',
                        width = "full",
                        name = L["EnterNewMBRecoveryText"],
                        order = 2
                    }
                }
            },
            lastStand = {
                type = 'group',
                name = L["Abilities"].LS.Name,
                order = 4,
                args = {
                    announceLS = {
                        type = 'toggle',
                        name = L["EnableAnnounce"],
                        order = 1
                    },
                    announceLSText = {
                        type = 'input',
                        width = "full",
                        name = L["Abilities"].LS.Prompt,
                        order = 2
                    }
                }
            },
            shieldWall = {
                type = 'group',
                name = L["Abilities"].SW.Name,
                order = 5,
                args = {
                    announceSW = {
                        type = 'toggle',
                        name = L["EnableAnnounce"],
                        order = 1
                    },
                    announceSWText = {
                        type = 'input',
                        width = "full",
                        name = L["Abilities"].SW.Prompt,
                        order = 2
                    }
                }
            },
            challengingShout = {
                type = 'group',
                name = L["Abilities"].CS.Name,
                order = 6,
                args = {
                    announceCS = {
                        type = 'toggle',
                        name = L["EnableAnnounce"],
                        order = 1
                    },
                    announceCSText = {
                        type = 'input',
                        width = "full",
                        name = L["Abilities"].CS.Prompt,
                        order = 2
                    }
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
            taunt = {
                type = 'group',
                name = L["Abilities"].Growl.Name,
                order = 2,
                args = {
                    announceTaunt = {
                        type = 'toggle',
                        name = L["EnableAnnounce"],
                        order = 1
                    },
                    announceTauntResistText = {
                        type = 'input',
                        width = "full",
                        name = L["Abilities"].Growl.Prompt,
                        order = 2
                    }
                }
            },
            challengingShout = {
                type = 'group',
                name = L["Abilities"].CR.Name,
                order = 3,
                args = {
                    announceCS = {
                        type = 'toggle',
                        name = L["EnableAnnounce"],
                        order = 1
                    },
                    announceCSText = {
                        type = 'input',
                        width = "full",
                        name = L["Abilities"].CR.Prompt,
                        order = 2
                    }
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
            taunt = {
                type = 'group',
                name = L["Abilities"].RD.Name,
                order = 2,
                args = {
                    announceTaunt = {
                        type = 'toggle',
                        name = L["EnableAnnounce"],
                        order = 1
                    },
                    announceTauntResistText = {
                        type = 'input',
                        width = "full",
                        name = L["Abilities"].RD.Prompt,
                        order = 2
                    }
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
        removeBuffsDefensive = L["Auras"].Salvation,
        announceTaunt = true,
        announceTauntResistText = defaultannounceTauntResistText[classFile],
        announceTauntImmuneText = defaultannounceTauntImmuneText[classFile],
        announceCSText = defaultannounceCSText[classFile],
        announceCS = true,
        announceMBResistText = L["Abilities"].MB.Default,
        announceMB = true,
        announceLSText = L["Abilities"].LS.Default,
        announceLS = true,
        announceSWText = L["Abilities"].SW.Default,
        announceSW = true,
        announceItemsText = L["Items"].Default,
        announceItemsChannel = "EMOTE",
        announceItems = true
    }
}

function addon:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("TankBuddyDB", defaults, true)

    LibStub("AceConfig-3.0"):RegisterOptionsTable(addonName, options)

    self:RegisterChatCommand(lower(addonName), "ChatCommand")
    self:RegisterChatCommand("tb", "ChatCommand")

    LibStub("AceConfigDialog-3.0"):AddToBlizOptions(addonName, L[addonName])

    self.playerName = UnitName("player")
end

function addon:OnEnable()
    self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
    self:RegisterEvent("UPDATE_SHAPESHIFT_FORM", "EvaluateAuras");
    self:RegisterEvent("UNIT_AURA", "EvaluateAuras");

    self:UpdateCache()
end

function addon:GetAnnounceText(abilityName)
    if abilityName == L["Abilities"].MB.Name then

        return self.db.profile.announceTaunt and self.db.profile.announceMBResistText or nil

    elseif abilityName == L["Abilities"].LS.Name then

        return self.db.profile.announceLS and self.db.profile.announceLSText or nil

    elseif abilityName == L["Abilities"].LS.Name .. "D" then

        return self.db.profile.announceLS and L["Abilities"].LS.Name .. " " .. L["Done"] or nil

    elseif abilityName == L["Abilities"].SW.Name then

        return self.db.profile.announceSW and self.db.profile.announceSWText or nil

    elseif abilityName == L["Abilities"].SW.Name .. "D" then

        return self.db.profile.announceSW and L["Abilities"].SW.Name .. " " .. L["Done"] or nil

    elseif abilityName == L["Abilities"].CS.Name or abilityName == L["Abilities"].CR.Name then

        return self.db.profile.announceCS and self.db.profile.announceCSText or nil

    elseif abilityName == L["Abilities"].Taunt.Name or abilityName == L["Abilities"].Growl.Name or abilityName ==
        L["Abilities"].RD.Name then

        return self.db.profile.announceTaunt and self.db.profile.announceTauntResistText or nil

    elseif abilityName == L["Abilities"].Taunt.Name .. 'I' or abilityName == L["Abilities"].Growl.Name .. 'I' or
        abilityName == L["Abilities"].RD.Name .. 'I' then

        return self.db.profile.announceTaunt and self.db.profile.announceTauntImmuneText or nil

    end

    return nil
end

function addon:COMBAT_LOG_EVENT_UNFILTERED(...)
    local _, subevent, _, _, sourceName, _, _, destGUID, _, _, _, _, spellName, _, missType =
        CombatLogGetCurrentEventInfo()

    if sourceName ~= self.playerName or subevent:sub(0, 5) ~= "SPELL" then
        return
    end

    if UnitInBattleground("player") ~= nil and self.db.profile.disableInBG then
        return
    end

    local abilityData = {
        Name = nil
    }

    local announceArgs = {
        ["Target"] = destGUID or nil
    }

    if classFile == "WARRIOR" then
        if subevent == "SPELL_MISSED" and spellName == L["Abilities"].Taunt.Name and not UnitIsPlayer("target") then
            if self.db.profile.announceTaunt then
                announceArgs["Time"] = GetTime()

                if missType == "IMMUNE" then
                    abilityData.Name = spellName .. 'I'
                else
                    abilityData.Name = spellName
                end
            end
        elseif spellName == L["Abilities"].SW.Name then
            if subevent == "SPELL_CAST_SUCCESS" then
                abilityData.Name = spellName
            elseif subevent == "SPELL_AURA_REMOVED" then
                abilityData.Name = spellName .. "D"
            end
        elseif spellName == L["Abilities"].LS.Name then
            if subevent == "SPELL_CAST_SUCCESS" then
                abilityData.Name = spellName
            elseif subevent == "SPELL_AURA_REMOVED" then
                abilityData.Name = spellName .. "D"
            end
        elseif subevent == "SPELL_CAST_SUCCESS" and spellName == L["Abilities"].CS.Name then
            abilityData.Name = spellName
        elseif subevent == "SPELL_MISSED" and spellName == L["Abilities"].MB.Name and self.db.profile.announceTaunt then
            abilityData.Name = spellName
        end
    elseif classFile == "DRUID" then
        if subevent == "SPELL_MISSED" and spellName == L["Abilities"].Growl.Name and self.db.profile.announceTaunt and
            not UnitIsPlayer("target") then
            if missType == "IMMUNE" then
                abilityData.Name = spellName .. 'I'
            else
                abilityData.Name = spellName
            end
        elseif subevent == "SPELL_CAST_SUCCESS" and spellName == L["Abilities"].CR.Name then
            abilityData.Name = spellName
        end
    elseif classFile == "PALADIN" then
        if subevent == "SPELL_MISSED" and spellName == L["Abilities"].RD.Name and self.db.profile.announceTaunt and
            not UnitIsPlayer("target") then

            if missType == "IMMUNE" then
                abilityData.Name = spellName .. 'I'
            else
                abilityData.Name = spellName
            end
        end
    end

    if abilityData.Name == nil and subevent == "SPELL_CAST_SUCCESS" and self.itemAnnounceCache[spellName] ~= nil then
        abilityData.Name = spellName
    end

    if abilityData.Name then
        if subevent == "SPELL_AURA_REMOVED" then
            self:Announce(abilityData, announceArgs)
        else
            self:Announce(self:GetBuffData(abilityData.Name) or abilityData, announceArgs)
        end
    end
end

function addon:GetBuffData(buffName)
    local name, duration, source, spellId
    for i = 1, 40 do
        name, _, _, _, duration, _, source, _, _, spellId = UnitBuff("Player", i)
        if not name then
            return nil
        elseif buffName == name then
            return {
                Name = name,
                Duration = duration,
                Source = source,
                SpellId = spellId
            }
        end
    end
end

function addon:Announce(abilityData, announceArgs)
    if not abilityData or not abilityData.Name then
        self:SendWarning("Improper Announce received")
        return
    end

    local announcementText

    if abilityData.Name == L["Abilities"].MB.Name and announceArgs then
        if announceArgs then
            local TBTime = GetTime() - announceArgs.Time
            if TBTime < self:GetTauntCD() then
                if UnitGUID("target") == announceArgs.Target then
                    announcementText = L["Default"].recovery
                else
                    announcementText = nil
                end
            end
        end
    else
        announcementText = self:GetAnnounceText(abilityData.Name)
    end

    if not announcementText then
        local itemData = self.itemAnnounceCache[abilityData.Name]

        if itemData == nil then
            return
        end

        announcementText = gsub(L["Items"].Template, "$sec", abilityData.Duration)

        announcementText = gsub(announcementText, "$effect", itemData["effect"])

        SendChatMessage(announcementText, self.db.profile.announceItemsChannel, nil)
        return
    end

    if abilityData.Name == L["Abilities"].Taunt.Name or abilityData.Name == L["Abilities"].MB.Name or abilityData.Name ==
        L["Abilities"].Growl.Name or abilityData.Name == L["Abilities"].RD.Name or abilityData.Name ==
        L["Abilities"].Taunt.Name .. 'I' or abilityData.Name == L["Abilities"].MB.Name or abilityData.Name ==
        L["Abilities"].Growl.Name .. 'I' or abilityData.Name == L["Abilities"].RD.Name .. 'I' then

        if find(announcementText, "$ttn") then
            if UnitName("targettarget") then
                announcementText = gsub(announcementText, "$ttn", UnitName("targettarget"));
            else
                announcementText = gsub(announcementText, "$ttn", "<no target>");
            end
        end

        if find(announcementText, "$ttl") then
            if UnitLevel("targettarget") < 0 then
                announcementText = gsub(announcementText, "$ttl", "??");
            else
                announcementText = gsub(announcementText, "$ttl", UnitLevel("targettarget"));
            end
        end

        if find(announcementText, "$ttt") then
            if UnitCreatureType("targettarget") then
                announcementText = gsub(announcementText, "$ttt", UnitCreatureType("targettarget"));
            else
                announcementText = gsub(announcementText, "$ttt", "Unknown");
            end
        end

        if find(announcementText, "$tn") then
            local name, _ = UnitName("target")
            announcementText = gsub(announcementText, "$tn", name);
        end

        if find(announcementText, "$tl") then
            if UnitLevel("target") < 0 then
                announcementText = gsub(announcementText, "$tl", "??");
            else
                announcementText = gsub(announcementText, "$tl", UnitLevel("target"))
            end
        end

        if find(announcementText, "$tt") then
            if UnitCreatureType("target") then
                announcementText = gsub(announcementText, "$tt", UnitCreatureType("target"));
            else
                announcementText = gsub(announcementText, "$tt", "Unknown");
            end
        end
    elseif abilityData.Name == L["Abilities"].SW.Name then

        announcementText = gsub(self:GetAnnounceText(abilityData.Name), "$sec", abilityData.Duration)

    elseif abilityData.Name == L["Abilities"].LS.Name then

        announcementText = gsub(self:GetAnnounceText(abilityData.Name), "$sec", abilityData.Duration)
        announcementText = gsub(announcementText, "$hp", math.floor((UnitHealthMax("player") / 130) * 30))

    elseif abilityData.Name == L["Abilities"].CS.Name or abilityData.Name == L["Abilities"].CR.Name then

        announcementText = gsub(self:GetAnnounceText(abilityData.Name), "$sec", "6")

    end

    local channel = "EMOTE"
    local inInstance, _ = IsInInstance()

    if GetNumGroupMembers() > 0 then
        if inInstance then -- Can use Yell inside
            channel = "YELL"
        else -- Cannot use Yell outside
            if UnitInRaid("player") then
                channel = "RAID"
            elseif UnitInParty("player") then
                channel = "PARTY"
            end
        end
    end

    if announcementText then
        SendChatMessage(announcementText, channel, nil)
    end
end

function addon:GetTauntCD()
    if classFile == "PALADIN" then
        return 15
    end

    local _, _, _, _, impTauntRank, _ = GetTalentInfo(3, 12) -- Get rank of Improved Taunt

    return 10 - impTauntRank
end

function addon:EvaluateAuras(_, unitTarget)
    if unitTarget and unitTarget ~= "player" then
        return
    end

    for i = 1, #self.removeBuffsAlways do
        local foundAura = self:HasAura(self.removeBuffsAlways[i])
        if foundAura then
            self:CancelAuraByName(foundAura, self.removeBuffsAlways[i])
        end
    end

    if GetShapeshiftForm(true) == tankFormID[classFile] or classFile == "PALADIN" and self:HasAura(L["Auras"].RF) then
        for i = 1, #self.removeBuffsDefensive do
            local foundAura = self:HasAura(self.removeBuffsDefensive[i])
            if foundAura then
                self:CancelAuraByName(foundAura, self.removeBuffsDefensive[i])
            end
        end
    end
end

function addon:HasAura(auraName)
    if FindAuraByName(auraName, "player") then -- exact match
        return auraName
    else -- fuzzy match
        local auraAtIndex = nil
        local patternMatch = nil
        for i = 1, 40 do
            auraAtIndex = UnitBuff("player", i)
            if auraAtIndex == nil then
                return nil
            end
            patternMatch = string.match(lower(auraAtIndex), fmt("(.*%s.*)", lower(auraName)))
            if patternMatch then
                return patternMatch
            end
        end
    end

    return nil
end

function addon:CancelAuraByName(auraName, match)
    if InCombatLockdown() then
        self:SendWarning(auraName .. " detected")
    else
        self:SendMessage(fmt('\"%s\" %s %s', auraName, L["output_buffremoved"], match))
        CancelSpellByName(auraName)
    end
end

function addon:ChatCommand(input)
    local cmd = input:trim()

    if not cmd or cmd == "" then
        InterfaceOptionsFrame_OpenToCategory(L[addonName])
        InterfaceOptionsFrame_OpenToCategory(L[addonName])
    elseif cmd == "reset" then
        self:SendMessage("Reset settings")
        self.db:ResetProfile()
    end
end

function addon:getProfileOption(info)
    return self.db.profile[info[#info]]
end

function addon:setProfileOption(info, value)
    local key = info[#info]
    self.db.profile[key] = value

    self:UpdateCache()
end

function addon:UpdateCache()
    self.removeBuffsDefensive = self:SplitOptionsString(self.db.profile.removeBuffsDefensive)
    self.removeBuffsAlways = self:SplitOptionsString(self.db.profile.removeBuffsAlways)

    local announceItemsList = {strsplit('\n', self.db.profile.announceItemsText)}
    local buff, effect

    self.itemAnnounceCache = {}

    for _, itemData in ipairs(announceItemsList) do
        if itemData == "" then
            return
        end

        buff, effect = strsplit(',', itemData)

        self.itemAnnounceCache[buff] = {
            effect = effect
        }
    end
end

function addon:SendMessage(msg)
    if SELECTED_CHAT_FRAME then
        SELECTED_CHAT_FRAME:AddMessage(fmt("%s: %s", L["TankBuddy"], msg), 0.0, 1.0, 0.0, 1.0);
    end
end

function addon:SendWarning(msg)
    if UIErrorsFrame then
        UIErrorsFrame:AddMessage(fmt("%s: %s", L["TankBuddy"], msg), 1.0, 0.1, 0.1, 5.0);
    end
    if SELECTED_CHAT_FRAME then
        SELECTED_CHAT_FRAME:AddMessage(fmt("%s: %s", L["TankBuddy"], msg), 1.0, 0.1, 0.1, 1.0);
    end
end

function addon:SplitOptionsString(var)
    local tbl = {}
    for v in string.gmatch(var, "[^,]+") do
        tinsert(tbl, strtrim(v))
    end

    return tbl
end
