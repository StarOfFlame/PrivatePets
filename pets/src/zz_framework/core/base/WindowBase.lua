local WindowBase = class('WindowBase', UIBase)

function WindowBase:init()
    self.UItype_ = UIBase.UIType.Window
    self.super:init()
end

return WindowBase