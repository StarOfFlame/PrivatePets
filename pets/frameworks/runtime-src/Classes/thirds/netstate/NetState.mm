//
//  NetState.m
//  PetsPlan
//
//  Created by Reyn on 2018/4/10.
//

#include "NetState.h"

#if CC_TARGET_PLATFORM == CC_PLATFORM_IOS || CC_TARGET_PLATFORM == CC_PLATFORM_MAC
#include "GCNetworkReachability.h"
#include <iostream>

bool NetState::isLocalWifiAvailable()
{
//    std::cout << "   WIFI : " << [[GCNetworkReachability reachabilityForLocalWiFi] currentReachabilityStatus] << std::endl;
    return [[GCNetworkReachability reachabilityForLocalWiFi] currentReachabilityStatus] != GCNetworkReachabilityStatusNotReachable;
}

bool NetState::isInternetAvailable()
{
//    std::cout << "   WWAN : " << [[GCNetworkReachability reachabilityForInternetConnection] currentReachabilityStatus] << std::endl;
    return [[GCNetworkReachability reachabilityForInternetConnection] currentReachabilityStatus] != GCNetworkReachabilityStatusNotReachable;
}

#endif
