local WindowBase = class('WindowBase', zz.UIBase)

function WindowBase:init()
    self.UItype_ = zz.UIBase.UIType.Window
    self.super:init()
end

return WindowBase