#include "thirds/Thirds.h"
#include "thirds/pbc/pbc-lua.h"
#include <sys/time.h>

namespace Thirds {

    void init_pbc_lua(lua_State* l) {
        luaopen_protobuf_c(l);
    }
    
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
