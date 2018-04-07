------------------------------------------------------------------------------------------
---- Name   : Extends
---- Desc   : 基础方法扩展
---- Date   : 2018/03/26
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------

--[[表是否包含元素]]
function table.contains(t, val)
    for _, v in pairs(t) do
        if v == val then
            return true
        end
    end
    return false
end

--[[倒置表]]
table.reverse = function(t)
    local r = {}
    local l = #t
    for i=l, 1, -1 do
        table.insert(r, t[i])
    end
    for i=1, l do
        t[i] = r[i]
    end
    r = nil
end

--[[将ansi字符串拆解为表]]
string.unpack = function(str)
    local unpacked = {}
    for i=1, string.len(str) do
        unpacked[i]= string.sub(str, i, i)
    end
    return unpacked
end
