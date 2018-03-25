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

--[[输出游戏相关信息]]
function Game:dumpSystemInfo()
    self:tag('操作系统: ' .. zz.system.platform:getTargetOSname())
    self:tag('系统语言: ' .. zz.system.platform:getLanguageName())
    self:tag('可写路径: ' .. device.writablePath)
end

--[[设置环境相关参数]]
function Game:initEnv()
    if CC_SHOW_FPS then
        cc.Director:getInstance():setDisplayStats(true)
    end
end

--[[加载游戏框架]]
function Game:load()
    include('Global')
    
    zz.CONST  = include('Const')
    zz.utils  = include('Utils')
    zz.system = include('System')

    if zz.system.platform:isAndroid() then
        cc.exports.luaj = require('cocos.cocos2d.luaj')
    end
end

--[[注册系统事件]]
function Game:registerSystemEvent()
    zz.system.event:add(zz.CONST.EVENT.APP_ENTER_BG, handler(self, self.onEnterBackground))
    zz.system.event:add(zz.CONST.EVENT.APP_ENTER_FG, handler(self, self.onEnterForeground))
    zz.system.event:add(zz.CONST.EVENT.APP_RECV_MEM_WARNING, handler(self, self.onReveiceMemoryWarning))

    -- 注册安卓返回键按下事件
    if zz.system.platform:isAndroid() then
        local listener  = cc.EventListenerKeyboard:create()
        listener:registerScriptHandler(handler(self, self.onBackBoardReleased), cc.Handler.EVENT_KEYBOARD_RELEASED)
        zz.system.event:addListener(listener, zz.stage)
    end
end

--[[监听返回键按下事件]]
function Game:onBackBoardReleased()
    if zz.system.platform:isAndroid() then
        local className = "org/cocos2dx/lua/DeviceHelper"
        luaj.callStaticMethod(className, "onBackBoardReleased")
    end
end

--[[监听游戏退到后台事件]]
function Game:onEnterBackground()
    self:tag('游戏退到后台')
end

--[[监听游戏回到前台事件]]
function Game:onEnterForeground()
    self:tag('游戏回到前台')
    self:tag('从后台回到前台过去了' .. GetElapseTime() .. 's')
end

--[[监听游戏收到内存警告事件]]
function Game:onReveiceMemoryWarning()
    self:tag('收到内存警告')
end

--[[lua错误处理]]
function Game:handleLuaError()
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