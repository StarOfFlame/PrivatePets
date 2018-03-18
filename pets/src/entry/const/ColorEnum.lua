
local Black  = cc.c3b(0,0,0)
local White  = cc.c3b(255,255,255)
local Red    = cc.c3b(255,0,0)
local Green  = cc.c3b(0,255,0)
local Yellow = cc.c3b(0,0,255)

local ColorEnum = {
    Black  = Black,
    White  = White,
    Red    = Red,
    Green  = Green,
    Yellow = Yellow
}

ColorEnum.RoleName = {
    Player = Red,
    Npc    = Green,
    Masses = White,
}

return ColorEnum