------------------------------------------------------------------------------------------
---- Name   : Global
---- Desc   : 全局函数
---- Date   : 2018/03/18
---- Author : Reyn - jl88744653@gmail.com
------------------------------------------------------------------------------------------

--------------------------
cc.exports.pass = function() end
dump       = CC_OPEN_OUT and dump or pass
print      = CC_OPEN_OUT and print or pass
printf     = CC_OPEN_OUT and printf or pass
printLog   = CC_OPEN_OUT and printLog or pass
printInfo  = CC_OPEN_OUT and printInfo or pass
printError = CC_OPEN_OUT and printError or pass

cc.exports.newInstance = function (classpath, ...)
    return loadSrc(classpath).new(...)
end

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