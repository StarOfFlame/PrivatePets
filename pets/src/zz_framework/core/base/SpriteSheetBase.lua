------------------------------------------------------------------------------------------
---- Name   : SpriteSheetBase
---- Desc   : 精灵表基类
---- Date   : 2018/04/02
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------

local SpriteSheetBase = {}

--[[获得精灵表列表]]
function SpriteSheetBase:getSheet()
    return self.frames
end

--[[获得精灵表索引]]
function SpriteSheetBase:getFrameIndex(name)
    return self.frameIndex[name]
end

--[[获得精灵表特定帧数据]]
function SpriteSheetBase:getFrameInfo(name)
	local index = self:getFrameIndex(name)
	if not index then 
		return nil 
	end
	return self.frames[index]
end

--[[获得精灵表尺寸]]
function SpriteSheetBase:getSheetSize()
	return self.contentSize
end

--[[使能精灵表预乘操作]]
function SpriteSheetBase:enablePremultiply(enable)
    if self.premultiplyAlpha then
        cc.Image:setPVRImagesHavePremultipliedAlpha(enable)
    end
end

--[[加载精灵表资源]]
function SpriteSheetBase:loadTexture()
    self:enablePremultiply(true)
    local texture = display.loadImage(self.source)
    self:enablePremultiply(false)
    return texture
end

--[[加载精灵表]]
function SpriteSheetBase:loadFrames()
    local texture = self:loadTexture()
    if not texture then return end
    for name, index in pairs(self.frameIndex) do
        self:addSpriteFrame(name, texture)
    end
end

--[[添加精灵表到缓存]]
function SpriteSheetBase:addSpriteFrame(name, texture)
    local index = self.frameIndex[name]
    local info  = self.frames[index]
    local frame = cc.SpriteFrame:createWithTexture(texture, info.rect, info.rotate, info.offset, info.size)
    cc.SpriteFrameCache:getInstance():addSpriteFrame(frame, name)
end

--[[使用精灵表创建动画]]
function SpriteSheetBase:newAnimation(fmt, from, span, interval)
    local texture = self:loadTexture()
    local to = from + span
    for i = from, to do
        local name = string.format(fmt, i)
        self:addSpriteFrame(name, texture)
    end
    return display.newAnimation(fmt, from, span, interval)
end

--[[使用精灵表创建精灵]]
function SpriteSheetBase:newSprite(frameName)
    local texture = self:loadTexture()
    self:addSpriteFrame(frameName, texture)
    return cc.Sprite:createWithSpriteFrameName(frameName)
end

--[[异步加载精灵表资源]]
function SpriteSheetBase:loadTextureAsync(callfunc)
    if not callfunc then return end
    self:enablePremultiply(true)
    display.loadImage(self.source, function(texture)
        callfunc(texture)
        self:enablePremultiply(false)
    end)
end

--[[异步加载精灵表]]
function SpriteSheetBase:loadFramesAsync(callfunc)
    if not callfunc then return end
    local texture = self:loadTexture(function(texture)    
        for name, index in pairs(self.frameIndex) do
            self:addSpriteFrame(name, texture)
        end
    end)
end

--[[使用精灵表异步创建动画]]
function SpriteSheetBase:newAnimationAsync(fmt, from, span, interval, callfunc)
    if not callfunc then return end
    self:loadTextureAsync(function(texture)    
        local to = from + span
        for i = from, to do
            local name = string.format(fmt, i)
            self:addSpriteFrame(name, texture)
        end
        callfunc(display.newAnimation(fmt, from, span, interval))
    end)
end

--[[使用精灵表异步创建精灵]]
function SpriteSheetBase:newSpriteAsync(frameName, callfunc)
    if not callfunc then return end
    self:loadTextureAsync(function(texture)
        self:addSpriteFrame(frameName, texture)
        local node = cc.Sprite:createWithSpriteFrameName(frameName)
        callfunc(node)
    end)
end

return SpriteSheetBase