------------------------------------------------------------------------------------------
---- Name   : Timer
---- Desc   : 定时器核心类
---- Date   : 2017/12/16
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------

------------------------------------------
-- local variables
--
local strfmt     = string.format
local _scheduler = cc.Director:getInstance():getScheduler()

------------------------------------------
-- @desc : Class Timer
--
local Timer = class('Timer')

function Timer:ctor()
    self._timers = {}
end

------------------------------------------
-- @desc : 核心加载
--
function Timer:load()

end

------------------------------------------
-- @desc : 核心卸载
--
function Timer:unload()
    self:stopAll()
end

------------------------------------------
-- @desc : 获取定时器
-- @param : timer - timer name
--
function Timer:find(timer)
    if self._timers[timer] then
        return true
    end
    return false
end

------------------------------------------
-- @desc : 开启定时器
-- @param : timer - timer name
-- @param : callfn - timer callback
-- @param : interval - timer interval
-- @param : isonce - call timer once or not 
--
function Timer:start(timer, callfn, interval, isonce)
    if self:find(timer) then
        self:stop(timer)
    end
    local function oncefn(dt)
        callfn(dt) 
        self:stop(timer)
    end
    local packfn  = isonce and oncefn or callfn
    local timerId = _scheduler:scheduleScriptFunc(packfn, interval, false)
    self._timers[timer] = timerId
    self:tag(strfmt('%s is running.', timer))
end

------------------------------------------
-- @desc : 停止定时器
-- @param : timerId - timer ID
--
local function stopById(timerId)
    _scheduler:unscheduleScriptEntry(timerId)
end

------------------------------------------
-- @desc : 停止定时器
-- @param : timer - timer name
--
function Timer:stop(timer)
    if not self:find(timer) then return end
    stopById(self._timers[timer])
    self._timers[timer] = nil
    self:tag(strfmt('%s is stop.', timer))
end

------------------------------------------
-- @desc : 停止所有定时器
--
function Timer:stopAll()
    table.foreach(self._timers, function(timerId, timer)
        stopById(timerId)
        self._timers[timer] = nil
    end)
    self:tag('All timer is stop.')
end

return Timer
