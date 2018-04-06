------------------------------------------------------------------------------------------
---- Name   : MainScene
---- Desc   : 主场景
---- Date   : 2018/03/25
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------

local MainScene = class('MainScene', Base.Scene)

function MainScene:initialize()
    self:mountNodes()
end

function MainScene:onEnter()
    newInstance('TestCase'):run()
end

--[[挂载节点]]
function MainScene:mountNodes()
    for name, zorder in pairs(Base.UI.UIType) do
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
    safecall(node, 'setVisible', true)
end

--[[隐藏挂载节点]]
function MainScene:hideNode()
    local node = self:getNode(name)
    safecall(node, 'setVisible', false)
end

--[[清理挂载节点]]
function MainScene:cleanNode(name)
    local node = getNode(name)
    safecall(node, 'removeAllChildren')
end

--[[清理所有挂载节点]]
function MainScene:cleanAllNodes()
    safecall(UIMgr, 'closeAll', true)
    for name in pairs(Base.UI.UIType) do
        self:cleanNode(name)
    end
end

--[[添加子节点到挂载节点]]
function MainScene:addToMountNode(node, uitype, zorder)
    local mountNode = self:getNode(uitype)
    if not zorder then
        mountNode:addChild(node)
    else
        mountNode:addChild(node, zorder)
    end
end

return MainScene
