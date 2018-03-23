------------------------------------------------------------------------------------------
---- Name   : TestCase
---- Desc   : 测试用例
---- Date   : 2018/03/23
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------

local TestCase = class('TestCase', zz.singleton)

function TestCase:ctor()
    self._testcases = {
        handler(self, self.testcase01),
        handler(self, self.testcase02),
        handler(self, self.testcase03),
    }
end

function TestCase:run(case)
    if case and self._testcases[case] then
        self._testcases[case]()
        return
    end
    self:testcase01()
    self:testcase02()
    self:testcase03()
end

function TestCase:testcase01()
    local layer = cc.LayerColor:create(cc.c4b(255,255,255,255), display.width, display.height)
    zz.stage:addChild(layer)
    local sp = cc.Sprite:create('HelloWorld.png')
    sp:setPosition(display.center)
    zz.stage:addChild(sp)
    
    local root = device.writablePath
    cc.FileUtils:getInstance():createDirectory(root ..'res/')
    zz.utils:grabNodeToFile(sp, root .. 'res/HelloWorld-001.png')
    zz.utils:grabScreenToFile(function(output)
        self:fmt('保存截屏到[\'%s\']成功', output)
    end, function(output)
        self:fmt('保存截屏到[\'%s\']失败', output)
    end, root .. 'res/HelloWorld-002.png')
end

function TestCase:testcase02()
    elapse(function()
        for i=1, 5000 do
            for j=1, 5000 do
                pass(i+j)
            end
        end
    end, '计时器5000x5000')
end

function TestCase:testcase03()
    local function test()
        self:dump('testcase03', {a=1,b='fffff',c=cc.White})
    end
    test()
end

return TestCase