------------------------------------------------------------------------------------------
---- Name   : System
---- Desc   : 系统核心类
---- Date   : 2017/12/16
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------

local System = {}

System.platform = newInstance('Platform')
System.event    = newInstance('Event')
System.timer    = newInstance('Timer')
System.audio    = newInstance('Audio')
System.net      = newInstance('Net')

return System