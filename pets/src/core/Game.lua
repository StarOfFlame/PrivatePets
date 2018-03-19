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
    self:tag('test')
    self:tag(system.platform:getTargetOSname())
    self:tag(system.platform:getLanguageName())
end

function Game:initEnv()
    if CC_SHOW_FPS then
        cc.Director:getInstance():setDisplayStats(true)
    end
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
end

function Game:reveiceMemoryWarning()
    self:tag('reveiceMemoryWarning')
end

function Game:receiveLuaError(msg)
    self:tag('LUA_ERROR_OCCURS\n', msg)
    -- stageMgr:showErrorMsg(msg)
end

return Game