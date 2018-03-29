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

function ConfigBase:query(row, key)
    if not self.content_ then return nil end
    if not row then return nil end
    local record = self.content_[row]
    if not record then return nil end
    if key then return record[key] end
    return record
end

return ConfigBase