local DialogBase = class('DialogBase', UIBase)

function DialogBase:init()
    self.UItype_ = UIBase.UIType.Dialog
    self.super:init()
end

return DialogBase