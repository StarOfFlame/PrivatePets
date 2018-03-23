#include "thirds/Thirds.h"
#include "thirds/pbc/pbc-lua.h"
#include "thirds/lfs/lfs.h"
#include <sys/time.h>

namespace Thirds {
    // proto buffer
    namespace Protobuf {
        void register_protobuf_lua(lua_State* l) {
            luaopen_protobuf_c(l);
        }
    }
    
    // lfs for Lua
    namespace lfs {
        void register_lfs_lua(lua_State* l) {
            luaopen_lfs(l);
        }
    }
    
    // xxtea加密key和sign
    namespace XXTEA {
        const char* KEY   = "jl88744653";
        const char* SIGN  = "HJN.Reyn.JL";
        
        const char* getKey() {
            return KEY;
        }
        const char* getSign() {
            return SIGN;
        }
    }
    
    // 时间工具
    namespace TimeUtils {
        static struct timeval timeInBackGround;
        static struct timeval timeToForeGorund;
        
        void setTimeWhenEnterBackGround() {
            gettimeofday(&timeInBackGround, NULL);
        }
        
        void setTimeWhenBackToForeGround() {
            gettimeofday(&timeToForeGorund, NULL);
        }
        
        int getCurrentUsec(lua_State* l)
        {
            struct timeval t_val;
            gettimeofday(&t_val, NULL);
            double current = t_val.tv_sec + (1.0 * t_val.tv_usec)/1000000;
            lua_pushnumber(l, current);
            return 1;
        }
        
        int getElapseTime(lua_State* l)
        {
            struct timeval t_elapse;
            timersub(&timeToForeGorund, &timeInBackGround, &t_elapse);
            double elapse = t_elapse.tv_sec + (1.0 * t_elapse.tv_usec)/1000000;
            lua_pushnumber(l, elapse);
            return 1;
        }
        
        void register_getelapsetime_lua(lua_State* L) {
            lua_register(L, "GetElapseTime", getElapseTime);
        }
        
        void register_getcurrentusec_lua(lua_State* L) {
            lua_register(L, "GetCurrentUsec", getCurrentUsec);
        }
    }

    
}
