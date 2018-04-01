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
    local texture = display.getImage(self.source)
    if not texture then
        self:enablePremultiply(true)
        texture = display.loadImage(self.source)
        self:enablePremultiply(false)
    end
    return texture
end

function SheetBase:loadFrames()
    local texture = self:loadTexture()
    if texture then 
        for name, index in pairs(self.frameIndex) do
            self:loadFrame(name)
        end
    end
end

function SheetBase:loadFrame(name)
    local texture = self:loadTexture()
    if texture then 
        local index = self.frameIndex[name]
        local info  = self.frames[index]
        local frame = cc.SpriteFrame:createWithTexture(texture, info.rect, info.rotate, info.offset, info.size)
        cc.SpriteFrameCache:getInstance():addSpriteFrame(frame, name)
    end
end

function SheetBase:newAnimation(fmt, from, span, interval)
    for i=from, from+span do
        local name = string.format(fmt, i)
        self:loadFrame(name)
    end
    return display.newAnimation(fmt, from, span, interval)
end

function SheetBase:newSprite(frameName)
    self:loadFrame(frameName)
    return cc.Sprite:createWithSpriteFrameName(frameName)
end

return SheetBase