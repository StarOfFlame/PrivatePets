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

--[[UI类型及其对应层级]]
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

function UIBase:ctor()
    self.uitype_     = UIBase.UIType.None --UI类型
    self.csb_        = nil                --csb名称
    self.occupy_     = false              --是否占用独立空间
    self.soundId_    = nil                --播放音效
    self.musicId_    = nil                --播放背景音乐
    self.plists_     = nil                --图集
    self.maskTouch_  = false              --屏蔽底层触摸
    self.rootNode_   = nil                --顶层节点
    self.csbNode_    = nil                --csb节点
    self.touchClose_ = false              --点击关闭
    self.widgets_    = nil                --控件列表
    
    self:init_()
end

--[[获取UI名称]]
function UIBase:getUITypeName()
    for name, type in pairs(UIBase.UIType) do
        if type == self.uitype_ then
            return name
        end
    end
    return 'None'
end

--[[UI层级]]
function UIBase:init_()
    if self.initData then
        self:initData()
    end
    self:createCsbNode()
end

--[[创建CSB节点]]
function UIBase:createCsbNode()
    self.rootNode_ = cc.Node:create()
    self.rootNode_:setContentSize(display.size)
    self:addChild(self.rootNode_, -1)
    if self.maskTouch_ then
        self.rootNode_:disableTouchThrough()
    end
    
    if self.csb_ then 
        -- 创建CSB节点
        if self.uitype_ == UIBase.UIType.Window 
        or self.uitype_ == UIBase.UIType.Dialog then
            self.csbNode_ = cc.CSLoader:createNodeWithVisibleSize(self.csb_)
        elseif self.uitype_ == UIBase.UIType.Float then
            self.csbNode_ = cc.CSLoader:createNode(self.csb_)
        end
        self:addChild(self.csbNode_, 1)

        -- 设置CSB节点触摸事件
        if self.touchClose_ then
            self.csbNode_:registerTouchEvent(function(sender, event)
                if event == 'ended' then
                    self:close()
                end
            end, true)
        end

        -- 初始化控件数据
        if self.widgets_ then
            for widgetname, params in pairs(self.widgets_) do
                local widget = cc.utils:findChild(self.csbNode_, widgetname)
                if widget then
                    self[widget] = widget
                    local bindFn = params[1]
                    if bindFn then
                        widget:setTouchEnabled(true)
                        widget:addTouchEventListener(function(sender, event)
                            if event == ccui.TouchEventType.ended then
                                self[bindFn](sender)
                            end
                        end)
                        if params[2] or widget:getDescription() == 'Button' then
                            widget:setPressActionEnabled(true)
                        end
                    end
                end
            end
        end

        -- 绑定关闭按钮
        local closeBtn = cc.utils:findChild(self.csbNode_, 'Button_Close')
        if closeBtn then
            closeBtn:setTouchEnabled(true)
            closeBtn:setPressActionEnabled(true)
            closeBtn:addTouchEventListener(function(sender, event)
                if event == ccui.TouchEventType.ended then
                    self:close()
                end
            end)
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
    self:stopAllActions()
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