//
//  NetState.cpp
//  PetsPlan
//
//  Created by Reyn on 2018/4/10.
//

#include "NetState.h"

#if CC_TARGET_PLATFORM == CC_PLATFORM_ANDROID
#include "NetState_Android.h"
#endif

bool NetState::isLocalWifiAvailable()
{
#if CC_TARGET_PLATFORM == CC_PLATFORM_ANDROID
    return isLocalWifiAvailable_android();
#endif
    return true;
}

bool NetState::isInternetAvailable()
{
#if CC_TARGET_PLATFORM == CC_PLATFORM_ANDROID
    return isInternetAvailable_android();
#endif
    return true;
}

