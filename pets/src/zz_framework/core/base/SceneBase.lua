------------------------------------------------------------------------------------------
---- Name   : SceneCase
---- Desc   : 场景基类
---- Date   : 2018/03/25
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------

local SceneBase = class('SceneBase', function()
	return cc.Scene:create()
end)

function SceneBase:ctor()
    self:enableNodeEvents()
    self:initialize()
end

function SceneBase:initialize()

end

function SceneBase:onEnter()

end

function SceneBase:onExit()

end

function SceneBase:onCleanup()
    -- 清理资源
end

return SceneBase
