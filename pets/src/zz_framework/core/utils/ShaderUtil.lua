--[[
--用于Shader的管理
]]
local ShaderUtil = {}

local function execEffect(node, glprogramstate, nodeState)
    if node.getVirtualRenderer then
        node =node:getVirtualRenderer()
        if node.isScale9Enabled then
            if node:isScale9Enabled() then
                node:setState(nodeState and 0 or 1)
                return
            else
                node =node:getSprite()
            end
        end
    end
    node:setGLProgramState(glprogramstate)
end 

function ShaderUtil.greyShader(node)
    local fileUtiles     =cc.FileUtils:getInstance()
    local vertSource     =fileUtiles:getStringFromFile('res/shader/positionTextureColor_noMVP_vert.vsh')
    local fragSource     =fileUtiles:getStringFromFile('res/shader/grey.fsh')
    local glProgam       =cc.GLProgram:createWithByteArrays(vertSource, fragSource)
    local glprogramstate =cc.GLProgramState:getOrCreateWithGLProgram(glProgam)
    for i,v in ipairs(node:getChildren()) do
        ShaderUtil.greyShader(v)
    end
    execEffect(node,glprogramstate)
end


---------------------------
-- @param #Node node
function ShaderUtil.flickering(node, interval)
    --TODO 这里要支持可设置每次扫动的时间间隔
    local fileUtiles     = cc.FileUtils:getInstance()
    local vertSource     = fileUtiles:getStringFromFile('res/shader/positionTextureColor_noMVP_vert.vsh')
    local fragSource     = fileUtiles:getStringFromFile('res/shader/flickering.fsh')
    local glProgam       = cc.GLProgram:createWithByteArrays(vertSource, fragSource)
    local glprogramstate = cc.GLProgramState:getOrCreateWithGLProgram(glProgam)
    node:setGLProgramState(glprogramstate)

    local time = 0
    node:scheduleUpdateWithPriorityLua(function (dt)
        time = time + dt
        ---x底层luabinding 在COCOS_DEBUG开启下有问题，对底层的绑定代码判断了第一个参数是否是number类型
        node:getGLProgramState():setUniformFloat('u_ctime', tonumber(time))
        node:getGLProgramState():setUniformFloat('u_gtime', tonumber(interval or 1))
        node:getGLProgramState():setUniformVec4('u_color', cc.quaternion(1,1,1,0.6))
        if time >= 1 then time  = 0 end 
    end,0)
end

--[[正常颜色Shader]]--
function ShaderUtil.normalShader(node)
    local glprogramstate =cc.GLProgramState:getOrCreateWithGLProgramName('ShaderPositionTextureColor_noMVP')
    for i,v in ipairs(node:getChildren()) do
        ShaderUtil.normalShader(v)
    end
    execEffect(node,glprogramstate, 0)
end


--[[加载自定义Shader]]--
function ShaderUtil.loadCustomShader(node, vsh, fsh)
    local pProgram = cc.GLProgram:createWithFilenames(vsh,fsh)
    pProgram:retain()
    pProgram:bindAttribLocation(cc.ATTRIBUTE_NAME_POSITION, cc.VERTEX_ATTRIB_POSITION)
    pProgram:bindAttribLocation(cc.ATTRIBUTE_NAME_COLOR,    cc.VERTEX_ATTRIB_COLOR)
    pProgram:bindAttribLocation(cc.ATTRIBUTE_NAME_TEX_COORD,cc.VERTEX_ATTRIB_FLAG_TEX_COORDS)
    pProgram:link()
    pProgram:updateUniforms()
    node:setGLProgram(pProgram)
end

-- fixme 不完善，用一个精确数值不能完全过滤掉，现在的替换也没做完整，阀值待定
function ShaderUtil.excludeShader(node, tarColor)
    local fileUtiles     =cc.FileUtils:getInstance()
    local vertSource     =fileUtiles:getStringFromFile('res/shader/positionTextureColor_noMVP_vert.vsh')
    local fragSource     =fileUtiles:getStringFromFile('res/shader/excludeColor.fsh')
    fragSource = string.gsub(fragSource, '{fmt_(.-)}', tarColor)
    local glProgam       =cc.GLProgram:createWithByteArrays(vertSource, fragSource)
    local glprogramstate =cc.GLProgramState:getOrCreateWithGLProgram(glProgam)
    execEffect(node,glprogramstate)
end

function ShaderUtil.overrideColor(node, tarColor)
    local fileUtiles     =cc.FileUtils:getInstance()
    local vertSource     =fileUtiles:getStringFromFile('res/shader/positionTextureColor_noMVP_vert.vsh')
    local fragSource     =fileUtiles:getStringFromFile('res/shader/overrideColor.fsh')
    fragSource = string.gsub(fragSource, '{fmt_(.-)}', function (key)
        return tarColor[key] / 255
    end)
    local glProgam       =cc.GLProgram:createWithByteArrays(vertSource, fragSource)
    local glprogramstate =cc.GLProgramState:getOrCreateWithGLProgram(glProgam)
    execEffect(node,glprogramstate)
end

return ShaderUtil
