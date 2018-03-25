local FloatBase = class('FloatBase', UIBase)

function FloatBase:init()
    self.UItype_ = UIBase.UIType.Float
    self.super:init()
end

return FloatBase