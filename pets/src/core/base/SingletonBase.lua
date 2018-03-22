local Singleton = class('Singleton')

local __instance__ = nil

function Singleton:getInstance()
    if not __instance__ then
        __instance__ = Singleton.new()
    end
    return __instance__
end

return Singleton