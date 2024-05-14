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


----------- BRIMSTONE BRIDGE -----------


local function getBrimstoneBridgeSpeedPointer()
    if (isUSA()) then
        return {
            P1 = GetPointerNormal(0x802ca0e0, 0x8, 0x24, 0x158),
            P2 = GetPointerNormal(0x802ca0e0, 0x8, 0x28, 0x158),
            P3 = GetPointerNormal(0x802ca0e0, 0x8, 0x2c, 0x158),
            P4 = GetPointerNormal(0x802ca0e0, 0x8, 0x30, 0x158),
        }

    else
        return {
            P1 = GetPointerNormal(0x802e7488, 0x8, 0x24, 0x158),
            P2 = GetPointerNormal(0x802e7488, 0x8, 0x28, 0x158),
            P3 = GetPointerNormal(0x802e7488, 0x8, 0x2c, 0x158),
            P4 = GetPointerNormal(0x802e7488, 0x8, 0x30, 0x158),
        }
    end
end
Pointers.getBrimstoneBridgeSpeedPointer = getBrimstoneBridgeSpeedPointer


----------- BARREL ROLLERS -----------


local function getBarrelRollersXPositionPointer()
    if (isUSA()) then
        return {
            P1 = GetPointerNormal(0x802c9f78, 0x8, 0x28, 0xec),
            P2 = GetPointerNormal(0x802c9f78, 0x8, 0x2c, 0xec),
            P3 = GetPointerNormal(0x802c9f78, 0x8, 0x30, 0xec),
            P4 = GetPointerNormal(0x802c9f78, 0x8, 0x34, 0xec)
        }

    else
        return {
            P1 = GetPointerNormal(0x802e7318, 0x8, 0x28, 0xec),
            P2 = GetPointerNormal(0x802e7318, 0x8, 0x2c, 0xec),
            P3 = GetPointerNormal(0x802e7318, 0x8, 0x30, 0xec),
            P4 = GetPointerNormal(0x802e7318, 0x8, 0x34, 0xec)
        }
    end
end
Pointers.getBarrelRollersXPositionPointer = getBarrelRollersXPositionPointer


local function getBarrelRollersYPositionPointer()
    if (isUSA()) then
        return {
            P1 = GetPointerNormal(0x802c9f78, 0x8, 0x28, 0xf0),
            P2 = GetPointerNormal(0x802c9f78, 0x8, 0x2c, 0xf0),
            P3 = GetPointerNormal(0x802c9f78, 0x8, 0x30, 0xf0),
            P4 = GetPointerNormal(0x802c9f78, 0x8, 0x34, 0xf0)
        }

    else
        return {
            P1 = GetPointerNormal(0x802e7318, 0x8, 0x28, 0xf0),
            P2 = GetPointerNormal(0x802e7318, 0x8, 0x2c, 0xf0),
            P3 = GetPointerNormal(0x802e7318, 0x8, 0x30, 0xf0),
            P4 = GetPointerNormal(0x802e7318, 0x8, 0x34, 0xf0)
        }
    end
end
Pointers.getBarrelRollersYPositionPointer = getBarrelRollersYPositionPointer



return Pointers