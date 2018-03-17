local Game = class('Game')

function Game:ctor()
    self.loaded_ = false
    self:load()
end

function Game:newInstance(classpath, ...)
    return require(classpath).new(...)
end

function Game:load()
    if self.loaded_ then
        return
    end
    
    self.event = self:newInstance('entry.system.Event')
    self.timer = self:newInstance('entry.system.Timer')
    
    
    self.loaded_ = true
end

return Game