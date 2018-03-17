local T_OBJ  = ConstType.Object.None
local T_PROP = ConstType.Object.Prop
local T_ROLE = ConstType.Object.Role

local Object = class('Object', function() 
    return cc.Node:create() 
end)

function Object:ctor(...)
    self.properties_ = {
        name = 'Object',
        type = T_OBJ
    }
    self:init(...)
end

function Object:init(...)
    
end

function Object:onEnter()

end

function Object:onExit()

end

function Object:onCleanup()

end

function Object:load(properties)
    if not properties or not istable(properties) then 
        return 
    end
    for k,v in pairs(properties) do
        self.properties_[k] = v
    end
end

function Object:get(property)
    return self.properties_[property]
end

function Object:set(property, value)
    self.properties_[property] = value
end

function Object:dump()
    dump(self.properties_, self.__cname)
end

function Object:isProp()
    return self.properties_.type == T_PROP
end

function Object:isRole()
    return self.properties_.type == T_ROLE
end

return Object
