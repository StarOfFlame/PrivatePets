------------------------------------------------------------------------------------------
---- Name   : zz Framework
---- Desc   : zz客户端框架
---- Date   : 2018/03/23
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------

--[[源码列表]]
require('sources')

--[[zz_framework 框架单例]]
local zz = class('zz_framework', include('SingletonBase'))

--[[获得实例]]
function zz:loadInstance(modulename, ...)
    local base = include(modulename)
    if not base.getInstance then
        return base
    end
    return base:getInstance(...)
end

--[[创建实例]]
function zz:newInstance(modulename, ...)
    return include(modulename):create(...)
end

--[[zz框架初始化]]
function zz:initialize()
    math.randomseed(os.time())
    self:loadBaseClass()
    self:loadGlobal()
    self:registerSystemEvent()
    self:loadEnvironment()
    self:dumpFrameworkInfo()
end

--[[设置环境相关参数]]
function zz:loadEnvironment()
    if CC_SHOW_FPS then
        cc.Director:getInstance():setDisplayStats(true)
    end
end

function zz:loadGlobal()
    include('Global')
    cc.exports.CONST  = include('Const')
    cc.exports.utils  = include('Utils')
    cc.exports.system = include('System')
    if system.platform:isAndroid() then
        cc.exports.luaj = require('cocos.cocos2d.luaj')
    end
end

--[[加载基础基类]]
function zz:loadBaseClass()
    cc.exports.SingletonBase = include('SingletonBase')
    cc.exports.UIBase        = include('UIBase')
    cc.exports.SceneBase     = include('SceneBase')
    cc.exports.WindowBase    = include('WindowBase')
    cc.exports.DialogBase    = include('DialogBase')
    cc.exports.FloatBase     = include('FloatBase')
end

--[[输出游戏相关信息]]
function zz:dumpFrameworkInfo()
    self:tag('操作系统: ' .. system.platform:getTargetOSname())
    self:tag('系统语言: ' .. system.platform:getLanguageName())
    self:tag('可写路径: ' .. device.writablePath)
end

--[[注册系统事件]]
function zz:registerSystemEvent()
    system.event:add(CONST.EVENT.APP_ENTER_BG, handler(self, self.onEnterBackground))
    system.event:add(CONST.EVENT.APP_ENTER_FG, handler(self, self.onEnterForeground))
    system.event:add(CONST.EVENT.APP_RECV_MEM_WARNING, handler(self, self.onReveiceMemoryWarning))

    -- 注册安卓返回键按下事件
    if system.platform:isAndroid() then
        local listener  = cc.EventListenerKeyboard:create()
        listener:registerScriptHandler(handler(self, self.onBackBoardReleased), cc.Handler.EVENT_KEYBOARD_RELEASED)
        system.event:addListener(listener, self.stage)
    end
end

--[[监听返回键按下事件]]
function zz:onBackBoardReleased()
    if system.platform:isAndroid() then
        local className = "org/cocos2dx/lua/DeviceHelper"
        luaj.callStaticMethod(className, "onBackBoardReleased")
    end
end

--[[监听游戏退到后台事件]]
function zz:onEnterBackground()
    self:tag('游戏退到后台')
end

--[[监听游戏回到前台事件]]
function zz:onEnterForeground()
    self:tag('游戏回到前台')
    self:tag('从后台回到前台过去了' .. GetElapseTime() .. 's')
end

--[[监听游戏收到内存警告事件]]
function zz:onReveiceMemoryWarning()
    self:tag('收到内存警告')
end

--[[初始化主舞台]]
function zz:startGame()
    self.stage = self:newInstance('MainScene')
    display.runScene(self.stage)
end

--[[lua错误处理]]
function zz:handleLuaError()
    ----------------------------------------------------------------------
    -- debug.getinfo()
    -- 'n'   获取name和namewhat
    -- 'f'   获取func
    -- 'S'   获取source, short_src, what, linedefined, 和lastlinedefined
    -- 'l'   获取当前行
    -- 'L'   获取活动行
    -- 'u'   获取nup (upvalue的个数) 
    ----------------------------------------------------------------------
    
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
            err[#err+1] = CONST.UNICODE.ERROR .. string.format(' 类型:%s 定位:%s 行号:%s 方法:%s upvalue:%s', 
                info.what, info.source, info.currentline, info.name, info.nups)
        end
    end
    local errstr = table.concat(err, '\n')
    cc.Label:createWithSystemFont(errstr, 'Arial', 18)
        :setAnchorPoint(display.RIGHT_BOTTOM)
        :move(display.width-20, 20)
        :setColor(CONST.COLOR.RED)
        :addTo(self.stage, self.UIBase.ZOrder.Error)
    self:tag('LUA_ERROR:\n'..errstr)
end

return zz