--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:c51899ace49707eef91307399e122247:1/1$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}
setmetatable(SheetInfo, {__index = SheetBase})

SheetInfo.contentSize      = cc.size(4056, 2473)
SheetInfo.source           = "anim/role102.pvr.ccz"
SheetInfo.premultiplyAlpha = true
SheetInfo.allowRotation    = false
SheetInfo.ditherType       = 3

SheetInfo.frames = {
    {   -- a1001
        rect   = cc.rect(2993, 835, 196, 190),
        size   = cc.size(196, 190),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1002
        rect   = cc.rect(791, 733, 198, 192),
        size   = cc.size(198, 192),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1003
        rect   = cc.rect(2593, 835, 198, 190),
        size   = cc.size(198, 190),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1004
        rect   = cc.rect(3379, 843, 198, 188),
        size   = cc.size(198, 188),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1006
        rect   = cc.rect(3575, 1, 200, 212),
        size   = cc.size(200, 212),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1007
        rect   = cc.rect(401, 228, 196, 226),
        size   = cc.size(196, 226),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1008
        rect   = cc.rect(401, 455, 192, 226),
        size   = cc.size(192, 226),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1009
        rect   = cc.rect(1143, 439, 190, 214),
        size   = cc.size(190, 214),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1010
        rect   = cc.rect(1199, 224, 196, 214),
        size   = cc.size(196, 214),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1011
        rect   = cc.rect(1, 455, 200, 226),
        size   = cc.size(200, 226),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1012
        rect   = cc.rect(1, 228, 200, 226),
        size   = cc.size(200, 226),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1013
        rect   = cc.rect(3175, 1, 198, 216),
        size   = cc.size(198, 216),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1014
        rect   = cc.rect(1736, 441, 134, 200),
        size   = cc.size(134, 200),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1015
        rect   = cc.rect(3578, 839, 118, 194),
        size   = cc.size(118, 194),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1016
        rect   = cc.rect(896, 926, 130, 198),
        size   = cc.size(130, 198),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1017
        rect   = cc.rect(2775, 1, 198, 218),
        size   = cc.size(198, 218),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1018
        rect   = cc.rect(1593, 224, 194, 216),
        size   = cc.size(194, 216),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1019
        rect   = cc.rect(600, 1, 200, 220),
        size   = cc.size(200, 220),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1021
        rect   = cc.rect(1871, 437, 178, 206),
        size   = cc.size(178, 206),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1022
        rect   = cc.rect(878, 1929, 188, 180),
        size   = cc.size(188, 180),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1023
        rect   = cc.rect(3802, 419, 176, 190),
        size   = cc.size(176, 190),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1025
        rect   = cc.rect(3175, 1217, 198, 188),
        size   = cc.size(198, 188),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1026
        rect   = cc.rect(3175, 1028, 198, 188),
        size   = cc.size(198, 188),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1027
        rect   = cc.rect(202, 230, 198, 228),
        size   = cc.size(198, 228),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1028
        rect   = cc.rect(2976, 1227, 198, 188),
        size   = cc.size(198, 188),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1030
        rect   = cc.rect(2781, 1227, 194, 198),
        size   = cc.size(194, 198),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1031
        rect   = cc.rect(1926, 1671, 190, 188),
        size   = cc.size(190, 188),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1032
        rect   = cc.rect(3567, 1034, 166, 190),
        size   = cc.size(166, 190),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1033
        rect   = cc.rect(781, 512, 176, 220),
        size   = cc.size(176, 220),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1034
        rect   = cc.rect(2050, 435, 150, 214),
        size   = cc.size(150, 214),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1035
        rect   = cc.rect(363, 905, 134, 218),
        size   = cc.size(134, 218),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1037
        rect   = cc.rect(1, 2269, 190, 202),
        size   = cc.size(190, 202),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1038
        rect   = cc.rect(1334, 441, 200, 202),
        size   = cc.size(200, 202),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1039
        rect   = cc.rect(2392, 632, 200, 200),
        size   = cc.size(200, 200),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1040
        rect   = cc.rect(2589, 431, 200, 200),
        size   = cc.size(200, 200),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1041
        rect   = cc.rect(2388, 431, 200, 200),
        size   = cc.size(200, 200),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1042
        rect   = cc.rect(1535, 441, 200, 200),
        size   = cc.size(200, 200),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1044
        rect   = cc.rect(1396, 224, 196, 216),
        size   = cc.size(196, 216),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1045
        rect   = cc.rect(510, 2301, 196, 166),
        size   = cc.size(196, 166),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1046
        rect   = cc.rect(2395, 1018, 196, 202),
        size   = cc.size(196, 202),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1047
        rect   = cc.rect(2791, 1026, 192, 200),
        size   = cc.size(192, 200),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1048
        rect   = cc.rect(2242, 1281, 194, 198),
        size   = cc.size(194, 198),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1049
        rect   = cc.rect(1983, 224, 194, 210),
        size   = cc.size(194, 210),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1056
        rect   = cc.rect(2392, 833, 200, 184),
        size   = cc.size(200, 184),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1057
        rect   = cc.rect(3601, 419, 200, 188),
        size   = cc.size(200, 188),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1058
        rect   = cc.rect(2792, 835, 200, 190),
        size   = cc.size(200, 190),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1059
        rect   = cc.rect(2790, 648, 200, 186),
        size   = cc.size(200, 186),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1061
        rect   = cc.rect(2592, 1026, 198, 200),
        size   = cc.size(198, 200),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1062
        rect   = cc.rect(2377, 224, 198, 206),
        size   = cc.size(198, 206),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1063
        rect   = cc.rect(2178, 224, 198, 206),
        size   = cc.size(198, 206),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1064
        rect   = cc.rect(1347, 865, 198, 202),
        size   = cc.size(198, 202),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1071
        rect   = cc.rect(1000, 224, 198, 210),
        size   = cc.size(198, 210),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1072
        rect   = cc.rect(3776, 1, 198, 214),
        size   = cc.size(198, 214),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1073
        rect   = cc.rect(2974, 1, 200, 216),
        size   = cc.size(200, 216),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a1074
        rect   = cc.rect(3374, 1, 200, 214),
        size   = cc.size(200, 214),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2001
        rect   = cc.rect(3425, 1855, 140, 200),
        size   = cc.size(140, 200),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2002
        rect   = cc.rect(888, 1125, 140, 202),
        size   = cc.size(140, 202),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2003
        rect   = cc.rect(2248, 867, 142, 202),
        size   = cc.size(142, 202),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2004
        rect   = cc.rect(2328, 1480, 140, 200),
        size   = cc.size(140, 200),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2006
        rect   = cc.rect(827, 222, 172, 210),
        size   = cc.size(172, 210),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2007
        rect   = cc.rect(1037, 1323, 160, 216),
        size   = cc.size(160, 216),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2008
        rect   = cc.rect(1194, 875, 152, 216),
        size   = cc.size(152, 216),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2009
        rect   = cc.rect(2932, 220, 146, 210),
        size   = cc.size(146, 210),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2010
        rect   = cc.rect(2242, 1070, 152, 210),
        size   = cc.size(152, 210),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2011
        rect   = cc.rect(190, 1815, 174, 220),
        size   = cc.size(174, 220),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2012
        rect   = cc.rect(2211, 648, 180, 218),
        size   = cc.size(180, 218),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2013
        rect   = cc.rect(192, 2255, 184, 214),
        size   = cc.size(184, 214),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2014
        rect   = cc.rect(2959, 431, 140, 216),
        size   = cc.size(140, 216),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2015
        rect   = cc.rect(2050, 650, 160, 216),
        size   = cc.size(160, 216),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2016
        rect   = cc.rect(377, 2219, 132, 212),
        size   = cc.size(132, 212),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2017
        rect   = cc.rect(884, 1328, 152, 216),
        size   = cc.size(152, 216),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2018
        rect   = cc.rect(399, 682, 194, 216),
        size   = cc.size(194, 216),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2019
        rect   = cc.rect(2790, 431, 168, 216),
        size   = cc.size(168, 216),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2021
        rect   = cc.rect(3657, 608, 144, 208),
        size   = cc.size(144, 208),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2022
        rect   = cc.rect(882, 1545, 162, 182),
        size   = cc.size(162, 182),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2023
        rect   = cc.rect(3276, 218, 140, 196),
        size   = cc.size(140, 196),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2025
        rect   = cc.rect(900, 2273, 170, 196),
        size   = cc.size(170, 196),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2026
        rect   = cc.rect(1234, 1737, 176, 194),
        size   = cc.size(176, 194),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2027
        rect   = cc.rect(2201, 431, 186, 216),
        size   = cc.size(186, 216),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2028
        rect   = cc.rect(1745, 1872, 190, 168),
        size   = cc.size(190, 168),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2030
        rect   = cc.rect(3906, 1428, 144, 204),
        size   = cc.size(144, 204),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2031
        rect   = cc.rect(1045, 1737, 188, 190),
        size   = cc.size(188, 190),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2032
        rect   = cc.rect(2991, 648, 198, 186),
        size   = cc.size(198, 186),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2033
        rect   = cc.rect(2437, 1221, 146, 216),
        size   = cc.size(146, 216),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2034
        rect   = cc.rect(3734, 1032, 178, 192),
        size   = cc.size(178, 192),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2035
        rect   = cc.rect(3379, 628, 144, 214),
        size   = cc.size(144, 214),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2037
        rect   = cc.rect(1729, 859, 138, 208),
        size   = cc.size(138, 208),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2038
        rect   = cc.rect(1868, 863, 180, 204),
        size   = cc.size(180, 204),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2039
        rect   = cc.rect(3417, 216, 172, 204),
        size   = cc.size(172, 204),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2040
        rect   = cc.rect(2753, 1641, 158, 208),
        size   = cc.size(158, 208),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2041
        rect   = cc.rect(2773, 224, 158, 206),
        size   = cc.size(158, 206),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2042
        rect   = cc.rect(1395, 2266, 162, 206),
        size   = cc.size(162, 206),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2044
        rect   = cc.rect(1027, 885, 166, 218),
        size   = cc.size(166, 218),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2045
        rect   = cc.rect(2449, 2077, 164, 176),
        size   = cc.size(164, 176),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2046
        rect   = cc.rect(1546, 865, 182, 202),
        size   = cc.size(182, 202),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2047
        rect   = cc.rect(500, 1541, 188, 180),
        size   = cc.size(188, 180),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2048
        rect   = cc.rect(707, 2291, 192, 178),
        size   = cc.size(192, 178),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2049
        rect   = cc.rect(693, 1917, 184, 188),
        size   = cc.size(184, 188),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2056
        rect   = cc.rect(3566, 1935, 158, 198),
        size   = cc.size(158, 198),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2057
        rect   = cc.rect(2719, 1850, 158, 200),
        size   = cc.size(158, 200),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2058
        rect   = cc.rect(1071, 2272, 162, 200),
        size   = cc.size(162, 200),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2059
        rect   = cc.rect(1234, 2272, 160, 200),
        size   = cc.size(160, 200),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2061
        rect   = cc.rect(693, 2106, 184, 184),
        size   = cc.size(184, 184),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2062
        rect   = cc.rect(510, 2110, 182, 190),
        size   = cc.size(182, 190),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2063
        rect   = cc.rect(504, 1722, 184, 194),
        size   = cc.size(184, 194),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2064
        rect   = cc.rect(1560, 1681, 184, 192),
        size   = cc.size(184, 192),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2071
        rect   = cc.rect(3590, 214, 184, 204),
        size   = cc.size(184, 204),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2072
        rect   = cc.rect(1556, 1277, 184, 208),
        size   = cc.size(184, 208),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2073
        rect   = cc.rect(1363, 1068, 186, 212),
        size   = cc.size(186, 212),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a2074
        rect   = cc.rect(1550, 1068, 184, 208),
        size   = cc.size(184, 208),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3001
        rect   = cc.rect(1558, 2260, 118, 208),
        size   = cc.size(118, 208),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3002
        rect   = cc.rect(2753, 1428, 116, 212),
        size   = cc.size(116, 212),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3003
        rect   = cc.rect(2912, 1637, 118, 208),
        size   = cc.size(118, 208),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3004
        rect   = cc.rect(2469, 1653, 120, 212),
        size   = cc.size(120, 212),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3006
        rect   = cc.rect(1409, 1932, 136, 196),
        size   = cc.size(136, 196),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3007
        rect   = cc.rect(3906, 1939, 144, 192),
        size   = cc.size(144, 192),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3008
        rect   = cc.rect(3760, 1225, 152, 198),
        size   = cc.size(152, 198),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3009
        rect   = cc.rect(2105, 1860, 148, 194),
        size   = cc.size(148, 194),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3010
        rect   = cc.rect(1828, 2274, 140, 198),
        size   = cc.size(140, 198),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3011
        rect   = cc.rect(2878, 1850, 140, 198),
        size   = cc.size(140, 198),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3012
        rect   = cc.rect(2614, 2073, 140, 198),
        size   = cc.size(140, 198),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3013
        rect   = cc.rect(3913, 1233, 142, 194),
        size   = cc.size(142, 194),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3014
        rect   = cc.rect(2578, 1, 196, 222),
        size   = cc.size(196, 222),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3015
        rect   = cc.rect(1, 1, 200, 226),
        size   = cc.size(200, 226),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3016
        rect   = cc.rect(2381, 1, 196, 222),
        size   = cc.size(196, 222),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3017
        rect   = cc.rect(2119, 1275, 122, 202),
        size   = cc.size(122, 202),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3018
        rect   = cc.rect(3775, 216, 186, 202),
        size   = cc.size(186, 202),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3019
        rect   = cc.rect(2755, 2051, 126, 204),
        size   = cc.size(126, 204),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3021
        rect   = cc.rect(1216, 1526, 160, 210),
        size   = cc.size(160, 210),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3022
        rect   = cc.rect(1045, 1540, 170, 196),
        size   = cc.size(170, 196),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3023
        rect   = cc.rect(2588, 1428, 164, 208),
        size   = cc.size(164, 208),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3025
        rect   = cc.rect(3170, 1416, 152, 202),
        size   = cc.size(152, 202),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3026
        rect   = cc.rect(1969, 2254, 120, 202),
        size   = cc.size(120, 202),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3027
        rect   = cc.rect(1377, 1492, 180, 198),
        size   = cc.size(180, 198),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3028
        rect   = cc.rect(600, 222, 226, 136),
        size   = cc.size(226, 136),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3030
        rect   = cc.rect(365, 1795, 138, 212),
        size   = cc.size(138, 212),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3031
        rect   = cc.rect(3413, 2056, 150, 194),
        size   = cc.size(150, 194),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3032
        rect   = cc.rect(3725, 1939, 180, 188),
        size   = cc.size(180, 188),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3033
        rect   = cc.rect(3001, 1416, 168, 202),
        size   = cc.size(168, 202),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3034
        rect   = cc.rect(2282, 1681, 186, 186),
        size   = cc.size(186, 186),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3035
        rect   = cc.rect(1735, 1068, 188, 208),
        size   = cc.size(188, 208),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3037
        rect   = cc.rect(3524, 624, 132, 214),
        size   = cc.size(132, 214),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3038
        rect   = cc.rect(2870, 1426, 130, 210),
        size   = cc.size(130, 210),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3039
        rect   = cc.rect(2117, 1068, 124, 206),
        size   = cc.size(124, 206),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3040
        rect   = cc.rect(3846, 811, 142, 212),
        size   = cc.size(142, 212),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3041
        rect   = cc.rect(3913, 1024, 142, 208),
        size   = cc.size(142, 208),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3042
        rect   = cc.rect(3277, 415, 138, 212),
        size   = cc.size(138, 212),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3044
        rect   = cc.rect(367, 2008, 138, 210),
        size   = cc.size(138, 210),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3045
        rect   = cc.rect(3564, 2134, 160, 194),
        size   = cc.size(160, 194),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3046
        rect   = cc.rect(3374, 1225, 194, 186),
        size   = cc.size(194, 186),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3047
        rect   = cc.rect(3743, 1633, 204, 156),
        size   = cc.size(204, 156),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3048
        rect   = cc.rect(598, 359, 216, 152),
        size   = cc.size(216, 152),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3049
        rect   = cc.rect(3323, 1412, 210, 160),
        size   = cc.size(210, 160),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3056
        rect   = cc.rect(2586, 1866, 132, 206),
        size   = cc.size(132, 206),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3057
        rect   = cc.rect(2882, 2049, 132, 204),
        size   = cc.size(132, 204),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3058
        rect   = cc.rect(3194, 1619, 132, 208),
        size   = cc.size(132, 208),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3059
        rect   = cc.rect(2090, 2254, 132, 202),
        size   = cc.size(132, 202),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3061
        rect   = cc.rect(3534, 1414, 208, 158),
        size   = cc.size(208, 158),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3062
        rect   = cc.rect(2117, 1480, 210, 164),
        size   = cc.size(210, 164),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3063
        rect   = cc.rect(3327, 1573, 206, 164),
        size   = cc.size(206, 164),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3064
        rect   = cc.rect(3534, 1573, 208, 160),
        size   = cc.size(208, 160),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3071
        rect   = cc.rect(3569, 1225, 190, 188),
        size   = cc.size(190, 188),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3072
        rect   = cc.rect(1924, 1480, 192, 190),
        size   = cc.size(192, 190),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3073
        rect   = cc.rect(689, 1724, 188, 192),
        size   = cc.size(188, 192),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a3074
        rect   = cc.rect(3374, 1032, 192, 192),
        size   = cc.size(192, 192),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4001
        rect   = cc.rect(1523, 644, 174, 220),
        size   = cc.size(174, 220),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4002
        rect   = cc.rect(1153, 654, 182, 220),
        size   = cc.size(182, 220),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4003
        rect   = cc.rect(1871, 644, 178, 218),
        size   = cc.size(178, 218),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4004
        rect   = cc.rect(1336, 644, 186, 220),
        size   = cc.size(186, 220),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4006
        rect   = cc.rect(878, 1728, 166, 200),
        size   = cc.size(166, 200),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4007
        rect   = cc.rect(1745, 1679, 180, 192),
        size   = cc.size(180, 192),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4008
        rect   = cc.rect(3190, 628, 188, 200),
        size   = cc.size(188, 200),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4009
        rect   = cc.rect(2984, 1026, 190, 200),
        size   = cc.size(190, 200),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4010
        rect   = cc.rect(3416, 421, 184, 202),
        size   = cc.size(184, 202),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4011
        rect   = cc.rect(1936, 1860, 168, 186),
        size   = cc.size(168, 186),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4012
        rect   = cc.rect(3725, 2128, 162, 192),
        size   = cc.size(162, 192),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4013
        rect   = cc.rect(3888, 2132, 158, 194),
        size   = cc.size(158, 194),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4014
        rect   = cc.rect(1, 1590, 186, 228),
        size   = cc.size(186, 228),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4015
        rect   = cc.rect(990, 658, 162, 226),
        size   = cc.size(162, 226),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4016
        rect   = cc.rect(1, 2044, 188, 224),
        size   = cc.size(188, 224),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4017
        rect   = cc.rect(3802, 610, 178, 200),
        size   = cc.size(178, 200),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4018
        rect   = cc.rect(1234, 1932, 174, 196),
        size   = cc.size(174, 196),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4019
        rect   = cc.rect(1067, 1928, 166, 204),
        size   = cc.size(166, 204),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4021
        rect   = cc.rect(2184, 1, 196, 222),
        size   = cc.size(196, 222),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4022
        rect   = cc.rect(1369, 1281, 186, 210),
        size   = cc.size(186, 210),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4023
        rect   = cc.rect(1987, 1, 196, 222),
        size   = cc.size(196, 222),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4025
        rect   = cc.rect(1029, 1104, 164, 218),
        size   = cc.size(164, 218),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4026
        rect   = cc.rect(3697, 817, 148, 214),
        size   = cc.size(148, 214),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4027
        rect   = cc.rect(2599, 2272, 174, 158),
        size   = cc.size(174, 158),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4028
        rect   = cc.rect(1546, 2010, 194, 118),
        size   = cc.size(194, 118),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4030
        rect   = cc.rect(958, 435, 184, 222),
        size   = cc.size(184, 222),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4031
        rect   = cc.rect(1411, 1691, 148, 210),
        size   = cc.size(148, 210),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4032
        rect   = cc.rect(2449, 1868, 136, 208),
        size   = cc.size(136, 208),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4033
        rect   = cc.rect(687, 1328, 196, 204),
        size   = cc.size(196, 204),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4034
        rect   = cc.rect(3566, 1734, 158, 200),
        size   = cc.size(158, 200),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4035
        rect   = cc.rect(500, 1328, 186, 212),
        size   = cc.size(186, 212),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4037
        rect   = cc.rect(1, 1819, 188, 224),
        size   = cc.size(188, 224),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4038
        rect   = cc.rect(325, 1134, 164, 220),
        size   = cc.size(164, 220),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4039
        rect   = cc.rect(1698, 642, 172, 216),
        size   = cc.size(172, 216),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4040
        rect   = cc.rect(190, 2036, 176, 218),
        size   = cc.size(176, 218),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4041
        rect   = cc.rect(1198, 1309, 170, 216),
        size   = cc.size(170, 216),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4042
        rect   = cc.rect(1194, 1092, 168, 216),
        size   = cc.size(168, 216),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4044
        rect   = cc.rect(1741, 1277, 182, 206),
        size   = cc.size(182, 206),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4045
        rect   = cc.rect(1743, 1484, 180, 194),
        size   = cc.size(180, 194),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4046
        rect   = cc.rect(878, 2110, 188, 162),
        size   = cc.size(188, 162),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4047
        rect   = cc.rect(3031, 1828, 196, 146),
        size   = cc.size(196, 146),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4048
        rect   = cc.rect(1258, 2129, 200, 136),
        size   = cc.size(200, 136),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4049
        rect   = cc.rect(2022, 2055, 186, 144),
        size   = cc.size(186, 144),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4056
        rect   = cc.rect(2117, 1645, 164, 208),
        size   = cc.size(164, 208),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4057
        rect   = cc.rect(3743, 1424, 162, 208),
        size   = cc.size(162, 208),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4058
        rect   = cc.rect(2590, 1637, 162, 210),
        size   = cc.size(162, 210),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4059
        rect   = cc.rect(3031, 1619, 162, 208),
        size   = cc.size(162, 208),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4061
        rect   = cc.rect(1644, 2129, 182, 128),
        size   = cc.size(182, 128),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4062
        rect   = cc.rect(1459, 2129, 184, 130),
        size   = cc.size(184, 130),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4063
        rect   = cc.rect(3518, 2329, 184, 128),
        size   = cc.size(184, 128),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4064
        rect   = cc.rect(1560, 1874, 184, 128),
        size   = cc.size(184, 128),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4071
        rect   = cc.rect(3339, 2274, 178, 164),
        size   = cc.size(178, 164),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4072
        rect   = cc.rect(2420, 2254, 178, 170),
        size   = cc.size(178, 170),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4073
        rect   = cc.rect(2774, 2256, 174, 172),
        size   = cc.size(174, 172),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a4074
        rect   = cc.rect(2223, 2182, 178, 170),
        size   = cc.size(178, 170),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5001
        rect   = cc.rect(1790, 1, 196, 222),
        size   = cc.size(196, 222),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5002
        rect   = cc.rect(1593, 1, 196, 222),
        size   = cc.size(196, 222),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5003
        rect   = cc.rect(1396, 1, 196, 222),
        size   = cc.size(196, 222),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5004
        rect   = cc.rect(1, 682, 198, 226),
        size   = cc.size(198, 226),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5006
        rect   = cc.rect(697, 926, 198, 198),
        size   = cc.size(198, 198),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5007
        rect   = cc.rect(689, 1533, 192, 190),
        size   = cc.size(192, 190),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5008
        rect   = cc.rect(506, 1917, 186, 192),
        size   = cc.size(186, 192),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5009
        rect   = cc.rect(1558, 1486, 184, 194),
        size   = cc.size(184, 194),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5010
        rect   = cc.rect(1924, 1068, 192, 206),
        size   = cc.size(192, 206),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5011
        rect   = cc.rect(2576, 224, 196, 206),
        size   = cc.size(196, 206),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5012
        rect   = cc.rect(594, 733, 196, 190),
        size   = cc.size(196, 190),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5013
        rect   = cc.rect(1924, 1275, 194, 204),
        size   = cc.size(194, 204),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5014
        rect   = cc.rect(192, 1136, 132, 224),
        size   = cc.size(132, 224),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5015
        rect   = cc.rect(2469, 1438, 118, 214),
        size   = cc.size(118, 214),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5016
        rect   = cc.rect(369, 1355, 130, 220),
        size   = cc.size(130, 220),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5017
        rect   = cc.rect(2593, 632, 196, 202),
        size   = cc.size(196, 202),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5018
        rect   = cc.rect(3190, 829, 188, 198),
        size   = cc.size(188, 198),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5019
        rect   = cc.rect(2584, 1227, 196, 200),
        size   = cc.size(196, 200),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5021
        rect   = cc.rect(192, 1361, 176, 224),
        size   = cc.size(176, 224),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5022
        rect   = cc.rect(594, 512, 186, 220),
        size   = cc.size(186, 220),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5023
        rect   = cc.rect(188, 1590, 174, 224),
        size   = cc.size(174, 224),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5025
        rect   = cc.rect(202, 1, 198, 228),
        size   = cc.size(198, 228),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5026
        rect   = cc.rect(1199, 1, 196, 222),
        size   = cc.size(196, 222),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5027
        rect   = cc.rect(1067, 2133, 190, 138),
        size   = cc.size(190, 138),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5028
        rect   = cc.rect(3327, 1738, 198, 116),
        size   = cc.size(198, 116),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5030
        rect   = cc.rect(1, 909, 194, 226),
        size   = cc.size(194, 226),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5031
        rect   = cc.rect(1, 1363, 190, 226),
        size   = cc.size(190, 226),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5032
        rect   = cc.rect(196, 909, 166, 224),
        size   = cc.size(166, 224),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5033
        rect   = cc.rect(3100, 415, 176, 208),
        size   = cc.size(176, 208),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5034
        rect   = cc.rect(1677, 2258, 150, 206),
        size   = cc.size(150, 206),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5035
        rect   = cc.rect(363, 1586, 136, 208),
        size   = cc.size(136, 208),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5037
        rect   = cc.rect(1, 1136, 190, 226),
        size   = cc.size(190, 226),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5038
        rect   = cc.rect(1000, 1, 198, 222),
        size   = cc.size(198, 222),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5039
        rect   = cc.rect(801, 1, 198, 220),
        size   = cc.size(198, 220),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5040
        rect   = cc.rect(401, 1, 198, 226),
        size   = cc.size(198, 226),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5041
        rect   = cc.rect(200, 682, 198, 222),
        size   = cc.size(198, 222),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5042
        rect   = cc.rect(202, 459, 198, 222),
        size   = cc.size(198, 222),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5044
        rect   = cc.rect(1788, 224, 194, 212),
        size   = cc.size(194, 212),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5045
        rect   = cc.rect(3079, 218, 196, 196),
        size   = cc.size(196, 196),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5046
        rect   = cc.rect(2254, 1868, 194, 164),
        size   = cc.size(194, 164),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5047
        rect   = cc.rect(2254, 2033, 194, 148),
        size   = cc.size(194, 148),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5048
        rect   = cc.rect(3228, 1855, 196, 154),
        size   = cc.size(196, 154),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5049
        rect   = cc.rect(3015, 2096, 192, 158),
        size   = cc.size(192, 158),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5056
        rect   = cc.rect(689, 1125, 198, 202),
        size   = cc.size(198, 202),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5057
        rect   = cc.rect(490, 1125, 198, 202),
        size   = cc.size(198, 202),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5058
        rect   = cc.rect(2049, 867, 198, 200),
        size   = cc.size(198, 200),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5059
        rect   = cc.rect(498, 924, 198, 200),
        size   = cc.size(198, 200),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5061
        rect   = cc.rect(3019, 1975, 196, 120),
        size   = cc.size(196, 120),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5062
        rect   = cc.rect(3725, 1790, 196, 148),
        size   = cc.size(196, 148),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5063
        rect   = cc.rect(2223, 2353, 196, 118),
        size   = cc.size(196, 118),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5064
        rect   = cc.rect(3216, 2010, 196, 118),
        size   = cc.size(196, 118),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5071
        rect   = cc.rect(3208, 2129, 194, 144),
        size   = cc.size(194, 144),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5072
        rect   = cc.rect(3144, 2274, 194, 150),
        size   = cc.size(194, 150),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5073
        rect   = cc.rect(2949, 2255, 194, 154),
        size   = cc.size(194, 154),
        rotate = false,
        offset = cc.p(0, 0)
    },
    {   -- a5074
        rect   = cc.rect(1827, 2047, 194, 152),
        size   = cc.size(194, 152),
        rotate = false,
        offset = cc.p(0, 0)
    },
}

SheetInfo.frameIndex = { 
    ["a1001.png"] = 1, 
    ["a1002.png"] = 2, 
    ["a1003.png"] = 3, 
    ["a1004.png"] = 4, 
    ["a1006.png"] = 5, 
    ["a1007.png"] = 6, 
    ["a1008.png"] = 7, 
    ["a1009.png"] = 8, 
    ["a1010.png"] = 9, 
    ["a1011.png"] = 10, 
    ["a1012.png"] = 11, 
    ["a1013.png"] = 12, 
    ["a1014.png"] = 13, 
    ["a1015.png"] = 14, 
    ["a1016.png"] = 15, 
    ["a1017.png"] = 16, 
    ["a1018.png"] = 17, 
    ["a1019.png"] = 18, 
    ["a1021.png"] = 19, 
    ["a1022.png"] = 20, 
    ["a1023.png"] = 21, 
    ["a1025.png"] = 22, 
    ["a1026.png"] = 23, 
    ["a1027.png"] = 24, 
    ["a1028.png"] = 25, 
    ["a1030.png"] = 26, 
    ["a1031.png"] = 27, 
    ["a1032.png"] = 28, 
    ["a1033.png"] = 29, 
    ["a1034.png"] = 30, 
    ["a1035.png"] = 31, 
    ["a1037.png"] = 32, 
    ["a1038.png"] = 33, 
    ["a1039.png"] = 34, 
    ["a1040.png"] = 35, 
    ["a1041.png"] = 36, 
    ["a1042.png"] = 37, 
    ["a1044.png"] = 38, 
    ["a1045.png"] = 39, 
    ["a1046.png"] = 40, 
    ["a1047.png"] = 41, 
    ["a1048.png"] = 42, 
    ["a1049.png"] = 43, 
    ["a1056.png"] = 44, 
    ["a1057.png"] = 45, 
    ["a1058.png"] = 46, 
    ["a1059.png"] = 47, 
    ["a1061.png"] = 48, 
    ["a1062.png"] = 49, 
    ["a1063.png"] = 50, 
    ["a1064.png"] = 51, 
    ["a1071.png"] = 52, 
    ["a1072.png"] = 53, 
    ["a1073.png"] = 54, 
    ["a1074.png"] = 55, 
    ["a2001.png"] = 56, 
    ["a2002.png"] = 57, 
    ["a2003.png"] = 58, 
    ["a2004.png"] = 59, 
    ["a2006.png"] = 60, 
    ["a2007.png"] = 61, 
    ["a2008.png"] = 62, 
    ["a2009.png"] = 63, 
    ["a2010.png"] = 64, 
    ["a2011.png"] = 65, 
    ["a2012.png"] = 66, 
    ["a2013.png"] = 67, 
    ["a2014.png"] = 68, 
    ["a2015.png"] = 69, 
    ["a2016.png"] = 70, 
    ["a2017.png"] = 71, 
    ["a2018.png"] = 72, 
    ["a2019.png"] = 73, 
    ["a2021.png"] = 74, 
    ["a2022.png"] = 75, 
    ["a2023.png"] = 76, 
    ["a2025.png"] = 77, 
    ["a2026.png"] = 78, 
    ["a2027.png"] = 79, 
    ["a2028.png"] = 80, 
    ["a2030.png"] = 81, 
    ["a2031.png"] = 82, 
    ["a2032.png"] = 83, 
    ["a2033.png"] = 84, 
    ["a2034.png"] = 85, 
    ["a2035.png"] = 86, 
    ["a2037.png"] = 87, 
    ["a2038.png"] = 88, 
    ["a2039.png"] = 89, 
    ["a2040.png"] = 90, 
    ["a2041.png"] = 91, 
    ["a2042.png"] = 92, 
    ["a2044.png"] = 93, 
    ["a2045.png"] = 94, 
    ["a2046.png"] = 95, 
    ["a2047.png"] = 96, 
    ["a2048.png"] = 97, 
    ["a2049.png"] = 98, 
    ["a2056.png"] = 99, 
    ["a2057.png"] = 100, 
    ["a2058.png"] = 101, 
    ["a2059.png"] = 102, 
    ["a2061.png"] = 103, 
    ["a2062.png"] = 104, 
    ["a2063.png"] = 105, 
    ["a2064.png"] = 106, 
    ["a2071.png"] = 107, 
    ["a2072.png"] = 108, 
    ["a2073.png"] = 109, 
    ["a2074.png"] = 110, 
    ["a3001.png"] = 111, 
    ["a3002.png"] = 112, 
    ["a3003.png"] = 113, 
    ["a3004.png"] = 114, 
    ["a3006.png"] = 115, 
    ["a3007.png"] = 116, 
    ["a3008.png"] = 117, 
    ["a3009.png"] = 118, 
    ["a3010.png"] = 119, 
    ["a3011.png"] = 120, 
    ["a3012.png"] = 121, 
    ["a3013.png"] = 122, 
    ["a3014.png"] = 123, 
    ["a3015.png"] = 124, 
    ["a3016.png"] = 125, 
    ["a3017.png"] = 126, 
    ["a3018.png"] = 127, 
    ["a3019.png"] = 128, 
    ["a3021.png"] = 129, 
    ["a3022.png"] = 130, 
    ["a3023.png"] = 131, 
    ["a3025.png"] = 132, 
    ["a3026.png"] = 133, 
    ["a3027.png"] = 134, 
    ["a3028.png"] = 135, 
    ["a3030.png"] = 136, 
    ["a3031.png"] = 137, 
    ["a3032.png"] = 138, 
    ["a3033.png"] = 139, 
    ["a3034.png"] = 140, 
    ["a3035.png"] = 141, 
    ["a3037.png"] = 142, 
    ["a3038.png"] = 143, 
    ["a3039.png"] = 144, 
    ["a3040.png"] = 145, 
    ["a3041.png"] = 146, 
    ["a3042.png"] = 147, 
    ["a3044.png"] = 148, 
    ["a3045.png"] = 149, 
    ["a3046.png"] = 150, 
    ["a3047.png"] = 151, 
    ["a3048.png"] = 152, 
    ["a3049.png"] = 153, 
    ["a3056.png"] = 154, 
    ["a3057.png"] = 155, 
    ["a3058.png"] = 156, 
    ["a3059.png"] = 157, 
    ["a3061.png"] = 158, 
    ["a3062.png"] = 159, 
    ["a3063.png"] = 160, 
    ["a3064.png"] = 161, 
    ["a3071.png"] = 162, 
    ["a3072.png"] = 163, 
    ["a3073.png"] = 164, 
    ["a3074.png"] = 165, 
    ["a4001.png"] = 166, 
    ["a4002.png"] = 167, 
    ["a4003.png"] = 168, 
    ["a4004.png"] = 169, 
    ["a4006.png"] = 170, 
    ["a4007.png"] = 171, 
    ["a4008.png"] = 172, 
    ["a4009.png"] = 173, 
    ["a4010.png"] = 174, 
    ["a4011.png"] = 175, 
    ["a4012.png"] = 176, 
    ["a4013.png"] = 177, 
    ["a4014.png"] = 178, 
    ["a4015.png"] = 179, 
    ["a4016.png"] = 180, 
    ["a4017.png"] = 181, 
    ["a4018.png"] = 182, 
    ["a4019.png"] = 183, 
    ["a4021.png"] = 184, 
    ["a4022.png"] = 185, 
    ["a4023.png"] = 186, 
    ["a4025.png"] = 187, 
    ["a4026.png"] = 188, 
    ["a4027.png"] = 189, 
    ["a4028.png"] = 190, 
    ["a4030.png"] = 191, 
    ["a4031.png"] = 192, 
    ["a4032.png"] = 193, 
    ["a4033.png"] = 194, 
    ["a4034.png"] = 195, 
    ["a4035.png"] = 196, 
    ["a4037.png"] = 197, 
    ["a4038.png"] = 198, 
    ["a4039.png"] = 199, 
    ["a4040.png"] = 200, 
    ["a4041.png"] = 201, 
    ["a4042.png"] = 202, 
    ["a4044.png"] = 203, 
    ["a4045.png"] = 204, 
    ["a4046.png"] = 205, 
    ["a4047.png"] = 206, 
    ["a4048.png"] = 207, 
    ["a4049.png"] = 208, 
    ["a4056.png"] = 209, 
    ["a4057.png"] = 210, 
    ["a4058.png"] = 211, 
    ["a4059.png"] = 212, 
    ["a4061.png"] = 213, 
    ["a4062.png"] = 214, 
    ["a4063.png"] = 215, 
    ["a4064.png"] = 216, 
    ["a4071.png"] = 217, 
    ["a4072.png"] = 218, 
    ["a4073.png"] = 219, 
    ["a4074.png"] = 220, 
    ["a5001.png"] = 221, 
    ["a5002.png"] = 222, 
    ["a5003.png"] = 223, 
    ["a5004.png"] = 224, 
    ["a5006.png"] = 225, 
    ["a5007.png"] = 226, 
    ["a5008.png"] = 227, 
    ["a5009.png"] = 228, 
    ["a5010.png"] = 229, 
    ["a5011.png"] = 230, 
    ["a5012.png"] = 231, 
    ["a5013.png"] = 232, 
    ["a5014.png"] = 233, 
    ["a5015.png"] = 234, 
    ["a5016.png"] = 235, 
    ["a5017.png"] = 236, 
    ["a5018.png"] = 237, 
    ["a5019.png"] = 238, 
    ["a5021.png"] = 239, 
    ["a5022.png"] = 240, 
    ["a5023.png"] = 241, 
    ["a5025.png"] = 242, 
    ["a5026.png"] = 243, 
    ["a5027.png"] = 244, 
    ["a5028.png"] = 245, 
    ["a5030.png"] = 246, 
    ["a5031.png"] = 247, 
    ["a5032.png"] = 248, 
    ["a5033.png"] = 249, 
    ["a5034.png"] = 250, 
    ["a5035.png"] = 251, 
    ["a5037.png"] = 252, 
    ["a5038.png"] = 253, 
    ["a5039.png"] = 254, 
    ["a5040.png"] = 255, 
    ["a5041.png"] = 256, 
    ["a5042.png"] = 257, 
    ["a5044.png"] = 258, 
    ["a5045.png"] = 259, 
    ["a5046.png"] = 260, 
    ["a5047.png"] = 261, 
    ["a5048.png"] = 262, 
    ["a5049.png"] = 263, 
    ["a5056.png"] = 264, 
    ["a5057.png"] = 265, 
    ["a5058.png"] = 266, 
    ["a5059.png"] = 267, 
    ["a5061.png"] = 268, 
    ["a5062.png"] = 269, 
    ["a5063.png"] = 270, 
    ["a5064.png"] = 271, 
    ["a5071.png"] = 272, 
    ["a5072.png"] = 273, 
    ["a5073.png"] = 274, 
    ["a5074.png"] = 275,
}

return SheetInfo
