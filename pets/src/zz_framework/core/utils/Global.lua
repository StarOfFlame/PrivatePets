------------------------------------------------------------------------------------------
---- Name   : Global
---- Desc   : 全局函数
---- Date   : 2018/03/18
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------

--[[跳过函数及输出指定]]
cc.exports.pass = function() end
dump          = CC_OPEN_OUT and dump          or pass
print         = CC_OPEN_OUT and print         or pass
printf        = CC_OPEN_OUT and printf        or pass
printLog      = CC_OPEN_OUT and printLog      or pass
printInfo     = CC_OPEN_OUT and printInfo     or pass
printError    = CC_OPEN_OUT and printError    or pass
release_print = CC_OPEN_OUT and release_print or pass

--[[解表]]
cc.exports.unpack = unpack or table.unpack

--[[取最大值]]
cc.exports.max = function(a,b,...)
    local t = {a,b,unpack({...})}
    table.sort(t, function(v1,v2)
        return v1 > v2
    end)
    return t[1]
end

--[[取最小值]]
cc.exports.min = function(a,b,...)
    local t = {a,b,unpack({...})}
    table.sort(t, function(v1,v2)
        return v1 < v2
    end)
    return t[1]
end

--[[执行方法所需时间]]
cc.exports.elapse = function(fn, tag)
    tag = tag or 'elapse'
    local t = 0
    if fn then 
        local t1 = GetCurrentUsec()
        fn()
        t = GetCurrentUsec() - t1
    end
    print(string.format('(%s) 耗时: %.3fs', tag, t))
end

--[[截取全屏并保存]]
cc.exports.captureFullScreen = function (filename)
    cc.utils:captureScreen(function(successed, outputFile)
        if successed then
            return outputFile
        end
        return nil
    end, filename..".png")
end

--[[检查值是否为函数类型]]
cc.exports.checkfunc = function (value)
    return type(value) == 'function' and value or pass
end
