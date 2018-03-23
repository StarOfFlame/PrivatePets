
cc.FileUtils:getInstance():setPopupNotify(false)

require('config')
require('cocos.init')

local function entry()
    cc.exports.zz = require('zz'):getInstance()
    zz:init()
end

xpcall(entry, function(msg)
    local msg = debug.traceback(msg, 3)
    if zz and zz.game then
        zz.game:receiveLuaError()
    else
        print(msg)
    end
    return msg
end)
