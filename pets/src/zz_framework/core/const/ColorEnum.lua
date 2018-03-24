------------------------------------------------------------------------------------------
---- Name   : ColorEnum
---- Desc   : 色值定义
---- Date   : 2018/03/23
---- Author : Reyn 
---- Email  : jl88744653@gmail.com
------------------------------------------------------------------------------------------
local rgb  = cc.c3b
local rgba = cc.c4b

local COLORENUM = {
    LIGHTPINK            = rgb(255,182,193), --浅粉红
    PINK                 = rgb(255,192,203), --粉红
    CRIMSON              = rgb(220,20,60),   --猩红
    LAVENDERBLUSH        = rgb(255,240,245), --脸红的淡紫色
    PALEVIOLETRED        = rgb(219,112,147), --苍白的紫罗兰红色
    HOTPINK              = rgb(255,105,180), --热情的粉红
    DEEPPINK             = rgb(255,20,147),  --深粉色
    MEDIUMVIOLETRED      = rgb(199,21,133),  --适中的紫罗兰红色
    ORCHID               = rgb(218,112,214), --兰花的紫色
    THISTLE              = rgb(216,191,216), --蓟
    PLUM                 = rgb(221,160,221), --李子
    VIOLET               = rgb(238,130,238), --紫罗兰
    MAGENTA              = rgb(255,0,255),   --洋红
    FUCHSIA              = rgb(255,0,255),   --灯笼海棠
    DARKMAGENTA          = rgb(139,0,139),   --深洋红色
    PURPLE               = rgb(128,0,128),   --紫色
    MEDIUMORCHID         = rgb(186,85,211),  --适中的兰花紫
    DARKVOILET           = rgb(148,0,211),   --深紫罗兰色
    DARKORCHID           = rgb(153,50,204),  --深兰花紫
    INDIGO               = rgb(75,0,130),    --靛青
    BLUEVIOLET           = rgb(138,43,226),  --深紫罗兰的蓝色
    MEDIUMPURPLE         = rgb(147,112,219), --适中的紫色
    MEDIUMSLATEBLUE      = rgb(123,104,238), --适中的板岩暗蓝灰色
    SLATEBLUE            = rgb(106,90,205),  --板岩暗蓝灰色
    DARKSLATEBLUE        = rgb(72,61,139),   --深岩暗蓝灰色
    LAVENDER             = rgb(230,230,250), --熏衣草花的淡紫色
    GHOSTWHITE           = rgb(248,248,255), --幽灵的白色
    BLUE                 = rgb(0,0,255),     --纯蓝
    MEDIUMBLUE           = rgb(0,0,205),     --适中的蓝色
    MIDNIGHTBLUE         = rgb(25,25,112),   --午夜的蓝色
    DARKBLUE             = rgb(0,0,139),     --深蓝色
    NAVY                 = rgb(0,0,128),     --海军蓝
    ROYALBLUE            = rgb(65,105,225),  --皇军蓝
    CORNFLOWERBLUE       = rgb(100,149,237), --矢车菊的蓝色
    LIGHTSTEELBLUE       = rgb(176,196,222), --淡钢蓝
    LIGHTSLATEGRAY       = rgb(119,136,153), --浅石板灰
    SLATEGRAY            = rgb(112,128,144), --石板灰
    DODERBLUE            = rgb(30,144,255),  --道奇蓝
    ALICEBLUE            = rgb(240,248,255), --爱丽丝蓝
    STEELBLUE            = rgb(70,130,180),  --钢蓝
    LIGHTSKYBLUE         = rgb(135,206,250), --淡蓝色
    SKYBLUE              = rgb(135,206,235), --天蓝色
    DEEPSKYBLUE          = rgb(0,191,255),   --深天蓝
    LIGHTBLUE            = rgb(173,216,230), --淡蓝
    POWDERBLUE           = rgb(176,224,230), --火药蓝
    CADETBLUE            = rgb(95,158,160),  --军校蓝
    AZURE                = rgb(240,255,255), --蔚蓝色
    LIGHTCYAN            = rgb(225,255,255), --淡青色
    PALETURQUOISE        = rgb(175,238,238), --苍白的绿宝石
    CYAN                 = rgb(0,255,255),   --青色
    AQUA                 = rgb(0,255,255),   --水绿色
    DARKTURQUOISE        = rgb(0,206,209),   --深绿宝石
    DARKSLATEGRAY        = rgb(47,79,79),    --深石板灰
    DARKCYAN             = rgb(0,139,139),   --深青色
    TEAL                 = rgb(0,128,128),   --水鸭色
    MEDIUMTURQUOISE      = rgb(72,209,204),  --适中的绿宝石
    LIGHTSEAGREEN        = rgb(32,178,170),  --浅海洋绿
    TURQUOISE            = rgb(64,224,208),  --绿宝石
    AUQAMARIN            = rgb(127,255,170), --绿玉
    MEDIUMAQUAMARINE     = rgb(0,250,154),   --适中的碧绿色
    MEDIUMSPRINGGREEN    = rgb(0,255,127),   --适中的春天的绿色
    MINTCREAM            = rgb(245,255,250), --薄荷奶油
    SPRINGGREEN          = rgb(60,179,113),  --春天的绿色
    SEAGREEN             = rgb(46,139,87),   --海洋绿
    HONEYDEW             = rgb(240,255,240), --蜂蜜
    LIGHTGREEN           = rgb(144,238,144), --淡绿色
    PALEGREEN            = rgb(152,251,152), --苍白的绿色
    DARKSEAGREEN         = rgb(143,188,143), --深海洋绿
    LIMEGREEN            = rgb(50,205,50),   --酸橙绿
    LIME                 = rgb(0,255,0),     --酸橙色
    FORESTGREEN          = rgb(34,139,34),   --森林绿
    GREEN                = rgb(0,128,0),     --纯绿
    DARKGREEN            = rgb(0,100,0),     --深绿色
    CHARTREUSE           = rgb(127,255,0),   --查特酒绿
    LAWNGREEN            = rgb(124,252,0),   --草坪绿
    GREENYELLOW          = rgb(173,255,47),  --绿黄色
    OLIVEDRAB            = rgb(85,107,47),   --橄榄土褐色
    BEIGE                = rgb(245,245,220), --米色
    LIGHTGOLDENRODYELLOW = rgb(250,250,210), --浅秋麒麟黄
    IVORY                = rgb(255,255,240), --象牙
    LIGHTYELLOW          = rgb(255,255,224), --浅黄色
    YELLOW               = rgb(255,255,0),   --纯黄
    OLIVE                = rgb(128,128,0),   --橄榄
    DARKKHAKI            = rgb(189,183,107), --深卡其布
    LEMONCHIFFON         = rgb(255,250,205), --柠檬薄纱
    PALEGODENROD         = rgb(238,232,170), --灰秋麒麟
    KHAKI                = rgb(240,230,140), --卡其布
    GOLD                 = rgb(255,215,0),   --金
    CORNISLK             = rgb(255,248,220), --玉米色
    GOLDENROD            = rgb(218,165,32),  --秋麒麟
    FLORALWHITE          = rgb(255,250,240), --花的白色
    OLDLACE              = rgb(253,245,230), --老饰带
    WHEAT                = rgb(245,222,179), --小麦色
    MOCCASIN             = rgb(255,228,181), --鹿皮鞋
    ORANGE               = rgb(255,165,0),   --橙色
    PAPAYAWHIP           = rgb(255,239,213), --番木瓜
    BLANCHEDALMOND       = rgb(255,235,205), --漂白的杏仁
    NAVAJOWHITE          = rgb(255,222,173), --纳瓦霍白
    ANTIQUEWHITE         = rgb(250,235,215), --古代的白色
    TAN                  = rgb(210,180,140), --晒黑
    BRULYWOOD            = rgb(222,184,135), --结实的树
    BISQUE               = rgb(255,228,196), --浓汤
    DARKORANGE           = rgb(255,140,0),   --深橙色
    LINEN                = rgb(250,240,230), --亚麻布
    PERU                 = rgb(205,133,63),  --秘鲁
    PEACHPUFF            = rgb(255,218,185), --桃色
    SANDYBROWN           = rgb(244,164,96),  --沙棕色
    CHOCOLATE            = rgb(210,105,30),  --巧克力
    SADDLEBROWN          = rgb(139,69,19),   --马鞍棕色
    SEASHELL             = rgb(255,245,238), --海贝壳
    SIENNA               = rgb(160,82,45),   --黄土赭色
    LIGHTSALMON          = rgb(255,160,122), --浅鲜肉
    CORAL                = rgb(255,127,80),  --珊瑚
    ORANGERED            = rgb(255,69,0),    --橙红色
    DARKSALMON           = rgb(233,150,122), --深鲜肉
    TOMATO               = rgb(255,99,71),   --番茄
    MISTYROSE            = rgb(255,228,225), --薄雾玫瑰
    SALMON               = rgb(250,128,114), --鲜肉
    SNOW                 = rgb(255,250,250), --雪
    LIGHTCORAL           = rgb(240,128,128), --淡珊瑚色
    ROSYBROWN            = rgb(188,143,143), --玫瑰棕色
    INDIANRED            = rgb(205,92,92),   --印度红
    RED                  = rgb(255,0,0),     --纯红
    BROWN                = rgb(165,42,42),   --棕色
    FIREBRICK            = rgb(178,34,34),   --耐火砖
    DARKRED              = rgb(139,0,0),     --深红色
    MAROON               = rgb(128,0,0),     --栗色
    WHITE                = rgb(255,255,255), --纯白
    WHITESMOKE           = rgb(245,245,245), --白烟
    GAINSBORO            = rgb(220,220,220), --亮灰色
    LIGHTGREY            = rgb(211,211,211), --浅灰色
    SILVER               = rgb(192,192,192), --银白色
    DARKGRAY             = rgb(169,169,169), --深灰色
    GRAY                 = rgb(128,128,128), --灰色
    DIMGRAY              = rgb(105,105,105), --暗淡的灰色
    BLACK                = rgb(0,0,0),       --纯黑
}

COLORENUM.ROLE_NAME = {
    PLAYER = COLORENUM.RED,
    COSTAR = COLORENUM.GREEN,
    MASSES = COLORENUM.WHITE,
}

cc.exports.RGB = function(color)
    color.a = nil
    return color
end

cc.exports.RGBA = function(color, alpha)
    color.a = alpha
    return color
end

return COLORENUM
