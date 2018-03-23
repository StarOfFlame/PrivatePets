#ifndef __THIRDS_H__
#define __THIRDS_H__

#include "scripting/lua-bindings/manual/CCLuaEngine.h"

namespace Thirds {
    void init_pbc_lua(lua_State* L);
    
    namespace TimeUtils {
        int getElapseTime(lua_State* l);
        int getCurrentUsec(lua_State* l);
        void setTimeWhenEnterBackGround();
        void setTimeWhenBackToForeGround();
        void register_getelapsetime_lua(lua_State* L);
        void register_getcurrentusec_lua(lua_State* L);
    }
}

#endif //__THIRDS_H__
