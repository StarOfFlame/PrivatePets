#ifndef __THIRDS_H__
#define __THIRDS_H__

#include "scripting/lua-bindings/manual/CCLuaEngine.h"

namespace Thirds {
    namespace Protobuf {
        void register_protobuf_lua(lua_State* L);
    }
    

    namespace Serialize {
        void register_seiralize_lua(lua_State* l);
    }
    
    namespace lfs {
        void register_lfs_lua(lua_State* l);
    }
    
    namespace TimeUtils {
        int getElapseTime(lua_State* l);
        int getCurrentUsec(lua_State* l);
        void setTimeWhenEnterBackGround();
        void setTimeWhenBackToForeGround();
        void register_getelapsetime_lua(lua_State* L);
        void register_getcurrentusec_lua(lua_State* L);
    }
    
    namespace XXTEA {
        const char* getKey();
        const char* getSign();
    }
    
    namespace NetStatus {
        void register_islocalwifiavalable_lua(lua_State* L);
        void register_isinternetavalable_lua(lua_State* L);
    }
}

#endif //__THIRDS_H__
