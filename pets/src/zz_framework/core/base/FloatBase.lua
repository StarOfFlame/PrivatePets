local FloatBase = class('FloatBase', zz.UIBase)

function FloatBase:init()
    self.UItype_ = zz.UIBase.UIType.Float
    self.super:init()
end

return FloatBase