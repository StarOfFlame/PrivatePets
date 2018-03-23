------------------------------------------------------------------------------------------
---- Name   : entry
---- Desc   : 游戏启动入口
---- Date   : 2018/03/23
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------

cc.FileUtils:getInstance():setPopupNotify(false)

require('config')
require('cocos.init')

local function entry()
    cc.exports.zz = require('zz_framework.zz'):getInstance()
    zz:initialize()
    zz:startGame()
    
    zz:loadInstance('TestCase'):run(3)
end

xpcall(entry, function(msg)
    local msg = debug.traceback(msg, 3)
    if zz and zz.game then
        zz.game:receiveLuaError()
    end
    return msg
end)
