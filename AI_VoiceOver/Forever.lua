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
