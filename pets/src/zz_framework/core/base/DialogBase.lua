------------------------------------------------------------------------------------------
---- Name   : DialogBase
---- Desc   : 悬浮窗基类
---- Date   : 2018/03/28
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------

local DialogBase = class('DialogBase', UIBase)

--[[初始化悬浮窗数据]]
function DialogBase:initData()
    self.UItype_    = UIBase.UIType.Dialog
    self.maskTouch_ = true 
    self.blinkTip_  = ''
    self.blinkNode_ = nil
    
    if self.init then
        self:init()
    end
end

--[[悬浮窗进入回调]]
function DialogBase:onEnterCallback_()
    self.super:onEnterCallback_()
    self:startBlinkTip()
end

--[[悬浮窗退出回调]]
function DialogBase:onExitCallback_()
    self:stopBlinkTip()
    self.super:onExitCallback_()
end

--[[设置提示]]
function DialogBase:setBlinkTip(tip)
    if self.tip_ == tip then
        return 
    end
    self.tip_ = tip
end

--[[开始闪烁提示]]
function DialogBase:startBlinkTip()
    if not self.tip_ or self.tip_ == '' then 
        return
    end
    if not self.blinkNode_ then
        return
    end
    
    local fadeToA  = cc.FadeTo:create(0.5, 0)
    local delayA   = cc.DelayTime:create(0.2)
    local fadeToB  = cc.FadeTo:create(0.5, 255)
    local delayB   = cc.DelayTime:create(0.2)
    local blinkAct = cc.Seuqence:create(fadeToA, delayA, fadeToB, delayB)
    local forever  = cc.RepeatForever:create(blinkAct)
    self.blinkNode_:setCascadeColorEnabled(true)
    self.blinkNode_:runAction(forever)
end

--[[停止闪烁提示]]
function DialogBase:stopBlinkTip()
    if not self.blinkNode_ then
        return
    end
    self.blinkNode_:stopAllActions()
end

--[[进入动画]]
function DialogBase:playEnterAnimation()

end

--[[退出动画]]
function DialogBase:playExitAnimation()

end

return DialogBase