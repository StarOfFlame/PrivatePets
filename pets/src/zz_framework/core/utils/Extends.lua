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

