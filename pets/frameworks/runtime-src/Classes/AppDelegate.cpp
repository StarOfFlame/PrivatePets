#include "AppDelegate.h"
#include "scripting/lua-bindings/manual/CCLuaEngine.h"
#include "cocos2d.h"
#include "scripting/lua-bindings/manual/lua_module_register.h"
#include "thirds/Thirds.h"
#include "hotupdate/UpdateConfig.h"
#include "hotupdate/UpdateUI.h"

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
    
    Thirds::lfs::register_lfs_lua(L);
    Thirds::Protobuf::register_protobuf_lua(L);
    Thirds::Serialize::register_seiralize_lua(L);
    
    LuaStack* stack = engine->getLuaStack();
    const char* key_str  = Thirds::XXTEA::getKey();
    const char* sign_str = Thirds::XXTEA::getSign();
    auto key_len  = (int)strlen(key_str);
    auto sign_len = (int)strlen(sign_str);
    stack->setXXTEAKeyAndSign(key_str, key_len, sign_str, sign_len);
    
    register_all_packages();
    
    //register custom function
    Thirds::TimeUtils::register_getelapsetime_lua(L);
    Thirds::TimeUtils::register_getcurrentusec_lua(L);
}

// register search paths
static void registerSearchPaths()
{
    FileUtils::getInstance()->addSearchPath(UPDATE_FULL_PATH + "src", true);
    FileUtils::getInstance()->addSearchPath(UPDATE_FULL_PATH + "res", true);
#if CC_64BITS
    FileUtils::getInstance()->addSearchPath("src/64bit");
#endif
    FileUtils::getInstance()->addSearchPath("src");
    FileUtils::getInstance()->addSearchPath("res");
}

// run update scene
void AppDelegate::startGameApp()
{
    Scene *scene = Scene::create();
    Director::getInstance()->runWithScene(scene);
    UpdateUI* layer = UpdateUI::create();
    scene->addChild(layer);
}

// This function will be called when the app finishing launching.
bool AppDelegate::applicationDidFinishLaunching()
{
    Director::getInstance()->setAnimationInterval(1.0 / 60.0f);
    registerSearchPaths();
    registerLuaData();
    startGameApp();
    
    return true;
}

// This function will be called when the app is inactive. Note, when receiving a phone call it is invoked.
void AppDelegate::applicationDidEnterBackground()
{
    Thirds::TimeUtils::setTimeWhenEnterBackGround();
    
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
    Thirds::TimeUtils::setTimeWhenBackToForeGround();

    Director::getInstance()->getEventDispatcher()->dispatchCustomEvent("ApplicationWillEnterForeground");
    Director::getInstance()->startAnimation();

#if USE_AUDIO_ENGINE
    AudioEngine::resumeAll();
#elif USE_SIMPLE_AUDIO_ENGINE
    SimpleAudioEngine::getInstance()->resumeBackgroundMusic();
    SimpleAudioEngine::getInstance()->resumeAllEffects();
#endif
}

