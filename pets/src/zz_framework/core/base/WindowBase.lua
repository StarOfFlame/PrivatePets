------------------------------------------------------------------------------------------
---- Name   : WindowBase
---- Desc   : 窗口基类
---- Date   : 2018/03/28
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------

local WindowBase = class('WindowBase', Base.UI)

--[[初始化窗口数据]]
function WindowBase:initData()
    self.UItype_    = Base.UI.UIType.Window
    self.maskTouch_ = true 
    self.title_     = ''
    self.titleNode_ = nil
    
    safecall(self, 'init')
end

--[[进入回调]]
function WindowBase:onEnterCallback_()
    self.super:onEnterCallback_()
    self:showTitle()
end

--[[设置窗口标题]]
function WindowBase:setTitle(title)
    if self.title_ == title and title ~= '' then
        return
    end
    self.title_ = title
end

--[[显示标题]]
function WindowBase:showTitle()
    if self.titleNode_ then
        self.titleNode_:setString(self.title)
        --TODO: show title
    end
end

--[[进入动画]]
function WindowBase:playEnterAnimation()

end

--[[退出动画]]
function WindowBase:playExitAnimation()

end

return WindowBase