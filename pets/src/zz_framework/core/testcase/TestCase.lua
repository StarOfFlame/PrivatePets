------------------------------------------------------------------------------------------
---- Name   : TestCase
---- Desc   : 测试用例
---- Date   : 2018/03/23
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------

local TestCase = class('TestCase', zz.singleton)

function TestCase:ctor()
    self.testcases_ = {
        handler(self, self.testcase01),
        handler(self, self.testcase02),
        handler(self, self.testcase03),
        handler(self, self.testcase04),
    }
end

function TestCase:run(case)
    if case and self.testcases_[case] then
        self.testcases_[case]()
        return
    end
    for _, case in ipairs(self.testcases_) do
        case()
    end
end

function TestCase:testcase01()
    self:warn('测试用例01-保存截图')
    
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
    self:warn('测试用例02-运行计时')
    elapse(function()
        for i=1, 5000 do
            for j=1, 5000 do
                pass(i+j)
            end
        end
    end, '计时器5000x5000')
end

function TestCase:testcase03()
    self:warn('测试用例03-数据dump')
    local function test()
        self:dump('testcase03', {a=1,b='fffff',c=cc.BLUE})
    end
    test()
end

function TestCase:testcase04()
    self:warn('测试用例04-lfs')
    self:tag('lfs版本号: ', lfs._VERSION)
    self:tag('当前路径: ', lfs.currentdir(), device.writablePath)

    local function walk(root)
        local result = {dir = {}, file={}}
        
        local function listdir(rootPath, level)
            level = level or 1
            local last = string.sub(rootPath, -1)
            if last ~= '/' then 
                rootPath = rootPath .. '/'
            end
            for entry in lfs.dir(rootPath) do
                if entry ~= '.' and entry ~= '..' then
                    local path = rootPath .. entry
                    local attr = lfs.attributes(path)
                    if attr then
                        local prefix = string.rep('\t', level-1)
                        if attr.mode == 'directory' then
                            self:tag(prefix .. '目录:', path)
                            table.insert(result.dir, path)
                            listdir(path, level+1)
                        elseif attr.mode == 'file' then
                            self:tag(prefix .. '文件:', path)
                            table.insert(result.file, path)
                            for name, value in pairs(attr) do
                                self:tag(prefix..'\t', name, value)
                            end
                        end
                    end
                end
            end
        end
        listdir(root)
        
        return result
    end

    self:dump('lfs目录遍历', walk(device.writablePath))
end

return TestCase
