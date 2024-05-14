local Pointers = require("SSP_Pointers")
local core = {}

----------- CONDITIONALS -----------

local function isUSA()
    return ReadValueString(0x0, 6) == "GSYE6S"
end

local function isInMinigame()
    if (isUSA()) then
        return ReadValue8(0x8045926f) == 1
    else
        return ReadValue8(0x804a462f) == 1
    end
end
core.isInMinigame = isInMinigame


----------- TOURNAMENT INFO -----------

local function getMap()
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
core.getMapPosition = getMap


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


local function getTournament()
    return {
        map = getMap(),
        orbCount = getOrbCount()
    }
end
core.getTournament = getTournament


----------- GENERAL MINIGAME INFO -----------

local function getCurrentMinigame()
    if (isUSA()) then
        minigame = ReadValue16(0x80459242)
        
        if (minigame == 0) then
            return "Barrel Rollers"
        elseif (minigame == 1) then
            return "Blade Painters"
        elseif (minigame == 2) then
            return "Bowl Me Over"
        elseif (minigame == 3) then
            return "Brick Blasters"
        elseif (minigame == 4) then
            return "Brimstone Bridge"
        elseif (minigame == 5) then
            return "Castle Crumble"
        elseif (minigame == 6) then
            return "Chick Magnet"
        elseif (minigame == 7) then
            return "Dragon's Breath"
        elseif (minigame == 8) then
            return "Duck & Dodge"
        elseif (minigame == 9) then
            return "Fly Candy"
        elseif (minigame == 10) then
            return "Food Fling"
        elseif (minigame == 11) then
            return "Gem Maze"
        elseif (minigame == 12) then
            return "Glider Pilots"
        elseif (minigame == 13) then
            return "Hidden Treasures"
        elseif (minigame == 14) then
            return "Hopping Helmets"
        elseif (minigame == 15) then
            return "Lilypad Leap"
        elseif (minigame == 16) then
            return "Mix Master P"
        elseif (minigame == 17) then
            return "Onion Rings"
        elseif (minigame == 18) then
            return "Paddle Pushers"
        elseif (minigame == 19) then
            return "Peashooters"
        elseif (minigame == 20) then
            return "Petal Plucker"
        elseif (minigame == 21) then
            return "Royal Ropes"
        elseif (minigame == 22) then
            return "Scooter Scramble"
        elseif (minigame == 23) then
            return "Sewer Rats"
        elseif (minigame == 24) then
            return "Spilt Milk"
        elseif (minigame == 25) then
            return "Squirt-A-Snake"
        elseif (minigame == 26) then
            return "Sticky Tongues"
        elseif (minigame == 27) then
            return "Swamp Slalom"
        elseif (minigame == 28) then
            return "Swinging Vines"
        elseif (minigame == 29) then
            return "Trough Dunk"
        else
            return "???"
        end

    else
        minigame = ReadValue16(0x804a4602)
        
        if (minigame == 0) then
            return "Barrel Rollers"
        elseif (minigame == 1) then
            return "Peashooters"
        elseif (minigame == 2) then
            return "Spilt Milk"
        elseif (minigame == 3) then
            return "Bowl Me Over"
        elseif (minigame == 4) then
            return "Brimstone Bridge"
        elseif (minigame == 5) then
            return "Castle Crumble"
        elseif (minigame == 6) then
            return "Brick Blasters"
        elseif (minigame == 7) then
            return "Swinging Vines"
        elseif (minigame == 8) then
            return "Hidden Treasures"
        elseif (minigame == 9) then
            return "Food Fling"
        elseif (minigame == 10) then
            return "Paddle Pushers"
        elseif (minigame == 11) then
            return "Dragon's Breath"
        elseif (minigame == 12) then
            return "Chick Magnet"
        elseif (minigame == 13) then
            return "Onion Rings"
        elseif (minigame == 14) then
            return "Fly Candy"
        elseif (minigame == 15) then
            return "Gem Maze"
        elseif (minigame == 16) then
            return "Hopping Helmets"
        elseif (minigame == 17) then
            return "Lilypad Leap"
        elseif (minigame == 18) then
            return "Duck & Dodge"
        elseif (minigame == 19) then
            return "Mix Master P"
        elseif (minigame == 20) then
            return "Scooter Scramble"
        elseif (minigame == 21) then
            return "Petal Plucker"
        elseif (minigame == 22) then
            return "Sewer Rats"
        elseif (minigame == 23) then
            return "Royal Ropes"
        elseif (minigame == 24) then
            return "Squirt-A-Snake"
        elseif (minigame == 25) then
            return "Sticky Tongues"
        elseif (minigame == 26) then
            return "Swamp Slalom"
        elseif (minigame == 27) then
            return "Trough Dunk"
        elseif (minigame == 28) then
            return "Blade Painters"
        elseif (minigame == 29) then
            return "Glider Pilots"
        else
            return "???"
        end
    end
end
core.getCurrentMinigame = getCurrentMinigame

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
    return ReadValueFloat(Pointers.getMinigameTimerPointer())
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


local function getMinigame()
    return {
        name = getCurrentMinigame(),
        score = getMinigameScore(),
        timer = getMinigameTimer(),
        scoreEstimator = getMinigameScoreEstimator()
    }
end
core.getMinigame = getMinigame




----------- BRIMSTONE BRIDGE -----------

local function getBrimstoneBridge()
    speedPtr = Pointers.getBrimstoneBridgeSpeedPointer()

    return {
        speed = {
            P1 = ReadValueFloat(speedPtr.P1),
            P2 = ReadValueFloat(speedPtr.P2),
            P3 = ReadValueFloat(speedPtr.P3),
            P4 = ReadValueFloat(speedPtr.P4)
        }
    } 
end
core.getBrimstoneBridge = getBrimstoneBridge

local function getBrimstoneBridgeText()
    text = ""
    brimstoneBridge = getBrimstoneBridge()
    text = text .. "\n==== BRIMSTONE BRIDGE INFO ====\n"
                .. string.format("P1 Speed: %10.7f", brimstoneBridge.speed.P1) .. "\n"
                .. string.format("P2 Speed: %10.7f", brimstoneBridge.speed.P2) .. "\n"
                .. string.format("P3 Speed: %10.7f", brimstoneBridge.speed.P3) .. "\n"
                .. string.format("P4 Speed: %10.7f", brimstoneBridge.speed.P4) .. "\n"

    return text
end
core.getBrimstoneBridgeText = getBrimstoneBridgeText



----------- BARREL ROLLERS -----------

local function getBarrelRollers()
    xposPtr = Pointers.getBarrelRollersXPositionPointer()
    yposPtr = Pointers.getBarrelRollersYPositionPointer()

    return {
        xpos = {
            P1 = ReadValueFloat(xposPtr.P1),
            P2 = ReadValueFloat(xposPtr.P2),
            P3 = ReadValueFloat(xposPtr.P3),
            P4 = ReadValueFloat(xposPtr.P4)
        },
        ypos = {
            P1 = ReadValueFloat(yposPtr.P1),
            P2 = ReadValueFloat(yposPtr.P2),
            P3 = ReadValueFloat(yposPtr.P3),
            P4 = ReadValueFloat(yposPtr.P4)
        }
    }
end
core.getBarrelRollers = getBarrelRollers

local function getBarrelRollersText()
    text = ""
    barrelRollers = getBarrelRollers()

    text = text .. "\n==== BARREL ROLLERS INFO ====\n"
                .. string.format("P1 Coords: %10.7f, %10.7f", barrelRollers.xpos.P1, barrelRollers.ypos.P1) .. "\n"
                .. string.format("P2 Coords: %10.7f, %10.7f", barrelRollers.xpos.P2, barrelRollers.ypos.P2) .. "\n"
                .. string.format("P3 Coords: %10.7f, %10.7f", barrelRollers.xpos.P3, barrelRollers.ypos.P3) .. "\n"
                .. string.format("P4 Coords: %10.7f, %10.7f", barrelRollers.xpos.P4, barrelRollers.ypos.P4) .. "\n"

    return text
end
core.getBarrelRollersText = getBarrelRollersText






----------- MASTER FUNCTION FOR GRABBING SPECIFIC MINIGAME INFO -----------

local function getSpecificMinigameVariables()
    minigame = getCurrentMinigame()

    if (minigame == "Brimstone Bridge") then
        return getBrimstoneBridgeText()

    elseif (minigame == "Barrel Rollers") then
        return getBarrelRollersText()
    
    else
        return ""
    end
end
core.getSpecificMinigameVariables = getSpecificMinigameVariables


return core
