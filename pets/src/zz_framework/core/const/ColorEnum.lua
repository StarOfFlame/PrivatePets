------------------------------------------------------------------------------------------
---- Name   : ColorEnum
---- Desc   : 色值定义
---- Date   : 2018/03/23
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------
local rgb  = cc.c3b
local rgba = cc.c4b

local COLORENUM = {
    BLACK  = cc.BLACK,
    WHITE  = cc.WHITE,
    RED    = cc.RED,
    GREEN  = cc.GREEN,
    YELLOW = cc.YELLOW,
    BLUE   = cc.BLUE,
}

COLORENUM.ROLE_NAME = {
    PLAYER = COLORENUM.RED,
    COSTAR = COLORENUM.GREEN,
    MASSES = COLORENUM.WHITE,
}

return COLORENUM
