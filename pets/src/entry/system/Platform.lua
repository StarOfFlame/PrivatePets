local Platform   = class('Platform')

Platform.OS = {
    Mac     = cc.PLATFORM_OS_MAC,
    iPad    = cc.PLATFORM_OS_IPAD,
    iPhone  = cc.PLATFORM_OS_IPHONE,
    Linux   = cc.PLATFORM_OS_LINUX,
    Android = cc.PLATFORM_OS_ANDROID,
    Windows = cc.PLATFORM_OS_WINDOWS,
}

Platform.Language = {
    English    = cc.LANGUAGE_ENGLISH,
    Chinese    = cc.LANGUAGE_CHINESE,
    French     = cc.LANGUAGE_FRENCH,
    Italian    = cc.LANGUAGE_ITALIAN,
    German     = cc.LANGUAGE_GERMAN,
    Spanish    = cc.LANGUAGE_SPANISH,
    Russian    = cc.LANGUAGE_RUSSIAN,
    Korean     = cc.LANGUAGE_KOREAN,
    Japanese   = cc.LANGUAGE_JAPANESE,
    Hungarian  = cc.LANGUAGE_HUNGARIAN,
    Portuguese = cc.LANGUAGE_PORTUGUESE,
    Arabic     = cc.LANGUAGE_ARABIC,
}

function Platform:ctor()
    self.target_   = cc.Application:getInstance():getTargetPlatform()
    self.language_ = cc.Application:getInstance():getCurrentLanguage()
end

function Platform:getTargetOS()
    return self.target_
end

function Platform:getTargetOSname()
    for name, code in pairs(Platform.OS) do
        if code == self.target_ then
            return name
        end
    end
    return 'Unknown'
end

function Platform.isWin()
    return self.target_ == Platform.OS.Windows
end

function Platform:isMac()
    return self.target_ == Platform.OS.Mac
end

function Platform:isiPhone()
    return self.target_ == Platform.OS.iPhone
end

function Platform:isiPad()
    return self.target_ == Platform.OS.iPad
end

function Platform:isLinux()
    return self.target_ == Platform.OS.Linux
end

function Platform:isAndroid()
    return self.target_ == Platform.OS.Android
end

function Platform:getLanguage()
    return self.language_
end

function Platform:isEnglish()
    return self.language_ == Platform.Language.English
end

function Platform:isChinese()
    return self.language_ == Platform.Language.Chinese
end

function Platform:getLanguageName()
    for name, code in pairs(Platform.Language) do
        if code == self.language_ then
            return name
        end
    end
    return 'Unknown'
end

function Platform:getText(textId)
    -- return config.LanguageText[textId] or textId
end

return Platform