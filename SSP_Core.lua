local Pointers = require("SSP_Pointers")
local core = {}

local function isUSA()
    return ReadValueString(0x0, 6) == "GSYE6S"
end

local function getMapPosition()
    realmValue = 0
    spaceValue = 0
    realmText = ""
    spaceCount = 0
    spacesToGo = 0

    if (isUSA()) then
        realmValue = ReadValue8(0x80468927)
        spaceValue = ReadValue32(0x80468928)
    
    else
        realmValue = ReadValue8(0x804b3ce7)
        spaceValue = ReadValue32(0x804b3ce8)
    end

    
    if (realmValue == 0) then
        realmText = "Town Square"

    elseif (realmValue == 1) then
        realmText = "Keep"
        spaceCount = spaceValue - (0 * 20)

    elseif (realmValue == 2) then
        realmText = "Windmill"
        spaceCount = spaceValue - (1 * 20)

    elseif (realmValue == 3) then
        realmText = "Swamp"
        spaceCount = spaceValue - (2 * 20)

    elseif (realmValue == 4) then
        realmText = "Castle"
        spaceCount = spaceValue - (3 * 20)

    elseif (realmValue == 5) then
        realmText = "Farm"
        spaceCount = spaceValue - (4 * 20)

    elseif (realmValue == 6) then
        realmText = "Bog"
        spaceCount = spaceValue - (5 * 20)
    
    end

    if (realmValue ~= 6) then
        spacesToGo = 21 - spaceCount
    else
        spacesToGo = 5 - spaceCount
    end

    if (spaceValue == 0) then
        spaceCount = 0
        spacesToGo = 0
    end

    return {realm = realmText, spaces = spaceCount, remainingSpaces = spacesToGo}
end
core.getMapPosition = getMapPosition


local function getOrbCount()
    if (isUSA()) then
    return {
        P1 = ReadValue32(0x804688c4),
        P2 = ReadValue32(0x80468964),
        P3 = ReadValue32(0x80468a04),
        P4 = ReadValue32(0x80468aa4)
    }

    else
        return {
        P1 = ReadValue32(0x804b3c84),
        P2 = ReadValue32(0x804b3d24),
        P3 = ReadValue32(0x804b3dc4),
        P4 = ReadValue32(0x804b3e64)
    }
    end
end
core.getOrbCount = getOrbCount


local function getMinigameScore()
    if (isUSA()) then
        return {
            P1 = ReadValue32(0x802bcdec),
            P2 = ReadValue32(0x802bcdf0),
            P3 = ReadValue32(0x802bcdf4),
            P4 = ReadValue32(0x802bcdf8)
        }

    else
        return {
            P1 = ReadValue32(0x801f8d14),
            P2 = ReadValue32(0x801f8d18),
            P3 = ReadValue32(0x801f8d1c),
            P4 = ReadValue32(0x801f8d20)
        }
    end
end
core.getMinigameScore = getMinigameScore


local function getMinigameTimer()
    return ReadValueFloat(Pointers.getMinigameTimerPointer()) -- error: attempts to index a boolean value
end
core.getMinigameTimer = getMinigameTimer

local function getMinigameScoreEstimator()
    if (getMinigameTimer() < 60 and getMinigameTimer() > 0) then
        return {
            P1 = getMinigameScore().P1 / (60 - getMinigameTimer()) * 60,
            P2 = getMinigameScore().P2 / (60 - getMinigameTimer()) * 60,
            P3 = getMinigameScore().P3 / (60 - getMinigameTimer()) * 60,
            P4 = getMinigameScore().P4 / (60 - getMinigameTimer()) * 60
        }
    
    elseif (getMinigameTimer() <= 0) then
        return {
            P1 = getMinigameScore().P1,
            P2 = getMinigameScore().P2,
            P3 = getMinigameScore().P3,
            P4 = getMinigameScore().P4
        }
    
    else
        return {P1 = 0, P2 = 0, P3 = 0, P4 = 0,}
    end
end
core.getMinigameScoreEstimator = getMinigameScoreEstimator


return core
