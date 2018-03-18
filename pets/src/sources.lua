local sources       = {
	Game               = 'entry.Game',
	MyApp              = 'entry.MyApp',
	MainScene          = 'entry.ui.scenes.MainScene',
	Masses             = 'entry.nodes.Masses',
	Role               = 'entry.nodes.Role',
	Object             = 'entry.nodes.Object',
	Prop               = 'entry.nodes.Prop',
	Npc                = 'entry.nodes.Npc',
	Player             = 'entry.nodes.Player',
	Colorify           = 'entry.utils.Colorify',
	Extends            = 'entry.utils.Extends',
	UIHelper           = 'entry.utils.UIHelper',
	Utils              = 'entry.utils.Utils',
	EventEnum          = 'entry.const.EventEnum',
	ColorEnum          = 'entry.const.ColorEnum',
	UserEnum           = 'entry.const.UserEnum',
	ConfigBase         = 'entry.const.ConfigBase',
	UserDataMgr        = 'entry.manager.UserDataMgr',
	SceneMgr           = 'entry.manager.SceneMgr',
	SourceMgr          = 'entry.manager.SourceMgr',
	XmlWriter          = 'entry.manager.XmlWriter',
	MapMgr             = 'entry.manager.MapMgr',
	LevelMgr           = 'entry.manager.LevelMgr',
	XmlReader          = 'entry.manager.XmlReader',
	ObjectMgr          = 'entry.manager.ObjectMgr',
	ResMgr             = 'entry.manager.ResMgr',
	TimerMgr           = 'entry.manager.TimerMgr',
	LayerMgr           = 'entry.manager.LayerMgr',
	DbMgr              = 'entry.manager.DbMgr',
	JsonWriter         = 'entry.manager.JsonWriter',
	NetworkMgr         = 'entry.manager.NetworkMgr',
	CacheMgr           = 'entry.manager.CacheMgr',
	CashMgr            = 'entry.manager.CashMgr',
	FuncOpenMgr        = 'entry.manager.FuncOpenMgr',
	ConfigMgr          = 'entry.manager.ConfigMgr',
	EventMgr           = 'entry.manager.EventMgr',
	JsonReader         = 'entry.manager.JsonReader',
	Event              = 'entry.system.Event',
	Timer              = 'entry.system.Timer',
	Net                = 'entry.system.Net',
	Audio              = 'entry.system.Audio',
	XmlParser          = 'entry.thirds.XmlParser',
	UTF8               = 'entry.thirds.UTF8',
	Md5                = 'entry.thirds.Md5',
	richlabel          = 'entry.thirds.richlabel.richlabel',
	label_div          = 'entry.thirds.richlabel.label_div',
	label_parser       = 'entry.thirds.richlabel.label_parser',
	ManagerBase        = 'entry.base.ManagerBase',
	PropBase           = 'entry.base.PropBase',
	RoleBase           = 'entry.base.RoleBase',
	SceneBase          = 'entry.base.SceneBase',
	UserDataBase       = 'entry.base.UserDataBase',
	ConfigBase         = 'entry.base.ConfigBase',
	LayerBase          = 'entry.base.LayerBase',
	ObjectBase         = 'entry.base.ObjectBase',
}

 cc.exports.loadSrc = function(name)
	return require(sources[name])
end
