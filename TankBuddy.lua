TankBuddy = LibStub("AceAddon-3.0"):NewAddon("TankBuddy", "AceConsole-3.0",
                                             "AceEvent-3.0")

TankBuddy.version = "3.0.1"

local L = LibStub("AceLocale-3.0"):GetLocale("TankBuddy")

local options = {
    name = "TankBuddy",
    handler = TankBuddy,
    type = "group",
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
        enable = {type = "toggle", name = L["EnableTankBuddy"]}
    }
}

local defaults = {profile = {enable = true}}

function TankBuddy:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("TankBuddyDB", defaults)

    LibStub("AceConfig-3.0"):RegisterOptionsTable("TankBuddy", options)

    self:RegisterChatCommand("tankbuddy", "ChatCommand")
    self:RegisterChatCommand("tb", "ChatCommand")

    self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(
                            "TankBuddy", "TankBuddy")
end

function TankBuddy:OnEnable()
    playerClass = UnitClass("player")

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
    InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
    InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
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
