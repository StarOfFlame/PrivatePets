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

--[[UI层级]]
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
    self.soundId_   = nil   --播放音效
    self.musicId_   = nil   --播放背景音乐
    self.plists_    = nil   --图集
    self.maskTouch_ = false --屏蔽底层触摸
    self.rootNode_  = nil   --顶层节点
    self.csbNode_   = nil   --csb节点
    self.touchClose_= false --点击关闭
    
    self:init_()
end

--[[UI层级]]
function UIBase:init_()
    if self.init then
        self:init()
    end
    self:createCsbNode()
end

--[[创建CSB节点]]
function UIBase:createCsbNode()
    self.rootNode_ = cc.Node:create()
    self.rootNode_:setContentSize(display.size)
    self:addChild(self.rootNode_, -1)
    if self.maskTouch_ then
        self.rootNode_:registerTouchEvent(pass)
    end
    
    if self.csb_ then 
        if self.uitype_ == UIBase.UIType.Window 
        or self.uitype_ == UIBase.UIType.Dialog then
            self.csbNode_ = cc.CSLoader:createNodeWithVisibleSize(self.csb_)
        elseif self.uitype_ == UIBase.UIType.Float then
            self.csbNode_ = cc.CSLoader:createNode(self.csb_)
        end
        self:addChild(self.csbNode_, 1)
        if self.touchClose_ then
            self.csbNode_:registerTouchEvent()
        end
    end

end

--[[加载图集]]
function UIBase:loadAtalas()
    if self.plists_ then
        table.walk(self.plists_, function(frame)
            display.addSpriteFrames(frame)
        end)
    end
end

--[[释放图集]]
function UIBase:releaseAtalas()
    if self.plists_ then
        table.walk(self.plists_, function(frame)
            display.removeSpriteFrames(frame)
        end)
    end
end

--[[UI进入回调]]
function UIBase:onEnterCallback_()
    self:loadAtalas()
    if self.occupy_ then 
        manager.ui:closeAll()
    end
end

--[[UI进入完成回调]]
function UIBase:onEnterTransitionFinishCallback_()
    if self.playEnterAnimation then
        self:playEnterAnimation()
    end
    if self.soundId_ then
        system.audio:playEffect(self.soundId_)
    end
    if self.musicId_ then
        system.audio:playMusic(self.musicId_)
    end
end

--[[UI退出开始回调]]
function UIBase:onExitTransitionStartCallback_()
    if self.playExitAnimation then
        self:playExitAnimation()
    end
    if self.musicId_ then
        system.audio:stopMusic(self.musicId_)
    end
end

--[[UI退出回调]]
function UIBase:onExitCallback_()
    self:releaseAtalas()
end

--[[UI清理回调]]
function UIBase:onCleanupCallback_()
    self:releaseAtalas()
end

--[[UI关闭]]
function UIBase:close()
    manager.ui:close(self:getObjName())
end

--[[UI显示]]
function UIBase:show()
    self:setVisible(true)
end

--[[UI隐藏]]
function UIBase:hide()
    self:setVisible(false)
end

return UIBase