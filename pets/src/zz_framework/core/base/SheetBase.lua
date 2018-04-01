local SheetBase = {}
SheetBase.isFramesLoaded = false

function SheetBase:getSheet()
    return self.frames
end

function SheetBase:getFrameIndex(name)
    return self.frameIndex[name]
end

function SheetBase:getFrameInfo(name)
	local index = self:getFrameIndex(name)
	if not index then 
		return nil 
	end
	return self.frames[index]
end

function SheetBase:getSheetSize()
	return self.contentSize
end

function SheetBase:enablePremultiply(enable)
    if self.premultiplyAlpha then
        cc.Image:setPVRImagesHavePremultipliedAlpha(enable)
    end
end

function SheetBase:loadTexture()
    self:enablePremultiply(true)
    local texture = display.loadImage(self.source)
    self:enablePremultiply(false)
    return texture
end

function SheetBase:loadFrames()
    local texture = self:loadTexture()
    if not texture then return end
    for name, index in pairs(self.frameIndex) do
        self:addSpriteFrame(name)
    end
end

function SheetBase:addSpriteFrame(name, texture)
    local index = self.frameIndex[name]
    local info  = self.frames[index]
    local frame = cc.SpriteFrame:createWithTexture(texture, info.rect, info.rotate, info.offset, info.size)
    cc.SpriteFrameCache:getInstance():addSpriteFrame(frame, name)
end

function SheetBase:newAnimation(fmt, from, span, interval)
    local texture = self:loadTexture()
    local to = from + span
    for i = from, to do
        local name = string.format(fmt, i)
        self:addSpriteFrame(name, texture)
    end
    return display.newAnimation(fmt, from, span, interval)
end

function SheetBase:newSprite(frameName)
    local texture = self:loadTexture()
    self:addSpriteFrame(frameName, texture)
    return cc.Sprite:createWithSpriteFrameName(frameName)
end

function SheetBase:loadTextureAsync(callfunc)
    if not callfunc then return end
    self:enablePremultiply(true)
    display.loadImage(self.source, function(texture)
        callfunc(texture)
        self:enablePremultiply(false)
    end)
end

function SheetBase:newAnimationAsync(fmt, from, span, interval, callfunc)
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

function SheetBase:newSpriteAsync(frameName, callfunc)
    if not callfunc then return end
    self:loadTextureAsync(function(texture)
        self:addSpriteFrame(frameName, texture)
        local node = cc.Sprite:createWithSpriteFrameName(frameName)
        callfunc(node)
    end)
end

return SheetBase