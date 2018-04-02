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

function StateMgr:off(key)
    local stateInfo = self.states_[key]
    if not stateInfo then 
        return 
    end
    self.states_[key] = nil
end

function StateMgr:emit(key, state)
    local stateInfo = self.states_[key]
    if not stateInfo then 
        return 
    end
    stateInfo['handle'](state)
    stateInfo['current'] = state
end

function StateMgr:switch(key, state)
    self:emit(key, state)
    for k, v in pairs(self.states_) do
        if k ~= key then
            self:emit(k, not state)
        end
    end
end

function StateMgr:getState(key)
    return self.states[key]['state']
end

function StateMgr:reset()
    for k, v in pairs(self.states_) do
        self.states_[k].state = false
    end
end

function StateMgr:cleanup()
    self.states_ = {}
end

return StateMgr
