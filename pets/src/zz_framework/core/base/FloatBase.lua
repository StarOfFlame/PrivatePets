
------------------------------------------------------------------------------------------
---- Name   : FloatBase
---- Desc   : 悬浮节点基类
---- Date   : 2018/03/28
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------

local FloatBase = class('FloatBase', UIBase)

--[[初始化悬浮节点数据]]
function FloatBase:initData()
    self.UItype_ = UIBase.UIType.Float
    
    if self.init then
        self:init()
    end
end

--[[悬浮窗进入回调]]
function FloatBase:onEnterCallback_()
    self.super:onEnterCallback_()
end

--[[悬浮窗退出回调]]
function FloatBase:onExitCallback_()
    self.super:onExitCallback_()
end

return FloatBase
