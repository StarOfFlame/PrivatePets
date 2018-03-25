local DialogBase = class('DialogBase', zz.UIBase)

function DialogBase:init()
    self.UItype_ = zz.UIBase.UIType.Dialog
    self.super:init()
end

return DialogBase