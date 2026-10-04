setfenv(1, VoiceOver)

--[[
Changes that apply to World of Warcraft: Forever only.
This is a separate file so that no file loaded by any other client has to change. Only AI_VoiceOver_Camelot.toc
lists it, and it switches itself off below on every client that is not Forever.
]]

-- Heuristic: Forever reports WOW_PROJECT_MAINLINE, like retail, but its interface number is still below 20000
-- (retail is 12xxxx), so a mainline project with a small interface number is taken to be Forever.
if not (Version.IsRetailMainline and Version.Interface < 20000) then return end

Version.IsRetailForever = true

-- Unit identity values (GUID, name, sex) can be secret on Forever: they can be passed around but not
-- compared, split, used as table keys or in gsub. Without issecretvalue nothing is secret.
local function IsSecret(value)
    return issecretvalue ~= nil and issecretvalue(value) and true or false
end

-- A secret GUID becomes "no NPC", which the callers already treat as "nothing to play".
local GetNPCGUID = Utils.GetNPCGUID
function Utils:GetNPCGUID()
    local guid = GetNPCGUID(self)
    if IsSecret(guid) then
        return nil
    end
    return guid
end

local GetNPCName = Utils.GetNPCName
function Utils:GetNPCName()
    local name = GetNPCName(self)
    if IsSecret(name) then
        return nil
    end
    return name
end

-- The original compares UnitSex, which throws on a secret value; an unprefixed filename is its own
-- "unknown gender" result.
local AddPlayerGenderToFilename = DataModules.AddPlayerGenderToFilename
function DataModules:AddPlayerGenderToFilename(fileName)
    if IsSecret(UnitSex("player")) then
        return fileName
    end
    return AddPlayerGenderToFilename(self, fileName)
end

-- Quest-log play buttons belong to the classic quest log window, which Forever doesn't have.
QuestOverlayUI.Update = function() end

-- Defined in VoiceOver's environment, so only this addon's SetCVar calls see it (_G.SetCVar stays
-- Blizzard's). Forever's SetCVar needs a valid public CVar; an unknown one becomes a silent no-op.
function SetCVar(name, value)
    if GetCVar(name) == nil then
        return false
    end
    return _G.SetCVar(name, value)
end
