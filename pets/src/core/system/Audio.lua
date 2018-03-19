------------------------------------------------------------------------------------------
---- Name   : Audio
---- Desc   : 音效核心类
---- Date   : 2017/12/17
---- Author : Reyn - jl88744653@gmail.com
------------------------------------------------------------------------------------------

------------------------------------------
-- local variables
--
local UserXml    = cc.UserDefault:getInstance()
local strfmt     = string.format

------------------------------------------
-- Class Audio
--
local Audio  = class('Audio')

function Audio:ctor()
    self.bgm          = {}
    self.effect       = {}
    self.effectId     = -1
    self.musicId      = -1
    self.musicVol     = UserXml:getIntegerForKey(CONST.USERXML.MUSIC_VOLUME,  60)
    self.effectVol    = UserXml:getIntegerForKey(CONST.USERXML.EFFECT_VOLUME, 60)
    self.isPlayMusic  = UserXml:getBoolForKey(CONST.USERXML.MUSIC_ENABLE,  true)
    self.isPlayEffect = UserXml:getBoolForKey(CONST.USERXML.EFFECT_ENABLE, true)
end

------------------------------------------
-- @desc : 核心加载
--
function Audio:load()
    self:playMusicInSet(table.range(1,3))
end

------------------------------------------
-- @desc : 核心卸载
--
function Audio:unload()
    ccexp.AudioEngine:uncacheAll()
end

------------------------------------------
-- @desc : set music volume
-- @param : vol - music volume
--
function Audio:setMusicVolume(vol)
    if self.musicVol == vol then return end
    self.musicVol = min(100, max(0, vol))
    UserXml:setIntegerForKey(CONST.USERXML.MUSIC_VOLUME, self.musicVol)
    self:tag('setMusicVolume : ' .. vol)
end

------------------------------------------
-- @desc : set effect volume
-- @param : vol - effect volume
--
function Audio:setEffectVolume(vol)
    if self.effectVol == vol then return end
    self.effectVol = min(100, max(0, vol))
    UserXml:setIntegerForKey(CONST.USERXML.EFFECT_VOLUME, self.effectVol)
    self:tag('setEffectVolume : ' .. vol)
end

------------------------------------------
-- @desc : set volume for target audioID
-- @param : atype - music or effect
-- @param : playAudioId - the audio ID which is playing
--
function Audio:setVolume(atype, playAudioId)
    local vol = {music = self.musicVol * 0.01, effect = self.effectVol * 0.01}
    ccexp.AudioEngine:setVolume(playAudioId, vol[atype] or 0)
end

------------------------------------------
-- @desc : get audio path by audio ID
-- @param : audioId - audio ID
--
function Audio:getAudioPath(audioId)
    local path = strfmt('audio/%s.mp3', audioId)
    if not cc.FileUtils:getInstance():isFileExist(path) then
        self:tag(strfmt('%s not found.', path))
        return nil
    end
    return path
end

------------------------------------------
-- @desc : preload audio by audio ID
-- @param : audioId - audio ID
--
function Audio:preload(audioId)
    local path = self:getAudioPath(audioId)
    if not path then return end
    ccexp.AudioEngine:preload(path) 
    self:tag('preload : ' .. path)
end

------------------------------------------
-- @desc : record audio ID which is playing
-- @param : atype - music or effect
-- @param : playAudioId - the audio ID which is playing
--
function Audio:setPlayAudioId(atype, playAudioId)
    if atype == 'music' then
        self.musicId = playAudioId
    elseif atype == 'effect' then
        self.effectId = playAudioId
    end
end

------------------------------------------
-- @desc : play audio 
-- @param : audioId - audio ID
-- @param : atype - music or effect
-- @param : callfn - audio finish callback
--
function Audio:play(audioId, atype, callfn)
    if not self.isPlayMusic  and atype == 'music'  then return end
    if not self.isPlayEffect and atype == 'effect' then return end
    if atype == 'music' and self.musicId ~= -1 then
        self:tag(strfmt('music on playing : %s', audioId))
        return
    end
    if atype == 'effect' and self.effectId ~= -1 then
        self:stopEffect()
    end
    
    local path = self:getAudioPath(audioId)
    if not path then return end
    
    local playAudioId = ccexp.AudioEngine:play2d(path)
    self:setPlayAudioId(atype, playAudioId)
    self:setVolume(atype, playAudioId)
    self:tag(strfmt('play %s audio : %s', atype, audioId))
    
    local function audioStopFn(aId, path)
        self:tag(strfmt('stop %s audio : %s', atype, audioId))
        self:setPlayAudioId(atype, -1)
        if callfn then callfn(aId, path) end
    end
    ccexp.AudioEngine:setFinishCallback(playAudioId, audioStopFn) 
end

------------------------------------------
-- @desc : stop effect audio which is playing 
--
function Audio:stopEffect()
    if not self.effectId then return end
    ccexp.AudioEngine:stop(self.effectId)
    self.effectId = -1
end

------------------------------------------
-- @desc : stop music audio which is playing 
--
function Audio:stopMusic()
    if not self.musicId then return end
    ccexp.AudioEngine:stop(self.musicId)
    self.musicId = -1
end

------------------------------------------
-- @desc : play effect by id
-- @param : audioId - effect id
-- @param : callfn - effect finish callback
--
function Audio:playEffect(audioId, callfn)
    self:play(strfmt('eff%03d', audioId), 'effect', callfn)
end

------------------------------------------
-- @desc : play music by id
-- @param : audioId - music id
-- @param : callfn - music finish callback
--
function Audio:playMusic(audioId, callfn)
    self:play(strfmt('bkg%03d', audioId), 'music', callfn)
end

------------------------------------------
-- @desc : play music in set
-- @param : bkgset - set of music
--
function Audio:playMusicInSet(bkgset)
    if bkgset and #bkgset > 0 then 
        local head = table.tail(bkgset)
        self:playMusic(head, function()
            self:playMusicInSet(bkgset)
        end)
    end
end

------------------------------------------
-- @desc : play music from A to B
-- @param : from - begin index
-- @param : to - end index
--
function Audio:playMusicFromTo(from, to)
    self:playMusicInSet(table.range(from,to))
end

------------------------------------------
-- @desc : enable effect player
-- @param : isenable - enable / disable
--
function Audio:enableEffect(isenable)
    if isenable == self.isPlayEffect then
        return
    end
    if not isenable then
        self:stopEffect()
    end
    self.isPlayEffect = isenable
    UserXml:setBoolForKey(CONST.USERXML.EFFECT_ENABLE, self.isPlayEffect)
    self:tag('enableEffect : ' .. tostring(self.isPlayEffect))
end

------------------------------------------
-- @desc : enable music player
-- @param : isenable - enable / disable
--
function Audio:enableMusic(isenable)
    if isenable == self.isPlayMusic then
        return
    end
    if not isenable then
        self:stopMusic()
    end
    self.isPlayMusic = isenable
    UserXml:setBoolForKey(CONST.USERXML.MUSIC_ENABLE, self.isPlayMusic)
    self:tag('enableMusic : ' .. tostring(self.isPlayMusic))
end

return Audio
