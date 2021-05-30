﻿--[[
- Tank Buddy 2.4b3
- Author: Raeldar from Runetotem EU
- Contact: http://www.curse-gaming.com | USER NAME: Raespark

- Updated from:
-   Tank Buddy 2.1
-   Author: Kolthor from Doomhammer EU
-   Contact: http://www.curse-gaming.com | USER NAME: Kolthor
-
- Based on:
-	Taunt Buddy v1.33
-	Author: Artun Subasi
-	Kane from Magtherion EU (retired)
-	Contact: http://www.curse-gaming.com | USER NAME: Kane
--]] -- Globals
TBSettingsCharRealm = UnitName("player") .. "@" .. GetCVar("realmName");
TBmyname, TBmyrealm = UnitName("player");
TBbadmob = "";
TBfeltime = (GetTime() - 45);

TB_Channels = {
    {"CTRaid", TB_GUI_Channel_Ctraid, "MS "},
    {"RaidWarning", TB_GUI_Channel_RaidWarning, "RAID_WARNING"},
    {"Raid", TB_GUI_Channel_Raid, "RAID"},
    {"Guild", TB_GUI_Channel_Guild, "GUILD"},
    {"Party", TB_GUI_Channel_Party, "PARTY"},
    {"Yell", TB_GUI_Channel_Yell, "YELL"}, {"Say", TB_GUI_Channel_Say, "SAY"},
    {"Custom", TB_GUI_Channel_Custom, "CHANNEL"}
};
TB_Modes = {
    {"Raid", TB_GUI_Raid}, {"Party", TB_GUI_Party}, {"Alone", TB_GUI_Alone}
};

function TB_OnLoad()
    _, englishClass = UnitClass("player");
    if (englishClass == "WARRIOR") then
        TB_Tabs = {
            {TB_GUI_General, "Interface\\Icons\\Spell_Shadow_SoulGem"},
            {TB_GUI_Taunt, "Interface\\Icons\\Spell_Nature_Reincarnation"},
            {TB_GUI_MB, "Interface\\Icons\\Ability_Warrior_PunishingBlow"},
            {TB_GUI_LS, "Interface\\Icons\\Spell_Holy_AshesToAshes"},
            {TB_GUI_SW, "Interface\\Icons\\Ability_Warrior_ShieldWall"},
            {TB_GUI_CS, "Interface\\Icons\\Ability_BullRush"},
            {TB_GUI_LG, "Interface\\Icons\\INV_Misc_Gem_Pearl_05"}
        };
        TB_TankForm = 2; -- Defensive stance has Shapeshiftform number 2
        SalvDefensiveBearText:SetText(TB_GUI_RemoveBuffsDefensive);
    elseif (englishClass == "DRUID") then
        TB_Tabs = {
            {TB_GUI_General, "Interface\\Icons\\Spell_Shadow_SoulGem"},
            {TB_GUI_Growl, "Interface\\Icons\\Ability_Physical_Taunt"},
            {TB_GUI_CR, "Interface\\Icons\\Ability_Druid_ChallangingRoar"}
        };
        TB_TankForm = 1; -- Bear form has Shapeshiftform number 1
        SalvDefensiveBearText:SetText(TB_GUI_RemoveBuffsBear);
    elseif (englishClass == "PALADIN") then
        TB_Tabs = {
            {TB_GUI_General, "Interface\\Icons\\Spell_Shadow_SoulGem"},
            {TB_GUI_RD, "Interface\\Icons\\INV_Shoulder_37"}
        };
        TB_TankForm = 9; -- dummyshape shapeshift form
        SalvDefensiveBearText:SetText(TB_GUI_RemoveBuffsPally);
    else
        TB_Tabs = {{TB_GUI_General, "Interface\\Icons\\Spell_Shadow_SoulGem"}};
        TB_TankForm = nil;
        TB_DefensiveBearCheckButton:Hide();
        TB_EditboxRemoveBuffsInDefensiveBear:Hide();
    end
    NUM_TB_TABS = getn(TB_Tabs);
    MAX_TB_TABS = 8;

    TankBuddyFrame:RegisterEvent("VARIABLES_LOADED"); -- Jump to event function when variables are loaded

    SLASH_TBSLASH1 = "/tankbuddy"; -- /tankbuddy
    SLASH_TBSLASH2 = "/tb"; -- /tb
    SlashCmdList["TBSLASH"] = TB_SlashCommandHandler; -- List of slash commands

    for i = 1, NUM_TB_TABS, 1 do
        getglobal("TB_Tab" .. i).tooltiptext = TB_Tabs[i][1];
        getglobal("TB_Tab" .. i):SetNormalTexture(TB_Tabs[i][2]);
    end

    for i = 1, MAX_TB_TABS, 1 do
        if (i > NUM_TB_TABS) then
            getglobal("TB_Tab" .. i):Hide();
        else
            getglobal("TB_Tab" .. i):Show();
        end
    end

    TB_ButtonPaste:Disable(); -- The paste-button is disabled until the copy-button has been clicked
end

function TB_Tab_OnClick(id)
    if (not id) then id = this:GetID(); end
    TB_SetTab(id);
end

function TB_SetTab(id)
    if (not TankBuddyFrame.selectedTab) then
        getglobal("TB_Tab" .. id):SetChecked(1);
    else
        getglobal("TB_Tab" .. TankBuddyFrame.selectedTab):SetChecked(nil);
        if (TankBuddyFrame.selectedTab == 1) then
            TBSettings[TBSettingsCharRealm].AlwaysRemoveBuffs =
                TB_EditboxAlwaysRemoveBuffs:GetText();
            TBSettings[TBSettingsCharRealm].RemoveBuffsInDefensiveBear =
                TB_EditboxRemoveBuffsInDefensiveBear:GetText();
        else
            TBSettings[TBSettingsCharRealm].Announcements[TB_Tabs[TankBuddyFrame.selectedTab][1]]["Text"] =
                TB_EditboxText:GetText();
        end
    end
    if (id == 1) then
        TB_OtherOptions:Hide();
        TB_GeneralOptions:Show();
        TB_EditboxAlwaysRemoveBuffs:SetText(
            TBSettings[TBSettingsCharRealm].AlwaysRemoveBuffs);
        TB_EditboxRemoveBuffsInDefensiveBear:SetText(
            TBSettings[TBSettingsCharRealm].RemoveBuffsInDefensiveBear);
    else
        TB_OtherOptions:Show();
        TB_GeneralOptions:Hide();
        if (TB_Tabs[id][1] == TB_GUI_Taunt) then
            TB_MBRecoveryCheckButton:Show();
            if (TBSettings[TBSettingsCharRealm].MBRecoveryStatus) then
                TB_MBRecoveryEditboxText:Show();
            end
        else
            TB_MBRecoveryCheckButton:Hide();
            TB_MBRecoveryEditboxText:Hide();
        end
        if (TBSettings[TBSettingsCharRealm].Announcements[TB_GUI_Taunt]) then
            TB_MBRecoveryEditboxText:SetText(
                TBSettings[TBSettingsCharRealm].Announcements[TB_GUI_Taunt]["RecoveryText"]);
        end
        TB_EditboxText:SetText(
            TBSettings[TBSettingsCharRealm].Announcements[TB_Tabs[id][1]]["Text"]);
        TB_SetTextText:SetText(TB_GUI_EnterNewText[TB_Tabs[id][1]]);
    end

    TankBuddyFrame.selectedTab = id;
    HeaderText:SetText(TB_Tabs[id][1]);
    if (TBSettings) then TB_SetChannels(); end
end

function TB_SetChannels()
    if (TankBuddyFrame.selectedTab ~= 1) then
        for i = 1, getn(TB_Modes), 1 do
            for j = 1, getn(TB_Channels), 1 do
                if (getglobal("TB_" .. TB_Modes[i][1] .. TB_Channels[j][1] ..
                                  "CheckButton")) then
                    local Checked = TBSettings[TBSettingsCharRealm]
                                        .Announcements[TB_Tabs[TankBuddyFrame.selectedTab][1]][TB_Modes[i][2]][TB_Channels[j][2]];
                    getglobal("TB_" .. TB_Modes[i][1] .. TB_Channels[j][1] ..
                                  "CheckButton"):SetChecked(Checked);
                end
            end
        end
    end
end

function TB_Channels_OnClick()
    for i = 1, getn(TB_Modes), 1 do
        for j = 1, getn(TB_Channels), 1 do
            if (this:GetName() == "TB_" .. TB_Modes[i][1] .. TB_Channels[j][1] ..
                "CheckButton") then
                local Checked = this:GetChecked();
                TBSettings[TBSettingsCharRealm].Announcements[TB_Tabs[TankBuddyFrame.selectedTab][1]][TB_Modes[i][2]][TB_Channels[j][2]] =
                    Checked;
                if (TB_Channels[j][1] == "Custom") then
                    if (Checked) then
                        TB_SetCustomChannel(i);
                    else
                        TB_CustomChannelFrame:Hide();
                    end
                end
            end
        end
    end
end

function TB_OnEvent(event)
    local TBAbility = "";
    -- Execute this function whenever you get a string in the self damage spells section, or when variables are loaded.
    if (event == "COMBAT_LOG_EVENT_UNFILTERED") then
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

    elseif (event == "PLAYER_AURAS_CHANGED" or event ==
        "UPDATE_SHAPESHIFT_FORMS") then
        if (TBSettings[TBSettingsCharRealm].AlwaysRemoveBuffstatus) then
            local TB_Buffs = TB_strsplit(",+%s*",
                                         TBSettings[TBSettingsCharRealm]
                                             .AlwaysRemoveBuffs);
            for i = 1, getn(TB_Buffs), 1 do
                local TB_Buff = TB_PlayerBuff(TB_Buffs[i]);
                if (TB_Buff) then
                    CancelPlayerBuff(TB_Buff); -- Cancel it
                    TB_Sendmsg('"' .. TB_Buff .. '"' .. TB_output_buffremoved ..
                                   '"' .. TB_Buffs[i] .. '"');
                end
            end
        end
        if (TBSettings[TBSettingsCharRealm].DefensiveBearBuffstatus) then
            local _, _, TBactive, _ = GetShapeshiftFormInfo(TB_TankForm);
            local TBpallytanking = nil;
            if GetPlayerBuffName(TB_GUI_RF) then TBpallytanking = 1; end
            if ((TBactive) or (TBpallytanking)) and (TBfeltime > 50) then
                local TB_Buffs = TB_strsplit(",+%s*",
                                             TBSettings[TBSettingsCharRealm]
                                                 .RemoveBuffsInDefensiveBear);
                for i = 1, getn(TB_Buffs), 1 do
                    local TB_Buff = TB_PlayerBuff(TB_Buffs[i]);
                    if (TB_Buff) then
                        CancelPlayerBuff(TB_Buff); -- Cancel it
                        TB_Sendmsg('"' .. TB_Buff .. '" removed, matched "' ..
                                       TB_Buffs[i] .. '"');
                    end
                end
            end
        end

    elseif (event == "VARIABLES_LOADED") then
        -- load each option, set default if not there
        if (not TBSettings) then TBSettings = {}; end
        if (not TBSettings[TBSettingsCharRealm]) then
            TBSettings[TBSettingsCharRealm] = {};
        end

        if (not TBSettings[TBSettingsCharRealm].Announcements) then
            TBSettings[TBSettingsCharRealm].Announcements = {};
        end

        for i = 2, NUM_TB_TABS, 1 do
            if (not TBSettings[TBSettingsCharRealm].Announcements[TB_Tabs[i][1]]) then
                TBSettings[TBSettingsCharRealm].Announcements[TB_Tabs[i][1]] =
                    {};
            end
            if (not TBSettings[TBSettingsCharRealm].Announcements[TB_Tabs[i][1]]["Text"]) then
                TBSettings[TBSettingsCharRealm].Announcements[TB_Tabs[i][1]]["Text"] =
                    TB_defaultText[TB_Tabs[i][1]];
            end
            if (not TBSettings[TBSettingsCharRealm].Announcements[TB_Tabs[i][1]][TB_GUI_Raid]) then
                TBSettings[TBSettingsCharRealm].Announcements[TB_Tabs[i][1]][TB_GUI_Raid] =
                    {};
            end
            if (not TBSettings[TBSettingsCharRealm].Announcements[TB_Tabs[i][1]][TB_GUI_Party]) then
                TBSettings[TBSettingsCharRealm].Announcements[TB_Tabs[i][1]][TB_GUI_Party] =
                    {};
            end
            if (not TBSettings[TBSettingsCharRealm].Announcements[TB_Tabs[i][1]][TB_GUI_Alone]) then
                TBSettings[TBSettingsCharRealm].Announcements[TB_Tabs[i][1]][TB_GUI_Alone] =
                    {};
            end
        end

        if (TBSettings[TBSettingsCharRealm].Announcements[TB_GUI_Taunt]) then
            if (not TBSettings[TBSettingsCharRealm].Announcements[TB_GUI_Taunt]["RecoveryText"]) then
                TBSettings[TBSettingsCharRealm].Announcements[TB_GUI_Taunt]["RecoveryText"] =
                    TB_defaultText_r;
            end
        end

        if (not TBSettings[TBSettingsCharRealm].status) then
            TBSettings[TBSettingsCharRealm].status = 1; -- Default value is 1 for status
        end

        -- TB_Sendmsg("Tank Buddy " .. TB_version .. TB_output_startup);			-- Tank Buddy loading message

        if (not TBSettings[TBSettingsCharRealm].AlwaysRemoveBuffs) then
            TBSettings[TBSettingsCharRealm].AlwaysRemoveBuffs = TB_intellect ..
                                                                    ", " ..
                                                                    TB_wisdom;
        end
        if (not TBSettings[TBSettingsCharRealm].RemoveBuffsInDefensiveBear) then
            TBSettings[TBSettingsCharRealm].RemoveBuffsInDefensiveBear =
                TB_salvation;
        end

        -- Remove unused variables from older versions
        if (TBSettings[TBSettingsCharRealm].SalvDefensiveBearstatus) then
            TBSettings[TBSettingsCharRealm].SalvDefensiveBearstatus = nil;
        end
        if (TBSettings[TBSettingsCharRealm].Salvstatus) then
            TBSettings[TBSettingsCharRealm].Salvstatus = nil;
        end

        TB_EnableCheckButton:SetChecked(TBSettings[TBSettingsCharRealm].status);
        if (TBSettings[TBSettingsCharRealm].status == 1) then
            TB_DisableInBGCheckButton:Enable();
            TB_register(); -- Registers the event of self spell damage on startup
        else
            TB_DisableInBGCheckButton:Disable();
        end
        TB_DefensiveBearCheckButton:SetChecked(
            TBSettings[TBSettingsCharRealm].DefensiveBearBuffstatus);
        if (TBSettings[TBSettingsCharRealm].DefensiveBearBuffstatus) then
            TB_EditboxRemoveBuffsInDefensiveBear:Show();
        else
            TB_EditboxRemoveBuffsInDefensiveBear:Hide();
        end
        TB_AlwaysRemoveCheckButton:SetChecked(
            TBSettings[TBSettingsCharRealm].AlwaysRemoveBuffstatus);
        if (TBSettings[TBSettingsCharRealm].AlwaysRemoveBuffstatus) then
            TB_EditboxAlwaysRemoveBuffs:Show();
        else
            TB_EditboxAlwaysRemoveBuffs:Hide();
        end
        TB_MBRecoveryCheckButton:SetChecked(
            TBSettings[TBSettingsCharRealm].MBRecoveryStatus);
        TB_DisableInBGCheckButton:SetChecked(
            TBSettings[TBSettingsCharRealm].BGStatus);

        TB_SetTab(1); -- Set default tab		
    end

    if (TBAbility and TBAbility ~= "") then
        local NotInBG = 1;
        if (TBSettings[TBSettingsCharRealm].BGStatus) then
            for i = 1, MAX_BATTLEFIELD_QUEUES do
                local status, _, _, _, _, _ = GetBattlefieldStatus(i);
                if (status == "active") then NotInBG = nil; end
            end
        end
        if (NotInBG) then TB_Announce(TBAbility); end
    end
end

-- Split text into a list consisting of the strings in text,
-- separated by strings matching delimiter (which may be a pattern). 
-- example: TB_strsplit(",%s*", "Anna, Bob, Charlie,Dolores")
function TB_strsplit(delimiter, text)
    local list = {}
    local pos = 1
    if string.find("", delimiter, 1) then -- this would result in endless loops
        error("delimiter matches empty string!")
    end
    while 1 do
        local first, last = string.find(text, delimiter, pos)
        if first then -- found?
            tinsert(list, strsub(text, pos, first - 1))
            pos = last + 1
        else
            tinsert(list, strsub(text, pos))
            break
        end
    end
    return list
end

-- SLASH COMMAND HANDLER --
function TB_SlashCommandHandler(msg)
    local command = string.lower(msg);

    -- Console command: /TB ON --
    if (command == TB_cmd_on) then
        if (TBSettings[TBSettingsCharRealm].status == 1) then -- Checks if Tank Buddy is already enabled
            TB_Sendmsg(TB_output_alreadyOn);
        else -- If not enabled..
            TB_Sendmsg(TB_output_on);
            TBSettings[TBSettingsCharRealm].status = 1; -- Enables Tank Buddy
            TB_register();
            TB_CheckButton:SetChecked(1);
        end

        -- Console command: /TB OFF --
    elseif (command == TB_cmd_off) then
        if (TBSettings[TBSettingsCharRealm].status == 0) then -- Checks if Tank Buddy is already disabled
            TB_Sendmsg(TB_output_alreadyOff);
        else -- if not disabled..
            TB_Sendmsg(TB_output_off);
            TBSettings[TBSettingsCharRealm].status = 0; -- Disables Tank Buddy
            TB_unregister();
            TB_CheckButton:SetChecked(0);
        end

        -- Console Command: /TB --
    elseif (command == "") then
        TankBuddyFrame:Show();

        -- Console Command: Unknown command or syntax error --
    else
        TankBuddyFrame:Show();
    end
end
-- END OF SLASH COMMAND HANDLER --

function TB_Test()
    TBSettings[TBSettingsCharRealm].Announcements[TB_Tabs[TankBuddyFrame.selectedTab][1]]["Text"] =
        TB_EditboxText:GetText();
    TB_Announce(TB_Tabs[TankBuddyFrame.selectedTab][1], 1);
end

function TB_Announce(TBAbility, TBTest)
    if (TBAbility) then
        local TBText;
        if (TBAbility == TB_GUI_Taunt and TBRecovery) then
            if (TB_TauntFailInfo) then
                local TBTime = GetTime() - TB_TauntFailInfo.Time;
                if (TBTime < TB_GetTauntCD()) then
                    if (UnitName("target") .. UnitLevel("target") ==
                        TB_TauntFailInfo.Target) then
                        TBText =
                            TBSettings[TBSettingsCharRealm].Announcements[TBAbility]["RecoveryText"];
                    else
                        TBText = nil;
                    end
                else
                    TB_TauntFailInfo = nil;
                end
            end
        else
            TBText =
                TBSettings[TBSettingsCharRealm].Announcements[TBAbility]["Text"];
        end
        if (TBText) then
            if (TBAbility == TB_GUI_Taunt or TBAbility == TB_GUI_MB or TBAbility ==
                TB_GUI_Growl or TBAbility == TB_GUI_RD) then
                if (string.find(TBText, "$ttn")) then
                    if (UnitName("targettarget")) then
                        TBText = string.gsub(TBText, "$ttn",
                                             UnitName("targettarget"));
                    else
                        TBText = string.gsub(TBText, "$ttn", "<no target>");
                    end
                end
                if (string.find(TBText, "$ttl")) then
                    if (UnitLevel("targettarget") < 0) then
                        TBText = string.gsub(TBText, "$ttl", "??");
                    else
                        TBText = string.gsub(TBText, "$ttl",
                                             UnitLevel("targettarget"));
                    end
                end
                if (string.find(TBText, "$ttt")) then
                    if (UnitCreatureType("targettarget")) then
                        TBText = string.gsub(TBText, "$ttt",
                                             UnitCreatureType("targettarget"));
                    else
                        TBText = string.gsub(TBText, "$ttt", "Unknown");
                    end
                end
                if (string.find(TBText, "$tn")) then
                    TBText = string.gsub(TBText, "$tn", TBbadmob);
                end
                if (string.find(TBText, "$tl")) then
                    if (UnitLevel("target") < 0) then
                        TBText = string.gsub(TBText, "$tl", "??");
                    else
                        TBText = string.gsub(TBText, "$tl", UnitLevel("target"));
                    end
                end
                if (string.find(TBText, "$tt")) then
                    if (UnitCreatureType("target")) then
                        TBText = string.gsub(TBText, "$tt",
                                             UnitCreatureType("target"));
                    else
                        TBText = string.gsub(TBText, "$tt", "Unknown");
                    end
                end
            elseif (TBAbility == TB_GUI_SW) then
                TBText = string.gsub(TBSettings[TBSettingsCharRealm]
                                         .Announcements[TBAbility]["Text"],
                                     "$sec", TB_GetSWDuration());
            elseif (TBAbility == TB_GUI_LS) then
                TBText = string.gsub(TBSettings[TBSettingsCharRealm]
                                         .Announcements[TBAbility]["Text"],
                                     "$sec", "20");
                TBText = string.gsub(TBText, "$hp", math.floor(
                                         (UnitHealthMax("player") / 130) * 30));
            elseif (TBAbility == TB_GUI_LG) then
                TBText = string.gsub(TBSettings[TBSettingsCharRealm]
                                         .Announcements[TBAbility]["Text"],
                                     "$sec", "20");
                TBText = string.gsub(TBText, "$hp", "1500");
            elseif (TBAbility == TB_GUI_CS or TBAbility == TB_GUI_CR) then
                TBText = string.gsub(TBSettings[TBSettingsCharRealm]
                                         .Announcements[TBAbility]["Text"],
                                     "$sec", "6");
            end

            if (TBTest) then TBText = "TEST " .. TBText .. " TEST"; end

            local TB_grp = TB_GUI_Alone;
            if GetNumPartyMembers() > 0 then
                if (UnitInRaid("player")) then
                    TB_grp = TB_GUI_Raid;
                elseif (UnitInParty("player")) then
                    TB_grp = TB_GUI_Party;
                end
            end
            for i = 1, getn(TB_Channels), 1 do
                if (TBSettings[TBSettingsCharRealm].Announcements[TBAbility][TB_grp][TB_Channels[i][2]]) then
                    -- Channel option: CTRAID --
                    if (TB_Channels[i][3] == "MS ") then
                        if (IsAddOnLoaded("CT_RaidAssist")) then
                            CT_RA_AddMessage("MS " .. TBText); -- Announcement in CT raid channel (if you can)
                        end
                        -- Channel option: CHANNEL --
                    elseif (TB_Channels[i][3] == "CHANNEL") then
                        local TB_CustChannels = TB_strsplit("%s+",
                                                            TBSettings[TBSettingsCharRealm]
                                                                .Announcements[TBAbility][TB_grp]
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
                        SendChatMessage(TBText, TB_Channels[i][3]); -- Announcement in say, yell, party, raid or raid_warning channels
                    end
                end
            end
        end
    end
end

function TB_register()
    TankBuddyFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
    TankBuddyFrame:RegisterEvent("PLAYER_AURAS_CHANGED");
    TankBuddyFrame:RegisterEvent("UPDATE_SHAPESHIFT_FORMS");
end

function TB_unregister()
    TankBuddyFrame:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
    TankBuddyFrame:UnregisterEvent("PLAYER_AURAS_CHANGED");
    TankBuddyFrame:UnregisterEvent("UPDATE_SHAPESHIFT_FORMS");
end

function TB_Sendmsg(msg)
    if (DEFAULT_CHAT_FRAME) then
        DEFAULT_CHAT_FRAME:AddMessage(msg, 0.0, 1.0, 0.0, 1.0);
    end
end

function TB_GetSWDuration()
    -- nameTalent, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(tabIndex, talentIndex);
    local SW_dur = 10; -- Default duration
    local _, _, _, _, currRank, _ = GetTalentInfo(3, 13); -- Get rank of Improved Shield Wall
    if (currRank == 1) then
        SW_dur = SW_dur + 3; -- Rank 1 gives 3 seconds extra
    elseif (currRank == 2) then
        SW_dur = SW_dur + 5; -- Rank 2 gives 5 seconds extra (total)
    end
    _, _, _, _, currRank, _ = GetTalentInfo(1, 18); -- Get rank of Improved Disciplines (New in 2.0)
    if (currRank > 0) then
        SW_dur = SW_dur + (2 * currRank); -- Each rank gives 2 seconds extra
    end
    return SW_dur;
end

function TB_GetTauntCD()
    local TauntCD_dur = 10; -- Default cooldown of Taunt
    local newtauntcd = 10;
    local _, _, _, _, currRank, _ = GetTalentInfo(3, 12); -- Get rank of Improved Taunt
    newtauntcd = TauntCD_dur - currRank;
    if (englishClass == "PALADIN") then newtauntcd = 15; end
    return newtauntcd;
end

function TB_toggleStatus()
    if (TBSettings[TBSettingsCharRealm].status == 0) then
        TBSettings[TBSettingsCharRealm].status = 1;
        TB_DisableInBGCheckButton:Enable();
        TB_register();
    else
        TBSettings[TBSettingsCharRealm].status = 0;
        TB_DisableInBGCheckButton:Disable();
        TB_unregister();
    end
end

function TB_SetCustomChannel(i)
    TB_CustomChannelFrame:Show();
    TB_ButtonCloseCustom:SetID(i);
    if (TBSettings[TBSettingsCharRealm].Announcements[TB_Tabs[TankBuddyFrame.selectedTab][1]][TB_Modes[i][2]]
        .Channels) then
        TB_EditboxCustom:SetText(
            TBSettings[TBSettingsCharRealm].Announcements[TB_Tabs[TankBuddyFrame.selectedTab][1]][TB_Modes[i][2]]
                .Channels);
    else
        TB_EditboxCustom:SetText("");
    end
end

function TB_CloseCustomChannel()
    TB_CustomChannelFrame:Hide();
    if (string.find(TB_EditboxCustom:GetText(), "(%w+)")) then
        TBSettings[TBSettingsCharRealm].Announcements[TB_Tabs[TankBuddyFrame.selectedTab][1]][TB_Modes[this:GetID()][2]]
            .Channels = TB_EditboxCustom:GetText();
    end
end

function TB_Copy()
    TB_Clipboard = {};
    for i = 1, getn(TB_Modes), 1 do
        TB_Clipboard[TB_Modes[i][1]] = {};
        for j = 1, getn(TB_Channels), 1 do
            TB_Clipboard[TB_Modes[i][1]][TB_Channels[j][1]] =
                TBSettings[TBSettingsCharRealm].Announcements[TB_Tabs[TankBuddyFrame.selectedTab][1]][TB_Modes[i][2]][TB_Channels[j][2]];
        end
        TB_Clipboard[TB_Modes[i][1]]["Channels"] =
            TBSettings[TBSettingsCharRealm].Announcements[TB_Tabs[TankBuddyFrame.selectedTab][1]][TB_Modes[i][2]]
                .Channels;
    end
    TB_ButtonPaste:Enable();
end

function TB_Paste()
    if (TB_Clipboard) then
        for i = 1, getn(TB_Modes), 1 do
            for j = 1, getn(TB_Channels), 1 do
                if (getglobal("TB_" .. TB_Modes[i][1] .. TB_Channels[j][1] ..
                                  "CheckButton")) then
                    TBSettings[TBSettingsCharRealm].Announcements[TB_Tabs[TankBuddyFrame.selectedTab][1]][TB_Modes[i][2]][TB_Channels[j][2]] =
                        TB_Clipboard[TB_Modes[i][1]][TB_Channels[j][1]];
                end
            end
            TBSettings[TBSettingsCharRealm].Announcements[TB_Tabs[TankBuddyFrame.selectedTab][1]][TB_Modes[i][2]]
                .Channels = TB_Clipboard[TB_Modes[i][1]]["Channels"];
        end
    end
    TB_SetChannels();
end

function TB_Close()
    TankBuddyFrame:Hide();
    TB_Clipboard = nil; -- Empty clipboard to save memory
    TB_ButtonPaste:Disable(); -- Disable paste-button since clipboard is empty
    if (TankBuddyFrame.selectedTab == 1) then
        TBSettings[TBSettingsCharRealm].AlwaysRemoveBuffs =
            TB_EditboxAlwaysRemoveBuffs:GetText();
        TBSettings[TBSettingsCharRealm].RemoveBuffsInDefensiveBear =
            TB_EditboxRemoveBuffsInDefensiveBear:GetText();
    else
        TBSettings[TBSettingsCharRealm].Announcements[TB_Tabs[TankBuddyFrame.selectedTab][1]]["Text"] =
            TB_EditboxText:GetText();
        if (englishClass == "WARRIOR") then
            TBSettings[TBSettingsCharRealm].Announcements[TB_GUI_Taunt]["RecoveryText"] =
                TB_MBRecoveryEditboxText:GetText();
        end
    end
end

function TB_Help()
    if (TB_HelpFrame:IsShown()) then
        TB_HelpFrame:Hide();
    else
        TB_HelpFrame:Show();
    end
end

function TB_PlayerBuff(buff)
    local i = 0;
    if (not GetPlayerBuffName(i)) then i = 1; end
    while (GetPlayerBuffName(i)) do
        if (string.find(GetPlayerBuffName(i), buff)) then
            return GetPlayerBuffName(i);
        end
        i = i + 1;
    end
end

function TB_toggleRemoveBuffStatus()
    if (this:GetName() == "TB_AlwaysRemoveCheckButton") then
        TBSettings[TBSettingsCharRealm].AlwaysRemoveBuffstatus =
            this:GetChecked();
        if (TBSettings[TBSettingsCharRealm].AlwaysRemoveBuffstatus) then -- If you want buffs removed
            TB_EditboxAlwaysRemoveBuffs:Show();
            TankBuddyFrame:RegisterEvent("PLAYER_AURAS_CHANGED");
        else
            TB_EditboxAlwaysRemoveBuffs:Hide();
            TankBuddyFrame:UnregisterEvent("PLAYER_AURAS_CHANGED");
        end
    elseif (this:GetName() == "TB_DefensiveBearCheckButton") then
        TBSettings[TBSettingsCharRealm].DefensiveBearBuffstatus =
            this:GetChecked();
        if (TBSettings[TBSettingsCharRealm].DefensiveBearBuffstatus) then
            TB_EditboxRemoveBuffsInDefensiveBear:Show();
            TankBuddyFrame:RegisterEvent("UPDATE_SHAPESHIFT_FORMS");
        else
            TB_EditboxRemoveBuffsInDefensiveBear:Hide();
            TankBuddyFrame:UnregisterEvent("UPDATE_SHAPESHIFT_FORMS");
        end
    end
end

function TB_toggleBGStatus()
    TBSettings[TBSettingsCharRealm].BGStatus = this:GetChecked();
end

function TB_toggleParryStatus()
    TBSettings[TBSettingsCharRealm].ParryStatus = this:GetChecked();
end

function TB_toggleMBRecovery()
    TBSettings[TBSettingsCharRealm].MBRecoveryStatus = this:GetChecked();
    if (TBSettings[TBSettingsCharRealm].MBRecoveryStatus) then
        TB_MBRecoveryEditboxText:Show();
    else
        TB_MBRecoveryEditboxText:Hide();
        TB_TauntFailInfo = nil;
    end
end
