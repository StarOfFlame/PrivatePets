//
//  UpdateConfig.h
//  PetsPlan
//
//  Created by Reyn on 2018/3/25.
//

#ifndef UpdateConfig_h
#define UpdateConfig_h

#include "cocos2d.h"
using namespace cocos2d;

#define PRIJECT_NAME            ("PrivatePets")
#define UPDATE_ABBR             ("update/")
#define WRITABLE_PATH           FileUtils::getInstance()->getWritablePath()
#define UPDATE_FULL_PATH        (WRITABLE_PATH + UPDATE_ABBR)
#define RES_CONFIG_ZIP_PATH     ("resConfig.zip")
#define RES_CONFIG_JSON_PATH    ("resConfig.json")
#define REAL_UPDATE_URL         ("http://127.0.0.1/~reyn/PrivatePets/")

#define UPDATE_SRC_CODE     2001
#define UPDATE_RES_CODE     2101
#define REQ_SUCCESS_CODE    1000


#endif /* UpdateConfig_h */
