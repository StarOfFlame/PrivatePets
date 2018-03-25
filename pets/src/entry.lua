------------------------------------------------------------------------------------------
---- Name   : entry
---- Desc   : 游戏启动入口
---- Date   : 2018/03/23
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------

cc.FileUtils:getInstance():setPopupNotify(false)

--[[主入口]]
local function entry()
    require('config')
    require('cocos.init')
    
    cc.exports.zz = require('zz_framework.zz'):getInstance()
    zz:initialize()
    zz:startGame()
end

--[[错误跟踪]]
xpcall(entry, function(msg)
    local msg = debug.traceback(msg, 3)
    print('\n-> ERROR TRACE BEGAN <-')
    print(msg)
    print('<- ERROR TRACE ENDED ->\n')
    if zz then
        zz:handleLuaError()
    end
    return msg
end)
