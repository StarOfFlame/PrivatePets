------------------------------------------------------------------------------------------
---- Name   : Game
---- Desc   : 游戏核心类
---- Date   : 2018/03/18
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------

local Game = class('Game', zz.singleton)

function Game:ctor()
    self:initEnv()
    self:load()
    self:registerSystemEvent()
end

function Game:test()
    zz.system:unknown()
    zz:loadInstance('TestCase'):testcase01()
    zz:loadInstance('TestCase'):testcase02()
    zz:loadInstance('TestCase'):testcase03()
end

function Game:initEnv()
    if CC_SHOW_FPS then
        cc.Director:getInstance():setDisplayStats(true)
    end
    self:tag(device.writablePath)
end

function Game:load()
    include('Global')
    
    zz.CONST  = include('Const')
    zz.utils  = include('Utils')
    zz.system = include('System')
end

function Game:registerSystemEvent()
    zz.system.event:add(zz.CONST.EVENT.APP_ENTER_BG, handler(self, self.enterBackground))
    zz.system.event:add(zz.CONST.EVENT.APP_ENTER_FG, handler(self, self.enterForeground))
    zz.system.event:add(zz.CONST.EVENT.APP_RECV_MEM_WARNING, handler(self, self.reveiceMemoryWarning))
end

function Game:enterBackground()
    self:tag('游戏退到后台')
end

function Game:enterForeground()
    self:tag('游戏回到前台')
    self:tag('从后台回到前台过去了' .. GetElapseTime() .. 's')
end

function Game:reveiceMemoryWarning()
    self:tag('收到内存警告⚠️')
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
            for i=len-2, 4 do
                table.insert(stb, arr[i])
            end
        elseif len > 0 then
            table.insert(stb, arr[1])
        end
        local source = table.concat(stb, '/')
        if source ~= '' then
            err[#err+1] = string.format('错误定位 文件:%s 行号:[%s] 方法:%s ', source, info.currentline, info.name)
        end
    end
    table.remove(err, 1)
    table.remove(err)
    local errstr = table.concat(err, '\n')
    cc.Label:createWithSystemFont(errstr, 'Arial', 18)
        :setAnchorPoint(display.RIGHT_BOTTOM)
        :move(display.width-20, 20)
        :setColor(zz.CONST.COLOR.RED)
        :addTo(zz.stage, 9999)
    self:tag('LUA_ERROR:\n'..errstr)
end

return Game