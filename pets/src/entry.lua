
cc.FileUtils:getInstance():setPopupNotify(false)

require('config')
require('cocos.init')
require('sources')
cc.exports.zz = require('zz'):getInstance()

local function entry()
    zz:init()
end

cc.exports.__G__TRACKBACK__ = function(msg)
    local msg = debug.traceback(msg, 3)
    if zz.game then
        zz.game:receiveLuaError()
    else
        print(msg)
    end
    return msg
end

xpcall(entry, __G__TRACKBACK__)
