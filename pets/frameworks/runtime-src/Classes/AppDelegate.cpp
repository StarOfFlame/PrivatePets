#include "AppDelegate.h"
#include "scripting/lua-bindings/manual/CCLuaEngine.h"
#include "cocos2d.h"
#include "scripting/lua-bindings/manual/lua_module_register.h"
#include <sys/time.h>

// #define USE_AUDIO_ENGINE 1
// #define USE_SIMPLE_AUDIO_ENGINE 1

#if USE_AUDIO_ENGINE && USE_SIMPLE_AUDIO_ENGINE
#error "Don't use AudioEngine and SimpleAudioEngine at the same time. Please just select one in your game!"
#endif

#if USE_AUDIO_ENGINE
#include "audio/include/AudioEngine.h"
using namespace cocos2d::experimental;
#elif USE_SIMPLE_AUDIO_ENGINE
#include "audio/include/SimpleAudioEngine.h"
using namespace CocosDenshion;
#endif

USING_NS_CC;
using namespace std;

struct KEY_SIGN {
    const char* KEY   = "jl88744653";
    const char* SIGN  = "HJN.Reyn.JL";
};

static struct timeval timeInBackGround;
static struct timeval timeToForeGorund;

int GetCurrentUsec(lua_State* l)
{
    struct timeval t_val;
    gettimeofday(&t_val, NULL);
    double current = t_val.tv_sec + (1.0 * t_val.tv_usec)/1000000;
    lua_pushnumber(l, current);
    return 1;
}

int GetElapseTime(lua_State* l)
{
    struct timeval t_elapse;
    timersub(&timeToForeGorund, &timeInBackGround, &t_elapse);
    double elapse = t_elapse.tv_sec + (1.0 * t_elapse.tv_usec)/1000000;
    lua_pushnumber(l, elapse);
    return 1;
}

AppDelegate::AppDelegate()
{
}

AppDelegate::~AppDelegate()
{
    Director::getInstance()->getEventDispatcher()->dispatchCustomEvent("ApplicationWillDestroy");
#if USE_AUDIO_ENGINE
    AudioEngine::end();
#elif USE_SIMPLE_AUDIO_ENGINE
    SimpleAudioEngine::end();
#endif

#if (COCOS2D_DEBUG > 0) && (CC_CODE_IDE_DEBUG_SUPPORT > 0)
    // NOTE:Please don't remove this call if you want to debug with Cocos Code IDE
    RuntimeEngine::getInstance()->end();
#endif

}

// if you want a different context, modify the value of glContextAttrs
// it will affect all platforms
void AppDelegate::initGLContextAttrs()
{
    // set OpenGL context attributes: red,green,blue,alpha,depth,stencil
    GLContextAttrs glContextAttrs = {8, 8, 8, 8, 24, 8};

    GLView::setGLContextAttrs(glContextAttrs);
}

// if you want to use the package manager to install more packages, 
// don't modify or remove this function
static int register_all_packages()
{
    return 0; //flag for packages manager
}

// register lua module
static void registerLuaData()
{
    auto engine = LuaEngine::getInstance();
    ScriptEngineManager::getInstance()->setScriptEngine(engine);
    lua_State* L = engine->getLuaStack()->getLuaState();
    lua_module_register(L);
    
    LuaStack* stack = engine->getLuaStack();
    KEY_SIGN key_sign;
    int key_len  = (int)strlen(key_sign.KEY);
    int sign_len = (int)strlen(key_sign.KEY);
    stack->setXXTEAKeyAndSign(key_sign.KEY, key_len, key_sign.SIGN, sign_len);
    
    register_all_packages();
    
    //register custom function
    //LuaStack* stack = engine->getLuaStack();
    //register_custom_function(stack->getLuaState());
    lua_register(L, "GetElapseTime", GetElapseTime);
    lua_register(L, "GetCurrentUsec", GetCurrentUsec);
}

bool AppDelegate::applicationDidFinishLaunching()
{
    // set default FPS
    Director::getInstance()->setAnimationInterval(1.0 / 60.0f);

    registerLuaData();
    
#if CC_64BITS
    FileUtils::getInstance()->addSearchPath("src/64bit");
#endif
    FileUtils::getInstance()->addSearchPath("src");
    FileUtils::getInstance()->addSearchPath("res");
    auto engine = LuaEngine::getInstance();
    if (engine->executeScriptFile("entry.lua"))
    {
        return false;
    }

    return true;
}

// This function will be called when the app is inactive. Note, when receiving a phone call it is invoked.
void AppDelegate::applicationDidEnterBackground()
{
    gettimeofday(&timeInBackGround, NULL);
    
    Director::getInstance()->getEventDispatcher()->dispatchCustomEvent("ApplicationDidEnterBackground");
    Director::getInstance()->stopAnimation();

#if USE_AUDIO_ENGINE
    AudioEngine::pauseAll();
#elif USE_SIMPLE_AUDIO_ENGINE
    SimpleAudioEngine::getInstance()->pauseBackgroundMusic();
    SimpleAudioEngine::getInstance()->pauseAllEffects();
#endif
}

// this function will be called when the app is active again
void AppDelegate::applicationWillEnterForeground()
{
    gettimeofday(&timeToForeGorund, NULL);

    Director::getInstance()->getEventDispatcher()->dispatchCustomEvent("ApplicationWillEnterForeground");
    Director::getInstance()->startAnimation();

#if USE_AUDIO_ENGINE
    AudioEngine::resumeAll();
#elif USE_SIMPLE_AUDIO_ENGINE
    SimpleAudioEngine::getInstance()->resumeBackgroundMusic();
    SimpleAudioEngine::getInstance()->resumeAllEffects();
#endif
}

