//
//  UpdateUI.cpp
//  PetsPlan
//
//  Created by Reyn on 2018/3/25.
//

#include "UpdateUI.h"
#include "scripting/lua-bindings/manual/CCLuaEngine.h"

namespace CONST {
    const char* UPDATE_PLIST      = "plist/UpdateUI.plist";
    const char* UPDATE_LAYER_CSB  = "csb/UpdateLayer.csb";
    const char* UPDATE_DIALOG_CSB = "csb/UpdateDialogLayer.csb";
    const char* GAME_FONT_NAME    = "fonts/gamefont.ttf";
};

namespace TEXT {
    std::string CHECK_UPDATE        = "正在为您检查更新 ";
    std::string UPDATE              = "更新";
    std::string NET_ERROR           = "网络不太给力哦~ (′⌒`)";
    std::string EMPTY_FILE_ERROR    = "下载的文件为空 (′⌒`)";
    std::string OPEN_FILE_ERROR     = "打开文件失败 (′⌒`)";
    std::string RENAME_FILE_ERROR   = "重命名文件失败 (′⌒`)";
    std::string DOWNLOAD_DIR_ERROR  = "下载目录失败 (′⌒`)";
    std::string SERVER_DATA_ERROR   = "校验服务端数据失败 (′⌒`)";
    std::string FILE_MD5_ERROR      = "校验文件MD5失败 (′⌒`)";
    std::string DECOMPRESS_ERROR    = "解压文件失败 (′⌒`)";
    std::string CONFIG_NOT_FOUND    = "未找到配置文件 (′⌒`)";
    std::string CONFIG_READ_ERROR   = "读取配置文件失败 (′⌒`)";
    std::string CONFIRM             = "确定";
};


UpdateUI::UpdateUI()
{
    
}

UpdateUI::~UpdateUI()
{
//    SpriteFrameCache::getInstance()->removeSpriteFramesFromFile(CONST::UPDATE_PLIST);
}

bool UpdateUI::init()
{
    if(!Layer::init()){
        return false;
    }
    
    _downloadAllSize = 0;
    _downloadCurSize = 0;
    
//    this->initUI();
    this->delayRunLuaScripts();
    
    return true;
}

void UpdateUI::delayRunLuaScripts()
{
    auto delay  = DelayTime::create(0.01f);
    auto action = Sequence::create(delay, CallFunc::create([&](){
        this->runLuaScripts();
    }), nullptr);
    runAction(action);
}

void UpdateUI::runLuaScripts()
{
    CCLOG("runLuaScripts");
    FileUtils::getInstance()->purgeCachedEntries();
    auto engine = LuaEngine::getInstance();
    engine->executeScriptFile("entry.lua");
}

void UpdateUI::initUI()
{
    //更新界面
    _updateWidget = CSLoader::createNode(CONST::UPDATE_LAYER_CSB);
    _updateWidget->setContentSize(Director::getInstance()->getWinSize());
    Helper::doLayout(_updateWidget);
    this->addChild(_updateWidget);
    
    Layout *midPanel = dynamic_cast<Layout*>(utils::findChild(_updateWidget, "midPanel"));
    _checkPanel      = dynamic_cast<Layout*>(utils::findChild(midPanel, "checkPanel"));
    _updatePanel     = dynamic_cast<Layout*>(utils::findChild(midPanel, "updatePanel"));
    _checkText       = dynamic_cast<Text*>(utils::findChild(_checkPanel, "checkText"));
    _checkBar        = dynamic_cast<LoadingBar *>(utils::findChild(_checkPanel, "bar"));
    _updateText      = dynamic_cast<Text*>(utils::findChild(_updatePanel, "updateText"));
    _updateBar       = dynamic_cast<LoadingBar*>(utils::findChild(_updatePanel, "bar"));
    
    //弹窗界面
    _dialogWidget = CSLoader::createNode(CONST::UPDATE_DIALOG_CSB);
    this->addChild(_dialogWidget);
    _dialogWidget->setVisible(false);
    
    Layout *dMidPanel       = dynamic_cast<Layout*>(utils::findChild(_dialogWidget,"midPanel"));
    ImageView *dialogPanel  = dynamic_cast<ImageView*>(utils::findChild(dMidPanel,"dialogPanel"));
    _dialogText             = dynamic_cast<Text*>(utils::findChild(dialogPanel,"tipText"));
    _confirmBtn             = dynamic_cast<Button*>(utils::findChild(dialogPanel,"confirmBtn"));
    Text *confirmText       = dynamic_cast<Text*>(utils::findChild(_confirmBtn,"titleText"));
    
    //初始化数据
    _checkText->setFontName(CONST::GAME_FONT_NAME);
    _updateText->setFontName(CONST::GAME_FONT_NAME);
    _dialogText->setFontName(CONST::GAME_FONT_NAME);
    confirmText->setFontName(CONST::GAME_FONT_NAME);
    
    _checkText->setString(TEXT::CHECK_UPDATE);
    _checkPanel->setVisible(false);
    _checkBar->setPercent(0);
    
    _updateText->setString(TEXT::UPDATE);
    _updateBar->setPercent(0);
    confirmText->setString(TEXT::CONFIRM);
    
}

void UpdateUI::onExit(){
    Layer::onExit();
}
