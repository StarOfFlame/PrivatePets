local MainScene = class('MainScene', SceneBase)

function MainScene:initialize()
    self:mountNodes()
end

function MainScene:onEnter()
    zz:loadInstance('TestCase'):run()
end

function MainScene:mountNodes()
    for name, zorder in pairs(UIBase.ZOrder) do
        local node = cc.Node:create()
        node:setName(name)
        self:addChild(node, zorder)
    end
end

function MainScene:getNode(name)
    return self:getChildByName(name)
end

function MainScene:show(name)
    local node = self:getNode(name)
    if node then node:setVisible(true) end
end

function MainScene:hide()
    local node = self:getNode(name)
    if node then node:setVisible(false) end
end

return MainScene
