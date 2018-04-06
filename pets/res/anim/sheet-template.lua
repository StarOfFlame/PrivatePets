-----------------------------------------------
-- 精灵表配置文件 {{texture.fullName}}
-- created with TexturePacker for cocos-lua
-----------------------------------------------

local SheetInfo = {}
setmetatable(SheetInfo, {__index = Base.SpriteSheet})

SheetInfo.contentSize      = cc.size({{texture.size.width}}, {{texture.size.height}})
SheetInfo.source           = "anim/{{texture.fullName}}"
SheetInfo.premultiplyAlpha = {{settings.premultiplyAlpha}}
SheetInfo.allowRotation    = {{settings.allowRotation}}
SheetInfo.ditherType       = {{settings.ditherType}}

SheetInfo.frames = {{% for sprite in allSprites %}
    {   -- {{sprite.trimmedName}}
        rect   = cc.rect({{sprite.frameRect.x}}, {{sprite.frameRect.y}}, {{sprite.frameRect.width}}, {{sprite.frameRect.height}}),
        size   = cc.size({{sprite.untrimmedSize.width}}, {{sprite.untrimmedSize.height}}),
        rotate = {{sprite.rotated}},
        offset = cc.p({{sprite.cornerOffset.x}}, {{sprite.cornerOffset.y}})
    },{% endfor %}
}

SheetInfo.frameIndex = {{% for sprite in allSprites %} 
    ["{{settings.textureSubPath}}_{{sprite.trimmedName}}"] = {{ forloop.counter }},{% endfor %}
}

return SheetInfo
