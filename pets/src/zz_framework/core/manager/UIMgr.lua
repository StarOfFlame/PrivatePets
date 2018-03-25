local UIMgr = class('UIMgr', zz.Singleton)

function UIMgr:ctor()
    self.openlist_   = {}
    self.ignorelist_ = {
        MainWindow = true,
    }
end

function UIMgr:open(name, ...)
    local ui = self.openlist_[name]
    if not ui then
        ui = zz.newInstance(name, ...)
        self.openlist_[name] = ui
    end
    return ui
end

function UIMgr:reload(name, ...)
    local ui = self.openlist_[name]
    if ui and ui.reload then
        ui:reload(...)
    end
end

function UIMgr:close(name)
    local ui = self.openlist_[name]
    if ui then
        ui:close()
        self.openlist_[name] = nil
    end
end

function UIMgr:closeAll()
    for name, ui in ipairs(self.openlist_) do
        if not self.ignorelist_[name] then
            ui:close()
        end
    end
end

function UIMgr:excute(name, func, ...)
    local ui = self.openlist_[name]
    if ui and ui[func] then
        ui[func](...)
    end
end

function UIMgr:show(name)
    self:excute(name, 'show')
end

function UIMgr:hide(name)
    self:excute(name, 'hide')
end

return UIMgr
