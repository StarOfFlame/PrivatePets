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
    self.event = self:newInstance('Event')
    self.timer = self:newInstance('Timer')
end

function Game:registerSystemEvent()
    self.event:add(EventEnum.ApplicationDidEnterBackground,  handler(self, self.enterBackground))
    self.event:add(EventEnum.ApplicationWillEnterForeground, handler(self, self.enterForeground))
end

function Game:enterBackground()

end

function Game:enterForeground()

end

return Game