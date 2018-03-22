
cc.FileUtils:getInstance():setPopupNotify(false)

require('config')
require('cocos.init')
require('sources')

cc.exports.SingletonBase = include('SingletonBase')
cc.exports.GetInstance = function(modulename, ...)
    local base = include(modulename)
    if not base.getInstance then
        return base
    end
    return base:getInstance(...)
end
cc.exports.NewInstance = function(modulename, ...)
    return include(modulename):create(...)
end

local function entry()
    math.randomseed(os.time())
    
    cc.exports.stage = cc.Scene:create()
    display.runScene(stage)
    
    cc.exports.game = GetInstance('Game')
end

cc.exports.__G__TRACKBACK__ = function(msg)
    local msg = debug.traceback(msg, 3)
    if game then
        game:receiveLuaError()
    else
        print(msg)
    end
    return msg
end

xpcall(entry, __G__TRACKBACK__)
