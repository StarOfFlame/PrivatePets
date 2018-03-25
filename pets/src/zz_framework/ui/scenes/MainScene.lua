local MainScene = class('MainScene', zz.SceneBase)

function MainScene:initialize()
    
    self:mountNodes()
end

function MainScene:onEnter()
    self:tag('onEnter')
end

function MainScene:mountNodes()
    self:tag('mountNodes')
    for name, zorder in pairs(zz.UIBase.ZOrder) do
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
