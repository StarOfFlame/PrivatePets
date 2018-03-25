local UIBase = class('UIBase', function()
    local node = cc.Node:create()
    node:enableNodeEvents()
    return node
end)

UIBase.UIType = {
    None   = 0, -- 无
    Window = 1, -- 窗口
    Dialog = 2, -- 模态
    Float  = 3, -- 悬浮节点
}

function UIBase:ctor()
    self:init()
end

function UIBase:init()

end

function UIBase:close()

end

function UIBase:show()

end

function UIBase:hide()

end

function UIBase:onEnter()

end

function UIBase:onExit()

end

function UIBase:onCleanup()

end

return UIBase