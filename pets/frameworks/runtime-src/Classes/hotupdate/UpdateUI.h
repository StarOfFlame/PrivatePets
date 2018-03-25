//
//  UpdateUI.hpp
//  PetsPlan
//
//  Created by Reyn on 2018/3/25.
//

#ifndef UpdateUI_hpp
#define UpdateUI_hpp

#include "cocos2d.h"
#include "ui/CocosGUI.h"
#include "cocostudio/CocoStudio.h"
#include "json/document.h"
using namespace cocos2d;
using namespace cocos2d::ui;

class UpdateUI : public Layer
{
public:
    CREATE_FUNC(UpdateUI)
    UpdateUI();
    ~UpdateUI();
    
    bool init();
    
    void onRetryBtnClicked(Ref *sender, Widget::TouchEventType e);
    void onDownloadBtnClicked(Ref *sender, Widget::TouchEventType e);
    void onExitGameBtnClicked(Ref *sender, Widget::TouchEventType e);
    
private:
    void onExit();
    void initUI();              //初始化UI界面
    void checkUpdate();         //检查更新
    void downloadRes();         //下载资源
    void downloadSrc();         //下载源码
    void runLuaScripts();       //跑LUA脚本
    void delayRunLuaScripts();  //延迟跑LUA脚本
    
private:
    Node        *_updateWidget  = nullptr;
    Layout      *_updatePanel   = nullptr;
    Layout      *_checkPanel    = nullptr;
    Text        *_checkText     = nullptr;
    LoadingBar  *_checkBar      = nullptr;
    Text        *_updateText    = nullptr;
    LoadingBar  *_updateBar     = nullptr;
    Node        *_dialogWidget  = nullptr;
    Text        *_dialogText    = nullptr;
    Button      *_confirmBtn    = nullptr;
    
    rapidjson::Document _updateTextJson;
    ValueVector         _needUpdateFiles;
    
    unsigned long _downloadAllSize; //全部下载的大小
    unsigned long _downloadCurSize; //当前下载的大小
};

#endif /* UpdateUI_hpp */
