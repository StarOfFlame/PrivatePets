
cc.FileUtils:getInstance():setPopupNotify(false)

require "config"
require "cocos.init"
require('sources')

local function main()
    cc.exports.game = loadSrc('Game').new()
end

local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    print(msg)
end
