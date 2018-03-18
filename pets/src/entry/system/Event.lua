------------------------------------------------------------------------------------------
---- Name   : Event
---- Desc   : 事件核心类
---- Date   : 2017/12/09
---- Author : Reyn - jl88744653@gmail.com
------------------------------------------------------------------------------------------

local Event  = class('Event')
local Dispatcher = cc.Director:getInstance():getEventDispatcher()

function Event:ctor()
    self.listenerRecords_ = {}
end

----------------------------------------------------
-- @desc : 核心加载
--
function Event:load()
    
end

----------------------------------------------------
-- @desc : 核心卸载
--
function Event:unload()
    self:cleanup()
end

----------------------------------------------------
-- @desc : 添加事件监听
-- @param : eventName - 事件名称
-- @param : eventHandler - 事件处理回调
--
function Event:add(eventName, eventHandler)
    if self.listenerRecords_[eventName] then
        self:del(eventName)
    end
    local listener = cc.EventListenerCustom:create(eventName, eventHandler)
    Dispatcher:addEventListenerWithFixedPriority(listener, 1)
    self.listenerRecords_[eventName] = listener
end

----------------------------------------------------
-- @desc : 解除事件监听
-- @param : eventName - 事件名称
--
function Event:del(eventName)
    local listener = self.listenerRecords_[eventName]
    if not listener then return end
    Dispatcher:removeEventListener(listener)
    self.listenerRecords_[eventName] = nil
end

----------------------------------------------------
-- @desc : 发送事件数据
-- @param : eventName - 事件名称
-- @param : eventHandler - 事件数据
--
function Event:emit(eventName, userData)
    local event = cc.EventCustom:new(eventName)
    event._usedata = userData
    Dispatcher:dispatchEvent(event)
end

----------------------------------------------------
-- @desc : 清理事件池子
--
function Event:cleanup()
    table.foreach(self.listenerRecords_, handler(self, self.del))
end

return Event
