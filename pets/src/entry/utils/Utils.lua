cc.exports.unpack = unpack or table.unpack

cc.exports.max = function(a,b,...)
    local t = {a,b,unpack({...})}
    table.sort(t, function(v1,v2)
        return v1 > v2
    end)
    return t[1]
end

cc.exports.min = function(a,b,...)
    local t = {a,b,unpack({...})}
    table.sort(t, function(v1,v2)
        return v1 < v2
    end)
    return t[1]
end

------------------------------------------------------------------------------------------
---- Name   : Utils
---- Desc   : 工具核心类
---- Date   : 2018/03/18
---- Author : Reyn - jl88744653@gmail.com
------------------------------------------------------------------------------------------

local Utils = {}

Utils.Colorify       = loadSrc('Colorify')
Utils.SecurityNumber = loadSrc('SecurityNumber')

return Utils