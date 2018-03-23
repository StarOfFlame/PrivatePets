local TestCase = class('TestCase', zz.singleton)

function TestCase:ctor()

end

function TestCase:testcase01()
    self:tag(' System  : ' .. system.platform:getTargetOSname())
    self:tag('Language : ' .. system.platform:getLanguageName())
end

function TestCase:testcase02()
    local layer = cc.LayerColor:create(cc.c4b(255,255,255,255), display.width, display.height)
    zz.stage:addChild(layer)
    local sp = cc.Sprite:create('HelloWorld.png')
    sp:setPosition(display.center)
    zz.stage:addChild(sp)
    
    local root = device.writablePath
    cc.FileUtils:getInstance():createDirectory(root ..'res/')
    utils:grabNodeToFile(sp, root .. 'res/HelloWorld-001.png')
    utils:grabScreenToFile(function(output)
        self:tag('grap screen success : ' .. output)
    end, function(output)
        self:tag('grap screen failure : ' .. output)
    end, root .. 'res/HelloWorld-002.png')
end

function TestCase:testcase03()
    elapse(function()
        for i=1, 5000 do
            for j=1, 5000 do
                pass(i+j)
            end
        end
    end, 'timer counter')
end

return TestCase