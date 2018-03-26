--[[

Copyright (c) 2014-2017 Chukong Technologies Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

]]

local Node = cc.Node

function Node:add(child, zorder, tag)
    if tag then
        self:addChild(child, zorder, tag)
    elseif zorder then
        self:addChild(child, zorder)
    else
        self:addChild(child)
    end
    return self
end

function Node:addTo(parent, zorder, tag)
    if tag then
        parent:addChild(self, zorder, tag)
    elseif zorder then
        parent:addChild(self, zorder)
    else
        parent:addChild(self)
    end
    return self
end

function Node:removeSelf()
    self:removeFromParent()
    return self
end

function Node:align(anchorPoint, x, y)
    self:setAnchorPoint(anchorPoint)
    return self:move(x, y)
end

function Node:show()
    self:setVisible(true)
    return self
end

function Node:hide()
    self:setVisible(false)
    return self
end

function Node:move(x, y)
    if y then
        self:setPosition(x, y)
    else
        self:setPosition(x)
    end
    return self
end

function Node:moveTo(args)
    transition.moveTo(self, args)
    return self
end

function Node:moveBy(args)
    transition.moveBy(self, args)
    return self
end

function Node:fadeIn(args)
    transition.fadeIn(self, args)
    return self
end

function Node:fadeOut(args)
    transition.fadeOut(self, args)
    return self
end

function Node:fadeTo(args)
    transition.fadeTo(self, args)
    return self
end

function Node:rotate(rotation)
    self:setRotation(rotation)
    return self
end

function Node:rotateTo(args)
    transition.rotateTo(self, args)
    return self
end

function Node:rotateBy(args)
    transition.rotateBy(self, args)
    return self
end

function Node:scaleTo(args)
    transition.scaleTo(self, args)
    return self
end

function Node:onUpdate(callback)
    self:scheduleUpdateWithPriorityLua(callback, 0)
    return self
end

Node.scheduleUpdate = Node.onUpdate

function Node:onNodeEvent(eventName, callback)
    if "enter" == eventName then
        self.onEnterCallback_ = callback
    elseif "exit" == eventName then
        self.onExitCallback_ = callback
    elseif "enterTransitionFinish" == eventName then
        self.onEnterTransitionFinishCallback_ = callback
    elseif "exitTransitionStart" == eventName then
        self.onExitTransitionStartCallback_ = callback
    elseif "cleanup" == eventName then
        self.onCleanupCallback_ = callback
    end
    self:enableNodeEvents()
end

function Node:enableNodeEvents()
    if self.isNodeEventEnabled_ then
        return self
    end

    self:registerScriptHandler(function(state)
        if state == "enter" then
            self:onEnter_()
        elseif state == "exit" then
            self:onExit_()
        elseif state == "enterTransitionFinish" then
            self:onEnterTransitionFinish_()
        elseif state == "exitTransitionStart" then
            self:onExitTransitionStart_()
        elseif state == "cleanup" then
            self:onCleanup_()
        end
    end)
    self.isNodeEventEnabled_ = true

    return self
end

function Node:disableNodeEvents()
    self:unregisterScriptHandler()
    self.isNodeEventEnabled_ = false
    return self
end


function Node:onEnter()
end

function Node:onExit()
end

function Node:onEnterTransitionFinish()
end

function Node:onExitTransitionStart()
end

function Node:onCleanup()
end

function Node:onEnter_()
    self:onEnter()
    if not self.onEnterCallback_ then
        return
    end
    self:onEnterCallback_()
end

function Node:onExit_()
    self:onExit()
    if not self.onExitCallback_ then
        return
    end
    self:onExitCallback_()
end

function Node:onEnterTransitionFinish_()
    self:onEnterTransitionFinish()
    if not self.onEnterTransitionFinishCallback_ then
        return
    end
    self:onEnterTransitionFinishCallback_()
end

function Node:onExitTransitionStart_()
    self:onExitTransitionStart()
    if not self.onExitTransitionStartCallback_ then
        return
    end
    self:onExitTransitionStartCallback_()
end

function Node:onCleanup_()
    self:stopAllTimer()
    self:delAllEvent()
    self:onCleanup()
    if not self.onCleanupCallback_ then
        return
    end
    self:onCleanupCallback_()
end


----------------------------------------------
-- Event
--
function Node:addEvent(eventName, handler)
    self.eventPool_ = checktable(self.eventPool_)
    self.eventPool_[eventName] = true
    system.event:add(eventName, handler)
end

function Node:delEvent(eventName)
    if not self.eventPool_[eventName] then
        return
    end
    system.event:del(eventName)
    self.eventPool_[eventName] = nil
end

function Node:delAllEvent()
    for eventName in pairs(self.eventPool_) do
        system.event:del(eventName)
    end
    self.eventPool_ = nil
end

----------------------------------------------
-- Timer
--
function Node:startTimer(timer, func, interval, isonce)
    self.timers_ = checktable(self.timers_)
    self.timers_[timer] = true
    system.timer:start(timer, func, interval, isonce)
end

function Node:stopTimer(timer)
    if not self.timers_[timer] then
        return
    end
    system.timer:stop(timer)
    self.timers_[timer] = nil
end

function Node:stopAllTimer()
    if not self.timers_ then
        return
    end
    for timer in pairs(self.timers_) do
        system.timer:stop(timer)
    end
    self.timers_ = nil
end

----------------------------------------------
-- 注册触摸
--
function Node:isTouchOnNode(touchPos, out)
    local nodePos  = self:convertToNodeSpace(touchPos)
    local nodeSize = self:getContentSize()
    local inside   = cc.rectContainsPoint(cc.rect(0, 0, nodeSize.width, nodeSize.height), nodePos)
    return out and not inside or inside
end

function Node:registerTouchEvent(touchFn, out)    
    if self.isTouchEnabled then
        print(CONST.UNICODE.WARNING .. ' 为UIWidget控件开启节点触摸事件需要禁用原来的触摸机制')
        self:setTouchEnabled(false)
    end

    local function touchBegan(touch, event)
        if not touchFn then 
            return false 
        end
        local pos = touch:getStartLocation()
        if self:isTouchOnNode(pos, out) then 
            touchFn(self, 'began', pos)
            return true
        end
        return false
    end

    local function touchEnded(touch, event)
        if not touchFn then 
            return 
        end
        local pos = touch:getLocation()
        if self:isTouchOnNode(pos, out) then
            touchFn(self, 'ended', pos)
        end
    end

    local function touchMoved(touch, event)
        if not touchFn then 
            return 
        end
        local pos = touch:getLocation()
        if self:isTouchOnNode(pos, out) then
            touchFn(self, 'moved', pos)
        end
    end

    local function touchCancel(touch, event)
        if touchFn then 
            touchFn(self, 'canceled', pos)
        end
    end
    
    local touchListener = cc.EventListenerTouchOneByOne:create()
    touchListener:setSwallowTouches(true)
    touchListener:registerScriptHandler(touchBegan, cc.Handler.EVENT_TOUCH_BEGAN)
    touchListener:registerScriptHandler(touchEnded, cc.Handler.EVENT_TOUCH_ENDED)
    touchListener:registerScriptHandler(touchMoved, cc.Handler.EVENT_TOUCH_MOVED)
    touchListener:registerScriptHandler(touchCancel,cc.Handler.EVENT_TOUCH_CANCELLED)
    self:getEventDispatcher():addEventListenerWithSceneGraphPriority(touchListener, self)
end

function Node:disableTouchThrough()
    self:registerTouchEvent(pass)
end