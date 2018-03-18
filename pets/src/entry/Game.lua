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
end

function Game:initEnv()
    if CC_SHOW_FPS then
        cc.Director:getInstance():setDisplayStats(true)
    end
end

function Game:newInstance(classpath, ...)
    return loadSrc(classpath).new(...)
end

function Game:load()
    cc.exports.EventEnum = loadSrc('EventEnum')
    cc.exports.UserEnum  = loadSrc('UserEnum')
    cc.exports.utils     = loadSrc('Utils')
    
    self.event = self:newInstance('Event')
    self.timer = self:newInstance('Timer')
    self.audio = self:newInstance('Audio')
    self.net   = self:newInstance('Net')
end

function Game:registerSystemEvent()
    self.event:add(EventEnum.AppDidEnterBackground, handler(self, self.enterBackground))
    self.event:add(EventEnum.AppWillEnterForeground, handler(self, self.enterForeground))
    self.event:add(EventEnum.AppDidReceiveMemoryWarning, handler(self, self.reveiceMemoryWarning))
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

return Game