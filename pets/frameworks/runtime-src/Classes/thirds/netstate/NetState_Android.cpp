//
//  NetState_Android.cpp
//  PetsPlan
//
//  Created by Reyn on 2018/4/11.
//

#if (CC_TARGET_PLATFORM == CC_PLATFORM_ANDROID)
#include "NetState_Android.h"
#include <string>
#include <cocos2d.h>
#include "platform/android/jni/JniHelper.h"

USING_NS_CC;

static std::string HELPER_CLASS_NAME = "org/cocos2dx/lua/DeviceHelper";

extern "C"
{
    bool isLocalWifiAvailable_android()
    {
        JniMethodInfo t;
        int result = 0;
        if (JniHelper::getStaticMethodInfo(t, HELPER_CLASS_NAME.c_str(), "isLocalWifiAvailable", "()Z"))
        {
            int jb_ret = t.env->CallStaticBooleanMethod(t.classID, t.methodID);
            t.env->DeleteLocalRef(t.classID);
            result = jb_ret ;
        }
        return result;
    }
    
    bool isInternetAvailable_android()
    {
        JniMethodInfo t;
        int result = 0;
        if (JniHelper::getStaticMethodInfo(t, HELPER_CLASS_NAME.c_str(), "isInternetAvailable", "()Z"))
        {
            int jb_ret = t.env->CallStaticBooleanMethod(t.classID, t.methodID);
            t.env->DeleteLocalRef(t.classID);
            result = jb_ret ;
        }
        return result;
    }
}
#endif
