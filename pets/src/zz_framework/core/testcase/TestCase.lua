------------------------------------------------------------------------------------------
---- Name   : TestCase
---- Desc   : 测试用例
---- Date   : 2018/03/23
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------

local TestCase = class('TestCase', Singleton)

function TestCase:ctor()
    self.testcases_ = {
        handler(self, self.testcase01),
        handler(self, self.testcase02),
        handler(self, self.testcase03),
        handler(self, self.testcase04),
        handler(self, self.testcase05),
        handler(self, self.testcase06),
        handler(self, self.testcase07),
        handler(self, self.testcase08),
        handler(self, self.testcase09),
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
    self:warn('测试用例01-精灵触摸、移动及保存截图')
    
    local layer = cc.LayerColor:create(RGBA(CONST.COLOR.WHITE), display.width, display.height)
    zz.stage:addChild(layer)
    
    local sp0 = ccui.ImageView:create('HelloWorld.png')
    sp0:setPosition(display.cx-100, display.cy+100)
    sp0:registerTouchEvent(function(sender, event, pos)
        if event == 'moved' then
            -- self:tag('touch moved: ', event, pos.x, pos.y)
            sp0:setPosition(pos)
        end
    end)
    zz.stage:addChild(sp0,1)
    
    local sp = ccui.ImageView:create('HelloWorld.png')
    sp:setPosition(display.center)
    sp:disableTouchThrough()
    sp:setTag(1001)    
    sp:registerTouchEvent(function(sender, event, pos)
        if event == 'ended' then
            self:tag('touch ended: ', event, pos.x, pos.y)
        end
    end, true)
    zz.stage:addChild(sp)
    
    local root = device.writablePath
    cc.FileUtils:getInstance():createDirectory(root ..'res/')
    utils:grabNodeToFile(sp, root .. 'res/HelloWorld-001.png')
    utils:grabScreenToFile(function(output)
        self:fmt('保存截屏到[\'%s\']成功', output)
    end, function(output)
        self:fmt('保存截屏到[\'%s\']失败', output)
    end, root .. 'res/HelloWorld-002.png')
end

function TestCase:testcase02()
    self:warn('测试用例02-运行计时')
    elapsed(function()
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

    if system.platform:isMac() then
        return
    end
    
    local function walk(root)
        local result = {dir = {}, file={}}
        local function listdir(rootPath, level)
            level = level or 1
            local last = string.sub(rootPath, -1)
            if last ~= '/' then 
                rootPath = rootPath .. '/'
            end
            for entry in lfs.dir(rootPath) do
                if entry ~= '.' and entry ~= '..' and entry ~= '.DS_Store' then
                    local path = rootPath .. entry
                    local attr = lfs.attributes(path)
                    if attr then
                        local prefix = string.rep('\t', level-1)
                        if attr.mode == 'directory' then
                            -- self:tag(prefix .. '目录:', path)
                            table.insert(result.dir, path)
                            listdir(path, level+1)
                        elseif attr.mode == 'file' then
                            -- self:tag(prefix .. '文件:', path)
                            local md5 = cc.utils:getFileMD5Hash(path)
                            table.insert(result.file, {path=path, md5=md5})
                            -- for name, value in pairs(attr) do
                            --     self:tag(prefix..'\t', name, value)
                            -- end
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

function TestCase:testcase05()
    self:warn('测试用例05-lua表序列化')
    local s = serialize or require "serialize"

    local addressbook = {
        name = "Alice",
        id = 12345,
        phone = {
            { number = "1301234567" },
            { number = "87654321", type = "WORK" },
        }
    }

    local inpacked = s.pack(addressbook)
    local unpacked = s.unpack(inpacked)
    self:tag("addressbook:", addressbook, inpacked, unpacked)
    elapsed(function()
        for i=1,999 do
            inpacked = s.pack(addressbook)
            unpacked = s.unpack(inpacked)
        end
    end, 'lua序列化')
end

function TestCase:testcase06()
    self:warn('测试用例06-精灵置灰')
    local sp = zz.stage:getChildByTag(1001)
    sp.idx = 0
    schedule(sp, function()
        sp.idx = sp.idx + 1
        if sp.idx % 2 == 0 then 
            utils.shader.normalShader(sp)
        elseif sp.idx % 2 == 1 then
            utils.shader.greyShader(sp)
        end
    end, 3)
end

function TestCase:testcase07()
    self:warn('测试用例07-动作')
    
    system.timer:start('timer1', function()    
        -- on Mac : 0.091s 同步
        elapsed(function()
            local sheet = include('role103')
            local function playAni(ani, node)
                node:setPosition(240,350)
                zz.stage:addChild(node, 10)
                node:playAnimationForever(ani)
            end
            playAni(sheet:newAnimation('role103_a10%02d',6,8,0.1))
    
            local function addSprite(node)
                node:addTo(zz.stage, 10)
                node:setPosition(240,500)
            end
            addSprite(sheet:newSprite('role103_a1012'))
        end)
    end, 0.1, true)
    
    system.timer:start('timer2', function()    
        -- on MAC : 0.004s 异步
        elapsed(function()
            local sheet = include('role102')
            sheet:newAnimationAsync('role102_a10%02d',6,8,0.1,function(ani, node)
                node:setPosition(100,350)
                zz.stage:addChild(node, 10)
                node:playAnimationForever(ani)
            end)
    
            sheet:newSpriteAsync('role102_a1012', function(node)
                node:addTo(zz.stage, 10)
                node:setPosition(100,500)
            end)
        end)
    end, 0.2, true)
    
end

function TestCase:testcase08()
    local sprite = ccui.ImageView:create('HelloWorld.png')
    sprite:setTouchEnabled(true)
    sprite:setPosition(800, 400)
    zz.stage:addChild(sprite)
    local state = manager.state.new()
    local function began(statecode)
        self:tag('began state : ', statecode)
    end
    local function ended(statecode)
        self:tag('ended state : ', statecode)
    end
    state:on(0, began)
    state:on(2, ended)
    sprite:addTouchEventListener(function(sender, event)
        state:emit(event, true)
    end)
end

function TestCase:testcase09()
    utils.format:numberToChinese(20)
    utils.format:numberToChinese(200)
    utils.format:numberToChinese(2000)
    utils.format:numberToChinese(20000)
    utils.format:numberToChinese(200000)
    utils.format:numberToChinese(2000000)
    utils.format:numberToChinese(20000000)
    utils.format:numberToChinese(201000000)
    utils.format:numberToChinese(2010010000)
    utils.format:numberToChinese(2010001000)
    utils.format:numberToChinese(2010001001)
    utils.format:numberToChinese(2010101010)
    
    utils.format:numberToChinese(0.901)
    utils.format:numberToChinese(1.203)
    utils.format:numberToChinese(10.2)
    utils.format:numberToChinese(102.2)
    utils.format:numberToChinese(1023.2)
    utils.format:numberToChinese(10200.2)
    utils.format:numberToChinese(-3.1415926)
    utils.format:numberToChinese(-1024)
    utils.format:numberToChinese(-10086)
    utils.format:numberToChinese(1208820)
end

return TestCase
