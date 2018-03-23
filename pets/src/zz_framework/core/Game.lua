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
    self:dumpSystemInfo()
end

function Game:dumpSystemInfo()
    self:tag('操作系统: ' .. zz.system.platform:getTargetOSname())
    self:tag('系统语言: ' .. zz.system.platform:getLanguageName())
    self:tag('可写路径: ' .. device.writablePath)
end

function Game:test()
    zz:loadInstance('TestCase'):testcase01()
    zz:loadInstance('TestCase'):testcase02()
end

function Game:initEnv()
    if CC_SHOW_FPS then
        cc.Director:getInstance():setDisplayStats(true)
    end
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
    self:tag('收到内存警告')
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
    for level = 3, math.huge do
        local info = debug.getinfo(level, 'lnuS')
        if not info then break end
        local arr = string.split(tostring(info.source), '/')
        for i=#arr-2, 1, -1 do
            table.remove(arr, i)
        end
        info.source = table.concat(arr, '/')
        if info.source ~= '' then
            err[#err+1] = zz.CONST.UNICODE.ERROR .. string.format(' 类型:%s 定位:%s 行号:%s 方法:%s upvalue:%s', 
                info.what, info.source, info.currentline, info.name, info.nups)
        end
    end
    local errstr = table.concat(err, '\n')
    cc.Label:createWithSystemFont(errstr, 'Arial', 18)
        :setAnchorPoint(display.RIGHT_BOTTOM)
        :move(display.width-20, 20)
        :setColor(zz.CONST.COLOR.RED)
        :addTo(zz.stage, 9999)
    self:tag('LUA_ERROR:\n'..errstr)
end

return Game