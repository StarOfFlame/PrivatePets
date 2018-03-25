------------------------------------------------------------------------------------------
---- Name   : UIBase
---- Desc   : UI基类
---- Date   : 2018/03/26
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------

local UIBase = class('UIBase', function()
    local node = cc.Node:create()
    node:enableNodeEvents()
    return node
end)

--[[UI类型]]
UIBase.UIType = {
    None   = 0, -- 无
    Window = 1, -- 窗口
    Dialog = 2, -- 模态
    Float  = 3, -- 悬浮节点
    Notice = 4, -- 通知节点
    Broad  = 5, -- 跑马灯消息节点
    Guide  = 6, -- 引导节点
    Error  = 7, -- 错误节点
}

UIBase.ZOrder = {
    Window = 1, -- 窗口
    Dialog = 2, -- 模态
    Float  = 3, -- 悬浮节点
    Notice = 4, -- 通知节点
    Broad  = 5, -- 跑马灯消息节点
    Guide  = 6, -- 引导节点
    Error  = 7, -- 错误节点
}

function UIBase:ctor()
    self.uitype_    = UIBase.UIType.None --UI类型
    self.csb_       = nil   --csb名称
    self.occupy_    = false --是否占用独立空间
    
    self:init()
end

function UIBase:init()

end

function UIBase:onEnter()

end

function UIBase:onExit()

end

function UIBase:onCleanup()

end

function UIBase:close()
    UIMgr:close(self:getObjName())
end

function UIBase:show()
    self:setVisible(true)
end

function UIBase:hide()
    self:setVisible(false)
end

return UIBase