
cc.FileUtils:getInstance():setPopupNotify(false)

require "config"
require "cocos.init"

local function main()
    cc.exports.game = require("app.Game").new()
end

local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    print(msg)
end
