------------------------------------------------------------------------------------------
---- Name   : System
---- Desc   : 系统核心类
---- Date   : 2017/12/16
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------

local System = {}

System.platform = zz:newInstance('Platform')
System.event    = zz:newInstance('Event')
System.timer    = zz:newInstance('Timer')
System.audio    = zz:newInstance('Audio')
System.net      = zz:newInstance('Net')

return System