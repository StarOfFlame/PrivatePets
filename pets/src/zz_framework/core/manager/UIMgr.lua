------------------------------------------------------------------------------------------
---- Name   : UIMgr
---- Desc   : UI管理器
---- Date   : 2018/03/26
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------

local UIMgr = class('UIMgr', SingletonBase)

function UIMgr:ctor()
    self.openlist_   = {}
    self.ignorelist_ = {
        MainWindow = true,
    }
end

--[[打开UI]]
function UIMgr:open(name, ...)
    local ui = self.openlist_[name]
    if not ui then
        ui = newInstance(name, ...)
        self.openlist_[name] = ui
        zz.stage:addToMountNode(ui, ui:getUITypeName())
    end
    return ui
end

--[[获取UI]]
function UIMgr:get(name)
    return self.openlist_[name]
end

--[[重载UI]]
function UIMgr:reload(name, ...)
    local ui = self.openlist_[name]
    safecall(ui, 'reload', ...)
end

--[[关闭UI]]
function UIMgr:close(name)
    local ui = self.openlist_[name]
    if ui then
        ui:removeFromParent()
        ui = nil
        self.openlist_[name] = nil
    end
end

--[[关闭全部UI]]
function UIMgr:closeAll(ignores)
    if type(ignores) == 'boolean' then
        ignores = ignores and {} or self.ignorelist_
    elseif type(ignores) ~= 'table' then
        ignores = self.ignorelist_
    end
    for name, ui in pairs(self.openlist_) do
        if not table.contains(ignores, name) then
            ui:removeFromParent()
            ui = nil
            self.openlist_[name] = nil
        end
    end
end

--[[执行UI方法]]
function UIMgr:callMethod(name, func, ...)
    local ui = self.openlist_[name]
    if ui and ui[func] then
        ui[func](...)
    end
end

--[[显示UI]]
function UIMgr:show(name)
    self:callMethod(name, 'show')
end

--[[隐藏UI]]
function UIMgr:hide(name)
    self:callMethod(name, 'hide')
end

return UIMgr
