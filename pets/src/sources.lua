local sources = {
	Game = 'core.Game',
	MyApp = 'core.MyApp',
	MainScene = 'core.ui.scenes.MainScene',
	Masses = 'core.nodes.Masses',
	Role = 'core.nodes.Role',
	Object = 'core.nodes.Object',
	Prop = 'core.nodes.Prop',
	Npc = 'core.nodes.Npc',
	Player = 'core.nodes.Player',
	Global = 'core.utils.Global',
	SecurityNumber = 'core.utils.SecurityNumber',
	Colorify = 'core.utils.Colorify',
	Extends = 'core.utils.Extends',
	UIHelper = 'core.utils.UIHelper',
	Utils = 'core.utils.Utils',
	Const = 'core.const.Const',
	EventEnum = 'core.const.EventEnum',
	UserXmlEnum = 'core.const.UserXmlEnum',
	ColorEnum = 'core.const.ColorEnum',
	ConfigBase = 'core.const.ConfigBase',
	UserDataMgr = 'core.manager.UserDataMgr',
	SceneMgr = 'core.manager.SceneMgr',
	SourceMgr = 'core.manager.SourceMgr',
	XmlWriter = 'core.manager.XmlWriter',
	MapMgr = 'core.manager.MapMgr',
	LevelMgr = 'core.manager.LevelMgr',
	XmlReader = 'core.manager.XmlReader',
	ObjectMgr = 'core.manager.ObjectMgr',
	ResMgr = 'core.manager.ResMgr',
	TimerMgr = 'core.manager.TimerMgr',
	LayerMgr = 'core.manager.LayerMgr',
	DbMgr = 'core.manager.DbMgr',
	JsonWriter = 'core.manager.JsonWriter',
	NetworkMgr = 'core.manager.NetworkMgr',
	CacheMgr = 'core.manager.CacheMgr',
	CashMgr = 'core.manager.CashMgr',
	FuncOpenMgr = 'core.manager.FuncOpenMgr',
	ConfigMgr = 'core.manager.ConfigMgr',
	EventMgr = 'core.manager.EventMgr',
	JsonReader = 'core.manager.JsonReader',
	Event = 'core.system.Event',
	Platform = 'core.system.Platform',
	System = 'core.system.System',
	Timer = 'core.system.Timer',
	Net = 'core.system.Net',
	Audio = 'core.system.Audio',
	XmlParser = 'core.thirds.XmlParser',
	UTF8 = 'core.thirds.UTF8',
	Md5 = 'core.thirds.Md5',
	richlabel = 'core.thirds.richlabel.richlabel',
	label_div = 'core.thirds.richlabel.label_div',
	label_parser = 'core.thirds.richlabel.label_parser',
	ManagerBase = 'core.base.ManagerBase',
	PropBase = 'core.base.PropBase',
	RoleBase = 'core.base.RoleBase',
	SceneBase = 'core.base.SceneBase',
	UserDataBase = 'core.base.UserDataBase',
	ConfigBase = 'core.base.ConfigBase',
	LayerBase = 'core.base.LayerBase',
	ObjectBase = 'core.base.ObjectBase',
}

 cc.exports.loadSrc = function(name)
	return require(sources[name])
end
