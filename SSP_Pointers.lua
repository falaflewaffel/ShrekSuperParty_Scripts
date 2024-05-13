local Pointers = {}

local function isUSA()
    return ReadValueString(0x0, 6) == "GSYE6S"
end

local function getMinigameTimerPointer()
    if (isUSA()) then
        minigameTimerBase = 0x802ca468

    else
        minigameTimerBase = 0x802e7788
    end
    return GetPointerNormal(minigameTimerBase, 0xfc, 0x144)
end
Pointers.getMinigameTimerPointer = getMinigameTimerPointer

return Pointers