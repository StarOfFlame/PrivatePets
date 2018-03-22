local SingletonBase = class('SingletonBase')

function SingletonBase:getInstance()
    if not self.__instance__ then
        self.__instance__ = self.new()
    end
    return self.__instance__
end

return SingletonBase