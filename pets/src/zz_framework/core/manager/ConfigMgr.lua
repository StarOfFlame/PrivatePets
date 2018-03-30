------------------------------------------------------------------------------------------
---- Name   : ConfigMgr
---- Desc   : UI管理器
---- Date   : 2018/03/26
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------

local ConfigMgr = class('ConfigMgr', SingletonBase)

--[[常驻配置列表]]
local Residents = {

}

function ConfigMgr:ctor()
    self.savelist_ = {}
end

function ConfigMgr:init()
    for _, name in ipairs(Residents) do
        if not self.savelist_[name] then
            self.savelist_[name] = include(name)
        end
    end
end

function ConfigMgr:load(name)
    local config = self.savelist_[name]
    if not config then
        config = include(name)
        if not config then 
            self:fault(string.format('config %s not found.', tostring(name)))
            return nil 
        end
        self.savelist_[name] = config
    end
    return config
end

return ConfigMgr
