------------------------------------------------------------------------------------------
---- Name   : Game
---- Desc   : 游戏核心类
---- Date   : 2018/03/18
---- Author : Reyn - jl88744653@gmail.com
------------------------------------------------------------------------------------------

local Game = class('Game')

function Game:ctor()
    self:initEnv()
    self:load()
    self:registerSystemEvent()
    self:test()
end

function Game:test()
    self:tag(' System  : ' .. system.platform:getTargetOSname())
    self:tag('Language : ' .. system.platform:getLanguageName())
    self:dump('color hex to c4b:', utils.colorify:hex2c4b('FE32D4A0'))

    local root = device.writablePath
    cc.FileUtils:getInstance():createDirectory(root ..'res/')

    local layer = cc.LayerColor:create(cc.c4b(255,255,255,255), display.width, display.height)
    stage:addChild(layer)
    local sp = cc.Sprite:create('HelloWorld.png')
    sp:setPosition(display.center)
    stage:addChild(sp)
    cc.utils:captureNodeToFile(sp, root ..'res/HelloWorld-002.png')
    
    elapse(function()
        for i=1, 5000 do
            for j=1, 5000 do
                pass(i+j)
            end
        end
    end, 'timer counter')
end

function Game:initEnv()
    if CC_SHOW_FPS then
        cc.Director:getInstance():setDisplayStats(true)
    end
    self:tag(device.writablePath)
end

function Game:load()
    loadSrc('Global')
    
    cc.exports.CONST  = loadSrc('Const')
    cc.exports.utils  = loadSrc('Utils')
    cc.exports.system = loadSrc('System')
end

function Game:registerSystemEvent()
    system.event:add(CONST.EVENT.APP_ENTER_BG, handler(self, self.enterBackground))
    system.event:add(CONST.EVENT.APP_ENTER_FG, handler(self, self.enterForeground))
    system.event:add(CONST.EVENT.APP_RECV_MEM_WARNING, handler(self, self.reveiceMemoryWarning))
end

function Game:enterBackground()
    self:tag('AppEnterBackgorund')
end

function Game:enterForeground()
    self:tag('AppEnterForeground')
    self:tag('App from backgorund back to foreground use time : ' .. GetElapseTime() .. 's')
end

function Game:reveiceMemoryWarning()
    self:tag('reveiceMemoryWarning')
end

function Game:receiveLuaError()
    ----------------------------------------------------------------------
    -- debug.getinfo()
    -- 'n'   获取name和namewhat
    -- 'f'   获取func
    -- 'S'   获取source, short_src, what, linedefined, 和lastlinedefined
    -- 'l'   获取当前行
    -- 'L'   获取活动行
    -- 'u'   获取nup (upvalue的个数) 
    --
    local err = {}
    for level = 1, math.huge do
        local info = debug.getinfo(level, 'nSl')
        if not info then break end
        local arr = string.split(tostring(info.source), '/')
        local stb = {}
        local len = #arr
        if len > 1 then
            for i=len-2, 3 do
                table.insert(stb, arr[i])
            end
        elseif len > 0 then
            table.insert(stb, arr[1])
        end
        local source = table.concat(stb, '/')
        if source ~= '' then
            err[#err+1] = string.format('[%s] func: %s  file: %s', info.currentline , info.name, source)
        end
    end
    local errstr = table.concat(err, '\n')
    cc.Label:createWithSystemFont(errstr, 'Arial', 18)
    :setAnchorPoint(display.RIGHT_BOTTOM)
    :move(display.width-20, 20)
    :setColor(CONST.COLOR.RED)
    :addTo(stage, 9999)

    self:tag('LUA_ERROR:\n'..errstr)
end

return Game