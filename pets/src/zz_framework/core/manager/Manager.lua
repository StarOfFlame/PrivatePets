local manager = {}

manager.ui     = loadInstance('UIMgr')
manager.config = loadInstance('ConfigMgr')
manager.state  = include('StateMgr')

return manager