local SceneBase = class('SceneBase', function()
	return cc.Scene:create()
end)

function SceneBase:ctor()
    self:enableNodeEvents()
    self:initialize()
end

function SceneBase:initialize()

end

function SceneBase:onEnter()

end

function SceneBase:onExit()

end

function SceneBase:onCleanup()
    -- 清理资源
end

return SceneBase
