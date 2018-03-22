local SingletonBase = class('SingletonBase')

function SingletonBase:ctor()
    self.__instance__ = nil
    
end

function SingletonBase:getInstance()
    if not self.__instance__ then
        self.__inittime__ = checkint(self.__inittime__)
        self.__inittime__ = self.__inittime__ + 1
        self.__instance__ = self.new()
        self:tag('__inittime__', self.__inittime__)
    end
    return self.__instance__
end

return SingletonBase