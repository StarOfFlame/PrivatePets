------------------------------------------------------------------------------------------
---- Name   : zz Framework
---- Desc   : zz客户端框架
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
    self:initStage()
    self:start()
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

function zz:initStage()
    self.stage = cc.Scene:create()
    display.runScene(self.stage)
end

function zz:start()
    self.game = zz:loadInstance('Game')
end

return zz