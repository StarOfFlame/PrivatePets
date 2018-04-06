------------------------------------------------------------------------------------------
---- Name   : Net
---- Desc   : 网络核心类
---- Date   : 2017/12/17
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------

local Net = class('Net')

function Net:ctor()

end

function Net:load()

end

function Net:unload()

end


--[[获取ip地址，hostname 不需要加 "http://" 头]]
function Net:fetchHostIP(hostname)
    local ip, resolved = socket.dns.toip(hostname)
    return ip, resolved.ip
end

--[[获取本地ip地址]]
function Net:fetchMineIP()
    return self:fetchHostIP(socket.dns.gethostname())
end

return Net
