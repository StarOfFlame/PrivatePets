------------------------------------------------------------------------------------------
---- Name   : Utils
---- Desc   : 工具核心类
---- Date   : 2018/03/18
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------

local Utils = {}

Utils.colorify          = include('Colorify')
Utils.securityNumber    = include('SecurityNumber')
Utils.shader            = include('ShaderUtil')

function Utils:grabNodeToFile(node, where)
    cc.utils:captureNodeToFile(node, where)
end

function Utils:grabScreenToFile(okfn, nofn, where)
    okfn = checkfunc(okfn)
    nofn = checkfunc(nofn)
    cc.utils:captureScreen(function(success, output)
        if success then
            okfn(output)
        else
            nofn(output)
        end
    end, where)
end

return Utils
