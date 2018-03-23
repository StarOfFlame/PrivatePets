------------------------------------------------------------------------------------------
---- Name   : zz Framework
---- Desc   : 游戏框架
---- Date   : 2018/03/23
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------

require('sources')
local SingletonBase = include('SingletonBase')
local zz = class('zz_framework', SingletonBase)

function zz:init()
    math.randomseed(os.time())
    self.singleton = SingletonBase
    self.stage     = cc.Scene:create()
    display.runScene(self.stage)
    self.game      = zz:loadInstance('Game')
end

function zz:loadInstance(modulename, ...)
    local base = include(modulename)
    if not base.getInstance then
        return base
    end
    return base:getInstance(...)
end

function zz:newInstance(modulename, ...)
    return include(modulename):create(...)
end

return zz