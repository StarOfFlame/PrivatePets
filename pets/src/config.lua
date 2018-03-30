------------------------------------------------------------------------------------------
---- Name   : config
---- Desc   : 游戏基础配置
---- Date   : 2018/03/23
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------

local function split(input, delimiter)
    input = tostring(input)
    delimiter = tostring(delimiter)
    if (delimiter=='') then return false end
    local pos,arr = 0, {}
    for st,sp in function() return string.find(input, delimiter, pos, true) end do
        table.insert(arr, string.sub(input, pos, st - 1))
        pos = sp + 1
    end
    table.insert(arr, string.sub(input, pos))
    return arr
end

local function loadEnv()
    local env = {}
    local content = cc.FileUtils:getInstance():getStringFromFile('config.ini')
    local lines   = split(content, '|')
    for _, line in ipairs(lines) do
        local arr = split(line, ',')
        env[arr[1]] = arr[2]
    end
    return env
end

------------------------------------------------------------------------------

-- 0 - disable debug info, 1 - less debug info, 2 - verbose debug info
DEBUG = 0

-- use framework, will disable all deprecated API, false - use legacy API
CC_USE_FRAMEWORK = true

-- disable create unexpected global variable
CC_DISABLE_GLOBAL = true

-- for module display
CC_DESIGN_RESOLUTION = {
    width = 1280,
    height = 720,
    autoscale = "FIXED_HEIGHT",
    callback = function(framesize)
        local ratio = framesize.width / framesize.height
        if ratio <= 1.34 then
            -- iPad 768*1024(1536*2048) is 4:3 screen
            return {autoscale = "FIXED_WIDTH"}
        end
    end
}

local _C = loadEnv()

-- game running mode
-- 0 - RELEASE   开放
-- 1 - BETATEST  外测
-- 2 - DEVELOP   开发
--
CC_RUN_MODE = tonumber(_C.RM) or 2
ON_RELEASED = CC_RUN_MODE == 0
ON_BETATEST = CC_RUN_MODE == 1
ON_DEVELOP  = CC_RUN_MODE == 2

-- open system out
CC_OPEN_OUT = (tonumber(_C.OUT) or 0) == 1

-- FPS
CC_SHOW_FPS = ON_DEVELOP

-- SDK
CC_RUN_SDK = (tonumber(_C.TIP) or 0) == 1

-- PackageId
-- -1 : 开发包
--  0 : 外测包
--
CC_PACKAGE_ID = tonumber(_C.PKG) or 0

-- FPS Rate
CC_NORMAL_FPS = tonumber(_C.NF) or 60
CC_ADJUST_FPS = tonumber(_C.AF) or 45

------------------------------------------------------------------------------

-- dump environment data
if not ON_RELEASED then
    print('=========Environment=========')
    local _E = {
        '     DEBUG', DEBUG,
        '   RUN_SDK', CC_RUN_SDK,
        '  INGLOBAL', CC_DISABLE_GLOBAL,
        '  RUN_MODE', CC_RUN_MODE,
        '  OPEN_OUT', CC_OPEN_OUT,
        '  SHOW_FPS', CC_SHOW_FPS,
        ' FRAMEWORK', CC_USE_FRAMEWORK,
        'PACKAGE_ID', CC_PACKAGE_ID,
        'NORMAL_FPS', CC_NORMAL_FPS,
        'ADJUST_FPS', CC_ADJUST_FPS
    }
    for i=1, #_E, 2 do
        print(string.format('\t%s   =  %s', _E[i], _E[i+1]))
    end
    print('=============================')
end
