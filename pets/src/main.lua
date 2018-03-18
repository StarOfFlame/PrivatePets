
cc.FileUtils:getInstance():setPopupNotify(false)

require('config')
require('cocos.init')
require('sources')

local function entry()
    cc.exports.stage = cc.Scene:create()
    display.runScene(stage)
    
    cc.exports.game = loadSrc('Game').new()
end

cc.exports.__G__TRACKBACK__ = function(msg)
    local msg = debug.traceback(msg, 3)
    if game then
        game:receiveLuaError(msg)
    else
        print(msg)
    end
    return msg
end

xpcall(entry, __G__TRACKBACK__)
