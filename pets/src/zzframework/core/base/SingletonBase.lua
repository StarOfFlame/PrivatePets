------------------------------------------------------------------------------------------
---- Name   : SingletonBase
---- Desc   : 单例基类
---- Date   : 2018/03/23
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------

local SingletonBase = class('SingletonBase')

function SingletonBase:getInstance()
    if not self.__instance__ then
        self.__instance__ = self.new()
    end
    return self.__instance__
end

return SingletonBase