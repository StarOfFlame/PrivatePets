local sources = {
	['config'] = 'config',
	['entry'] = 'entry',
	['UpdateUI'] = 'update.UpdateUI',
	['zz'] = 'zz_framework.zz',
	['MainScene'] = 'zz_framework.ui.scenes.MainScene',
	['lfs_testcase'] = 'zz_framework.core.testcase.lfs_testcase',
	['TestCase'] = 'zz_framework.core.testcase.TestCase',
	['Masses'] = 'zz_framework.core.nodes.Masses',
	['Role'] = 'zz_framework.core.nodes.Role',
	['Object'] = 'zz_framework.core.nodes.Object',
	['Prop'] = 'zz_framework.core.nodes.Prop',
	['Npc'] = 'zz_framework.core.nodes.Npc',
	['Player'] = 'zz_framework.core.nodes.Player',
	['Global'] = 'zz_framework.core.utils.Global',
	['SecurityNumber'] = 'zz_framework.core.utils.SecurityNumber',
	['Colorify'] = 'zz_framework.core.utils.Colorify',
	['ShaderUtil'] = 'zz_framework.core.utils.ShaderUtil',
	['Extends'] = 'zz_framework.core.utils.Extends',
	['UIHelper'] = 'zz_framework.core.utils.UIHelper',
	['Utils'] = 'zz_framework.core.utils.Utils',
	['Const'] = 'zz_framework.core.const.Const',
	['UnicodeEnum'] = 'zz_framework.core.const.UnicodeEnum',
	['EventEnum'] = 'zz_framework.core.const.EventEnum',
	['UserXmlEnum'] = 'zz_framework.core.const.UserXmlEnum',
	['ColorEnum'] = 'zz_framework.core.const.ColorEnum',
	['UserDataMgr'] = 'zz_framework.core.manager.UserDataMgr',
	['XmlWriter'] = 'zz_framework.core.manager.XmlWriter',
	['MapMgr'] = 'zz_framework.core.manager.MapMgr',
	['LevelMgr'] = 'zz_framework.core.manager.LevelMgr',
	['XmlReader'] = 'zz_framework.core.manager.XmlReader',
	['ObjectMgr'] = 'zz_framework.core.manager.ObjectMgr',
	['ResMgr'] = 'zz_framework.core.manager.ResMgr',
	['UIMgr'] = 'zz_framework.core.manager.UIMgr',
	['DbMgr'] = 'zz_framework.core.manager.DbMgr',
	['JsonWriter'] = 'zz_framework.core.manager.JsonWriter',
	['Manager'] = 'zz_framework.core.manager.Manager',
	['NetworkMgr'] = 'zz_framework.core.manager.NetworkMgr',
	['CacheMgr'] = 'zz_framework.core.manager.CacheMgr',
	['CashMgr'] = 'zz_framework.core.manager.CashMgr',
	['FuncOpenMgr'] = 'zz_framework.core.manager.FuncOpenMgr',
	['ConfigMgr'] = 'zz_framework.core.manager.ConfigMgr',
	['StateMgr'] = 'zz_framework.core.manager.StateMgr',
	['JsonReader'] = 'zz_framework.core.manager.JsonReader',
	['Event'] = 'zz_framework.core.system.Event',
	['Platform'] = 'zz_framework.core.system.Platform',
	['System'] = 'zz_framework.core.system.System',
	['Timer'] = 'zz_framework.core.system.Timer',
	['Net'] = 'zz_framework.core.system.Net',
	['Audio'] = 'zz_framework.core.system.Audio',
	['XmlParser'] = 'zz_framework.core.thirds.XmlParser',
	['UTF8'] = 'zz_framework.core.thirds.UTF8',
	['Md5'] = 'zz_framework.core.thirds.Md5',
	['richlabel'] = 'zz_framework.core.thirds.richlabel.richlabel',
	['label_div'] = 'zz_framework.core.thirds.richlabel.label_div',
	['label_parser'] = 'zz_framework.core.thirds.richlabel.label_parser',
	['SingletonBase'] = 'zz_framework.core.base.SingletonBase',
	['FloatBase'] = 'zz_framework.core.base.FloatBase',
	['PropBase'] = 'zz_framework.core.base.PropBase',
	['RoleBase'] = 'zz_framework.core.base.RoleBase',
	['SceneBase'] = 'zz_framework.core.base.SceneBase',
	['UserDataBase'] = 'zz_framework.core.base.UserDataBase',
	['UIBase'] = 'zz_framework.core.base.UIBase',
	['WindowBase'] = 'zz_framework.core.base.WindowBase',
	['SpriteSheetBase'] = 'zz_framework.core.base.SpriteSheetBase',
	['ConfigBase'] = 'zz_framework.core.base.ConfigBase',
	['DialogBase'] = 'zz_framework.core.base.DialogBase',
	['ObjectBase'] = 'zz_framework.core.base.ObjectBase',
	['role103'] = 'zz_framework.config.textures.role103',
	['role102'] = 'zz_framework.config.textures.role102',
}

 cc.exports.include = function(name)
	return require(sources[name])
end
