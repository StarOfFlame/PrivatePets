------------------------------------------------------------------------------------------
---- Name   : StateMgr
---- Desc   : 状态管理器
---- Date   : 2018/04/02
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------

local StateMgr = class('StateMgr')

function StateMgr:ctor()
    self:cleanup()
end

--[[监听状态]]
function StateMgr:on(key, handle)
    local stateInfo = self.states_[key]
    if stateInfo 
    or not key 
    or not handle 
    or not isfunction(handle) then 
        return 
    end
    self.states_[key] = {
        handle = handle,
        state  = false,
    }
end

--[[解除监听状态]]
function StateMgr:off(key)
    local stateInfo = self.states_[key]
    if not stateInfo then 
        return 
    end
    self.states_[key] = nil
end

--[[触发监听状态]]
function StateMgr:emit(key, state)
    local stateInfo = self.states_[key]
    if not stateInfo then 
        return 
    end
    stateInfo['handle'](state)
    stateInfo['current'] = state
end

--[[触发监听状态并转发到其他状态]]
function StateMgr:switch(key, state)
    self:emit(key, state)
    for k, v in pairs(self.states_) do
        if k ~= key then
            self:emit(k, not state)
        end
    end
end

--[[获得监听状态]]
function StateMgr:getState(key)
    return self.states[key]['state']
end

--[[重置监听状态]]
function StateMgr:reset()
    for k, v in pairs(self.states_) do
        self.states_[k].state = false
    end
end

--[[清理监听状态]]
function StateMgr:cleanup()
    self.states_ = {}
end

return StateMgr
