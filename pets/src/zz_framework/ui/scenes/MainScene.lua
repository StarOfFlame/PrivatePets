------------------------------------------------------------------------------------------
---- Name   : MainScene
---- Desc   : 主场景
---- Date   : 2018/03/25
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------

local MainScene = class('MainScene', SceneBase)

function MainScene:initialize()
    self:mountNodes()
end

function MainScene:onEnter()
    zz:loadInstance('TestCase'):run()
end

--[[挂载节点]]
function MainScene:mountNodes()
    for name, zorder in pairs(UIBase.ZOrder) do
        local node = cc.Node:create()
        node:setName(name)
        self:addChild(node, zorder)
    end
end

--[[获取挂载节点]]
function MainScene:getNode(name)
    return self:getChildByName(name)
end

--[[显示挂载节点]]
function MainScene:showNode(name)
    local node = self:getNode(name)
    if node then node:setVisible(true) end
end

--[[隐藏挂载节点]]
function MainScene:hideNode()
    local node = self:getNode(name)
    if node then node:setVisible(false) end
end

--[[清理挂载节点]]
function MainScene:cleanNode(name)
    local node = getNode(name)
    if node then
        node:removeAllChildren()
    end
end

--[[清理所有挂载节点]]
function MainScene:cleanAllNodes()
    for name in pairs(UIBase.ZOrder) do
        self:getNode(name)
    end
end

return MainScene
