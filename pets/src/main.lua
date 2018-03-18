
cc.FileUtils:getInstance():setPopupNotify(false)

require('config')
require('cocos.init')
require('sources')

local function entry()
    cc.exports.stage = cc.Scene:create()
    display.runScene(stage)

    cc.exports.game = loadSrc('Game').new()
end

local status, msg = xpcall(entry, function()
    local msg = debug.traceback(msg, 3)
    if not ON_RELEASED then
        print(msg)
    end
    return msg
end)
if not status then
    print(msg)
end
