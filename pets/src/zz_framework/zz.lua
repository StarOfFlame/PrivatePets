------------------------------------------------------------------------------------------
---- Name   : zz Framework
---- Desc   : zz客户端框架
---- Date   : 2018/03/23
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------

--[[源码列表]]
require('sources')

--[[zz_framework 框架单例]]
local zz = class('zz_framework', include('SingletonBase'))

--[[zz框架初始化]]
function zz:initialize()
    math.randomseed(os.time())
    self:loadBaseClass()
    self:initStage()
end

--[[加载基础基类]]
function zz:loadBaseClass()
    self.SingletonBase = include('SingletonBase')
    self.SceneBase     = include('SceneBase')
    self.WindowBase    = include('WindowBase')
    self.DialogBase    = include('DialogBase')
    self.FloatBase     = include('FloatBase')
end

--[[获得实例]]
function zz:loadInstance(modulename, ...)
    local base = include(modulename)
    if not base.getInstance then
        return base
    end
    return base:getInstance(...)
end

--[[创建实例]]
function zz:newInstance(modulename, ...)
    return include(modulename):create(...)
end

--[[初始化主舞台]]
function zz:initStage()
    self.stage = cc.Scene:create()
    display.runScene(self.stage)
end

--[[开始游戏]]
function zz:startGame()
    self.game = zz:loadInstance('Game')
end

return zz