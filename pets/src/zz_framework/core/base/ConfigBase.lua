------------------------------------------------------------------------------------------
---- Name   : ConfigBase
---- Desc   : 策划配置基类
---- Date   : 2018/03/23
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------

local ConfigBase = class('ConfigBase')

function ConfigBase:ctor()
    self.content_ = {}
end

--[[获取配置]]
function ConfigBase:content()
    return self.content_
end

--[[获取配置的特定条目]]
function ConfigBase:query(row, key)
    if row then 
        local record = self.content_[row]
        if key then
            return record[key]
        end
        return record
    end
    return nil
end

return ConfigBase