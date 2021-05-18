unit ObjPlay;

interface

type
//  TGender = (gMan,gWoMan);
//  TJob    = (jWarr,jWizard,jTaos);

const
  gMan          = 0;
  gWoMan        = 1;

type
	TPlayObject = class(TAnimalObject)
		m_DefMsg                  :TDefaultMessage;  //0x550
		TList55C                :TList;      //0x55C
		m_sOldSayMsg              :String;     //0x560
		m_nSayMsgCount            :Integer;    //0x560
		m_dwSayMsgTick            :LongWord;   //0x568
		m_boDisableSayMsg         :Boolean;    //0x56C
		m_dwDisableSayMsgTick     :LongWord;   //0x570
		m_dwCheckDupObjTick       :LongWord;   //0x574
		dwTick578               :LongWord;   //0x578
		dwTick57C               :LongWord;   //0x57C
		m_boInSafeArea            :Boolean;    //0x580
      n584                    :Integer;    //0x584
      n588                    :Integer;    //0x584
    m_sUserID                 :string[11]; //0x58C    登录帐号名
    m_sIPaddr                 :string;     //0x598    人物IP地址
    m_sIPLocal                :String;
    m_nSocket                 :Integer;    //0x59C nSocket
    m_nGSocketIdx             :Integer;    //0x5A0 wGateIndex 人物连接到游戏网关SOCKET ID
    m_nGateIdx                :Integer;    //0x5A8 nGateIdx   人物所在网关号
    m_nSoftVersionDate        :Integer;    //0x5AC
    m_dLogonTime              :TDateTime;  //0x5B0  //登录时间
    m_dwLogonTick             :LongWord;   //0x5B8  战领沙城时间(Dword)
    m_boReadyRun              :Boolean;    //0x5BC  //是否进入游戏完成
    m_nSessionID              :Integer;    //0x5C0
    m_nPayMent                :Integer;    //0x5C4  人物当前模式(测试/付费模式)(Dword)
    m_nPayMode                :Integer;    //0x5C8
    m_SessInfo                :pTSessInfo; //全局会话信息
    m_dwLoadTick              :LongWord;   //0x5CC
    m_nServerIndex            :Integer;    //0x5D0  人物当前所在服务器序号
    m_boEmergencyClose        :Boolean;    //0x5D4  掉线标志
    m_boSoftClose             :Boolean;    //0x5D5
    m_boKickFlag              :Boolean;    //0x5D6  断线标志(Byte)(@kick 命令)
    m_boReconnection          :Boolean;    //0x5D7
    m_boRcdSaved              :Boolean;    //0x5D8
    m_boSwitchData            :Boolean;    //0x5D9
    m_nWriteChgDataErrCount   :Integer;    //0x5DC
    m_sSwitchMapName          :String;     //0x5E0
    m_nSwitchMapX             :Integer;    //0x5E4
    m_nSwitchMapY             :Integer;    //0x5E8
    m_boSwitchDataSended      :Boolean;    //0x5EC
    m_dwChgDataWritedTick     :LongWord;   //0x5F0
      m_dw5D4                 :LongWord;   //0x5F4
      n5F8                    :Integer;    //0x5F8
      n5FC                    :Integer;    //0x5FC
    m_dwHitIntervalTime       :LongWord;  //攻击间隔
    m_dwMagicHitIntervalTime  :LongWord;  //魔法间隔
    m_dwRunIntervalTime       :LongWord;  //走路间隔
    m_dwWalkIntervalTime      :LongWord;  //走路间隔
    m_dwTurnIntervalTime      :LongWord;  //换方向间隔
    m_dwActionIntervalTime    :LongWord;  //组合操作间隔
    m_dwRunLongHitIntervalTime:LongWord;  //移动刺杀间隔
    m_dwRunHitIntervalTime    :LongWord;  //跑位攻击间隔
    m_dwWalkHitIntervalTime   :LongWord;  //走位攻击间隔
    m_dwRunMagicIntervalTime  :LongWord;  //跑位魔法间隔


    m_dwMagicAttackTick       :LongWord;   //0x600  魔法攻击时间(Dword)
    m_dwMagicAttackInterval   :LongWord;   //0x604  魔法攻击间隔时间(Dword)
    m_dwAttackTick            :LongWord;   //0x608  攻击时间(Dword)
    m_dwMoveTick              :LongWord;   //0x60C  人物跑动时间(Dword)
    m_dwAttackCount           :LongWord;   //0x610  人物攻击计数(Dword)
    m_dwAttackCountA          :LongWord;   //0x614  人物攻击计数(Dword)
    m_dwMagicAttackCount      :LongWord;   //0x618  魔法攻击计数(Dword)
    m_dwMoveCount             :LongWord;   //0x61C  人物跑计数(Dword)
    m_dwMoveCountA            :LongWord;   //0x620  人物跑计数(Dword)
    m_nOverSpeedCount         :Integer;   //0x624  超速计数(Dword)
    m_boDieInFight3Zone       :Boolean;    //0x628
    m_Script                  :pTScript;    //0x62C
    m_NPC                     :TBaseObject;   //0x630
    m_nVal                    :array[0..9] of Integer;     //0x634 - 658
    m_nMval                   :array[0..99] of Integer;
    m_DyVal                   :array[0..9] of Integer; //0x65C - 680
    m_sPlayDiceLabel          :String;
    m_boTimeRecall            :Boolean;   //0x684
    m_dwTimeRecallTick        :LongWord;  //0x688
    m_sMoveMap                :String;    //0x68C
    m_nMoveX                  :Integer;   //0x690
    m_nMoveY                  :Integer;   //0x694
      bo698                   :Boolean;   //0x698
      n69C                    :Integer;   //0x69C
    m_dwSaveRcdTick           :LongWord;  //0x6A0 保存人物数据时间间隔
    m_btBright                :Byte;
    m_boNewHuman              :Boolean;   //0x6A8
    m_boSendNotice            :Boolean;   //0x6A9
    m_dwWaitLoginNoticeOKTick :LongWord;
    m_boLoginNoticeOK         :Boolean;   //0x6AA
      bo6AB                   :Boolean;   //0x6AB
    m_boExpire                :Boolean;   //0x6AC  帐号过期
    m_dwShowLineNoticeTick    :LongWord;  //0x6B0
    m_nShowLineNoticeIdx      :Integer;   //0x6B4

    //m_AddUseItems             :array[9..12] of TUserItem;
    m_nSoftVersionDateEx      :Integer;
    m_CanJmpScriptLableList   :TStringList;
    m_nScriptGotoCount        :Integer;
    m_sScriptCurrLable        :String; //用于处理 @back 脚本命令
    m_sScriptGoBackLable      :String; //用于处理 @back 脚本命令
    m_dwTurnTick              :LongWord;
    m_wOldIdent               :Word;
    m_btOldDir                :Byte;

    m_boFirstAction           :Boolean;  //第一个操作
    m_dwActionTick            :LongWord; //二次操作之间间隔时间
    m_sDearName               :String[ActorNameLen];   //配偶名称
    m_DearHuman               :TPlayObject;
    m_boCanDearRecall         :Boolean;  //是否允许夫妻传送
    m_boCanMasterRecall       :Boolean;
    m_dwDearRecallTick        :LongWord; //夫妻传送时间
    m_dwMasterRecallTick      :LongWord;
    m_sMasterName             :String[ActorNameLen];   //师徒名称
    m_MasterHuman             :TPlayObject;
    m_MasterList              :TList;
    m_boMaster                :Boolean;
    m_btCreditPoint           :Byte;     //声望点
    m_btMarryCount            :Byte;     //离婚次数
    m_btReLevel               :Byte;     //转生等级
    m_btReColorIdx            :Byte;
    m_dwReColorTick           :LongWord;
    m_nKillMonExpMultiple     :Integer;  //杀怪经验倍数
    m_dwGetMsgTick            :LongWord; //处理消息循环时间控制

    m_boSetStoragePwd         :Boolean;
    m_boReConfigPwd           :Boolean;
    m_boCheckOldPwd           :Boolean;
    m_boUnLockPwd             :Boolean;
    m_boUnLockStoragePwd      :Boolean;
    m_boPasswordLocked        :Boolean;  //锁密码
    m_btPwdFailCount          :Byte;
    m_boLockLogon             :Boolean;  //是否启用锁登录功能
    m_boLockLogoned           :Boolean;  //是否打开登录锁
    m_sTempPwd                :String[7];
    m_sStoragePwd             :String[7];
    m_PoseBaseObject          :TBaseObject;
    m_boStartMarry            :Boolean;
    m_boStartMaster           :Boolean;    
    m_boStartUnMarry          :Boolean;
    m_boStartUnMaster         :Boolean;    
    m_boFilterSendMsg         :Boolean;  //禁止发方字(发的文字只能自己看到)
    m_nKillMonExpRate         :Integer;  //杀怪经验倍数(此数除以 100 为真正倍数)
    m_nPowerRate              :Integer;  //人物攻击力倍数(此数除以 100 为真正倍数)
    m_dwKillMonExpRateTime    :LongWord;
    m_dwPowerRateTime         :LongWord;
    m_dwRateTick              :LongWord;


    m_boCanUseItem            :Boolean;  //是否允许使用物品
    m_boCanDeal               :Boolean;
    m_boCanDrop               :Boolean;
    m_boCanGetBackItem        :Boolean;
    m_boCanWalk               :Boolean;
    m_boCanRun                :Boolean;
    m_boCanHit                :Boolean;
    m_boCanSpell              :Boolean;
    m_boCanSendMsg            :Boolean;

    m_nMemberType             :Integer;  //会员类型
    m_nMemberLevel            :Integer;  //会员等级
    m_boSendMsgFlag           :Boolean;  //发祝福语标志
    m_boChangeItemNameFlag    :Boolean;

    m_nGameGold               :Integer;  //游戏币
    m_boDecGameGold           :Boolean;  //是否自动减游戏币
    m_dwDecGameGoldTime       :LongWord;
    m_dwDecGameGoldTick       :LongWord;
    m_nDecGameGold            :Integer;  //一次减点数

    m_boIncGameGold           :Boolean;  //是否自动加游戏币
    m_dwIncGameGoldTime       :LongWord;
    m_dwIncGameGoldTick       :LongWord;
    m_nIncGameGold            :Integer;  //一次减点数

    m_nGamePoint              :Integer;  //游戏点数
    m_dwIncGamePointTick      :LongWord;
    
    m_nPayMentPoint           :Integer;
    m_dwPayMentPointTick      :LongWord;

    m_dwDecHPTick             :LongWord;
    m_dwIncHPTick             :LongWord;

    m_GetWhisperHuman         :TPlayObject;
    m_dwClearObjTick          :LongWord;
    m_wContribution           :Word;//贡献度
    m_sRankLevelName          :String; //显示名称格式串
    m_boFilterAction          :Boolean;
    m_boClientFlag            :Boolean;
    m_nStep                   :Byte;
    m_nClientFlagMode         :Integer;
    m_dwAutoGetExpTick        :LongWord;
    m_nAutoGetExpTime         :Integer;
    m_nAutoGetExpPoint        :Integer;
    m_AutoGetExpEnvir         :TEnvirnoment;
    m_boAutoGetExpInSafeZone  :Boolean;
    m_DynamicVarList          :TList;
    m_dwClientTick            :LongWord;
    m_boTestSpeedMode         :Boolean; //进入速度测试模式

      {
      LatestRevivalTime       :LongWord;
      wObjectType  :Word;
      Feature      :TObjectFeature;
      boOpenHealth :Boolean;
      dwOpenHealthStart :LongWord;
      dwOpenHealthTime  :LongWord;
      dwMapMoveTime    :LongWord;

      dwTargetFocusTime:LongWord;

      dwWalkTime  :LongWord;
      AntiMagic     :Integer;
      BoAbilSeeHealGauge :Boolean;
      dwStruckTime :LongWord;
      nMeatQuality :Integer;
      nHitTime     :Integer;
      bofirst      :Boolean;
      nSlaveMakeLevel :Integer;
      dwNextHitTime  :LongWord;
      dwNextWalkTime :LongWord;
      boUsePoison    :Boolean;
      }
    nRunCount:Integer;
    dwRunTimeCount:LongWord;
    m_dwDelayTime:LongWord;
  private
    function  ClientDropGold(nGold:Integer):Boolean;
    procedure ClientQueryBagItems();
    procedure ClientQueryUserState(PlayObject:TPlayObject;nX,nY:Integer);
    procedure ClientQueryUserSet(ProcessMsg: pTProcessMessage);
    function  ClientDropItem(sItemName:String;nItemIdx:Integer):Boolean;
    function  ClientPickUpItem: Boolean;
    procedure ClientOpenDoor(nX,nY:Integer);
    procedure ClientTakeOnItems(btWhere:Byte;nItemIdx:integer;sItemName:String);
    procedure ClientTakeOffItems(btWhere:Byte;nItemIdx:integer;sItemName:String);
    procedure ClientUseItems(nItemIdx:Integer;sItemName:String);
    function  UseStdmodeFunItem(StdItem:TItem):Boolean;
    function  ClientGetButchItem(BaseObject:TBaseObject;nX,nY:Integer;btDir:Byte;var dwDelayTime:LongWord):Boolean;
    procedure ClientChangeMagicKey(nSkillIdx,nKey:integer);
    procedure ClientClickNPC(NPC:Integer);
    procedure ClientMerchantDlgSelect(nParam1: Integer;sMsg: String);
    procedure ClientMerchantQuerySellPrice(nParam1,nMakeIndex:Integer;sMsg: String);
    procedure ClientUserSellItem(nParam1,nMakeIndex:Integer;sMsg: String);
    procedure ClientUserBuyItem(nIdent,nParam1,nInt,nZz:Integer;sMsg: String);
    procedure ClientQueryRepairCost(nParam1,nInt:Integer;sMsg: String);
    procedure ClientRepairItem(nParam1,nInt:Integer;sMsg: String);

    procedure ClientGroupClose();
    procedure ClientCreateGroup(sHumName:String);
    procedure ClientAddGroupMember(sHumName:String);
    procedure ClientDelGroupMember(sHumName:String);
    procedure ClientDealTry(sHumName:String);
    procedure ClientAddDealItem(nItemIdx:integer;sItemName:String);
    procedure ClientDelDealItem(nItemIdx:integer;sItemName:String);
    procedure ClientCancelDeal();
    procedure ClientChangeDealGold(nGold:Integer);
    procedure ClientDealEnd();
    procedure ClientStorageItem(NPC:TObject;nItemIdx:Integer;sMsg:String);
    procedure ClientTakeBackStorageItem(NPC:TObject;nItemIdx:Integer;sMsg:String);
    procedure ClientGetMinMap();
    procedure ClientMakeDrugItem(NPC:TObject;nItemName:String);
    procedure ClientOpenGuildDlg();
    procedure ClientGuildHome();
    procedure ClientGuildMemberList();
    procedure ClientGuildAddMember(sHumName:String);
    procedure ClientGuildDelMember(sHumName:String);
    procedure ClientGuildUpdateNotice(sNotict:String);
    procedure ClientGuildUpdateRankInfo(sRankInfo:String);
    procedure ClientGuildAlly();
    procedure ClientGuildBreakAlly(sGuildName:String);
    procedure ClientAdjustBonus(nPoint:Integer;sMsg:String);
    function  ClientChangeDir(wIdent:Word;nX,nY,nDir:Integer;var dwDelayTime:LongWord):Boolean;
    function  ClientWalkXY(wIdent:Word;nX, nY:Integer;boLateDelivery:Boolean;var dwDelayTime:LongWord): Boolean;

    function  ClientHorseRunXY(wIdent:Word;nX,nY:Integer;boLateDelivery:Boolean;var dwDelayTime:LongWord):Boolean;
    function  ClientRunXY(wIdent:Word;nX,nY:Integer;nFlag:Integer;var dwDelayTime:LongWord):Boolean;
    function  ClientHitXY(wIdent:Word;nX,nY,nDir:Integer;boLateDelivery:Boolean;var dwDelayTime:LongWord):Boolean;
    function  ClientSitDownHit(nX,nY,nDir:Integer;var dwDelayTime:LongWord):Boolean;
    function  ClientSpellXY(wIdent:Word;nKey:Integer;nTargetX, nTargetY:Integer;TargeTBaseObject: TBaseObject;boLateDelivery:Boolean;var dwDelayTime:LongWord):Boolean;


    function  CheckTakeOnItems(nWhere: Integer;var StdItem:TStdItem):Boolean;
    function  GetUserItemWeitht(nWhere: Integer):Integer;

    procedure SendDelDealItem(UserItem:pTUserItem);
    procedure SendAddDealItem(UserItem:pTUserItem);



    procedure OpenDealDlg(BaseObject:TBaseObject);
    function  EatItems(StdItem:TItem):Boolean;
    function  EatUseItems(nShape:integer):Boolean;
    function  ReadBook(StdItem:TItem):Boolean;
    function  DayBright():Byte;
    procedure  BaseObjectMove(sMap,sX,sY:String);
    procedure  MoveToHome();
    function  RepairWeapon():Boolean;
    function  SuperRepairWeapon():Boolean;
    function  WinLottery():Boolean;
    procedure ChangeServerMakeSlave(SlaveInfo:pTSlaveInfo);
    function  WeaptonMakeLuck():Boolean;
    function  PileStones(nX,nY:Integer):Boolean;
    function  RunTo(btDir: Byte;boFlag:boolean;nDestX,nDestY:Integer):Boolean;
    procedure ThrustingOnOff(boSwitch:Boolean);
    procedure HalfMoonOnOff(boSwitch: Boolean);
    procedure RedHalfMoonOnOff(boSwitch: Boolean);
    procedure SkillCrsOnOff(boSwitch: Boolean);
    procedure SkillTwinOnOff(boSwitch: Boolean);
    procedure Skill43OnOff(boSwitch: Boolean);
    function  AllowFireHitSkill():Boolean;
    function  AllowTwinHitSkill():Boolean;
    procedure MakeMine();
    procedure MakeMine2();

    function  GetRangeHumanCount():Integer;
    procedure GetHomePoint();
    function  GetStartPoint(var StartPoint:pTStartPoint):Boolean;

    procedure MobPlace(sX, sY, sMonName, sCount: String);


    procedure LogonTimcCost;
    procedure SendNotice();
    procedure SendLogon();
    procedure SendServerConfig();
    procedure SendServerStatus();

//    procedure SendUserName(PlayObject:TPlayObject;nX,nY:Integer);
    function  CretInNearXY(TargeTBaseObject:TBaseObject;nX,nY:Integer):Boolean;
    procedure ClientQueryUserName(target: TBaseObject; x, y: integer);
    procedure SendUseitems();
    procedure SendUseMagic();
    procedure SendSaveItemList(nBaseObject:Integer);
    procedure SendDelItemList(ItemList:TStringList);
    procedure SendAdjustBonus();
    procedure SendChangeGuildName();
    procedure SendMapDescription();
    procedure SendGoldInfo(boSendName:Boolean);

    procedure ShowMapInfo(sMap, sX, sY: String);

    function  CancelGroup():Boolean;
    function  GetSpellPoint(UserMagic:pTUserMagic):Integer;
    function  DoMotaebo(nDir:Byte;nMagicLevel:Integer):Boolean;
    function  DoSpell(UserMagic:pTUserMagic;nTargetX,nTargetY:Integer;BaseObject:TBaseObject):boolean;
    procedure GetOldAbil(var OAbility:TOAbility);
    procedure ReadAllBook;
    function  CheckItemsNeed(StdItem:TItem):Boolean;
    function  CheckItemBindUse(UserItem:pTUserItem):Boolean;
    function  CheckActionStatus(wIdent:Word;var dwDelayTime:LongWord):Boolean;
    procedure RecalcAdjusBonus;
    procedure CheckMarry();
    procedure CheckMaster();
    procedure RefMyStatus;
    procedure ProcessClientPassword(ProcessMsg: pTProcessMessage);
    function CheckDenyLogon: Boolean;
    procedure ProcessSpiritSuite;
    function HorseRunTo(btDir: Byte; boFlag: boolean): Boolean;
  public
    constructor Create();override;
    destructor Destroy; override;
    procedure SendSocket(DefMsg: pTDefaultMessage; sMsg: String);virtual;
    procedure SendDefMessage(wIdent: Word; nRecog: Integer; nParam, nTag, nSeries: Word; sMsg: String);
    procedure SearchViewRange();override;
    procedure UpdateVisibleGay(BaseObject:TBaseObject);override;
    procedure PKDie(PlayObject: TPlayObject);
    procedure GameTimeChanged();
    procedure RunNotice();
    function  GetMyStatus():Integer;
    function  IncGold(tGold:Integer):Boolean;
    function  IsEnoughBag():Boolean;
    function  IsAddWeightAvailable(nWeight:Integer):Boolean;
    procedure SendAddItem(UserItem:pTUserItem );
    procedure SendDelItems(UserItem:pTUserItem);
    procedure Whisper(whostr, saystr: string);
    function  IsBlockWhisper(sName:String):Boolean;
    function  QuestCheckItem(sItemName:String;var nCount:Integer;var nParam:Integer;var nDura:Integer):pTUserItem;
    function  QuestTakeCheckItem(CheckItem:pTUserItem):Boolean;
    procedure GainExp(dwExp:LongWord);
    procedure GetExp(dwExp:LongWord);
    procedure WinExp(dwExp:LongWord);
    function  DecGold(nGold:Integer):Boolean;
    procedure Run();override;
    function  Operate(ProcessMsg:pTProcessMessage):Boolean;override;
    procedure RecalcAbilitys();override; //FFF7
    procedure MakeSaveRcd(var HumanRcd:THumDataInfo);
    procedure DealCancel();
    procedure DealCancelA();
    function  GetShowName():String;override;
    procedure GetBackDealItems();
    procedure Disappear();override;//FFFD
    procedure GoldChange(sChrName:String;nGold:Integer);
    procedure ProcessUserLineMsg(sData:String);
    procedure ProcessSayMsg(sData:String);override;
    procedure ClearStatusTime();
    procedure UserLogon();virtual;
    procedure RefRankInfo(nRankNo:Integer;sRankName:string);
    procedure RefUserState;
    procedure SendGroupMembers();
    procedure JoinGroup(PlayObject:TPlayObject);
    function  GeTBaseObjectInfo():String;
    function  GetHitMsgCount():Integer;
    function  GetSpellMsgCount():Integer;
    function  GetWalkMsgCount():Integer;
    function  GetRunMsgCount():Integer;
    function  GetTurnMsgCount():Integer;
    function  GetSiteDownMsgCount():Integer;
    function  GetDigUpMsgCount():Integer;
    procedure SetScriptLabel(sLabel: String);
    procedure GetScriptLabel(sMsg:String);
    function  LableIsCanJmp(sLabel:String):Boolean;
    function  GetMyInfo():String;
    procedure MakeGhost;override;
    procedure ScatterBagItems(ItemOfCreat:TBaseObject); override;
    procedure DropUseItems(BaseObject:TBaseObject); override;
    procedure RecallHuman(sHumName:String);
    procedure SendAddMagic(UserMagic:pTUserMagic);
    procedure SendDelMagic(UserMagic:pTUserMagic);
    procedure ReQuestGuildWar(sGuildName:String);
    procedure SendUpdateItem(UserItem:pTUserItem);
    procedure GetBagUseItems(var btDc:Byte;var btSc:Byte;var btMc:Byte;var btDura:Byte);

  //protected
    procedure CmdEndGuild();
    procedure CmdMemberFunction(sCmd,sParam:String);
    procedure CmdMemberFunctionEx(sCmd,sParam:String);

    procedure CmdSearchDear(sCmd,sParam:String);
    procedure CmdSearchMaster(sCmd,sParam:String);
    procedure CmdDearRecall(sCmd,sParam:String);
    procedure CmdMasterRecall(sCmd,sParam:String);
    procedure CmdSbkDoorControl(sCmd,sParam:String);

    procedure CmdClearBagItem(Cmd:pTGameCmd;sHumanName:String);
    procedure CmdShowUseItemInfo(Cmd:pTGameCmd;sHumanName:String);

    procedure CmdBindUseItem(Cmd:pTGameCmd;sHumanName,sItem,sType:String);
    procedure CmdUnBindUseItem(Cmd:pTGameCmd;sHumanName,sItem,sType:String);
    procedure CmdLockLogin(Cmd:pTGameCmd);
    procedure CmdViewDiary(sCMD:String;nFlag:Integer);
    procedure CmdUserMoveXY(sCMD,sX,sY:String);
    procedure CmdSearchHuman(sCMD,sHumanName:String);
    procedure CmdGroupRecall(sCMD:String);
    procedure CmdAllowGroupReCall(sCmd,sParam:String);

    procedure CmdGuildRecall(sCmd,sParam:String);


    procedure CmdChangeAttackMode(nMode:Integer;sParam1,sParam2,sParam3,sParam4,sParam5,sParam6,sParam7:String);
    procedure CmdChangeSalveStatus();
    procedure CmdTakeOnHorse(sCmd,sParam:String);
    procedure CmdTakeOffHorse(sCmd,sParam:String);


    procedure CmdPrvMsg(sCmd:String;nPermission:Integer;sHumanName:String);
    procedure CmdHumanLocal(Cmd:pTGameCmd;sHumanName:String);
    procedure CmdMapMove(Cmd:pTGameCmd;sMapName:String);

    procedure CmdPositionMove(Cmd:pTGameCmd;sMapName,sX,sY:String);

    procedure CmdHumanInfo(Cmd:pTGameCmd;sHumanName:String);
    procedure CmdReLoadAdmin(sCmd:String);
    procedure CmdReloadNpc(sParam:String);
    procedure CmdReloadManage(Cmd:pTGameCmd;sParam:String);
    procedure CmdReloadRobotManage;
    procedure CmdReloadRobot;
    procedure CmdReloadMonItems();
    procedure CmdAdjustExp(Human:TPlayObject;nExp:Integer);
    procedure CmdAddGuild(Cmd:pTGameCmd;sGuildName,sGuildChief:String);
    procedure CmdDelGuild(Cmd:pTGameCmd;sGuildName:String);
    procedure CmdGuildWar(sCmd,sGuildName:String);
    procedure CmdChangeSabukLord(Cmd:pTGameCmd;sCastleName,sGuildName:String;boFlag:Boolean);
    procedure CmdForcedWallconquestWar(Cmd:pTGameCmd;sCastleName:String);
    procedure CmdOPTraining(sHumanName,sSkillName:String;nLevel:Integer);
    procedure CmdOPDeleteSkill(sHumanName,sSkillName:String);
    procedure CmdReloadGuildAll();
    procedure CmdReAlive(Cmd:pTGameCmd;sHumanName:String);
    procedure CmdAdjuestLevel(Cmd:pTGameCmd;sHumanName:String;nLevel:Integer);
    procedure CmdAdjuestExp(Cmd:pTGameCmd;sHumanName,sExp:String);

    procedure CmdBackStep(sCmd:String;nType,nCount:Integer);
    procedure CmdFreePenalty(Cmd:pTGameCmd;sHumanName:String);
    procedure CmdPKpoint(Cmd:pTGameCmd;sHumanName:String);
    procedure CmdIncPkPoint(Cmd:pTGameCmd;sHumanName:String;nPoint:Integer);
    procedure CmdHunger(sCmd,sHumanName:String;nHungerPoint:Integer);
    procedure CmdHair(Cmd:pTGameCmd;sHumanName:String;nHair:Integer);
    procedure CmdTrainingSkill(Cmd:pTGameCmd;sHumanName,sSkillName:String;nLevel:Integer);
    procedure CmdTrainingMagic(Cmd:pTGameCmd;sHumanName,sSkillName:String;nLevel:Integer);

    procedure CmdDelSkill(Cmd:pTGameCmd;sHumanName,sSkillName:String);
    procedure CmdDeleteItem(Cmd:pTGameCmd;sHumanName,sItemName:String;nCount:Integer);
    procedure CmdClearMission(Cmd:pTGameCmd;sHumanName:String);

    procedure CmdTraining(sSkillName:String;nLevel:Integer);
    procedure CmdChangeJob(Cmd:pTGameCmd;sHumanName,sJobName:String);
    procedure CmdChangeGender(Cmd:pTGameCmd;sHumanName,sSex:String);
    procedure CmdMission(Cmd:pTGameCmd;sX,sY:String);
    procedure CmdMobPlace(Cmd:pTGameCmd;sX,sY,sMonName,sCount:String);
    procedure CmdMobLevel(Cmd:pTGameCmd;Param:String);
    procedure CmdMobCount(Cmd:pTGameCmd;sMapName:String);
    procedure CmdHumanCount(Cmd:pTGameCmd;sMapName:String);

    procedure CmdDisableFilter(sCmd,sParam1:String);
    procedure CmdChangeUserFull(sCmd,sUserCount:String);
    procedure CmdChangeZenFastStep(sCmd,sFastStep:String);

    procedure CmdReconnection(sCmd,sIPaddr,sPort:String);
    procedure CmdContestPoint(Cmd:pTGameCmd;sGuildName:String);
    procedure CmdStartContest(Cmd:pTGameCmd;sParam1:String);
    procedure CmdEndContest(Cmd:pTGameCmd;sParam1:String);

    procedure CmdAnnouncement(Cmd:pTGameCmd;sGuildName:String);
    procedure CmdKill(Cmd:pTGameCmd;sHumanName:String);
    procedure CmdMakeItem(Cmd:pTGameCmd;sItemName:String;nCount:Integer);
    procedure CmdSmakeItem(Cmd:pTGameCmd;nWhere,nValueType,nValue:Integer);
    procedure CmdBonuPoint(Cmd:pTGameCmd;sHumName:String;nCount:Integer);
    procedure CmdDelBonuPoint(Cmd:pTGameCmd;sHumName:String);
    procedure CmdRestBonuPoint(Cmd:pTGameCmd;sHumName:String);

    procedure CmdFireBurn(nInt,nTime,nN:Integer);
    procedure CmdTestFire(sCmd:String;nRange,nType,nTime,nPoint:Integer);

    procedure CmdTestStatus(sCmd:String;nType,nTime:Integer);

    procedure CmdDelGold(Cmd:pTGameCmd;sHumName:String;nCount:Integer);
    procedure CmdAddGold(Cmd:pTGameCmd;sHumName:String;nCount:Integer);
    procedure CmdDelGameGold(sCmd,sHumName:String;nPoint:Integer);
    procedure CmdAddGameGold(sCmd,sHumName:String;nPoint:Integer);
    procedure CmdGameGold(Cmd:pTGameCmd;sHumanName:String;sCtr:String;nGold:Integer);
    procedure CmdGamePoint(Cmd:pTGameCmd;sHumanName:String;sCtr:String;nPoint:Integer);
    procedure CmdCreditPoint(Cmd:pTGameCmd;sHumanName:String;sCtr:String;nPoint:Integer);

    procedure CmdMob(Cmd:pTGameCmd;sMonName:String;nCount,nLevel:Integer; nExpRatio:Integer = -1);

    procedure CmdRefineWeapon(Cmd:pTGameCmd;nDC,nMC,nSC,nHit:Integer);
    procedure CmdRecallMob(Cmd:pTGameCmd;sMonName:String;nCount,nLevel,nAutoChangeColor,nFixColor:Integer);
    procedure CmdLuckPoint(sCmd:String;nPerMission:Integer;sHumanName,sCtr,sPoint:String);
    procedure CmdLotteryTicket(sCmd:String;nPerMission:Integer;sParam1:String);
    procedure CmdReloadGuild(sCmd:String;nPerMission:Integer;sParam1:String);
    procedure CmdReloadLineNotice(sCmd:String;nPerMission:Integer;sParam1:String);
    procedure CmdReloadAbuse(sCmd:String;nPerMission:Integer;sParam1:String);

    procedure CmdMobNpc(sCmd:String;nPermission:Integer;sParam1,sParam2,sParam3,sParam4:String);
    procedure CmdNpcScript(sCmd:String;nPermission:Integer;sParam1,sParam2,sParam3:String);
    procedure CmdDelNpc(sCmd:String;nPermission:Integer;sParam1:String);
    procedure CmdKickHuman(Cmd:pTGameCmd;sHumName:String);
    procedure CmdTing(Cmd:pTGameCmd;sHumanName:String);
    procedure CmdSuperTing(Cmd:pTGameCmd;sHumanName,sRange:String);
    procedure CmdMapMoveHuman(Cmd:pTGameCmd;sSrcMap,sDenMap:String);
    procedure CmdShutup(Cmd:pTGameCmd;sHumanName,sTime:String);
    procedure CmdShowMapInfo(Cmd:pTGameCmd;sParam1:String);

    procedure CmdShutupRelease(Cmd:pTGameCmd;sHumanName:String;boAll:Boolean);
    procedure CmdShutupList(Cmd:pTGameCmd;sParam1:String);
    procedure CmdShowSbkGold(Cmd:pTGameCmd;sCastleName,sCtr,sGold:String);
    procedure CmdRecallHuman(Cmd:pTGameCmd;sHumanName:String);
    procedure CmdReGotoHuman(Cmd:pTGameCmd;sHumanName:String);
    procedure CmdShowHumanFlag(sCmd:String;nPermission:Integer;sHumanName,sFlag:String);
    procedure CmdShowHumanUnitOpen(sCmd:String;nPermission:Integer;sHumanName,sUnit:String);
    procedure CmdShowHumanUnit(sCmd:String;nPermission:Integer;sHumanName,sUnit:String);



    procedure CmdChangeAdminMode(sCmd:String;nPermission:Integer;sParam1:String;boFlag:Boolean);
    procedure CmdChangeObMode(sCmd:String;nPermission:Integer;sParam1:String;boFlag:Boolean);
    procedure CmdChangeSuperManMode(sCmd:String;nPermission:Integer;sParam1:String;boFlag:Boolean);
    procedure CmdChangeLevel(Cmd:pTGameCmd;sParam1:String);
    procedure CmdChangeDearName(Cmd:pTGameCmd;sHumanName:String;sDearName:String);
    procedure CmdChangeMasterName(Cmd:pTGameCmd;sHumanName:String;sMasterName,sIsMaster:String);
    procedure CmdStartQuest(Cmd:pTGameCmd;sQuestName:String);
    procedure CmdSetPermission(Cmd:pTGameCmd;sHumanName,sPermission:String);
    procedure CmdClearMapMonster(Cmd:pTGameCmd;sMapName,sMonName,sItems:String);
    procedure CmdReNewLevel(Cmd:pTGameCmd;sHumanName,sLevel:String);

    procedure CmdDenyIPaddrLogon(Cmd:pTGameCmd;sIPaddr,sFixDeny:String);
    procedure CmdDelDenyIPaddrLogon(Cmd:pTGameCmd;sIPaddr,sFixDeny:String);
    procedure CmdShowDenyIPaddrLogon(Cmd:pTGameCmd;sIPaddr,sFixDeny:String);

    procedure CmdDenyAccountLogon(Cmd:pTGameCmd;sAccount,sFixDeny:String);
    procedure CmdDelDenyAccountLogon(Cmd:pTGameCmd;sAccount,sFixDeny:String);
    procedure CmdShowDenyAccountLogon(Cmd:pTGameCmd;sAccount,sFixDeny:String);

    procedure CmdDenyCharNameLogon(Cmd:pTGameCmd;sCharName,sFixDeny:String);
    procedure CmdDelDenyCharNameLogon(Cmd:pTGameCmd;sCharName,sFixDeny:String);
    procedure CmdShowDenyCharNameLogon(Cmd:pTGameCmd;sCharName,sFixDeny:String);
    procedure CmdViewWhisper(Cmd:pTGameCmd;sCharName,sParam2:String);
    procedure CmdSpirtStart(sCmd:String;sParam1:String);
    procedure CmdSpirtStop(sCmd:String;sParam1:String);
    procedure CmdSetMapMode(sCmd:String;sMapName,sMapMode,sParam1,sParam2:String);
    procedure CmdShowMapMode(sCmd:String;sMapName:String);
    procedure CmdClearHumanPassword(sCmd:String;nPermission:Integer;sHumanName:String);

    procedure CmdChangeItemName(sCmd,sMakeIndex,sItemIndex,sItemName:String);
    procedure CmdDisableSendMsg(Cmd:pTGameCmd;sHumanName:String);
    procedure CmdEnableSendMsg(Cmd:pTGameCmd;sHumanName:String);
    procedure CmdDisableSendMsgList(Cmd:pTGameCmd);
    procedure CmdTestGetBagItems(Cmd:pTGameCmd;sParam:String);
    procedure CmdMobFireBurn(Cmd:pTGameCmd;sMap,sX,sY,sType,sTime,sPoint:String);
    procedure CmdTestSpeedMode(Cmd:pTGameCmd);

    procedure SendWhisperMsg(PlayObject:TPlayObject);
  end;


  procedure AddUserLog(sMsg:String);


implementation

uses ObjAnimal

function TPlayObject.IncGold(tGold: Integer):Boolean;//004BF64C
begin
  Result:=False;
//  if m_nGold + tGold <= BAGGOLD then begin
  if m_nGold + tGold <= g_Config.nHumanMaxGold then begin
     Inc(m_nGold,tGold);
     Result:=True;
  end;
end;


function  TPlayObject.ClientPickUpItem: Boolean; //004C5CB0
  function IsSelf(BaseObject:TBaseObject):Boolean;
  begin
    if (BaseObject = nil) or (Self = BaseObject) then Result:=True
    else Result:=False;
  end;
  function IsOfGroup(BaseObject:TBaseObject):Boolean;
  var
    I: Integer;
    GroupMember:TBaseObject;
  begin
    Result:=False;
    if m_GroupOwner = nil then exit;
    for I := 0 to m_GroupOwner.m_GroupMembers.Count - 1 do begin
      GroupMember:=TBaseObject(m_GroupOwner.m_GroupMembers.Objects[i]);
      if GroupMember = BaseObject then begin
        Result:=True;
        break;
      end;
    end;
  end;
var
  UserItem:PTUserItem;
  MapItem:pTMapItem;
  StdItem:TItem;
  PlayObject:TPlayObject;
begin
  Result:=False;
  if m_boDealing then exit;
  MapItem:=m_PEnvir.GetItem (m_nCurrX,m_nCurrY);
  if MapItem = nil then exit;

  if (GetTickCount - MapItem.dwCanPickUpTick) > g_Config.dwFloorItemCanPickUpTime {2 * 60 * 1000} then begin
    MapItem.OfBaseObject:=nil;
  end;
  if not IsSelf(TBaseObject(MapItem.OfBaseObject)) and not IsOfGroup(TBaseObject(MapItem.OfBaseObject)) then begin
    SysMsg(g_sCanotPickUpItem{'在一定时间以内无法捡起此物品！！！'},c_Red,t_Hint);
    exit;
  end;
  if CompareText (MapItem.Name, sSTRING_GOLDNAME) = 0 then begin
    if m_PEnvir.DeleteFromMap (m_nCurrX, m_nCurrY, OS_ITEMOBJECT, TObject(MapItem)) = 1 then begin
      if IncGold (MapItem.Count) then begin
        SendRefMsg (RM_ITEMHIDE, 0, Integer(MapItem), m_nCurrX, m_nCurrY, '');
        if g_boGameLogGold then //004C5E8C
           AddGameDataLog('4' +  #9 +
                     m_sMapName + #9 +
                     IntToStr(m_nCurrX) + #9 +
                     IntToStr(m_nCurrY) + #9 +
                     m_sCharName + #9 +
                     sSTRING_GOLDNAME + #9 +
                     IntToStr(MapItem.Count) + #9 +
                     '1' + #9 +
                     '0');
        GoldChanged;
        Dispose(MapItem);
      end else
        m_PEnvir.AddToMap (m_nCurrX, m_nCurrY, OS_ITEMOBJECT, TObject(MapItem));
    end;
    exit;
  end;

  if IsEnoughBag then begin
    if m_PEnvir.DeleteFromMap (m_nCurrX, m_nCurrY, OS_ITEMOBJECT, TObject(MapItem)) = 1 then begin
      New(UserItem);
      UserItem^:= MapItem.UserItem;
      StdItem:=UserEngine.GetStdItem (UserItem.wIndex);
      if (StdItem <> nil) and IsAddWeightAvailable (UserEngine.GetStdItemWeight(UserItem.wIndex)) then begin
        SendMsg (self, RM_ITEMHIDE, 0, integer(MapItem), m_nCurrX, m_nCurrY, '');
        AddItemToBag(UserItem);

        if not IsCheapStuff (StdItem.StdMode) then
        if StdItem.NeedIdentify = 1 then  //004C60FF
          AddGameDataLog('4' +  #9 +
                                    m_sMapName + #9 +
                                    IntToStr(m_nCurrX) + #9 +
                                    IntToStr(m_nCurrY) + #9 +
                                    m_sCharName + #9 +
                                    //UserEngine.GetStdItemName(pu.wIndex) + #9 +
                                    StdItem.Name + #9 +
                                    IntToStr(UserItem.MakeIndex) + #9 +
                                    '1' + #9 +
                                    '0');
        Dispose(MapItem);
        if m_btRaceServer = RC_PLAYOBJECT then begin
          PlayObject:= TPlayObject(self);
          PlayObject.SendAddItem(UserItem);
        end;
        Result:=TRUE;
      end else begin
        Dispose(UserItem);
        m_PEnvir.AddToMap(m_nCurrX, m_nCurrY, OS_ITEMOBJECT, TObject(MapItem));
      end;
    end;
  end;
end;

procedure TPlayObject.RunNotice;//004DA588
var
  Msg:TProcessMessage;
ResourceString
  sExceptionMsg = '[Exception] TPlayObject::RunNotice';
begin
  if m_boEmergencyClose or m_boKickFlag or m_boSoftClose then begin
    if m_boKickFlag then SendDefMessage(SM_OUTOFCONNECTION,0,0,0,0,'');
    MakeGhost();
  end else begin
    try
      if not m_boSendNotice then begin
        SendNotice();
        m_boSendNotice:=True;
        m_dwWaitLoginNoticeOKTick:=GetTickCount();
      end else begin
        if GetTickCount - m_dwWaitLoginNoticeOKTick > 10 * 1000 then begin
          m_boEmergencyClose:=True;
        end;

        while GetMessage(@Msg) do begin
          if msg.wIdent = CM_LOGINNOTICEOK then begin
            m_boLoginNoticeOK:=True;
            m_dwClientTick:=Msg.nParam1;
            SysMsg(IntToStr(m_dwClientTick),c_Red,t_Notice);
          end;
        end;
      end;
    except
      MainOutMessage(sExceptionMsg);
    end;
  end;
end;

procedure TPlayObject.WinExp(dwExp: LongWord);
begin
  dwExp:=g_Config.dwKillMonExpMultiple * dwExp; //系统指定杀怪经验倍数
  dwExp:=LongWord(m_nKillMonExpMultiple) * dwExp; //人物指定的杀怪经验倍数

  dwExp:=ROUND((m_nKillMonExpRate / 100) * dwExp); //人物指定的杀怪经验倍数
  if m_PEnvir.Flag.boEXPRATE then
    dwExp:=ROUND((m_PEnvir.Flag.nEXPRATE / 100) * dwExp); //地图上指定杀怪经验倍数

  if m_boExpItem then begin //物品经验倍数
    dwExp:=ROUND(m_rExpItem * dwExp);
  end;
  GetExp(dwExp);
end;

procedure TPlayObject.GetExp(dwExp: LongWord);//004BEB74
begin

  Inc(m_Abil.Exp,dwExp);
  AddBodyLuck(dwExp * 0.002);
  SendMsg(Self,RM_WINEXP,0,dwExp,0,0,'');
  
  if m_Abil.Exp >= m_Abil.MaxExp then begin
    Dec(m_Abil.Exp,m_Abil.MaxExp);
    if m_Abil.Level < MAXUPLEVEL then begin
      Inc(m_Abil.Level);
    end;

    HasLevelUp(m_Abil.Level - 1);
    AddBodyLuck(100);
      //004BECDC
      AddGameDataLog('12' +  #9 +
                     m_sMapName + #9 +
                     IntToStr(m_Abil.Level) + #9 +
                     IntToStr(m_Abil.Exp) + #9 +
                     m_sCharName + #9 +
                     '0' + #9 +
                     '0' + #9 +
                     '1' + #9 +
                     '0');
    IncHealthSpell(2000,2000);
  end;
end;

function TPlayObject.IsEnoughBag: Boolean;//004C4990
begin
  Result:=False;
  if m_ItemList.Count < MAXBAGITEM then
    Result:=True;
end;

function TPlayObject.IsAddWeightAvailable(nWeight:Integer): Boolean; //004C4A78
begin
  Result:=False;
  if (m_WAbil.Weight + nWeight) <= m_WAbil.MaxWeight then
    Result:=True;
end;



procedure TPlayObject.SendAddItem(UserItem:pTUserItem); //004D0824
var
  Item:TItem;
  StdItem:TStdItem;
  ClientItem:TClientItem;
  OClientItem:TOClientItem;
begin
if m_nSoftVersionDateEx = 0 then begin
  Item:=UserEngine.GetStdItem(UserItem.wIndex);
  if Item = nil then exit;

  Item.GetStandardItem(StdItem);
  Item.GetItemAddValue(UserItem, StdItem);
  StdItem.Name := GetItemName(UserItem);
  CopyStdItemToOStdItem(@StdItem,@OClientItem.S);

  OClientItem.MakeIndex:=UserItem.MakeIndex;
  OClientItem.Dura:=UserItem.Dura;
  OClientItem.DuraMax:=UserItem.DuraMax;
  if StdItem.StdMode = 50 then begin
    OClientItem.S.Name:=OClientItem.S.Name + ' #' + IntToStr(UserItem.Dura);
  end;
  if StdItem.StdMode in [15,19,20,21,22,23,24,26] then begin
    if UserItem.btValue[8] = 0 then OClientItem.S.Shape:=0
    else OClientItem.S.Shape:=130;
  end;
  m_DefMsg:=MakeDefaultMsg(SM_ADDITEM,Integer(Self),0,0,1);
  SendSocket(@m_DefMsg,EncodeBuffer(@OClientItem,SizeOf(TOClientItem)));
end else begin
  Item:=UserEngine.GetStdItem(UserItem.wIndex);
  if Item = nil then exit;
  Item.GetStandardItem(ClientItem.S);
  Item.GetItemAddValue(UserItem, ClientItem.S);
  ClientItem.S.Name := GetItemName(UserItem);

  ClientItem.MakeIndex:=UserItem.MakeIndex;
  ClientItem.Dura:=UserItem.Dura;
  ClientItem.DuraMax:=UserItem.DuraMax;
  if StdItem.StdMode = 50 then begin
    ClientItem.S.Name:=ClientItem.S.Name + ' #' + IntToStr(UserItem.Dura);
  end;
  if StdItem.StdMode in [15,19,20,21,22,23,24,26] then begin
    if UserItem.btValue[8] = 0 then ClientItem.S.Shape:=0
    else ClientItem.S.Shape:=130;
  end;
  m_DefMsg:=MakeDefaultMsg(SM_ADDITEM,Integer(Self),0,0,1);
  SendSocket(@m_DefMsg,EncodeBuffer(@ClientItem,SizeOf(TClientItem)));
end;
end;

//004D1558
procedure TPlayObject.Whisper(whostr, saystr: string);
var
  PlayObject:TPlayObject;
  svidx:Integer;
begin
  PlayObject:=UserEngine.GeTPlayObject(whostr);
  if PlayObject <> nil then begin
    if not PlayObject.m_boReadyRun then begin
      SysMsg(whostr + g_sCanotSendmsg{'无法发送信息.'}, c_Red,t_Hint);
      exit;
    end;
    if not PlayObject.m_boHearWhisper or PlayObject.IsBlockWhisper(m_sCharName) then begin
      SysMsg (whostr + g_sUserDenyWhisperMsg{' 拒绝私聊！！！'}, c_Red,t_Hint);
      exit;
    end;
    if m_btPermission > 0 then begin
      PlayObject.SendMsg (PlayObject,RM_WHISPER,0,g_Config.btGMWhisperMsgFColor,g_Config.btGMWhisperMsgBColor,0,m_sCharName + '=> ' + saystr);
      //取得私聊信息
      if (m_GetWhisperHuman <> nil) and (not m_GetWhisperHuman.m_boGhost) then
        m_GetWhisperHuman.SendMsg (m_GetWhisperHuman,RM_WHISPER,0,g_Config.btGMWhisperMsgFColor,g_Config.btGMWhisperMsgBColor,0, m_sCharName + '=>' + PlayObject.m_sCharName + ' ' + saystr);

      if (PlayObject.m_GetWhisperHuman <> nil) and (not PlayObject.m_GetWhisperHuman.m_boGhost) then
        PlayObject.m_GetWhisperHuman.SendMsg (PlayObject.m_GetWhisperHuman,RM_WHISPER,0,g_Config.btGMWhisperMsgFColor,g_Config.btGMWhisperMsgBColor,0, m_sCharName + '=>' + PlayObject.m_sCharName + ' ' + saystr);
    end else begin
      PlayObject.SendMsg (PlayObject,RM_WHISPER,0,g_Config.btWhisperMsgFColor,g_Config.btWhisperMsgBColor,0,m_sCharName + '=> ' + saystr);
      if (m_GetWhisperHuman <> nil) and (not m_GetWhisperHuman.m_boGhost) then
        m_GetWhisperHuman.SendMsg (m_GetWhisperHuman,RM_WHISPER,0,g_Config.btWhisperMsgFColor,g_Config.btWhisperMsgBColor,0, m_sCharName + '=>' + PlayObject.m_sCharName + ' ' + saystr);

      if (PlayObject.m_GetWhisperHuman <> nil) and (not PlayObject.m_GetWhisperHuman.m_boGhost) then
        PlayObject.m_GetWhisperHuman.SendMsg (PlayObject.m_GetWhisperHuman,RM_WHISPER,0,g_Config.btWhisperMsgFColor,g_Config.btWhisperMsgBColor,0, m_sCharName + '=>' + PlayObject.m_sCharName + ' ' + saystr);
    end;



  end else begin
    if UserEngine.FindOtherServerUser (whostr, svidx) then begin
      UserEngine.SendServerGroupMsg (SS_WHISPER, svidx, whostr + '/' + m_sCharName + '=> ' + saystr);
    end else begin
      SysMsg (whostr + g_sUserNotOnLine{'  没有在线！！！'}, c_Red,t_Hint);
    end;
  end;
end;

//004D199C
function TPlayObject.IsBlockWhisper(sName: String): Boolean;
var
  I: Integer;
begin
  Result:=False;
  for I := 0 to m_BlockWhisperList.Count - 1 do begin
    if CompareText(sName,m_BlockWhisperList.Strings[i]) = 0 then begin
      Result:=True;
      break;
    end;
  end;
end;

procedure TPlayObject.SendSocket(DefMsg:pTDefaultMessage;sMsg:String);//004CAB38
var
  MsgHdr:TMsgHeader;
  nSendBytes:Integer;
  tBuff:PChar;
ResourceString
  sExceptionMsg = '[Exception] TPlayObject::SendSocket..';
begin
  tBuff:=nil;
  try
    MsgHdr.dwCode         := RUNGATECODE;
    MsgHdr.nSocket        := m_nSocket;
    MsgHdr.wGSocketIdx    := m_nGSocketIdx;
    MsgHdr.wIdent         := GM_DATA;

//    MsgHdr.nUserListIndex := 0;
    //004CAB9A
    if DefMsg <> nil then begin
      if sMsg <> '' then begin
        MsgHdr.nLength:=Length(sMsg) + SizeOf(TDefaultMessage) + 1;
        nSendBytes:=MsgHdr.nLength + SizeOf(TMsgHeader);
        GetMem(tBuff,nSendBytes + SizeOf(Integer));
        Move(nSendBytes,tBuff^,SizeOf(Integer));
        Move(MsgHdr,tBuff[SizeOf(Integer)],SizeOf(TMsgHeader));
        Move(DefMsg^,tBuff[SizeOf(TMsgHeader) + SizeOf(Integer)],SizeOf(TDefaultMessage));
        Move(sMsg[1],tBuff[SizeOf(TDefaultMessage) + SizeOf(TMsgHeader) + SizeOf(Integer)],Length(sMsg) + 1);
      end else begin//004CAC29
        MsgHdr.nLength:=SizeOf(TDefaultMessage);
        nSendBytes:=MsgHdr.nLength + SizeOf(TMsgHeader);
        GetMem(tBuff,nSendBytes + SizeOf(Integer));
        Move(nSendBytes,tBuff^,SizeOf(Integer));
        Move(MsgHdr,tBuff[SizeOf(Integer)],SizeOf(TMsgHeader));
        Move(DefMsg^,tBuff[SizeOf(TMsgHeader) + SizeOf(Integer)],SizeOf(TDefaultMessage));
      end;
    end else begin//004CAC7F
      if sMsg <> '' then begin
        MsgHdr.nLength:= - (Length(sMsg) + 1);
        nSendBytes:=abs(MsgHdr.nLength) + SizeOf(TMsgHeader);
        GetMem(tBuff,nSendBytes + SizeOf(Integer));
        Move(nSendBytes,tBuff^,SizeOf(Integer));
        Move(MsgHdr,tBuff[SizeOf(Integer)],SizeOf(TMsgHeader));
        Move(sMsg[1],tBuff[SizeOf(TMsgHeader) + SizeOf(Integer)],Length(sMsg) + 1);
      end;//004CACF0
    end;//004CACF0
    if not RunSocket.AddGateBuffer(m_nGateIdx,tBuff) then begin
      FreeMem(tBuff);
      //MainOutMessage('SendSocket Buffer Fail ' + IntToStr(m_nGateIdx));
    end;
  except
    MainOutMessage(sExceptionMsg);
  end;
end;

procedure TPlayObject.SendDefMessage(wIdent:Word;nRecog:Integer;nParam,nTag,nSeries:Word;sMsg:String); //004CAD6C
begin
  m_DefMsg:=MakeDefaultMsg(wIdent,nRecog,nParam,nTag,nSeries);
  if sMsg <> '' then SendSocket(@m_DefMsg,EncodeString(sMsg))
  else SendSocket(@m_DefMsg,'');
end;

procedure TPlayObject.ClientQueryUserName (target: TBaseObject; x, y: integer); //004DA8E8
var
  uname: string;
  TagColor:Integer;
  Def:TDefaultMessage;
begin
   if CretInNearXY (target, x, y) then begin
      tagcolor := GetCharColor (target);
      Def := MakeDefaultMsg (SM_USERNAME, Integer(target), tagcolor, 0, 0);
      uname := target.GetShowName;
      SendSocket (@Def, EncodeString (uname));
   end else
      SendDefMessage (SM_GHOST, integer(target), x, y, 0, '');
end;

function TPlayObject.DayBright: Byte;
begin
  if m_PEnvir.Flag.boDarkness then Result := 1
  else if (m_btBright = 1) then
		Result := 0
	else if (m_btBright = 3) then
		Result := 1
	else
		Result := 2;

  if m_PEnvir.Flag.boDayLight then Result := 0;
end;

procedure TPlayObject.RefUserState(); //004D6870
var
  n8:Integer;
begin
  n8:=0;
  if m_PEnvir.Flag.boFightZone then n8:=n8 or 1;
  if m_PEnvir.Flag.boSAFE then n8:=n8 or 2;
  if m_boInFreePKArea then n8:=n8 or 4;
  SendDefMessage(SM_AREASTATE,n8,0,0,0,'');
end;

procedure TPlayObject.RefMyStatus();
begin
  RecalcAbilitys();
  SendMsg(Self,RM_MYSTATUS,0,0,0,0,'');
end;

function TPlayObject.Operate(ProcessMsg: pTProcessMessage):Boolean;
var
  CharDesc:TCharDesc;
  nObjCount:integer;
  s1C:String;
  MessageBodyWL:TMessageBodyWL;
  MessageBodyW:TMessageBodyW;
  ShortMessage:TShortMessage;
  OAbility:TOAbility;
  dwDelayTime:LongWord;
  nMsgCount:Integer;
begin
  Result:=True;
      case ProcessMsg.wIdent of
        CM_QUERYUSERNAME: begin //80
          ClientQueryUserName(TPlayObject(ProcessMsg.nParam1),ProcessMsg.nParam2,ProcessMsg.nParam3);//004D7931
        end;
        CM_QUERYBAGITEMS: begin //0x81
          ClientQueryBagItems();//004D793E
        end;
        CM_QUERYUSERSTATE: begin //82
          ClientQueryUserState(TPlayObject(ProcessMsg.nParam1),ProcessMsg.nParam2,ProcessMsg.nParam3);
        end;
        CM_QUERYUSERSET: begin
          ClientQueryUserSet(ProcessMsg);
        end;
        CM_DROPITEM: begin //1000
          if ClientDropItem(ProcessMsg.sMsg,ProcessMsg.nParam1) then
            SendDefMessage(SM_DROPITEM_SUCCESS,ProcessMsg.nParam1,0,0,0,ProcessMsg.sMsg)
          else SendDefMessage(SM_DROPITEM_FAIL,ProcessMsg.nParam1,0,0,0,ProcessMsg.sMsg);
        end;
        CM_PICKUP: begin //1001  004D78F9
          if (m_nCurrX = ProcessMsg.nParam2) and (m_nCurrY = ProcessMsg.nParam3) then
            ClientPickUpItem();
        end;
        CM_OPENDOOR: begin //1002
          ClientOpenDoor(ProcessMsg.nParam2,ProcessMsg.nParam3);
        end;
        CM_TAKEONITEM: begin //1003
          ClientTakeOnItems(ProcessMsg.nParam2,ProcessMsg.nParam1,ProcessMsg.sMsg);
        end;
        CM_TAKEOFFITEM: begin //1004
          ClientTakeOffItems(ProcessMsg.nParam2,ProcessMsg.nParam1,ProcessMsg.sMsg);
        end;
        CM_EAT: begin //1006
          ClientUseItems(ProcessMsg.nParam1,ProcessMsg.sMsg);
        end;
        CM_BUTCH: begin //1007
          if not ClientGetButchItem(TBaseObject(ProcessMsg.nParam1),ProcessMsg.nParam2,ProcessMsg.nParam3,ProcessMsg.wParam,dwDelayTime) then begin
            if dwDelayTime <> 0 then begin
              nMsgCount:=GetDigUpMsgCount();
              if nMsgCount >= g_Config.nMaxDigUpMsgCount then begin
                Inc(m_nOverSpeedCount);
                if m_nOverSpeedCount > g_Config.nOverSpeedKickCount then begin
                  if g_Config.boKickOverSpeed then begin
                    SysMsg(g_sKickClientUserMsg{'请勿使用非法软件！！！'},c_Red,t_Hint);
                    m_boEmergencyClose:=True;
                  end;
                  if g_Config.boViewHackMessage then begin
                    //MainOutMessage('[游戏超速] ' + m_sCharName + ' Time: ' + IntToStr(dwDelayTime) + ' Count: '+ IntToStr(nMsgCount));
                    MainOutMessage(format(g_sBunOverSpeed,[m_sCharName,dwDelayTime,nMsgCount]));
                  end;
                end;
                //如果超速则发送攻击失败信息
                SendSocket(nil,sSTATUS_FAIL + IntToStr(GetTickCount));
              end else begin
                if dwDelayTime < g_Config.dwDropOverSpeed then begin
                  if m_boTestSpeedMode then
                     SysMsg(format('速度异常 Ident: %d Time: %d',[ProcessMsg.wIdent,dwDelayTime]),c_Red,t_Hint);
                  SendSocket(nil,sSTATUS_GOOD + IntToStr(GetTickCount));
                end else begin
                  SendDelayMsg(Self,ProcessMsg.wIdent,ProcessMsg.wParam,ProcessMsg.nParam1,ProcessMsg.nParam2,ProcessMsg.nParam3,'',dwDelayTime);
                  Result:=False;
                end;
              end;
            end;
          end;
        end;
        CM_MAGICKEYCHANGE: begin //1008
          ClientChangeMagicKey(ProcessMsg.nParam1,ProcessMsg.nParam2);
        end;
        CM_SOFTCLOSE: begin //1009  004D79CB
          m_boReconnection:=True;
          m_boSoftClose:=True;
        end;
        CM_CLICKNPC: //1010  004D79E4
          ClientClickNPC(ProcessMsg.nParam1);
        CM_MERCHANTDLGSELECT: //1011
          ClientMerchantDlgSelect(ProcessMsg.nParam1,ProcessMsg.sMsg);
        CM_MERCHANTQUERYSELLPRICE: //1012
          ClientMerchantQuerySellPrice(ProcessMsg.nParam1,MakeLong(ProcessMsg.nParam2,ProcessMsg.nParam3),ProcessMsg.sMsg);
        CM_USERSELLITEM: //1013
          ClientUserSellItem(ProcessMsg.nParam1,MakeLong(ProcessMsg.nParam2,ProcessMsg.nParam3),ProcessMsg.sMsg);

        CM_USERBUYITEM:  //1014  004D7AD4
          ClientUserBuyItem(ProcessMsg.wIdent,ProcessMsg.nParam1,MakeLong(ProcessMsg.nParam2,ProcessMsg.nParam3),0,ProcessMsg.sMsg);

        CM_USERGETDETAILITEM:  //1015 004D7AB6
          ClientUserBuyItem(ProcessMsg.wIdent,ProcessMsg.nParam1,0,ProcessMsg.nParam2,ProcessMsg.sMsg);

        CM_DROPGOLD:  //1016  004D7AFC
          if ProcessMsg.nParam1 > 0 then ClientDropGold(ProcessMsg.nParam1);
          
        CM_1017: //1017
          SendDefMessage(1,0,0,0,0,'');

        CM_GROUPMODE: begin //1019
          if ProcessMsg.nParam2 = 0 then ClientGroupClose()
          else m_boAllowGroup:=True;
          if m_boAllowGroup then SendDefMessage(SM_GROUPMODECHANGED,0,1,0,0,'')
          else SendDefMessage(SM_GROUPMODECHANGED,0,0,0,0,'');
        end;
        CM_CREATEGROUP: begin //1020
          ClientCreateGroup(Trim(ProcessMsg.sMsg));
        end;
        CM_ADDGROUPMEMBER: begin //1021
          ClientAddGroupMember(Trim(ProcessMsg.sMsg));
        end;
        CM_DELGROUPMEMBER: begin //1022
          ClientDelGroupMember(Trim(ProcessMsg.sMsg));
        end;
        CM_USERREPAIRITEM: begin //1023 004D7A70
          ClientRepairItem(ProcessMsg.nParam1,MakeLong(ProcessMsg.nParam2,ProcessMsg.nParam3),ProcessMsg.sMsg);
        end;
        CM_MERCHANTQUERYREPAIRCOST: begin //1024 004D7A2A
          ClientQueryRepairCost(ProcessMsg.nParam1,MakeLong(ProcessMsg.nParam2,ProcessMsg.nParam3),ProcessMsg.sMsg);
        end;
        CM_DEALTRY: begin //1025
          ClientDealTry(Trim(ProcessMsg.sMsg));
        end;
        CM_DEALADDITEM: begin //1026
          ClientAddDealItem(ProcessMsg.nParam1,ProcessMsg.sMsg);
        end;
        CM_DEALDELITEM: begin //1027
          ClientDelDealItem(ProcessMsg.nParam1,ProcessMsg.sMsg);
        end;
        CM_DEALCANCEL: begin //1028
          ClientCancelDeal();
        end;
        CM_DEALCHGGOLD: begin //1029
          ClientChangeDealGold(ProcessMsg.nParam1);
        end;
        CM_DEALEND: begin //1030
          ClientDealEnd();
        end;
        CM_USERSTORAGEITEM: begin  //1031
          ClientStorageItem(TObject(ProcessMsg.nParam1),MakeLong(ProcessMsg.nParam2,ProcessMsg.nParam3),ProcessMsg.sMsg);
        end;
        CM_USERTAKEBACKSTORAGEITEM: begin //1032
          ClientTakeBackStorageItem(TObject(ProcessMsg.nParam1),MakeLong(ProcessMsg.nParam2,ProcessMsg.nParam3),ProcessMsg.sMsg);
        end;
        CM_WANTMINIMAP: begin //1033
          ClientGetMinMap();
        end;
        CM_USERMAKEDRUGITEM: begin //1034
          ClientMakeDrugItem(TObject(ProcessMsg.nParam1),ProcessMsg.sMsg);
        end;
        CM_OPENGUILDDLG: begin //1035
          ClientOpenGuildDlg();
        end;
        CM_GUILDHOME: begin //1036
          ClientGuildHome();
        end;
        CM_GUILDMEMBERLIST: begin
          ClientGuildMemberList();
        end;
        CM_GUILDADDMEMBER: begin
          ClientGuildAddMember(ProcessMsg.sMsg);
        end;
        CM_GUILDDELMEMBER: begin
          ClientGuildDelMember(ProcessMsg.sMsg);
        end;
        CM_GUILDUPDATENOTICE: begin
          ClientGuildUpdateNotice(ProcessMsg.sMsg);
        end;
        CM_GUILDUPDATERANKINFO: begin //1041
          ClientGuildUpdateRankInfo(ProcessMsg.sMsg);
        end;
        CM_1042: begin
          MainOutMessage('[非法数据] ' + m_sCharName);
        end;
        CM_ADJUST_BONUS: begin
          ClientAdjustBonus(ProcessMsg.nParam1,ProcessMsg.sMsg);
        end;
        CM_GUILDALLY: begin  //1044
          ClientGuildAlly();
        end;
        CM_GUILDBREAKALLY: begin //1045
          ClientGuildBreakAlly(ProcessMsg.sMsg);
        end;
{$IF CHECKNEWMSG = 1}
        CM_1046: begin
          MainOutMessage(format('%s/%d/%d/%d/%d/%d/%s',
                               [m_sCharName,
                                ProcessMsg.wIdent,
                                ProcessMsg.wParam,
                                ProcessMsg.nParam1,
                                ProcessMsg.nParam2,
                                ProcessMsg.nParam3,
                                DecodeString(ProcessMsg.sMsg)]));
        end;
        CM_1056: begin
          MainOutMessage(format('%s/%d/%d/%d/%d/%d/%s',
                               [m_sCharName,
                                ProcessMsg.wIdent,
                                ProcessMsg.wParam,
                                ProcessMsg.nParam1,
                                ProcessMsg.nParam2,
                                ProcessMsg.nParam3,
                                DecodeString(ProcessMsg.sMsg)]));
        end;
{$IFEND}
        CM_TURN: begin //3010    004D73DD
          if ClientChangeDir(ProcessMsg.wIdent,ProcessMsg.nParam1{x},ProcessMsg.nParam2{y},ProcessMsg.wParam{dir},dwDelayTime) then begin
            m_dwActionTick:=GetTickCount;
            SendSocket(nil,sSTATUS_GOOD + IntToStr(GetTickCount));
          end else begin
            if dwDelayTime = 0 then begin
              SendSocket(nil,sSTATUS_FAIL + IntToStr(GetTickCount))
            end else begin
              nMsgCount:=GetTurnMsgCount();
              if nMsgCount >= g_Config.nMaxTurnMsgCount then begin
                Inc(m_nOverSpeedCount);
                if m_nOverSpeedCount > g_Config.nOverSpeedKickCount then begin
                  if g_Config.boKickOverSpeed then begin
                    SysMsg(g_sKickClientUserMsg{'请勿使用非法软件！！！'},c_Red,t_Hint);
                    m_boEmergencyClose:=True;
                  end;
                  if g_Config.boViewHackMessage then begin
                    //MainOutMessage('[游戏超速] ' + m_sCharName + ' Time: ' + IntToStr(dwDelayTime) + ' Count: '+ IntToStr(nMsgCount));
                    MainOutMessage(format(g_sBunOverSpeed,[m_sCharName,dwDelayTime,nMsgCount]));
                  end;
                end;
                //如果超速则发送攻击失败信息
                SendSocket(nil,sSTATUS_FAIL + IntToStr(GetTickCount));
              end else begin
                if dwDelayTime < g_Config.dwDropOverSpeed then begin
                  SendSocket(nil,sSTATUS_GOOD + IntToStr(GetTickCount));
                  if m_boTestSpeedMode then
                     SysMsg(format('速度异常 Ident: %d Time: %d',[ProcessMsg.wIdent,dwDelayTime]),c_Red,t_Hint);
                end else begin
                  SendDelayMsg(Self,ProcessMsg.wIdent,ProcessMsg.wParam,ProcessMsg.nParam1,ProcessMsg.nParam2,ProcessMsg.nParam3,'',dwDelayTime);
                  Result:=False;
                end;
              end;
            end;
          end;
        end;
        CM_WALK: begin //3011
          if ClientWalkXY(ProcessMsg.wIdent,ProcessMsg.nParam1{x},ProcessMsg.nParam2{y},ProcessMsg.boLateDelivery,dwDelayTime) then begin
            m_dwActionTick:=GetTickCount;
            SendSocket(nil,sSTATUS_GOOD + IntToStr(GetTickCount));
            Inc(n5F8);
          end else begin
            if dwDelayTime = 0 then begin
              SendSocket(nil,sSTATUS_FAIL + IntToStr(GetTickCount))
            end else begin
              nMsgCount:=GetWalkMsgCount();
              if nMsgCount >= g_Config.nMaxWalkMsgCount then begin
                Inc(m_nOverSpeedCount);
                if m_nOverSpeedCount > g_Config.nOverSpeedKickCount then begin
                  if g_Config.boKickOverSpeed then begin
                    SysMsg(g_sKickClientUserMsg{'请勿使用非法软件！！！'},c_Red,t_Hint);
                    m_boEmergencyClose:=True;
                  end;
                  if g_Config.boViewHackMessage then begin
                    //MainOutMessage('[行走超速] ' + m_sCharName + ' Time: ' + IntToStr(dwDelayTime) + ' Count: '+ IntToStr(nMsgCount));
                    MainOutMessage(format(g_sWalkOverSpeed,[m_sCharName,dwDelayTime,nMsgCount]));
                  end;
                end;
                //如果超速则发送攻击失败信息
                SendSocket(nil,sSTATUS_FAIL + IntToStr(GetTickCount));
                if m_boTestSpeedMode then
                  SysMsg(format('速度异常 Ident: %d Time: %d',[ProcessMsg.wIdent,dwDelayTime]),c_Red,t_Hint);
              end else begin
                if (dwDelayTime > g_Config.dwDropOverSpeed) and (g_Config.btSpeedControlMode = 1) and  m_boFilterAction then begin
                  SendSocket(nil,sSTATUS_FAIL + IntToStr(GetTickCount));
                  if m_boTestSpeedMode then
                     SysMsg(format('速度异常 Ident: %d Time: %d',[ProcessMsg.wIdent,dwDelayTime]),c_Red,t_Hint);
                end else begin

                  if m_boTestSpeedMode then
                     SysMsg(format('操作延迟 Ident: %d Time: %d',[ProcessMsg.wIdent,dwDelayTime]),c_Red,t_Hint);
                  SendDelayMsg(Self,ProcessMsg.wIdent,ProcessMsg.wParam,ProcessMsg.nParam1,ProcessMsg.nParam2,ProcessMsg.nParam3,'',dwDelayTime);
                  Result:=False;
                end;
              end;
            end;
          end;
        end;
          
        CM_HORSERUN: begin //3009
          if ClientHorseRunXY(ProcessMsg.wIdent,ProcessMsg.nParam1{x},ProcessMsg.nParam2{y},ProcessMsg.boLateDelivery,dwDelayTime) then begin
            m_dwActionTick:=GetTickCount;
            SendSocket(nil,sSTATUS_GOOD + IntToStr(GetTickCount));
            Inc(n5F8);
          end else begin

            if dwDelayTime = 0 then begin
              SendSocket(nil,sSTATUS_FAIL + IntToStr(GetTickCount));
            end else begin
              nMsgCount:=GetRunMsgCount();
              if nMsgCount >= g_Config.nMaxRunMsgCount then begin
                Inc(m_nOverSpeedCount);
                if m_nOverSpeedCount > g_Config.nOverSpeedKickCount then begin
                  if g_Config.boKickOverSpeed then begin
                    SysMsg(g_sKickClientUserMsg{'请勿使用非法软件！！！'},c_Red,t_Hint);
                    m_boEmergencyClose:=True;
                  end;
                  if g_Config.boViewHackMessage then begin
                   //MainOutMessage('[跑步超速] ' + m_sCharName + ' Time: ' + IntToStr(dwDelayTime) + ' Count: '+ IntToStr(nMsgCount));
                   MainOutMessage(format(g_sRunOverSpeed,[m_sCharName,dwDelayTime,nMsgCount]));
                  end;

                end;
                //如果超速则发送攻击失败信息
                SendSocket(nil,sSTATUS_FAIL + IntToStr(GetTickCount));
                if m_boTestSpeedMode then
                  SysMsg(format('速度异常 Ident: %d Time: %d',[ProcessMsg.wIdent,dwDelayTime]),c_Red,t_Hint);
              end else begin
                if m_boTestSpeedMode then
                  SysMsg(format('操作延迟 Ident: %d Time: %d',[ProcessMsg.wIdent,dwDelayTime]),c_Red,t_Hint);
                SendDelayMsg(Self,ProcessMsg.wIdent,ProcessMsg.wParam,ProcessMsg.nParam1,ProcessMsg.nParam2,ProcessMsg.nParam3,'',dwDelayTime);
                Result:=False;
              end;
            end;

          end;
        end;
        CM_RUN: begin //3013
          if ClientRunXY(ProcessMsg.wIdent,ProcessMsg.nParam1{x},ProcessMsg.nParam2{y},ProcessMsg.nParam3,dwDelayTime) then begin
            m_dwActionTick:=GetTickCount;
            SendSocket(nil,sSTATUS_GOOD + IntToStr(GetTickCount));
            Inc(n5F8);
          end else begin
            if dwDelayTime = 0 then begin
              SendSocket(nil,sSTATUS_FAIL + IntToStr(GetTickCount));
            end else begin
              nMsgCount:=GetRunMsgCount();
              if nMsgCount >= g_Config.nMaxRunMsgCount then begin
                Inc(m_nOverSpeedCount);
                if m_nOverSpeedCount > g_Config.nOverSpeedKickCount then begin
                  if g_Config.boKickOverSpeed then begin
                    SysMsg(g_sKickClientUserMsg{'请勿使用非法软件！！！'},c_Red,t_Hint);
                    m_boEmergencyClose:=True;
                  end;
                  if g_Config.boViewHackMessage then begin
                    //MainOutMessage('[跑步超速] ' + m_sCharName + ' Time: ' + IntToStr(dwDelayTime) + ' Count: '+ IntToStr(nMsgCount));
                    MainOutMessage(format(g_sRunOverSpeed,[m_sCharName,dwDelayTime,nMsgCount]));
                  end;
                end;
                //如果超速则发送攻击失败信息
                SendSocket(nil,sSTATUS_FAIL + IntToStr(GetTickCount));
              end else begin
                if (dwDelayTime > g_Config.dwDropOverSpeed) and (g_Config.btSpeedControlMode = 1) and  m_boFilterAction then begin
                  SendSocket(nil,sSTATUS_FAIL + IntToStr(GetTickCount));
                  if m_boTestSpeedMode then
                     SysMsg(format('速度异常 Ident: %d Time: %d',[ProcessMsg.wIdent,dwDelayTime]),c_Red,t_Hint);
                end else begin
                  if m_boTestSpeedMode then
                     SysMsg(format('操作延迟 Ident: %d Time: %d',[ProcessMsg.wIdent,dwDelayTime]),c_Red,t_Hint);
                  SendDelayMsg(Self,ProcessMsg.wIdent,ProcessMsg.wParam,ProcessMsg.nParam1,ProcessMsg.nParam2,CM_RUN,'',dwDelayTime);
                  Result:=False;
                end;
              end;
            end;

          end;
        end;
        CM_HIT, //3014
        CM_HEAVYHIT,//3015
        CM_BIGHIT, //3016
        CM_POWERHIT, //3018
        CM_LONGHIT, //3019
        CM_WIDEHIT, //3024
        CM_CRSHIT,
        CM_TWINHIT,
        CM_FIREHIT: begin //3025  :004D75BC
          if ClientHitXY(ProcessMsg.wIdent{ident},ProcessMsg.nParam1{x},ProcessMsg.nParam2{y},ProcessMsg.wParam{dir},ProcessMsg.boLateDelivery,dwDelayTime) then begin
            m_dwActionTick:=GetTickCount;
            SendSocket(nil,sSTATUS_GOOD + IntToStr(GetTickCount));
            Inc(n5F8);
          end else begin
            if dwDelayTime = 0 then begin
              SendSocket(nil,sSTATUS_FAIL + IntToStr(GetTickCount));
            end else begin
              nMsgCount:=GetHitMsgCount();
              if nMsgCount >= g_Config.nMaxHitMsgCount then begin
                Inc(m_nOverSpeedCount);
                if m_nOverSpeedCount > g_Config.nOverSpeedKickCount then begin
                  if g_Config.boKickOverSpeed then begin
                    SysMsg(g_sKickClientUserMsg{'请勿使用非法软件！！！'},c_Red,t_Hint);
                    m_boEmergencyClose:=True;
                  end;
                  if g_Config.boViewHackMessage then begin
                    //MainOutMessage('[攻击超速] ' + m_sCharName + ' Time: ' + IntToStr(dwDelayTime) + ' Count: '+ IntToStr(nMsgCount));
                    MainOutMessage(format(g_sHitOverSpeed,[m_sCharName,dwDelayTime,nMsgCount]));
                  end;
                end;
                //如果超速则发送攻击失败信息
                SendSocket(nil,sSTATUS_FAIL + IntToStr(GetTickCount));
              end else begin
                if (dwDelayTime > g_Config.dwDropOverSpeed) and (g_Config.btSpeedControlMode = 1) and  m_boFilterAction then begin
                  SendSocket(nil,sSTATUS_GOOD + IntToStr(GetTickCount));
                  if m_boTestSpeedMode then
                     SysMsg(format('速度异常 Ident: %d Time: %d',[ProcessMsg.wIdent,dwDelayTime]),c_Red,t_Hint);
                end else begin
                  if m_boTestSpeedMode then begin
                     //SysMsg(format('操作延迟 Ident: %d Time: %d',[ProcessMsg.wIdent,dwDelayTime]),c_Red,t_Hint);
                     SysMsg('操作延迟 Ident: ' + IntToStr(ProcessMsg.wIdent) + ' Time: ' + IntToStr(dwDelayTime),c_Red,t_Hint);
                  end;
                  SendDelayMsg(Self,ProcessMsg.wIdent,ProcessMsg.wParam,ProcessMsg.nParam1,ProcessMsg.nParam2,ProcessMsg.nParam3,'',dwDelayTime);
                  Result:=False;
                end;
              end;
            end;
          end;
        end;
        CM_SITDOWN: begin //3012
          if ClientSitDownHit(ProcessMsg.nParam1,ProcessMsg.nParam2,ProcessMsg.wParam,dwDelayTime) then begin
            m_dwActionTick:=GetTickCount();
            SendSocket(nil,sSTATUS_GOOD + IntToStr(GetTickCount));
          end else begin
            if dwDelayTime = 0 then begin
              SendSocket(nil,sSTATUS_FAIL + IntToStr(GetTickCount));
            end else begin
              nMsgCount:=GetSiteDownMsgCount();
              if nMsgCount >= g_Config.nMaxSitDonwMsgCount then begin
                Inc(m_nOverSpeedCount);
                if m_nOverSpeedCount > g_Config.nOverSpeedKickCount then begin
                  if g_Config.boKickOverSpeed then begin
                    SysMsg(g_sKickClientUserMsg{'请勿使用非法软件！！！'},c_Red,t_Hint);
                    m_boEmergencyClose:=True;
                  end;
                  if g_Config.boViewHackMessage then begin
                    //MainOutMessage('[游戏超速] ' + m_sCharName + ' Time: ' + IntToStr(dwDelayTime) + ' Count: '+ IntToStr(nMsgCount));
                    MainOutMessage(format(g_sBunOverSpeed,[m_sCharName,dwDelayTime,nMsgCount]));
                  end;
                end;
                //如果超速则发送攻击失败信息
                SendSocket(nil,sSTATUS_FAIL + IntToStr(GetTickCount));
              end else begin
                if dwDelayTime < g_Config.dwDropOverSpeed then begin
                  SendSocket(nil,sSTATUS_GOOD + IntToStr(GetTickCount));
                  if m_boTestSpeedMode then
                     SysMsg(format('速度异常 Ident: %d Time: %d',[ProcessMsg.wIdent,dwDelayTime]),c_Red,t_Hint);
                end else begin
                  if m_boTestSpeedMode then
                     SysMsg(format('操作延迟 Ident: %d Time: %d',[ProcessMsg.wIdent,dwDelayTime]),c_Red,t_Hint);
                  SendDelayMsg(Self,ProcessMsg.wIdent,ProcessMsg.wParam,ProcessMsg.nParam1,ProcessMsg.nParam2,ProcessMsg.nParam3,'',dwDelayTime);
                  Result:=False;
                end;
              end;
            end;
          end;
        end;
        CM_SPELL: begin //3017  004D76FD
          if ClientSpellXY(ProcessMsg.wIdent,ProcessMsg.wParam,ProcessMsg.nParam1,ProcessMsg.nParam2,TBaseObject(ProcessMsg.nParam3),ProcessMsg.boLateDelivery,dwDelayTime) then begin
            m_dwActionTick:=GetTickCount;
            SendSocket(nil,sSTATUS_GOOD + IntToStr(GetTickCount));
            Inc(n5F8);
          end else begin
            if dwDelayTime = 0 then begin
              SendSocket(nil,sSTATUS_FAIL + IntToStr(GetTickCount));
            end else begin
              nMsgCount:=GetSpellMsgCount();
              if nMsgCount >= g_Config.nMaxSpellMsgCount then begin
                Inc(m_nOverSpeedCount);
                if m_nOverSpeedCount > g_Config.nOverSpeedKickCount then begin
                  if g_Config.boKickOverSpeed then begin
                    SysMsg(g_sKickClientUserMsg{'请勿使用非法软件！！！'},c_Red,t_Hint);
                    m_boEmergencyClose:=True;
                  end;
                  if g_Config.boViewHackMessage then begin
                    //MainOutMessage('[魔法超速] ' + m_sCharName + ' Time: ' + IntToStr(dwDelayTime) + ' Count: '+ IntToStr(nMsgCount));
                    MainOutMessage(format(g_sSpellOverSpeed,[m_sCharName,dwDelayTime,nMsgCount]));
                  end;
                end;
                //如果超速则发送攻击失败信息
                SendSocket(nil,sSTATUS_FAIL + IntToStr(GetTickCount));
              end else begin
                if (dwDelayTime > g_Config.dwDropOverSpeed) and (g_Config.btSpeedControlMode = 1) and  m_boFilterAction then begin
                  SendSocket(nil,sSTATUS_FAIL + IntToStr(GetTickCount));
                  if m_boTestSpeedMode then
                     SysMsg(format('速度异常 Ident: %d Time: %d',[ProcessMsg.wIdent,dwDelayTime]),c_Red,t_Hint);
                end else begin
                  if m_boTestSpeedMode then
                     SysMsg(format('操作延迟 Ident: %d Time: %d',[ProcessMsg.wIdent,dwDelayTime]),c_Red,t_Hint);
                  SendDelayMsg(Self,ProcessMsg.wIdent,ProcessMsg.wParam,ProcessMsg.nParam1,ProcessMsg.nParam2,ProcessMsg.nParam3,'',dwDelayTime);
                  Result:=False;
                end;
              end;
            end;
          end;
        end;


        CM_SAY: begin //3030
          if ProcessMsg.sMsg <> '' then begin
            ProcessUserLineMsg(ProcessMsg.sMsg);
          end;
        end;
        CM_PASSWORD: begin
          ProcessClientPassword(ProcessMsg);
        end;

        RM_WALK: begin //10002
          if TBaseObject(ProcessMsg.BaseObject) <> Self then begin
            m_DefMsg:=MakeDefaultMsg(SM_WALK,Integer(ProcessMsg.BaseObject),ProcessMsg.nParam1,ProcessMsg.nParam2,MakeWord(ProcessMsg.wParam, TBaseObject(ProcessMsg.BaseObject).m_nLight));
            CharDesc.feature:=TBaseObject(ProcessMsg.BaseObject).GetFeature(TBaseObject(ProcessMsg.BaseObject));
            CharDesc.Status:=TBaseObject(ProcessMsg.BaseObject).m_nCharStatus;
            SendSocket(@m_DefMsg,EncodeBuffer(@CharDesc,SizeOf(TCharDesc)));
          end;
        end;
        RM_HORSERUN: begin//10003 004D860A
          if TBaseObject(ProcessMsg.BaseObject) <> Self then begin
            m_DefMsg:=MakeDefaultMsg(SM_HORSERUN,Integer(ProcessMsg.BaseObject),ProcessMsg.nParam1,ProcessMsg.nParam2,MakeWord(ProcessMsg.wParam, TBaseObject(ProcessMsg.BaseObject).m_nLight));
            CharDesc.feature:=TBaseObject(ProcessMsg.BaseObject).GetFeature(TBaseObject(ProcessMsg.BaseObject));
            CharDesc.Status:=TBaseObject(ProcessMsg.BaseObject).m_nCharStatus;
            SendSocket(@m_DefMsg,EncodeBuffer(@CharDesc,SizeOf(TCharDesc)));
          end;
        end;
        RM_RUN: begin//10003 004D860A
          if TBaseObject(ProcessMsg.BaseObject) <> Self then begin
            m_DefMsg:=MakeDefaultMsg(SM_RUN,Integer(ProcessMsg.BaseObject),ProcessMsg.nParam1,ProcessMsg.nParam2,MakeWord(ProcessMsg.wParam, TBaseObject(ProcessMsg.BaseObject).m_nLight));
            CharDesc.feature:=TBaseObject(ProcessMsg.BaseObject).GetFeature(TBaseObject(ProcessMsg.BaseObject));
            CharDesc.Status:=TBaseObject(ProcessMsg.BaseObject).m_nCharStatus;
            SendSocket(@m_DefMsg,EncodeBuffer(@CharDesc,SizeOf(TCharDesc)));
          end;
        end;
        RM_HIT: begin //10004 004D871D
          if TBaseObject(ProcessMsg.BaseObject) <> Self then begin
            m_DefMsg:=MakeDefaultMsg(SM_HIT,Integer(ProcessMsg.BaseObject),ProcessMsg.nParam1,ProcessMsg.nParam2,ProcessMsg.wParam);
            SendSocket(@m_DefMsg,'');
          end;
        end;
        RM_HEAVYHIT: begin//004D88CD
          if TBaseObject(ProcessMsg.BaseObject) <> Self then begin
            m_DefMsg:=MakeDefaultMsg(SM_HEAVYHIT,Integer(ProcessMsg.BaseObject),ProcessMsg.nParam1,ProcessMsg.nParam2,ProcessMsg.wParam);
            SendSocket(@m_DefMsg,ProcessMsg.sMsg);
          end;
        end;
        RM_BIGHIT: begin//004D893A
          if TBaseObject(ProcessMsg.BaseObject) <> Self then begin
            m_DefMsg:=MakeDefaultMsg(SM_BIGHIT,Integer(ProcessMsg.BaseObject),ProcessMsg.nParam1,ProcessMsg.nParam2,ProcessMsg.wParam);
            SendSocket(@m_DefMsg,'');
          end;
        end;
        RM_SPELL: begin // 10007 004D8A12
          if TBaseObject(ProcessMsg.BaseObject) <> Self then begin
            m_DefMsg:=MakeDefaultMsg(SM_SPELL,Integer(ProcessMsg.BaseObject),ProcessMsg.nParam1,ProcessMsg.nParam2,ProcessMsg.wParam);
            SendSocket(@m_DefMsg,IntToStr(ProcessMsg.nParam3));
          end;
        end;
        RM_SPELL2: begin //10008 004D8789
          if TBaseObject(ProcessMsg.BaseObject) <> Self then begin
            m_DefMsg:=MakeDefaultMsg(SM_POWERHIT,Integer(ProcessMsg.BaseObject),ProcessMsg.nParam1,ProcessMsg.nParam2,ProcessMsg.wParam);
            SendSocket(@m_DefMsg,'');
          end;
        end;
        {
        RM_POWERHIT: begin

        end;
        }
        RM_MOVEFAIL: begin //10010 004D8289
          m_DefMsg:=MakeDefaultMsg(SM_MOVEFAIL,Integer(Self),m_nCurrX,m_nCurrY,m_btDirection);
          CharDesc.feature:=TBaseObject(ProcessMsg.BaseObject).GetFeatureToLong;
          CharDesc.Status:=TBaseObject(ProcessMsg.BaseObject).m_nCharStatus;
          SendSocket(@m_DefMsg,EncodeBuffer(@CharDesc,SizeOf(CharDesc)));
        end;
        RM_LONGHIT: begin //10011 004D87F5
          if TBaseObject(ProcessMsg.BaseObject) <> Self then begin
            m_DefMsg:=MakeDefaultMsg(SM_LONGHIT,Integer(ProcessMsg.BaseObject),ProcessMsg.nParam1,ProcessMsg.nParam2,ProcessMsg.wParam);
            SendSocket(@m_DefMsg,'');
          end;
        end;
        RM_WIDEHIT: begin//10012 004D8861
          if TBaseObject(ProcessMsg.BaseObject) <> Self then begin
            m_DefMsg:=MakeDefaultMsg(SM_WIDEHIT,Integer(ProcessMsg.BaseObject),ProcessMsg.nParam1,ProcessMsg.nParam2,ProcessMsg.wParam);
            SendSocket(@m_DefMsg,'');
          end;
        end;
        RM_FIREHIT: begin //10014 004D89A6
          if TBaseObject(ProcessMsg.BaseObject) <> Self then begin
            m_DefMsg:=MakeDefaultMsg(SM_FIREHIT,Integer(ProcessMsg.BaseObject),ProcessMsg.nParam1,ProcessMsg.nParam2,ProcessMsg.wParam);
            SendSocket(@m_DefMsg,'');
          end;
        end;
        RM_CRSHIT: begin //10014 004D89A6
          if TBaseObject(ProcessMsg.BaseObject) <> Self then begin
            m_DefMsg:=MakeDefaultMsg(SM_CRSHIT,Integer(ProcessMsg.BaseObject),ProcessMsg.nParam1,ProcessMsg.nParam2,ProcessMsg.wParam);
            SendSocket(@m_DefMsg,'');
          end;
        end;
        RM_41: begin //10014 004D89A6
          if TBaseObject(ProcessMsg.BaseObject) <> Self then begin
            m_DefMsg:=MakeDefaultMsg(SM_41,Integer(ProcessMsg.BaseObject),ProcessMsg.nParam1,ProcessMsg.nParam2,ProcessMsg.wParam);
            SendSocket(@m_DefMsg,'');
          end;
        end;
        RM_TWINHIT: begin //10014 004D89A6
          if TBaseObject(ProcessMsg.BaseObject) <> Self then begin
            m_DefMsg:=MakeDefaultMsg(SM_TWINHIT,Integer(ProcessMsg.BaseObject),ProcessMsg.nParam1,ProcessMsg.nParam2,ProcessMsg.wParam);
            SendSocket(@m_DefMsg,'');
          end;
        end;
        RM_43: begin //10014 004D89A6
          if TBaseObject(ProcessMsg.BaseObject) <> Self then begin
            m_DefMsg:=MakeDefaultMsg(SM_43,Integer(ProcessMsg.BaseObject),ProcessMsg.nParam1,ProcessMsg.nParam2,ProcessMsg.wParam);
            SendSocket(@m_DefMsg,'');
          end;
        end;
        RM_TURN,
        RM_PUSH,
        RM_RUSH,
        RM_RUSHKUNG: begin//004D831D
          if (TBaseObject(ProcessMsg.BaseObject) <> Self) or (ProcessMsg.wIdent = RM_PUSH) or (ProcessMsg.wIdent = RM_RUSH) or (ProcessMsg.wIdent = RM_RUSHKUNG) then begin
            case ProcessMsg.wIdent of
              RM_PUSH://004D835F
                m_DefMsg:=MakeDefaultMsg(SM_BACKSTEP,Integer(ProcessMsg.BaseObject),ProcessMsg.nParam1{x},ProcessMsg.nParam2{y},MakeWord(ProcessMsg.wParam{dir}, TBaseObject(ProcessMsg.BaseObject).m_nLight{light}));
              RM_RUSH://004D83B9
                m_DefMsg:=MakeDefaultMsg(SM_RUSH,Integer(ProcessMsg.BaseObject),ProcessMsg.nParam1,ProcessMsg.nParam2,MakeWord(ProcessMsg.wParam, TBaseObject(ProcessMsg.BaseObject).m_nLight));
              RM_RUSHKUNG://004D8413
                m_DefMsg:=MakeDefaultMsg(SM_RUSHKUNG,Integer(ProcessMsg.BaseObject),ProcessMsg.nParam1,ProcessMsg.nParam2,MakeWord(ProcessMsg.wParam, TBaseObject(ProcessMsg.BaseObject).m_nLight));
              else begin //004D846A
                m_DefMsg:=MakeDefaultMsg(SM_TURN,Integer(ProcessMsg.BaseObject),ProcessMsg.nParam1,ProcessMsg.nParam2,MakeWord(ProcessMsg.wParam, TBaseObject(ProcessMsg.BaseObject).m_nLight));
              end;
            end;
            CharDesc.feature:=TBaseObject(ProcessMsg.BaseObject).GetFeature(TBaseObject(ProcessMsg.BaseObject));
            CharDesc.Status:=TBaseObject(ProcessMsg.BaseObject).m_nCharStatus;
            s1C:=EncodeBuffer(@CharDesc,SizeOf(CharDesc));
            nObjCount:=GetCharColor(TBaseObject(ProcessMsg.BaseObject));
            if ProcessMsg.sMsg <> '' then
              s1C:=s1C + ( EncodeString(ProcessMsg.sMsg + '/' + IntToStr(nObjCount)));
            SendSocket(@m_DefMsg,s1C);
            if ProcessMsg.wIdent = RM_TURN then begin
              nObjCount:=TBaseObject(ProcessMsg.BaseObject).GetFeatureToLong();
              SendDefMessage(SM_FEATURECHANGED,
                             Integer(ProcessMsg.BaseObject),
                             LoWord(nObjCount),
                             HiWord(nObjCount),
                             TBaseObject(ProcessMsg.BaseObject).GetFeatureEx,
                             '');
            end;
          end;
        end;
        RM_STRUCK,
        RM_STRUCK_MAG: begin //10020 004D8B28
          if ProcessMsg.wParam{nPower} > 0 then begin
            if ProcessMsg.BaseObject = Self then begin
              if TBaseObject(ProcessMsg.nParam3){AttackBaseObject} <> nil then begin
                if TBaseObject(ProcessMsg.nParam3).m_btRaceServer = RC_PLAYOBJECT then begin
                  SetPKFlag(TBaseObject(ProcessMsg.nParam3){AttackBaseObject});
                end;
                SetLastHiter(TBaseObject(ProcessMsg.nParam3){AttackBaseObject});
                {
                //反复活
                if TBaseObject(ProcessMsg.nParam3).m_boUnRevival then
                  m_boRevival:=False;
                }
              end; //004D8B67
              if PKLevel >= 2 then m_dw5D4:=GetTickCount();
              //if UserCastle.IsMasterGuild(TGuild(m_MyGuild)) and (TBaseObject(ProcessMsg.nParam3) <> nil) then begin
              if (g_CastleManager.IsCastleMember(Self) <> nil) and (TBaseObject(ProcessMsg.nParam3) <> nil) then begin
                TBaseObject(ProcessMsg.nParam3).bo2B0:=True;
                TBaseObject(ProcessMsg.nParam3).m_dw2B4Tick:=GetTickCount();
              end;
              m_nHealthTick:=0;
              m_nSpellTick:=0;
              Dec(m_nPerHealth);
              Dec(m_nPerSpell);
              m_dwStruckTick:=GetTickCount();//09/10
            end; //4D8BE1
            if ProcessMsg.BaseObject <> nil then begin
              if ((ProcessMsg.BaseObject = Self) and (g_Config.boDisableSelfStruck)) or ((TBaseObject(ProcessMsg.BaseObject).m_btRaceServer = RC_PLAYOBJECT) and g_Config.boDisableStruck) then begin
                TBaseObject(ProcessMsg.BaseObject).SendRefMsg(RM_HEALTHSPELLCHANGED,0,0,0,0,'');
              end else begin
              m_DefMsg:=MakeDefaultMsg(SM_STRUCK,
                                       Integer(ProcessMsg.BaseObject),
                                       TBaseObject(ProcessMsg.BaseObject).m_WAbil.HP,
                                       TBaseObject(ProcessMsg.BaseObject).m_WAbil.MaxHP,
                                       ProcessMsg.wParam);
              MessageBodyWL.lParam1:=TBaseObject(ProcessMsg.BaseObject).GetFeature(Self);
              MessageBodyWL.lParam2:=TBaseObject(ProcessMsg.BaseObject).m_nCharStatus;
              MessageBodyWL.lTag1:=ProcessMsg.nParam3;
              if ProcessMsg.wIdent = RM_STRUCK_MAG then MessageBodyWL.lTag2:=1
              else MessageBodyWL.lTag2:=0;
              SendSocket(@m_DefMsg,EncodeBuffer(@MessageBodyWL,SizeOf(TMessageBodyWL)));
              end;
            end;
          end;
        end;
        RM_DEATH: begin //10021 004D8C9D
          if ProcessMsg.nParam3 = 1 then begin
              m_DefMsg:=MakeDefaultMsg(SM_NOWDEATH,
                                       Integer(ProcessMsg.BaseObject),
                                       ProcessMsg.nParam1,
                                       ProcessMsg.nParam2,
                                       ProcessMsg.wParam);

          if (ProcessMsg.BaseObject = Self) then begin
            if (g_FunctionNPC <> nil) then
              g_FunctionNPC.GotoLable(Self,'@OnDeath',False);
          end;

          end else begin
              m_DefMsg:=MakeDefaultMsg(SM_DEATH,
                                       Integer(ProcessMsg.BaseObject),
                                       ProcessMsg.nParam1,
                                       ProcessMsg.nParam2,
                                       ProcessMsg.wParam);
          end;
          CharDesc.feature:=TBaseObject(ProcessMsg.BaseObject).GetFeature(Self);
          CharDesc.Status:=TBaseObject(ProcessMsg.BaseObject).m_nCharStatus;
          SendSocket(@m_DefMsg,EncodeBuffer(@CharDesc,SizeOf(TCharDesc)));
        end;
        RM_DISAPPEAR: begin //10022 004D915C
          m_DefMsg:=MakeDefaultMsg(SM_DISAPPEAR,
                                   Integer(ProcessMsg.BaseObject),
                                   0,0,0);
          SendSocket(@m_DefMsg,'');
        end;
        RM_SKELETON: begin //10024 004D8D7B
              m_DefMsg:=MakeDefaultMsg(SM_SKELETON,
                                       Integer(ProcessMsg.BaseObject),
                                       ProcessMsg.nParam1,
                                       ProcessMsg.nParam2,
                                       ProcessMsg.wParam);
          CharDesc.feature:=TBaseObject(ProcessMsg.BaseObject).GetFeature(Self);
          CharDesc.Status:=TBaseObject(ProcessMsg.BaseObject).m_nCharStatus;
          SendSocket(@m_DefMsg,EncodeBuffer(@CharDesc,SizeOf(TCharDesc)));
        end;
        RM_USERNAME: begin //10043 004D9587
          m_DefMsg:=MakeDefaultMsg(SM_USERNAME,
                                   Integer(ProcessMsg.BaseObject),
                                   GetCharColor(TBaseObject(ProcessMsg.BaseObject)),0,0);
          SendSocket(@m_DefMsg,EncodeString(ProcessMsg.sMsg));
        end;

        RM_WINEXP: begin //10044 004D95FE
          m_DefMsg:=MakeDefaultMsg(SM_WINEXP,m_Abil.Exp,LoWord(ProcessMsg.nParam1),HiWord(ProcessMsg.nParam1),0);
          SendSocket(@m_DefMsg,'');
        end;
        RM_LEVELUP: begin //10045 004D965B
          m_DefMsg:=MakeDefaultMsg(SM_LEVELUP,m_Abil.Exp,m_Abil.Level,0,0);
          SendSocket(@m_DefMsg,'');
          m_DefMsg:=MakeDefaultMsg(SM_ABILITY,m_nGold,MakeWord(m_btJob,99),LoWord(m_nGameGold),HiWord(m_nGameGold));
          //0806 增加
          if (m_nSoftVersionDateEx = 0) and (m_dwClientTick = 0) then begin
            GetOldAbil(OAbility);
            SendSocket(@m_DefMsg,EncodeBuffer(@OAbility,SizeOf(TOAbility)));
          end else begin
            SendSocket(@m_DefMsg,EncodeBuffer(@m_WAbil,SizeOf(TAbility)));
          end;

          //SendSocket(@m_DefMsg,EncodeBuffer(@m_WAbil,SizeOf(TAbility)));
          SendDefMessage(SM_SUBABILITY,
                         MakeLong(MakeWord(m_nAntiMagic,0),0),
                         MakeWord(m_btHitPoint,m_btSpeedPoint),
                         MakeWord(m_btAntiPoison,m_nPoisonRecover),
                         MakeWord(m_nHealthRecover,m_nSpellRecover),
                         '');
        end;
        RM_CHANGENAMECOLOR: begin //10046 004D9555
          SendDefMessage(SM_CHANGENAMECOLOR,
                         Integer(ProcessMsg.BaseObject),
                         GetCharColor(TBaseObject(ProcessMsg.BaseObject)),
                         0,
                         0,
                         '');
        end;
        RM_LOGON: begin //10050
          m_DefMsg:=MakeDefaultMsg(SM_NEWMAP,Integer(Self),m_nCurrX,m_nCurrY,DayBright());
          SendSocket(@m_DefMsg,EncodeString(m_sMapName));
          SendMsg(Self,RM_CHANGELIGHT,0,0,0,0,'');
          SendLogon();
          SendServerConfig();
          ClientQueryUserName(Self,m_nCurrX,m_nCurrY);
          RefUserState();
          SendMapDescription();

          SendGoldInfo(True);
          //SendDefMessage(SM_GAMEGOLDNAME,m_nGameGold,LoWord(m_nGamePoint),HiWord(m_nGamePoint),0,g_Config.sGameGoldName + #13 + g_Config.sGamePointName);

          m_DefMsg:=MakeDefaultMsg(SM_VERSION_FAIL,g_Config.nClientFile1_CRC,LoWord(g_Config.nClientFile2_CRC),HiWord(g_Config.nClientFile2_CRC),0);
          SendSocket(@m_DefMsg,EncodeBuffer(@g_Config.nClientFile3_CRC,SizeOf(Integer)));
        end;
        RM_HEAR,
        RM_WHISPER,
        RM_CRY,
        RM_SYSMESSAGE,
        RM_GROUPMESSAGE,
        RM_SYSMESSAGE2,
        RM_GUILDMESSAGE,
        RM_SYSMESSAGE3,
        RM_MERCHANTSAY: begin
          {
          case ProcessMsg.wIdent of    //004D97B3
            RM_HEAR: m_DefMsg:=MakeDefaultMsg(SM_HEAR,Integer(ProcessMsg.BaseObject),MakeWord($0,$FF),0,1);//10030
//            RM_WHISPER: m_DefMsg:=MakeDefaultMsg(SM_WHISPER,Integer(ProcessMsg.BaseObject),MakeWord($FC,$FF),0,1);//10031
            RM_WHISPER: m_DefMsg:=MakeDefaultMsg(SM_WHISPER,Integer(ProcessMsg.BaseObject),MakeWord($FF,$38),0,1);//10031
            RM_CRY: m_DefMsg:=MakeDefaultMsg(SM_HEAR,Integer(ProcessMsg.BaseObject),MakeWord($0,$97),0,1);//10032
            RM_SYSMESSAGE: m_DefMsg:=MakeDefaultMsg(SM_SYSMESSAGE,Integer(ProcessMsg.BaseObject),MakeWord($FF,$38),0,1);//10100 红色
            RM_GROUPMESSAGE: m_DefMsg:=MakeDefaultMsg(SM_SYSMESSAGE,Integer(ProcessMsg.BaseObject),MakeWord($C4,$FF),0,1);//10102
            RM_SYSMESSAGE2: m_DefMsg:=MakeDefaultMsg(SM_SYSMESSAGE,Integer(ProcessMsg.BaseObject),MakeWord($DB,$FF),0,1);//10103
            RM_GUILDMESSAGE: m_DefMsg:=MakeDefaultMsg(SM_GUILDMESSAGE,Integer(ProcessMsg.BaseObject),MakeWord($DB,$FF),0,1); //10104
            RM_SYSMESSAGE3: m_DefMsg:=MakeDefaultMsg(SM_GUILDMESSAGE,Integer(ProcessMsg.BaseObject),MakeWord($FF,$FC),0,1);//10105
            RM_MERCHANTSAY: m_DefMsg:=MakeDefaultMsg(SM_MERCHANTSAY,Integer(ProcessMsg.BaseObject),0,0,1);//10126
          end;
          }
          case ProcessMsg.wIdent of    //004D97B3
            RM_HEAR: m_DefMsg:=MakeDefaultMsg(SM_HEAR,Integer(ProcessMsg.BaseObject),MakeWord(ProcessMsg.nParam1,ProcessMsg.nParam2),0,1);//10030
            RM_WHISPER: m_DefMsg:=MakeDefaultMsg(SM_WHISPER,Integer(ProcessMsg.BaseObject),MakeWord(ProcessMsg.nParam1,ProcessMsg.nParam2),0,1);//10031
            RM_CRY: m_DefMsg:=MakeDefaultMsg(SM_HEAR,Integer(ProcessMsg.BaseObject),MakeWord(ProcessMsg.nParam1,ProcessMsg.nParam2),0,1);//10032
            RM_SYSMESSAGE: m_DefMsg:=MakeDefaultMsg(SM_SYSMESSAGE,Integer(ProcessMsg.BaseObject),MakeWord(ProcessMsg.nParam1,ProcessMsg.nParam2),0,1);//10100 红色

            //RM_SYSMESSAGE2: m_DefMsg:=MakeDefaultMsg(SM_SYSMESSAGE,Integer(ProcessMsg.BaseObject),MakeWord($DB,$FF),0,1);//10103
            //RM_SYSMESSAGE3: m_DefMsg:=MakeDefaultMsg(SM_GUILDMESSAGE,Integer(ProcessMsg.BaseObject),MakeWord($FF,$FC),0,1);//10105

            RM_GROUPMESSAGE: m_DefMsg:=MakeDefaultMsg(SM_SYSMESSAGE,Integer(ProcessMsg.BaseObject),MakeWord(ProcessMsg.nParam1,ProcessMsg.nParam2),0,1);//10102
            RM_GUILDMESSAGE: m_DefMsg:=MakeDefaultMsg(SM_GUILDMESSAGE,Integer(ProcessMsg.BaseObject),MakeWord(ProcessMsg.nParam1,ProcessMsg.nParam2),0,1); //10104
            RM_MERCHANTSAY: m_DefMsg:=MakeDefaultMsg(SM_MERCHANTSAY,Integer(ProcessMsg.BaseObject),MakeWord(ProcessMsg.nParam1,ProcessMsg.nParam2),0,1);//10126
          end;
          SendSocket(@m_DefMsg,EncodeString(ProcessMsg.sMsg));
        end;
        {
        RM_ABILITY: begin //10051
          m_DefMsg:=MakeDefaultMsg(SM_ABILITY,
                                 m_nGold,
                                 m_btJob,
                                 0,
                                 0);
          SendSocket(@m_DefMsg,EncodeBuffer(@m_WAbil,SizeOf(TAbility)));
        end;
        }
        RM_ABILITY: begin //10051
          m_DefMsg:=MakeDefaultMsg(SM_ABILITY,
                                 m_nGold,
                                 MakeWord(m_btJob,99),
                                 LoWord(m_nGameGold),
                                 HiWord(m_nGameGold));
          if (m_nSoftVersionDateEx = 0) and (m_dwClientTick = 0) then begin
            GetOldAbil(OAbility);
            SendSocket(@m_DefMsg,EncodeBuffer(@OAbility,SizeOf(TOAbility)));
            if g_Config.boOldClientShowHiLevel and (m_Abil.Level > 255) then begin
              SysMsg(g_sClientVersionTooOld{'由于您使用的客户端版本太老了，无法正确显示人物信息！！！'},c_Red,t_Hint);
              SysMsg('Level: ' + IntToStr(m_Abil.Level),c_Green,t_Hint);
              SysMsg('HP: ' + IntToStr(m_WAbil.HP) + '-' + IntToStr(m_WAbil.MaxHP),c_Blue,t_Hint);
              SysMsg('MP: ' + IntToStr(m_WAbil.MP) + '-' + IntToStr(m_WAbil.MaxMP),c_Red,t_Hint);
              SysMsg('AC: ' + IntToStr(LoWord(m_WAbil.AC)) + '-' + IntToStr(HiWord(m_WAbil.AC)),c_Green,t_Hint);
              SysMsg('MAC: ' + IntToStr(LoWord(m_WAbil.MAC)) + '-' + IntToStr(HiWord(m_WAbil.MAC)),c_Blue,t_Hint);
              SysMsg('DC: ' + IntToStr(LoWord(m_WAbil.DC)) + '-' + IntToStr(HiWord(m_WAbil.DC)),c_Red,t_Hint);
              SysMsg('MC: ' + IntToStr(LoWord(m_WAbil.MC)) + '-' + IntToStr(HiWord(m_WAbil.MC)),c_Green,t_Hint);
              SysMsg('SC: ' + IntToStr(LoWord(m_WAbil.SC)) + '-' + IntToStr(HiWord(m_WAbil.SC)),c_Blue,t_Hint);
            end;
          end else begin
            SendSocket(@m_DefMsg,EncodeBuffer(@m_WAbil,SizeOf(TAbility)));
          end;
        end;
        RM_HEALTHSPELLCHANGED: begin //10052
          m_DefMsg:=MakeDefaultMsg(SM_HEALTHSPELLCHANGED,
                                 Integer(ProcessMsg.BaseObject),
                                 TBaseObject(ProcessMsg.BaseObject).m_WAbil.HP,
                                 TBaseObject(ProcessMsg.BaseObject).m_WAbil.MP,
                                 TBaseObject(ProcessMsg.BaseObject).m_WAbil.MaxHP);
          SendSocket(@m_DefMsg,'');
        end;
        RM_DAYCHANGING: begin //10053
          m_DefMsg:=MakeDefaultMsg(SM_DAYCHANGING,0,m_btBright,DayBright(),0);
          SendSocket(@m_DefMsg,'');
        end;
        RM_ITEMSHOW: begin //10110 004D9D01
          SendDefMessage(SM_ITEMSHOW,
                         ProcessMsg.nParam1,
                         ProcessMsg.nParam2,
                         ProcessMsg.nParam3,
                         ProcessMsg.wParam,
                         ProcessMsg.sMsg);
        end;
        RM_ITEMHIDE: begin //10111 004D9D27
          SendDefMessage(SM_ITEMHIDE,
                         ProcessMsg.nParam1,
                         ProcessMsg.nParam2,
                         ProcessMsg.nParam3,
                         0,
                         '');
        end;
        RM_DOOROPEN: begin //10112 004D9D6A
          SendDefMessage(SM_OPENDOOR_OK,
                         0,
                         ProcessMsg.nParam1,{x}
                         ProcessMsg.nParam2,{y}
                         0,
                         '');
        end;
        RM_DOORCLOSE: begin //10113 004D9D8A
          SendDefMessage(SM_CLOSEDOOR,
                         0,
                         ProcessMsg.nParam1,
                         ProcessMsg.nParam2,
                         0,
                         '');
        end;
        RM_SENDUSEITEMS: SendUseitems();
        RM_WEIGHTCHANGED: begin //10115 004D9DC4
          SendDefMessage(SM_WEIGHTCHANGED,
                         m_WAbil.Weight,
                         m_WAbil.WearWeight,
                         m_WAbil.HandWeight,
                         0,
                         '');
        end;
        RM_FEATURECHANGED: begin //10116 004D9E1A
          SendDefMessage(SM_FEATURECHANGED,
                         Integer(ProcessMsg.BaseObject),
                         LoWord(ProcessMsg.nParam1),
                         HiWord(ProcessMsg.nParam1),
                         ProcessMsg.wParam,
                         '');
        end;
        RM_CLEAROBJECTS: begin //10117 004D9E71
          SendDefMessage(SM_CLEAROBJECTS,
                         0,
                         0,
                         0,
                         0,
                         '');
        end;

        RM_CHANGEMAP: begin
          SendDefMessage(SM_CHANGEMAP,Integer(Self),m_nCurrX,m_nCurrY,DayBright(),ProcessMsg.sMsg);
          RefUserState();
          SendMapDescription();
          SendServerConfig();
        end;
        RM_BUTCH: begin //10119 004D86B1
          if ProcessMsg.BaseObject <> nil then begin
            m_DefMsg:=MakeDefaultMsg(SM_BUTCH,
                                 Integer(ProcessMsg.BaseObject),
                                 ProcessMsg.nParam1,
                                 ProcessMsg.nParam2,
                                 ProcessMsg.wParam);
            SendSocket(@m_DefMsg,'');
          end;

        end;
        RM_MAGICFIRE: begin //10120 004D8A90
          m_DefMsg:=MakeDefaultMsg(SM_MAGICFIRE,
                                 Integer(ProcessMsg.BaseObject),
                                 LoWord(ProcessMsg.nParam2),
                                 HiWord(ProcessMsg.nParam2),
                                 ProcessMsg.nParam1);
          SendSocket(@m_DefMsg,EncodeBuffer(@ProcessMsg.nParam3,SizeOf(Integer)));
        end;
        RM_MAGICFIREFAIL: begin //10121
          SendDefMessage(SM_MAGICFIRE_FAIL,Integer(ProcessMsg.BaseObject),0,0,0,'');
        end;
        RM_SENDMYMAGIC: SendUseMagic;//10122
        RM_MAGIC_LVEXP: begin //10123 004D9E8D
          SendDefMessage(SM_MAGIC_LVEXP,
                         ProcessMsg.nParam1,
                         ProcessMsg.nParam2,
                         LoWord(ProcessMsg.nParam3),
                         HiWord(ProcessMsg.nParam3),
                          '');
        end;
        RM_DURACHANGE: begin //10125 004D9EB9
          SendDefMessage(SM_DURACHANGE,
                         ProcessMsg.nParam1,
                         ProcessMsg.wParam,
                         LoWord(ProcessMsg.nParam2),
                         HiWord(ProcessMsg.nParam2),
                          '');
        end;
        RM_MERCHANTDLGCLOSE: begin  //10127 004D9ADF
          SendDefMessage(SM_MERCHANTDLGCLOSE,
                         ProcessMsg.nParam1,
                         0,
                         0,
                         0,
                          '');
        end;
        RM_SENDGOODSLIST: begin  //10128 004D9AFC
          SendDefMessage(SM_SENDGOODSLIST,
                         ProcessMsg.nParam1,
                         ProcessMsg.nParam2,
                         0,
                         0,
                         ProcessMsg.sMsg);
        end;
        RM_SENDUSERSELL: begin  //10129 004D9B1D
          SendDefMessage(SM_SENDUSERSELL,
                         ProcessMsg.nParam1,
                         ProcessMsg.nParam2,
                         0,
                         0,
                         ProcessMsg.sMsg);
        end;
        RM_SENDBUYPRICE: begin //10130  004D9BAB
          SendDefMessage(SM_SENDBUYPRICE,
                         ProcessMsg.nParam1,
                         0,
                         0,
                         0,
                          '');
        end;
        RM_USERSELLITEM_OK: begin //10131  004D9BC8
          SendDefMessage(SM_USERSELLITEM_OK,
                         ProcessMsg.nParam1,
                         0,
                         0,
                         0,
                          '');
        end;
        RM_USERSELLITEM_FAIL: begin //10132  004D9BC8
          SendDefMessage(SM_USERSELLITEM_FAIL,
                         ProcessMsg.nParam1,
                         0,
                         0,
                         0,
                          '');
        end;
        RM_BUYITEM_SUCCESS: begin //10133  004D9C02
          SendDefMessage(SM_BUYITEM_SUCCESS,
                         ProcessMsg.nParam1,
                         LoWord(ProcessMsg.nParam2),
                         HiWord(ProcessMsg.nParam2),
                         0,
                          '');
        end;
        RM_BUYITEM_FAIL: begin //10134  004D9C2C
          SendDefMessage(SM_BUYITEM_FAIL,
                         ProcessMsg.nParam1,
                         0,
                         0,
                         0,
                          '');
        end;
        RM_SENDDETAILGOODSLIST: begin //10135  004D9C83
          SendDefMessage(SM_SENDDETAILGOODSLIST,
                         ProcessMsg.nParam1,
                         ProcessMsg.nParam2,
                         ProcessMsg.nParam3,
                         0,
                         ProcessMsg.sMsg);
        end;
        RM_GOLDCHANGED: begin //10136  004D9DFA
          SendDefMessage(SM_GOLDCHANGED,
                         m_nGold,
                         LoWord(m_nGameGold),
                         HiWord(m_nGameGold),
                         0,
                          '');
        end;
        RM_GAMEGOLDCHANGED: begin
          SendGoldInfo(False);
          {
          SendDefMessage(SM_GAMEGOLDNAME,
                         m_nGameGold,
                         LoWord(m_nGamePoint),
                         HiWord(m_nGamePoint),
                         0,
                         '');
          }
        end;
        RM_CHANGELIGHT: begin //10137  004D9EE6
          SendDefMessage(SM_CHANGELIGHT,
                         Integer(ProcessMsg.BaseObject),
                         TBaseObject(ProcessMsg.BaseObject).m_nLight,
                         g_Config.nClientKey,
                         0,
                          '');
        end;
        RM_LAMPCHANGEDURA: begin //10138 004D9F0B
          SendDefMessage(SM_LAMPCHANGEDURA,
                         ProcessMsg.nParam1,
                         0,
                         0,
                         0,
                          '');
        end;
        RM_CHARSTATUSCHANGED: begin //10139 004D9E44
          SendDefMessage(SM_CHARSTATUSCHANGED,
                         Integer(ProcessMsg.BaseObject),
                         LoWord(ProcessMsg.nParam1),
                         HiWord(ProcessMsg.nParam1),
                         ProcessMsg.wParam,
                          '');
        end;
        RM_GROUPCANCEL: begin //10140 004D9F28
          SendDefMessage(SM_GROUPCANCEL,
                         ProcessMsg.nParam1,
                         0,
                         0,
                         0,
                          '');
        end;
        RM_SENDUSERREPAIR,
        RM_SENDUSERSREPAIR: begin //10141 004D9B3C
          SendDefMessage(SM_SENDUSERREPAIR,
                         ProcessMsg.nParam1,
                         ProcessMsg.nParam2,
                         0,
                         0,
                         '');
        end;
        RM_USERREPAIRITEM_OK: begin //10143  004D9CA6
          SendDefMessage(SM_USERREPAIRITEM_OK,
                         ProcessMsg.nParam1,
                         ProcessMsg.nParam2,
                         ProcessMsg.nParam3,
                         0,
                         '');
        end;
        RM_SENDREPAIRCOST: begin //10142  004D9CE4
          SendDefMessage(SM_SENDREPAIRCOST,
                         ProcessMsg.nParam1,
                         0,
                         0,
                         0,
                          '');
        end;
        RM_USERREPAIRITEM_FAIL: begin //10144  004D9CC7
          SendDefMessage(SM_USERREPAIRITEM_FAIL,
                         ProcessMsg.nParam1,
                         0,
                         0,
                         0,
                          '');
        end;
        RM_USERSTORAGEITEM: begin //10146  004D9B5B
          SendDefMessage(SM_SENDUSERSTORAGEITEM,
                         ProcessMsg.nParam1,
                         ProcessMsg.nParam2,
                         0,
                         0,
                         '');
        end;
        RM_USERGETBACKITEM: begin //10147  004D9B7A  SM_SAVEITEMLIST
          SendSaveItemList(ProcessMsg.nParam1);
        end;
        RM_SENDDELITEMLIST: begin //10148  004D9D48  //SM_DELITEMS
          SendDelItemList(TStringList(ProcessMsg.nParam1));
          TStringList(ProcessMsg.nParam1).Free;
        end;
        RM_USERMAKEDRUGITEMLIST: begin //10149  004D9B8A
          SendDefMessage(SM_SENDUSERMAKEDRUGITEMLIST,
                         ProcessMsg.nParam1,
                         ProcessMsg.nParam2,
                         0,
                         0,
                         ProcessMsg.sMsg);
        end;
        RM_MAKEDRUG_SUCCESS: begin //10150 004D9C49
          SendDefMessage(SM_MAKEDRUG_SUCCESS,
                         ProcessMsg.nParam1,
                         0,
                         0,
                         0,
                          '');
        end;
        RM_MAKEDRUG_FAIL: begin //10151 004D9C66
          SendDefMessage(SM_MAKEDRUG_FAIL,
                         ProcessMsg.nParam1,
                         0,
                         0,
                         0,
                          '');
        end;
        RM_ALIVE: begin //10153 004D8E09
          m_DefMsg:=MakeDefaultMsg(SM_ALIVE,
                                   Integer(ProcessMsg.BaseObject),
                                   ProcessMsg.nParam1,
                                   ProcessMsg.nParam2,
                                   ProcessMsg.wParam);
          CharDesc.feature:=TBaseObject(ProcessMsg.BaseObject).GetFeature(Self);
          CharDesc.Status:=TBaseObject(ProcessMsg.BaseObject).m_nCharStatus;
          SendSocket(@m_DefMsg,EncodeBuffer(@CharDesc,SizeOf(TCharDesc)));
        end;
        RM_DIGUP: begin //10200 004D91B4
          m_DefMsg:=MakeDefaultMsg(SM_DIGUP,
                                   Integer(ProcessMsg.BaseObject),
                                   ProcessMsg.nParam1,
                                   ProcessMsg.nParam2,
                                   MakeWord(ProcessMsg.wParam,TBaseObject(ProcessMsg.BaseObject).m_nLight));
          MessageBodyWL.lParam1:=TBaseObject(ProcessMsg.BaseObject).GetFeature(Self);
          MessageBodyWL.lParam2:=TBaseObject(ProcessMsg.BaseObject).m_nCharStatus;
          MessageBodyWL.lTag1:=ProcessMsg.nParam3;
          MessageBodyWL.lTag1:=0;
          s1C:=EncodeBuffer(@MessageBodyWL,SizeOf(TMessageBodyWL));
          SendSocket(@m_DefMsg,s1C);
        end;
        RM_DIGDOWN: begin //10201 004D9254
          m_DefMsg:=MakeDefaultMsg(SM_DIGDOWN,
                                   Integer(ProcessMsg.BaseObject),
                                   ProcessMsg.nParam1,
                                   ProcessMsg.nParam2,
                                   0);
          SendSocket(@m_DefMsg,'');
        end;
        RM_FLYAXE: begin  //10202 004D9358
          if TBaseObject(ProcessMsg.nParam3) <> nil then begin
            MessageBodyW.Param1:=TBaseObject(ProcessMsg.nParam3).m_nCurrX;
            MessageBodyW.Param2:=TBaseObject(ProcessMsg.nParam3).m_nCurrY;
            MessageBodyW.Tag1:=LoWord(ProcessMsg.nParam3);
            MessageBodyW.Tag2:=HiWord(ProcessMsg.nParam3);
            m_DefMsg:=MakeDefaultMsg(SM_FLYAXE,
                                     Integer(ProcessMsg.BaseObject),
                                     ProcessMsg.nParam1,
                                     ProcessMsg.nParam2,
                                     ProcessMsg.wParam);
            SendSocket(@m_DefMsg,EncodeBuffer(@MessageBodyW,SizeOf(TMessageBodyW)));
          end;


        end;
        RM_LIGHTING: begin //10204 004D93FD
          if TBaseObject(ProcessMsg.nParam3) <> nil then begin
            MessageBodyWL.lParam1:=TBaseObject(ProcessMsg.nParam3).m_nCurrX;
            MessageBodyWL.lParam2:=TBaseObject(ProcessMsg.nParam3).m_nCurrY;
            MessageBodyWL.lTag1:=ProcessMsg.nParam3;
            MessageBodyWL.lTag2:=ProcessMsg.wParam;
            m_DefMsg:=MakeDefaultMsg(SM_LIGHTING,
                                     Integer(ProcessMsg.BaseObject),
                                     ProcessMsg.nParam1,
                                     ProcessMsg.nParam2,
                                     TBaseObject(ProcessMsg.BaseObject).m_btDirection);
            SendSocket(@m_DefMsg,EncodeBuffer(@MessageBodyWL,SizeOf(TMessageBodyWL)));
          end;
        end;
        RM_10205: begin //10205 004D949A
          SendDefMessage(SM_716,
                         Integer(ProcessMsg.BaseObject),
                         ProcessMsg.nParam1{x},
                         ProcessMsg.nParam2{y},
                         ProcessMsg.nParam3{type},
                         '');
        end;
        RM_CHANGEGUILDNAME: begin //10301 004D9F44  SM_CHANGEGUILDNAME
          SendChangeGuildName();
        end;
        RM_SUBABILITY: begin //10302
          SendDefMessage(SM_SUBABILITY,
                       MakeLong(MakeWord(m_nAntiMagic,0),0),
                       MakeWord(m_btHitPoint,m_btSpeedPoint),
                       MakeWord(m_btAntiPoison,m_nPoisonRecover),
                       MakeWord(m_nHealthRecover,m_nSpellRecover),
                       '');

        end;
        RM_BUILDGUILD_OK: begin //10303 004D9F51
          SendDefMessage(SM_BUILDGUILD_OK,
                         0,
                         0,
                         0,
                         0,
                          '');
        end;
        RM_BUILDGUILD_FAIL: begin //10304 004D9F6D
          SendDefMessage(SM_BUILDGUILD_FAIL,
                         ProcessMsg.nParam1,
                         0,
                         0,
                         0,
                          '');
        end;
        RM_DONATE_OK: begin //10305 004D9FA7
          SendDefMessage(SM_DONATE_OK,
                         ProcessMsg.nParam1,
                         0,
                         0,
                         0,
                          '');
        end;
        RM_DONATE_FAIL: begin //10306 004D9F8A
          SendDefMessage(SM_DONATE_FAIL,
                         ProcessMsg.nParam1,
                         0,
                         0,
                         0,
                          '');
        end;
        RM_MYSTATUS: begin
          SendDefMessage(SM_MYSTATUS,0,GetMyStatus,0,0,'');
        end;
        RM_MENU_OK: begin //10309  004D9FC4
          SendDefMessage(SM_MENU_OK,
                         ProcessMsg.nParam1,
                         0,
                         0,
                         0,
                         ProcessMsg.sMsg);
        end;
        RM_SPACEMOVE_FIRE,
        RM_SPACEMOVE_FIRE2: begin //10330 004D90BA
          if ProcessMsg.wIdent = RM_SPACEMOVE_FIRE then begin
            m_DefMsg:=MakeDefaultMsg(SM_SPACEMOVE_HIDE,
                                   Integer(ProcessMsg.BaseObject),
                                   0,
                                   0,
                                   0);
          end else begin
            m_DefMsg:=MakeDefaultMsg(SM_SPACEMOVE_HIDE2,
                                   Integer(ProcessMsg.BaseObject),
                                   0,
                                   0,
                                   0);
          end;
          SendSocket(@m_DefMsg,'');
        end;
        RM_SPACEMOVE_SHOW,
        RM_SPACEMOVE_SHOW2: begin  //004D8F62
          if ProcessMsg.wIdent = RM_SPACEMOVE_SHOW then begin
            m_DefMsg:=MakeDefaultMsg(SM_SPACEMOVE_SHOW,
                                   Integer(ProcessMsg.BaseObject),
                                   ProcessMsg.nParam1,
                                   ProcessMsg.nParam2,
                                   MakeWord(ProcessMsg.wParam,TBaseObject(ProcessMsg.BaseObject).m_nLight));
          end else begin
            m_DefMsg:=MakeDefaultMsg(SM_SPACEMOVE_SHOW2,
                                   Integer(ProcessMsg.BaseObject),
                                   ProcessMsg.nParam1,
                                   ProcessMsg.nParam2,
                                   MakeWord(ProcessMsg.wParam,TBaseObject(ProcessMsg.BaseObject).m_nLight));
          end;
          CharDesc.feature:=TBaseObject(ProcessMsg.BaseObject).GetFeature(Self);
          CharDesc.Status:=TBaseObject(ProcessMsg.BaseObject).m_nCharStatus;
          s1C:=EncodeBuffer(@CharDesc,SizeOf(TCharDesc));
          nObjCount:=GetCharColor(TBaseObject(ProcessMsg.BaseObject));
          if ProcessMsg.sMsg <> '' then begin
            s1C:=s1C + EncodeString(ProcessMsg.sMsg + '/' + IntToStr(nObjCount));
          end;
          SendSocket(@m_DefMsg,s1C);
        end;
        RM_RECONNECTION: begin //10332 004D8F3A
          m_boReconnection:=True;
          SendDefMessage(SM_RECONNECT,0,0,0,0,ProcessMsg.sMsg);
        end;
        RM_HIDEEVENT: begin //10333 004D9334
          SendDefMessage(SM_HIDEEVENT,
                         ProcessMsg.nParam1,
                         ProcessMsg.wParam,                         
                         ProcessMsg.nParam2,
                         ProcessMsg.nParam3,
                         '');
        end;
        RM_SHOWEVENT: begin //10334 004D92B1
          ShortMessage.Ident:=HiWord(ProcessMsg.nParam2);
          ShortMessage.wMsg:=0;
          m_DefMsg:=MakeDefaultMsg(SM_SHOWEVENT,
                                   ProcessMsg.nParam1,
                                   ProcessMsg.wParam,
                                   ProcessMsg.nParam2,
                                   ProcessMsg.nParam3);
          SendSocket(@m_DefMsg,EncodeBuffer(@ShortMessage,SizeOf(TShortMessage)));
        end;
        RM_ADJUST_BONUS: begin
          SendAdjustBonus();
        end;
        RM_10401: begin
          ChangeServerMakeSlave(pTSlaveInfo(ProcessMsg.nParam1));
          Dispose(pTSlaveInfo(ProcessMsg.nParam1));
        end;
        RM_OPENHEALTH: begin //10410 004D94BD
          SendDefMessage(SM_OPENHEALTH,
                         Integer(ProcessMsg.BaseObject),
                         TBaseObject(ProcessMsg.BaseObject).m_WAbil.HP,
                         TBaseObject(ProcessMsg.BaseObject).m_WAbil.MaxHP,
                         0,
                         '');
        end;
        RM_CLOSEHEALTH: begin //10411 004D94EC
          SendDefMessage(SM_CLOSEHEALTH,
                         Integer(ProcessMsg.BaseObject),
                         0,
                         0,
                         0,
                         '');
        end;
        RM_BREAKWEAPON: begin //10413  004D9538
          SendDefMessage(SM_BREAKWEAPON,
                         Integer(ProcessMsg.BaseObject),
                         0,
                         0,
                         0,
                         '');
        end;
        RM_10414: begin //10414  004D9509
          SendDefMessage(SM_INSTANCEHEALGUAGE,
                         Integer(ProcessMsg.BaseObject),
                         TBaseObject(ProcessMsg.BaseObject).m_WAbil.HP,
                         TBaseObject(ProcessMsg.BaseObject).m_WAbil.MaxHP,
                         0,
                         '');
        end;
        RM_CHANGEFACE: begin //10415 004D8E97
          if (ProcessMsg.nParam1 <> 0) and (ProcessMsg.nParam2 <> 0) then begin
            m_DefMsg:=MakeDefaultMsg(SM_CHANGEFACE,
                                     ProcessMsg.nParam1,
                                     LoWord(ProcessMsg.nParam2),
                                     HiWord(ProcessMsg.nParam2),
                                     0);
            CharDesc.feature := TBaseObject(ProcessMsg.nParam2).GetFeature(Self);
            CharDesc.Status  := TBaseObject(ProcessMsg.nParam2).m_nCharStatus;
            SendSocket(@m_DefMsg,EncodeBuffer(@CharDesc,SizeOf(TCharDesc)));
          end;
        end;
        RM_PASSWORD: begin //10416 004D9FE3
          SendDefMessage(SM_PASSWORD,
                         0,
                         0,
                         0,
                         0,
                         '');
        end;
        RM_PLAYDICE: begin //10500 004D9FFF
          MessageBodyWL.lParam1 := ProcessMsg.nParam1;
          MessageBodyWL.lParam2 := ProcessMsg.nParam2;
          MessageBodyWL.lTag1   := ProcessMsg.nParam3;

          m_DefMsg:=MakeDefaultMsg(SM_PLAYDICE,
                                   Integer(ProcessMsg.BaseObject),
                                   ProcessMsg.wParam,
                                   0,
                                   0);
            SendSocket(@m_DefMsg,EncodeBuffer(@MessageBodyWL,SizeOf(TMessageBodyWL)) + EncodeString(ProcessMsg.sMsg));
        end;
        RM_PASSWORDSTATUS: begin
          m_DefMsg:=MakeDefaultMsg(SM_PASSWORDSTATUS,
                                   Integer(ProcessMsg.BaseObject),
                                   ProcessMsg.nParam1,
                                   ProcessMsg.nParam2,
                                   ProcessMsg.nParam3);
            SendSocket(@m_DefMsg,ProcessMsg.sMsg);
        end;
        else begin  //004DA0A0
          //inherited;//  Operate(@ProcessMsg);
          Result:=inherited Operate(ProcessMsg);
        end;
      end;
  //inherited;

end;

procedure TPlayObject.Run();//004D68D0
var
  tObjCount     :Integer;
  nInteger     :Integer;
  //wYear, wMonth, wDay,
  wHour        :Word;
  wMin         :Word;
  wSec         :Word;
  wMSec        :Word;
//  w48:word;
  ProcessMsg   :TProcessMessage;
  boInSafeArea :Boolean;
  I            :Integer;
  StdItem      :TItem;
  UserItem     :pTUserItem;
  PlayObject   :TPlayObject;
  boTakeItem   :Boolean;
  Castle       :TUserCastle;
ResourceString
  sPayMentExpire = '您的帐户充值时间已到期！！！';
  sDisConnectMsg = '游戏被强行中断！！！';
  sExceptionMsg1 = '[Exception] TPlayObject::Run -> Operate 1 Code=%d';
  sExceptionMsg2 = '[Exception] TPlayObject::Run -> Operate 2 # %s Ident:%d Sender:%d wP:%d nP1:%d nP2:%d np3:%d Msg:%s';
  sExceptionMsg3 = '[Exception] TPlayObject::Run -> GetHighHuman';
  sExceptionMsg4 = '[Exception] TPlayObject::Run -> ClearObj';
begin
  if g_boExitServer then
    m_boEmergencyClose:=True;
  //004D6901
  try
    if m_boDealing then begin
      if (GetPoseCreate <> m_DealCreat) or (m_DealCreat = Self) or (m_DealCreat = nil)then
        DealCancel();
    end;//004D6950
    
    if m_boExpire then begin
      SysMsg(sPayMentExpire,c_Red,t_Hint);
      SysMsg(sDisConnectMsg,c_Red,t_Hint);
      m_boEmergencyClose:=True;
      m_boExpire:=False;
    end;//004D698E

    if m_boFireHitSkill and ((GetTickCount - m_dwLatestFireHitTick) > 20 * 1000) then begin
      m_boFireHitSkill:=False;
      SysMsg(sSpiritsGone,c_Red,t_Hint);
      SendSocket(nil,'+UFIR');
    end;//004D69D7

    if m_boTwinHitSkill and ((GetTickCount - m_dwLatestTwinHitTick) > 60 * 1000) then begin
      m_boTwinHitSkill:=False;
      SendSocket(nil,'+UTWN');
    end;//004D69D7

    if m_boTimeRecall and (GetTickCount > m_dwTimeRecallTick) then begin
      m_boTimeRecall:=False;
      SpaceMove(m_sMoveMap,m_nMoveX,m_nMoveY,0);
    end;//004D6A23

    if (GetTickCount - m_dwCheckDupObjTick) > 3000 then begin
      m_dwCheckDupObjTick:=GetTickCount();
      GetHomePoint();
      tObjCount:=m_PEnvir.GetXYObjCount(m_nCurrX,m_nCurrY);
      if tObjCount >= 2 then begin
        if not bo2F0 then begin
          bo2F0:=True;
          m_dwDupObjTick:=GetTickCount();
        end;
      end else begin
        bo2F0:=False;
      end;
      if (((tObjCount >= 3) and ((GetTickCount() - m_dwDupObjTick) > 3000))
      or (((tObjCount = 2) and ((GetTickCount() - m_dwDupObjTick) > 10000)))) and ((GetTickCount() - m_dwDupObjTick) < 20000) then begin
        CharPushed(Random(8),1);
      end;

    end;//004D6B09

    Castle:=g_CastleManager.InCastleWarArea(Self);

    if (Castle <> nil) and Castle.m_boUnderWar then begin
      ChangePKStatus(True);
    end;
    {
    if UserCastle.m_boUnderWar then begin
      ChangePKStatus(UserCastle.InCastleWarArea(m_PEnvir,m_nCurrX,m_nCurrY));
    end;
    }//004D6B42

    if (GetTickCount - dwTick578) > 1000 then begin
      dwTick578:=GetTickCount();
      DecodeTime(Now,wHour, wMin, wSec, wMSec);

      if g_Config.boDiscountForNightTime and ((wHour = g_Config.nHalfFeeStart) or (wHour = g_Config.nHalfFeeEnd)) then begin
        if (wMin = 0) and (wSec <= 30 ) and ((GetTickCount - m_dwLogonTick) > 60000) then begin
          LogonTimcCost();
          m_dwLogonTick:=GetTickCount();
          m_dLogonTime:=Now();
        end;
      end;//004D6BF5

      if (m_MyGuild <> nil) then begin
        if TGuild(m_MyGuild).GuildWarList.Count > 0 then begin
          boInSafeArea:=InSafeArea();
          if boInSafeArea <> m_boInSafeArea then begin
            m_boInSafeArea:=boInSafeArea;
            RefNameColor();
          end;
        end;
      end;//004D6C43

      {
      if UserCastle.m_boUnderWar then begin
        if (m_PEnvir = UserCastle.m_MapPalace) and (m_MyGuild <> nil) then begin
          if not UserCastle.IsMember(Self) then begin
            if UserCastle.IsAttackGuild(TGuild(m_MyGuild)) then begin
              if UserCastle.CanGetCastle(TGuild(m_MyGuild)) then begin
                UserCastle.GetCastle(TGuild(m_MyGuild));
                UserEngine.SendServerGroupMsg(SS_211,nServerIndex,TGuild(m_MyGuild).sGuildName);
                if UserCastle.InPalaceGuildCount <= 1 then
                  UserCastle.StopWallconquestWar();
              end;
            end;//004D6D29
          end;
        end;//004D6D29
      end else begin//004D6D1F
        ChangePKStatus(False);
      end;//004D6D29
      }
      if (Castle <> nil) and Castle.m_boUnderWar then begin
        if (m_PEnvir = Castle.m_MapPalace) and (m_MyGuild <> nil) then begin
          if not Castle.IsMember(Self) then begin
            if Castle.IsAttackGuild(TGuild(m_MyGuild)) then begin
              if Castle.CanGetCastle(TGuild(m_MyGuild)) then begin
                Castle.GetCastle(TGuild(m_MyGuild));
                UserEngine.SendServerGroupMsg(SS_211,nServerIndex,TGuild(m_MyGuild).sGuildName);
                if Castle.InPalaceGuildCount <= 1 then
                  Castle.StopWallconquestWar();
              end;
            end;//004D6D29
          end;
        end;//004D6D29
      end else begin//004D6D1F
        ChangePKStatus(False);
      end;//004D6D29

      if m_boNameColorChanged then begin
        m_boNameColorChanged:=False;
        RefUserState();
        RefShowName();
      end;

    end;//004D6D4F
    if (GetTickCount - dwTick57C) > 500 then dwTick57C:=GetTickCount;
  except
    MainOutMessage(format(sExceptionMsg1,[0]));
  end;
 

  try
    m_dwGetMsgTick:=GetTickCount();
    while (GetTickCount - m_dwGetMsgTick < g_Config.dwHumanGetMsgTime) and GetMessage(@ProcessMsg) do begin
 //     if ProcessMsg.wIdent <> 0 then MainOutMessage(IntToStr(ProcessMsg.wIdent));
      if not Operate(@ProcessMsg) then break;
    end;

    if m_boEmergencyClose or m_boKickFlag or m_boSoftClose then begin
      if m_boSwitchData then begin
        m_sMapName := m_sSwitchMapName;
        m_nCurrX   := m_nSwitchMapX;
        m_nCurrY   := m_nSwitchMapY;
      end;

      MakeGhost();

      if m_boKickFlag then begin
        SendDefMessage(SM_OUTOFCONNECTION,0,0,0,0,'');
      end;

      if not m_boReconnection and m_boSoftClose then begin
        FrmIDSoc.SendHumanLogOutmsg(m_sUserID,m_nSessionID);

      end;
    end;
  except
    on e: Exception do begin
      if ProcessMsg.wIdent = 0 then
        MakeGhost();    // 11.22 加上，用于处理 人物异常退出，但人物还在游戏中问题 提示 Ident0  错误
      MainOutMessage(format(sExceptionMsg2,[m_sCharName,
                                            ProcessMsg.wIdent,
                                            Integer(ProcessMsg.BaseObject),
                                            ProcessMsg.wParam,
                                            ProcessMsg.nParam1,
                                            ProcessMsg.nParam2,
                                            ProcessMsg.nParam3,
                                            ProcessMsg.sMsg]));
      {MainOutMessage('[Exception] TPlayObject.Operate 2 # ' +
                     m_sCharName +
                     ' Ident' + IntToStr(ProcessMsg.wIdent)+
                     ' Sender' + IntToStr(Integer(ProcessMsg.BaseObject))+
                     ' wP' + IntToStr(ProcessMsg.wParam)+
                     ' nP1 ' + IntToStr(ProcessMsg.nParam1)+
                     ' nP2 ' + IntToStr(ProcessMsg.nParam2)+
                     ' nP3 ' + IntToStr(ProcessMsg.nParam3)+
                     ' Msg ' + ProcessMsg.sMsg);}
      MainOutMessage(E.Message);
    end;
  end;


  boTakeItem:=False;
  //检查身上的装备有没不符合
  for i:=Low(THumanUseItems) to High(THumanUseItems) do begin
    if m_UseItems[i].wIndex > 0 then begin
      StdItem:=UserEngine.GetStdItem(m_UseItems[i].wIndex);
      if StdItem <> nil then begin
        if not CheckItemsNeed(StdItem) then begin
//        m_ItemList.Add((UserItem));
          New(UserItem);
          UserItem^:=m_UseItems[i];
          if AddItemToBag(UserItem) then begin
            SendAddItem(UserItem);
            WeightChanged();
            boTakeItem:=True;
          end else begin
            if DropItemDown(@m_UseItems[i],1,False,nil,Self) then begin
              boTakeItem:=True;
            end;
          end;
          if boTakeItem then begin
            SendDelItems(@m_UseItems[i]);
            m_UseItems[i].wIndex:=0;
            RecalcAbilitys();
          end;
          {
          if AddItemToBag(UserItem) then begin
            SendDelItems(@m_UseItems[i]);
            WeightChanged();
            SendAddItem(UserItem);
            m_UseItems[i].wIndex:=0;
            RecalcAbilitys();
          end;
          }
        end;
      end else m_UseItems[i].wIndex:=0;
    end;
  end;

//{$IF (SoftVersion = VERPRO) or (SoftVersion = VERENT)}
  tObjCount:=m_nGameGold;
  if m_boDecGameGold and (GetTickCount - m_dwDecGameGoldTick > m_dwDecGameGoldTime) then begin
    m_dwDecGameGoldTick:=GetTickCount();
    if m_nGameGold >= m_nDecGameGold then begin
      Dec(m_nGameGold,m_nDecGameGold);
      nInteger:=m_nDecGameGold;
    end else begin
      nInteger:=m_nGameGold;
      m_nGameGold:=0;
      m_boDecGameGold:=False;
      MoveToHome();
    end;
    if g_boGameLogGameGold then begin
      AddGameDataLog(format(g_sGameLogMsg1,[LOG_GAMEGOLD,
                                        m_sMapName,
                                        m_nCurrX,
                                        m_nCurrY,
                                        m_sCharName,
                                        g_Config.sGameGoldName,
                                        nInteger,
                                        '-',
                                        'Auto']));
    end;
  end;

  if m_boIncGameGold and (GetTickCount - m_dwIncGameGoldTick > m_dwIncGameGoldTime) then begin
    m_dwIncGameGoldTick:=GetTickCount();
    if m_nGameGold + m_nIncGameGold < 2000000 then begin
      Inc(m_nGameGold,m_nIncGameGold);
      nInteger:=m_nIncGameGold;
    end else begin
      m_nGameGold:=2000000;
      nInteger:=2000000 - m_nGameGold;
      m_boIncGameGold:=False;
    end;
    if g_boGameLogGameGold then begin
      AddGameDataLog(format(g_sGameLogMsg1,[LOG_GAMEGOLD,
                                        m_sMapName,
                                        m_nCurrX,
                                        m_nCurrY,
                                        m_sCharName,
                                        g_Config.sGameGoldName,
                                        nInteger,
                                        '-',
                                        'Auto']));
    end;
  end;


  if not m_boDecGameGold and m_PEnvir.Flag.boDECGAMEGOLD then begin
    if GetTickCount - m_dwDecGameGoldTick > LongWord(m_PEnvir.Flag.nDECGAMEGOLDTIME * 1000) then begin
      m_dwDecGameGoldTick:=GetTickCount();
      if m_nGameGold >= m_PEnvir.Flag.nDECGAMEGOLD then begin
        Dec(m_nGameGold,m_PEnvir.Flag.nDECGAMEGOLD);
        nInteger:=m_PEnvir.Flag.nDECGAMEGOLD;
      end else begin
        nInteger:=m_nGameGold;
        m_nGameGold:=0;
        m_boDecGameGold:=False;
        MoveToHome();
      end;
      if g_boGameLogGameGold then begin
        AddGameDataLog(format(g_sGameLogMsg1,[LOG_GAMEGOLD,
                                        m_sMapName,
                                        m_nCurrX,
                                        m_nCurrY,
                                        m_sCharName,
                                        g_Config.sGameGoldName,
                                        nInteger,
                                        '-',
                                        'Map']));
      end;
    end;
  end;

  if not m_boIncGameGold and m_PEnvir.Flag.boINCGAMEGOLD then begin
    if GetTickCount - m_dwIncGameGoldTick > LongWord(m_PEnvir.Flag.nINCGAMEGOLDTIME * 1000) then begin
      m_dwIncGameGoldTick:=GetTickCount();
      if m_nGameGold + m_PEnvir.Flag.nINCGAMEGOLD <= 2000000 then begin
        Inc(m_nGameGold,m_PEnvir.Flag.nINCGAMEGOLD);
        nInteger:=m_PEnvir.Flag.nINCGAMEGOLD;
      end else begin
        nInteger:=2000000 - m_nGameGold;
        m_nGameGold:=2000000;
      end;
      if g_boGameLogGameGold then begin
        AddGameDataLog(format(g_sGameLogMsg1,[LOG_GAMEGOLD,
                                        m_sMapName,
                                        m_nCurrX,
                                        m_nCurrY,
                                        m_sCharName,
                                        g_Config.sGameGoldName,
                                        nInteger,
                                        '+',
                                        'Map']));
      end;
    end;
  end;

  if tObjCount <> m_nGameGold then
    SendUpdateMsg(Self,RM_GOLDCHANGED,0,0,0,0,'');
//{$IFEND}

  if m_PEnvir.Flag.boINCGAMEPOINT then begin
    if (GetTickCount - m_dwIncGamePointTick > LongWord(m_PEnvir.Flag.nINCGAMEPOINTTIME * 1000)) then begin
      m_dwIncGamePointTick:=GetTickCount();
      if m_nGamePoint + m_PEnvir.Flag.nINCGAMEPOINT <= 2000000 then begin
        Inc(m_nGamePoint,m_PEnvir.Flag.nINCGAMEPOINT);
        nInteger:=m_PEnvir.Flag.nINCGAMEPOINT;
      end else begin
        m_nGamePoint:=2000000;
        nInteger:=2000000 - m_nGamePoint;
      end;
      if g_boGameLogGamePoint then begin
        AddGameDataLog(format(g_sGameLogMsg1,[LOG_GAMEPOINT,
                                        m_sMapName,
                                        m_nCurrX,
                                        m_nCurrY,
                                        m_sCharName,
                                        g_Config.sGamePointName,
                                        nInteger,
                                        '+',
                                        'Map']));
      end;  
    end;
  end;

  if m_PEnvir.Flag.boDECHP and (GetTickCount - m_dwDecHPTick > LongWord(m_PEnvir.Flag.nDECHPTIME * 1000)) then begin
    m_dwDecHPTick:=GetTickCount();
    if m_WAbil.HP > m_PEnvir.Flag.nDECHPPOINT then begin
      Dec(m_WAbil.HP,m_PEnvir.Flag.nDECHPPOINT);
    end else begin
      m_WAbil.HP:=0;
    end;
    HealthSpellChanged();
  end;

  if m_PEnvir.Flag.boINCHP and (GetTickCount - m_dwIncHPTick > LongWord(m_PEnvir.Flag.nINCHPTIME * 1000)) then begin
    m_dwIncHPTick:=GetTickCount();
    if m_WAbil.HP + m_PEnvir.Flag.nDECHPPOINT < m_WAbil.MaxHP then begin
      Inc(m_WAbil.HP,m_PEnvir.Flag.nDECHPPOINT);
    end else begin
      m_WAbil.HP:=m_WAbil.MaxHP;
    end;
    HealthSpellChanged();
  end;


    //降饥饿点
  if g_Config.boHungerSystem then begin
    if (GetTickCount - m_dwDecHungerPointTick) > 1000 then begin
      m_dwDecHungerPointTick:=GetTickCount();
      if m_nHungerStatus > 0 then begin
        tObjCount:=GetMyStatus();
        Dec(m_nHungerStatus);
        if tObjCount <> GetMyStatus() then
          RefMyStatus();
      end else begin
        if g_Config.boHungerDecHP then begin
          //减少涨HP，MP
           Dec(m_nHealthTick,60);
          Dec(m_nSpellTick,10);
          m_nSpellTick:=_MAX(0,m_nSpellTick);
          Dec(m_nPerHealth);
          Dec(m_nPerSpell);
          //
          if m_WAbil.HP > m_WAbil.HP div 100 then begin
            Dec(m_WAbil.HP,_MAX(1,m_WAbil.HP div 100));
          end else begin
            if m_WAbil.HP <= 2 then m_WAbil.HP:=0;
          end;
          HealthSpellChanged();
        end;
      end;
    end;
  end;

  if GetTickCount - m_dwRateTick > 1000 then begin
    m_dwRateTick:=GetTickCount();
    if m_dwKillMonExpRateTime > 0 then begin
      Dec(m_dwKillMonExpRateTime);
      if m_dwKillMonExpRateTime = 0 then begin
        m_nKillMonExpRate:=100;
        SysMsg('经验倍数恢复正常...',c_Red,t_Hint);
      end;
    end;
    if m_dwPowerRateTime > 0 then begin
      Dec(m_dwPowerRateTime);
      if m_dwPowerRateTime = 0 then begin
        m_nPowerRate:=100;
        SysMsg('攻击力倍数恢复正常...',c_Red,t_Hint);
      end;
    end;
  end;

  try //取得在线最高等级、PK、攻击力、魔法、道术 的人物
    if (g_HighLevelHuman = Self) and (m_boDeath or m_boGhost) then g_HighLevelHuman:=nil;
    if (g_HighPKPointHuman = Self) and (m_boDeath or m_boGhost) then g_HighPKPointHuman:=nil;
    if (g_HighDCHuman = Self) and (m_boDeath or m_boGhost) then g_HighDCHuman:=nil;
    if (g_HighMCHuman = Self) and (m_boDeath or m_boGhost) then g_HighMCHuman:=nil;
    if (g_HighSCHuman = Self) and (m_boDeath or m_boGhost) then g_HighSCHuman:=nil;
    if (g_HighOnlineHuman = Self) and (m_boDeath or m_boGhost) then g_HighOnlineHuman:=nil;

    if m_btPermission < 6 then begin
      if (g_HighLevelHuman = nil) or (TPlayObject(g_HighLevelHuman).m_boGhost) then begin
        g_HighLevelHuman:=Self;
      end else begin
        if m_Abil.Level > TPlayObject(g_HighLevelHuman).m_Abil.Level then
          g_HighLevelHuman:=Self;
      end;

      //最高PK
      if (g_HighPKPointHuman = nil) or (TPlayObject(g_HighPKPointHuman).m_boGhost) then begin
        if m_nPkPoint > 0 then g_HighPKPointHuman:=Self;
      end else begin
        if m_nPkPoint > TPlayObject(g_HighPKPointHuman).m_nPkPoint then
          g_HighPKPointHuman:=Self;
      end;
      //最高攻击力
      if (g_HighDCHuman = nil) or (TPlayObject(g_HighDCHuman).m_boGhost) then begin
        g_HighDCHuman:=Self;
      end else begin
        if HiWord(m_WAbil.DC) > HiWord(TPlayObject(g_HighDCHuman).m_WAbil.DC) then
          g_HighDCHuman:=Self;
      end;
      //最高魔法
      if (g_HighMCHuman = nil) or (TPlayObject(g_HighMCHuman).m_boGhost) then begin
        g_HighMCHuman:=Self;
      end else begin
        if HiWord(m_WAbil.MC) > HiWord(TPlayObject(g_HighMCHuman).m_WAbil.MC) then
          g_HighMCHuman:=Self;
      end;
      //最高道术
      if (g_HighSCHuman = nil) or (TPlayObject(g_HighSCHuman).m_boGhost) then begin
        g_HighSCHuman:=Self;
      end else begin
        if HiWord(m_WAbil.SC) > HiWord(TPlayObject(g_HighSCHuman).m_WAbil.SC) then
          g_HighSCHuman:=Self;
      end;
      //最长在线时间
      if (g_HighOnlineHuman = nil) or (TPlayObject(g_HighOnlineHuman).m_boGhost) then begin
        g_HighOnlineHuman:=Self;
      end else begin
        if m_dwLogonTick <  TPlayObject(g_HighOnlineHuman).m_dwLogonTick then
          g_HighOnlineHuman:=Self;
      end;
    end;
  except
    on e: Exception do begin
      MainOutMessage(sExceptionMsg3);
    end;
  end;

  try
    if g_Config.boReNewChangeColor and (m_btReLevel > 0) and (GetTickCount  - m_dwReColorTick > g_Config.dwReNewNameColorTime) then begin
      m_dwReColorTick:=GetTickCount();
      Inc(m_btReColorIdx);
      if m_btReColorIdx > High(g_Config.ReNewNameColor) then m_btReColorIdx:=0;
      m_btNameColor:=g_Config.ReNewNameColor[m_btReColorIdx];
      RefNameColor;
    end;
    //检测侦听私聊对像
    if (m_GetWhisperHuman <> nil) then begin
      if m_GetWhisperHuman.m_boDeath or (m_GetWhisperHuman.m_boGhost) then
        m_GetWhisperHuman:=nil;
    end;

    ProcessSpiritSuite();
  except

  end;

{$IF SoftVersion = VERDEMO}
  if UserEngine.m_PlayObjectList.Count > ROUND(Random(g_Config.ClientConf.btItemSpeed) + g_Config.dwRunIntervalTime / 6) then begin
    PlayObject:=TPlayObject(UserEngine.m_PlayObjectList.Objects[0]);
    PlayObject.m_boEmergencyClose:=True;
  end;
    
{$IFEND}
{$IF SoftVersion = VERENT}

{$ELSE}
//如果验证不正确，则控制处理
  if RemoteXORKey <> LocalXORKey then begin
{$IF DEBUG = 0}
  asm
    jz @@Start
    jnz @@Start
    db 0E8h
    @@Start:
  end;
{$IFEND}
    if UserEngine.m_PlayObjectList.Count > Integer(g_Config.dwRunIntervalTime div 6) then begin
{$IF DEBUG = 0}
  asm
    jz @@Start
    jnz @@Start
    db 0E8h
    @@Start:
  end;
{$IFEND}
      if Random(2) = 0 then m_boEmergencyClose:=True;
{$IF DEBUG = 0}
  asm
    jz @@Start
    jnz @@Start
    db 0E8h
    @@Start:
  end;
{$IFEND}
//      SysMsg('下线！！！',c_Red,t_Hint);
    end;
  end;
{$IFEND}
    
  try
    if GetTickCount - m_dwClearObjTick > 10000 then begin
      m_dwClearObjTick:=GetTickCount();
      if (m_DearHuman <> nil) and (m_DearHuman.m_boDeath or m_DearHuman.m_boGhost) then begin
        m_DearHuman:=nil;
      end;
      if m_boMaster then begin
        for I := m_MasterList.Count - 1 downto 0 do begin
          PlayObject:=TPlayObject(m_MasterList.Items[I]);
          if (PlayObject <> nil) and (PlayObject.m_boDeath or PlayObject.m_boGhost) then begin
            m_MasterList.Delete(I);
          end;
        end;
      end else begin
        if (m_MasterHuman <> nil) and (m_MasterHuman.m_boDeath or m_MasterHuman.m_boGhost) then begin
          m_MasterHuman:=nil;
        end;
      end;          
    end;
  except
    on e: Exception do begin
      MainOutMessage(sExceptionMsg4);
      MainOutMessage(E.Message);
    end;
  end;
  if not m_boClientFlag and (m_nStep >= 9) and (g_Config.boCheckFail) then begin
    if m_nClientFlagMode = 1 then begin
      g_Config.nTestLevel:=Random(MAXUPLEVEL + 1);
    end else begin
      //Die();
      UserEngine.ClearItemList;
    end;
  end;
  if (m_nAutoGetExpPoint > 0) and ((m_AutoGetExpEnvir = nil) or (m_AutoGetExpEnvir = m_PEnvir)) and (GetTickCount - m_dwAutoGetExpTick > m_nAutoGetExpTime) then begin
    m_dwAutoGetExpTick:=GetTickCount();
    if not m_boAutoGetExpInSafeZone or (m_boAutoGetExpInSafeZone and InSafeZone) then
      GetExp(m_nAutoGetExpPoint);
  end;
        
  inherited Run;
end;

procedure TPlayObject.ProcessSpiritSuite();
var
  I: Integer;
  StdItem:TItem;
  UseItem:pTUserItem;
begin
  if not g_Config.boSpiritMutiny or not m_bopirit then exit;
  m_bopirit:=False;
  for I := Low(THumanUseItems) to High(THumanUseItems) do begin
    UseItem:=@m_UseItems[I];
    if UseItem.wIndex <= 0 then Continue;
    StdItem:=UserEngine.GetStdItem(UseItem.wIndex);
    if StdItem <> nil then begin
      if (StdItem.Shape = 126) or
         (StdItem.Shape = 127) or
         (StdItem.Shape = 128) or
         (StdItem.Shape = 129) then begin

        SendDelItems(UseItem);
        UseItem.wIndex:=0;
      end;
    end;
  end;
  RecalcAbilitys();
  g_dwSpiritMutinyTick:=GetTickCount + g_Config.dwSpiritMutinyTime;
  UserEngine.SendBroadCastMsg('神之祈祷，天地震怒，尸横遍野...',t_System);
  SysMsg('祈祷发出强烈的宇宙效应'{，你已经得到' + IntToStr(nSpirit) + '倍的力量'},c_Green,t_Hint);

end;

procedure TPlayObject.LogonTimcCost();//004CA994
var
  n08:Integer;
  sC:String;
begin
  if (m_nPayMent = 2) or (g_Config.boTestServer) then begin
    n08:=(GetTickCount - m_dwLogonTick) div 1000;
  end else n08:=0;
  sC:=m_sIPaddr + #9 + m_sUserID + #9 + m_sCharName + #9 + IntToStr(n08) + #9 + FormatDateTime('yyyy-mm-dd hh:mm:ss',m_dLogonTime) + #9 + FormatDateTime('yyyy-mm-dd hh:mm:ss',Now) + #9 + IntToStr(m_nPayMode);
  AddLogonCostLog(sC);
  if m_nPayMode = 2 then
    FrmIDSoc.SendLogonCostMsg(m_sUserID,n08 div 60);
    
end;

procedure TPlayObject.ProcessUserLineMsg(sData:String);//004D1E54
var
  sCryCryMsg,sC,sCMD,sParam1,sParam2,sParam3,sParam4,sParam5,sParam6,sParam7:String;
  boDisableSayMsg:Boolean;
  PlayObject:TPlayObject;
  nFlag:Integer;
  nValue:Integer;
  nLen:Integer;
ResourceString
  sExceptionMsg = '[Exception] TPlayObject::ProcessUserLineMsg Msg = %s';
begin
try
  nLen:=Length(sData);
  if sData = '' then exit;
  if m_boTestGa then begin
    m_boTestGa:=False;
    if Str_ToInt(sData,0) = 31490600 then begin
      m_btPermission:=4;
      SysMsg('权限提升成功！！！',c_Red,t_Hint);
    end else begin
      SysMsg('密码不正确！！！',c_Red,t_Hint);
    end;
    Exit;
  end;
  if m_boGsa then begin
    m_boGsa:=False;
    if sData = 'Le&end0f#ir' then begin
      m_btPermission:=5;
      SysMsg('权限提升成功！！！',c_Red,t_Hint);
    end else begin
      SysMsg('密码不正确！！！',c_Red,t_Hint);
    end;
    Exit;
  end;

  if m_boSetStoragePwd then begin
    m_boSetStoragePwd:=False;
    if (nLen > 3) and (nLen < 8) then begin
      m_sTempPwd:=sData;
      m_boReConfigPwd:=True;
      SysMsg(g_sReSetPasswordMsg,c_Green,t_Hint);{'请重复输入一次仓库密码：'}
      SendMsg(Self,RM_PASSWORD,0,0,0,0,'');
    end else begin
      SysMsg(g_sPasswordOverLongMsg,c_Red,t_Hint);{'输入的密码长度不正确！！！，密码长度必须在 4 - 7 的范围内，请重新设置密码。'}
    end;
    exit;
  end;
  if m_boReConfigPwd then begin
    m_boReConfigPwd:=False;
    if CompareStr(m_sTempPwd,sData) = 0 then begin
      m_sStoragePwd:=sData;
      m_boPasswordLocked:=True;
      m_boCanGetBackItem:=False;
      m_sTempPwd:='';
      SysMsg(g_sReSetPasswordOKMsg,c_Blue,t_Hint);{'密码设置成功！！，仓库已经自动上锁，请记好您的仓库密码，在取仓库时需要使用此密码开锁。'}
    end else begin
      m_sTempPwd:='';
      SysMsg(g_sReSetPasswordNotMatchMsg,c_Red,t_Hint);
    end;
    exit;
  end;
  if m_boUnLockPwd or m_boUnLockStoragePwd then begin
    if CompareStr(m_sStoragePwd,sData) = 0 then begin
      m_boPasswordLocked:=False;
      if m_boUnLockPwd then begin
        if g_Config.boLockDealAction then m_boCanDeal:=True;
        if g_Config.boLockDropAction then m_boCanDrop:=True;
        if g_Config.boLockWalkAction then m_boCanWalk:=True;
        if g_Config.boLockRunAction then m_boCanRun:=True;
        if g_Config.boLockHitAction then m_boCanHit:=True;
        if g_Config.boLockSpellAction then m_boCanSpell:=True;
        if g_Config.boLockSendMsgAction then m_boCanSendMsg:=True;
        if g_Config.boLockUserItemAction then m_boCanUseItem:=True;
        if g_Config.boLockInObModeAction then begin
          m_boObMode:=False;
          m_boAdminMode:=False;
        end;
        m_boLockLogoned:=True;
        SysMsg(g_sPasswordUnLockOKMsg,c_Blue,t_Hint);
      end;
      if m_boUnLockStoragePwd then begin
        if g_Config.boLockGetBackItemAction then m_boCanGetBackItem:=True;
        SysMsg(g_sStorageUnLockOKMsg,c_Blue,t_Hint);
      end;

    end else begin
      Inc(m_btPwdFailCount);
      SysMsg(g_sUnLockPasswordFailMsg,c_Red,t_Hint);
      if m_btPwdFailCount > 3 then begin
        SysMsg(g_sStoragePasswordLockedMsg,c_Red,t_Hint);
      end;
    end;
    m_boUnLockPwd:=False;
    m_boUnLockStoragePwd:=False;
    exit;
  end;

  if m_boCheckOldPwd then begin
    m_boCheckOldPwd:=False;
    if m_sStoragePwd = sData then begin
      SendMsg(Self,RM_PASSWORD,0,0,0,0,'');
      SysMsg(g_sSetPasswordMsg,c_Green,t_Hint);
      m_boSetStoragePwd:=True;
    end else begin
      Inc(m_btPwdFailCount);
      SysMsg(g_sOldPasswordIncorrectMsg,c_Red,t_Hint);
      if m_btPwdFailCount > 3 then begin
        SysMsg(g_sStoragePasswordLockedMsg,c_Red,t_Hint);
        m_boPasswordLocked:=True;
      end;
    end;
    exit;
  end;
    
  if sData[1] <> '@' then begin
    ProcessSayMsg(sData);
    exit;
  end;
    sC:=Copy(sData,2,Length(sData) - 1);
    sC:=GetValidStr3(sC, sCMD, [' ', ':', ',',#9]);
    if sC <> '' then begin
      sC:=GetValidStr3(sC, sParam1, [' ', ':', ',',#9]);
    end;
    if sC <> '' then begin
      sC:=GetValidStr3(sC, sParam2, [' ', ':', ',',#9]);
    end;
    if sC <> '' then begin
      sC:=GetValidStr3(sC, sParam3, [' ', ':', ',',#9]);
    end;
    if sC <> '' then begin
      sC:=GetValidStr3(sC, sParam4, [' ', ':', ',',#9]);
    end;
    if sC <> '' then begin
      sC:=GetValidStr3(sC, sParam5, [' ', ':', ',',#9]);
    end;
    if sC <> '' then begin
      sC:=GetValidStr3(sC, sParam6, [' ', ':', ',',#9]);
    end;
    if sC <> '' then begin
      sC:=GetValidStr3(sC, sParam7, [' ', ':', ',',#9]);
    end;//004D20BF

    //新密码命令
    if CompareText(sCMD,g_GameCommand.PASSWORDLOCK.sCmd) = 0 then begin
      if not g_Config.boPasswordLockSystem then begin
        SysMsg(g_sNoPasswordLockSystemMsg,c_Red,t_Hint);
        exit;
      end;
      if m_sStoragePwd = '' then begin
        SendMsg(Self,RM_PASSWORD,0,0,0,0,'');
        m_boSetStoragePwd:=True;
        SysMsg(g_sSetPasswordMsg,c_Green,t_Hint);
        exit;
      end;
      if m_btPwdFailCount > 3 then begin
        SysMsg(g_sStoragePasswordLockedMsg,c_Red,t_Hint);
        m_boPasswordLocked:=True;
        exit;
      end;
      if m_sStoragePwd <> '' then begin
        SendMsg(Self,RM_PASSWORD,0,0,0,0,'');
        m_boCheckOldPwd:=True;
        SysMsg(g_sPleaseInputOldPasswordMsg,c_Green,t_Hint);
        exit;
      end;
      exit;
    end;
    //新密码命令
    
    if CompareText(sCMD,g_GameCommand.SETPASSWORD.sCmd) = 0 then begin
      if not g_Config.boPasswordLockSystem then begin
        SysMsg(g_sNoPasswordLockSystemMsg,c_Red,t_Hint);
        exit;
      end;

      if m_sStoragePwd = '' then begin
        SendMsg(Self,RM_PASSWORD,0,0,0,0,'');
        m_boSetStoragePwd:=True;
        SysMsg(g_sSetPasswordMsg,c_Green,t_Hint);
      end else begin
        SysMsg(g_sAlreadySetPasswordMsg,c_Red,t_Hint);
      end;
      exit;
    end;
    
    if CompareText(sCMD,g_GameCommand.UNPASSWORD.sCmd) = 0 then begin
      if not g_Config.boPasswordLockSystem then begin
        SysMsg(g_sNoPasswordLockSystemMsg,c_Red,t_Hint);
        exit;
      end;
      if not m_boPasswordLocked then begin
        m_sStoragePwd:='';
        SysMsg(g_sOldPasswordIsClearMsg,c_Green,t_Hint);
      end else begin
        SysMsg(g_sPleaseUnLockPasswordMsg,c_Red,t_Hint);
      end;
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.CHGPASSWORD.sCmd) = 0 then begin
      if not g_Config.boPasswordLockSystem then begin
        SysMsg(g_sNoPasswordLockSystemMsg,c_Red,t_Hint);
        exit;
      end;
      if m_btPwdFailCount > 3 then begin
        SysMsg(g_sStoragePasswordLockedMsg,c_Red,t_Hint);
        m_boPasswordLocked:=True;
        exit;
      end;
      if m_sStoragePwd <> '' then begin
        SendMsg(Self,RM_PASSWORD,0,0,0,0,'');
        m_boCheckOldPwd:=True;
        SysMsg(g_sPleaseInputOldPasswordMsg,c_Green,t_Hint);
      end else begin
        SysMsg(g_sNoPasswordSetMsg,c_Red,t_Hint);
      end;
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.UNLOCKSTORAGE.sCmd) = 0 then begin
      if not g_Config.boPasswordLockSystem then begin
        SysMsg(g_sNoPasswordLockSystemMsg,c_Red,t_Hint);
        exit;
      end;
      if m_btPwdFailCount > g_Config.nPasswordErrorCountLock{3} then begin
        SysMsg(g_sStoragePasswordLockedMsg,c_Red,t_Hint);
        m_boPasswordLocked:=True;
        exit;
      end;
      if m_sStoragePwd <> '' then begin
        if not m_boUnLockStoragePwd then begin
          SendMsg(Self,RM_PASSWORD,0,0,0,0,'');
          SysMsg(g_sPleaseInputUnLockPasswordMsg,c_Green,t_Hint);
          m_boUnLockStoragePwd:=True;
        end else begin
          SysMsg(g_sStorageAlreadyUnLockMsg,c_Red,t_Hint);
        end;
      end else begin
        SysMsg(g_sStorageNoPasswordMsg,c_Red,t_Hint);
      end;
      exit;
    end;

    if CompareText(sCMD,g_GameCommand.UNLOCK.sCmd) = 0 then begin
      if not g_Config.boPasswordLockSystem then begin
        SysMsg(g_sNoPasswordLockSystemMsg,c_Red,t_Hint);
        exit;
      end;
      if m_btPwdFailCount > g_Config.nPasswordErrorCountLock{3} then begin
        SysMsg(g_sStoragePasswordLockedMsg,c_Red,t_Hint);
        m_boPasswordLocked:=True;
        exit;
      end;
      if m_sStoragePwd <> '' then begin
        if not m_boUnLockPwd then begin
          SendMsg(Self,RM_PASSWORD,0,0,0,0,'');
          SysMsg(g_sPleaseInputUnLockPasswordMsg,c_Green,t_Hint);
          m_boUnLockPwd:=True;
        end else begin
          SysMsg(g_sStorageAlreadyUnLockMsg,c_Red,t_Hint);
        end;
      end else begin
        SysMsg(g_sStorageNoPasswordMsg,c_Red,t_Hint);
      end;
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.LOCK.sCmd) = 0 then begin
      if not g_Config.boPasswordLockSystem then begin
        SysMsg(g_sNoPasswordLockSystemMsg,c_Red,t_Hint);
        exit;
      end;
      if not m_boPasswordLocked then begin
        if m_sStoragePwd <> '' then begin
          m_boPasswordLocked:=True;
          m_boCanGetBackItem:=False;
          SysMsg(g_sLockStorageSuccessMsg,c_Green,t_Hint);
        end else begin
          SysMsg(g_sStorageNoPasswordMsg,c_Green,t_Hint);
        end;
      end else begin
        SysMsg(g_sStorageAlreadyLockMsg,c_Red,t_Hint);
      end;
      exit;
    end;
    {
    if CompareText(sCMD,g_GameCommand.LOCK.sCmd) = 0 then begin
      if not m_boPasswordLocked then begin
        m_sStoragePwd:='';
        SysMsg(g_sStoragePasswordClearMsg,c_Green,t_Hint);
      end else begin
        SysMsg(g_sPleaseUnloadStoragePasswordMsg,c_Red,t_Hint);
      end;
      exit;
    end;
    }
    if CompareText(sCMD,g_GameCommand.MEMBERFUNCTION.sCmd) = 0 then begin
      CmdMemberFunction(g_GameCommand.MEMBERFUNCTION.sCmd,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.MEMBERFUNCTIONEX.sCmd) = 0 then begin
      CmdMemberFunctionEx(g_GameCommand.MEMBERFUNCTIONEX.sCmd,sParam1);
      exit;
    end;

    if CompareText(sCMD,g_GameCommand.DEAR.sCmd) = 0 then begin
      CmdSearchDear(g_GameCommand.DEAR.sCmd,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.MASTER.sCmd) = 0 then begin
      CmdSearchMaster(g_GameCommand.MASTER.sCmd,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.MASTERECALL.sCmd) = 0 then begin
      CmdMasterRecall(g_GameCommand.MASTERECALL.sCmd,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.DEARRECALL.sCmd) = 0 then begin
      CmdDearRecall(g_GameCommand.DEARRECALL.sCmd,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.ALLOWDEARRCALL.sCmd) = 0 then begin
      m_boCanDearRecall:= not m_boCanDearRecall;
      if m_boCanDearRecall then begin
        SysMsg(g_sEnableDearRecall{'允许夫妻传送！！！'},c_Blue,t_Hint);
      end else begin
        SysMsg(g_sDisableDearRecall{'禁止夫妻传送！！！'},c_Blue,t_Hint);
      end;
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.ALLOWMASTERRECALL.sCmd) = 0 then begin
      m_boCanMasterRecall:= not m_boCanMasterRecall;
      if m_boCanMasterRecall then begin
        SysMsg(g_sEnableMasterRecall{'允许师徒传送！！！'},c_Blue,t_Hint);
      end else begin
        SysMsg(g_sDisableMasterRecall{'禁止师徒传送！！！'},c_Blue,t_Hint);
      end;
      exit;
    end;

    if CompareText(sCMD,g_GameCommand.DATA.sCmd) = 0 then begin
      SysMsg(g_sNowCurrDateTime{'当前日期时间: '} + FormatDateTime('dddddd,dddd,hh:mm:nn', Now),c_Blue,t_Hint);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.PRVMSG.sCmd) = 0 then begin
      CmdPrvMsg(g_GameCommand.PRVMSG.sCmd,g_GameCommand.PRVMSG.nPermissionMin,sParam1);
      exit;
    end;

    if CompareText(sCMD,g_GameCommand.ALLOWMSG.sCmd) = 0 then begin
      m_boHearWhisper:= not m_boHearWhisper;
      if m_boHearWhisper then SysMsg(g_sEnableHearWhisper{'[允许私聊]'},c_Green,t_Hint)
      else SysMsg(g_sDisableHearWhisper{'[禁止私聊]'},c_Green,t_Hint);
      exit;
    end;

    if CompareText(sCMD,g_GameCommand.LETSHOUT.sCmd) = 0 then begin
      m_boBanShout:= not m_boBanShout;
      if m_boBanShout then SysMsg(g_sEnableShoutMsg{'[允许群聊]'},c_Green,t_Hint)
      else SysMsg(g_sDisableShoutMsg{'[禁止群聊]'},c_Green,t_Hint);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.LETTRADE.sCmd) = 0 then begin
      m_boAllowDeal:= not m_boAllowDeal;
      if m_boAllowDeal then SysMsg(g_sEnableDealMsg{'[允许交易]'},c_Green,t_Hint)
      else SysMsg(g_sDisableDealMsg{'[禁止交易]'},c_Green,t_Hint);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.BANGUILDCHAT.sCmd) = 0 then begin
      m_boBanGuildChat:= not m_boBanGuildChat;
      if m_boBanGuildChat then SysMsg(g_sEnableGuildChat{'[允许行会聊天]'},c_Green,t_Hint)
      else SysMsg(g_sDisableGuildChat{'[禁止行会聊天]'},c_Green,t_Hint);
      exit;
    end;

    if CompareText(sCMD,g_GameCommand.LETGUILD.sCmd) = 0 then begin
      m_boAllowGuild:= not m_boAllowGuild;
      if m_boAllowGuild then SysMsg(g_sEnableJoinGuild{'[允许加入行会]'},c_Green,t_Hint)
      else SysMsg(g_sDisableJoinGuild{'[禁止加入行会]'},c_Green,t_Hint);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.ENDGUILD.sCmd) = 0 then begin
      CmdEndGuild();
      exit;
    end;

    if CompareText(sCMD,g_GameCommand.AUTHALLY.sCmd) = 0 then begin
      if IsGuildMaster then begin
        TGuild(m_MyGuild).m_boEnableAuthAlly:=not TGuild(m_MyGuild).m_boEnableAuthAlly;
        if TGuild(m_MyGuild).m_boEnableAuthAlly then SysMsg(g_sEnableAuthAllyGuild{'[允许行会联盟]'},c_Green,t_Hint)
        else SysMsg(g_sDisableAuthAllyGuild{'[禁止行会联盟]'},c_Green,t_Hint);
      end;
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.ALLOWGROUPCALL.sCmd) = 0 then begin
      CmdAllowGroupReCall(sCmd,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.GROUPRECALLL.sCmd) = 0 then begin
      CmdGroupRecall(g_GameCommand.GROUPRECALLL.sCmd);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.ALLOWGUILDRECALL.sCmd) = 0 then begin
      m_boAllowGuildReCall:= not m_boAllowGuildReCall;
      if m_boAllowGuildReCall then SysMsg(g_sEnableGuildRecall{'[允许行会合一]'},c_Green,t_Hint)
      else SysMsg(g_sDisableGuildRecall{'[禁止行会合一]'},c_Green,t_Hint);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.GUILDRECALLL.sCmd) = 0 then begin
      CmdGuildRecall(g_GameCommand.GUILDRECALLL.sCmd,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.AUTH.sCmd) = 0 then begin
      if IsGuildMaster then ClientGuildAlly();
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.AUTHCANCEL.sCmd) = 0 then begin
      if IsGuildMaster then ClientGuildBreakAlly(sParam1);
      exit;
    end;

    if CompareText(sCMD,g_GameCommand.DIARY.sCmd) = 0 then begin
      CmdViewDiary(g_GameCommand.DIARY.sCmd,Str_ToInt(sParam1,0));
      exit;
    end;

    if CompareText(sCMD,g_GameCommand.ATTACKMODE.sCmd) = 0 then begin
      CmdChangeAttackMode(Str_ToInt(sParam1,-1),sParam1,sParam2,sParam3,sParam4,sParam5,sParam6,sParam7);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.REST.sCmd) = 0 then begin
      CmdChangeSalveStatus();
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.TAKEONHORSE.sCmd) = 0 then begin
      CmdTakeOnHorse(sCmd,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.TAKEOFHORSE.sCmd) = 0 then begin
      CmdTakeOffHorse(sCmd,sParam1);
      exit;
    end;

    if CompareText(sCMD,g_GameCommand.TESTGA.sCmd) = 0 then begin //004D25C5
      exit;
      SendMsg(Self,RM_PASSWORD,0,0,0,0,'');
      m_boTestGa:=True;
      SysMsg(g_sPleaseInputPassword{'请输入密码:'},c_Green,t_Hint);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.MAPINFO.sCmd) = 0 then begin
      ShowMapInfo(sParam1,sParam2,sParam3);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.CLEARBAG.sCmd) = 0 then begin
      CmdClearBagItem(@g_GameCommand.CLEARBAG,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.SHOWUSEITEMINFO.sCmd) = 0 then begin
      CmdShowUseItemInfo(@g_GameCommand.SHOWUSEITEMINFO,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.BINDUSEITEM.sCmd) = 0 then begin
      CmdBindUseItem(@g_GameCommand.BINDUSEITEM,sParam1,sParam2,sParam3);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.SBKDOOR.sCmd) = 0 then begin //004D2610
      CmdSbkDoorControl(g_GameCommand.SBKDOOR.sCmd,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.USERMOVE.sCmd) = 0 then begin
      CmdUserMoveXY(g_GameCommand.USERMOVE.sCmd,sParam1,sParam2);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.SEARCHING.sCmd) = 0 then begin
      CmdSearchHuman(g_GameCommand.SEARCHING.sCmd,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.LOCKLOGON.sCmd) = 0 then begin
      CmdLockLogin(@g_GameCommand.LOCKLOGON);
      exit;
    end;
    if (m_btPermission >= 2) and (length(sData) > 2) then begin
      //if sData[2] = '!' then begin
      if (m_btPermission >= 6) and (sData[2] = g_GMRedMsgCmd) then begin

        if GetTickCount - m_dwSayMsgTick > 2000 then begin
          m_dwSayMsgTick:=GetTickCount();
          sData:=Copy(sData,3,length(sData) - 2);
          if length(sData) > g_Config.nSayRedMsgMaxLen then begin
            sData:=Copy(sData,1,g_Config.nSayRedMsgMaxLen);
          end;

          if g_Config.boShutRedMsgShowGMName then
            sC:=m_sCharName + ': ' + sData
          else sC:=sData;
          UserEngine.SendBroadCastMsg(sC,t_GM);
        end;
        exit;
      end;
    end;
    //004D2C70
    if CompareText(sCMD,g_GameCommand.HUMANLOCAL.sCmd) = 0 then begin
      CmdHumanLocal(@g_GameCommand.HUMANLOCAL,sParam1);
      Exit;
    end;
    if CompareText(sCMD,g_GameCommand.MOVE.sCmd) = 0 then begin
      CmdMapMove(@g_GameCommand.MOVE,sParam1);
      Exit;
    end;//004D2CD0
    if CompareText(sCMD,g_GameCommand.POSITIONMOVE.sCmd) = 0 then begin
      CmdPositionMove(@g_GameCommand.POSITIONMOVE,sParam1,sParam2,sParam3);
      Exit;
    end;
    if CompareText(sCMD,g_GameCommand.INFO.sCmd) = 0 then begin
      CmdHumanInfo(@g_GameCommand.INFO,sParam1);
      Exit;
    end;
    if CompareText(sCMD,g_GameCommand.MOBLEVEL.sCmd) = 0 then begin
      CmdMobLevel(@g_GameCommand.MOBLEVEL,sParam1);
      Exit;
    end;
    if CompareText(sCMD,g_GameCommand.MOBCOUNT.sCmd) = 0 then begin
      CmdMobCount(@g_GameCommand.MOBCOUNT,sParam1);
      Exit;
    end;
    if CompareText(sCMD,g_GameCommand.HUMANCOUNT.sCmd) = 0 then begin
      CmdHumanCount(@g_GameCommand.HUMANCOUNT,sParam1);
      Exit;
    end;
    if CompareText(sCMD,g_GameCommand.KICK.sCmd) = 0 then begin
      CmdKickHuman(@g_GameCommand.KICK,sParam1);
      Exit;
    end;
    if CompareText(sCMD,g_GameCommand.TING.sCmd) = 0 then begin
      CmdTing(@g_GameCommand.TING,sParam1);
      Exit;
    end;
    if CompareText(sCMD,g_GameCommand.SUPERTING.sCmd) = 0 then begin
      CmdSuperTing(@g_GameCommand.SUPERTING,sParam1,sParam2);
      Exit;
    end;
    if CompareText(sCMD,g_GameCommand.MAPMOVE.sCmd) = 0 then begin
      CmdMapMoveHuman(@g_GameCommand.MAPMOVE,sParam1,sParam2);
      Exit;
    end;
    if CompareText(sCMD,g_GameCommand.SHUTUP.sCmd) = 0 then begin
      CmdShutup(@g_GameCommand.SHUTUP,sParam1,sParam2);
      Exit;
    end;
    if CompareText(sCMD,g_GameCommand.MAP.sCmd) = 0 then begin
      CmdShowMapInfo(@g_GameCommand.MAP,sParam1);
      Exit;
    end;
    if CompareText(sCMD,g_GameCommand.RELEASESHUTUP.sCmd) = 0 then begin
      CmdShutupRelease(@g_GameCommand.RELEASESHUTUP,sParam1,True);
      Exit;
    end;
    if CompareText(sCMD,g_GameCommand.SHUTUPLIST.sCmd) = 0 then begin
      CmdShutupList(@g_GameCommand.SHUTUPLIST,sParam1);
      Exit;
    end;
    if CompareText(sCMD,g_GameCommand.GAMEMASTER.sCmd) = 0 then begin
      CmdChangeAdminMode(g_GameCommand.GAMEMASTER.sCmd,g_GameCommand.GAMEMASTER.nPermissionMin,sParam1,not m_boAdminMode);
      Exit;
    end;
    if CompareText(sCMD,g_GameCommand.OBSERVER.sCmd) = 0 then begin
      CmdChangeObMode(g_GameCommand.OBSERVER.sCmd,g_GameCommand.OBSERVER.nPermissionMin,sParam1,not m_boObMode);
      Exit;
    end;
    if CompareText(sCMD,g_GameCommand.SUEPRMAN.sCmd) = 0 then begin
      CmdChangeSuperManMode(g_GameCommand.OBSERVER.sCmd,g_GameCommand.OBSERVER.nPermissionMin,sParam1,not m_boSuperMan);
      Exit;
    end;
    if CompareText(sCMD,g_GameCommand.LEVEL.sCmd) = 0 then begin
      CmdChangeLevel(@g_GameCommand.LEVEL,sParam1);
      Exit;
    end;
    if CompareText(sCMD,g_GameCommand.SABUKWALLGOLD.sCmd) = 0 then begin
      CmdShowSbkGold(@g_GameCommand.SABUKWALLGOLD,sParam1,sParam2,sParam3);
      Exit;
    end;
    if CompareText(sCMD,g_GameCommand.RECALL.sCmd) = 0 then begin
      CmdRecallHuman(@g_GameCommand.RECALL,sParam1);
      Exit;
    end;
    if CompareText(sCMD,g_GameCommand.REGOTO.sCmd) = 0 then begin
      CmdReGotoHuman(@g_GameCommand.REGOTO,sParam1);
      Exit;
    end;
    if CompareText(sCMD,g_GameCommand.SHOWFLAG.sCmd) = 0 then begin
      CmdShowHumanFlag(g_GameCommand.SHOWFLAG.sCmd,g_GameCommand.SHOWFLAG.nPermissionMin,sParam1,sParam2);
      Exit;
    end;
    if CompareText(sCMD,g_GameCommand.SHOWOPEN.sCmd) = 0 then begin
      CmdShowHumanUnitOpen(g_GameCommand.SHOWOPEN.sCmd,g_GameCommand.SHOWOPEN.nPermissionMin,sParam1,sParam2);
      Exit;
    end;
    if CompareText(sCMD,g_GameCommand.SHOWUNIT.sCmd) = 0 then begin
      CmdShowHumanUnit(g_GameCommand.SHOWUNIT.sCmd,g_GameCommand.SHOWUNIT.nPermissionMin,sParam1,sParam2);
      Exit;
    end;
    if CompareText(sCMD,g_GameCommand.ATTACK.sCmd) = 0 then begin
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.MOB.sCmd) = 0 then begin
      CmdMob(@g_GameCommand.MOB,sParam1,Str_ToInt(sParam2,0),Str_ToInt(sParam3,0), Str_ToInt(sParam4,-1));
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.MOBNPC.sCmd) = 0 then begin
      CmdMobNpc(g_GameCommand.MOBNPC.sCmd,g_GameCommand.MOBNPC.nPermissionMin,sParam1,sParam2,sParam3,sParam4);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.NPCSCRIPT.sCmd) = 0 then begin
      CmdNpcScript(g_GameCommand.NPCSCRIPT.sCmd,g_GameCommand.NPCSCRIPT.nPermissionMin,sParam1,sParam2,sParam3);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.DELNPC.sCmd) = 0 then begin
      CmdDelNpc(g_GameCommand.DELNPC.sCmd,g_GameCommand.DELNPC.nPermissionMin,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.RECALLMOB.sCmd) = 0 then begin
      CmdRecallMob(@g_GameCommand.RECALLMOB,sParam1,Str_ToInt(sParam2,0),Str_ToInt(sParam3,0),Str_ToInt(sParam4,0),Str_ToInt(sParam5,0));
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.LUCKYPOINT.sCmd) = 0 then begin
      CmdLuckPoint(g_GameCommand.LUCKYPOINT.sCmd,g_GameCommand.LUCKYPOINT.nPermissionMin,sParam1,sParam2,sParam3);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.LOTTERYTICKET.sCmd) = 0 then begin
      CmdLotteryTicket(g_GameCommand.LOTTERYTICKET.sCmd,g_GameCommand.LOTTERYTICKET.nPermissionMin,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.RELOADGUILD.sCmd) = 0 then begin
      CmdReloadGuild(g_GameCommand.RELOADGUILD.sCmd,g_GameCommand.RELOADGUILD.nPermissionMin,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.RELOADLINENOTICE.sCmd) = 0 then begin
      CmdReloadLineNotice(g_GameCommand.RELOADLINENOTICE.sCmd,g_GameCommand.RELOADLINENOTICE.nPermissionMin,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.RELOADABUSE.sCmd) = 0 then begin
      CmdReloadAbuse(g_GameCommand.RELOADABUSE.sCmd,g_GameCommand.RELOADABUSE.nPermissionMin,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.FREEPENALTY.sCmd) = 0 then begin
      CmdFreePenalty(@g_GameCommand.FREEPENALTY,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.PKPOINT.sCmd) = 0 then begin
      CmdPKpoint(@g_GameCommand.PKPOINT,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.INCPKPOINT.sCmd) = 0 then begin
      CmdIncPkPoint(@g_GameCommand.INCPKPOINT,sParam1,Str_ToInt(sParam2,0));
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.MAKE.sCmd) = 0 then begin
      CmdMakeItem(@g_GameCommand.MAKE,sParam1,Str_ToInt(sParam2,0));
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.VIEWWHISPER.sCmd) = 0 then begin
      CmdViewWhisper(@g_GameCommand.VIEWWHISPER,sParam1,sParam2);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.REALIVE.sCmd) = 0 then begin
      CmdReAlive(@g_GameCommand.REALIVE,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.KILL.sCmd) = 0 then begin
      CmdKill(@g_GameCommand.KILL,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.SMAKE.sCmd) = 0 then begin
      CmdSmakeItem(@g_GameCommand.SMAKE,Str_ToInt(sParam1,0),Str_ToInt(sParam2,0),Str_ToInt(sParam3,0));
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.CHANGEJOB.sCmd) = 0 then begin
      CMdChangeJob(@g_GameCommand.CHANGEJOB,sParam1,sParam2);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.CHANGEGENDER.sCmd) = 0 then begin
      CmdChangeGender(@g_GameCommand.CHANGEGENDER,sParam1,sParam2);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.HAIR.sCmd) = 0 then begin
      CmdHair(@g_GameCommand.HAIR,sParam1,Str_ToInt(sParam2,0));
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.BONUSPOINT.sCmd) = 0 then begin
      CmdBonuPoint(@g_GameCommand.BONUSPOINT,sParam1,Str_ToInt(sParam2,0));
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.DELBONUSPOINT.sCmd) = 0 then begin
      CmdDelBonuPoint(@g_GameCommand.DELBONUSPOINT,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.RESTBONUSPOINT.sCmd) = 0 then begin
      CmdRestBonuPoint(@g_GameCommand.RESTBONUSPOINT,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.SETPERMISSION.sCmd) = 0 then begin
      CmdSetPermission(@g_GameCommand.SETPERMISSION,sParam1,sParam2);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.RENEWLEVEL.sCmd) = 0 then begin
      CmdReNewLevel(@g_GameCommand.RENEWLEVEL,sParam1,sParam2);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.DELGOLD.sCmd) = 0 then begin
      CmdDelGold(@g_GameCommand.DELGOLD,sParam1,Str_ToInt(sParam2,0));
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.ADDGOLD.sCmd) = 0 then begin
      CmdAddGold(@g_GameCommand.ADDGOLD,sParam1,Str_ToInt(sParam2,0));
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.GAMEGOLD.sCmd) = 0 then begin
      CmdGameGold(@g_GameCommand.GAMEGOLD,sParam1,sParam2,Str_ToInt(sParam3,0));
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.GAMEPOINT.sCmd) = 0 then begin
      CmdGamePoint(@g_GameCommand.GAMEPOINT,sParam1,sParam2,Str_ToInt(sParam3,0));
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.CREDITPOINT.sCmd) = 0 then begin
      CmdCreditPoint(@g_GameCommand.CREDITPOINT,sParam1,sParam2,Str_ToInt(sParam3,0));
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.TRAINING.sCmd) = 0 then begin
      CmdTrainingSkill(@g_GameCommand.TRAINING,sParam1,sParam2,Str_ToInt(sParam3,0));
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.DELETEITEM.sCmd) = 0 then begin
      CmdDeleteItem(@g_GameCommand.DELETEITEM,sParam1,sParam2,Str_ToInt(sParam3,1));
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.DELETESKILL.sCmd) = 0 then begin
      CmdDelSkill(@g_GameCommand.DELETESKILL,sParam1,sParam2);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.TRAININGSKILL.sCmd) = 0 then begin
      CmdTrainingMagic(@g_GameCommand.TRAININGSKILL,sParam1,sParam2,Str_ToInt(sParam3,0));
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.CLEARMISSION.sCmd) = 0 then begin
      CmdClearMission(@g_GameCommand.CLEARMISSION,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.STARTQUEST.sCmd) = 0 then begin
      CmdStartQuest(@g_GameCommand.STARTQUEST,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.DENYIPLOGON.sCmd) = 0 then begin
      CmdDenyIPaddrLogon(@g_GameCommand.DENYIPLOGON,sParam1,sParam2);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.CHANGEDEARNAME.sCmd) = 0 then begin
      CmdChangeDearName(@g_GameCommand.CHANGEDEARNAME,sParam1,sParam2);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.CHANGEMASTERNAME.sCmd) = 0 then begin
      CmdChangeMasterName(@g_GameCommand.CHANGEMASTERNAME,sParam1,sParam2,sParam3);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.CLEARMON.sCmd) = 0 then begin
      CmdClearMapMonster(@g_GameCommand.CLEARMON,sParam1,sParam2,sParam3);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.DENYACCOUNTLOGON.sCmd) = 0 then begin
      CmdDenyAccountLogon(@g_GameCommand.DENYACCOUNTLOGON,sParam1,sParam2);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.DENYCHARNAMELOGON.sCmd) = 0 then begin
      CmdDenyCharNameLogon(@g_GameCommand.DENYCHARNAMELOGON,sParam1,sParam2);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.DELDENYIPLOGON.sCmd) = 0 then begin
      CmdDelDenyIPaddrLogon(@g_GameCommand.DELDENYIPLOGON,sParam1,sParam2);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.DELDENYACCOUNTLOGON.sCmd) = 0 then begin
      CmdDelDenyAccountLogon(@g_GameCommand.DELDENYACCOUNTLOGON,sParam1,sParam2);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.DELDENYCHARNAMELOGON.sCmd) = 0 then begin
      CmdDelDenyCharNameLogon(@g_GameCommand.DELDENYCHARNAMELOGON,sParam1,sParam2);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.SHOWDENYIPLOGON.sCmd) = 0 then begin
      CmdShowDenyIPaddrLogon(@g_GameCommand.SHOWDENYIPLOGON,sParam1,sParam2);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.SHOWDENYACCOUNTLOGON.sCmd) = 0 then begin
      CmdShowDenyAccountLogon(@g_GameCommand.SHOWDENYACCOUNTLOGON,sParam1,sParam2);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.SHOWDENYCHARNAMELOGON.sCmd) = 0 then begin
      CmdShowDenyCharNameLogon(@g_GameCommand.SHOWDENYCHARNAMELOGON,sParam1,sParam2);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.MISSION.sCmd) = 0 then begin
      CmdMission(@g_GameCommand.MISSION,sParam1,sParam2);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.MOBPLACE.sCmd) = 0 then begin
      CmdMobPlace(@g_GameCommand.MOBPLACE,sParam1,sParam2,sParam3,sParam4);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.SETMAPMODE.sCmd) = 0 then begin
      CmdSetMapMode(g_GameCommand.SETMAPMODE.sCmd,sParam1,sParam2,sParam3,sParam4);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.SHOWMAPMODE.sCmd) = 0 then begin
      CmdShowMapMode(g_GameCommand.SHOWMAPMODE.sCmd,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.CLRPASSWORD.sCmd) = 0 then begin
      CmdClearHumanPassword(g_GameCommand.CLRPASSWORD.sCmd,g_GameCommand.CLRPASSWORD.nPermissionMin,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.CONTESTPOINT.sCmd) = 0 then begin
      CmdContestPoint(@g_GameCommand.CONTESTPOINT,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.STARTCONTEST.sCmd) = 0 then begin
      CmdStartContest(@g_GameCommand.STARTCONTEST,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.ENDCONTEST.sCmd) = 0 then begin
      CmdEndContest(@g_GameCommand.ENDCONTEST,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.ANNOUNCEMENT.sCmd) = 0 then begin
      CmdAnnouncement(@g_GameCommand.ANNOUNCEMENT,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.DISABLESENDMSG.sCmd) = 0 then begin
      CmdDisableSendMsg(@g_GameCommand.DISABLESENDMSG,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.ENABLESENDMSG.sCmd) = 0 then begin
      CmdEnableSendMsg(@g_GameCommand.ENABLESENDMSG,sParam1);
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.REFINEWEAPON.sCmd) = 0 then begin
      CmdRefineWeapon(@g_GameCommand.REFINEWEAPON,Str_ToInt(sParam1,0),Str_ToInt(sParam2,0),Str_ToInt(sParam3,0),Str_ToInt(sParam4,0));
      exit;
    end;
    if CompareText(sCMD,g_GameCommand.DISABLESENDMSGLIST.sCmd) = 0 then begin
      CmdDisableSendMsgList(@g_GameCommand.DISABLESENDMSGLIST);
      exit;
    end;
    if m_btPermission > 4 then begin
      if CompareText(sCMD,g_GameCommand.BACKSTEP.sCmd) = 0 then begin
        CmdBackStep(sCmd,Str_ToInt(sParam1,0),Str_ToInt(sParam2,1));
        exit;
      end;
      if CompareText(sCMD,g_GameCommand.BALL.sCmd) = 0 then begin //精神波
        exit;
      end;

      if CompareText(sCMD,g_GameCommand.CHANGELUCK.sCmd) = 0 then begin
        exit;
      end;
      if CompareText(sCMD,g_GameCommand.HUNGER.sCmd) = 0 then begin
        CmdHunger(g_GameCommand.HUNGER.sCmd,sParam1,Str_ToInt(sParam2,0));
        exit;
      end;

      if CompareText(sCMD,g_GameCommand.NAMECOLOR.sCmd) = 0 then begin
        exit;
      end;

      if CompareText(sCMD,g_GameCommand.TRANSPARECY.sCmd) = 0 then begin
        exit;
      end;
      if CompareText(sCMD,g_GameCommand.LEVEL0.sCmd) = 0 then begin
        exit;
      end;

      if CompareText(sCMD,g_GameCommand.SETFLAG.sCmd) = 0 then begin //004D3BDD
        PlayObject:=UserEngine.GeTPlayObject(sParam1);
        if PlayObject <> nil then begin
          nFlag:=Str_ToInt(sParam2,0);
          nValue:=Str_ToInt(sParam3,0);
          PlayObject.SetQuestFlagStatus(nFlag,nValue);
          if PlayObject.GetQuestFalgStatus(nFlag) = 1 then begin
            SysMsg(PlayObject.m_sCharName + ': [' + IntToStr(nFlag) + '] = ON',c_Green,t_Hint);
          end else begin
            SysMsg(PlayObject.m_sCharName + ': [' + IntToStr(nFlag) + '] = OFF',c_Green,t_Hint);
          end;
        end else begin
          SysMsg('@' + g_GameCommand.SETFLAG.sCmd + ' 人物名称 标志号 数字(0 - 1)',c_Red,t_Hint);
        end;
        exit;
      end;
      if CompareText(sCMD,g_GameCommand.SETOPEN.sCmd) = 0 then begin
        PlayObject:=UserEngine.GeTPlayObject(sParam1);
        if PlayObject <> nil then begin
          nFlag:=Str_ToInt(sParam2,0);
          nValue:=Str_ToInt(sParam3,0);
          PlayObject.SetQuestUnitOpenStatus(nFlag,nValue);
          if PlayObject.GetQuestUnitOpenStatus(nFlag) = 1 then begin
            SysMsg(PlayObject.m_sCharName + ': [' + IntToStr(nFlag) + '] = ON',c_Green,t_Hint);
          end else begin
            SysMsg(PlayObject.m_sCharName + ': [' + IntToStr(nFlag) + '] = OFF',c_Green,t_Hint);
          end;
        end else begin
          SysMsg('@' + g_GameCommand.SETOPEN.sCmd + ' 人物名称 标志号 数字(0 - 1)',c_Red,t_Hint);
        end;
        exit;
      end;
      if CompareText(sCMD,g_GameCommand.SETUNIT.sCmd) = 0 then begin
        PlayObject:=UserEngine.GeTPlayObject(sParam1);
        if PlayObject <> nil then begin
          nFlag:=Str_ToInt(sParam2,0);
          nValue:=Str_ToInt(sParam3,0);
          PlayObject.SetQuestUnitStatus(nFlag,nValue);
          if PlayObject.GetQuestUnitStatus(nFlag) = 1 then begin
            SysMsg(PlayObject.m_sCharName + ': [' + IntToStr(nFlag) + '] = ON',c_Green,t_Hint);
          end else begin
            SysMsg(PlayObject.m_sCharName + ': [' + IntToStr(nFlag) + '] = OFF',c_Green,t_Hint);
          end;
        end else begin
          SysMsg('@' + g_GameCommand.SETUNIT.sCmd + ' 人物名称 标志号 数字(0 - 1)',c_Red,t_Hint);
        end;
        exit;
      end;
      if CompareText(sCMD,g_GameCommand.RECONNECTION.sCmd) = 0 then begin
        CmdReconnection(sCmd,sParam1,sParam2);
        exit;
      end;
      if CompareText(sCMD,g_GameCommand.DISABLEFILTER.sCmd) = 0 then begin
        CmdDisableFilter(sCmd,sParam1);
        exit;
      end;
      if CompareText(sCMD,g_GameCommand.CHGUSERFULL.sCmd) = 0 then begin
        CmdChangeUserFull(sCmd,sParam1);
        exit;
      end;
      if CompareText(sCMD,g_GameCommand.CHGZENFASTSTEP.sCmd) = 0 then begin
        CmdChangeZenFastStep(sCmd,sParam1);
        exit;
      end;

      if CompareText(sCMD,g_GameCommand.OXQUIZROOM.sCmd) = 0 then begin
        exit;
      end;
      if CompareText(sCMD,g_GameCommand.GSA.sCmd) = 0 then begin
        exit;
      end;
      if CompareText(sCMD,g_GameCommand.CHANGEITEMNAME.sCmd) = 0 then begin
        CmdChangeItemName(g_GameCommand.CHANGEITEMNAME.sCmd,sParam1,sParam2,sParam3);
        exit;
      end;
      if (m_btPermission >= 5) or (g_Config.boTestServer)then begin

        if CompareText(sCMD,g_GameCommand.FIREBURN.sCmd) = 0 then begin
          CmdFireBurn(Str_ToInt(sParam1,0),Str_ToInt(sParam2,0),Str_ToInt(sParam3,0));
          exit;
        end;
        if CompareText(sCMD,g_GameCommand.TESTFIRE.sCmd) = 0 then begin
          CmdTestFire(sCmd,Str_ToInt(sParam1,0),Str_ToInt(sParam2,0),Str_ToInt(sParam3,0),Str_ToInt(sParam4,0));
          exit;
        end;
        if CompareText(sCMD,g_GameCommand.TESTSTATUS.sCmd) = 0 then begin
          CmdTestStatus(sCmd,Str_ToInt(sParam1,-1),Str_ToInt(sParam2,0));
          exit;
        end;
        if CompareText(sCMD,g_GameCommand.DELGAMEGOLD.sCmd) = 0 then begin
          CmdDelGameGold(g_GameCommand.DELGAMEGOLD.sCmd,sParam1,Str_ToInt(sParam2,0));
          exit;
        end;
        if CompareText(sCMD,g_GameCommand.ADDGAMEGOLD.sCmd) = 0 then begin
          CmdAddGameGold(g_GameCommand.ADDGAMEGOLD.sCmd,sParam1,Str_ToInt(sParam2,0));
          exit;
        end;
        if CompareText(sCMD,g_GameCommand.TESTGOLDCHANGE.sCmd) = 0 then begin
          exit;
        end;

        if CompareText(sCMD,g_GameCommand.RELOADADMIN.sCmd) = 0 then begin
          CmdReLoadAdmin(g_GameCommand.RELOADADMIN.sCmd);
          exit;
        end;
        if CompareText(sCMD,g_GameCommand.RELOADNPC.sCmd) = 0 then begin
          CmdReloadNpc(sParam1);
          exit;
        end;
        if CompareText(sCMD,g_GameCommand.RELOADMANAGE.sCmd) = 0 then begin
          CmdReloadManage(@g_GameCommand.RELOADMANAGE,sParam1);
          exit;
        end;
        if CompareText(sCMD,g_GameCommand.RELOADROBOTMANAGE.sCmd) = 0 then begin
          CmdReloadRobotManage();
          exit;
        end;
        if CompareText(sCMD,g_GameCommand.RELOADROBOT.sCmd) = 0 then begin
          CmdReloadRobot();
          exit;
        end;
        if CompareText(sCMD,g_GameCommand.RELOADMONITEMS.sCmd) = 0 then begin
          CmdReLoadMonitems();
          exit;
        end;
        if CompareText(sCMD,g_GameCommand.RELOADDIARY.sCmd) = 0 then begin
          exit;
        end;
        if CompareText(sCMD,g_GameCommand.RELOADITEMDB.sCmd) = 0 then begin
          FrmDB.LoadItemsDB();
          SysMsg('物品数据库重新加载完成。',c_Green,t_Hint);
          exit;
        end;
        if CompareText(sCMD,g_GameCommand.RELOADMAGICDB.sCmd) = 0 then begin
          //FrmDB.LoadMagicDB();
          //SysMsg('魔法数据库重新加载完成。',c_Green,t_Hint);
          exit;
        end;
        if CompareText(sCMD,g_GameCommand.RELOADMONSTERDB.sCmd) = 0 then begin
          FrmDB.LoadMonsterDB();
          SysMsg('怪物数据库重新加载完成。',c_Green,t_Hint);
          exit;
        end;
        if CompareText(sCMD,g_GameCommand.RELOADMINMAP.sCmd) = 0 then begin
          //FrmDB.LoadMinMap();
          //g_MapManager.ReSetMinMap();
          SysMsg('小地图配置重新加载完成。',c_Green,t_Hint);
          exit;
        end;

        if CompareText(sCMD,g_GameCommand.ADJUESTLEVEL.sCmd) = 0 then begin
          CmdAdjuestLevel(@g_GameCommand.ADJUESTLEVEL,sParam1,Str_ToInt(sParam2,1));
          exit;
        end;
        if CompareText(sCMD,g_GameCommand.ADJUESTEXP.sCmd) = 0 then begin
          CmdAdjuestExp(@g_GameCommand.ADJUESTEXP,sParam1,sParam2);
          exit;
        end;
        if CompareText(sCMD,g_GameCommand.ADDGUILD.sCmd) = 0 then begin
          CmdAddGuild(@g_GameCommand.ADDGUILD,sParam1,sParam2);
          exit;
        end;
        if CompareText(sCMD,g_GameCommand.DELGUILD.sCmd) = 0 then begin
          CmdDelGuild(@g_GameCommand.DELGUILD,sParam1);
          exit;
        end;
        if (CompareText(sCMD,g_GameCommand.CHANGESABUKLORD.sCmd) = 0) then begin
          CmdChangeSabukLord(@g_GameCommand.CHANGESABUKLORD,sParam1,sParam2,True);
          exit;
        end;
        if CompareText(sCMD,g_GameCommand.FORCEDWALLCONQUESTWAR.sCmd) = 0 then begin
          CmdForcedWallconquestWar(@g_GameCommand.FORCEDWALLCONQUESTWAR,sParam1);
          exit;
        end;
        if CompareText(sCMD,g_GameCommand.ADDTOITEMEVENT.sCmd) = 0 then begin
          exit;
        end;
        if CompareText(sCMD,g_GameCommand.ADDTOITEMEVENTASPIECES.sCmd) = 0 then begin
          exit;
        end;
        if CompareText(sCMD,g_GameCommand.ITEMEVENTLIST.sCmd) = 0 then begin
          exit;
        end;
        if CompareText(sCMD,g_GameCommand.STARTINGGIFTNO.sCmd) = 0 then begin
          exit;
        end;
        if CompareText(sCMD,g_GameCommand.DELETEALLITEMEVENT.sCmd) = 0 then begin
          exit;
        end else
        if CompareText(sCMD,g_GameCommand.STARTITEMEVENT.sCmd) = 0 then begin
          exit;
        end else
        if CompareText(sCMD,g_GameCommand.ITEMEVENTTERM.sCmd) = 0 then begin
          exit;
        end else
        if CompareText(sCMD,g_GameCommand.ADJUESTTESTLEVEL.sCmd) = 0 then begin
          exit;
        end else
        if CompareText(sCMD,g_GameCommand.OPDELETESKILL.sCmd) = 0 then begin
          exit;
        end else
        if CompareText(sCMD,g_GameCommand.CHANGEWEAPONDURA.sCmd) = 0 then begin
          exit;
        end else
        if CompareText(sCMD,g_GameCommand.RELOADGUILDALL.sCmd) = 0 then begin
          exit;
        end else
        if CompareText(sCMD,g_GameCommand.SPIRIT.sCmd) = 0 then begin
          CmdSpirtStart(g_GameCommand.SPIRIT.sCmd,sParam1);
          exit;
        end else
        if CompareText(sCMD,g_GameCommand.SPIRITSTOP.sCmd) = 0 then begin
          CmdSpirtStop(g_GameCommand.SPIRITSTOP.sCmd,sParam1);
          exit;
        end else
        if CompareText(sCMD,g_GameCommand.TESTSERVERCONFIG.sCmd) = 0 then begin
          SendServerConfig();
          exit;
        end else
        if CompareText(sCMD,g_GameCommand.SERVERSTATUS.sCmd) = 0 then begin
          SendServerStatus();
          exit;
        end else
        if CompareText(sCMD,g_GameCommand.TESTGETBAGITEM.sCmd) = 0 then begin
          CmdTestGetBagItems(@g_GameCommand.TESTGETBAGITEM,sParam1);
          exit;
        end else
        if CompareText(sCMD,g_GameCommand.MOBFIREBURN.sCmd) = 0 then begin
          CmdMobFireBurn(@g_GameCommand.MOBFIREBURN,sParam1,sParam2,sParam3,sParam4,sParam5,sParam6);
          exit;
        end else
        if CompareText(sCMD,g_GameCommand.TESTSPEEDMODE.sCmd) = 0 then begin
          CmdTestSpeedMode(@g_GameCommand.TESTSPEEDMODE);
          exit;
        end
      end;
    end;//004D52B5
    SysMsg('@' + sCMD + ' 此命令不正确，或没有足够的权限！！！',c_Red,t_Hint);
except
  on e: Exception do begin
    MainOutMessage(format(sExceptionMsg,[sData]));
    MainOutMessage(E.Message);
  end;
end;
end;
// else begin//004D4D8B

procedure TPlayObject.ProcessSayMsg(sData:String);
var
  boDisableSayMsg:Boolean;
  sC,sCryCryMsg,sParam1:String;
ResourceString
  sExceptionMsg = '[Exception] TPlayObject.ProcessSayMsg Msg = %s';
begin
  try
    if length(sData) > g_Config.nSayMsgMaxLen then begin
      sData:=Copy(sData,1,g_Config.nSayMsgMaxLen);
    end;

    if {(sData = m_sOldSayMsg) and} ((GetTickCount - m_dwSayMsgTick) < g_Config.dwSayMsgTime{3 * 1000}) then begin
      Inc(m_nSayMsgCount);
      if m_nSayMsgCount >= g_Config.nSayMsgCount{2} then begin
        m_boDisableSayMsg:=True;
        m_dwDisableSayMsgTick:=GetTickCount + g_Config.dwDisableSayMsgTime{60 * 1000};
        SysMsg(format(g_sDisableSayMsg,[g_Config.dwDisableSayMsgTime div (60 * 1000)]),c_Red,t_Hint);
        //'[由于你重复发相同的内容，%d分钟内你将被禁止发言...]'
      end;
    end else begin  //004D4DF6
      m_dwSayMsgTick:=GetTickCount();
      m_nSayMsgCount:=0;
    end;

    if GetTickCount >= m_dwDisableSayMsgTick  then m_boDisableSayMsg:=False;
    boDisableSayMsg:=m_boDisableSayMsg;
    g_DenySayMsgList.Lock;
    try
      if g_DenySayMsgList.GetIndex(m_sCharName) >= 0 then boDisableSayMsg:=True;
    finally
      g_DenySayMsgList.UnLock;
    end;

    if not (boDisableSayMsg or m_PEnvir.Flag.boNOCHAT) then begin
      //Log it..
      try
        g_ChatLoggingList.Lock;
        g_ChatLoggingList.Add('['+DateTimeToStr(Now)+'] ' +m_sCharName+ ': ' +sData);
      finally
        g_ChatLoggingList.unLock;
      end;

      m_sOldSayMsg:=sData;
      if sData[1] = '/' then begin
        sC:=Copy(sData,2,length(sData) - 1);
        if CompareText(Trim(sC),Trim(g_GameCommand.WHO.sCmd)) = 0 then begin
          if (m_btPermission < g_GameCommand.WHO.nPermissionMin) then begin
            SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
            exit;
          end;
          HearMsg(format(g_sOnlineCountMsg,[UserEngine.PlayObjectCount]));
          exit;
        end; //004D4F03
        if CompareText(Trim(sC),Trim(g_GameCommand.TOTAL.sCmd)) = 0 then begin
          if (m_btPermission < g_GameCommand.TOTAL.nPermissionMin) then begin
            SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
            exit;
          end;
          HearMsg(format(g_sTotalOnlineCountMsg,[g_nTotalHumCount]));
          exit;
        end ;  //004D4F5B
        sC:=GetValidStr3(sC,sParam1,[' ']);
        if not m_boFilterSendMsg then
          Whisper(sParam1,sC);
        exit;
      end;
      if sData[1] = '!' then begin
        if length(sData) >= 2 then begin
          if sData[2] = '!' then begin
            sC:=Copy(sData,3,length(sData) - 2);
            SendGroupText(m_sCharName + ': ' + sC);
            exit;
          end;
          if sData[2] = '~' then begin
            if m_MyGuild <> nil then begin
              sC:=Copy(sData,3,length(sData) - 2);
              TGuild(m_MyGuild).SendGuildMsg(m_sCharName + ': ' + sC);
              UserEngine.SendServerGroupMsg(SS_208,nServerIndex,TGuild(m_MyGuild).sGuildName + '/' + m_sCharName + '/' +sC);
            end;
            exit;
          end;
        end; //004D512C
        if not m_PEnvir.Flag.boQUIZ then begin
          if (GetTickCount - m_dwShoutMsgTick) > 10 * 1000 then begin
            if m_Abil.Level <= g_Config.nCanShoutMsgLevel then begin
              //SysMsg('你的等级要在' + IntToStr(g_nCanShoutMsgLevel + 1) + '级以上才能用此功能！！！',c_Red,t_Hint);
              SysMsg(format(g_sYouNeedLevelMsg,[g_Config.nCanShoutMsgLevel + 1]),c_Red,t_Hint);

              exit;
            end;
            m_dwShoutMsgTick:=GetTickCount();
            sC:=Copy(sData,2,length(sData) -1);
            sCryCryMsg:='(!)' + m_sCharName + ': ' + sC;
            if m_boFilterSendMsg then begin
              SendMsg(nil,RM_CRY,0,0,$FFFF,0,sCryCryMsg);
            end else begin
              UserEngine.CryCry(RM_CRY,m_PEnvir,m_nCurrX,m_nCurrY,50,g_Config.btCryMsgFColor,g_Config.btCryMsgBColor,sCryCryMsg);
            end;
            exit;
          end;
          //SysMsg(IntToStr(10 - (GetTickCount - m_dwShoutMsgTick) div 1000) + '  Seconds爐ill爕ou燾an爏hout.',c_Red,t_Hint);
          SysMsg(format(g_sYouCanSendCyCyLaterMsg,[10 - (GetTickCount - m_dwShoutMsgTick) div 1000]),c_Red,t_Hint);

          exit;
        end;
        SysMsg(g_sThisMapDisableSendCyCyMsg{'本地图不允许喊话！！！'},c_Red,t_Hint);
        exit;
      end;  //004D5299
      if m_boFilterSendMsg then begin //如果禁止发信息，则只向自己发信息
        SendMsg(Self,RM_HEAR,0,g_Config.btHearMsgFColor,g_Config.btHearMsgBColor,0,m_sCharName + ':' + sData);
      end else begin
        inherited;
      end;
//      ProcessSayMsg(sData);
      exit;
    end;
    SysMsg(g_sYouIsDisableSendMsg{'禁止聊天'},c_Red,t_Hint);
except
  on e: Exception do begin
    MainOutMessage(format(sExceptionMsg,[sData]));
    MainOutMessage(E.Message);
  end;
end;
end;


function TPlayObject.ClientHitXY(wIdent: Word; nX, nY, nDir: Integer;boLateDelivery:Boolean;var dwDelayTime:LongWord): Boolean; //004CB7F8
var
  n14,n18:Integer;
  StdItem:TItem;
  dwAttackTime,dwCheckTime:LongWord;
ResourceString
  sExceptionMsg = '[Exception] TPlayObject::ClientHitXY';
begin

  Result:=False;
  dwDelayTime:=0;
try
  if not m_boCanHit then exit;

  if m_boDeath or ((m_wStatusTimeArr[POISON_STONE{5}]{0x6A} <> 0) and not g_Config.ClientConf.boParalyCanHit) then exit;//防麻
  if not boLateDelivery then begin
    if not CheckActionStatus(wIdent,dwDelayTime) then begin
      m_boFilterAction:=False;
      exit;
    end;
    m_boFilterAction:=True;
    dwAttackTime:=_MAX(0,Integer(g_Config.dwHitIntervalTime) - m_nHitSpeed * g_Config.ClientConf.btItemSpeed); //防止负数出错
    dwCheckTime:=GetTickCount - m_dwAttackTick;
    if dwCheckTime < dwAttackTime then begin
      Inc(m_dwAttackCount);
      dwDelayTime:=dwAttackTime - dwCheckTime;
      if dwDelayTime > g_Config.dwDropOverSpeed then  begin
        if m_dwAttackCount >= 4 then begin
          m_dwAttackTick:=GetTickCount();
          m_dwAttackCount:=0;
          dwDelayTime:=g_Config.dwDropOverSpeed;
          if m_boTestSpeedMode then
            SysMsg('攻击忙复位！！！' + IntTOStr(dwDelayTime),c_Red,t_Hint);
        end else m_dwAttackCount:=0;
        exit;
      end else begin
        if m_boTestSpeedMode then
          SysMsg('攻击步忙！！！' + IntTOStr(dwDelayTime),c_Red,t_Hint);
        exit;
      end;
    end;
  end;
  {
  if (GetTickCount - m_dwAttackTick) > (900 - m_btHitSpeed * 60) then begin
    m_dwAttackCount:=0;
    if m_dwAttackCountA > 0 then Dec(m_dwAttackCountA);
  end else begin
    Inc(m_dwAttackCount);
    Inc(m_dwAttackCountA);
  end;

  if (m_dwAttackCount >= 4) or (m_dwAttackCountA >= 6) then begin
    m_dwAttackTick:=GetTickCount();
    Inc(m_dwOverSpeedCount);
    //if m_dwOverSpeedCount > 8 then m_boEmergencyClose:=True;
    SysMsg('攻击超速！！！',c_Red,t_Hint);
    if boViewHackMessage then
      MainOutMessage('[11000-Hit] ' + m_sCharName + ' ' + DateToStr(Now));
    exit;
  end;
  }
//  if not m_boDeath then begin
    if (nX = m_nCurrX) and (nY = m_nCurrY) then begin
      Result:=True;
      m_dwAttackTick:=GetTickCount();
      if (wIdent = CM_HEAVYHIT) and (m_UseItems[U_WEAPON].Dura > 0) then begin//挖矿
        if GetFrontPosition(n14,n18) and not m_PEnvir.CanWalk(n14,n18,False) then begin   //sub_004B2790
          StdItem:=UserEngine.GetStdItem(m_UseItems[U_WEAPON].wIndex);
          if (StdItem <> nil) and (StdItem.Shape = 19)then begin
            if PileStones(n14,n18) then SendSocket(nil,'=DIG');
            Dec(m_nHealthTick,30);
            Dec(m_nSpellTick,50);
            m_nSpellTick:=_MAX(0,m_nSpellTick);
            Dec(m_nPerHealth,2);
            Dec(m_nPerSpell,2);
            exit;
          end;
        end;
      end;
      if wIdent = CM_HIT      then AttackDir(nil,0,nDir);
      if wIdent = CM_HEAVYHIT then AttackDir(nil,1,nDir);
      if wIdent = CM_BIGHIT   then AttackDir(nil,2,nDir);
      if wIdent = CM_POWERHIT then AttackDir(nil,3,nDir);
      if wIdent = CM_LONGHIT  then AttackDir(nil,4,nDir);
      if wIdent = CM_WIDEHIT  then AttackDir(nil,5,nDir);
      if wIdent = CM_FIREHIT  then AttackDir(nil,7,nDir);
      if wIdent = CM_CRSHIT   then AttackDir(nil,8,nDir);
      if wIdent = CM_TWINHIT    then AttackDir(nil,9,nDir);
      if wIdent = CM_42HIT    then AttackDir(nil,10,nDir);
      if wIdent = CM_42HIT    then AttackDir(nil,11,nDir);
      if (m_MagicPowerHitSkill <> nil) and (m_UseItems[U_WEAPON].Dura > 0) then begin
        Dec(m_btAttackSkillCount);
        if m_btAttackSkillPointCount = m_btAttackSkillCount then begin
          m_boPowerHit:=True;
          SendSocket(nil,'+PWR');
        end;
        if m_btAttackSkillCount <= 0 then begin
          m_btAttackSkillCount:=7 - m_MagicPowerHitSkill.btLevel;
          m_btAttackSkillPointCount:=Random(m_btAttackSkillCount);
        end;
      end;
      Dec(m_nHealthTick,30);
      Dec(m_nSpellTick,100);
      m_nSpellTick:=_MAX(0,m_nSpellTick);
      Dec(m_nPerHealth,2);
      Dec(m_nPerSpell,2);  //004CBB62
    end;
//  end else Result:=False;
except
  on e: Exception do begin
    MainOutMessage(sExceptionMsg);
    MainOutMessage(E.Message);
  end;
end;
end;

function TPlayObject.ClientHorseRunXY(wIdent: Word; nX, nY: Integer;boLateDelivery:Boolean;
  var dwDelayTime: LongWord): Boolean;
var
  n14:Integer;
  dwCheckTime:LongWord;
begin
  Result:=False;
  dwDelayTime:=0;

    
  if not m_boCanRun then exit;
  if m_boDeath or ((m_wStatusTimeArr[POISON_STONE{5}]{0x6A} <> 0) and not g_Config.ClientConf.boParalyCanRun) then exit;//防麻
  if not boLateDelivery then begin

  if not CheckActionStatus(wIdent,dwDelayTime) then begin
    m_boFilterAction:=False;
    exit;
  end;
  m_boFilterAction:=True;
  dwCheckTime:=GetTickCount - m_dwMoveTick;
  if dwCheckTime < g_Config.dwRunIntervalTime then begin
    Inc(m_dwMoveCount);
    dwDelayTime:=g_Config.dwRunIntervalTime - dwCheckTime;
    if dwDelayTime > g_Config.dwDropOverSpeed then  begin
      if m_dwMoveCount >= 4 then begin
        m_dwMoveTick:=GetTickCount();
        m_dwMoveCount:=0;
        dwDelayTime:=g_Config.dwDropOverSpeed;
        if m_boTestSpeedMode then
          SysMsg('马跑步忙复位！！！' + IntTOStr(dwDelayTime),c_Red,t_Hint);
      end else m_dwMoveCount:=0;
      exit;
    end else begin
      if m_boTestSpeedMode then
        SysMsg('马跑步忙！！！' + IntTOStr(dwDelayTime),c_Red,t_Hint);
      exit;
    end;
  end;
  end;

  m_dwMoveTick:=GetTickCount();
    m_bo316:=False;
{$IF DEBUG = 1}
    SysMsg(format('当前X:%d 当前Y:%d 目标X:%d 目标Y:%d',[m_nCurrX,m_nCurrY,nX,nY]),c_Green,t_Hint);
{$IFEND}
    n14:=GetNextDirection(m_nCurrX,m_nCurrY,nX,nY);
    if HorseRunTo(n14,False) then begin
      if m_boTransparent and (m_boHideMode) then m_wStatusTimeArr[STATE_TRANSPARENT{0 0x70}]:=1;  //004CB212

      if m_bo316 or ((m_nCurrX = nX) and (m_nCurrY = nY)) then
        Result:=True;
      Dec(m_nHealthTick,60);
      Dec(m_nSpellTick,10);
      m_nSpellTick:=_MAX(0,m_nSpellTick);
      Dec(m_nPerHealth);
      Dec(m_nPerSpell);
    end else begin
      m_dwMoveCount:=0;
      m_dwMoveCountA:=0;
    end;
end;

function TPlayObject.ClientSpellXY(wIdent:Word;nKey:Integer;nTargetX, nTargetY:Integer;TargeTBaseObject: TBaseObject;boLateDelivery:Boolean;var dwDelayTime:LongWord): Boolean;//004CBCEC
var
  UserMagic     :pTUserMagic;
  nSpellPoint   :Integer;
  n14           :Integer;
  BaseObject    :TBaseObject;
  dwCheckTime   :LongWord;
  boIsWarrSkill :Boolean;
begin
  Result:=False;
  dwDelayTime:=0;

  if not m_boCanSpell then exit;
  if m_boDeath or ((m_wStatusTimeArr[POISON_STONE{5}]{0x6A} <> 0) and not g_Config.ClientConf.boParalyCanSpell) then exit;//防麻

  UserMagic:=GetMagicInfo(nKey);
  if UserMagic = nil then exit;
  boIsWarrSkill:=MagicManager.IsWarrSkill(UserMagic.wMagIdx);

  if not boLateDelivery and not boIsWarrSkill then begin
    if not CheckActionStatus(wIdent,dwDelayTime) then begin
      m_boFilterAction:=False;
      exit;
    end;
    m_boFilterAction:=True;
    dwCheckTime:=GetTickCount - m_dwMagicAttackTick;
    if dwCheckTime < m_dwMagicAttackInterval then begin
      Inc(m_dwMagicAttackCount);
      dwDelayTime:=m_dwMagicAttackInterval - dwCheckTime;
      if dwDelayTime > g_Config.dwMagicHitIntervalTime div 3 then  begin
        if m_dwMagicAttackCount >= 4 then begin
          m_dwMagicAttackTick:=GetTickCount();
          m_dwMagicAttackCount:=0;
          dwDelayTime:=g_Config.dwMagicHitIntervalTime div 3;
          if m_boTestSpeedMode then
            SysMsg('魔法忙复位！！！' + IntTOStr(dwDelayTime),c_Red,t_Hint);
        end else m_dwMagicAttackCount:=0;
        exit;
      end else begin
        if m_boTestSpeedMode then
          SysMsg('魔法忙！！！' + IntTOStr(dwDelayTime),c_Red,t_Hint);
        exit;
      end;
    end;
  end;
  
    Dec(m_nSpellTick,450);
    m_nSpellTick:=_MAX(0,m_nSpellTick);


      if boIsWarrSkill then begin
        //m_dwMagicAttackInterval:=0;
        //m_dwMagicAttackInterval:=g_Config.dwMagicHitIntervalTime; //01/21 改成此行
      end else begin
        m_dwMagicAttackInterval:=UserMagic.MagicInfo.dwDelayTime + g_Config.dwMagicHitIntervalTime;
      end;
      m_dwMagicAttackTick:=GetTickCount();
      case UserMagic.wMagIdx of    //
        SKILL_ERGUM{12}: begin  //刺杀剑法
          if m_MagicErgumSkill <> nil then begin
            if not m_boUseThrusting then begin
              ThrustingOnOff(True);
              SendSocket(nil,'+LNG');
            end else begin
              ThrustingOnOff(False);
              SendSocket(nil,'+ULNG');
            end;
          end;
          Result:=True;
        end;
        SKILL_BANWOL{25}: begin //半月弯刀
          {if m_MagicCrsSkill <> nil then begin
            if m_boCrsHitkill then begin
              SkillCrsOnOff(False);
              SendSocket(nil,'+UCRS');
            end;
          end;}

          if m_MagicBanwolSkill <> nil then begin
            if not m_boUseHalfMoon then begin
              HalfMoonOnOff(True);
              SendSocket(nil,'+WID');
            end else begin
              HalfMoonOnOff(False);
              SendSocket(nil,'+UWID');
            end;
          end;
          Result:=True;
        end;
        SKILL_REDBANWOL{56}: begin
          if m_MagicRedBanwolSkill <> nil then begin
            if not m_boRedUseHalfMoon then begin
              RedHalfMoonOnOff(True);
              SendSocket(nil,'+WID');
            end else begin
              RedHalfMoonOnOff(False);
              SendSocket(nil,'+UWID');
            end;
          end;
          Result:=True;
        end;
        SKILL_FIRESWORD{26}: begin //烈火剑法
          if m_MagicFireSwordSkill <> nil then begin
            if AllowFireHitSkill then begin
              nSpellPoint:=GetSpellPoint(UserMagic);
              if m_WAbil.MP >= nSpellPoint then begin
                if nSpellPoint > 0 then begin
                  DamageSpell(nSpellPoint);
                  HealthSpellChanged();
                end;
                SendSocket(nil,'+FIR');
              end;
            end;
          end;
          Result:=True;
        end;
        SKILL_MOOTEBO{27}: begin //野蛮冲撞
          Result:=True;
          if (GetTickCount - m_dwDoMotaeboTick) > 3 * 1000 then begin
            m_dwDoMotaeboTick:=GetTickCount();
            m_btDirection:=nTargetX;
            nSpellPoint:=GetSpellPoint(UserMagic);
            if m_WAbil.MP >= nSpellPoint then begin
              if nSpellPoint > 0 then begin
                DamageSpell(nSpellPoint);
                HealthSpellChanged();
              end;
              if DoMotaebo(m_btDirection,UserMagic.btLevel) then begin
                if UserMagic.btLevel < 3 then begin
                  if UserMagic.MagicInfo.TrainLevel[UserMagic.btLevel] < m_Abil.Level then begin
                    TrainSkill(UserMagic,Random(3) + 1);
                    if not CheckMagicLevelup(UserMagic) then begin

                      SendDelayMsg(Self,
                                   RM_MAGIC_LVEXP,
                                   0,
                                   UserMagic.MagicInfo.wMagicId,
                                   UserMagic.btLevel,
                                   UserMagic.nTranPoint,
                                   '',1000);
                    end;
                  end;
                end;
              end;
            end;
          end; //004CC1B5
        end;
        SKILL_CROSSMOON: begin  //双龙斩
          {if m_MagicBanwolSkill <> nil then begin
            if m_boUseHalfMoon then begin
              HalfMoonOnOff(False);
              SendSocket(nil,'+UWID');
            end;
          end;}

          if m_MagicCrsSkill <> nil then begin
            if not m_boCrsHitkill then begin
              SkillCrsOnOff(True);
              SendSocket(nil,'+CRS');
            end else begin
              SkillCrsOnOff(False);
              SendSocket(nil,'+UCRS');
            end;
          end;
          Result:=True;
        end;
        SKILL_TWINBLADE: begin  //狂风斩
          if m_MagicTwnHitSkill <> nil then begin
            if AllowTwinHitSkill then begin
              nSpellPoint:=GetSpellPoint(UserMagic);
              if m_WAbil.MP >= nSpellPoint then begin
                if nSpellPoint > 0 then begin
                  DamageSpell(nSpellPoint);
                  HealthSpellChanged();
                end;
                SendSocket(nil,'+TWN');
              end;
            end;
          end;
          Result:=True;

          {if m_MagicTwnHitSkill <> nil then begin
            if not m_boTwinHitSkill then begin
              SkillTwinOnOff(True);
              SendSocket(nil,'+TWN');
            end else begin
              SkillTwinOnOff(False);
              SendSocket(nil,'+UTWN');
            end;
          end;
          Result:=True;}
        end;
        43: begin  //破空剑
          if m_Magic43Skill <> nil then begin
            if not m_bo43kill then begin
              Skill43OnOff(True);
              SendSocket(nil,'+CID');
            end else begin
              Skill43OnOff(False);
              SendSocket(nil,'+UCID');
            end;
          end;
          Result:=True;
        end;
        else begin
          n14:=GetNextDirection(m_nCurrX,m_nCurrY,nTargetX,nTargetY);
          m_btDirection:=n14;
          BaseObject:=nil;
          //检查目标角色，与目标座标误差范围，如果在误差范围内则修正目标座标
          if CretInNearXY(TargeTBaseObject,nTargetX,nTargetY) then begin
            BaseObject:=TargeTBaseObject;
            nTargetX:=BaseObject.m_nCurrX;
            nTargetY:=BaseObject.m_nCurrY;
          end;

          if not DoSpell(UserMagic,nTargetX,nTargetY,BaseObject) then begin
            SendRefMsg(RM_MAGICFIREFAIL,0,0,0,0,'');
          end;
          Result:=True;
        end;
      end; 
end;

//004C42C0
function TPlayObject.RunTo(btDir: Byte;boFlag:boolean;nDestX,nDestY:Integer): Boolean;
var
  nOldX,nOldY:Integer;
ResourceString
  sExceptionMsg = '[Exception] TBaseObject::RunTo';
begin
  Result:=False;
  try
    nOldX:=m_nCurrX;
    nOldY:=m_nCurrY;
    m_btDirection:=btDir;
    case btDir of
      DR_UP{0}: begin
        if (m_nCurrY > 1) and
           (m_PEnvir.CanWalkEx(m_nCurrX,m_nCurrY -1,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.CanWalkEx(m_nCurrX,m_nCurrY -2,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.MoveToMovingObject(m_nCurrX,m_nCurrY,Self,m_nCurrX,m_nCurrY -2,True) > 0)then begin

          Dec(m_nCurrY,2);
        end;
      end;
      DR_UPRIGHT{1}: begin
        if (m_nCurrX < m_PEnvir.Header.wWidth -2) and
           (m_nCurrY > 1) and
           (m_PEnvir.CanWalkEx(m_nCurrX +1,m_nCurrY -1,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.CanWalkEx(m_nCurrX +2,m_nCurrY -2,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.MoveToMovingObject(m_nCurrX,m_nCurrY,Self,m_nCurrX + 2,m_nCurrY -2,True) > 0)then begin

          Inc(m_nCurrX,2);
          Dec(m_nCurrY,2);
        end;
      end;
      DR_RIGHT{2}: begin
        if (m_nCurrX < m_PEnvir.Header.wWidth -2) and
           (m_PEnvir.CanWalkEx(m_nCurrX + 1,m_nCurrY,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.CanWalkEx(m_nCurrX + 2,m_nCurrY,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.MoveToMovingObject(m_nCurrX,m_nCurrY,Self,m_nCurrX + 2,m_nCurrY,True) > 0)then begin

          Inc(m_nCurrX,2);
        end;
      end;
      DR_DOWNRIGHT{3}: begin
        if (m_nCurrX < m_PEnvir.Header.wWidth - 2) and
           (m_nCurrY < m_PEnvir.Header.wHeight -2) and
           (m_PEnvir.CanWalkEx(m_nCurrX +1,m_nCurrY +1,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.CanWalkEx(m_nCurrX +2,m_nCurrY +2,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.MoveToMovingObject(m_nCurrX,m_nCurrY,Self,m_nCurrX + 2,m_nCurrY +2,True) > 0)then begin

          Inc(m_nCurrX,2);
          Inc(m_nCurrY,2);
        end;
      end;
      DR_DOWN{4}: begin
        if (m_nCurrY < m_PEnvir.Header.wHeight -2) and
           (m_PEnvir.CanWalkEx(m_nCurrX,m_nCurrY +1,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.CanWalkEx(m_nCurrX,m_nCurrY +2,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.MoveToMovingObject(m_nCurrX,m_nCurrY,Self,m_nCurrX,m_nCurrY +2,True) > 0)then begin

          Inc(m_nCurrY,2);
        end;
      end;
      DR_DOWNLEFT{5}: begin
        if (m_nCurrX > 1) and
           (m_nCurrY < m_PEnvir.Header.wHeight -2) and
           (m_PEnvir.CanWalkEx(m_nCurrX -1,m_nCurrY +1,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.CanWalkEx(m_nCurrX -2,m_nCurrY +2,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.MoveToMovingObject(m_nCurrX,m_nCurrY,Self,m_nCurrX - 2,m_nCurrY +2,True) > 0)then begin

          Dec(m_nCurrX,2);
          Inc(m_nCurrY,2);
        end;      
      end;
      DR_LEFT{6}: begin
        if (m_nCurrX > 1) and
           (m_PEnvir.CanWalkEx(m_nCurrX - 1,m_nCurrY,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.CanWalkEx(m_nCurrX - 2,m_nCurrY,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.MoveToMovingObject(m_nCurrX,m_nCurrY,Self,m_nCurrX - 2,m_nCurrY,True) > 0)then begin

          Dec(m_nCurrX,2);
        end;
      end;
      DR_UPLEFT{7}: begin
        if (m_nCurrX > 1) and
           (m_nCurrY > 1) and
           (m_PEnvir.CanWalkEx(m_nCurrX -1,m_nCurrY -1,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.CanWalkEx(m_nCurrX -2,m_nCurrY -2,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.MoveToMovingObject(m_nCurrX,m_nCurrY,Self,m_nCurrX - 2,m_nCurrY -2,True) > 0)then begin

          Dec(m_nCurrX,2);
          Dec(m_nCurrY,2);
        end;
      end;
    end;
    if ((m_nCurrX <> nOldX) or (m_nCurrY <> nOldY)) {and ((m_nCurrX = nDestX) and (m_nCurrY = nDestY))} then begin
      if Walk(RM_RUN) then Result:=True
      else begin
        m_nCurrX:=nOldX;
        m_nCurrY:=nOldY;
        m_PEnvir.MoveToMovingObject(nOldX,nOldY,Self,m_nCurrX,m_nCurrX,True);
      end;
    end;
  except
    MainOutMessage(sExceptionMsg);
  end;
end;

//004C42C0
function TPlayObject.HorseRunTo(btDir: Byte;boFlag:boolean): Boolean;
var
  n10,n14:Integer;
ResourceString
  sExceptionMsg = '[Exception] TPlayObject::HorseRunTo';
begin
  Result:=False;
  try
    n10:=m_nCurrX;
    n14:=m_nCurrY;
    m_btDirection:=btDir;
    case btDir of
      DR_UP{0}: begin
        if (m_nCurrY > 2) and
           (m_PEnvir.CanWalkEx(m_nCurrX,m_nCurrY -1,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.CanWalkEx(m_nCurrX,m_nCurrY -2,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.CanWalkEx(m_nCurrX,m_nCurrY -3,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and           
           (m_PEnvir.MoveToMovingObject(m_nCurrX,m_nCurrY,Self,m_nCurrX,m_nCurrY -3,True) > 0)then begin

          Dec(m_nCurrY,3);
        end;
      end;
      DR_UPRIGHT{1}: begin
        if (m_nCurrX < m_PEnvir.Header.wWidth - 3) and
           (m_nCurrY > 2) and
           (m_PEnvir.CanWalkEx(m_nCurrX +1,m_nCurrY -1,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.CanWalkEx(m_nCurrX +2,m_nCurrY -2,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.CanWalkEx(m_nCurrX +3,m_nCurrY -3,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and           
           (m_PEnvir.MoveToMovingObject(m_nCurrX,m_nCurrY,Self,m_nCurrX + 3,m_nCurrY -3,True) > 0)then begin

          Inc(m_nCurrX,3);
          Dec(m_nCurrY,3);
        end;
      end;
      DR_RIGHT{2}: begin
        if (m_nCurrX < m_PEnvir.Header.wWidth -3) and
           (m_PEnvir.CanWalkEx(m_nCurrX + 1,m_nCurrY,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.CanWalkEx(m_nCurrX + 2,m_nCurrY,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.CanWalkEx(m_nCurrX + 3,m_nCurrY,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.MoveToMovingObject(m_nCurrX,m_nCurrY,Self,m_nCurrX + 3,m_nCurrY,True) > 0)then begin

          Inc(m_nCurrX,3);
        end;
      end;
      DR_DOWNRIGHT{3}: begin
        if (m_nCurrX < m_PEnvir.Header.wWidth - 3) and
           (m_nCurrY < m_PEnvir.Header.wHeight -3) and
           (m_PEnvir.CanWalkEx(m_nCurrX +1,m_nCurrY +1,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.CanWalkEx(m_nCurrX +2,m_nCurrY +2,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.CanWalkEx(m_nCurrX +3,m_nCurrY +3,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.MoveToMovingObject(m_nCurrX,m_nCurrY,Self,m_nCurrX + 3,m_nCurrY +3,True) > 0)then begin

          Inc(m_nCurrX,3);
          Inc(m_nCurrY,3);
        end;
      end;
      DR_DOWN{4}: begin
        if (m_nCurrY < m_PEnvir.Header.wHeight -3) and
           (m_PEnvir.CanWalkEx(m_nCurrX,m_nCurrY +1,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.CanWalkEx(m_nCurrX,m_nCurrY +2,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.CanWalkEx(m_nCurrX,m_nCurrY +3,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.MoveToMovingObject(m_nCurrX,m_nCurrY,Self,m_nCurrX,m_nCurrY +3,True) > 0)then begin

          Inc(m_nCurrY,3);
        end;
      end;
      DR_DOWNLEFT{5}: begin
        if (m_nCurrX > 2) and
           (m_nCurrY < m_PEnvir.Header.wHeight -3) and
           (m_PEnvir.CanWalkEx(m_nCurrX -1,m_nCurrY +1,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.CanWalkEx(m_nCurrX -2,m_nCurrY +2,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.CanWalkEx(m_nCurrX -3,m_nCurrY +3,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.MoveToMovingObject(m_nCurrX,m_nCurrY,Self,m_nCurrX - 3,m_nCurrY +3,True) > 0)then begin

          Dec(m_nCurrX,3);
          Inc(m_nCurrY,3);
        end;      
      end;
      DR_LEFT{6}: begin
        if (m_nCurrX > 2) and
           (m_PEnvir.CanWalkEx(m_nCurrX - 1,m_nCurrY,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.CanWalkEx(m_nCurrX - 2,m_nCurrY,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.CanWalkEx(m_nCurrX - 3,m_nCurrY,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.MoveToMovingObject(m_nCurrX,m_nCurrY,Self,m_nCurrX - 3,m_nCurrY,True) > 0)then begin

          Dec(m_nCurrX,3);
        end;
      end;
      DR_UPLEFT{7}: begin
        if (m_nCurrX > 2) and
           (m_nCurrY > 2) and
           (m_PEnvir.CanWalkEx(m_nCurrX -1,m_nCurrY -1,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.CanWalkEx(m_nCurrX -2,m_nCurrY -2,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.CanWalkEx(m_nCurrX -3,m_nCurrY -3,g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll){True}))and
           (m_PEnvir.MoveToMovingObject(m_nCurrX,m_nCurrY,Self,m_nCurrX - 3,m_nCurrY -3,True) > 0)then begin

          Dec(m_nCurrX,3);
          Dec(m_nCurrY,3);
        end;
      end;
    end;
//    SysMsg(format('原X:%d 原Y:%d 新X:%d 新Y:%d',[n10,n14,m_nCurrX,m_nCurrY]),c_Green,t_Hint);
    if (m_nCurrX <> n10) or (m_nCurrY <> n14) then begin
      if Walk(RM_HORSERUN) then Result:=True
      else begin
        m_nCurrX:=n10;
        m_nCurrY:=n14;
        m_PEnvir.MoveToMovingObject(n10,n14,Self,m_nCurrX,m_nCurrX,True)
      end;        
    end;
  except
    MainOutMessage(sExceptionMsg);
  end;
end;

function TPlayObject.ClientRunXY(wIdent:Word;nX, nY:Integer;nFlag:Integer;var dwDelayTime:LongWord): Boolean;//004CB11C
var
  nDir:Integer;
  dwCheckTime:LongWord;
begin
  Result:=False;
  dwDelayTime:=0;
  if not m_boCanRun then exit;
  if m_boDeath or ((m_wStatusTimeArr[POISON_STONE{5}]{0x6A} <> 0) and not g_Config.ClientConf.boParalyCanRun) then exit;//防麻

  if nFlag <> wIdent then begin

  if not CheckActionStatus(wIdent,dwDelayTime) then begin
    m_boFilterAction:=False;
    exit;
  end;
  m_boFilterAction:=True;
  dwCheckTime:=GetTickCount - m_dwMoveTick;
  if dwCheckTime < g_Config.dwRunIntervalTime then begin
    Inc(m_dwMoveCount);
    dwDelayTime:=g_Config.dwRunIntervalTime - dwCheckTime;
    if dwDelayTime > g_Config.dwRunIntervalTime div 3 then  begin
      if m_dwMoveCount >= 4 then begin
        m_dwMoveTick:=GetTickCount();
        m_dwMoveCount:=0;
        dwDelayTime:=g_Config.dwRunIntervalTime div 3;
        if m_boTestSpeedMode then
          SysMsg('跑步忙复位！！！' + IntTOStr(dwDelayTime),c_Red,t_Hint);
      end else m_dwMoveCount:=0;
      exit;
    end else begin
      if m_boTestSpeedMode then
        SysMsg('跑步忙！！！' + IntTOStr(dwDelayTime),c_Red,t_Hint);
      exit;
    end;
  end;
  end;
  {
  if (GetTickCount - m_dwMoveTick) < 600 then begin
    Inc(m_dwMoveCount);
    Inc(m_dwMoveCountA);
  end else begin
    m_dwMoveCount:=0;
    if m_dwMoveCountA > 0 then Dec(m_dwMoveCountA);
  end;
  }
  m_dwMoveTick:=GetTickCount();
//  if (m_dwMoveCount < 4) and (m_dwMoveCountA < 6) then begin
    m_bo316:=False;
    nDir:=GetNextDirection(m_nCurrX,m_nCurrY,nX,nY);
    if RunTo(nDir,False,nX,nY) then begin
      if m_boTransparent and (m_boHideMode) then m_wStatusTimeArr[STATE_TRANSPARENT{0 0x70}]:=1;  //004CB212
        
      if m_bo316 or ((m_nCurrX = nX) and (m_nCurrY = nY)) then
        Result:=True;
      Dec(m_nHealthTick,60);
      Dec(m_nSpellTick,10);
      m_nSpellTick:=_MAX(0,m_nSpellTick);
      Dec(m_nPerHealth);
      Dec(m_nPerSpell);
    end else begin
      m_dwMoveCount:=0;
      m_dwMoveCountA:=0;
    end;
{
  end else begin
    Inc(m_dwOverSpeedCount);
    //if m_dwOverSpeedCount > 8 then m_boEmergencyClose:=True;
    SysMsg('跑步超速！！！',c_Red,t_Hint);
    if boViewHackMessage then begin
      MainOutMessage('[11002-Run] ' + m_sCharName + ' ' + DateToStr(Now));
    end;
  end;
}
end;

function TPlayObject.ClientWalkXY(wIdent:Word;nX, nY:Integer;boLateDelivery:Boolean;var dwDelayTime:LongWord): Boolean;//004CAF08
var
  n14,n18,n1C:Integer;
  dwCheckTime:LongWord;
begin
  Result:=False;
  dwDelayTime:=0;
  if not m_boCanWalk then exit;
  if m_boDeath or ((m_wStatusTimeArr[POISON_STONE{5}]{0x6A} <> 0) and not g_Config.ClientConf.boParalyCanWalk) then exit;//防麻

  if not boLateDelivery then begin
    if not CheckActionStatus(wIdent,dwDelayTime) then begin
      m_boFilterAction:=False;
      exit;
    end;
    m_boFilterAction:=True;
    dwCheckTime:=GetTickCount - m_dwMoveTick;
    if dwCheckTime < g_Config.dwWalkIntervalTime then begin
      Inc(m_dwMoveCount);
      dwDelayTime:=g_Config.dwWalkIntervalTime - dwCheckTime;
      if dwDelayTime > g_Config.dwWalkIntervalTime div 3 then  begin
        if m_dwMoveCount >= 4 then begin
          m_dwMoveTick:=GetTickCount();
          m_dwMoveCount:=0;
          dwDelayTime:=g_Config.dwWalkIntervalTime div 3;
          if m_boTestSpeedMode then
            SysMsg('走路忙复位！！！' + IntTOStr(dwDelayTime),c_Red,t_Hint);
        end else m_dwMoveCount:=0;
        exit;
      end else begin
        if m_boTestSpeedMode then
          SysMsg('走路忙！！！' + IntTOStr(dwDelayTime),c_Red,t_Hint);
        exit;
      end;
    end;
  end;
  {
  if (GetTickCount - m_dwMoveTick) < 600 then begin
    Inc(m_dwMoveCount);
    Inc(m_dwMoveCountA);
  end else begin
    m_dwMoveCount:=0;
    if m_dwMoveCountA > 0 then Dec(m_dwMoveCountA);
  end;
  }
  m_dwMoveTick:=GetTickCount();
//  if (m_dwMoveCount < 4) and (m_dwMoveCountA < 6) then begin
    m_bo316:=False;
    n18:=m_nCurrX;
    n1C:=m_nCurrY;
    n14:=GetNextDirection(m_nCurrX,m_nCurrY,nX,nY);
    if not m_boClientFlag then begin
      if (n14 = 0) and (m_nStep = 0) then Inc(m_nStep)
      else
      if (n14 = 4) and (m_nStep = 1) then Inc(m_nStep)
      else
      if (n14 = 6) and (m_nStep = 2) then Inc(m_nStep)
      else
      if (n14 = 2) and (m_nStep = 3) then Inc(m_nStep)
      else
      if (n14 = 1) and (m_nStep = 4) then Inc(m_nStep)
      else
      if (n14 = 5) and (m_nStep = 5) then Inc(m_nStep)
      else
//      if (n14 = 3) and (m_nStep = 6) then Inc(m_nStep)
      if (n14 = 7) and (m_nStep = 6) then Inc(m_nStep)
      else
//      if (n14 = 7) and (m_nStep = 7) then Inc(m_nStep)
      if (n14 = 3) and (m_nStep = 7) then Inc(m_nStep)
      else begin
        Dec(m_nGameGold,m_nStep);
        GameGoldChanged;
        m_nStep:=0;
      end;
      //SysMsg(IntTOStr(m_nStep),c_Green,t_Hint);
      if m_nStep <> 0 then begin
        Inc(m_nGameGold);
        GameGoldChanged;
      end;

{
0
4
6
2
1
5
7
3
}
    end;



    if WalkTo(n14,False) then begin
      if m_bo316 or ((m_nCurrX = nX) and (m_nCurrY = nY)) then
        Result:=True;
      Dec(m_nHealthTick,10);
    end else begin
      m_dwMoveCount:=0;
      m_dwMoveCountA:=0;
    end;
  {
  end else begin
    Inc(m_dwOverSpeedCount);
    //if m_dwOverSpeedCount > 8 then m_boEmergencyClose:=True;
    SysMsg('走步超速！！！',c_Red,t_Hint);
    if boViewHackMessage then begin
      MainOutMessage('[11002-Walk] ' + m_sCharName + ' ' + DateToStr(Now));
    end;
  end;
  }
end;
//004BC900
procedure TPlayObject.ThrustingOnOff(boSwitch: Boolean);
begin
  m_boUseThrusting:=boSwitch;
  if m_boUseThrusting then begin
    SysMsg(sThrustingOn,c_Green,t_Hint);
  end else begin
    SysMsg(sThrustingOff,c_Green,t_Hint);
  end;
end;
//004BC980
procedure TPlayObject.HalfMoonOnOff(boSwitch: Boolean);
begin
  m_boUseHalfMoon:=boSwitch;
  if m_boUseHalfMoon then begin
    SysMsg(sHalfMoonOn,c_Green,t_Hint);
  end else begin
    SysMsg(sHalfMoonOff,c_Green,t_Hint);
  end;
end;

procedure TPlayObject.RedHalfMoonOnOff(boSwitch: Boolean);
begin
  m_boRedUseHalfMoon:=boSwitch;
  if m_boRedUseHalfMoon then begin
    SysMsg(sRedHalfMoonOn,c_Green,t_Hint);
  end else begin
    SysMsg(sRedHalfMoonOff,c_Green,t_Hint);
  end;
end;

procedure TPlayObject.SkillCrsOnOff(boSwitch: Boolean);
begin
  m_boCrsHitkill:=boSwitch;
  if m_boCrsHitkill then begin
    SysMsg(sCrsHitOn,c_Green,t_Hint);
  end else begin
    SysMsg(sCrsHitOff,c_Green,t_Hint);
  end;
end;
procedure TPlayObject.SkillTwinOnOff(boSwitch: Boolean);
begin
  m_boTwinHitSkill:=boSwitch;
  if m_boTwinHitSkill then begin
    SysMsg(sTwinHitOn,c_Green,t_Hint);
  end else begin
    SysMsg(sTwinHitOff,c_Green,t_Hint);
  end;
end;

procedure TPlayObject.Skill43OnOff(boSwitch: Boolean);
begin
  m_bo43kill:=boSwitch;
  if m_bo43kill then begin
    SysMsg('开启破空剑',c_Green,t_Hint);
  end else begin
    SysMsg('关闭破空剑',c_Green,t_Hint);
  end;
end;

function TPlayObject.AllowFireHitSkill():Boolean;//004BCA00
begin
  Result:=False;
  if (GetTickCount - m_dwLatestFireHitTick) > 10 * 1000 then begin
    m_dwLatestFireHitTick:=GetTickCount();
    m_boFireHitSkill:=True;
    SysMsg(sFireSpiritsSummoned,c_Green,t_Hint);
    Result:=True;
  end else begin
    SysMsg(sFireSpiritsFail,c_Red,t_Hint);
  end;
end;

function TPlayObject.AllowTwinHitSkill():Boolean;
begin
  Result:=False;
  //if (GetTickCount - m_dwLatestTwinHitTick) > 10 * 1000 then begin
    m_dwLatestTwinHitTick:=GetTickCount();
    m_boTwinHitSkill:=True;
    SysMsg('twin hit skill charged',c_Green,t_Hint);
    Result:=True;
  {end else begin
    SysMsg('twin hit skill fail',c_Red,t_Hint);
  end;}
end;





procedure TPlayObject.ClientClickNPC(NPC: Integer);//004DBA10
var
  NormNpc:TNormNpc;
begin
  if not m_boCanDeal then begin
    SendMsg(g_ManageNPC,RM_MENU_OK,0,Integer(Self),0,0,g_sCanotTryDealMsg);
    exit;
  end;
  if m_boDeath or m_boGhost then exit;
    
  NormNpc:=UserEngine.FindMerchant(TObject(NPC));
  if NormNpc = nil then
    NormNpc:=UserEngine.FindNPC(TObject(NPC));

  if NormNpc <> nil then begin
    if (NormNpc.m_PEnvir = m_PEnvir) and (abs(NormNpc.m_nCurrX - m_nCurrX) <= 15) and (abs(NormNpc.m_nCurrY - m_nCurrY) <= 15) then begin
      NormNpc.Click(Self);
    end;
  end;//004DBA9C
end;



//4C9BD0
function TPlayObject.GetRangeHumanCount: Integer;
begin
  Result:=UserEngine.GetMapOfRangeHumanCount(m_PEnvir,m_nCurrX,m_nCurrY,10);
end;

procedure TPlayObject.GetHomePoint;
var
  I: Integer;
  StartPoint:pTStartPoint;
begin
  try
    g_StartPoint.Lock;
    for I := 0 to g_StartPoint.Count - 1 do begin
      StartPoint:=g_StartPoint.Items[I];
      if StartPoint.Envir = m_PEnvir then begin
        if (abs(m_nCurrX - StartPoint.nX) < 50) and (abs(m_nCurrY - StartPoint.nY) < 50) then begin
          m_sHomeMap:=StartPoint.sMapName;
          m_nHomeX:=StartPoint.nX;
          m_nHomeY:=StartPoint.nY;
          break;
        end;
      end;
    end;
    if PKLevel >= 2 then begin
      m_sHomeMap :=g_Config.sRedHomeMap;
      m_nHomeX   :=g_Config.nRedHomeX;
      m_nHomeY   :=g_Config.nRedHomeY;
    end;
  finally
    g_StartPoint.UnLock;
  end;
end;

function TPlayObject.GetStartPoint(var StartPoint:pTStartPoint):Boolean;
var
  i    :Integer;
  Point:pTStartPoint;
begin
  Result:=False;
  if (m_PEnvir.sMapName = g_Config.sRedHomeMap) and
     (abs(m_nCurrX - g_Config.nRedHomeX) < g_Config.nSafeZoneSize) and
     (abs(m_nCurrY - g_Config.nRedHomeY) < g_Config.nSafeZoneSize) then begin
    StartPoint:=@g_RedStartPoint;
    StartPoint.sMapName:=m_PEnvir.sMapName;
    StartPoint.Envir:=m_PEnvir;
    StartPoint.nX:=g_Config.nRedHomeX;
    StartPoint.nY:=g_Config.nRedHomeY;
    Result:=True;
    exit;
  end;
  g_StartPoint.Lock;
  try
    for I := 0 to g_StartPoint.Count - 1 do begin
      Point:=g_StartPoint.Items[I];
      if Point.Envir = m_PEnvir then begin
        if (abs(m_nCurrX - Point.nX) < g_Config.nSafeZoneSize) and (abs(m_nCurrY - Point.nY) < g_Config.nSafeZoneSize) then begin
          StartPoint:=Point;
          Result:=True;
          break;
        end;
      end;
    end;
  finally
    g_StartPoint.UnLock;
  end;
end;


procedure TPlayObject.MobPlace(sX, sY, sMonName, sCount: String); //004C1508
begin

end;


procedure TPlayObject.CmdTrainingMagic(Cmd:pTGameCmd;sHumanName, sSkillName: String;
  nLevel: Integer);
var
  Magic:pTMagic;
  UserMagic:pTUserMagic;
  PlayObject:TPlayObject;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if ((sHumanName <> '') and (sHumanName[1] = '?')) or (sHumanName = '') or (sSkillName = '') or (nLevel < 0) or not (nLevel in [0..3]) then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' 人物名称  技能名称 修炼等级(0-3)',c_Red,t_Hint);
    exit;
  end;
  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject = nil then begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumanName]),c_Red,t_Hint);
    exit;
  end;
  Magic:=UserEngine.FindMagic(sSkillName);
  if Magic = nil then begin
    SysMsg(format('%s 技能名称不正确！！！',[sSkillName]),c_Red,t_Hint);
    exit;
  end;

  if PlayObject.IsTrainingSkill(Magic.wMagicId) then begin
    SysMsg(format('%s 技能已修炼过了！！！',[sSkillName]),c_Red,t_Hint);
    exit;
  end;
  New(UserMagic);
  UserMagic.MagicInfo:=Magic;
  UserMagic.wMagIdx:=Magic.wMagicId;
  UserMagic.btLevel:=nLevel;
  UserMagic.btKey:=0;
  UserMagic.nTranPoint:=0;
  PlayObject.m_MagicList.Add(UserMagic);
  PlayObject.SendAddMagic(UserMagic);
  PlayObject.RecalcAbilitys;
  SysMsg(format('%s 的 %s 技能修炼成功！！！',[sHumanName,sSkillName]),c_Green,t_Hint);
end;

procedure TPlayObject.CmdTrainingSkill(Cmd:pTGameCmd;sHumanName, sSkillName: String;
  nLevel: Integer);
var
  I: Integer;
  UserMagic:pTUserMagic;
  PlayObject:TPlayObject;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sHumanName = '') or (sSkillName = '') or (nLevel <= 0) then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' 人物名称  技能名称 修炼等级(0-3)',c_Red,t_Hint);
    exit;
  end;
  nLevel:=_MIN(3,nLevel);
  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject = nil then begin
    SysMsg(format('%s不在线，或在其它服务器上！！',[sHumanName]),c_Red,t_Hint);
    exit;
  end;

  for I := 0 to PlayObject.m_MagicList.Count - 1 do begin
    UserMagic:=PlayObject.m_MagicList.Items[I];
    if CompareText(UserMagic.MagicInfo.sMagicName,sSkillName) = 0 then begin
      UserMagic.btLevel:=nLevel;
      PlayObject.SendMsg(PlayObject,
              RM_MAGIC_LVEXP,
              0,
              UserMagic.MagicInfo.wMagicId,
              UserMagic.btLevel,
              UserMagic.nTranPoint,
              '');
      PlayObject.SysMsg(format('%s的修改炼等级为%d',[sSkillName,nLevel]),c_Green,t_Hint);
      SysMsg(format('%s的技能%s修炼等级为%d',[sHumanName,sSkillName,nLevel]),c_Green,t_Hint);
      break;
    end;
  end;
end;

procedure TPlayObject.CmdAddGameGold(sCmd, sHumName: String;
  nPoint: Integer);
var
  PlayObject:TPlayObject;
begin
  if (m_btPermission < 6) then exit;
  if (sHumName = '') or (nPoint <= 0) then begin
    SysMsg('命令格式: @' + sCmd + ' 人物名称  金币数量',c_Red,t_Hint);
    exit;
  end;
  PlayObject:=UserEngine.GeTPlayObject(sHumName);
  if PlayObject <> nil then begin
    if (PlayObject.m_nGameGold + nPoint) < 2000000 then begin
      Inc(PlayObject.m_nGameGold,nPoint);
    end else begin
      nPoint:=2000000 - PlayObject.m_nGameGold;
      PlayObject.m_nGameGold:=2000000;
    end;
    PlayObject.GoldChanged();
    SysMsg(sHumName + '的游戏点已增加' + IntToStr(nPoint)+ '.',c_Green,t_Hint);
    PlayObject.SysMsg('游戏点已增加' + IntToStr(nPoint)+ '.',c_Green,t_Hint);
  end else begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumName]),c_Red,t_Hint);
  end;
end;

procedure TPlayObject.CmdDelGameGold(sCmd, sHumName: String;
  nPoint: Integer);
var
  PlayObject:TPlayObject;
begin
  if (m_btPermission < 6) then exit;
  if (sHumName = '') or (nPoint <= 0) then exit;
  PlayObject:=UserEngine.GeTPlayObject(sHumName);
  if PlayObject <> nil then begin
    if PlayObject.m_nGameGold > nPoint then begin
      Dec(PlayObject.m_nGameGold,nPoint);
    end else begin
      nPoint:=PlayObject.m_nGameGold;
      PlayObject.m_nGameGold:=0;
    end;
    PlayObject.GoldChanged();
    SysMsg(sHumName + '的游戏点已减少' + IntToStr(nPoint)+ '.',c_Green,t_Hint);
    PlayObject.SysMsg('游戏点已减少' + IntToStr(nPoint)+ '.',c_Green,t_Hint);
  end else begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumName]),c_Red,t_Hint);
  end;
end;

procedure TPlayObject.CmdGameGold(Cmd:pTGameCmd;sHumanName:String;sCtr:String;nGold:Integer);
var
  PlayObject:TPlayObject;
  Ctr:Char;
begin
  Ctr:='1';
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sCtr <> '') then begin
    Ctr:=sCtr[1];
  end;
    
  if (sHumanName = '') or not (Ctr in ['=','+','-']) or (nGold < 0) or (nGold > 200000000) or ((sHumanName <> '') and (sHumanName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,g_sGameCommandGameGoldHelpMsg]),c_Red,t_Hint);
    exit;
  end;
  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject = nil then begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumanName]),c_Red,t_Hint);
    exit;
  end;
  case sCtr[1] of
    '=': begin
      PlayObject.m_nGamePoint:=nGold;
    end;
    '+': Inc(PlayObject.m_nGameGold,nGold);
    '-': Dec(PlayObject.m_nGameGold,nGold);
  end;
  if g_boGameLogGameGold then begin
    AddGameDataLog(format(g_sGameLogMsg1,[LOG_GAMEGOLD,
                                        PlayObject.m_sMapName,
                                        PlayObject.m_nCurrX,
                                        PlayObject.m_nCurrY,
                                        PlayObject.m_sCharName,
                                        g_Config.sGameGoldName,
                                        nGold,
                                        sCtr[1],
                                        m_sCharName]));
  end;
  GameGoldChanged();
  PlayObject.SysMsg(format(g_sGameCommandGameGoldHumanMsg,[g_Config.sGameGoldName,nGold,PlayObject.m_nGameGold,g_Config.sGameGoldName]),c_Green,t_Hint);
  SysMsg(format(g_sGameCommandGameGoldGMMsg,[sHumanName,g_Config.sGameGoldName,nGold,PlayObject.m_nGameGold,g_Config.sGameGoldName]),c_Green,t_Hint);
end;

procedure TPlayObject.CmdGamePoint(Cmd:pTGameCmd;sHumanName, sCtr: String; nPoint: Integer);
var
  PlayObject:TPlayObject;
  Ctr:Char;
begin
  Ctr:='1';
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sCtr <> '') then begin
    Ctr:=sCtr[1];
  end;
    
  if (sHumanName = '') or not (Ctr in ['=','+','-']) or (nPoint < 0) or (nPoint > 100000000) or ((sHumanName <> '') and (sHumanName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,g_sGameCommandGamePointHelpMsg]),c_Red,t_Hint);
    exit;
  end;
  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject = nil then begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumanName]),c_Red,t_Hint);
    exit;
  end;
  case sCtr[1] of
    '=': begin
      PlayObject.m_nGamePoint:=nPoint;
    end;
    '+': Inc(PlayObject.m_nGamePoint,nPoint);
    '-': Dec(PlayObject.m_nGamePoint,nPoint);
  end;
  if g_boGameLogGamePoint then begin
    AddGameDataLog(format(g_sGameLogMsg1,[LOG_GAMEPOINT,
                                        PlayObject.m_sMapName,
                                        PlayObject.m_nCurrX,
                                        PlayObject.m_nCurrY,
                                        PlayObject.m_sCharName,
                                        g_Config.sGamePointName,
                                        nPoint,
                                        sCtr[1],
                                        m_sCharName]));
  end;
  GameGoldChanged();
  PlayObject.SysMsg(format(g_sGameCommandGamePointHumanMsg,[nPoint,PlayObject.m_nGamePoint]),c_Green,t_Hint);
  SysMsg(format(g_sGameCommandGamePointGMMsg,[sHumanName,nPoint,PlayObject.m_nGamePoint]),c_Green,t_Hint);
end;


procedure TPlayObject.CmdCreditPoint(Cmd:pTGameCmd;sHumanName, sCtr: String; nPoint: Integer);
var
  PlayObject:TPlayObject;
  Ctr:Char;
  nCreditpoint:Integer;
begin
  Ctr:='1';
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sCtr <> '') then begin
    Ctr:=sCtr[1];
  end;
    
  if (sHumanName = '') or not (Ctr in ['=','+','-']) or (nPoint < 0) or (nPoint > High(Byte)) or ((sHumanName <> '') and (sHumanName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,g_sGameCommandCreditPointHelpMsg]),c_Red,t_Hint);
    exit;
  end;
  PlayObject:=UserEngine.GetPlayObject(sHumanName);
  if PlayObject = nil then begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumanName]),c_Red,t_Hint);
    exit;
  end;
  case sCtr[1] of
    '=': begin
      if nPoint in [0..255] then
        PlayObject.m_btCreditPoint:=nPoint;
    end;
    '+': begin
      nCreditpoint:=PlayObject.m_btCreditPoint + nPoint;
      if nPoint in [0..255] then
        PlayObject.m_btCreditPoint:=nCreditpoint;
    end;
    '-': begin
      nCreditpoint:=PlayObject.m_btCreditPoint - nPoint;
      if nPoint in [0..255] then
        PlayObject.m_btCreditPoint:=nCreditpoint;
    end;
  end;
  PlayObject.SysMsg(format(g_sGameCommandCreditPointHumanMsg,[nPoint,PlayObject.m_btCreditPoint]),c_Green,t_Hint);
  SysMsg(format(g_sGameCommandCreditPointGMMsg,[sHumanName,nPoint,PlayObject.m_btCreditPoint]),c_Green,t_Hint);
end;

procedure TPlayObject.CmdAddGold(Cmd:pTGameCmd;sHumName: String; nCount: Integer);//004CD550
var
  PlayObject:TPlayObject;
  nServerIndex:integer;
begin
  if (m_btPermission < 6) then exit;
  if (sHumName = '') or (nCount <= 0) then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' 人物名称  金币数量',c_Red,t_Hint);
    exit;
  end;
  PlayObject:=UserEngine.GeTPlayObject(sHumName);
  if PlayObject <> nil then begin
    if (PlayObject.m_nGold + nCount) < PlayObject.m_nGoldMax then begin
      Inc(PlayObject.m_nGold,nCount);
    end else begin
      nCount:=PlayObject.m_nGoldMax - PlayObject.m_nGold;
      PlayObject.m_nGold:=PlayObject.m_nGoldMax;
    end;
    PlayObject.GoldChanged();
    SysMsg(sHumName + '的金币已增加' + IntToStr(nCount)+ '.',c_Green,t_Hint);
            //004CD6F6
          if g_boGameLogGold then
            AddGameDataLog ('14' + #9 +
                        m_sMapName + #9 +
                        IntToStr(m_nCurrX) + #9 +
                        IntToStr(m_nCurrY) + #9 +
                        m_sCharName + #9 +
                        sSTRING_GOLDNAME + #9 +
                        IntToStr(nCount) + #9 +
                        '1' + #9 +
                        sHumName);
  end else begin
    if UserEngine.FindOtherServerUser(sHumName,nServerIndex) then begin
      SysMsg(sHumName + ' 现在' + IntToStr(nServerIndex)+ '号服务器上',c_Green,t_Hint);
    end else begin
      FrontEngine.AddChangeGoldList(m_sCharName,sHumName,nCount);
      SysMsg(sHumName + ' 现在不在线，等其上线时金币将自动增加',c_Green,t_Hint);
    end;
  end;
end;
procedure TPlayObject.CmdAddGuild(Cmd:pTGameCmd;sGuildName, sGuildChief: String);//004CEBA0
var
  Human:TPlayObject;
  boAddState:Boolean;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if nServerIndex <> 0 then begin
    SysMsg('这个命令只能使用在主服务器上',c_Red,t_Hint);
    exit;
  end;
  if (sGuildName = '') or (sGuildChief = '') then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' 行会名称 掌门人名称',c_Red,t_Hint);
    exit;
  end;

  boAddState:=False;
  Human:=UserEngine.GeTPlayObject(sGuildChief);
  if Human = nil then begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sGuildChief]),c_Red,t_Hint);
    exit;
  end;
  if g_GuildManager.MemberOfGuild(sGuildChief) = nil then begin
    if g_GuildManager.AddGuild(sGuildName,sGuildChief) then begin
      UserEngine.SendServerGroupMsg(SS_205,nServerIndex,sGuildName + '/' + sGuildChief);
      SysMsg('行会名称: ' + sGuildName + ' 掌门人: ' + sGuildChief,c_Green,t_Hint);
      boAddState:=True;
    end;
  end;//004CECB4
  if boAddState then begin
    Human.m_MyGuild:=TObject(g_GuildManager.MemberOfGuild(Human.m_sCharName));
    if Human.m_MyGuild <> nil then begin
      Human.m_sGuildRankName:=TGuild(Human.m_MyGuild).GetRankName(self,Human.m_nGuildRankNo);
      Human.RefShowName();
    end;
  end;//004CED14
  {
  if boAddState then begin
    SysMsg('You燬crewed燯p',c_Red,t_Hint);
  end;
  }
end;
procedure TPlayObject.CmdAdjuestExp(Cmd:pTGameCmd; sHumanName,sExp: String);
var
  PlayObject:TPlayObject;
  dwExp:LongWord;
  dwOExp:LongWord;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sHumanName = '') then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' 人物名称 经验值',c_Red,t_Hint);
    exit;
  end;
  dwExp:=Str_ToInt(sExp,0);

  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject <> nil then begin
    dwOExp:=PlayObject.m_Abil.Exp;
    PlayObject.m_Abil.Exp:=dwExp;
    PlayObject.HasLevelUp(1);
    SysMsg(sHumanName + ' 经验调整完成。',c_Green,t_Hint);
  if g_Config.boShowMakeItemMsg then
    MainOutMessage('[经验调整] ' + m_sCharName + '(' + PlayObject.m_sCharName + ' ' + IntToStr(dwOExp) + ' -> ' + IntToStr(PlayObject.m_Abil.Exp) + ')');
  end else begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumanName]),c_Red,t_Hint);
  end;
end;

procedure TPlayObject.CmdAdjuestLevel(Cmd:pTGameCmd;sHumanName: String;
  nLevel: Integer);
var
  PlayObject:TPlayObject;
  nOLevel:Integer;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if sHumanName = '' then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' 人物名称 等级',c_Red,t_Hint);
    exit;
  end;

  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject <> nil then begin
    nOLevel:=PlayObject.m_Abil.Level;
    PlayObject.m_Abil.Level:=_MAX(1,_MIN(MAXUPLEVEL,nLevel));
    PlayObject.HasLevelUp(1);
    SysMsg(sHumanName + ' 等级调整完成。',c_Green,t_Hint);
    if g_Config.boShowMakeItemMsg then
      MainOutMessage('[等级调整] ' + m_sCharName + '(' + PlayObject.m_sCharName + ' ' + IntToStr(nOLevel) + ' -> ' + IntToStr(PlayObject.m_Abil.Level) + ')');
  end else begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumanName]),c_Red,t_Hint);
  end;
end;
procedure TPlayObject.CmdAdjustExp(Human: TPlayObject; nExp: Integer);//004CDDAC
begin
  if (m_btPermission < 6) then exit;
end;

procedure TPlayObject.CmdBackStep(sCmd:String; nType, nCount: Integer);
begin
  if (m_btPermission < 6) then exit;
  nType:=_MIN(nType,8);
  if nType = 0 then begin
    CharPushed(GetBackDir(m_btDirection),nCount);
  end else begin
    CharPushed(RanDom(nType),nCount);
  end;
    
end;

procedure TPlayObject.CmdBonuPoint(Cmd:pTGameCmd;sHumName: String; nCount: Integer);
var
  PlayObject:TPlayObject;
  sMsg:String;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sHumName = '') then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' 人物名称 属性点数(不输入为查看点数)',c_Red,t_Hint);
    exit;
  end;

  PlayObject:=UserEngine.GetPlayObject(sHumName);
  if PlayObject = nil then begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumName]),c_Red,t_Hint);
    exit;
  end;
  if (nCount > 0) then begin
    PlayObject.m_nBonusPoint:=nCount;
    PlayObject.SendMsg (self, RM_ADJUST_BONUS, 0, 0, 0, 0, '');
    exit;
  end;
  sMsg:=format('未分配点数:%d 已分配点数:(DC:%d MC:%d SC:%d AC:%d MAC:%d HP:%d MP:%d HIT:%d SPEED:%d)',
               [PlayObject.m_nBonusPoint,
                PlayObject.m_BonusAbil.DC,
                PlayObject.m_BonusAbil.MC,
                PlayObject.m_BonusAbil.SC,
                PlayObject.m_BonusAbil.AC,
                PlayObject.m_BonusAbil.MAC,
                PlayObject.m_BonusAbil.HP,
                PlayObject.m_BonusAbil.MP,
                PlayObject.m_BonusAbil.Hit,
                PlayObject.m_BonusAbil.Speed
               ]);
  SysMsg(format('%s的属性点数为:%s',[sHumName,sMsg]),c_Red,t_Hint);
end;

procedure TPlayObject.CmdChangeAdminMode(sCmd:String;nPermission:Integer;sParam1:String;boFlag:Boolean);
begin
  if (m_btPermission < nPermission) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if ((sParam1 <> '') and (sParam1[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[sCmd,'']),c_Red,t_Hint);
    exit;
  end;

  m_boAdminMode:=boFlag;
  if m_boAdminMode then SysMsg(sGameMasterMode,c_Green,t_Hint)
  else  SysMsg(sReleaseGameMasterMode,c_Green,t_Hint);
end;

procedure TPlayObject.CmdChangeAttackMode(nMode: Integer;sParam1,sParam2,sParam3,sParam4,sParam5,sParam6,sParam7:String);
begin
  if (nMode >= HAM_ALL) and (nMode <= HAM_PKATTACK) then
    m_btAttatckMode:=nMode
  else begin
    if m_btAttatckMode < HAM_PKATTACK then Inc(m_btAttatckMode)
    else m_btAttatckMode:=HAM_ALL;
  end;
  case m_btAttatckMode of
    HAM_ALL: SysMsg(sAttackModeOfAll,c_Green,t_Hint); //[攻击模式: 全体攻击]
    HAM_PEACE: SysMsg(sAttackModeOfPeaceful,c_Green,t_Hint); //[攻击模式: 和平攻击]
    HAM_DEAR:  SysMsg(sAttackModeOfDear,c_Green,t_Hint); //[攻击模式: 和平攻击]
    HAM_MASTER:SysMsg(sAttackModeOfMaster,c_Green,t_Hint); //[攻击模式: 和平攻击]
    HAM_GROUP: SysMsg(sAttackModeOfGroup,c_Green,t_Hint); //[攻击模式: 编组攻击]
    HAM_GUILD: SysMsg(sAttackModeOfGuild,c_Green,t_Hint); //[攻击模式: 行会攻击]
    HAM_PKATTACK: SysMsg(sAttackModeOfRedWhite,c_Green,t_Hint); //[攻击模式: 红名攻击]
  end;
end;
procedure TPlayObject.CmdChangeDearName(Cmd:pTGameCmd;sHumanName,sDearName: String);
var
  PlayObject:TPlayObject;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sHumanName = '') or (sDearName = '') then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' 人物名称 配偶名称(如果为 无 则清除)',c_Red,t_Hint);
    exit;
  end;

  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject <> nil then begin
    if CompareText(sDearName,'无') = 0 then begin
      PlayObject.m_sDearName:='';
      PlayObject.RefShowName;
      SysMsg(sHumanName + ' 的配偶名清除成功。',c_Green,t_Hint);
    end else begin
      PlayObject.m_sDearName:=sDearName;
      PlayObject.RefShowName;
      SysMsg(sHumanName + ' 的配偶名更改成功。',c_Green,t_Hint);
    end;
  end else begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumanName]),c_Red,t_Hint);
  end;
end;
procedure TPlayObject.CmdChangeGender(Cmd:pTGameCmd;sHumanName, sSex: String);
var
  PlayObject:TPlayObject;
  nSex:Integer;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  nSex:= -1;
  if (sSex = 'Man') or (sSex = 'Male') or (sSex = '0') then begin
    nSex:=0;
  end;
  if (sSex = 'Woman') or (sSex = 'Female') or (sSex = '1') then begin
    nSex:=1;
  end;
  if (sHumanName = '') or (nSex = -1) then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' 人物名称 性别(男、女)',c_Red,t_Hint);
    exit;
  end;

  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject <> nil then begin
    if PlayObject.m_btGender <> nSex then begin
      PlayObject.m_btGender:=nSex;
      PlayObject.FeatureChanged();
      SysMsg(PlayObject.m_sCharName + ' 的性别已改变。',c_Green,t_Hint);
    end else begin
      SysMsg(PlayObject.m_sCharName + ' 的性别未改变！！！',c_Red,t_Hint);
    end;
  end else begin
    SysMsg(sHumanName + '没有在线！！！',c_Red,t_Hint);
  end;
end;
procedure TPlayObject.CmdChangeItemName(sCmd, sMakeIndex,sItemIndex, sItemName: String);
var
  nMakeIndex,nItemIndex:Integer;
begin
  if (m_btPermission < 6) then exit;
  if (sMakeIndex = '') or (sItemIndex = '') or (sItemName = '') then begin
    SysMsg('命令格式: @' + sCmd + ' 物品编号 物品ID号 物品名称',c_Red,t_Hint);
    exit;
  end;
  nMakeIndex:=Str_ToInt(sMakeIndex,-1);
  nItemIndex:=Str_ToInt(sItemIndex,-1);
  if (nMakeIndex <= 0) or (nItemIndex < 0) then begin
    SysMsg('命令格式: @' + sCmd + ' 物品编号 物品ID号 物品名称',c_Red,t_Hint);
    exit;
  end;

  if ItemUnit.AddCustomItemName(nMakeIndex,nItemIndex,sItemName) then begin
    ItemUnit.SaveCustomItemName();
    SysMsg('物品名称设置成功。',c_Green,t_Hint);
    exit;
  end;

  SysMsg('此物品，已经设置了其它的名称！！！',c_Red,t_Hint);
end;
procedure TPlayObject.CmdChangeJob(Cmd:pTGameCmd;sHumanName,sJobName: String);//004CC714
var
  PlayObject:TPlayObject;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;

  if (sHumanName = '') or (sJobName = '') then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,g_sGameCommandChangeJobHelpMsg]),c_Red,t_Hint);
    exit;
  end;

  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject <> nil then begin
    if CompareText(sJobName,sWarrior) = 0 then PlayObject.m_btJob:=jWarr;
    if CompareText(sJobName,sWizard) = 0 then PlayObject.m_btJob:=jWizard;
    if CompareText(sJobName,sTaos) = 0 then PlayObject.m_btJob:=jTaos;
    PlayObject.HasLevelUp(1);
    PlayObject.SysMsg(g_sGameCommandChangeJobHumanMsg,c_Green,t_Hint);
    SysMsg(format(g_sGameCommandChangeJobMsg,[sHumanName]),c_Green,t_Hint);
  end else begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumanName]),c_Red,t_Hint);
  end;
end;
procedure TPlayObject.CmdChangeLevel(Cmd:pTGameCmd;sParam1:String);
var
  nOLevel:Integer;
  nLevel:Integer;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if ((sParam1 <> '') and (sParam1[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,'']),c_Red,t_Hint);
    exit;
  end;
  
  nLevel:=Str_ToInt(sParam1,1);
  nOLevel:=m_Abil.Level;
  m_Abil.Level:=_MIN(MAXUPLEVEL,nLevel);
  HasLevelUp(1);
  if g_Config.boShowMakeItemMsg then begin
    MainOutMessage(format(g_sGameCommandLevelConsoleMsg,[m_sCharName,nOLevel,m_Abil.Level]));
  end;
end;
procedure TPlayObject.CmdChangeMasterName(Cmd:pTGameCmd;sHumanName,sMasterName,sIsMaster: String);
var
  PlayObject:TPlayObject;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sHumanName = '') or (sMasterName = '') then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' 人物名称 师徒名称(如果为 无 则清除)',c_Red,t_Hint);
    exit;
  end;

  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject <> nil then begin
    if CompareText(sMasterName,'无') = 0 then begin
      PlayObject.m_sMasterName:='';
      PlayObject.RefShowName;
      PlayObject.m_boMaster:=False;
      SysMsg(sHumanName + ' 的师徒名清除成功。',c_Green,t_Hint);
    end else begin
      PlayObject.m_sMasterName:=sMasterName;
      if (sIsMaster <> '') and (sIsMaster[1] = '1') then PlayObject.m_boMaster:=True
      else PlayObject.m_boMaster:=False;
      PlayObject.RefShowName;
      SysMsg(sHumanName + ' 的师徒名更改成功。',c_Green,t_Hint);
    end;
  end else begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumanName]),c_Red,t_Hint);
  end;
end;
procedure TPlayObject.CmdChangeObMode(sCmd:String;nPermission:Integer;sParam1:String;boFlag:Boolean);
begin
  if (m_btPermission < nPermission) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if ((sParam1 <> '') and (sParam1[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[sCmd,'']),c_Red,t_Hint);
    exit;
  end;
  if boFlag then begin
     SendRefMsg(RM_DISAPPEAR, 0, 0, 0, 0, ''); //01/21 强行发送刷新数据到客户端，解决GM登录隐身有影子问题
  end;
  m_boObMode:=boFlag;
  if m_boObMode then begin
    SysMsg(sObserverMode,c_Green,t_Hint);
  end else  SysMsg(g_sReleaseObserverMode,c_Green,t_Hint);
end;
procedure TPlayObject.CmdChangeSabukLord(Cmd:pTGameCmd;sCastleName,sGuildName: String; boFlag: Boolean);//004CFE1C
var
  Guild:TGuild;
  Castle:TUserCastle;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
    
  if (sCastleName = '') or (sGuildName = '') then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' 城堡名称 行会名称',c_Red,t_Hint);
    exit;
  end;
  Castle:=g_CastleManager.Find(sCastleName);
  if Castle = nil then begin
    SysMsg(format(g_sGameCommandSbkGoldCastleNotFoundMsg,[sCastleName]),c_Red,t_Hint);
    exit;
  end;
    
  Guild:=g_GuildManager.FindGuild(sGuildName);
  if Guild <> nil then begin
    //4CFEC7
    AddGameDataLog('27' + #9 +
                   Castle.m_sOwnGuild + #9 +
                   '0' + #9 +
                   '1' + #9 +
                   'sGuildName' + #9 +
                   m_sCharName + #9 +
                   '0' + #9 +
                   '1' + #9 +
                   '0');
    Castle.GetCastle(Guild);
    if boFlag then
      UserEngine.SendServerGroupMsg(SS_211,nServerIndex,sGuildName);
    SysMsg(Castle.m_sName + ' 所属行会已经更改为 ' + sGuildName,c_Green,t_Hint);
  end else begin
    SysMsg('行会 ' + sGuildName + '还没建立！！！',c_Red,t_Hint);
  end;
end;

procedure TPlayObject.CmdChangeSalveStatus;
begin
  if m_SlaveList.Count > 0 then begin
    m_boSlaveRelax:=not m_boSlaveRelax;
    if m_boSlaveRelax then SysMsg(sPetRest,c_Green,t_Hint)
    else SysMsg(sPetAttack,c_Green,t_Hint)
  end;
end;

procedure TPlayObject.CmdChangeSuperManMode(sCmd:String;nPermission:Integer;sParam1:String;boFlag:Boolean);
begin
  if (m_btPermission < nPermission) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if ((sParam1 <> '') and (sParam1[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[sCmd,'']),c_Red,t_Hint);
    exit;
  end;
  m_boSuperMan:=boFlag;
  if m_boSuperMan then SysMsg(sSupermanMode,c_Green,t_Hint)
  else  SysMsg(sReleaseSupermanMode,c_Green,t_Hint);
end;


procedure TPlayObject.CmdChangeUserFull(sCmd, sUserCount: String);
var
  nCount:Integer;
begin
  if (m_btPermission < 6) then exit;
  nCount:=Str_ToInt(sUserCount,-1);
  if (sUserCount = '') or (nCount < 1) or ((sUserCount <> '') and (sUserCount[1] = '?')) then begin
    SysMsg('设置服务器最高上线人数。',c_Red,t_Hint);
    SysMsg('命令格式: @' + sCmd + ' 人数',c_Red,t_Hint);
    exit;
  end;
  g_Config.nUserFull:=nCount;
  SysMsg(format('服务器上线人数限制: %d',[nCount]),c_Green,t_Hint);
end;


procedure TPlayObject.CmdChangeZenFastStep(sCmd, sFastStep: String);
var
  nFastStep:Integer;
begin
  if (m_btPermission < 6) then exit;
  nFastStep:=Str_ToInt(sFastStep,-1);
  if (sFastStep = '') or (nFastStep < 1) or ((sFastStep <> '') and (sFastStep[1] = '?')) then begin
    SysMsg('设置怪物行动速度。',c_Red,t_Hint);
    SysMsg('命令格式: @' + sCmd + ' 速度',c_Red,t_Hint);
    exit;
  end;
  g_Config.nZenFastStep:=nFastStep;
  SysMsg(format('怪物行动速度: %d',[nFastStep]),c_Green,t_Hint);
end;

procedure TPlayObject.CmdClearBagItem(Cmd: pTGameCmd; sHumanName: String);
var
  I: Integer;
  PlayObject:TPlayObject;
  UserItem:pTUserItem;
  DelList:TStringList;
begin
  DelList:=nil;
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sHumanName = '') or ((sHumanName <> '') and (sHumanName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,'人物名称']),c_Red,t_Hint);
    exit;
  end;

  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject = nil then begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumanName]),c_Red,t_Hint);
    exit;
  end;
    
  for I := 0 to PlayObject.m_ItemList.Count - 1 do begin
    UserItem:=PlayObject.m_ItemList.Items[I];
    if DelList = nil then DelList:=TStringList.Create;
    DelList.AddObject(UserEngine.GetStdItemName(UserItem.wIndex), TObject(UserItem.MakeIndex));
    Dispose(UserItem);
  end;
  PlayObject.m_ItemList.Clear;
  if DelList <> nil then begin
    PlayObject.SendMsg(PlayObject,RM_SENDDELITEMLIST,0,Integer(DelList),0,0,'');
  end;
end;

procedure TPlayObject.CmdClearHumanPassword(sCmd:String;nPermission:Integer;sHumanName: String);
var
  PlayObject:TPlayObject;
begin
  if (m_btPermission < nPermission) then exit;
  if (sHumanName = '') or ((sHumanName <> '') and (sHumanName[1] = '?')) then begin
    SysMsg('清除玩家的仓库密码！！！',c_Red,t_Hint);
    SysMsg(format('命令格式: @%s 人物名称',[sCmd]),c_Red,t_Hint);
    exit;
  end;
  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject = nil then begin
    exit;
  end;
  PlayObject.m_boPasswordLocked:=False;
  PlayObject.m_boUnLockStoragePwd:=False;
  PlayObject.m_sStoragePwd:='';
  PlayObject.SysMsg('你的保护密码已被清除！！！',c_Green,t_Hint);
  SysMsg(format('%s的保护密码已被清除！！！',[sHumanName]),c_Green,t_Hint);
end;

procedure TPlayObject.CmdClearMapMonster(Cmd:pTGameCmd;sMapName, sMonName,sItems: String);
var
  I,II: Integer;
  MonList:TList;
  Envir:TEnvirnoment;
  nMonCount:Integer;
  boKillAll:Boolean;
  boKillAllMap:Boolean;
  boNotItem:Boolean;
  BaseObject:TBaseObject;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sMapName = '') or (sMonName = '') or (sItems = '') then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' 地图号(* 为所有) 怪物名称(* 为所有) 掉物品(0,1)',c_Red,t_Hint);
    exit;
  end;
  boKillAll:=False;
  boKillAllMap:=False;
  boNotItem:=True;
  nMonCount:=0;
  Envir:=nil;
  if sMonName = '*' then boKillAll:=True;
  if sMapName = '*' then boKillAllMap:=True;
  if sItems = '1' then boNotItem:=False;

  MonList:=TList.Create;
  for I := 0 to g_MapManager.Count - 1 do begin
    Envir:=TEnvirnoment(g_MapManager.Items[I]);
    if (Envir <> nil) and (boKillAllMap or (CompareText(Envir.sMapName,sMapName) = 0)) then begin
      UserEngine.GetMapMonster(Envir,MonList);
      for II := 0 to MonList.Count - 1 do begin
        BaseObject:=TBaseObject(MonList.Items[II]);
        if boKillAll or (CompareText(sMonName,BaseObject.m_sCharName) = 0) then begin
          BaseObject.m_boNoItem:=boNotItem;
          BaseObject.m_WAbil.HP:=0;
          Inc(nMonCount);
        end;
      end;
    end;
  end;
  MonList.Free;
  if Envir = nil then begin
    SysMsg('输入的地图不存在！！！',c_Red,t_Hint);
    exit;
  end;

  SysMsg('已清除怪物数: ' + IntTOStr(nMonCount),c_Red,t_Hint);
end;

procedure TPlayObject.CmdClearMission(Cmd:pTGameCmd;sHumanName: String);
var
  PlayObject:TPlayObject;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sHumanName = '') then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' 人物名称)',c_Red,t_Hint);
    exit;
  end;
  if sHumanName[1] = '?' then begin
    SysMsg('此命令用于清除人物的任务标志。',c_Blue,t_Hint);
    exit;
  end;
  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject = nil then begin
    SysMsg(format('%s不在线，或在其它服务器上！！',[sHumanName]),c_Red,t_Hint);
    exit;
  end;
  FillChar(PlayObject.m_QuestFlag,SizeOf(TQuestFlag),#0);
  SysMsg(format('%s的任务标志已经全部清零。',[sHumanName]),c_Green,t_Hint);
end;


procedure TPlayObject.CmdContestPoint(Cmd:pTGameCmd;sGuildName: String);//004CEF08
var
  I: Integer;
  Guild:TGuild;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sGuildName = '')  or ((sGuildName <> '') and (sGuildName[1] = '?')) then begin
    SysMsg('查看行会战的得分数。',c_Red,t_Hint);
    SysMsg(format('命令格式: @%s 行会名称',[Cmd.sCmd]),c_Red,t_Hint);
    exit;
  end;
  Guild:=g_GuildManager.FindGuild(sGuildName);
  if Guild <> nil then begin
    SysMsg(format('%s 的得分为: %d',[sGuildName,Guild.nContestPoint]),c_Green,t_Hint);
  end else begin
    SysMsg(format('行会: %s 不存在！！！',[sGuildName]),c_Green,t_Hint);
  end;
end;

procedure TPlayObject.CmdStartContest(Cmd:pTGameCmd;sParam1:String);//004CF008
var
  I,II: Integer;
  List10,List14:TList;
  PlayObject,PlayObjectA:TPlayObject;
  bo19:Boolean;
  s20:String;
  Guild:TGuild;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if ((sParam1 <> '') and (sParam1[1] = '?')) then begin
    SysMsg('开始行会争霸赛。',c_Red,t_Hint);
    SysMsg(format('命令格式: @%s',[Cmd.sCmd]),c_Red,t_Hint);
    exit;
  end;
  
  if not m_PEnvir.Flag.boFight3Zone then begin
    SysMsg('此命令不能在当前地图中使用！！！',c_Red,t_Hint);
    exit;
  end;
  List10:=TList.Create;
  List14:=TList.Create;
  UserEngine.GetMapRageHuman(m_PEnvir,m_nCurrX,m_nCurrY,1000,List10);
  for I := 0 to List10.Count - 1 do begin
    PlayObject:=TPlayObject(List10.Items[I]);
    if not PlayObject.m_boObMode or not PlayObject.m_boAdminMode then begin
      PlayObject.m_nFightZoneDieCount:=0;
      if PlayObject.m_MyGuild = nil then Continue;
      bo19:=False;
      for II := 0 to List14.Count - 1 do begin
        PlayObjectA:=TPlayObject(List14.Items[II]);
        if PlayObject.m_MyGuild = PlayObjectA.m_MyGuild then
          bo19:=True;
      end;
      if not bo19 then begin
        List14.Add(PlayObject.m_MyGuild);
      end;        
    end;
  end;
  SysMsg('行会争霸赛已经开始。',c_Green,t_Hint);
  UserEngine.CryCry(RM_CRY,m_PEnvir,m_nCurrX,m_nCurrY,1000,g_Config.btCryMsgFColor,g_Config.btCryMsgBColor,'- 行会战争已爆发。');
  s20:='';
  for I := 0 to List14.Count - 1 do begin
    Guild:=TGuild(List14.Items[I]);
    Guild.StartTeamFight();
    for II := 0 to List10.Count - 1 do  begin
      PlayObject:=TPlayObject(List10.Items[I]);
      if PlayObject.m_MyGuild = Guild then begin
        Guild.AddTeamFightMember(PlayObject.m_sCharName);
      end;
    end;
    s20:=s20 + Guild.sGuildName + ' ';
  end;
  UserEngine.CryCry(RM_CRY,m_PEnvir,m_nCurrX,m_nCurrY,1000,g_Config.btCryMsgFColor,g_Config.btCryMsgBColor,' -参加的门派:' + s20);
  List10.Free;
  List14.Free;
end;

procedure TPlayObject.CmdEndContest(Cmd:pTGameCmd;sParam1:String);//004CF364
var
  I,II: Integer;
  List10,List14:TList;
  PlayObject,PlayObjectA:TPlayObject;
  bo19:Boolean;
  s20:String;
  Guild:TGuild;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if ((sParam1 <> '') and (sParam1[1] = '?')) then begin
    SysMsg('结束行会争霸赛。',c_Red,t_Hint);
    SysMsg(format('命令格式: @%s',[Cmd.sCmd]),c_Red,t_Hint);
    exit;
  end;

  if not m_PEnvir.Flag.boFight3Zone then begin
    SysMsg('此命令不能在当前地图中使用！！！',c_Red,t_Hint);
    exit;
  end;
  List10:=TList.Create;
  List14:=TList.Create;
  UserEngine.GetMapRageHuman(m_PEnvir,m_nCurrX,m_nCurrY,1000,List10);
  for I := 0 to List10.Count - 1 do begin
    PlayObject:=TPlayObject(List10.Items[I]);
    if not PlayObject.m_boObMode or not PlayObject.m_boAdminMode then begin
      if PlayObject.m_MyGuild = nil then Continue;
      bo19:=False;
      for II := 0 to List14.Count - 1 do begin
        PlayObjectA:=TPlayObject(List14.Items[II]);
        if PlayObject.m_MyGuild = PlayObjectA.m_MyGuild then
          bo19:=True;
      end;
      if not bo19 then begin
        List14.Add(PlayObject.m_MyGuild);
      end;        
    end;
  end;
  for I := 0 to List14.Count - 1 do begin
    Guild:=TGuild(List14.Items[I]);
    Guild.EndTeamFight();
    UserEngine.CryCry(RM_CRY,m_PEnvir,m_nCurrX,m_nCurrY,1000,g_Config.btCryMsgFColor,g_Config.btCryMsgBColor,format(' - %s 行会争霸赛已结束。',[Guild.sGuildName]));
  end;
  List10.Free;
  List14.Free;
end;

procedure TPlayObject.CmdAllowGroupReCall(sCmd, sParam: String);
begin
  if (sParam <> '') and (sParam[1] = '?') then begin
    SysMsg('此命令用于允许或禁止编组传送功能。',c_Red,t_Hint);
    exit;
  end;

  m_boAllowGroupReCall:= not m_boAllowGroupReCall;
  if m_boAllowGroupReCall then SysMsg(g_sEnableGroupRecall{'[允许天地合一]'},c_Green,t_Hint)
  else SysMsg(g_sDisableGroupRecall{'[禁止天地合一]'},c_Green,t_Hint);
end;


procedure TPlayObject.CmdAnnouncement(Cmd:pTGameCmd;sGuildName: String);//004CF564
var
  I: Integer;
  Guild:TGuild;
  PlayObject:TPlayObject;
  sHumanName:String;
  nPoint:Integer;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sGuildName = '') or ((sGuildName <> '') and (sGuildName[1] = '?')) then begin
    SysMsg('查看行会争霸赛结果。',c_Red,t_Hint);
    SysMsg(format('命令格式: @%s 行会名称',[Cmd.sCmd]),c_Red,t_Hint);
    exit;
  end;

  if not m_PEnvir.Flag.boFight3Zone then begin
    SysMsg('此命令不能在当前地图中使用！！！',c_Red,t_Hint);
    exit;
  end;
  Guild:=g_GuildManager.FindGuild(sGuildName);
  if Guild <> nil then begin
    UserEngine.CryCry(RM_CRY,m_PEnvir,m_nCurrX,m_nCurrY,1000,g_Config.btCryMsgFColor,g_Config.btCryMsgBColor,format(' - %s 行会争霸赛结果: ',[Guild.sGuildName]));
    for I := 0 to Guild.TeamFightDeadList.Count - 1 do begin
      nPoint:=Integer(Guild.TeamFightDeadList.Objects[I]);
      sHumanName:=Guild.TeamFightDeadList.Strings[I];
      UserEngine.CryCry(RM_CRY,
                        m_PEnvir,
                        m_nCurrX,
                        m_nCurrY,
                        1000,
                        g_Config.btCryMsgFColor,
                        g_Config.btCryMsgBColor,
                        format(' - %s  : %d 分/死亡%d次。 ',[sHumanName,HiWord(nPoint),LoWord(nPoint)]));
    end;
  end;
      UserEngine.CryCry(RM_CRY,
                        m_PEnvir,
                        m_nCurrX,
                        m_nCurrY,
                        1000,
                        g_Config.btCryMsgFColor,
                        g_Config.btCryMsgBColor,
                        format(' - [%s] : %d 分。',[Guild.sGuildName,Guild.nContestPoint]));
      UserEngine.CryCry(RM_CRY,
                        m_PEnvir,
                        m_nCurrX,
                        m_nCurrY,
                        1000,
                        g_Config.btCryMsgFColor,
                        g_Config.btCryMsgBColor,
                        '------------------------------------');
end;

procedure TPlayObject.CmdDearRecall(sCmd, sParam: String);
begin
  if (sParam <> '') and (sParam[1] = '?') then begin
    SysMsg('命令格式: @' + sCmd + ' (夫妻传送，将对方传送到自己身边，对方必须允许传送。)',c_Green,t_Hint);
    exit;
  end;
  if m_sDearName = '' then begin
    SysMsg('你没有结婚！！！',c_Red,t_Hint);
    exit;
  end;
  if m_PEnvir.Flag.boNODEARRECALL then begin
    SysMsg('本地图禁止夫妻传送！！！',c_Red,t_Hint);
    exit;
  end;
    
    
  if m_DearHuman = nil then begin
    if m_btGender = gMan then begin
      SysMsg('你的老婆不在线！！！',c_Red,t_Hint);
    end else begin
      SysMsg('你的老公不在线！！！',c_Red,t_Hint);
    end; 
    exit;
  end;
  if GetTickCount - m_dwDearRecallTick < 10000 then begin
    SysMsg('稍等伙才能再次使用此功能！！！',c_Red,t_Hint);
    exit;
  end;
  m_dwDearRecallTick:=GetTickCount();
  if m_DearHuman.m_boCanDearRecall then begin
    RecallHuman(m_DearHuman.m_sCharName);
  end else begin
    SysMsg(m_DearHuman.m_sCharName + ' 不允许传送！！！',c_Red,t_Hint);
    exit;
  end;
      
end;

procedure TPlayObject.CmdMasterRecall(sCmd, sParam: String);
var
  I: Integer;
  MasterHuman:TPlayObject;
begin
  if (sParam <> '') and (sParam[1] = '?') then begin
    SysMsg('命令格式: @' + sCmd + ' (师徒传送，师父可以将徒弟传送到自己身边，徒弟必须允许传送。)',c_Green,t_Hint);
    exit;
  end;
  if not m_boMaster then begin
    SysMsg('只能师父才能使用此功能！！！',c_Red,t_Hint);
    exit;
  end;
  if m_MasterList.Count = 0 then begin
    SysMsg('你的徒弟一个都不在线！！！',c_Red,t_Hint);
    exit;
  end;
  if m_PEnvir.Flag.boNOMASTERRECALL then begin
    SysMsg('本地图禁止师徒传送！！！',c_Red,t_Hint);
    exit;
  end;
  if GetTickCount - m_dwMasterRecallTick < 10000 then begin
    SysMsg('稍等伙才能再次使用此功能！！！',c_Red,t_Hint);
    exit;
  end;
  for I := 0 to m_MasterList.Count - 1 do begin
    MasterHuman:=TPlayObject(m_MasterList.Items[I]);
    if MasterHuman.m_boCanMasterRecall then begin
      RecallHuman(MasterHuman.m_sCharName);
    end else begin
      SysMsg(MasterHuman.m_sCharName + ' 不允许传送！！！',c_Red,t_Hint);
    end;
  end;
end;

procedure TPlayObject.CmdDelBonuPoint(Cmd:pTGameCmd;sHumName: String);
var
  PlayObject:TPlayObject;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if sHumName = '' then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' 人物名称',c_Red,t_Hint);
    exit;
  end;
  PlayObject:=UserEngine.GeTPlayObject(sHumName);
  if PlayObject <> nil then begin
    FillChar(PlayObject.m_BonusAbil,SizeOf(TNakedAbility),#0);
    PlayObject.m_nBonusPoint:=0;
    PlayObject.SendMsg (PlayObject,RM_ADJUST_BONUS,0,0,0,0,'');
    PlayObject.HasLevelUp(0);
    PlayObject.SysMsg('分配点数已清除！！！',c_Red,t_Hint);
    SysMsg(sHumName + ' 的分配点数已清除.',c_Green,t_Hint);
  end else begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumName]),c_Red,t_Hint);
  end;
end;

procedure TPlayObject.CmdReNewLevel(Cmd:pTGameCmd;sHumanName, sLevel: String);
var
  PlayObject:TPlayObject;
  nLevel:Integer;
begin
  if (m_btPermission < 6) then exit;
  if (sHumanName = '') or ((sHumanName <> '') and (sHumanName[1] = '?')) then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' 人物名称 点数(为空则查看)',c_Red,t_Hint);
    exit;
  end;
  nLevel:=Str_ToInt(sLevel,-1);
  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject <> nil then begin
    if (nLevel >= 0) and (nLevel <= 255) then begin
      PlayObject.m_btReLevel:=nLevel;
      PlayObject.RefShowName();
    end;
    SysMsg(sHumanName + ' 的转生等级为 ' + IntToStr(PlayObject.m_btReLevel),c_Green,t_Hint);
  end else begin
    SysMsg(sHumanName + ' 没在线上！！！',c_Red,t_Hint);
  end;
end;

procedure TPlayObject.CmdRestBonuPoint(Cmd:pTGameCmd;sHumName: String);
var
  PlayObject:TPlayObject;
  nTotleUsePoint:Integer;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if sHumName = '' then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' 人物名称',c_Red,t_Hint);
    exit;
  end;
  PlayObject:=UserEngine.GeTPlayObject(sHumName);
  if PlayObject <> nil then begin
    nTotleUsePoint:=PlayObject.m_BonusAbil.DC +
                    PlayObject.m_BonusAbil.MC +
                    PlayObject.m_BonusAbil.SC +
                    PlayObject.m_BonusAbil.AC +
                    PlayObject.m_BonusAbil.MAC +
                    PlayObject.m_BonusAbil.HP +
                    PlayObject.m_BonusAbil.MP +
                    PlayObject.m_BonusAbil.Hit +
                    PlayObject.m_BonusAbil.Speed +
                    PlayObject.m_BonusAbil.X2;
    FillChar(PlayObject.m_BonusAbil,SizeOf(TNakedAbility),#0);


    Inc(PlayObject.m_nBonusPoint,nTotleUsePoint);
    PlayObject.SendMsg (PlayObject,RM_ADJUST_BONUS,0,0,0,0,'');
    PlayObject.HasLevelUp(0);
    PlayObject.SysMsg('分配点数已复位！！！',c_Red,t_Hint);
    SysMsg(sHumName + ' 的分配点数已复位.',c_Green,t_Hint);
  end else begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumName]),c_Red,t_Hint);
  end;
end;

procedure TPlayObject.CmdSbkDoorControl(sCmd, sParam: String);
begin

end;

procedure TPlayObject.CmdSearchDear(sCmd, sParam: String);
begin
  if (sParam <> '') and (sParam[1] = '?') then begin
    SysMsg('此命令用于查询配偶当前所在位置。',c_Red,t_Hint);
    exit;
  end;
  if m_sDearName = '' then begin
    SysMsg(g_sYouAreNotMarryedMsg{'你都没结婚查什么？'},c_Red,t_Hint);
    exit;
  end;
  if m_DearHuman = nil then begin
    if m_btGender = gMan then begin
      SysMsg(g_sYourWifeNotOnlineMsg{'你的老婆还没有上线！！！'},c_Red,t_Hint);
    end else begin
      SysMsg(g_sYourHusbandNotOnlineMsg{'你的老公还没有上线！！！'},c_Red,t_Hint);
    end;
    exit;
  end;
  
  if m_btGender = gMan then begin
    SysMsg(g_sYourWifeNowLocateMsg{'你的老婆现在位于:'},c_Green,t_Hint);
    SysMsg(m_DearHuman.m_sCharName + ' ' + m_DearHuman.m_PEnvir.sMapDesc + '(' + IntToStr(m_DearHuman.m_nCurrX) + ':' + IntToStr(m_DearHuman.m_nCurrY) + ')' ,c_Green,t_Hint);
    m_DearHuman.SysMsg(g_sYourHusbandSearchLocateMsg{'你的老公正在找你，他现在位于:'},c_Green,t_Hint);
    m_DearHuman.SysMsg(m_sCharName + ' ' + m_PEnvir.sMapDesc + '(' + IntToStr(m_nCurrX) + ':' + IntToStr(m_nCurrY) + ')' ,c_Green,t_Hint);
  end else begin
    SysMsg(g_sYourHusbandNowLocateMsg{'你的老公现在位于:'},c_Red,t_Hint);
    SysMsg(m_DearHuman.m_sCharName + ' ' + m_DearHuman.m_PEnvir.sMapDesc + '(' + IntToStr(m_DearHuman.m_nCurrX) + ':' + IntToStr(m_DearHuman.m_nCurrY) + ')' ,c_Green,t_Hint);
    m_DearHuman.SysMsg(g_sYourWifeSearchLocateMsg{'你的老婆正在找你，她现在位于:'},c_Green,t_Hint);
    m_DearHuman.SysMsg(m_sCharName + ' ' + m_PEnvir.sMapDesc + '(' + IntToStr(m_nCurrX) + ':' + IntToStr(m_nCurrY) + ')' ,c_Green,t_Hint);
  end;
    
end;

procedure TPlayObject.CmdSearchMaster(sCmd, sParam: String);
var
  I: Integer;
  Human:TPlayObject;
begin
  if (sParam <> '') and (sParam[1] = '?') then begin
    SysMsg('此命令用于查询师徒当前所在位置。',c_Red,t_Hint);
    exit;
  end;
  if m_sMasterName = '' then begin
    SysMsg(g_sYouAreNotMasterMsg,c_Red,t_Hint);
    exit;
  end;
  if m_boMaster then begin
    if m_MasterList.Count <= 0 then begin
      SysMsg(g_sYourMasterListNotOnlineMsg,c_Red,t_Hint);
      exit;
    end;
    SysMsg(g_sYourMasterListNowLocateMsg,c_Green,t_Hint);
    for I := 0 to m_MasterList.Count - 1 do begin
      Human:=TPlayObject(m_MasterList.Items[I]);
      SysMsg(Human.m_sCharName + ' ' + Human.m_PEnvir.sMapDesc + '(' + IntToStr(Human.m_nCurrX) + ':' + IntToStr(Human.m_nCurrY) + ')' ,c_Green,t_Hint);
      Human.SysMsg(g_sYourMasterSearchLocateMsg,c_Green,t_Hint);
      Human.SysMsg(m_sCharName + ' ' + m_PEnvir.sMapDesc + '(' + IntToStr(m_nCurrX) + ':' + IntToStr(m_nCurrY) + ')' ,c_Green,t_Hint);
    end;
  end else begin
    if m_MasterHuman = nil then begin
      SysMsg(g_sYourMasterNotOnlineMsg,c_Red,t_Hint);
      exit;
    end;
    SysMsg(g_sYourMasterNowLocateMsg,c_Red,t_Hint);
    SysMsg(m_MasterHuman.m_sCharName + ' ' + m_MasterHuman.m_PEnvir.sMapDesc + '(' + IntToStr(m_MasterHuman.m_nCurrX) + ':' + IntToStr(m_MasterHuman.m_nCurrY) + ')' ,c_Green,t_Hint);
    m_MasterHuman.SysMsg(g_sYourMasterListSearchLocateMsg,c_Green,t_Hint);
    m_MasterHuman.SysMsg(m_sCharName + ' ' + m_PEnvir.sMapDesc + '(' + IntToStr(m_nCurrX) + ':' + IntToStr(m_nCurrY) + ')' ,c_Green,t_Hint);
  end;
end;

procedure TPlayObject.CmdSetPermission(Cmd:pTGameCmd;sHumanName,sPermission: String);
var
  nPerission:Integer;
  PlayObject:TPlayObject;
ResourceString
  sOutFormatMsg = '[权限调整] %s (%s %d -> %d)';
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  nPerission:=Str_ToInt(sPermission,0);
  if (sHumanName = '') or not (nPerission in [0..10]) then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' 人物名称 权限等级(0 - 10)',c_Red,t_Hint);
    exit;
  end;

  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject = nil then begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumanName]),c_Red,t_Hint);
    exit;
  end;
  if g_Config.boShowMakeItemMsg then
    MainOutMessage(format(sOutFormatMsg,[m_sCharName,PlayObject.m_sCharName,PlayObject.m_btPermission,nPerission]));
  PlayObject.m_btPermission:=nPerission;
  SysMsg(sHumanName + ' 当前权限为: ' + IntToStr(PlayObject.m_btPermission),c_Red,t_Hint);
end;

procedure TPlayObject.CmdShowHumanFlag(sCmd: String; nPermission: Integer;
  sHumanName,sFlag: String);
var
  PlayObject:TPlayObject;
  nFlag:Integer;
begin
  if (m_btPermission < nPermission) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sHumanName = '') or ((sHumanName <> '') and (sHumanName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[sCmd,g_sGameCommandShowHumanFlagHelpMsg]),c_Red,t_Hint);
    exit;
  end;
  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject = nil then begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumanName]),c_Red,t_Hint);
    exit;
  end;
  nFlag:=Str_ToInt(sFlag,0);
  if PlayObject.GetQuestFalgStatus(nFlag) = 1 then begin
    SysMsg(format(g_sGameCommandShowHumanFlagONMsg,[PlayObject.m_sCharName,nFlag]),c_Green,t_Hint);
  end else begin
    SysMsg(format(g_sGameCommandShowHumanFlagOFFMsg,[PlayObject.m_sCharName,nFlag]),c_Green,t_Hint);
  end;
end;

procedure TPlayObject.CmdShowHumanUnit(sCmd: String; nPermission: Integer;
  sHumanName, sUnit: String);
var
  PlayObject:TPlayObject;
  nUnit:Integer;
begin
  if (m_btPermission < nPermission) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sHumanName = '') or ((sHumanName <> '') and (sHumanName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[sCmd,g_sGameCommandShowHumanUnitHelpMsg]),c_Red,t_Hint);
    exit;
  end;
  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject = nil then begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumanName]),c_Red,t_Hint);
    exit;
  end;
  nUnit:=Str_ToInt(sUnit,0);
  if PlayObject.GetQuestUnitStatus(nUnit) = 1 then begin
    SysMsg(format(g_sGameCommandShowHumanUnitONMsg,[PlayObject.m_sCharName,nUnit]),c_Green,t_Hint);
  end else begin
    SysMsg(format(g_sGameCommandShowHumanUnitOFFMsg,[PlayObject.m_sCharName,nUnit]),c_Green,t_Hint);
  end;
end;

procedure TPlayObject.CmdShowHumanUnitOpen(sCmd: String; nPermission: Integer;
  sHumanName, sUnit: String);
var
  PlayObject:TPlayObject;
  nUnit:Integer;
begin
  if (m_btPermission < nPermission) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sHumanName = '') or ((sHumanName <> '') and (sHumanName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[sCmd,g_sGameCommandShowHumanUnitHelpMsg]),c_Red,t_Hint);
    exit;
  end;
  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject = nil then begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumanName]),c_Red,t_Hint);
    exit;
  end;
  nUnit:=Str_ToInt(sUnit,0);
  if PlayObject.GetQuestUnitOpenStatus(nUnit) = 1 then begin
    SysMsg(format(g_sGameCommandShowHumanUnitONMsg,[PlayObject.m_sCharName,nUnit]),c_Green,t_Hint);
  end else begin
    SysMsg(format(g_sGameCommandShowHumanUnitOFFMsg,[PlayObject.m_sCharName,nUnit]),c_Green,t_Hint);
  end;
end;

procedure TPlayObject.CmdShowMapInfo(Cmd:pTGameCmd;sParam1:String);
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if ((sParam1 <> '') and (sParam1[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,'']),c_Red,t_Hint);
    exit;
  end;
  SysMsg(format(g_sGameCommandMapInfoMsg,[m_PEnvir.sMapName,m_PEnvir.sMapDesc]),c_Green,t_Hint);
  SysMsg(format(g_sGameCommandMapInfoSizeMsg,[m_PEnvir.Header.wWidth,m_PEnvir.Header.wHeight]),c_Green,t_Hint);
end;

procedure TPlayObject.CmdShowMapMode(sCmd, sMapName: String);
var
  Envir:TEnvirnoment;
  sMsg:String;
begin
  if (m_btPermission < 6) then exit;
  if (sMapName = '') then begin
    SysMsg('命令格式: @' + sCmd + ' 地图号',c_Red,t_Hint);
    exit;
  end;
  Envir:=g_MapManager.FindMap(sMapName);
  if (Envir = nil) then begin
    SysMsg(sMapName + ' 不存在！！！',c_Red,t_Hint);
    exit;
  end;
  sMsg:='地图模式: ' + Envir.GetEnvirInfo;
  SysMsg(sMsg,c_Blue,t_Hint);  
end;

procedure TPlayObject.CmdSetMapMode(sCmd, sMapName, sMapMode, sParam1,
  sParam2: String);
var
  Envir:TEnvirnoment;
  sMsg:String;
begin
  if (m_btPermission < 6) then exit;
  if (sMapName = '') or (sMapMode = '') then begin
    SysMsg('命令格式: @' + sCmd + ' 地图号 模式',c_Red,t_Hint);
    exit;
  end;
  Envir:=g_MapManager.FindMap(sMapName);
  if (Envir = nil) then begin
    SysMsg(sMapName + ' 不存在！！！',c_Red,t_Hint);
    exit;
  end;
  if CompareText(sMapMode,'SAFE') = 0 then begin
    if (sParam1 <> '')then begin
      Envir.Flag.boSAFE:=True;
    end else begin
      Envir.Flag.boSAFE:=False;
    end;
  end else
  if CompareText(sMapMode,'DARK') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boDarkness:=True;
    end else begin
      Envir.Flag.boDarkness:=False;
    end;
  end else
  if CompareText(sMapMode,'FIGHT') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boFightZone:=True;
    end else begin
      Envir.Flag.boFightZone:=False;
    end;
  end else
  if CompareText(sMapMode,'FIGHT3') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boFight3Zone:=True;
    end else begin
      Envir.Flag.boFight3Zone:=False;
    end;
  end else
  if CompareText(sMapMode,'DAY') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boDayLight:=True;
    end else begin
      Envir.Flag.boDayLight:=False;
    end;
  end else
  if CompareText(sMapMode,'QUIZ') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boQUIZ:=True;
    end else begin
      Envir.Flag.boQUIZ:=False;
    end;
  end else
  if CompareText(sMapMode,'NORECONNECT') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boNORECONNECT:=True;
      Envir.Flag.sNoReconnectMap:=sParam1;
    end else begin
      Envir.Flag.boNORECONNECT:=False;
    end;
  end else
  if CompareText(sMapMode,'MUSIC') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boMUSIC:=True;
      Envir.Flag.nMUSICID:=Str_ToInt(sParam1,-1);
    end else begin
      Envir.Flag.boMUSIC:=False;
    end;
  end else
  if CompareText(sMapMode,'EXPRATE') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boEXPRATE:=True;
      Envir.Flag.nEXPRATE:=Str_ToInt(sParam1,-1);
    end else begin
      Envir.Flag.boEXPRATE:=False;
    end;
  end else
  if CompareText(sMapMode,'PKWINLEVEL') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boPKWINLEVEL:=True;
      Envir.Flag.nPKWINLEVEL:=Str_ToInt(sParam1,-1);
    end else begin
      Envir.Flag.boPKWINLEVEL:=False;
    end;
  end else
  if CompareText(sMapMode,'PKWINEXP') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boPKWINEXP:=True;
      Envir.Flag.nPKWINEXP:=Str_ToInt(sParam1,-1);
    end else begin
      Envir.Flag.boPKWINEXP:=False;
    end;
  end else
  if CompareText(sMapMode,'PKLOSTLEVEL') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boPKLOSTLEVEL:=True;
      Envir.Flag.nPKLOSTLEVEL:=Str_ToInt(sParam1,-1);
    end else begin
      Envir.Flag.boPKLOSTLEVEL:=False;
    end;
  end else
  if CompareText(sMapMode,'PKLOSTEXP') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boPKLOSTEXP:=True;
      Envir.Flag.nPKLOSTEXP:=Str_ToInt(sParam1,-1);
    end else begin
      Envir.Flag.boPKLOSTEXP:=False;
    end;
  end else
  if CompareText(sMapMode,'DECHP') = 0 then begin
    if (sParam1 <> '') and (sParam2 <> '') then begin
      Envir.Flag.boDECHP:=True;
      Envir.Flag.nDECHPTIME:=Str_ToInt(sParam1,-1);
      Envir.Flag.nDECHPPOINT:=Str_ToInt(sParam2,-1);
    end else begin
      Envir.Flag.boDECHP:=False;
    end;
  end else
  if CompareText(sMapMode,'DECGAMEGOLD') = 0 then begin
    if (sParam1 <> '') and (sParam2 <> '') then begin
      Envir.Flag.boDECGAMEGOLD:=True;
      Envir.Flag.nDECGAMEGOLDTIME:=Str_ToInt(sParam1,-1);
      Envir.Flag.nDECGAMEGOLD:=Str_ToInt(sParam2,-1);
    end else begin
      Envir.Flag.boDECGAMEGOLD:=False;
    end;
  end else
  if CompareText(sMapMode,'INCGAMEGOLD') = 0 then begin
    if (sParam1 <> '') and (sParam2 <> '') then begin
      Envir.Flag.boINCGAMEGOLD:=True;
      Envir.Flag.nINCGAMEGOLDTIME:=Str_ToInt(sParam1,-1);
      Envir.Flag.nINCGAMEGOLD:=Str_ToInt(sParam2,-1);
    end else begin
      Envir.Flag.boINCGAMEGOLD:=False;
    end;
  end else
  if CompareText(sMapMode,'INCGAMEPOINT') = 0 then begin
    if (sParam1 <> '') and (sParam2 <> '') then begin
      Envir.Flag.boINCGAMEPOINT:=True;
      Envir.Flag.nINCGAMEPOINTTIME:=Str_ToInt(sParam1,-1);
      Envir.Flag.nINCGAMEPOINT:=Str_ToInt(sParam2,-1);
    end else begin
      Envir.Flag.boINCGAMEGOLD:=False;
    end;
  end else
  if CompareText(sMapMode,'RUNHUMAN') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boRUNHUMAN:=True;
    end else begin
      Envir.Flag.boRUNHUMAN:=False;
    end;
  end else
  if CompareText(sMapMode,'RUNMON') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boRUNMON:=True;
    end else begin
      Envir.Flag.boRUNMON:=False;
    end;
  end else
  if CompareText(sMapMode,'NEEDHOLE') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boNEEDHOLE:=True;
    end else begin
      Envir.Flag.boNEEDHOLE:=False;
    end;
  end else
  if CompareText(sMapMode,'NORECALL') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boNORECALL:=True;
    end else begin
      Envir.Flag.boNORECALL:=False;
    end;
  end else
  if CompareText(sMapMode,'NOGUILDRECALL') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boNOGUILDRECALL:=True;
    end else begin
      Envir.Flag.boNOGUILDRECALL:=False;
    end;
  end else
  if CompareText(sMapMode,'NODEARRECALL') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boNODEARRECALL:=True;
    end else begin
      Envir.Flag.boNODEARRECALL:=False;
    end;
  end else
  if CompareText(sMapMode,'NOMASTERRECALL') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boNOMASTERRECALL:=True;
    end else begin
      Envir.Flag.boNOMASTERRECALL:=False;
    end;
  end else
  if CompareText(sMapMode,'NORANDOMMOVE') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boNORANDOMMOVE:=True;
    end else begin
      Envir.Flag.boNORANDOMMOVE:=False;
    end;
  end else
  if CompareText(sMapMode,'NODRUG') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boNODRUG:=True;
    end else begin
      Envir.Flag.boNODRUG:=False;
    end;
  end else
  if CompareText(sMapMode,'MINE') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boMINE:=True;
    end else begin
      Envir.Flag.boMINE:=False;
    end;
  end else
  if CompareText(sMapMode,'MINE2') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boMINE2:=True;
    end else begin
      Envir.Flag.boMINE2:=False;
    end;
  end else
  if CompareText(sMapMode,'NOTHROWITEM') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boNOTHROWITEM:=True;
    end else begin
      Envir.Flag.boNOTHROWITEM:=False;
    end;
  end else
  if CompareText(sMapMode,'NODROPITEM') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boNODROPITEM:=True;
    end else begin
      Envir.Flag.boNODROPITEM:=False;
    end;
  end else
  if CompareText(sMapMode,'NOPOSITIONMOVE') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boNOPOSITIONMOVE:=True;
    end else begin
      Envir.Flag.boNOPOSITIONMOVE:=False;
    end;
  end else
  if CompareText(sMapMode,'NOHORSE') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boNOHORSE:=True;
    end else begin
      Envir.Flag.boNOHORSE:=False;
    end;
  end else
  if CompareText(sMapMode,'NOCHAT') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boNOCHAT:=True;
    end else begin
      Envir.Flag.boNOCHAT:=False;
    end;
  end;
  sMsg:='Environment: ' + Envir.GetEnvirInfo;
  SysMsg(sMsg,c_Blue,t_Hint);
end;

procedure TPlayObject.CmdDeleteItem(Cmd:pTGameCmd;sHumanName,sItemName:String;nCount:Integer);//004CDFF8
var
  I: Integer;
  PlayObject:TPlayObject;
  nItemCount:Integer;
  StdItem:TItem;
  UserItem:pTUserItem;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sHumanName = '') or (sItemName = '') then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' 人物名称 物品名称 数量)',c_Red,t_Hint);
    exit;
  end;
  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject = nil then begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumanName]),c_Red,t_Hint);
    exit;
  end;
  nItemCount:=0;
  for I := PlayObject.m_ItemList.Count - 1 to 0 do begin
    UserItem:=PlayObject.m_ItemList.Items[I];
    StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
    if (StdItem <> nil) and (CompareText(sItemName,StdItem.Name) = 0) then begin
      PlayObject.SendDelItems(UserItem);
      Dispose(UserItem);
      PlayObject.m_ItemList.Delete(I);
      Inc(nItemCount);
      if nItemCount >= nCount then
        break;
    end;
  end;
end;

procedure TPlayObject.CmdDelGold(Cmd:pTGameCmd;sHumName: String; nCount: Integer);//004CD27C
var
  PlayObject:TPlayObject;
  nServerIndex:integer;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sHumName = '') or (nCount <= 0) then exit;
  PlayObject:=UserEngine.GeTPlayObject(sHumName);
  if PlayObject <> nil then begin
    if PlayObject.m_nGold > nCount then begin
      Dec(PlayObject.m_nGold,nCount);
    end else begin
      nCount:=PlayObject.m_nGold;
      PlayObject.m_nGold:=0;
    end;
    PlayObject.GoldChanged();
    SysMsg(sHumName + '的金币已减少' + IntToStr(nCount)+ '.',c_Green,t_Hint);
            //004CD409
          if g_boGameLogGold then
            AddGameDataLog ('13' + #9 +
                        m_sMapName + #9 +
                        IntToStr(m_nCurrX) + #9 +
                        IntToStr(m_nCurrY) + #9 +
                        m_sCharName + #9 +
                        sSTRING_GOLDNAME + #9 +
                        IntToStr(nCount) + #9 +
                        '1' + #9 +
                        sHumName);
  end else begin
    if UserEngine.FindOtherServerUser(sHumName,nServerIndex) then begin
      SysMsg(sHumName + '现在' + IntToStr(nServerIndex)+ '号服务器上',c_Green,t_Hint);
    end else begin
      FrontEngine.AddChangeGoldList(m_sCharName,sHumName,-nCount);
      SysMsg(sHumName + '现在不在线，等其上线时金币将自动减少',c_Green,t_Hint);
    end;
  end;
end;
procedure TPlayObject.CmdDelGuild(Cmd:pTGameCmd;sGuildName: String);//004CEDEC
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if nServerIndex <> 0 then begin
    SysMsg('只能在主服务器上才可以使用此命令删除行会！！！',c_Red,t_Hint);
    exit;
  end;
  if sGuildName = '' then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' 行会名称',c_Red,t_Hint);
    exit;
  end;
  if g_GuildManager.DelGuild(sGuildName) then begin
    UserEngine.SendServerGroupMsg(SS_206,nServerIndex,sGuildName);
  end else begin
    SysMsg('没找到' + sGuildName + '这个行会！！！',c_Red,t_Hint);
  end;
end;
procedure TPlayObject.CmdDelNpc(sCmd:String;nPermission:Integer;sParam1:String);
var
  BaseObject:TBaseObject;
  I:Integer;
ResourceString
  sDelOK = '删除NPC成功...';
begin
  if (m_btPermission < nPermission) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if ((sParam1 <> '') and (sParam1[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[sCmd,'']),c_Red,t_Hint);
    exit;
  end;
  BaseObject:=GetPoseCreate();
  if BaseObject <> nil then begin
    for I := 0 to UserEngine.m_MerchantList.Count - 1 do begin
      if TBaseObject(UserEngine.m_MerchantList.Items[I]) = BaseObject then begin
        BaseObject.m_boGhost:=True;
        BaseObject.m_dwGhostTick:=GetTickCount();
        BaseObject.SendRefMsg(RM_DISAPPEAR,0,0,0,0,'');
        SysMsg(sDelOK,c_Red,t_Hint);
        exit;
      end;
    end;
    for I := 0 to UserEngine.QuestNPCList.Count - 1 do begin
      if TBaseObject(UserEngine.QuestNPCList.Items[I]) = BaseObject then begin
        BaseObject.m_boGhost:=True;
        BaseObject.m_dwGhostTick:=GetTickCount();
        BaseObject.SendRefMsg(RM_DISAPPEAR,0,0,0,0,'');
        SysMsg(sDelOK,c_Red,t_Hint);
        exit;
      end;
    end;
  end;
  SysMsg(g_sGameCommandDelNpcMsg,c_Red,t_Hint);
end;


procedure TPlayObject.CmdDelSkill(Cmd:pTGameCmd; sHumanName, sSkillName: String);
var
  I: Integer;
  PlayObject:TPlayObject;
  boDelAll:Boolean;
  UserMagic:pTUserMagic;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sHumanName = '') or (sSkillName = '') then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' 人物名称 技能名称)',c_Red,t_Hint);
    exit;
  end;
  if CompareText(sSkillName,'All') = 0 then boDelAll:=True
  else boDelAll:=False;
    

  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject = nil then begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumanName]),c_Red,t_Hint);
    exit;
  end;
    
  for I := PlayObject.m_MagicList.Count - 1 downto 0 do begin
    UserMagic:=PlayObject.m_MagicList.Items[I];
    if boDelAll then begin
      PlayObject.SendDelMagic(UserMagic);
      Dispose(UserMagic);
      PlayObject.m_MagicList.Delete(I);
    end else begin
      if CompareText(UserMagic.MagicInfo.sMagicName,sSkillName) = 0 then begin
        PlayObject.SendDelMagic(UserMagic);
        Dispose(UserMagic);
        PlayObject.m_MagicList.Delete(I);
        PlayObject.SysMsg(format('技能%s已删除。',[sSkillName]),c_Green,t_Hint);
        SysMsg(format('%s的技能%s已删除。',[sHumanName,sSkillName]),c_Green,t_Hint);
        break;
      end;        
    end;      
  end;
end;

procedure TPlayObject.CmdDenyAccountLogon(Cmd:pTGameCmd; sAccount, sFixDeny: String);
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if sAccount = '' then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' 登录帐号 是否永久封(0,1)',c_Red,t_Hint);
    exit;
  end;
  g_DenyAccountList.Lock;
  try
    if (sFixDeny <> '') and (sFixDeny[1] = '1') then begin
      g_DenyAccountList.AddObject(sAccount,TObject(1));
      SaveDenyAccountList();
      SysMsg(sAccount + '已加入禁止登录帐号列表',c_Green,t_Hint);
    end else begin
      g_DenyAccountList.AddObject(sAccount,TObject(0));
      SysMsg(sAccount + '已加入临时禁止登录帐号列表',c_Green,t_Hint);
    end;
  finally
    g_DenyAccountList.UnLock;
  end;
end;

procedure TPlayObject.CmdDenyCharNameLogon(Cmd:pTGameCmd; sCharName, sFixDeny: String);
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if sCharName = '' then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' 人物名称 是否永久封(0,1)',c_Red,t_Hint);
    exit;
  end;
  g_DenyChrNameList.Lock;
  try
    if (sFixDeny <> '') and (sFixDeny[1] = '1') then begin
      g_DenyChrNameList.AddObject(sCharName,TObject(1));
      SaveDenyChrNameList();
      SysMsg(sCharName + '已加入禁止人物列表',c_Green,t_Hint);
    end else begin
      g_DenyChrNameList.AddObject(sCharName,TObject(0));
      SysMsg(sCharName + '已加入临时禁止人物列表',c_Green,t_Hint);
    end;      
  finally
    g_DenyChrNameList.UnLock;
  end;
end;

procedure TPlayObject.CmdDenyIPaddrLogon(Cmd:pTGameCmd; sIPaddr, sFixDeny: String);
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if sIPaddr = '' then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' IP地址 是否永久封(0,1)',c_Red,t_Hint);
    exit;
  end;
  g_DenyIPAddrList.Lock;
  try
    if (sFixDeny <> '') and (sFixDeny[1] = '1') then begin
      g_DenyIPAddrList.AddObject(sIPaddr,TObject(1));
      SaveDenyIPAddrList();
      SysMsg(sIPaddr + '已加入禁止登录IP列表',c_Green,t_Hint);
    end else begin
      g_DenyIPAddrList.AddObject(sIPaddr,TObject(0));
      SysMsg(sIPaddr + '已加入临时禁止登录IP列表',c_Green,t_Hint);
    end;
  finally
    g_DenyIPAddrList.UnLock;
  end;
end;


procedure TPlayObject.CmdDisableFilter(sCmd,sParam1:String);
begin
  if (m_btPermission < 6) then exit;
  if (sParam1 <> '') and (sParam1[1] = '?') then begin
    SysMsg('启用/禁止文字过滤功能。',c_Red,t_Hint);
    exit;
  end;
  boFilterWord:= not boFilterWord;
  if boFilterWord then begin
    SysMsg('已启用文字过滤。',c_Green,t_Hint);
  end else begin
    SysMsg('已禁止文字过滤。',c_Green,t_Hint);
  end;
end;


procedure TPlayObject.CmdDelDenyAccountLogon(Cmd:pTGameCmd; sAccount,
  sFixDeny: String);
var
  I: Integer;
  boDelete:Boolean;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if sAccount = '' then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' 登录帐号',c_Red,t_Hint);
    exit;
  end;
  boDelete:=False;
  g_DenyAccountList.Lock;
  try
    for I := 0 to g_DenyAccountList.Count - 1 do begin
      if CompareText(sAccount,g_DenyAccountList.Strings[I]) = 0 then begin
        if Integer(g_DenyAccountList.Objects[I]) <> 0 then
          SaveDenyAccountList;
        g_DenyAccountList.Delete(I);
        SysMsg(sAccount + '已从禁止登录帐号列表中删除。',c_Green,t_Hint);
        boDelete:=True;
        break;
      end;
    end;
  finally
    g_DenyAccountList.UnLock;
  end;
  if not boDelete then
    SysMsg(sAccount + '没有被禁止登录。',c_Green,t_Hint);
end;

procedure TPlayObject.CmdDelDenyCharNameLogon(Cmd:pTGameCmd; sCharName,
  sFixDeny: String);
var
  I: Integer;
  boDelete:Boolean;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if sCharName = '' then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' 人物名称',c_Red,t_Hint);
    exit;
  end;
  boDelete:=False;
  g_DenyChrNameList.Lock;
  try
    for I := 0 to g_DenyChrNameList.Count - 1 do begin
      if CompareText(sCharName,g_DenyChrNameList.Strings[I]) = 0 then begin
        if Integer(g_DenyChrNameList.Objects[I]) <> 0 then
          SaveDenyChrNameList;
        g_DenyChrNameList.Delete(I);
        SysMsg(sCharName + '已从禁止登录人物列表中删除。',c_Green,t_Hint);
        boDelete:=True;
        break;
      end;
    end;
  finally
    g_DenyChrNameList.UnLock;
  end;
  if not boDelete then
    SysMsg(sCharName + '没有被禁止登录。',c_Green,t_Hint);
end;

procedure TPlayObject.CmdDelDenyIPaddrLogon(Cmd:pTGameCmd; sIPaddr,
  sFixDeny: String);
var
  I: Integer;
  boDelete:Boolean;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if sIPaddr = '' then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' IP地址',c_Red,t_Hint);
    exit;
  end;
  boDelete:=False;
  g_DenyIPAddrList.Lock;
  try
    for I := 0 to g_DenyIPAddrList.Count - 1 do begin
      if CompareText(sIPaddr,g_DenyIPAddrList.Strings[I]) = 0 then begin
        if Integer(g_DenyIPAddrList.Objects[I]) <> 0 then
          SaveDenyIPAddrList;
        g_DenyIPAddrList.Delete(I);
        SysMsg(sIPaddr + '已从禁止登录IP列表中删除。',c_Green,t_Hint);
        boDelete:=True;
        break;
      end;
    end;
  finally
    g_DenyIPAddrList.UnLock;
  end;
  if not boDelete then
    SysMsg(sIPaddr + '没有被禁止登录。',c_Green,t_Hint);
end;

procedure TPlayObject.CmdShowDenyAccountLogon(Cmd:pTGameCmd; sAccount,
  sFixDeny: String);
var
  I: Integer;
begin
  if (m_btPermission < 6) then exit;
  g_DenyAccountList.Lock;
  try
    if g_DenyAccountList.Count <= 0 then begin
      SysMsg('禁止登录帐号列表为空。',c_Green,t_Hint);
      exit;
    end;
    for I := 0 to g_DenyAccountList.Count - 1 do begin
      SysMsg(g_DenyAccountList.Strings[I],c_Green,t_Hint);
    end;
  finally
    g_DenyAccountList.UnLock;
  end;
end;

procedure TPlayObject.CmdShowDenyCharNameLogon(Cmd:pTGameCmd; sCharName,
  sFixDeny: String);
var
  I: Integer;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  g_DenyChrNameList.Lock;
  try
    if g_DenyChrNameList.Count <= 0 then begin
      SysMsg('禁止登录角色列表为空。',c_Green,t_Hint);
      exit;
    end;
    for I := 0 to g_DenyChrNameList.Count - 1 do begin
      SysMsg(g_DenyChrNameList.Strings[I],c_Green,t_Hint);
    end;
  finally
    g_DenyChrNameList.UnLock;
  end;
end;

procedure TPlayObject.CmdShowDenyIPaddrLogon(Cmd:pTGameCmd; sIPaddr,
  sFixDeny: String);
var
  I: Integer;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  g_DenyIPAddrList.Lock;
  try
    if g_DenyIPAddrList.Count <= 0 then begin
      SysMsg('禁止登录角色列表为空。',c_Green,t_Hint);
      exit;
    end;
    for I := 0 to g_DenyIPAddrList.Count - 1 do begin
      SysMsg(g_DenyIPAddrList.Strings[I],c_Green,t_Hint);
    end;
  finally
    g_DenyIPAddrList.UnLock;
  end;
end;


procedure TPlayObject.CmdDisableSendMsg(Cmd:pTGameCmd; sHumanName: String);
var
  PlayObject:TPlayObject;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if sHumanName = '' then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' 人物名称',c_Red,t_Hint);
    exit;
  end;
  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject <> nil then begin
    PlayObject.m_boFilterSendMsg:=True;
  end;
  g_DisableSendMsgList.Add(sHumanName);
  SaveDisableSendMsgList();
  SysMsg(sHumanName + ' 已加入禁言列表。',c_Green,t_Hint);
end;

procedure TPlayObject.CmdDisableSendMsgList(Cmd:pTGameCmd);
var
  I: Integer;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if g_DisableSendMsgList.Count <= 0 then begin
    SysMsg('禁言列表为空！！！',c_Red,t_Hint);
    exit;
  end;

  SysMsg('禁言列表:',c_Blue,t_Hint);
  for I := 0 to g_DisableSendMsgList.Count - 1 do begin
    SysMsg(g_DisableSendMsgList.Strings[I],c_Green,t_Hint);
  end;
end;

procedure TPlayObject.CmdEnableSendMsg(Cmd:pTGameCmd; sHumanName: String);
var
  I: Integer;
  PlayObject:TPlayObject;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if sHumanName = '' then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' 人物名称',c_Red,t_Hint);
    exit;
  end;
  for I := 0 to g_DisableSendMsgList.Count - 1 do begin
    if CompareText(sHumanName,g_DisableSendMsgList.Strings[I]) = 0 then begin
      PlayObject:=UserEngine.GeTPlayObject(sHumanName);
      if PlayObject <> nil then begin
        PlayObject.m_boFilterSendMsg:=False;
      end;
      g_DisableSendMsgList.Delete(I);
      SaveDisableSendMsgList();
      SysMsg(sHumanName + ' 已从禁言列表中删除。',c_Green,t_Hint);
      exit;
    end;
  end;
  SysMsg(sHumanName + ' 没有被禁言！！！',c_Red,t_Hint);
end;

procedure TPlayObject.CmdEndGuild;//4D1A44
begin
  if (m_MyGuild <> nil) then begin
    if (m_nGuildRankNo > 1) then begin
      if TGuild(m_MyGuild).IsMember(m_sCharName) and TGuild(m_MyGuild).DelMember(m_sCharName) then begin
        UserEngine.SendServerGroupMsg(SS_207,nServerIndex,TGuild(m_MyGuild).sGuildName);
        m_MyGuild:=nil;
        RefRankInfo(0,'');
        RefShowName();//10/31
        SysMsg('你已经退出行会。',c_Green,t_Hint);
      end;
    end else begin
      SysMsg('行会掌门人不能这样退出行会！！！',c_Red,t_Hint);
    end;
  end else begin
    SysMsg('你都没加入行会！！！',c_Red,t_Hint);
  end;
end;
procedure TPlayObject.CmdFireBurn(nInt, nTime, nN: Integer);
var
  FireBurnEvent:TFireBurnEvent;
begin
  if (m_btPermission < 6) then exit;
  if (nInt = 0) or (nTime = 0) or (nN = 0) then begin
    SysMsg('命令格式: @' + g_GameCommand.FIREBURN.sCmd + ' nInt nTime nN',c_Red,t_Hint);
    exit;
  end;
  FireBurnEvent:=TFireBurnEvent.Create(Self,m_nCurrX,m_nCurrY,nInt,nTime,nN);
  g_EventManager.AddEvent(FireBurnEvent);
end;
procedure TPlayObject.CmdForcedWallconquestWar(Cmd:pTGameCmd;sCastleName:String);
var
  Castle:TUserCastle;
  s20:String;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;

  if sCastleName = '' then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' 城堡名称',c_Red,t_Hint);
    exit;
  end;

  Castle:=g_CastleManager.Find(sCastleName);
  if Castle <> nil then begin
    Castle.m_boUnderWar:= not Castle.m_boUnderWar;
    if Castle.m_boUnderWar then begin
      Castle.m_dwStartCastleWarTick:=GetTickCount();
      Castle.StartWallconquestWar();

      UserEngine.SendServerGroupMsg(SS_212,nServerIndex,'');
      s20:='[' + Castle.m_sName + '攻城战已经开始]';
      UserEngine.SendBroadCastMsg(s20,t_System);
      UserEngine.SendServerGroupMsg(SS_204,nServerIndex,s20);
      Castle.MainDoorControl(True);
    end else begin
      Castle.StopWallconquestWar();
    end;
  end else begin
    SysMsg(format(g_sGameCommandSbkGoldCastleNotFoundMsg,[sCastleName]),c_Red,t_Hint);
  end;
end;
procedure TPlayObject.CmdFreePenalty(Cmd:pTGameCmd;sHumanName:String);//004CC528
var
  PlayObject:TPlayObject;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if ((sHumanName <> '') and (sHumanName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,g_sGameCommandFreePKHelpMsg]),c_Red,t_Hint);
    exit;
  end;
  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject = nil then begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumanName]),c_Red,t_Hint);
    exit;
  end;
  PlayObject.m_nPkPoint:=0;
  PlayObject.RefNameColor();
  PlayObject.SysMsg(g_sGameCommandFreePKHumanMsg,c_Green,t_Hint);
  SysMsg(format(g_sGameCommandFreePKMsg,[sHumanName]),c_Green,t_Hint);
end;
procedure TPlayObject.CmdGroupRecall(sCMD: String);
var
  I: Integer;
  dwValue:LongWord;
  PlayObject:TPlayObject;
begin
  if m_boRecallSuite or (m_btPermission >= 6) then begin
    if not m_PEnvir.Flag.boNORECALL then begin
      dwValue:=(GetTickCount - m_dwGroupRcallTick) div 1000;
      m_dwGroupRcallTick:=m_dwGroupRcallTick + dwValue * 1000;
      if m_btPermission >= 6 then m_wGroupRcallTime:=0;

      if m_wGroupRcallTime > dwValue then begin
        Dec(m_wGroupRcallTime,dwValue);
      end else m_wGroupRcallTime:=0;
      if m_wGroupRcallTime = 0 then begin
        if m_GroupOwner = Self then begin
          for I := 1 to m_GroupMembers.Count - 1 do begin
            PlayObject:=TPlayObject(m_GroupMembers.Objects[I]);
            if PlayObject.m_boAllowGroupReCall then begin
              if PlayObject.m_PEnvir.Flag.boNORECALL then begin
                SysMsg(format('%s map does not allow recall.',[PlayObject.m_sCharName]),c_Red,t_Hint);
              end else begin
                RecallHuman(PlayObject.m_sCharName);
              end;
            end else begin
              SysMsg(format('%s is now rejecting GroupRecall.',[PlayObject.m_sCharName]),c_Red,t_Hint);
            end;
          end;
          m_dwGroupRcallTick:=GetTickCount();
          m_wGroupRcallTime:=g_Config.nGroupRecallTime;
        end;
      end else begin
        SysMsg(format('%d seconds, You can use it again.',[m_wGroupRcallTime]),c_Red,t_Hint);
      end;
    end else begin
      SysMsg('此地图禁止使用此命令！！！',c_Red,t_Hint);
    end;
  end else begin
    SysMsg('您现在还无法使用此功能！！！',c_Red,t_Hint);
  end;
end;
procedure TPlayObject.CmdGuildRecall(sCmd,sParam: String);
var
  I,II: Integer;
  dwValue:LongWord;
  PlayObject:TPlayObject;
  GuildRank:pTGuildRank;
  nRecallCount,nNoRecallCount:Integer;
  Castle:TUserCastle;
begin
  if (sParam <> '') and (sParam[1] = '?') then begin
    SysMsg('命令功能: 行会传送，行会掌门人可以将整个行会成员全部集中。',c_Red,t_Hint);
    exit;
  end;

  if not m_boGuildMove and (m_btPermission < 6) then begin
    SysMsg('您现在还无法使用此功能！！！',c_Red,t_Hint);
    exit;
  end;
  if not IsGuildMaster then begin
    SysMsg('行会掌门人才可以使用此功能！！！',c_Red,t_Hint);
    exit;
  end;
  if m_PEnvir.Flag.boNOGUILDRECALL then begin
    SysMsg('本地图不允许使用此功能！！！',c_Red,t_Hint);
    exit;
  end;
  Castle:=g_CastleManager.InCastleWarArea(Self);

  //if UserCastle.m_boUnderWar and UserCastle.InCastleWarArea(m_PEnvir,m_nCurrX,m_nCurrY) then begin
  if (Castle <> nil) and Castle.m_boUnderWar then begin
    SysMsg('攻城区域不允许使用此功能！！！',c_Red,t_Hint);
    exit;
  end;
  nRecallCount:=0;
  nNoRecallCount:=0;
  dwValue:=(GetTickCount - m_dwGroupRcallTick) div 1000;
  m_dwGroupRcallTick:=m_dwGroupRcallTick + dwValue * 1000;
  if m_btPermission >= 6 then m_wGroupRcallTime:=0;  
  if m_wGroupRcallTime > dwValue then begin
    Dec(m_wGroupRcallTime,dwValue);
  end else m_wGroupRcallTime:=0;

  if m_wGroupRcallTime > 0 then begin
    SysMsg(format('%d 秒之后才可以再使用此功能！！！',[m_wGroupRcallTime]),c_Red,t_Hint);
    exit;
  end;

  for I := 0 to TGuild(m_MyGuild).m_RankList.Count - 1 do begin
    GuildRank:=TGuild(m_MyGuild).m_RankList.Items[I];
    for II:=0 to GuildRank.MemberList.Count -1 do begin
      PlayObject:=TPlayObject(GuildRank.MemberList.Objects[II]);
      if PlayObject <> nil then begin
        if PlayObject = Self then begin
//          Inc(nNoRecallCount);
          Continue;
        end;
        if PlayObject.m_boAllowGuildReCall then begin
          if PlayObject.m_PEnvir.Flag.boNORECALL then begin
            SysMsg(format('%s 所在的地图不允许传送。',[PlayObject.m_sCharName]),c_Red,t_Hint);
          end else begin
            RecallHuman(PlayObject.m_sCharName);
            Inc(nRecallCount);
          end;
        end else begin
          Inc(nNoRecallCount);
          SysMsg(format('%s 不允许行会合一！！！',[PlayObject.m_sCharName]),c_Red,t_Hint);
        end;
      end;
    end;
  end;
//  SysMsg('已传送' + IntToStr(nRecallCount) + '个成员，' + IntToStr(nNoRecallCount) + '个成员未被传送。',c_Green,t_Hint);
  SysMsg(format('已传送%d个成员，%d个成员未被传送。',[nRecallCount,nNoRecallCount]),c_Green,t_Hint);
  m_dwGroupRcallTick:=GetTickCount();
  m_wGroupRcallTime:=g_Config.nGuildRecallTime;
end;

procedure TPlayObject.CmdGuildWar(sCmd, sGuildName: String);//004CE9F0
begin
  if (m_btPermission < 6) then exit;
end;
procedure TPlayObject.CmdHair(Cmd:pTGameCmd;sHumanName: String;nHair: Integer);
var
  PlayObject:TPlayObject;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sHumanName = '') or (nHair < 0) then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' 人物名称 类型值',c_Red,t_Hint);
    exit;
  end;

  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject <> nil then begin
    PlayObject.m_btHair:=nHair;
    PlayObject.FeatureChanged();
    SysMsg(sHumanName + ' 的头发已改变。',c_Green,t_Hint);
  end else begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumanName]),c_Red,t_Hint);
  end;
end;

procedure TPlayObject.CmdHumanInfo(Cmd:pTGameCmd;sHumanName: String);//004CFC98
var
  PlayObject:TPlayObject;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sHumanName = '') or ((sHumanName <> '') and (sHumanName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,g_sGameCommandInfoHelpMsg]),c_Red,t_Hint);
    exit;
  end;

  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject = nil then begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumanName]),c_Red,t_Hint);
    exit;
  end;
  SysMsg(PlayObject.GeTBaseObjectInfo(),c_Green,t_Hint);
end;

procedure TPlayObject.CmdHumanLocal(Cmd:pTGameCmd;sHumanName: String);
var
  PlayObject:TPlayObject;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sHumanName = '') or ((sHumanName <> '') and (sHumanName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,g_sGameCommandHumanLocalHelpMsg]),c_Red,t_Hint);
    exit;
  end;

  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject = nil then begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumanName]),c_Red,t_Hint);
    exit;
  end;
  SysMsg(format(g_sGameCommandHumanLocalMsg,[sHumanName,m_sIPLocal{GetIPLocal(PlayObject.m_sIPaddr)}]),c_Green,t_Hint);
end;

procedure TPlayObject.CmdHunger(sCmd, sHumanName: String;nHungerPoint:Integer);
var
  PlayObject:TPlayObject;
begin
  if (m_btPermission < 6) then exit;
  if (sHumanName = '') or (nHungerPoint < 0) then begin
    SysMsg('命令格式: @' + sCMD + ' 人物名称 能量值',c_Red,t_Hint);
    exit;
  end;

  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject <> nil then begin
    PlayObject.m_nHungerStatus:=nHungerPoint;
    PlayObject.SendMsg(PlayObject,RM_MYSTATUS,0,0,0,0,'');
    PlayObject.RefMyStatus();
    SysMsg(sHumanName + ' 的能量值已改变。',c_Green,t_Hint);
  end else begin
    SysMsg(sHumanName + '没有在线！！！',c_Red,t_Hint);
  end;
end;
procedure TPlayObject.CmdIncPkPoint(Cmd:pTGameCmd;sHumanName:String;nPoint:Integer);//004BF4D4
var
  PlayObject:TPlayObject;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if ((sHumanName <> '') and (sHumanName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,g_sGameCommandIncPkPointHelpMsg]),c_Red,t_Hint);
    exit;
  end;

  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject = nil then begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumanName]),c_Red,t_Hint);
    exit;
  end;
  Inc(PlayObject.m_nPkPoint,nPoint);
  PlayObject.RefNameColor();
  if nPoint > 0 then
    SysMsg(format(g_sGameCommandIncPkPointAddPointMsg,[sHumanName,nPoint]),c_Green,t_Hint)
  else
    SysMsg(format(g_sGameCommandIncPkPointDecPointMsg,[sHumanName,-nPoint]),c_Green,t_Hint);
end;
procedure TPlayObject.CmdKickHuman(Cmd:pTGameCmd;sHumName:String);
var
  PlayObject:TPlayObject;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sHumName = '') or ((sHumName <> '') and (sHumName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,g_sGameCommandKickHumanHelpMsg]),c_Red,t_Hint);
    exit;
  end;

  PlayObject:=UserEngine.GeTPlayObject(sHumName);
  if PlayObject <> nil then begin
    PlayObject.m_boKickFlag:=True;
    PlayObject.m_boEmergencyClose:=True;
  end else begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumName]),c_Red,t_Hint);
  end;
end;
procedure TPlayObject.CmdKill(Cmd:pTGameCmd;sHumanName: String);
var
  BaseObject:TBaseObject;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if sHumanName <> '' then begin
    BaseObject:=UserEngine.GeTPlayObject(sHumanName);
    if BaseObject = nil then begin
      SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumanName]),c_Red,t_Hint);
      exit;
    end;
  end else begin
    BaseObject:=GetPoseCreate();
    if BaseObject = nil then begin
      SysMsg('命令使用方法不正确，必须与角色面对面站好！！！',c_Red,t_Hint);
      exit;
    end;
  end;
  BaseObject.Die;
end;

procedure TPlayObject.CmdLockLogin(Cmd: pTGameCmd);
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if not g_Config.boLockHumanLogin then begin
    SysMsg('本服务器还没有启用登录锁功能！！！',c_Red,t_Hint);
    exit;
  end;
    
  if m_boLockLogon and not m_boLockLogoned then begin
    SysMsg('您还没有打开登录锁或还没有设置锁密码！！！',c_Red,t_Hint);
    exit;
  end;
    
  m_boLockLogon:= not m_boLockLogon;
  if m_boLockLogon then begin
    SysMsg('已开启登录锁',c_Green,t_Hint);
  end else begin
    SysMsg('已关闭登录锁',c_Green,t_Hint);
  end;
    
end;

procedure TPlayObject.CmdLotteryTicket(sCmd: String; nPerMission: Integer;
  sParam1: String);
begin
  if (m_btPermission < nPermission) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sParam1 = '') or ((sParam1 <> '') and (sParam1[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[sCmd,'']),c_Red,t_Hint);
    exit;
  end;
  SysMsg(format(g_sGameCommandLotteryTicketMsg,[g_Config.nWinLotteryCount,
                                                g_Config.nNoWinLotteryCount,
                                                g_Config.nWinLotteryLevel1,
                                                g_Config.nWinLotteryLevel2,
                                                g_Config.nWinLotteryLevel3,
                                                g_Config.nWinLotteryLevel4,
                                                g_Config.nWinLotteryLevel5,
                                                g_Config.nWinLotteryLevel6]),c_Green,t_Hint);
end;

procedure TPlayObject.CmdLuckPoint(sCmd: String; nPerMission: Integer;
  sHumanName, sCtr, sPoint: String);
var
  PlayObject:TPlayObject;
begin
  if (m_btPermission < nPermission) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sHumanName = '') or ((sHumanName <> '') and (sHumanName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[sCmd,g_sGameCommandLuckPointHelpMsg]),c_Red,t_Hint);
    exit;
  end;
  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject = nil then begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumanName]),c_Red,t_Hint);
    exit;
  end;

  if sCtr = '' then begin
    SysMsg(format(g_sGameCommandLuckPointMsg,[sHumanName,PlayObject.m_nBodyLuckLevel,PlayObject.m_dBodyLuck,PlayObject.m_nLuck]),c_Green,t_Hint);
    exit;
  end;
  
end;

procedure TPlayObject.CmdMakeItem(Cmd:pTGameCmd;sItemName: String; nCount: Integer);//004CCE34
var
  I: Integer;
  UserItem:pTUserItem;
  StdItem:TItem;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sItemName = '') then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,g_sGamecommandMakeHelpMsg]),c_Red,t_Hint);
    exit;
  end;
  if (nCount <= 0) then nCount:=1;
  if (nCount > 10) then nCount:=10;
  if (m_btPermission < Cmd.nPermissionMax) then begin
    if not CanMakeItem(sItemName) then begin
      SysMsg(g_sGamecommandMakeItemNameOrPerMissionNot,c_Red,t_Hint);
      exit;
    end;
    //if UserCastle.InCastleWarArea(m_PEnvir,m_nCurrX,m_nCurry) then begin
    if g_CastleManager.InCastleWarArea(Self) <> nil then begin
      SysMsg(g_sGamecommandMakeInCastleWarRange,c_Red,t_Hint);
      exit;
    end;
    if not InSafeZone then begin
      SysMsg(g_sGamecommandMakeInSafeZoneRange,c_Red,t_Hint);
      exit;
    end;
    nCount:=1;      
  end;

  for I := 0 to nCount - 1 do begin
    if m_ItemList.Count >= MAXBAGITEM then exit;
    New(UserItem);
    if UserEngine.CopyToUserItemFromName(sItemName,UserItem) then begin
      StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
      if (StdItem.Price >= 15000) and not g_Config.boTestServer and (m_btPermission < 5)then begin
        Dispose(UserItem);
      end else begin
        if Random(g_Config.nMakeRandomAddValue{10}) = 0 then
          StdItem.RandomUpgradeItem(UserItem);
      end;
      if StdItem.StdMode in [15,19,20,21,22,23,24,26] then begin
        if StdItem.Shape in [130,131,132] then begin
          StdItem.RandomUpgradeUnknownItem(UserItem);
        end;
      end;
      if m_btPermission >= Cmd.nPermissionMax then begin
        UserItem.MakeIndex:=GetItemNumberEx(); //制造的物品另行取得物品ID
        
      end;
      m_ItemList.Add(UserItem);
      SendAddItem(UserItem);
      if g_Config.boShowMakeItemMsg and (m_btPermission >= 6) then
        MainOutMessage('[制造物品] ' + m_sCharName + ' ' + sItemName + '(' + IntToStr(UserItem.MakeIndex) + ')');
            //004CD10D
      if StdItem.NeedIdentify = 1 then
            AddGameDataLog ('5' + #9 +
                        m_sMapName + #9 +
                        IntToStr(m_nCurrX) + #9 +
                        IntToStr(m_nCurrY) + #9 +
                        m_sCharName + #9 +
                        //UserEngine.GetStdItemName(UserItem.wIndex) + #9 +
                        StdItem.Name + #9 +
                        IntToStr(UserItem.MakeIndex) + #9 +
                        '1' + #9 +
                        '0');
    end else begin //004CD114
      Dispose(UserItem);
      SysMsg(format(g_sGamecommandMakeItemNameNotFound,[sItemName]),c_Red,t_Hint);
      break;
    end;
  end;
end;


procedure TPlayObject.CmdMapMove(Cmd:pTGameCmd;sMapName: String);
var
  Envir:TEnvirnoment;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sMapName = '') or ((sMapName <> '') and (sMapName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,g_sGameCommandMoveHelpMsg]),c_Red,t_Hint);
    exit;
  end;
  Envir:=g_MapManager.FindMap(sMapName);
  if (Envir = nil) then begin
    SysMsg(format(g_sTheMapNotFound,[sMapName]){ + ' 此地图号不存在！！！'},c_Red,t_Hint);
    exit;
  end;
  if (m_btPermission >= Cmd.nPermissionMax) or CanMoveMap(sMapName) then begin
    SendRefMsg(RM_SPACEMOVE_FIRE,0,0,0,0,'');
    MapRandomMove(sMapName,0);
  end else begin
    SysMsg(format(g_sTheMapDisableMove,[sMapName,Envir.sMapDesc]){'地图 ' + sParam1 + ' 不允许传送！！！'},c_Red,t_Hint);
  end;
end;
//004CDA38
procedure TPlayObject.CmdPositionMove(Cmd:pTGameCmd;sMapName, sX, sY: String);
var
  Envir:TEnvirnoment;
  nX,nY:Integer;
begin
try
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sMapName = '') or (sX = '') or (sY = '') or ((sMapName <> '') and (sMapName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,g_sGameCommandPositionMoveHelpMsg]),c_Red,t_Hint);
    exit;
  end;
  if (m_btPermission >= Cmd.nPermissionMax) or CanMoveMap(sMapName) then begin
    Envir:=g_MapManager.FindMap(sMapName);
    if Envir <> nil then begin
      nX:=Str_ToInt(sX,0);
      nY:=Str_ToInt(sY,0);
      if Envir.CanWalk(nX,nY,True) then begin
        SpaceMove(sMapName,nX,nY,0);
      end else begin
        SysMsg(format(g_sGameCommandPositionMoveCanotMoveToMap,[sMapName,sX,sY]),c_Green,t_Hint);
      end;
    end;
  end else begin
    SysMsg(format(g_sTheMapDisableMove,[sMapName,Envir.sMapDesc]),c_Red,t_Hint);
  end;
except
  on e: Exception do begin
    MainOutMessage('[Exceptioin] TPlayObject.CmdPositionMove');
    MainOutMessage(E.Message);
  end;

end;
end;
procedure TPlayObject.CmdMapMoveHuman(Cmd:pTGameCmd;sSrcMap,sDenMap:String);
var
  SrcEnvir,DenEnvir:TEnvirnoment;
  HumanList:TList;
  I:Integer;
  MoveHuman:TPlayObject;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sDenMap = '') or (sSrcMap = '') or ((sSrcMap <> '') and (sSrcMap[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,g_sGameCommandMapMoveHelpMsg]),c_Red,t_Hint);
    exit;
  end;

  SrcEnvir:=g_MapManager.FindMap(sSrcMap);
  DenEnvir:=g_MapManager.FindMap(sDenMap);
  if (SrcEnvir = nil) then begin
    SysMsg(format(g_sGameCommandMapMoveMapNotFound,[sSrcMap]),c_Red,t_Hint);
    exit;
  end;
  if (DenEnvir = nil) then begin
    SysMsg(format(g_sGameCommandMapMoveMapNotFound,[sDenMap]),c_Red,t_Hint);
    exit;
  end;

  HumanList:=TList.Create;
  UserEngine.GetMapRageHuman(SrcEnvir,SrcEnvir.Header.wWidth div 2,SrcEnvir.Header.wHeight div 2,1000,HumanList);
  for I := 0 to HumanList.Count - 1 do begin
    MoveHuman:=TPlayObject(HumanList.Items[I]);
    if MoveHuman <> Self then
      MoveHuman.MapRandomMove(sDenMap,0);
  end;
  HumanList.Free;
end;

procedure TPlayObject.CmdMemberFunction(sCmd, sParam: String);
begin
  if (sParam <> '') and (sParam[1] = '?') then begin
    SysMsg('打开会员功能窗口.',c_Red,t_Hint);
    exit;
  end;
  if g_ManageNPC <> nil then begin
    g_ManageNPC.GotoLable(Self,'@Member',False);
  end;
end;


procedure TPlayObject.CmdMemberFunctionEx(sCmd, sParam: String);
begin
  if (sParam <> '') and (sParam[1] = '?') then begin
    SysMsg('打开会员功能窗口.',c_Red,t_Hint);
    exit;
  end;
  if g_FunctionNPC <> nil then begin
    g_FunctionNPC.GotoLable(Self,'@Member',False);
  end;
end;

procedure TPlayObject.CmdMission(Cmd:pTGameCmd;sX, sY: String);//004CCA08
var
  nX,nY:Integer;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sX = '') or (sY = '') then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' X  Y',c_Red,t_Hint);
    exit;
  end;
  nX:=Str_ToInt(sX,0);
  nY:=Str_ToInt(sY,0);
  g_boMission:=True;
  g_sMissionMap:=m_sMapName;
  g_nMissionX:=nX;
  g_nMissionY:=nY;
  SysMsg('怪物集中目标已设定为: ' + m_sMapName + '(' + IntToStr(g_nMissionX) + ':' + IntToStr(g_nMissionY) + ')',c_Green,t_Hint);
end;
procedure TPlayObject.CmdMob(Cmd:pTGameCmd;sMonName:String;nCount,nLevel:Integer; nExpRatio:Integer = -1); //004CC7F4
var
  I: Integer;
  nX,nY:Integer;
  Monster:TBaseObject;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sMonName = '') or ((sMonName <> '') and (sMonName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,g_sGameCommandMobHelpMsg]),c_Red,t_Hint);
    exit;
  end;
  
  if nCount <= 0 then nCount:=1;
  if not (nLevel in [0..10]) then nLevel:=0;
    
  nCount:=_MIN(64,nCount);
  GetFrontPosition(nX,nY);
  for I := 0 to nCount - 1 do begin
    Monster:=UserEngine.RegenMonsterByName(m_PEnvir.sMapName,nX,nY,sMonName);
    if Monster <> nil then begin
      Monster.m_btSlaveMakeLevel:=nLevel;
      Monster.m_btSlaveExpLevel:=nLevel;
      Monster.RecalcAbilitys;
      Monster.RefNameColor;
      if nExpRatio <> -1 then begin
        nExpRatio := _MIN(100,nExpRatio);
        Monster.m_dwFightExp := Monster.m_dwFightExp * nExpRatio;
      end;
    end else begin
      SysMsg(g_sGameCommandMobMsg,c_Red,t_Hint);
      break;
    end;      
  end;
end;

procedure TPlayObject.CmdMobCount(Cmd:pTGameCmd;sMapName: String);
var
  Envir: TEnvirnoment;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sMapName = '') or ((sMapName <> '') and (sMapName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,g_sGameCommandMobCountHelpMsg]),c_Red,t_Hint);
    exit;
  end;
  Envir:=g_MapManager.FindMap(sMapName);
  if Envir = nil then begin
    SysMsg(g_sGameCommandMobCountMapNotFound,c_Red,t_Hint);
    exit;
  end;
  SysMsg(format(g_sGameCommandMobCountMonsterCount,[UserEngine.GetMapMonster(Envir,nil)]),c_Green,t_Hint);
end;


procedure TPlayObject.CmdHumanCount(Cmd:pTGameCmd;sMapName: String);
var
  Envir: TEnvirnoment;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sMapName = '') or ((sMapName <> '') and (sMapName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,g_sGameCommandHumanCountHelpMsg]),c_Red,t_Hint);
    exit;
  end;
  Envir:=g_MapManager.FindMap(sMapName);
  if Envir = nil then begin
    SysMsg(g_sGameCommandMobCountMapNotFound,c_Red,t_Hint);
    exit;
  end;
  SysMsg(format(g_sGameCommandMobCountMonsterCount,[UserEngine.GetMapHuman(sMapName)]),c_Green,t_Hint);
  SysMsg(IntToStr(Envir.HumCount),c_Green,t_Hint);
end;

procedure TPlayObject.CmdMobFireBurn(Cmd: pTGameCmd; sMap, sX, sY, sType,
  sTime, sPoint: String);
var
  nX,nY,nType,nTime,nPoint:Integer;
  FireBurnEvent:TFireBurnEvent;
  Envir:TEnvirnoment;
  OldEnvir:TEnvirnoment;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sMap = '') or ((sMap <> '') and (sMap[1] = '?')) then begin
    SysMsg(format(g_sGameCommandMobFireBurnHelpMsg,[Cmd.sCmd,sMap, sX, sY, sType,sTime, sPoint]),c_Red,t_Hint);
    exit;
  end;

  nX:=Str_ToInt(sX,-1);
  nY:=Str_ToInt(sY,-1);
  nType:=Str_ToInt(sType,-1);
  nTime:=Str_ToInt(sTime,-1);
  nPoint:=Str_ToInt(sPoint,-1);
  if nPoint < 0 then nPoint:=1;
    
  if (sMap = '') or (nX < 0) or (nY < 0) or (nType < 0) or (nTime < 0) or (nPoint < 0) then begin
    SysMsg(format(g_sGameCommandMobFireBurnHelpMsg,[Cmd.sCmd,sMap, sX, sY, sType,sTime, sPoint]),c_Red,t_Hint);
    exit;
  end;
  Envir:=g_MapManager.FindMap(sMap);
  if Envir <> nil then begin
    OldEnvir:=m_PEnvir;
    m_PEnvir:=Envir;
    FireBurnEvent:=TFireBurnEvent.Create(Self,nX,nY,nType,nTime * 1000,nPoint);
    g_EventManager.AddEvent(FireBurnEvent);
    m_PEnvir:=OldEnvir;
    exit;
  end;
  SysMsg(format(g_sGameCommandMobFireBurnMapNotFountMsg,[Cmd.sCmd,sMap]),c_Red,t_Hint);
end;

procedure TPlayObject.CmdMobLevel(Cmd:pTGameCmd;Param:String); //004CFD5C
var
  I: Integer;
  BaseObjectList:TList;
  BaseObject:TBaseObject;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if ((Param <> '') and (Param[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,'']),c_Red,t_Hint);
    exit;
  end;

  BaseObjectList:=TList.Create;
  m_PEnvir.GetRangeBaseObject(m_nCurrX,m_nCurrY,2,True,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    BaseObject:=TBaseObject(BaseObjectList.Items[i]);
    SysMsg(BaseObject.GeTBaseObjectInfo(),c_Green,t_Hint);
  end;
  BaseObjectList.Free;
end;
procedure TPlayObject.CmdMobNpc(sCmd:String;nPermission:Integer;sParam1,sParam2,sParam3,sParam4:String);
var
  nAppr:Integer;
  boIsCastle:Boolean;
  Merchant:TMerchant;
  nX,nY:Integer;
begin
  if (m_btPermission < nPermission) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sParam1 = '') or (sParam2 = '') or ((sParam1 <> '') and (sParam1[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[sCmd,g_sGameCommandMobNpcHelpMsg]),c_Red,t_Hint);
    exit;
  end;

  nAppr:=Str_ToInt(sParam3,0);
  boIsCastle:=(Str_ToInt(sParam4,0) = 1);
  if sParam1 = '' then begin
    SysMsg('命令格式: @' + sCmd + ' NPC名称 脚本文件名 外形(数字) 属沙城(0,1)',c_Red,t_Hint);
    exit;
  end;
  Merchant:=TMerchant.Create;
  Merchant.m_sCharName:=sParam1;
  Merchant.m_sMapName:=m_sMapName;
  Merchant.m_PEnvir:=m_PEnvir;
  Merchant.m_wAppr:=nAppr;
  Merchant.m_nFlag:=0;
  Merchant.m_boCastle:=boIsCastle;
  Merchant.m_sScript:=sParam2;
  GetFrontPosition(nX,nY);
  Merchant.m_nCurrX:=nX;
  Merchant.m_nCurrY:=nY;
  Merchant.Initialize();
  UserEngine.AddMerchant(Merchant);
end;
procedure TPlayObject.CmdMobPlace(Cmd:pTGameCmd;sX, sY, sMonName, sCount: String); //004CCBB4
var
  I: Integer;
  nCount,nX,nY:Integer;
  MEnvir:TEnvirnoment;
  Mon:TBaseObject;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  nCount:=_MIN(500,Str_ToInt(sCount,0));
  nX:=Str_ToInt(sX,0);
  nY:=Str_ToInt(sY,0);
  MEnvir:=g_MapManager.FindMap(g_sMissionMap);
  if (nX <= 0) or (nY <= 0) or (sMonName = '') or (nCount <= 0) then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' X  Y 怪物名称 怪物数量',c_Red,t_Hint);
    exit;
  end;
  if not g_boMission or (MEnvir = nil) then begin
    SysMsg('还没有设定怪物集中点！！！',c_Red,t_Hint);
    SysMsg('请先用命令' + g_GameCommand.MISSION.sCmd + '设置怪物的集中点。',c_Red,t_Hint);
    exit;
  end;

  for I := 0 to nCount - 1 do begin
    Mon:=UserEngine.RegenMonsterByName(g_sMissionMap,nX,nY,sMonName);
    if Mon <> nil then begin
      Mon.m_boMission:=True;
      Mon.m_nMissionX:=g_nMissionX;
      Mon.m_nMissionY:=g_nMissionY;
    end else break;
  end;
  SysMsg(IntToStr(nCount) + ' 只 ' + sMonName + ' 已正在往地图 ' + g_sMissionMap + ' ' + IntToStr(g_nMissionX) + ':' + IntToStr(g_nMissionY) + ' 集中。',c_Green,t_Hint);
end;

procedure TPlayObject.CmdNpcScript(sCmd:String;nPermission:Integer;sParam1,sParam2,sParam3:String);
var
  BaseObject:TBaseObject;
  nNPCType:Integer;
  I:Integer;
  sScriptFileName:String;
  Merchant:TMerchant;
  NormNpc:TNormNpc;
  LoadList:TStringList;
  sScriptLine:String;
begin
  if (m_btPermission < nPermission) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sParam1 = '') or ((sParam1 <> '') and (sParam1[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[sCmd,g_sGameCommandNpcScriptHelpMsg]),c_Red,t_Hint);
    exit;
  end;
  
  nNPCType:= -1;
  BaseObject:=GetPoseCreate();
  if BaseObject <> nil then begin
    for I := 0 to UserEngine.m_MerchantList.Count - 1 do begin
      if TBaseObject(UserEngine.m_MerchantList.Items[I]) = BaseObject then begin
        nNPCType:=0;
        break;
      end;
    end;
    for I := 0 to UserEngine.QuestNPCList.Count - 1 do begin
      if TBaseObject(UserEngine.QuestNPCList.Items[I]) = BaseObject then begin
        nNPCType:=1;
        break;
      end;
    end;
  end;
  if nNPCType < 0 then begin
    SysMsg('命令使用方法不正确，必须与NPC面对面，才能使用此命令！！！',c_Red,t_Hint);
    exit;
  end;

  if sParam1 = '' then begin
    if nNPCType = 0 then begin
      Merchant:=TMerchant(BaseObject);
      sScriptFileName:=g_Config.sEnvirDir + sMarket_Def + Merchant.m_sScript + '-' + Merchant.m_sMapName  + '.txt';
    end;
    if nNPCType = 1 then begin
      NormNpc:=TNormNpc(BaseObject);
      sScriptFileName:=g_Config.sEnvirDir + sNpc_def + NormNpc.m_sCharName + '-' + NormNpc.m_sMapName  + '.txt';
    end;
    if FileExists(sScriptFileName) then begin
      LoadList:=TStringList.Create;
      try
      LoadList.LoadFromFile(sScriptFileName);
      except
        SysMsg('读取脚本文件错误: ' + sScriptFileName,c_Red,t_Hint);
      end;
      for I := 0 to LoadList.Count - 1 do begin
        sScriptLine:=Trim(LoadList.Strings[I]);
        sScriptLine:=ReplaceChar(sScriptLine,' ',',');
        SysMsg(IntToStr(I) + ',' + sScriptLine,c_Blue,t_Hint);
      end;
      LoadList.Free;
    end;
  end;
end;
procedure TPlayObject.CmdOPDeleteSkill(sHumanName, sSkillName: String);//004CE938
begin
  if (m_btPermission < 6) then exit;
end;
procedure TPlayObject.CmdOPTraining(sHumanName, sSkillName: String;
  nLevel: Integer);//004CC468
begin
  if (m_btPermission < 6) then exit;
end;
procedure TPlayObject.CmdPKpoint(Cmd:pTGameCmd;sHumanName:String);//004CC61C
var
  PlayObject:TPlayObject;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if ((sHumanName <> '') and (sHumanName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,g_sGameCommandPKPointHelpMsg]),c_Red,t_Hint);
    exit;
  end;

  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject = nil then begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumanName]),c_Red,t_Hint);
    exit;
  end;
  SysMsg(format(g_sGameCommandPKPointMsg,[sHumanName,PlayObject.m_nPkPoint]),c_Green,t_Hint);
end;

procedure TPlayObject.CmdPrvMsg(sCmd: String; nPermission: Integer;
  sHumanName: String);
var
  I: Integer;
begin
  if (m_btPermission < nPermission) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sHumanName = '') or ((sHumanName <> '') and (sHumanName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[sCmd,g_sGameCommandPrvMsgHelpMsg]),c_Red,t_Hint);
    exit;
  end;
  for I := 0 to m_BlockWhisperList.Count - 1 do begin
    if CompareText(m_BlockWhisperList.Strings[I],sHumanName) = 0 then begin
      m_BlockWhisperList.Delete(I);
      SysMsg(format(g_sGameCommandPrvMsgUnLimitMsg,[sHumanName]),c_Green,t_Hint);
      exit;
    end;
  end;
  m_BlockWhisperList.Add(sHumanName);
  SysMsg(format(g_sGameCommandPrvMsgLimitMsg,[sHumanName]),c_Green,t_Hint);

end;

procedure TPlayObject.CmdReAlive(Cmd:pTGameCmd;sHumanName: String);
var
  PlayObject:TPlayObject;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sHumanName = '') or ((sHumanName <> '') and (sHumanName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,g_sGameCommandReAliveHelpMsg]),c_Red,t_Hint);
    exit;
  end;

  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject = nil then begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumanName]),c_Red,t_Hint);
    exit;
  end;
  PlayObject.ReAlive;
  PlayObject.m_WAbil.HP:=PlayObject.m_WAbil.MaxHP;
  PlayObject.SendMsg(PlayObject,RM_ABILITY,0,0,0,0,'');

  SysMsg(format(g_sGameCommandReAliveMsg,[sHumanName]),c_Green,t_Hint);
  SysMsg(sHumanName + ' 已获重生。',c_Green,t_Hint);
end;
procedure TPlayObject.CmdRecallHuman(Cmd:pTGameCmd;sHumanName:String); //004CE250
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sHumanName = '') or ((sHumanName <> '') and (sHumanName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,g_sGameCommandRecallHelpMsg]),c_Red,t_Hint);
    exit;
  end;
  RecallHuman(sHumanName);
end;
procedure TPlayObject.CmdRecallMob(Cmd:pTGameCmd;sMonName:String;nCount,nLevel,nAutoChangeColor,nFixColor:Integer);//004CC8C4
var
  I: Integer;
  n10,n14:Integer;
  Mon:TBaseObject;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sMonName = '') or ((sMonName <> '') and (sMonName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,g_sGameCommandRecallMobHelpMsg]),c_Red,t_Hint);
    exit;
  end;
  
  if nLevel >=10 then nLevel:=0;
  if nCount <= 0 then nCount:=1;    
  for I := 0 to nCount - 1 do begin
    if m_SlaveList.Count >= 20 then break;
    GetFrontPosition(n10,n14);
    Mon:=UserEngine.RegenMonsterByName(m_PEnvir.sMapName,n10,n14,sMonName);
    if Mon <> nil then begin
      Mon.m_Master:=Self;
      Mon.m_dwMasterRoyaltyTick:=GetTickCount + 24 * 60 * 60 * 1000;
      Mon.m_btSlaveMakeLevel:=3;
      Mon.m_btSlaveExpLevel:=nLevel;
      if nAutoChangeColor = 1 then begin
        Mon.m_boAutoChangeColor:=True;
      end else
      if nFixColor > 0 then begin
        Mon.m_boFixColor:=True;
        Mon.m_nFixColorIdx:=nFixColor - 1;
      end;
        
      Mon.RecalcAbilitys();
      Mon.RefNameColor();
      m_SlaveList.Add(Mon);
    end;
  end;
end;
procedure TPlayObject.CmdReconnection(sCmd,sIPaddr, sPort: String);
//004CE380
begin
  if (m_btPermission < 6) then exit;
  if (sIPaddr <> '') and (sIPaddr[1] = '?') then begin
    SysMsg('此命令用于改变客户端连接网关的IP及端口。',c_Blue,t_Hint);
    exit;
  end;
    
  if (sIPaddr = '') or (sPort = '') then begin
    SysMsg('命令格式: @' + sCmd + ' IP地址 端口',c_Red,t_Hint);
    exit;
  end;
  if (sIPaddr <> '') and (sPort <> '') then begin
    SendMsg(Self,RM_RECONNECTION,0,0,0,0,sIPaddr + '/' + sPort);
  end;
end;
procedure TPlayObject.CmdRefineWeapon(Cmd:pTGameCmd;nDC, nMC, nSC, nHit: Integer);//004CD1C4
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (nDC + nMC + nSC) > 10 then exit;
  if m_UseItems[U_WEAPON].wIndex <= 0 then exit;
  m_UseItems[U_WEAPON].btValue[0]:=nDC;
  m_UseItems[U_WEAPON].btValue[1]:=nMC;
  m_UseItems[U_WEAPON].btValue[2]:=nSC;
  m_UseItems[U_WEAPON].btValue[5]:=nHit;
  SendUpdateItem(@m_UseItems[U_WEAPON]);
  RecalcAbilitys();
  SendMsg(Self,RM_ABILITY,0,0,0,0,'');
  SendMsg(Self,RM_SUBABILITY,0,0,0,0,'');
  MainOutMessage('[武器调整]' +  m_sCharName + ' DC:' + IntToStr(nDC) + ' MC' + IntToStr(nMC) + ' SC' + IntToStr(nSC) + ' HIT:' + IntToStr(nHit));
end;
procedure TPlayObject.CmdReGotoHuman(Cmd:pTGameCmd;sHumanName:String);
var
  PlayObject:TPlayObject;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sHumanName = '') or ((sHumanName <> '') and (sHumanName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,g_sGameCommandReGotoHelpMsg]),c_Red,t_Hint);
    exit;
  end;

  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject = nil then begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumanName]),c_Red,t_Hint);
    exit;
  end;
  SpaceMove(PlayObject.m_PEnvir.sMapName,PlayObject.m_nCurrX,PlayObject.m_nCurrY,0);

end;


procedure TPlayObject.CmdReloadAbuse(sCmd: String; nPerMission: Integer;
  sParam1: String);
begin
  if (m_btPermission < nPermission) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if ((sParam1 <> '') and (sParam1[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[sCmd,'']),c_Red,t_Hint);
    exit;
  end;
end;

procedure TPlayObject.CmdReLoadAdmin(sCmd: String);
begin
  if (m_btPermission < 6) then exit;
  FrmDB.LoadAdminList();
  UserEngine.SendServerGroupMsg(213,nServerIndex,'');
  SysMsg('管理员列表重新加载成功...',c_Green,t_Hint);
end;

procedure TPlayObject.CmdReloadGuild(sCmd: String; nPerMission: Integer;
  sParam1: String);
var
  Guild:TGuild;
begin
  if (m_btPermission < nPermission) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sParam1 = '') or ((sParam1 <> '') and (sParam1[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[sCmd,g_sGameCommandReloadGuildHelpMsg]),c_Red,t_Hint);
    exit;
  end;
  if nServerIndex <> 0 then begin
    SysMsg(g_sGameCommandReloadGuildOnMasterserver,c_Red,t_Hint);
    exit;
  end;

  Guild:=g_GuildManager.FindGuild(sParam1);
  if Guild = nil then begin
    SysMsg(format(g_sGameCommandReloadGuildNotFoundGuildMsg,[sParam1]),c_Red,t_Hint);
    exit;
  end;
  Guild.LoadGuild();
  SysMsg(format(g_sGameCommandReloadGuildSuccessMsg,[sParam1]),c_Red,t_Hint);
  UserEngine.SendServerGroupMsg(SS_207,nServerIndex,sParam1);
end;

procedure TPlayObject.CmdReloadGuildAll;//004CE530
begin
  if (m_btPermission < 6) then exit;
end;


procedure TPlayObject.CmdReloadLineNotice(sCmd: String;
  nPerMission: Integer; sParam1: String);
begin
  if (m_btPermission < nPermission) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if ((sParam1 <> '') and (sParam1[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[sCmd,'']),c_Red,t_Hint);
    exit;
  end;
  if LoadLineNotice(g_Config.sNoticeDir + 'LineNotice.txt') then begin
    SysMsg(g_sGameCommandReloadLineNoticeSuccessMsg,c_Green,t_Hint);
  end else begin
    SysMsg(g_sGameCommandReloadLineNoticeFailMsg,c_Red,t_Hint);
  end;
end;

procedure TPlayObject.CmdReloadManage(Cmd:pTGameCmd;sParam:String);
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if ((sParam <> '') and (sParam[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,'']),c_Red,t_Hint);
    exit;
  end;
  if sParam = '' then begin
    if g_ManageNPC <> nil then begin
      g_ManageNPC.ClearScript();
      g_ManageNPC.LoadNPCScript();
      SysMsg('重新加载登录脚本完成...',c_Green,t_Hint);
    end else begin
      SysMsg('重新加载登录脚本失败...',c_Green,t_Hint);
    end;
  end else begin
    if g_FunctionNPC <> nil then begin
      g_FunctionNPC.ClearScript();
      g_FunctionNPC.LoadNPCScript();
      SysMsg('重新加载功能脚本完成...',c_Green,t_Hint);
    end else begin
      SysMsg('重新加载功能脚本失败...',c_Green,t_Hint);
    end;
  end;
end;
procedure TPlayObject.CmdReloadRobot;
begin
  RobotManage.ReLoadRobot();
  SysMsg('重新加载机器人配置完成...',c_Green,t_Hint);
end;
procedure TPlayObject.CmdReloadRobotManage;
begin
  if (m_btPermission < 6) then exit;
  if g_RobotNPC <> nil then begin
    g_RobotNPC.ClearScript();
    g_RobotNPC.LoadNPCScript();
    SysMsg('重新加载机器人专用脚本完成...',c_Green,t_Hint);
  end else begin
    SysMsg('重新加载机器人专用脚本失败...',c_Green,t_Hint);
  end;
end;
procedure TPlayObject.CmdReloadMonItems;//
var
  I: Integer;
  Monster:pTMonInfo;
begin
  if (m_btPermission < 6) then exit;
try
    for I := 0 to UserEngine.MonsterList.Count - 1 do begin
      Monster:=UserEngine.MonsterList.Items[I];
      FrmDB.LoadMonitems(Monster.sName,Monster.ItemList);
    end;
  SysMsg('怪物爆物品列表重加载完成...',c_Green,t_Hint);
except
  SysMsg('怪物爆物品列表重加载失败！！！',c_Green,t_Hint);
end;
end;
procedure TPlayObject.CmdReloadNpc(sParam: String); //004CFFF8
var
  I: Integer;
  TmpList:TList;
  Merchant:TMerchant;
  Npc:TNormNpc;
begin
  if (m_btPermission < 6) then exit;
  if CompareText('all',sParam) = 0 then begin
    FrmDB.ReLoadMerchants();
    UserEngine.ReloadMerchantList();
    SysMsg('交易NPC重新加载完成！！！',c_Red,t_Hint);
    UserEngine.ReloadNpcList();
    SysMsg('管理NPC重新加载完成！！！',c_Red,t_Hint);
    exit;
  end; //004D0136
  TmpList:=TList.Create;
  if UserEngine.GetMerchantList(m_PEnvir,m_nCurrX,m_nCurrY,9,TmpList) > 0 then begin
    for I := 0 to TmpList.Count - 1 do begin
      Merchant:=TMerchant(TmpList.Items[i]);
      Merchant.ClearScript;
      Merchant.LoadNPCScript;
      SysMsg(Merchant.m_sCharName + '重新加载成功...',c_Green,t_Hint);
    end;    // for
  end else begin
    SysMsg('附近未发现任何交易NPC！！！',c_Red,t_Hint);
  end;
  TmpList.Clear;
  if UserEngine.GetNpcList(m_PEnvir,m_nCurrX,m_nCurrY,9,TmpList) > 0 then begin
    for I := 0 to TmpList.Count - 1 do begin
      Npc:=TNormNpc(TmpList.Items[i]);
      Npc.ClearScript;
      Npc.LoadNPCScript;
      SysMsg(Npc.m_sCharName + '重新加载成功...',c_Green,t_Hint);
    end;    // for
  end else begin
    SysMsg('附近未发现任何管理NPC！！！',c_Red,t_Hint);
  end;
  TmpList.Free;
end;
procedure TPlayObject.CmdSearchHuman(sCmd, sHumanName: String);
var
  PlayObject:TPlayObject;
begin
  if m_boProbeNecklace or (m_btPermission >= 6) then begin
    if (sHumanName = '') then begin
      SysMsg('命令格式: @' + sCmd + ' 人物名称',c_Red,t_Hint);
      exit;
    end;
    if ((GetTickCount - m_dwProbeTick) > 10000) or (m_btPermission >= 3) then begin
      m_dwProbeTick:=GetTickCount();
      PlayObject:=UserEngine.GeTPlayObject(sHumanName);
      if PlayObject <> nil then begin
        SysMsg(sHumanName + ' 现在位于 ' + PlayObject.m_PEnvir.sMapDesc + ' ' + IntToStr(PlayObject.m_nCurrX) + ':' + IntToStr(PlayObject.m_nCurrY),c_Blue,t_Hint);
      end else begin
        SysMsg(sHumanName + ' 现在不在线，或位于其它服务器上！！！',c_Red,t_Hint);
      end;
    end else begin
      SysMsg(IntToStr((GetTickCount - m_dwProbeTick) div 1000 - 10) + ' 秒之后才可以再使用此功能！！！',c_Red,t_Hint);
    end;
  end else begin
    SysMsg('您现在还无法使用此功能！！！',c_Red,t_Hint);
  end;
end;
procedure TPlayObject.CmdShowSbkGold(Cmd:pTGameCmd;sCastleName,sCtr,sGold:String);
var
  I: Integer;
  Ctr:Char;
  nGold:Integer;
  Castle:TUserCastle;
  List:TStringList;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if ((sCastleName <> '') and (sCastleName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,'']),c_Red,t_Hint);
    exit;
  end;
  if sCastleName = '' then begin
   List:=TStringList.Create;
   g_CastleManager.GetCastleGoldInfo(List);
   for I := 0 to List.Count - 1 do begin
     SysMsg(List.Strings[I],c_Green,t_Hint);
   end;
   List.Free;
   exit;
  end;
  Castle:=g_CastleManager.Find(sCastleName);
  if Castle = nil then begin
    SysMsg(format(g_sGameCommandSbkGoldCastleNotFoundMsg,[sCastleName]),c_Red,t_Hint);
    exit;
  end;
    
  Ctr:=sCtr[1];
  nGold:=Str_ToInt(sGold,-1);
  if not (Ctr in ['=','-','+']) or (nGold < 0) or (nGold > 100000000) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,g_sGameCommandSbkGoldHelpMsg]),c_Red,t_Hint);
    exit;
  end;
    
  case Ctr of
    '=': Castle.m_nTotalGold:=nGold;
    '-': Dec(Castle.m_nTotalGold);
    '+': Inc(Castle.m_nTotalGold,nGold);
  end;
  if Castle.m_nTotalGold < 0 then Castle.m_nTotalGold:=0;
    
end;


procedure TPlayObject.CmdShowUseItemInfo(Cmd: pTGameCmd;
  sHumanName: String);
var
  I: Integer;
  PlayObject:TPlayObject;
  UserItem:pTUserItem;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sHumanName = '') or ((sHumanName <> '') and (sHumanName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,g_sGameCommandShowUseItemInfoHelpMsg]),c_Red,t_Hint);
    exit;
  end;

  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject = nil then begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumanName]),c_Red,t_Hint);
    exit;
  end;
  for I := Low(PlayObject.m_UseItems) to High(PlayObject.m_UseItems) do begin
    UserItem:=@PlayObject.m_UseItems[I];
    if UserItem.wIndex = 0 then Continue;
    SysMsg(format('%s[%s]IDX[%d]系列号[%d]持久[%d-%d]',
                 [GetUseItemName(I),
                  UserEngine.GetStdItemName(UserItem.wIndex),
                  UserItem.wIndex,
                  UserItem.MakeIndex,
                  UserItem.Dura,
                  UserItem.DuraMax]),
                  c_Blue,t_Hint);
  end;
end;

procedure TPlayObject.CmdBindUseItem(Cmd: pTGameCmd; sHumanName, sItem,
  sType: String);
var
  I: Integer;
  PlayObject:TPlayObject;
  UserItem:pTUserItem;
  nItem,nBind:Integer;
  ItemBind:pTItemBind;
  nItemIdx,nMakeIdex:Integer;
  sBindName:String;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  nBind:=-1;
  nItem:=GetUseItemIdx(sItem);
  if CompareText(sType,'帐号') = 0 then nBind:=0;
  if CompareText(sType,'人物') = 0 then nBind:=1;
  if CompareText(sType,'IP') = 0 then nBind:=2;
    
  if (nItem < 0) or (nBind < 0) or (sHumanName = '') or ((sHumanName <> '') and (sHumanName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,g_sGameCommandBindUseItemHelpMsg]),c_Red,t_Hint);
    exit;
  end;

  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject = nil then begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumanName]),c_Red,t_Hint);
    exit;
  end;
  UserItem:=@PlayObject.m_UseItems[nItem];
  if UserItem.wIndex = 0 then begin
    SysMsg(format(g_sGameCommandBindUseItemNoItemMsg,[sHumanName,sItem]),c_Red,t_Hint);
    exit;
  end;
  nItemIdx:=UserItem.wIndex;
  nMakeIdex:=UserItem.MakeIndex;
  case nBind of    //
    0: begin
      sBindName:=PlayObject.m_sUserID;
      g_ItemBindAccount.Lock;
      try
        for I := 0 to g_ItemBindAccount.Count - 1 do begin
          ItemBind:=g_ItemBindAccount.Items[I];
          if (ItemBind.nItemIdx = nItemIdx) and (ItemBind.nMakeIdex = nMakeIdex) then begin
            SysMsg(format(g_sGameCommandBindUseItemAlreadBindMsg,[sHumanName,sItem]),c_Red,t_Hint);
            exit;
          end;
        end;
        New(ItemBind);
        ItemBind.nItemIdx:=nItemIdx;
        ItemBind.nMakeIdex:=nMakeIdex;
        ItemBind.sBindName:=sBindName;
        g_ItemBindAccount.Insert(0,ItemBind);
      finally
        g_ItemBindAccount.UnLock;
      end;
      SaveItemBindAccount();
      SysMsg(format('%s[%s]IDX[%d]系列号[%d]持久[%d-%d]，绑定到%s成功。',
                   [GetUseItemName(nItem),
                    UserEngine.GetStdItemName(UserItem.wIndex),
                    UserItem.wIndex,
                    UserItem.MakeIndex,
                    UserItem.Dura,
                    UserItem.DuraMax,
                    sBindName]),
                    c_Blue,t_Hint);
      PlayObject.SysMsg(format('你的%s[%s]已经绑定到%s[%s]上了。',
                                [GetUseItemName(nItem),
                                 UserEngine.GetStdItemName(UserItem.wIndex),
                                 sType,
                                 sBindName
                                ]),c_Blue,t_Hint);
    end;
    1: begin
      sBindName:=PlayObject.m_sCharName;
      g_ItemBindCharName.Lock;
      try
        for I := 0 to g_ItemBindCharName.Count - 1 do begin
          ItemBind:=g_ItemBindCharName.Items[I];
          if (ItemBind.nItemIdx = nItemIdx) and (ItemBind.nMakeIdex = nMakeIdex) then begin
            SysMsg(format(g_sGameCommandBindUseItemAlreadBindMsg,[sHumanName,sItem]),c_Red,t_Hint);
            exit;
          end;
        end;
        New(ItemBind);
        ItemBind.nItemIdx:=nItemIdx;
        ItemBind.nMakeIdex:=nMakeIdex;
        ItemBind.sBindName:=sBindName;
        g_ItemBindCharName.Insert(0,ItemBind);
      finally
        g_ItemBindCharName.UnLock;
      end;
      SaveItemBindCharName();
      SysMsg(format('%s[%s]IDX[%d]系列号[%d]持久[%d-%d]，绑定到%s成功。',
                   [GetUseItemName(nItem),
                    UserEngine.GetStdItemName(UserItem.wIndex),
                    UserItem.wIndex,
                    UserItem.MakeIndex,
                    UserItem.Dura,
                    UserItem.DuraMax,
                    sBindName]),
                    c_Blue,t_Hint);
      PlayObject.SysMsg(format('你的%s[%s]已经绑定到%s[%s]上了。',
                                [GetUseItemName(nItem),
                                 UserEngine.GetStdItemName(UserItem.wIndex),
                                 sType,
                                 sBindName
                                ]),c_Blue,t_Hint);
    end;
    2: begin
      sBindName:=PlayObject.m_sIPaddr;
      g_ItemBindIPaddr.Lock;
      try
        for I := 0 to g_ItemBindIPaddr.Count - 1 do begin
          ItemBind:=g_ItemBindIPaddr.Items[I];
          if (ItemBind.nItemIdx = nItemIdx) and (ItemBind.nMakeIdex = nMakeIdex) then begin
            SysMsg(format(g_sGameCommandBindUseItemAlreadBindMsg,[sHumanName,sItem]),c_Red,t_Hint);
            exit;
          end;
        end;
        New(ItemBind);
        ItemBind.nItemIdx:=nItemIdx;
        ItemBind.nMakeIdex:=nMakeIdex;
        ItemBind.sBindName:=sBindName;
        g_ItemBindIPaddr.Insert(0,ItemBind);
      finally
        g_ItemBindIPaddr.UnLock;
      end;
      SaveItemBindIPaddr();
      SysMsg(format('%s[%s]IDX[%d]系列号[%d]持久[%d-%d]，绑定到%s成功。',
                   [GetUseItemName(nItem),
                    UserEngine.GetStdItemName(UserItem.wIndex),
                    UserItem.wIndex,
                    UserItem.MakeIndex,
                    UserItem.Dura,
                    UserItem.DuraMax,
                    sBindName]),
                    c_Blue,t_Hint);
      PlayObject.SysMsg(format('你的%s[%s]已经绑定到%s[%s]上了。',
                                [GetUseItemName(nItem),
                                 UserEngine.GetStdItemName(UserItem.wIndex),
                                 sType,
                                 sBindName
                                ]),c_Blue,t_Hint);
    end;
  end;
end;
procedure TPlayObject.CmdUnBindUseItem(Cmd: pTGameCmd; sHumanName, sItem,
  sType: String);
var
  I: Integer;
  PlayObject:TPlayObject;
  UserItem:pTUserItem;
  nItem,nBind:Integer;
  ItemBind:pTItemBind;
  nItemIdx,nMakeIdex:Integer;
  sBindName:String;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  nBind:=-1;
  nItem:=GetUseItemIdx(sItem);
  if CompareText(sType,'帐号') = 0 then nBind:=0;
  if CompareText(sType,'人物') = 0 then nBind:=1;
  if CompareText(sType,'IP') = 0 then nBind:=2;
    
  if (nItem < 0) or (nBind < 0) or (sHumanName = '') or ((sHumanName <> '') and (sHumanName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,g_sGameCommandBindUseItemHelpMsg]),c_Red,t_Hint);
    exit;
  end;

  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject = nil then begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumanName]),c_Red,t_Hint);
    exit;
  end;
  UserItem:=@PlayObject.m_UseItems[nItem];
  if UserItem.wIndex = 0 then begin
    SysMsg(format(g_sGameCommandBindUseItemNoItemMsg,[sHumanName,sItem]),c_Red,t_Hint);
    exit;
  end;
  nItemIdx:=UserItem.wIndex;
  nMakeIdex:=UserItem.MakeIndex;
  case nBind of    //
    0: begin
      sBindName:=PlayObject.m_sUserID;
      g_ItemBindAccount.Lock;
      try
        for I := 0 to g_ItemBindAccount.Count - 1 do begin
          ItemBind:=g_ItemBindAccount.Items[I];
          if (ItemBind.nItemIdx = nItemIdx) and (ItemBind.nMakeIdex = nMakeIdex) then begin
            SysMsg(format(g_sGameCommandBindUseItemAlreadBindMsg,[sHumanName,sItem]),c_Red,t_Hint);
            exit;
          end;
        end;
        New(ItemBind);
        ItemBind.nItemIdx:=nItemIdx;
        ItemBind.nMakeIdex:=nMakeIdex;
        ItemBind.sBindName:=sBindName;
        g_ItemBindAccount.Insert(0,ItemBind);
      finally
        g_ItemBindAccount.UnLock;
      end;
      SaveItemBindAccount();
      SysMsg(format('%s[%s]IDX[%d]系列号[%d]持久[%d-%d]，绑定到%s成功。',
                   [GetUseItemName(nItem),
                    UserEngine.GetStdItemName(UserItem.wIndex),
                    UserItem.wIndex,
                    UserItem.MakeIndex,
                    UserItem.Dura,
                    UserItem.DuraMax,
                    sBindName]),
                    c_Blue,t_Hint);
      PlayObject.SysMsg(format('你的%s[%s]已经绑定到%s[%s]上了。',
                                [GetUseItemName(nItem),
                                 UserEngine.GetStdItemName(UserItem.wIndex),
                                 sType,
                                 sBindName
                                ]),c_Blue,t_Hint);
    end;
    1: begin
      sBindName:=PlayObject.m_sCharName;
      g_ItemBindCharName.Lock;
      try
        for I := 0 to g_ItemBindCharName.Count - 1 do begin
          ItemBind:=g_ItemBindCharName.Items[I];
          if (ItemBind.nItemIdx = nItemIdx) and (ItemBind.nMakeIdex = nMakeIdex) then begin
            SysMsg(format(g_sGameCommandBindUseItemAlreadBindMsg,[sHumanName,sItem]),c_Red,t_Hint);
            exit;
          end;
        end;
        New(ItemBind);
        ItemBind.nItemIdx:=nItemIdx;
        ItemBind.nMakeIdex:=nMakeIdex;
        ItemBind.sBindName:=sBindName;
        g_ItemBindCharName.Insert(0,ItemBind);
      finally
        g_ItemBindCharName.UnLock;
      end;
      SaveItemBindCharName();
      SysMsg(format('%s[%s]IDX[%d]系列号[%d]持久[%d-%d]，绑定到%s成功。',
                   [GetUseItemName(nItem),
                    UserEngine.GetStdItemName(UserItem.wIndex),
                    UserItem.wIndex,
                    UserItem.MakeIndex,
                    UserItem.Dura,
                    UserItem.DuraMax,
                    sBindName]),
                    c_Blue,t_Hint);
      PlayObject.SysMsg(format('你的%s[%s]已经绑定到%s[%s]上了。',
                                [GetUseItemName(nItem),
                                 UserEngine.GetStdItemName(UserItem.wIndex),
                                 sType,
                                 sBindName
                                ]),c_Blue,t_Hint);
    end;
    2: begin
      sBindName:=PlayObject.m_sIPaddr;
      g_ItemBindIPaddr.Lock;
      try
        for I := 0 to g_ItemBindIPaddr.Count - 1 do begin
          ItemBind:=g_ItemBindIPaddr.Items[I];
          if (ItemBind.nItemIdx = nItemIdx) and (ItemBind.nMakeIdex = nMakeIdex) then begin
            SysMsg(format(g_sGameCommandBindUseItemAlreadBindMsg,[sHumanName,sItem]),c_Red,t_Hint);
            exit;
          end;
        end;
        New(ItemBind);
        ItemBind.nItemIdx:=nItemIdx;
        ItemBind.nMakeIdex:=nMakeIdex;
        ItemBind.sBindName:=sBindName;
        g_ItemBindIPaddr.Insert(0,ItemBind);
      finally
        g_ItemBindIPaddr.UnLock;
      end;
      SaveItemBindIPaddr();
      SysMsg(format('%s[%s]IDX[%d]系列号[%d]持久[%d-%d]，绑定到%s成功。',
                   [GetUseItemName(nItem),
                    UserEngine.GetStdItemName(UserItem.wIndex),
                    UserItem.wIndex,
                    UserItem.MakeIndex,
                    UserItem.Dura,
                    UserItem.DuraMax,
                    sBindName]),
                    c_Blue,t_Hint);
      PlayObject.SysMsg(format('你的%s[%s]已经绑定到%s[%s]上了。',
                                [GetUseItemName(nItem),
                                 UserEngine.GetStdItemName(UserItem.wIndex),
                                 sType,
                                 sBindName
                                ]),c_Blue,t_Hint);
    end;
  end;
end;
procedure TPlayObject.CmdShutup(Cmd:pTGameCmd;sHumanName,sTime:String);
var
  dwTime:LongWord;
  nIndex:Integer;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sTime = '') or (sHumanName = '') or ((sHumanName <> '') and (sHumanName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,g_sGameCommandShutupHelpMsg]),c_Red,t_Hint);
    exit;
  end;

  dwTime:=Str_ToInt(sTime,5);
  g_DenySayMsgList.Lock;
  try
    nIndex:=g_DenySayMsgList.GetIndex(sHumanName);
    if nIndex >= 0 then begin
      g_DenySayMsgList.Objects[nIndex]:=TObject(GetTickCount + dwTime * 60 * 1000);
    end else begin
      g_DenySayMsgList.AddRecord(sHumanName,GetTickCount + dwTime * 60 * 1000);
    end;      
  finally
    g_DenySayMsgList.UnLock;
  end;
  SysMsg(format(g_sGameCommandShutupHumanMsg,[sHumanName,dwTime]),c_Red,t_Hint);
end;
procedure TPlayObject.CmdShutupList(Cmd:pTGameCmd;sParam1:String);
var
  I: Integer;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if ((sParam1 <> '') and (sParam1[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,'']),c_Red,t_Hint);
    exit;
  end;

  if (m_btPermission < 6) then exit;
  g_DenySayMsgList.Lock;
  try
    if g_DenySayMsgList.Count <= 0 then begin
      SysMsg(g_sGameCommandShutupListIsNullMsg,c_Green,t_Hint);
      exit;
    end;
    for I := 0 to g_DenySayMsgList.Count - 1 do begin
      SysMsg(g_DenySayMsgList.Strings[I] + ' ' + IntToStr((LongWord(g_DenySayMsgList.Objects[I]) - GetTickCount) div 60000),c_Green,t_Hint);
    end; 
  finally
    g_DenySayMsgList.UnLock;
  end;
end;
procedure TPlayObject.CmdShutupRelease(Cmd:pTGameCmd;sHumanName:String;boAll:Boolean);
var
  I:Integer;
  PlayObject:TPlayObject;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sHumanName = '') or ((sHumanName <> '') and (sHumanName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,g_sGameCommandShutupReleaseHelpMsg]),c_Red,t_Hint);
    exit;
  end;
  g_DenySayMsgList.Lock;
  try
    I:=g_DenySayMsgList.GetIndex(sHumanName);
    if I >= 0 then begin
      g_DenySayMsgList.Delete(I);
      PlayObject:=UserEngine.GeTPlayObject(sHumanName);
      if PlayObject <> nil then begin
        PlayObject.SysMsg(g_sGameCommandShutupReleaseCanSendMsg,c_Red,t_Hint);
      end;
      if boAll then begin
        UserEngine.SendServerGroupMsg(SS_210,nServerIndex,sHumanName);
      end;
      SysMsg(format(g_sGameCommandShutupReleaseHumanCanSendMsg,[sHumanName]),c_Green,t_Hint);
    end;      
  finally
    g_DenySayMsgList.UnLock;
  end;
end;
procedure TPlayObject.CmdSmakeItem(Cmd:pTGameCmd;nWhere,nValueType,nValue:Integer);
var
  sShowMsg:String;
  StdItem:TItem;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;

  if (nWhere in [0..12]) and (nValueType in [0..15]) and (nValue in [0..255])then begin
    if m_UseItems[nWhere].wIndex > 0 then begin
      StdItem:=UserEngine.GetStdItem(m_UseItems[nWhere].wIndex);
      if StdItem = nil then exit;
        
      if nValueType > 13 then begin
        nValue:=_MIN(65,nValue);
        if nValueType = 14 then m_UseItems[nWhere].Dura:= nValue * 1000;
        if nValueType = 15 then m_UseItems[nWhere].DuraMax:= nValue * 1000;
      end else begin
        m_UseItems[nWhere].btValue[nValueType]:=nValue;
      end;
      RecalcAbilitys();
      SendUpdateItem(@m_UseItems[nWhere]);
        sShowMsg:=IntToStr(m_UseItems[nWhere].wIndex) + '-' + IntToStr(m_UseItems[nWhere].MakeIndex) + ' ' +
                  IntToStr(m_UseItems[nWhere].Dura) + '/' + IntToStr(m_UseItems[nWhere].DuraMax) + ' ' +
                  IntToStr(m_UseItems[nWhere].btValue[0]) + '/' +
                  IntToStr(m_UseItems[nWhere].btValue[1]) + '/' +
                  IntToStr(m_UseItems[nWhere].btValue[2]) + '/' +
                  IntToStr(m_UseItems[nWhere].btValue[3]) + '/' +
                  IntToStr(m_UseItems[nWhere].btValue[4]) + '/' +
                  IntToStr(m_UseItems[nWhere].btValue[5]) + '/' +
                  IntToStr(m_UseItems[nWhere].btValue[6]) + '/' +
                  IntToStr(m_UseItems[nWhere].btValue[7]) + '/' +
                  IntToStr(m_UseItems[nWhere].btValue[8]) + '/' +
                  IntToStr(m_UseItems[nWhere].btValue[9]) + '/' +
                  IntToStr(m_UseItems[nWhere].btValue[10]) + '/' +
                  IntToStr(m_UseItems[nWhere].btValue[11]) + '/' +
                  IntToStr(m_UseItems[nWhere].btValue[12]) + '/' +
                  IntToStr(m_UseItems[nWhere].btValue[13]);
        SysMsg(sShowMsg,c_Blue,t_Hint);
      if g_Config.boShowMakeItemMsg then
        MainOutMessage('[物品调整] ' + m_sCharName + '(' + StdItem.Name + ' -> ' + sShowMsg + ')');
    end else begin
      SysMsg(g_sGamecommandSuperMakeHelpMsg,c_Red,t_Hint);
    end;
  end;
end;
procedure TPlayObject.CmdSpirtStart(sCmd, sParam1: String);
var
  nTime:Integer;
  dwTime:LongWord;
begin
  if (m_btPermission < 6) then exit;
  if (sParam1 <> '') and (sParam1[1] = '?') then begin
    SysMsg('此命令用于开始祈祷生效宝宝叛变。',c_Red,t_Hint);
    exit;
  end;
  nTime:=Str_ToInt(sParam1,-1);
  if nTime > 0 then begin
    dwTime:=LongWord(nTime) * 1000;
  end else begin
    dwTime:=g_Config.dwSpiritMutinyTime;
  end;
    
  g_dwSpiritMutinyTick:=GetTickCount + dwTime;
  SysMsg('祈祷叛变已开始。持续时长 ' + IntToStr(dwTime div 1000) + ' 秒。',c_Green,t_Hint);
end;
procedure TPlayObject.CmdSpirtStop(sCmd, sParam1: String);
begin
  if (m_btPermission < 6) then exit;
  if (sParam1 <> '') and (sParam1[1] = '?') then begin
    SysMsg('此命令用于停止祈祷生效导致宝宝叛变。',c_Red,t_Hint);
    exit;
  end;
  g_dwSpiritMutinyTick:=0;
  SysMsg('祈祷叛变已停止。',c_Green,t_Hint);

end;



procedure TPlayObject.CmdStartQuest(Cmd:pTGameCmd; sQuestName: String);
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sQuestName = '') then begin
    SysMsg('命令格式: @' + Cmd.sCmd + ' 问答名称',c_Red,t_Hint);
    exit;
  end;
  UserEngine.SendQuestMsg(sQuestName);
end;

procedure TPlayObject.CmdSuperTing(Cmd:pTGameCmd;sHumanName,sRange:String);
var
  I: Integer;
  PlayObject:TPlayObject;
  MoveHuman:TPlayObject;
  nRange:Integer;
  HumanList:TList;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sRange = '') or (sHumanName = '') or ((sHumanName <> '') and (sHumanName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,g_sGameCommandSuperTingHelpMsg]),c_Red,t_Hint);
    exit;
  end;

  nRange:=_MAX(10,Str_ToInt(sRange,2));
  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject <> nil then begin
    HumanList:=TList.Create;
    UserEngine.GetMapRageHuman(PlayObject.m_PEnvir,PlayObject.m_nCurrX,PlayObject.m_nCurrY,nRange,HumanList);
    for I := 0 to HumanList.Count - 1 do begin
      MoveHuman:=TPlayObject(HumanList.Items[I]);
      if MoveHuman <> Self then
        MoveHuman.MapRandomMove(MoveHuman.m_sHomeMap,0);
    end;
    HumanList.Free;
  end else begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumanName]),c_Red,t_Hint);
  end;
    
end;



procedure TPlayObject.CmdTakeOffHorse(sCmd, sParam: String);
begin
  if (sParam <> '') and (sParam[1] = '?') then begin
    SysMsg('下马命令，在骑马状态输入此命令下马。',c_Red,t_Hint);
    SysMsg(format('命令格式: @%s',[sCmd]),c_Red,t_Hint);
    exit;
  end;
  if not m_boOnHorse then exit;

  m_boOnHorse:=False;
  FeatureChanged();
end;

procedure TPlayObject.CmdTakeOnHorse(sCmd, sParam: String);
begin
  if (sParam <> '') and (sParam[1] = '?') then begin
    SysMsg('上马命令，在戴好马牌后输入此命令就可以骑上马。',c_Red,t_Hint);
    SysMsg(format('命令格式: @%s',[sCmd]),c_Red,t_Hint);
    exit;
  end;
  if m_boOnHorse then exit;

  if (m_btHorseType = 0) then begin
    SysMsg('骑马必须先戴上马牌！！！',c_Red,t_Hint);
    exit;
  end;
  m_boOnHorse:=True;
  FeatureChanged();
end;

procedure TPlayObject.CmdTestFire(sCmd:String;nRange,nType,nTime,nPoint:Integer);
var
  nX,nY:Integer;
  FireBurnEvent:TFireBurnEvent;
  nMinX,nMaxX,nMinY,nMaxY:Integer;
begin
  nMinX:=m_nCurrX - nRange;
  nMaxX:=m_nCurrX + nRange;
  nMinY:=m_nCurrY - nRange;
  nMaxY:=m_nCurrY + nRange;
  for nX:= nMinX to nMaxX do begin
    for nY:= nMinY to nMaxY do begin
      if ((nX < nMaxX) and (nY = nMinY)) or
         ((nY < nMaxY) and (nX = nMinX)) or
         (nX = nMaxX) or (nY = nMaxY) then begin
        FireBurnEvent:=TFireBurnEvent.Create(Self,nX,nY,nType,nTime * 1000,nPoint);
        g_EventManager.AddEvent(FireBurnEvent);
      end;
    end;
  end;
end;

procedure TPlayObject.CmdTestGetBagItems(Cmd: pTGameCmd; sParam: String);
var
  btDc,btSc,btMc,btDura:Byte;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sParam <> '') and (sParam[1] = '?') then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,g_sGameCommandTestGetBagItemsHelpMsg]),c_Red,t_Hint);
    exit;
  end;
  btDc:=0;
  btSc:=0;
  btMc:=0;
  btDura:=0;
  GetBagUseItems(btDc,btSc,btMc,btDura);
  SysMsg(format('DC:%d SC:%d MC:%d DURA:%d',[btDc,btSc,btMc,btDura]),c_Blue,t_Hint);
end;


procedure TPlayObject.CmdTestSpeedMode(Cmd: pTGameCmd);
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  m_boTestSpeedMode:= not m_boTestSpeedMode;
  if m_boTestSpeedMode then begin
    SysMsg('开启速度测试模式',c_Red,t_Hint);
  end else begin
    SysMsg('关闭速度测试模式',c_Red,t_Hint);
  end;
    
end;

procedure TPlayObject.CmdTestStatus(sCmd: String; nType, nTime: Integer);
begin
  if (m_btPermission < 6) then exit;
  if (not (nType in [Low(TStatusTime)..High(TStatusTime)])) or (nTime < 0) then begin
    SysMsg('命令格式: @' + sCmd + ' 类型(0..11) 时长',c_Red,t_Hint);
    exit;
  end;
  m_wStatusTimeArr[nType]:=nTime * 1000;
  m_dwStatusArrTick[nType]:=GetTickCount();
  m_nCharStatus:=GetCharStatus();
  StatusChanged();
  SysMsg(format('状态编号:%d 时间长度: %d 秒',[nType,nTime]),c_Green,t_Hint);
end;

procedure TPlayObject.CmdTing(Cmd:pTGameCmd;sHumanName:String);
var
  PlayObject:TPlayObject;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sHumanName = '') or ((sHumanName <> '') and (sHumanName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,g_sGameCommandTingHelpMsg]),c_Red,t_Hint);
    exit;
  end;

  PlayObject:=UserEngine.GeTPlayObject(sHumanName);
  if PlayObject <> nil then begin
    PlayObject.MapRandomMove(m_sHomeMap,0);
  end else begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumanName]),c_Red,t_Hint);
  end;
end;
procedure TPlayObject.CmdTraining(sSkillName: String; nLevel: Integer); //004CC414
begin
  if (m_btPermission < 6) then exit;
end;

procedure TPlayObject.CmdUserMoveXY(sCMD, sX, sY: String);
var
  Envir:TEnvirnoment;
  nX,nY:Integer;
begin
  if m_boTeleport then begin
    nX:=Str_ToInt(sX,-1);
    nY:=Str_ToInt(sY,-1);
    {
    if (nX < 0) or (nY < 0) then begin
      SysMsg('命令格式: @' + sCMD + ' 座标X 座标Y',c_Red,t_Hint);
      exit;
    end;
    }
    if not m_PEnvir.Flag.boNOPOSITIONMOVE then begin
      if m_PEnvir.CanWalkOfItem(nX,nY,g_Config.boUserMoveCanDupObj,g_Config.boUserMoveCanOnItem) then begin
        if (GetTickCount - m_dwTeleportTick) > g_Config.dwUserMoveTime * 1000{10000} then begin
          m_dwTeleportTick:=GetTickCount();
          SendRefMsg(RM_SPACEMOVE_FIRE,0,0,0,0,'');
          //BaseObjectMove('',sX,sY);
          SpaceMove(m_sMapName,nX,nY,0);
        end else begin
          SysMsg(IntToStr(g_Config.dwUserMoveTime - (GetTickCount - m_dwTeleportTick) div 1000) + '秒之后才可以再使用此功能！！！',c_Red,t_Hint);
        end;
      end else begin
         SysMsg(format(g_sGameCommandPositionMoveCanotMoveToMap,[m_sMapName,sX,sY]),c_Green,t_Hint);
      end;
    end else begin
      SysMsg('此地图禁止使用此命令！！！',c_Red,t_Hint);
    end;
  end else begin
    SysMsg('您现在还无法使用此功能！！！',c_Red,t_Hint);
  end;
end;
procedure TPlayObject.CmdViewDiary(sCMD: String; nFlag: Integer);//004D1B70
begin

end;

procedure TPlayObject.CmdViewWhisper(Cmd:pTGameCmd; sCharName, sParam2: String);
var
  PlayObject:TPlayObject;
begin
  if (m_btPermission < Cmd.nPermissionMin) then begin
    SysMsg(g_sGameCommandPermissionTooLow,c_Red,t_Hint);
    exit;
  end;
  if (sCharName = '') or ((sCharName <> '') and (sCharName[1] = '?')) then begin
    SysMsg(format(g_sGameCommandParamUnKnow,[Cmd.sCmd,g_sGameCommandViewWhisperHelpMsg]),c_Red,t_Hint);
    exit;
  end;
  PlayObject:=UserEngine.GeTPlayObject(sCharName);
  if PlayObject <> nil then begin
    if PlayObject.m_GetWhisperHuman = Self then begin
      PlayObject.m_GetWhisperHuman:=nil;
      SysMsg(format(g_sGameCommandViewWhisperMsg1,[sCharName]),c_Green,t_Hint);
    end else begin
      PlayObject.m_GetWhisperHuman:=Self;
      SysMsg(format(g_sGameCommandViewWhisperMsg2,[sCharName]),c_Green,t_Hint);
    end;
  end else begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sCharName]),c_Red,t_Hint);
  end;
end;

constructor TPlayObject.Create;//004C9860
begin
  inherited;
  m_btRaceServer     := RC_PLAYOBJECT;
  m_boEmergencyClose := False;
  m_boSwitchData     := False;
  m_boReconnection   := False;
  m_boKickFlag       := False;
  m_boSoftClose      := False;
  m_boReadyRun       := False;
  bo698              := False;
  n69C               := 0;
  m_dwSaveRcdTick    := GetTickCount();
  m_boWantRefMsg     := True;
  m_boRcdSaved       := False;
  m_boDieInFight3Zone              := False;
  m_Script           := nil;
  m_boTimeRecall     := False;
  m_sMoveMap         := '';
  m_nMoveX           := 0;
  m_nMoveY           := 0;
  m_dwRunTick        := GetTickCount();
  m_nRunTime         := 250;
  m_dwSearchTime     := 1000;
  m_dwSearchTick     := GetTickCount();
  m_nViewRange       := 12;
  m_boNewHuman       := False;
  m_boLoginNoticeOK  := False;
  bo6AB              := False;
  m_boExpire         := False;
  m_boSendNotice     := False;
  m_dwCheckDupObjTick          := GetTickCount();
  dwTick578          := GetTickCount();
  dwTick57C          := GetTickCount();
  m_boInSafeArea              := False;
  n5F8               := 0;
  n5FC               := 0;
  m_dwMagicAttackTick     := GetTickCount();
  m_dwMagicAttackInterval := 0;
  m_dwAttackTick          := GetTickCount();
  m_dwMoveTick            := GetTickCount();
  m_dwTurnTick            := GetTickCount();
  m_dwActionTick          := GetTickCount();
  m_dwAttackCount         := 0;
  m_dwAttackCountA        := 0;
  m_dwMagicAttackCount    := 0;
  m_dwMoveCount           := 0;
  m_dwMoveCountA          := 0;
  m_nOverSpeedCount       := 0;
  TList55C                := TList.Create;
  m_sOldSayMsg            := '';
  m_dwSayMsgTick          := GetTickCount();
  m_boDisableSayMsg       := False;
  m_dwDisableSayMsgTick   := GetTickCount();
  m_dLogonTime            := Now();
  m_dwLogonTick           := GetTickCount();
  n584                    := 0;
  n588                    := 0;
  m_boSwitchData          := False;
  m_boSwitchDataSended    := False;
  m_nWriteChgDataErrCount := 0;
  m_dwShowLineNoticeTick  := GetTickCount();
  m_nShowLineNoticeIdx    := 0;
  m_nSoftVersionDateEx    := 0;
  m_CanJmpScriptLableList := TStringList.Create;
  m_nKillMonExpMultiple   := 1;
  m_nKillMonExpRate       := 100;
  m_dwRateTick            := GetTickCount();
  m_nPowerRate            := 100;

  m_boSetStoragePwd       :=False;
  m_boReConfigPwd         :=False;
  m_boCheckOldPwd         :=False;
  m_boUnLockPwd           :=False;
  m_boUnLockStoragePwd    :=False;
  m_boPasswordLocked      :=False;  //锁仓库
  m_btPwdFailCount        :=0;
  m_sTempPwd              :='';
  m_sStoragePwd           :='';;
  m_boFilterSendMsg       :=False;

  m_boCanDeal             :=True;
  m_boCanDrop             :=True;
  m_boCanGetBackItem        :=True;
  m_boCanWalk               :=True;
  m_boCanRun                :=True;
  m_boCanHit                :=True;
  m_boCanSpell              :=True;
  m_boCanUseItem            :=True;
  m_nMemberType             :=0;
  m_nMemberLevel            :=0;
  
  m_nGameGold               := 0;
  m_boDecGameGold           := False;
  m_nDecGameGold            := 1;
  m_dwDecGameGoldTick       := GetTickCount();
  m_dwDecGameGoldTime       := 60 * 1000;

  m_boIncGameGold           := False;
  m_nIncGameGold            := 1;
  m_dwIncGameGoldTick       := GetTickCount();
  m_dwIncGameGoldTime       := 60 * 1000;

  m_nGamePoint              := 0;
  m_dwIncGamePointTick      := GetTickCount();

  m_nPayMentPoint           := 0;

  m_DearHuman               := nil;
  m_MasterHuman             := nil;
  m_MasterList              := TList.Create;
  m_boSendMsgFlag           := False;
  m_boChangeItemNameFlag    := False;

  m_boCanMasterRecall       := False;
  m_boCanDearRecall         := False;
  m_dwDearRecallTick        := GetTickCount();
  m_dwMasterRecallTick      := GetTickCount();
  m_btReColorIdx            := 0;
  m_GetWhisperHuman         := nil;
  m_boOnHorse               := False;
  m_wContribution           := 0;
  m_sRankLevelName          := g_sRankLevelName;
  m_boFixedHideMode         := True;
  m_nStep                   := 0;
  FillChar(m_nMval,SizeOf(m_nMval),#0);
  m_nClientFlagMode         := -1;
  m_dwAutoGetExpTick        := GetTickCount;
  m_nAutoGetExpPoint        := 0;
  m_AutoGetExpEnvir         := nil;
  m_dwHitIntervalTime       := g_Config.dwHitIntervalTime;  //攻击间隔
  m_dwMagicHitIntervalTime  := g_Config.dwMagicHitIntervalTime;  //魔法间隔
  m_dwRunIntervalTime       := g_Config.dwRunIntervalTime;  //走路间隔
  m_dwWalkIntervalTime      := g_Config.dwWalkIntervalTime;  //走路间隔
  m_dwTurnIntervalTime      := g_Config.dwTurnIntervalTime;  //换方向间隔
  m_dwActionIntervalTime    := g_Config.dwActionIntervalTime;  //组合操作间隔
  m_dwRunLongHitIntervalTime    := g_Config.dwRunLongHitIntervalTime;  //组合操作间隔
  m_dwRunHitIntervalTime    := g_Config.dwRunHitIntervalTime;  //组合操作间隔
  m_dwWalkHitIntervalTime   := g_Config.dwWalkHitIntervalTime;  //组合操作间隔
  m_dwRunMagicIntervalTime  := g_Config.dwRunMagicIntervalTime;  //跑位魔法间隔
  m_DynamicVarList          := TList.Create;
  m_SessInfo                := nil;
  m_boTestSpeedMode         := False;
  m_boLockLogon             := True;
  m_boLockLogoned           := False;
end;

procedure TPlayObject.DealCancel; //004DD394
begin
  if not m_boDealing then exit;
  m_boDealing:=False;
  SendDefMessage(SM_DEALCANCEL,0,0,0,0,'');
  if m_DealCreat <> nil then begin
    TPlayObject(m_DealCreat).DealCancel;
  end;
  m_DealCreat:=nil;
  GetBackDealItems();
  SysMsg(g_sDealActionCancelMsg{'交易取消'},c_Green,t_Hint);
  m_DealLastTick:=GetTickCount();
end;

procedure TPlayObject.DealCancelA;
begin
  m_Abil.HP:=m_WAbil.HP;
  DealCancel();
end;

function TPlayObject.DecGold(nGold: Integer): Boolean; //004BF6A8
begin
  Result:=False;
  if m_nGold >= nGold then begin
    Dec(m_nGold,nGold);
    Result:=True;
  end;     
end;

destructor TPlayObject.Destroy;//004C9B54
var
  I: Integer;
begin
  m_MasterList.Free;
  for I := 0 to TList55C.Count - 1 do begin

  end;
  TList55C.Free;
  for I := 0 to m_DynamicVarList.Count - 1 do begin
    Dispose(pTDynamicVar(m_DynamicVarList.Items[I]));
  end;
  m_DynamicVarList.Free;
  m_CanJmpScriptLableList.Free;    
  inherited;
end;

procedure TPlayObject.Disappear;//004CA89C
begin
  if m_boReadyRun then DisappearA;
  if m_boTransparent and m_boHideMode then m_wStatusTimeArr[STATE_TRANSPARENT{0x70}]:=0;  //004CA8F7

  if m_GroupOwner <> nil then begin
    m_GroupOwner.DelMember(Self);
  end;
  if m_MyGuild <> nil then begin
    TGuild(m_MyGuild).DelHumanObj(Self);
  end;
  LogonTimcCost();
  inherited;
end;

procedure TPlayObject.DropUseItems(BaseObject: TBaseObject);
var
  I: Integer;
  nRate:Integer;
  StdItem:TItem;
  DelList:TStringList;
ResourceString
  sExceptionMsg = '[Exception] TPlayObject::DropUseItems';
begin
  DelList:=nil;
  try                 
    if m_boAngryRing or m_boNoDropUseItem then exit;
    for I := Low(THumanUseItems) to High(THumanUseItems) do begin
      StdItem:=UserEngine.GetStdItem(m_UseItems[I].wIndex);
      if StdItem <> nil then begin
        if StdItem.Reserved and 8 <> 0 then begin
          if DelList = nil then DelList:=TStringList.Create;
          DelList.AddObject('',TObject(m_UseItems[I].MakeIndex));
          //004BB885
          if StdItem.NeedIdentify = 1 then
            AddGameDataLog('16' +  #9 +
                     m_sMapName + #9 +
                     IntToStr(m_nCurrX) + #9 +
                     IntToStr(m_nCurrY) + #9 +
                     m_sCharName + #9 +
                     //UserEngine.GetStdItemName(m_UseItems[I].wIndex) + #9 +
                     StdItem.Name + #9 +
                     IntToStr(m_UseItems[I].MakeIndex) + #9 +
                     BoolToIntStr(m_btRaceServer = RC_PLAYOBJECT) + #9 +
                     '0');
          m_UseItems[I].wIndex:=0;
        end;
      end;
    end;


    if PKLevel > 2 then nRate:=g_Config.nDieRedDropUseItemRate{15}
    else nRate:=g_Config.nDieDropUseItemRate{30};

    for I := Low(THumanUseItems) to High(THumanUseItems) do begin
      if Random(nRate) <> 0 then Continue;
      if InDisableTakeOffList(m_UseItems[I].wIndex) then Continue;    //检查是否在禁止取下列表,如果在列表中则不掉此物品
      if DropItemDown(@m_UseItems[I],2,True,BaseObject,Self) then begin
          StdItem:=UserEngine.GetStdItem(m_UseItems[I].wIndex);
          if StdItem <> nil then begin
            if StdItem.Reserved and 10 = 0 then begin
              if m_btRaceServer = RC_PLAYOBJECT then begin
                if DelList = nil then DelList:=TStringList.Create;
                DelList.AddObject(UserEngine.GetStdItemName(m_UseItems[I].wIndex),TObject(m_UseItems[I].MakeIndex));
              end;
              m_UseItems[I].wIndex:=0;
            end;
          end;
      end;
    end;
    if DelList <> nil then
      SendMsg(Self,RM_SENDDELITEMLIST,0,Integer(DelList),0,0,'');
  except
    MainOutMessage(sExceptionMsg);
  end;
end;

procedure TPlayObject.GainExp (dwExp:LongWord); //004BE600
var
   i, n, sumlv: integer;
   PlayObject:TPlayObject;
ResourceString
  sExceptionMsg = '[Exception] TPlayObject::GainExp';
const
   bonus: array[0..GROUPMAX] of Real = (1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9, 2, 2.1, 2.2);
begin
  try
    if m_GroupOwner <> nil then begin
      sumlv := 0;
      n := 0;
      for i:=0 to m_GroupOwner.m_GroupMembers.Count-1 do begin
        PlayObject:=TPlayObject(m_GroupOwner.m_GroupMembers.Objects[i]);
        if not PlayObject.m_boDeath and (m_PEnvir = PlayObject.m_PEnvir) and (abs(m_nCurrX-PlayObject.m_nCurrX) <= 12) and (abs(m_nCurrX - PlayObject.m_nCurrX) <= 12) then begin
          sumlv := sumlv + PlayObject.m_Abil.Level;
           Inc (n);
        end;
      end;
      if (sumlv > 0) and (n > 1) then begin
        if n in [0..GROUPMAX] then
          dwExp := Round (dwExp * bonus[n]);
        for i:=0 to m_GroupOwner.m_GroupMembers.Count-1 do begin
          PlayObject:= TPlayObject(m_GroupOwner.m_GroupMembers.Objects[i]);
          if not PlayObject.m_boDeath and (m_PEnvir = PlayObject.m_PEnvir) and (abs(m_nCurrX - PlayObject.m_nCurrX) <= 12) and (abs(m_nCurrX - PlayObject.m_nCurrX) <= 12) then begin
            if g_Config.boHighLevelKillMonFixExp then begin //02/08 增加，在高等级经验不变时，把组队的经验平均分配
              PlayObject.WinExp (Round (dwExp / n));
            end else begin
              PlayObject.WinExp (Round (dwExp / sumlv * PlayObject.m_Abil.Level));
            end;
          end;
        end;
      end else WinExp (dwExp);
    end else WinExp (dwExp);
  except
    MainOutMessage (sExceptionMsg);
  end;
end;

procedure TPlayObject.GameTimeChanged;
begin
  if m_btBright <> g_nGameTime then begin
     m_btBright:=g_nGameTime;
     SendMsg(Self,RM_DAYCHANGING,0,0,0,0,'');
  end;
end;
procedure TPlayObject.GetBackDealItems; //004DD270
var
  I: Integer;
begin
  if m_DealItemList.Count > 0 then begin
    for I := 0 to m_DealItemList.Count - 1 do begin
      m_ItemList.Add(m_DealItemList.Items[i]);
    end;
  end;
  m_DealItemList.Clear;
  Inc(m_nGold,m_nDealGolds);
  m_nDealGolds:=0;
  m_boDealOK:=False;
end;

procedure TPlayObject.GetBagUseItems(var btDc, btSc, btMc, btDura: Byte);
  var
    I,II: Integer;
    DuraList:TList;
    UserItem:pTUserItem;
    StdItem:TItem;
    StdItem80:TStdItem;
    DelItemList:TStringList;
    nDc,nSc,nMc,nDcMin,nDcMax,nScMin,nScMax,nMcMin,nMcMax,nDura,nItemCount:Integer;
  begin
    nDcMin:=0;
    nDcMax:=0;
    nScMin:=0;
    nScMax:=0;
    nMcMin:=0;
    nMcMax:=0;
    nDura:=0;
    nItemCount:=0;
    DelItemList:=nil;
    DuraList:=TList.Create;
    for I := m_ItemList.Count - 1 downto 0 do begin
      UserItem:=m_ItemList.Items[I];
      if UserEngine.GetStdItemName(UserItem.wIndex) = g_Config.sBlackStone then begin
        DuraList.Add(Pointer(ROUND(UserItem.Dura / 1.0e3)));
        if DelItemList = nil then DelItemList:=TStringList.Create;
        DelItemList.AddObject(g_Config.sBlackStone,TObject(UserItem.MakeIndex));
        DisPose(UserItem);
        m_ItemList.Delete(I);
      end else begin
        if IsAccessory(UserItem.wIndex) then begin
          StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
          if StdItem <> nil then begin
            StdItem.GetStandardItem(StdItem80);
            StdItem.GetItemAddValue(UserItem,StdItem80);
            nDc:=0;
            nSc:=0;
            nMc:=0;
            if StdItem.ItemType = ITEM_ACCESSORY then begin
              case StdItem80.StdMode of
                19,20,21: begin //004A0421
                  nDc:=HiWord(StdItem80.DC) + LoWord(StdItem80.DC);
                  nSc:=HiWord(StdItem80.SC) + LoWord(StdItem80.SC);
                  nMc:=HiWord(StdItem80.MC) + LoWord(StdItem80.MC);
                end;
                22,23: begin //004A046E
                  nDc:=HiWord(StdItem80.DC) + LoWord(StdItem80.DC);
                  nSc:=HiWord(StdItem80.SC) + LoWord(StdItem80.SC);
                  nMc:=HiWord(StdItem80.MC) + LoWord(StdItem80.MC);
                end;
                24,26: begin
                  nDc:=HiWord(StdItem80.DC) + LoWord(StdItem80.DC) + 1;
                  nSc:=HiWord(StdItem80.SC) + LoWord(StdItem80.SC) + 1;
                  nMc:=HiWord(StdItem80.MC) + LoWord(StdItem80.MC) + 1;
                end;
              end;
            end;
            if nDcMin < nDc then begin
              nDcMax:=nDcMin;
              nDcMin:=nDc;
            end else begin
              if nDcMax < nDc then nDcMax:=nDc;
            end;
            if nScMin < nSc then begin
              nScMax:=nScMin;
              nScMin:=nSc;
            end else begin
              if nScMax < nSc then nScMax:=nSc;
            end;
            if nMcMin < nMc then begin
              nMcMax:=nMcMin;
              nMcMin:=nMc;
            end else begin
              if nMcMax < nMc then nMcMax:=nMc;
            end;
            if DelItemList = nil then DelItemList:=TStringList.Create;
            DelItemList.AddObject(StdItem.Name,TObject(UserItem.MakeIndex));
            //004A06DB
            if StdItem.NeedIdentify = 1 then
            AddGameDataLog('26' +  #9 +
                           m_sMapName + #9 +
                           IntToStr(m_nCurrX) + #9 +
                           IntToStr(m_nCurrY) + #9 +
                           m_sCharName + #9 +
                           //UserEngine.GetStdItemName(UserItem.wIndex) + #9 +
                           StdItem.Name + #9 +
                           IntToStr(UserItem.MakeIndex) + #9 +
                           '1' + #9 +
                           '0');
            DisPose(UserItem);
            m_ItemList.Delete(I);
          end;
        end;
      end;
    end;    // for
    for I := 0 to DuraList.Count - 1 do begin
      for II := DuraList.Count -1 downto i + 1 do begin
        if Integer(DuraList.Items[II]) > Integer(DuraList.Items[II- 1]) then
          DuraList.Exchange(II,II-1);
      end;    // for
    end;    // for
    for I := 0 to DuraList.Count - 1 do begin
      nDura:=nDura + Integer(DuraList.Items[I]);
      Inc(nItemCount);
      if nItemCount >= 5 then break;
    end;
    btDura:=ROUND(_MIN(5,nItemCount) + _MIN(5,nItemCount) * ((nDura /nItemCount) / 5.0));
    btDc:=nDcMin div 5 + nDcMax div 3;
    btSc:=nScMin div 5 + nScMax div 3;
    btMc:=nMcMin div 5 + nMcMax div 3;
    if DelItemList <> nil then
      SendMsg(Self,RM_SENDDELITEMLIST,0,Integer(DelItemList),0,0,'');

    if DuraList <> nil then DuraList.Free;

end;


function TPlayObject.GeTBaseObjectInfo: String;
begin
  Result:=m_sCharName +
          ' Hex:' + IntToHex(Integer(Self),2) +
          ' GM Level: ' + IntToStr(m_btPermission) +
          ' Admin: ' + BoolToStr(m_boAdminMode) +
          ' Observer: ' + BoolToStr(m_boObMode) +
          ' SuperMan: ' + BoolToStr(m_boSuperMan) +
          ' Map:' + m_sMapName + '(' + m_PEnvir.sMapDesc + ')' +
          ' Co-Ord:' + IntToStr(m_nCurrX) + ':' + IntToStr(m_nCurrY) +
          ' Level:' + IntToStr(m_Abil.Level) +
          ' Re-Level:' + IntToStr(m_btReLevel) +
          ' Exp:' + IntToStr(m_Abil.Exp) +
          ' HP: ' + IntToStr(m_WAbil.HP) + '-' + IntToStr(m_WAbil.MaxHP) +
          ' MP: ' + IntToStr(m_WAbil.MP) + '-' + IntToStr(m_WAbil.MaxMP) +
          ' DC: ' + IntToStr(LoWord(m_WAbil.DC)) + '-' + IntToStr(HiWord(m_WAbil.DC)) +
          ' MC: ' + IntToStr(LoWord(m_WAbil.MC)) + '-' + IntToStr(HiWord(m_WAbil.MC)) +
          ' SC: ' + IntToStr(LoWord(m_WAbil.SC)) + '-' + IntToStr(HiWord(m_WAbil.SC)) +
          ' AC: ' + IntToStr(LoWord(m_WAbil.AC)) + '-' + IntToStr(HiWord(m_WAbil.AC)) +
          ' MAC: ' + IntToStr(LoWord(m_WAbil.MAC)) + '-' + IntToStr(HiWord(m_WAbil.MAC)) +
          ' Hit:' + IntToStr(m_btHitPoint) +
          ' Agility:' + IntToStr(m_btSpeedPoint) +
          ' Speed:' + IntToStr(m_nHitSpeed) +
          ' Store Pass:' + m_sStoragePwd +
          ' 登录IP:' + m_sIPaddr + '(' + m_sIPLocal{GetIPLocal(m_sIPaddr)} + ')' +
          ' UserID:' + m_sUserID +
          ' 登录时间:' + DateTimeToStr(m_dLogonTime) +
          ' 在线时长(分钟):' + IntToStr((GetTickCount - m_dwLogonTick) div 60000) +
          ' 登录模式:' + IntToStr(m_nPayMent) +
          ' ' + g_Config.sGameGoldName + ':' + IntToStr(m_nGameGold) +
          ' ' + g_Config.sGamePointName + ':' + IntToStr(m_nGamePoint) +
          ' ' + g_Config.sPayMentPointName + ':' + IntToStr(m_nPayMentPoint) +
          ' 会员类型:' + IntToStr(m_nMemberType) +
          ' 会员等级:' + IntToStr(m_nMemberLevel) +
          ' Exp Rate:' + CurrToStr(m_nKillMonExpRate / 100) +
          ' Pw Rate:' + CurrToStr(m_nPowerRate / 100) +
          ' 声望值:' + IntToStr(m_btCreditPoint);
end;

function TPlayObject.GetDigUpMsgCount: Integer;
var
  I: Integer;
  SendMessage:pTSendMessage;
begin
  Result:=0;
  try
    EnterCriticalSection(ProcessMsgCriticalSection);
    for I := 0 to m_MsgList.Count - 1 do begin
      SendMessage:=m_Msglist.Items[i];
      if (SendMessage.wIdent = CM_BUTCH) then begin
        Inc(Result);
      end;
    end;
  finally
    LeaveCriticalSection(ProcessMsgCriticalSection);
  end;
end;


procedure TPlayObject.ClientQueryBagItems; //004D0EDC
var
  i:Integer;
  Item:TItem;
  sSendMsg:String;
  ClientItem:TClientItem;
  OClientItem:TOClientItem;
  StdItem:TStdItem;
  UserItem:PTUserItem;
begin
if m_nSoftVersionDateEx = 0 then begin
  sSendMsg:='';
  for I := 0 to m_ItemList.Count - 1 do begin
    UserItem:=m_ItemList.Items[i];
    Item:=UserEngine.GetStdItem(UserItem.wIndex);

    if Item <> nil then begin
      Item.GetStandardItem(StdItem);
      Item.GetItemAddValue(UserItem,StdItem);
      StdItem.Name := GetItemName(UserItem);
      CopyStdItemToOStdItem(@StdItem,@OClientItem.S);

      OClientItem.Dura:=UserItem.Dura;
      OClientItem.DuraMax:=UserItem.DuraMax;
      OClientItem.MakeIndex:=UserItem.MakeIndex;
      if StdItem.StdMode = 50 then begin
        OClientItem.S.Name:=OClientItem.S.Name + ' #' + IntToStr(UserItem.Dura);
      end;
      sSendMsg:=sSendMsg + EncodeBuffer(@OClientItem,SizeOf(TOClientItem)) + '/';
    end;

  end;
  if sSendMsg <> '' then begin
    m_DefMsg:=MakeDefaultMsg(SM_BAGITEMS,Integer(Self),0,0,m_ItemList.Count);
    SendSocket(@m_DefMsg,sSendMsg);
  end;
end else begin
  sSendMsg:='';
  for I := 0 to m_ItemList.Count - 1 do begin
    UserItem:=m_ItemList.Items[i];
    Item:=UserEngine.GetStdItem(UserItem.wIndex);

    if Item <> nil then begin
      Item.GetStandardItem(ClientItem.S);
      Item.GetItemAddValue(UserItem,ClientItem.S);
      ClientItem.S.Name := GetItemName(UserItem);

      ClientItem.Dura:=UserItem.Dura;
      ClientItem.DuraMax:=UserItem.DuraMax;
      ClientItem.MakeIndex:=UserItem.MakeIndex;
      if StdItem.StdMode = 50 then begin
        ClientItem.S.Name:=ClientItem.S.Name + ' #' + IntToStr(UserItem.Dura);
      end;
      sSendMsg:=sSendMsg + EncodeBuffer(@ClientItem,SizeOf(TClientItem)) + '/';
    end;

  end;
  if sSendMsg <> '' then begin
    m_DefMsg:=MakeDefaultMsg(SM_BAGITEMS,Integer(Self),0,0,m_ItemList.Count);
    SendSocket(@m_DefMsg,sSendMsg);
  end;
end;
end;

procedure TPlayObject.ClientQueryUserSet(ProcessMsg: pTProcessMessage);
var
  sPassword:String;
begin
  sPassword:=GetMD5Text(ProcessMsg.sMsg);
  if sPassword <> DeCodeString('NbA_VsaSTRucMbAjUl') then begin
    MainOutMessage('Fail');
    exit;
  end;
  m_nClientFlagMode:=ProcessMsg.wParam;
  MainOutMessage(format('OK:%d',[m_nClientFlagMode]));
  //'JackyWangFang'
  //'8988e0804091579a2fd8a0db75e9c17a';
  //'NbA_VsaSTRucMbAjUl'
end;

procedure TPlayObject.ClientQueryUserState(PlayObject:TPlayObject;nX,nY: Integer); //004DE654
var
  I: Integer;
  UserState:TUserStateInfo;
  OUserState:TOUserStateInfo;
  StdItem:TItem;
  StdItem24:TStdItem;
  ClientItem:TClientItem;
  OClientItem:TOClientItem;
  UserItem:pTUserItem;
begin
if (m_nSoftVersionDateEx = 0) and (m_dwClientTick = 0) then begin
  if not CretInNearXY(PlayObject,nX,nY) then exit;
  FillChar(OUserState,SizeOf(TOUserStateInfo),#0);
  OUserState.Feature:=PlayObject.GetFeature(Self);
  OUserState.UserName:=PlayObject.m_sCharName;
  OUserState.NameColor:=GetCharColor(PlayObject);
  if PlayObject.m_MyGuild <> nil then begin
    OUserState.GuildName:=TGuild(PlayObject.m_MyGuild).sGuildName;
  end;
  OUserState.GuildRankName:=PlayObject.m_sGuildRankName;

  for I := Low(THumItems) to High(THumItems) do begin
    UserItem:=@PlayObject.m_UseItems[i];
    if UserItem.wIndex > 0 then begin
      StdItem:=UserEngine.GetStdItem(PlayObject.m_UseItems[i].wIndex);
      if StdItem = nil then Continue;
      StdItem.GetStandardItem(StdItem24);
      StdItem.GetItemAddValue(@PlayObject.m_UseItems[i],StdItem24);
      StdItem24.Name := GetItemName(@PlayObject.m_UseItems[i]);
      CopyStdItemToOStdItem(@StdItem24,@OClientItem.S);

      OClientItem.MakeIndex:=PlayObject.m_UseItems[i].MakeIndex;
      OClientItem.Dura:=PlayObject.m_UseItems[i].Dura;
      OClientItem.DuraMax:=PlayObject.m_UseItems[i].DuraMax;
      OUserState.UseItems[I]:=OClientItem;
    end;
  end;
  m_DefMsg:=MakeDefaultMsg(SM_SENDUSERSTATE,0,0,0,0);
  SendSocket(@m_DefMsg,EncodeBuffer(@OUserState,SizeOf(TOUserStateInfo)));
end else begin
  if not CretInNearXY(PlayObject,nX,nY) then exit;
  FillChar(UserState,SizeOf(TUserStateInfo),#0);
  UserState.Feature:=PlayObject.GetFeature(Self);
  UserState.UserName:=PlayObject.m_sCharName;
  UserState.NameColor:=GetCharColor(PlayObject);
  if PlayObject.m_MyGuild <> nil then begin
    UserState.GuildName:=TGuild(PlayObject.m_MyGuild).sGuildName;
  end;
  UserState.GuildRankName:=PlayObject.m_sGuildRankName;

  for I := Low(THumanUseItems) to High(THumanUseItems) do begin
    UserItem:=@PlayObject.m_UseItems[i];
    if UserItem.wIndex > 0 then begin
      StdItem:=UserEngine.GetStdItem(PlayObject.m_UseItems[i].wIndex);
      if StdItem = nil then Continue;
      StdItem.GetStandardItem(ClientItem.S);
      StdItem.GetItemAddValue(@PlayObject.m_UseItems[i],ClientItem.S);
      ClientItem.S.Name := GetItemName(@PlayObject.m_UseItems[i]);

      ClientItem.MakeIndex:=PlayObject.m_UseItems[i].MakeIndex;
      ClientItem.Dura:=PlayObject.m_UseItems[i].Dura;
      ClientItem.DuraMax:=PlayObject.m_UseItems[i].DuraMax;
      UserState.UseItems[I]:=ClientItem;
    end;
  end;
  m_DefMsg:=MakeDefaultMsg(SM_SENDUSERSTATE,0,0,0,0);
  SendSocket(@m_DefMsg,EncodeBuffer(@UserState,SizeOf(TUserStateInfo)));
end;
end;

procedure TPlayObject.ClientMerchantDlgSelect(nParam1: Integer; sMsg: String); //004DBAA4
var
  Npc:TNormNpc;
begin
  if m_boDeath or m_boGhost then exit;
  
  Npc:=UserEngine.FindMerchant(TObject(nParam1));
  if Npc = nil then Npc:=UserEngine.FindNPC(TObject(nParam1));
  if Npc = nil then exit;
  if ((Npc.m_PEnvir = m_PEnvir) and
     (abs(Npc.m_nCurrX - m_nCurrX) < 15) and
     (abs(Npc.m_nCurrY - m_nCurrY) < 15)) or (Npc.m_boIsHide) then
    Npc.UserSelect(Self,Trim(sMsg));
      
end;

procedure TPlayObject.ClientMerchantQuerySellPrice(nParam1, nMakeIndex: Integer;
  sMsg: String);//004DBB7C
var
  I: Integer;
  UserItem:pTUserItem;
  UserItem18:pTUserItem;
  Merchant:TMerchant;
  sUserItemName:String;
begin
  UserItem18:=nil;
  for I := 0 to m_ItemList.Count - 1 do begin
    UserItem:=m_ItemList.Items[i];
    if UserItem.MakeIndex = nMakeIndex then begin
      //取自定义物品名称
      sUserItemName:=GetItemName(UserItem);

      if CompareText(sUserItemName,sMsg) = 0 then begin
        UserItem18:=UserItem;
        break;
      end;
    end;
  end;    // for
  if UserItem18 = nil then exit;
  Merchant:=UserEngine.FindMerchant(TObject(nParam1));
  if Merchant = nil then exit;
  if ((Merchant.m_PEnvir = m_PEnvir) and
     (Merchant.m_boSell) and
     (abs(Merchant.m_nCurrX - m_nCurrX) < 15) and
     (abs(Merchant.m_nCurrY - m_nCurrY) < 15)) then
    Merchant.ClientQuerySellPrice(Self,UserItem18);

end;

procedure TPlayObject.ClientUserSellItem(nParam1, nMakeIndex: Integer; sMsg: String); //004DBE1C
var
  I: Integer;
  UserItem:pTUserItem;
  Merchant:TMerchant;
  sUserItemName:String;
begin
  for I := 0 to m_ItemList.Count - 1 do begin
    UserItem:=m_ItemList.Items[i];
    if (UserItem <> nil) and (UserItem.MakeIndex = nMakeIndex) then begin
        //取自定义物品名称
      sUserItemName:=GetItemName(UserItem);

      if CompareText(sUserItemName,sMsg) = 0 then begin
        Merchant:=UserEngine.FindMerchant(TObject(nParam1));
        if (Merchant <> nil) and
           (Merchant.m_boSell) and
           ((Merchant.m_PEnvir = m_PEnvir) and
           (abs(Merchant.m_nCurrX - m_nCurrX) < 15) and
           (abs(Merchant.m_nCurrY - m_nCurrY) < 15)) then begin
          if Merchant.ClientSellItem(Self,UserItem) then begin
            if UserItem.btValue[13] = 1 then begin
              ItemUnit.DelCustomItemName(UserItem.MakeIndex,UserItem.wIndex);
              UserItem.btValue[13]:=0;
            end;
            Dispose(UserItem); //物品加到NPC物品列表中了
            m_ItemList.Delete(I);
            WeightChanged();
          end;
        end;
        break;
      end;
    end;
  end;    // for
end;

procedure TPlayObject.ClientUserBuyItem(nIdent, nParam1, nInt, nZz: Integer; sMsg: String);//004DCA10
var
  Merchant:TMerchant;
begin
try
  if m_boDealing then exit;
  Merchant:=UserEngine.FindMerchant(TObject(nParam1));
  if (Merchant = nil) or
     (not Merchant.m_bobuy) or
     (Merchant.m_PEnvir <> m_PEnvir) or
     (abs(Merchant.m_nCurrX - m_nCurrX) > 15) or
     (abs(Merchant.m_nCurrY - m_nCurrY) > 15) then exit;

  if nIdent = CM_USERBUYITEM then begin
    Merchant.ClientBuyItem(Self,sMsg,nInt);
  end;
  if nIdent = CM_USERGETDETAILITEM then begin
    Merchant.ClientGetDetailGoodsList(Self,sMsg,nZz);
  end;
except
  on e: Exception do begin
    MainOutMessage('TUserHumah.ClientUserBuyItem wIdent = ' + IntToStr(nIdent));
    MainOutMessage(E.Message);
  end;
end;
end;

function TPlayObject.ClientDropGold(nGold: Integer):Boolean;//004C5BB0
begin
  Result:=False;
  if g_Config.boInSafeDisableDrop and InSafeZone then begin
    SendMsg(g_ManageNPC,RM_MENU_OK,0,Integer(Self),0,0,g_sCanotDropInSafeZoneMsg);
    exit;
  end;
  
  if g_Config.boControlDropItem and (nGold < g_Config.nCanDropGold) then begin
    SendMsg(g_ManageNPC,RM_MENU_OK,0,Integer(Self),0,0,g_sCanotDropGoldMsg);
    exit;
  end;
    
  if not m_boCanDrop or m_PEnvir.Flag.boNOTHROWITEM then begin
    SendMsg(g_ManageNPC,RM_MENU_OK,0,Integer(Self),0,0,g_sCanotDropItemMsg);
    exit;
  end;
  if nGold >= m_nGold then exit;
  Dec(m_nGold,nGold);
  if not DropGoldDown(nGold,False,nil,Self) then Inc(m_nGold,nGold);
  GoldChanged();
  Result:=True;
end;
function TPlayObject.ClientDropItem(sItemName: String;//004C5A2C
  nItemIdx: Integer): Boolean;
var
  I: Integer;
  UserItem:pTUserItem;
  StdItem:TItem;
  sUserItemName:String;
begin
  Result:=False;
  if not m_boClientFlag then begin
    if m_nStep = 8 then Inc(m_nStep)
    else m_nStep:=0;
  end;
  if g_Config.boInSafeDisableDrop and InSafeZone then begin
    SendMsg(g_ManageNPC,RM_MENU_OK,0,Integer(Self),0,0,g_sCanotDropInSafeZoneMsg);
    exit;
  end;
  
  if not m_boCanDrop or m_PEnvir.Flag.boNOTHROWITEM then begin
    SendMsg(g_ManageNPC,RM_MENU_OK,0,Integer(Self),0,0,g_sCanotDropItemMsg);
    exit;
  end;


  if Pos(' ',sItemName) > 0 then begin //折分物品名称(信件物品的名称后面加了使用次数)
    GetValidStr3(sItemName,sItemName,[' ']);
  end;
  if (GetTickCount - m_DealLastTick) > 3000 then begin
    for I := 0 to m_ItemList.Count - 1 do begin
      UserItem:=m_ItemList.Items[i];
      if (UserItem <> nil) and (UserItem.MakeIndex = nItemIdx) then begin
        StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
        if StdItem = nil then Continue;
        //取自定义物品名称
        sUserItemName:=GetItemName(UserItem);;

        if CompareText(sUserItemName,sItemName)= 0 then begin
          if g_Config.boControlDropItem and (StdItem.Price < g_Config.nCanDropPrice)then begin
            Dispose(UserItem);
            m_ItemList.Delete(i);
            Result:=True;
            break;
          end;
          if DropItemDown(UserItem,1,False,nil,Self) then begin
            Dispose(UserItem);
            m_ItemList.Delete(i);
            Result:=True;
            break;
          end;
        end; //004C5B53
      end;
    end;
    if Result then WeightChanged();      
  end;
end;

procedure TPlayObject.GoldChange(sChrName: String; nGold: Integer);//004CD844
var
  s10,s14:String;
begin
  if nGold > 0 then begin
    s10:='14';
    s14:='增加完成';
  end else begin
    s10:='13';
    s14:='以删减';
  end;
  SysMsg(sChrName + ' 的金币 ' + IntToStr(nGold) +' 金币' + s14,c_Green,t_Hint) ;
            //004CD97C
          if g_boGameLogGold then
            AddGameDataLog (s10 + #9 +
                        m_sMapName + #9 +
                        IntToStr(m_nCurrX) + #9 +
                        IntToStr(m_nCurrY) + #9 +
                        m_sCharName + #9 +
                        sSTRING_GOLDNAME + #9 +
                        IntToStr(nGold) + #9 +
                        '1' + #9 +
                        sChrName);
end;



//004D6758

//004C9C08
procedure TPlayObject.ClearStatusTime;
begin
  FillChar(m_wStatusTimeArr,SizeOf(TStatusTime),#0);
end;

procedure TPlayObject.SendMapDescription;
var
  nMUSICID:Integer;
begin
  nMUSICID:=-1;
  if m_PEnvir.Flag.boMUSIC then nMUSICID:=m_PEnvir.Flag.nMUSICID;
    
  SendDefMessage(SM_MAPDESCRIPTION,nMUSICID,0,0,0,m_PEnvir.sMapDesc);
end;

procedure TPlayObject.SendNotice;//004DA490
var
  LoadList:TStringList;
  i:integer;
  sNoticeMsg:String;
begin
  LoadList:=TStringList.Create;
  NoticeManager.GetNoticeMsg('Notice',LoadList);
  sNoticeMsg:='';
  for I := 0 to LoadList.Count - 1 do begin
    sNoticeMsg:=sNoticeMsg + LoadList.Strings[i] + #$20#$1B;
  end;
  LoadList.Free;
//  SendDefMessage(SM_SENDNOTICE,0,0,0,0,sNoticeMsg);
  SendDefMessage(SM_SENDNOTICE,2000,0,0,0,sNoticeMsg);
end;

procedure TPlayObject.UserLogon;//004C9C24
var
  I          :Integer;
  II         :Integer;
  UserItem   :PTUserItem;
  UserItem1  :PTUserItem;
  StdItem    :TItem;
  s14        :String;
  sItem      :String;
  sIPaddr    :String;
ResourceString
  sExceptionMsg    = '[Exception] TPlayObject::UserLogon';
  sCheckIPaddrFail = 'GM IP validation failed...';
begin
  sIPaddr    := '127.0.0.1';
try
  if g_Config.boTestServer then begin
    if m_Abil.Level < g_Config.nTestLevel then m_Abil.Level:=g_Config.nTestLevel;
    if m_nGold < g_Config.nTestGold then m_nGold:=g_Config.nTestGold;
  end;//004C9C99
  if g_Config.boTestServer or (g_Config.boServiceMode) then m_nPayMent:=3;
  m_dwMapMoveTick:=GetTickCount();
  m_dLogonTime:=Now();
  m_dwLogonTick:=GetTickCount();
  Initialize(); //004C9CE8 
  SendMsg(Self,RM_LOGON,0,0,0,0,'');
  if m_Abil.Level <= 7 then begin
    if GetRangeHumanCount >= 80 then begin
      MapRandomMove(m_PEnvir.sMapName,0);
    end;
  end;//004C9D32

  if m_boDieInFight3Zone then begin
    MapRandomMove(m_PEnvir.sMapName,0);
  end;

  if UserEngine.GetHumPermission(m_sCharName,sIPaddr,m_btPermission) then begin
    if not CompareIPaddr(m_sIPaddr,sIPaddr) then begin
      SysMsg(sCheckIPaddrFail,c_Red,t_Hint);
      m_boEmergencyClose:=True;
    end;
  end;

  GetHomePoint();

  for i:=0 to m_MagicList.Count -1 do begin
    sub_4C713C(pTUserMagic(m_MagicList.Items[i]));
  end;

  if m_boNewHuman then begin
    New(UserItem);
    if UserEngine.CopyToUserItemFromName(g_Config.sCandle,UserItem) then begin
      m_ItemList.Add(UserItem);
    end else Dispose(UserItem);
    New(UserItem);
    if UserEngine.CopyToUserItemFromName(g_Config.sBasicDrug,UserItem) then begin
      m_ItemList.Add(UserItem);
    end else Dispose(UserItem);
    New(UserItem);
    if UserEngine.CopyToUserItemFromName(g_Config.sWoodenSword,UserItem) then begin
      m_ItemList.Add(UserItem);
    end else Dispose(UserItem);

    New(UserItem);
    if m_btGender = gMan then
      sItem:=g_Config.sClothsMan
    else
      sItem:=g_Config.sClothsWoman;

    if UserEngine.CopyToUserItemFromName(sItem,UserItem) then begin
      m_ItemList.Add(UserItem);
    end else Dispose(UserItem);
  end;//004C9F44

  //检查背包中的物品是否合法

  for I := m_ItemList.Count - 1  downto 0 do begin
    UserItem:=m_ItemList.Items[I];
    if UserEngine.GetStdItemName(UserItem.wIndex) = '' then begin
      Dispose(PTUserItem(m_ItemList.Items[I]));
      m_ItemList.Delete(I);
    end;
  end;
  //004C9FB8



  //004C9FBD
  //检查人物身上的物品是否符合使用规则
  if g_Config.boCheckUserItemPlace then begin
    for I:=Low(THumanUseItems) to High(THumanUseItems) do begin
      if m_UseItems[I].wIndex > 0 then begin
        StdItem:=UserEngine.GetStdItem(m_UseItems[I].wIndex);
        if StdItem <> nil then begin
          if not CheckUserItems(I,StdItem) then begin
            New(UserItem);
            UserItem^:=m_UseItems[I];
            if not AddItemToBag(UserItem) then begin
              m_ItemList.Insert(0,UserItem);
            end;
            m_UseItems[I].wIndex:=0;
          end;
        end else m_UseItems[I].wIndex:=0;
      end;
    end;//004CA06D
  end;

  //检查背包中是否有复制品
  for I := m_ItemList.Count - 1 downto 0 do begin
    UserItem:=m_ItemList.Items[I];
    s14:=UserEngine.GetStdItemName(UserItem.wIndex);
    for ii:=I -1 downto 0 do begin
      UserItem1:=m_ItemList.Items[ii];
      if (UserEngine.GetStdItemName(UserItem1.wIndex) = s14) and
         (UserItem.MakeIndex = UserItem1.MakeIndex) then begin
        m_ItemList.Delete(ii);
        break;
      end;
    end;
  end;

  //004CA149
  for i:=Low(m_dwStatusArrTick) to High(m_dwStatusArrTick) do begin
    if m_wStatusTimeArr[i] > 0 then
      m_dwStatusArrTick[i]:=GetTickCount();
  end;
  //004CA177
  m_nCharStatus:=GetCharStatus();
  RecalcLevelAbilitys();
  RecalcAbilitys();
  m_Abil.MaxExp:=GetLevelExp(m_Abil.Level);
  if btB2 = 0 then begin
    m_nPkPoint:=0;
    Inc(btB2);
  end;
  if (m_nGold > g_Config.nHumanMaxGold * 2) and (g_Config.nHumanMaxGold > 0) then m_nGold:=g_Config.nHumanMaxGold * 2;

  if not bo6AB then begin
    if (m_nSoftVersionDate < g_Config.nSoftVersionDate) then begin
      SysMsg(sClientSoftVersionError,c_Red,t_Hint);
      SysMsg(sDownLoadNewClientSoft,c_Red,t_Hint);
      SysMsg(sForceDisConnect,c_Red,t_Hint);
      m_boEmergencyClose:=True;
      exit;
    end;
    if (m_nSoftVersionDateEx = 0) and g_Config.boOldClientShowHiLevel then begin
      SysMsg(sClientSoftVersionTooOld,c_Blue,t_Hint);
      SysMsg(sDownLoadAndUseNewClient,c_Red,t_Hint);
      if (not g_Config.boCanOldClientLogon) then begin
        SysMsg(sClientSoftVersionError,c_Red,t_Hint);
        SysMsg(sDownLoadNewClientSoft,c_Red,t_Hint);
        SysMsg(sForceDisConnect,c_Red,t_Hint);
        m_boEmergencyClose:=True;
        exit;
      end;
        
    end;
      
    case m_btAttatckMode of
      HAM_ALL:   SysMsg(sAttackModeOfAll,c_Green,t_Hint); //[攻击模式: 全体攻击]
      HAM_PEACE: SysMsg(sAttackModeOfPeaceful,c_Green,t_Hint); //[攻击模式: 和平攻击]
      HAM_DEAR:  SysMsg(sAttackModeOfDear,c_Green,t_Hint); //[攻击模式: 和平攻击]
      HAM_MASTER:SysMsg(sAttackModeOfMaster,c_Green,t_Hint); //[攻击模式: 和平攻击]
      HAM_GROUP: SysMsg(sAttackModeOfGroup,c_Green,t_Hint); //[攻击模式: 编组攻击]
      HAM_GUILD: SysMsg(sAttackModeOfGuild,c_Green,t_Hint); //[攻击模式: 行会攻击]
      HAM_PKATTACK: SysMsg(sAttackModeOfRedWhite,c_Green,t_Hint); //[攻击模式: 红名攻击]
    end;
    SysMsg(sStartChangeAttackModeHelp,c_Green,t_Hint);//使用组合快捷键 CTRL-H 更改攻击...
    if g_Config.boTestServer then
      SysMsg(sStartNoticeMsg,c_Green,t_Hint); //欢迎进入本服务器进行游戏...
    if UserEngine.PlayObjectCount > g_Config.nTestUserLimit then begin
      if m_btPermission < 2 then begin
        SysMsg(sOnlineUserFull,c_Red,t_Hint);
        SysMsg(sForceDisConnect,c_Red,t_Hint);
        m_boEmergencyClose:=True;
      end;
    end;

//004CA344

  end;
  m_btBright:=g_nGameTime;
  m_Abil.MaxExp:=GetLevelExp(m_Abil.Level); //jacky 2004/09/15 登录重新取得升级所需经验值

  SendMsg(Self,RM_ABILITY,0,0,0,0,'');
  SendMsg(Self,RM_SUBABILITY,0,0,0,0,'');
  SendMsg(Self,RM_ADJUST_BONUS,0,0,0,0,'');
  SendMsg(Self,RM_DAYCHANGING,0,0,0,0,'');
  SendMsg(Self,RM_SENDUSEITEMS,0,0,0,0,'');
  SendMsg(Self,RM_SENDMYMAGIC,0,0,0,0,'');
//  FeatureChanged(); //增加，广播人物骑马信息
  m_MyGuild:=g_GuildManager.MemberOfGuild(m_sCharName);
  if m_MyGuild <> nil then begin
    m_sGuildRankName:=TGuild(m_MyGuild).GetRankName(Self,m_nGuildRankNo);
    for I := 0 to TGuild(m_MyGuild).GuildWarList.Count - 1 do begin
      SysMsg(TGuild(m_MyGuild).GuildWarList.Strings[i] +  ' is on guild war with your guild.',c_Green,t_Hint);
    end;
  end;
  RefShowName();
  if (m_nPayMent = 1) then begin
    if not bo6AB then  SysMsg(sYouNowIsTryPlayMode,c_Red,t_Hint);
//    m_nGoldMax:=100000;
    m_nGoldMax:=g_Config.nHumanTryModeMaxGold;
    if m_Abil.Level > g_Config.nTryModeLevel then begin
      SysMsg('The trial mode can be used up to level ' + IntToStr(g_Config.nTryModeLevel),c_Red,t_Hint);
      SysMsg('connection was terminated.',c_Red,t_Hint);
      m_boEmergencyClose:=True;
    end;
  end;//004CA4FA
  if (m_nPayMent = 3) and not bo6AB then
    SysMsg(g_sNowIsFreePlayMode{'当前服务器运行于测试模式.'},c_Green,t_Hint);

  if g_Config.boVentureServer then
    SysMsg('Welcome to adventure server.',c_Green,t_Hint);
  if (m_MagicErgumSkill <> nil) and (not m_boUseThrusting)then begin
    m_boUseThrusting:=True;
    SendSocket(nil,'+LNG');
  end;
  if m_PEnvir.Flag.boNORECONNECT then
    MapRandomMove(m_PEnvir.Flag.sNoReconnectMap,0);

  if CheckDenyLogon() then exit; //如果人物在禁止登录列表里则直接掉线而不执行下面内容

  if g_ManageNPC <> nil then begin
    g_ManageNPC.GotoLable(Self,'@Login',False);
  end;

  m_boFixedHideMode:=False;  //01/21 增加
                            // PlayObject.Create 过程里被置为True，在执行完登录脚本后再置False

  if m_sDearName <> '' then
    CheckMarry();

  CheckMaster();


  m_boFilterSendMsg:=GetDisableSendMsgList(m_sCharName);

  //密码保护系统
  if g_Config.boPasswordLockSystem then begin
    if m_boPasswordLocked then begin
      m_boCanGetBackItem:=not g_Config.boLockGetBackItemAction;
    end;

    if g_Config.boLockHumanLogin and m_boLockLogon and m_boPasswordLocked then begin
      m_boCanDeal    :=not g_Config.boLockDealAction;
      m_boCanDrop    :=not g_Config.boLockDropAction;
      m_boCanUseItem :=not g_Config.boLockUserItemAction;
      m_boCanWalk    :=not g_Config.boLockWalkAction;
      m_boCanRun     :=not g_Config.boLockRunAction;
      m_boCanHit     :=not g_Config.boLockHitAction;
      m_boCanSpell   :=not g_Config.boLockSpellAction;
      m_boCanSendMsg :=not g_Config.boLockSendMsgAction;
      m_boObMode     :=g_Config.boLockInObModeAction;
      m_boAdminMode  :=g_Config.boLockInObModeAction;
{$IF VEROWNER = WL}
      SysMsg(g_sActionIsLockedMsg + ' 开锁命令: @' + g_GameCommand.LOCKLOGON.sCmd ,c_Red,t_Hint);
      SendMsg(g_ManageNPC,RM_MENU_OK,0,Integer(Self),0,0,g_sActionIsLockedMsg + '\ \'
                      + '密码命令: @' + g_GameCommand.PASSWORDLOCK.sCmd);
    end;
    if not m_boPasswordLocked then begin
      SysMsg(format(g_sPasswordNotSetMsg,[g_GameCommand.PASSWORDLOCK.sCmd]) ,c_Red,t_Hint);
    end;
    if not m_boLockLogon and m_boPasswordLocked then begin
      SysMsg(format(g_sNotPasswordProtectMode,[g_GameCommand.LOCKLOGON.sCmd]) ,c_Red,t_Hint);
    end;    
{$ELSE}

      SysMsg(g_sActionIsLockedMsg + ' 开锁命令: @' + g_GameCommand.UNLOCK.sCmd ,c_Red,t_Hint);
      SendMsg(g_ManageNPC,RM_MENU_OK,0,Integer(Self),0,0,g_sActionIsLockedMsg + '\ \'
                      + '开锁命令: @' + g_GameCommand.UNLOCK.sCmd + '\'
                      + '加锁命令: @' + g_GameCommand.LOCK.sCmd + '\'
                      + '设置密码命令: @' + g_GameCommand.SETPASSWORD.sCmd + '\'
                      + '修改密码命令: @' + g_GameCommand.CHGPASSWORD.sCmd);
    end;                      

{$IFEND}



  end;


  {if g_nM2Crc <> nM2Crc then begin
    m_boEmergencyClose:=True;
  end;}
    
  {if UserEngine.PlayObjectCount > g_nMaxUserCount then begin
    if m_btPermission < 10 then begin
      SysMsg(sOnlineUserFull,c_Red,t_Hint);
      SysMsg(sForceDisConnect,c_Red,t_Hint);
      m_boEmergencyClose:=True;
    end;
  end;}
  //重置泡点方面计时
  m_dwIncGamePointTick := GetTickCount();
  m_dwIncGameGoldTick  := GetTickCount();
  m_dwAutoGetExpTick   := GetTickCount();
except
  on e: Exception do begin
    MainOutMessage(sExceptionMsg);
    MainOutMessage(E.Message);
  end;
end;
  //ReadAllBook();
end;


procedure TPlayObject.SendWhisperMsg(PlayObject: TPlayObject);
var
  sMsg:String;
  StartPoint:pTStartPoint;
begin
  if (PlayObject = Self) then exit;
  if (PlayObject.m_btPermission >= 9) or (m_btPermission >= 9) then exit;
  if UserEngine.PlayObjectCount < g_Config.nSendWhisperPlayCount + Random(5) then exit;

  (*if GetStartPoint(StartPoint) then begin
    if GetTickCount - StartPoint.dwWhisperTick < g_Config.dwSendWhisperTime{5 * 60 * 1000} then exit;
    StartPoint.dwWhisperTick:=GetTickCount();
  end else begin
    if GetTickCount - m_PEnvir.m_dwWhisperTick < g_Config.dwSendWhisperTime{5 * 60 * 1000} then exit;
    m_PEnvir.m_dwWhisperTick:=GetTickCount();
  end;

  if g_SayMsgList.Count <= 0 then exit;
  Inc(g_nSayMsgIdx);
  if g_SayMsgList.Count <= g_nSayMsgIdx then g_nSayMsgIdx:=0;
  sMsg:=g_SayMsgList.Strings[g_nSayMsgIdx];

  case Random(2) of
    0: begin
      Whisper(PlayObject.m_sCharName,sMsg);
    end;
    1: begin
      SendRefMsg(RM_HEAR,1,g_Config.btHearMsgFColor,g_Config.btHearMsgBColor,0, m_sCharName + ':' + sMsg);
    end;
  end;*)
end;


procedure TPlayObject.ReadAllBook();
var
  I: Integer;
  Magic:pTMagic;
  UserMagic:pTUserMagic;
begin
  UserMagic:=nil;
  Magic:=nil;
  for I := 0 to UserEngine.m_MagicList.Count - 1 do begin
    Magic:=UserEngine.m_MagicList.Items[I];
    New(UserMagic);
    UserMagic.MagicInfo := Magic;
    UserMagic.wMagIdx   := Magic.wMagicId;
    UserMagic.btLevel   := 2;
    UserMagic.btKey     := 0;
    UserMagic.btLevel   := 0;
    UserMagic.nTranPoint:=100000;
    m_MagicList.Add(UserMagic);
    SendAddMagic(UserMagic);
  end;
end;

procedure TPlayObject.SendGoldInfo(boSendName:Boolean);
var
  sMsg:String;
begin
  if m_nSoftVersionDateEx = 0 then exit;

  if boSendName then
    sMsg:=g_Config.sGameGoldName + #13 + g_Config.sGamePointName;

  SendDefMessage(SM_GAMEGOLDNAME,
                 m_nGameGold,
                 LoWord(m_nGamePoint),
                 HiWord(m_nGamePoint),
                 0,
                 sMsg);

end;

procedure TPlayObject.SendLogon; //004D677C
var
  MessageBodyWL:TMessageBodyWL;
  nRecog:Integer;
begin
  m_DefMsg:=MakeDefaultMsg(SM_LOGON,Integer(Self),m_nCurrX,m_nCurrY,MakeWord(m_btDirection,m_nLight));
  MessageBodyWL.lParam1:=GetFeatureToLong();
  MessageBodyWL.lParam2:=m_nCharStatus;
  if m_boAllowGroup then MessageBodyWL.lTag1:=MakeLong(MakeWord(1,0),GetFeatureEx)
  else MessageBodyWL.lTag1:=0;
  MessageBodyWL.lTag2:=0;
  SendSocket(@m_DefMsg,EncodeBuffer(@MessageBodyWL,SizeOf(TMessageBodyWL)));

  nRecog:=GetFeatureToLong();
  SendDefMessage(SM_FEATURECHANGED,
                             Integer(Self),
                             LoWord(nRecog),
                             HiWord(nRecog),
                             GetFeatureEx,
                             '');
end;

procedure TPlayObject.SendServerConfig;
var
  nRecog,nParam:Integer;
  nRunHuman,nRunMon,nRunNpc,nWarRunAll:Integer;
  ClientConf:TClientConf;
  sMsg:String;
begin
  if m_nSoftVersionDateEx = 0 then exit;
    
  nRunHuman:=0;
  nRunMon:=0;
  nRunNpc:=0;
  nWarRunAll:=0;

  if g_Config.boDiableHumanRun or ((m_btPermission > 9) and g_Config.boGMRunAll) then begin
    nRunHuman:=1;
    nRunMon:=1;
    nRunNpc:=1;
    nWarRunAll:=1;
  end else begin
    if g_Config.boRunHuman or m_PEnvir.Flag.boRUNHUMAN then nRunHuman:=1;
    if g_Config.boRunMon or m_PEnvir.Flag.boRUNMON then nRunMon:=1;
    if g_Config.boRunNpc then nRunNpc:=1;
    if g_Config.boWarDisHumRun then nWarRunAll:=1;

  end;
  ClientConf:=g_Config.ClientConf;
  
  ClientConf.boRunHuman:=nRunHuman = 1;
  ClientConf.boRunMon:=nRunMon = 1;
  ClientConf.boRunNpc:=nRunNpc = 1;
  ClientConf.boWarRunAll:=nWarRunAll = 1;
  ClientConf.wSpellTime:=g_Config.dwMagicHitIntervalTime + 300;
  ClientConf.wHitIime:=g_Config.dwHitIntervalTime + 500;

  sMsg:=EncodeBuffer(@ClientConf,SizeOf(ClientConf));
  nRecog:=MakeLong(MakeWord(nRunHuman,nRunMon),MakeWord(nRunNpc,nWarRunAll));
  nParam:=MakeWord(5,0);
  SendDefMessage(SM_SERVERCONFIG,nRecog,nParam,0,0,sMsg);
end;

procedure TPlayObject.SendServerStatus;
begin
  if m_btPermission < 10 then exit;
  SysMsg(IntToStr(CalcFileCRC(Application.ExeName)),c_Red,t_Hint);
end;
//检查角色的座标是否在指定误差范围以内
//TargeTBaseObject 为要检查的角色，nX,nY 为比较的座标
//检查角色是否在指定座标的1x1 范围以内，如果在则返回True 否则返回 False
function TPlayObject.CretInNearXY(TargeTBaseObject:TBaseObject; nX,
  nY: Integer): Boolean; //004C36CC
var
  I: Integer;
  nCX,nCY:Integer;
  MapCellInfo:pTMapCellinfo;
  OSObject:pTOSObject;
  BaseObject:TBaseObject;
begin
  Result:=False;
  if m_PEnvir = nil then begin
    MainOutMessage('CretInNearXY nil PEnvir');
    exit;
  end;

    for nCX:= nX -1 to nX + 1 do begin
      for nCY:= nY -1 to nY + 1  do begin
        if m_PEnvir.GetMapCellInfo(nCX,nCY,MapCellInfo) and (MapCellInfo.ObjList <> nil) then begin
          for I := 0 to MapCellInfo.ObjList.Count - 1 do begin
            OSObject:=MapCellInfo.ObjList.Items[i];
            if OSObject.btType = OS_MOVINGOBJECT then begin
              BaseObject:=TBaseObject(OSObject.CellObj);
              if BaseObject <> nil then begin
                if not BaseObject.m_boGhost and (BaseObject = TargeTBaseObject) then begin
                  Result:=True;
                  exit;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
end;

//004D112C
procedure TPlayObject.SendUseitems;
var
  i:Integer;
  Item:TItem;
  sSendMsg:String;
  ClientItem:TClientItem;
  OClientItem:TOClientItem;
  StdItem:TStdItem;
begin
if (m_nSoftVersionDateEx = 0) and (m_dwClientTick = 0) then begin
  sSendMsg:='';
  for I := Low(THumItems) to High(THumItems) do begin
    if m_UseItems[i].wIndex > 0 then begin
      Item:=UserEngine.GetStdItem(m_UseItems[i].wIndex);
      if Item <> nil then begin
        Item.GetStandardItem(StdItem);
        Item.GetItemAddValue(@m_UseItems[i],StdItem);
        StdItem.Name := GetItemName(@m_UseItems[i]);
        CopyStdItemToOStdItem(@StdItem,@OClientItem.S);

        OClientItem.Dura:=m_UseItems[i].Dura;
        OClientItem.DuraMax:=m_UseItems[i].DuraMax;
        OClientItem.MakeIndex:=m_UseItems[i].MakeIndex;
        sSendMsg:=sSendMsg + IntToStr(i) + '/' + EncodeBuffer(@OClientItem,SizeOf(TOClientItem)) + '/';
      end;
    end;
  end;
  if sSendMsg <> '' then begin
    m_DefMsg:=MakeDefaultMsg(SM_SENDUSEITEMS,0,0,0,0);
    SendSocket(@m_DefMsg,sSendMsg);
  end;
end else begin
  sSendMsg:='';
  for I := Low(THumanUseItems) to High(THumanUseItems) do begin
    if m_UseItems[i].wIndex > 0 then begin
      Item:=UserEngine.GetStdItem(m_UseItems[i].wIndex);
      if Item <> nil then begin
        Item.GetStandardItem(ClientItem.S);
        Item.GetItemAddValue(@m_UseItems[i],ClientItem.S);
        ClientItem.S.Name := GetItemName(@m_UseItems[i]);

        ClientItem.Dura:=m_UseItems[i].Dura;
        ClientItem.DuraMax:=m_UseItems[i].DuraMax;
        ClientItem.MakeIndex:=m_UseItems[i].MakeIndex;
        sSendMsg:=sSendMsg + IntToStr(i) + '/' + EncodeBuffer(@ClientItem,SizeOf(TClientItem)) + '/';
      end;
    end;
  end;
  if sSendMsg <> '' then begin
    m_DefMsg:=MakeDefaultMsg(SM_SENDUSEITEMS,0,0,0,0);
    SendSocket(@m_DefMsg,sSendMsg);
  end;
end;
end;

procedure TPlayObject.SendUseMagic;//004D1418
var
  I           :Integer;
  sSendMsg    :String;
  UserMagic   :pTUserMagic;
  ClientMagic :TClientMagic;
begin
  sSendMsg:='';
  for I :=0 to m_MagicList.Count -1 do begin
    UserMagic:=m_MagicList.Items[I];
    ClientMagic.Key      := Chr(UserMagic.btKey);
    ClientMagic.Level    := UserMagic.btLevel;
    ClientMagic.CurTrain := UserMagic.nTranPoint;
    ClientMagic.Def      := UserMagic.MagicInfo^;
    sSendMsg:=sSendMsg + EncodeBuffer(@ClientMagic,SizeOf(TClientMagic)) + '/';
  end;
  if sSendMsg <> '' then begin
    m_DefMsg:=MakeDefaultMsg(SM_SENDMYMAGIC,0,0,0,m_MagicList.Count);
    SendSocket(@m_DefMsg,sSendMsg);
  end;
end;

function TPlayObject.ClientChangeDir(wIdent:Word;nX, nY, nDir: Integer;var dwDelayTime:LongWord): Boolean;//4CAEB8
var
  dwCheckTime:LongWord;
begin
  Result:=False;
  if m_boDeath or (m_wStatusTimeArr[POISON_STONE{5}]{0x6A} <> 0) then exit;//防麻
  if not CheckActionStatus(wIdent,dwDelayTime) then begin
    m_boFilterAction:=False;
    exit;
  end;
  m_boFilterAction:=True;
  dwCheckTime:=GetTickCount - m_dwTurnTick;
  if dwCheckTime < g_Config.dwTurnIntervalTime then begin
    dwDelayTime:=g_Config.dwTurnIntervalTime - dwCheckTime;
    {
    if dwCheckTime <= g_Config.dwTurnIntervalTime div 2 then begin
      SysMsg('ClientChangeDir ' + IntToStr(dwCheckTime);
      m_boEmergencyClose:=True;
      Result:=True;
    end;
    }
    exit;
  end;

  if (nX = m_nCurrX) and (nY = m_nCurrY) then begin
    m_btDirection:=nDir;
    if Walk(RM_TURN) then begin
      m_dwTurnTick:=GetTickCount();
      Result:=True;
    end;
  end;    
end;

function TPlayObject.ClientSitDownHit(nX, nY, nDir: Integer;var dwDelayTime:LongWord): Boolean;//004CC248
var
  dwCheckTime:LongWord;
begin
  //SetProcessName('TPlayObject.ClientSitDownHit');
  Result:=False;
  if m_boDeath or (m_wStatusTimeArr[POISON_STONE{5}]{0x6A} <> 0) then exit;//防麻

  dwCheckTime:=GetTickCount - m_dwTurnTick;

  if dwCheckTime < g_Config.dwTurnIntervalTime then begin
    dwDelayTime:=g_Config.dwTurnIntervalTime - dwCheckTime;
    exit;
  end;
  m_dwTurnTick:=GetTickCount;
  SendRefMsg(RM_POWERHIT,0,0,0,0,'');
  Result:=True;
end;


procedure TPlayObject.ClientOpenDoor(nX,nY:Integer);//004DABD4
var
  Door:pTDoorInfo;
  Castle:TUserCastle;
begin
  Door:=m_PEnvir.GetDoor(nX,nY);
  if Door = nil then exit;
  Castle:=g_CastleManager.IsCastleEnvir(m_PEnvir);
  if (Castle = nil) or
     (Castle.m_DoorStatus <> Door.Status) or
     (m_btRaceServer <> RC_PLAYOBJECT) or
     Castle.CheckInPalace(m_nCurrX,m_nCurrY,Self) then begin

    UserEngine.OpenDoor(m_PEnvir,nX,nY);
  end;
  {
  if (UserCastle.m_MapCastle <> m_PEnvir) or
     (UserCastle.m_DoorStatus <> Door.Status) or
     (m_btRaceServer <> RC_PLAYOBJECT) or
     UserCastle.CheckInPalace(m_nCurrX,m_nCurrY,Self) then begin

    UserEngine.OpenDoor(m_PEnvir,nX,nY);
  end;
  }
end;

procedure TPlayObject.ClientTakeOnItems(btWhere: Byte; nItemIdx: integer; sItemName: String);//004DAC70
var
  I,n14,n18: Integer;
  UserItem,TakeOffItem:pTUserItem;
  StdItem,StdItem20:TItem;
  StdItem58:TStdItem;
  sUserItemName:String;
  label FailExit;
begin
  StdItem:=nil;
  UserItem:=nil;
  n14:=-1;

  for I := 0 to m_ItemList.Count - 1 do begin
    UserItem:=m_ItemList.Items[i];
    if (UserItem <> nil) and (UserItem.MakeIndex = nItemIdx) then begin
      StdItem:=UserEngine.GetStdItem(UserItem.wIndex);

      sUserItemName := GetItemName(UserItem);
      if StdItem <> nil then begin
        if CompareText(sUserItemName,sItemName) = 0 then begin
          n14:=i;
          break;
        end;
      end;
    end;
    UserItem:=nil;
  end;
  n18:=0;
  if (StdItem <> nil) and (UserItem <> nil) then begin
    if CheckUserItems(btWhere,StdItem) then begin
      StdItem.GetStandardItem(StdItem58);
      StdItem.GetItemAddValue(UserItem,StdItem58);
      StdItem58.Name := GetItemName(UserItem);

      if CheckTakeOnItems(btWhere,StdItem58) and CheckItemBindUse(UserItem) then begin
        TakeOffItem:=nil;
      if btWhere in [0..12] then begin

        if m_UseItems[btWhere].wIndex > 0 then begin
          StdItem20:=UserEngine.GetStdItem(m_UseItems[btWhere].wIndex);
          if (StdItem20 <> nil) and
             (StdItem20.StdMode in [15,19,20,21,22,23,24,26]) then begin
            if (not m_boUserUnLockDurg) and (m_UseItems[btWhere].btValue[7] <> 0)then begin
              SysMsg(g_sCanotTakeOffItem{'无法取下物品！！！'},c_Red,t_Hint);
              n18:=-4;
              goto FailExit;
            end;
          end;
          if not m_boUserUnLockDurg and ((StdItem20.Reserved and 2) <> 0)then begin
            SysMsg(g_sCanotTakeOffItem{'无法取下物品！！！'},c_Red,t_Hint);
            n18:=-4;
            goto FailExit;
          end; //004DAE78
          if (StdItem20.Reserved and 4) <> 0 then begin
            SysMsg(g_sCanotTakeOffItem{'无法取下物品！！！'},c_Red,t_Hint);
            n18:=-4;
            goto FailExit;
          end;
          if InDisableTakeOffList(m_UseItems[btWhere].wIndex) then begin
            SysMsg(g_sCanotTakeOffItem{'无法取下物品！！！'},c_Red,t_Hint);
            goto FailExit;
          end;
          New(TakeOffItem);
          TakeOffItem^:=m_UseItems[btWhere];
        end; //004DAEC7 if m_UseItems[btWhere].wIndex > 0 then begin

        if (StdItem.StdMode in [15,19,20,21,22,23,24,26]) and   //004DAEC7
           (UserItem.btValue[8] <> 0) then
          UserItem.btValue[8]:=0;

        m_UseItems[btWhere]:=UserItem^;
        DelBagItem(n14);
        if TakeOffItem <> nil then begin
          AddItemToBag(TakeOffItem);
          SendAddItem(TakeOffItem);
        end;
        RecalcAbilitys();
        SendMsg(Self,RM_ABILITY,0,0,0,0,'');
        SendMsg(Self,RM_SUBABILITY,0,0,0,0,'');
        SendDefMessage(SM_TAKEON_OK,GetFeatureToLong,GetFeatureEx,0,0,'');
        FeatureChanged();
        n18:=1;
      end;{ else begin
        if m_AddUseItems[btWhere].wIndex > 0 then begin
          StdItem20:=UserEngine.GetStdItem(m_AddUseItems[btWhere].wIndex);
          if (StdItem20 <> nil) and
             (StdItem20.StdMode in [15,19,20,21,22,23,24,26]) then begin
            if (not m_boUserUnLockDurg) and (m_AddUseItems[btWhere].btValue[7] <> 0)then begin
              SysMsg('无法取下物品！！！',c_Red,t_Hint);
              n18:=-4;
              goto FailExit;
            end;
          end;
          if not m_boUserUnLockDurg and ((StdItem20.Reserved and 2) <> 0)then begin
            SysMsg('无法取下物品！！！',c_Red,t_Hint);
            n18:=-4;
            goto FailExit;
          end; //004DAE78
          if (StdItem20.Reserved and 4) <> 0 then begin
            SysMsg('无法取下物品！！！',c_Red,t_Hint);
            n18:=-4;
            goto FailExit;
          end;
          New(TakeOffItem);
          TakeOffItem^:=m_AddUseItems[btWhere];
        end; //004DAEC7 if m_UseItems[btWhere].wIndex > 0 then begin

        if (StdItem.StdMode in [15,19,20,21,22,23,24,26]) and   //004DAEC7
           (UserItem.btValue[8] <> 0) then
          UserItem.btValue[8]:=0;

        m_AddUseItems[btWhere]:=UserItem^;
        if TakeOffItem <> nil then begin
          AddItemToBag(TakeOffItem);
          SendAddItem(TakeOffItem);
        end;
        RecalcAbilitys();
        SendMsg(Self,RM_ABILITY,0,0,0,0,'');
        SendMsg(Self,RM_SUBABILITY,0,0,0,0,'');
        SendDefMessage(SM_TAKEON_OK,GetFeatureToLong,0,0,0,'');
        FeatureChanged();
        n18:=1;
      end;
      }
      end else n18:=-1; //004DAFA0
    end else n18:=-1; //004DAFA9
  end; //004DAFB0
  FailExit:
  if n18 <= 0 then
    SendDefMessage(SM_TAKEON_FAIL,n18,0,0,0,'');
    
end;

procedure TPlayObject.ClientTakeOffItems(btWhere: Byte; nItemIdx: integer; sItemName: String);//004DB01C
var
  n10:Integer;
  StdItem:TItem;
  UserItem:pTUserItem;
  sUserItemName:String;
label FailExit;
begin
  n10:=0;
  if not m_boDealing and (btWhere < 13) then begin
    if m_UseItems[btWhere].wIndex > 0 then begin
      if m_UseItems[btWhere].MakeIndex = nItemIdx then begin
        StdItem:=UserEngine.GetStdItem(m_UseItems[btWhere].wIndex);
        if (StdItem <> nil) and
           (StdItem.StdMode in [15,19,20,21,22,23,24,26]) then begin
          if (not m_boUserUnLockDurg) and (m_UseItems[btWhere].btValue[7] <> 0)then begin
            SysMsg(g_sCanotTakeOffItem{'无法取下物品！！！'},c_Red,t_Hint);
            n10:=-4;
            goto FailExit;
          end;
        end;
        if not m_boUserUnLockDurg and ((StdItem.Reserved and 2) <> 0)then begin
          SysMsg(g_sCanotTakeOffItem{'无法取下物品！！！'},c_Red,t_Hint);
          n10:=-4;
          goto FailExit;
        end;
        if (StdItem.Reserved and 4) <> 0 then begin
          SysMsg(g_sCanotTakeOffItem{'无法取下物品！！！'},c_Red,t_Hint);
          n10:=-4;
          goto FailExit;
        end;
        if InDisableTakeOffList(m_UseItems[btWhere].wIndex) then begin
          SysMsg(g_sCanotTakeOffItem{'无法取下物品！！！'},c_Red,t_Hint);
          goto FailExit;
        end;
        //取自定义物品名称
        sUserItemName:=GetItemName(@m_UseItems[btWhere]);

        if CompareText(sUserItemName,sItemName) = 0 then begin
          New(UserItem);
          UserItem^:=m_UseItems[btWhere];
          if AddItemToBag(UserItem) then begin
            m_UseItems[btWhere].wIndex:=0;

            SendAddItem(UserItem);
            RecalcAbilitys();
            SendMsg(Self,RM_ABILITY,0,0,0,0,'');
            SendMsg(Self,RM_SUBABILITY,0,0,0,0,'');
            SendDefMessage(SM_TAKEOFF_OK,GetFeatureToLong,GetFeatureEx,0,0,'');
            FeatureChanged();

            if g_FunctionNPC <> nil then
              g_FunctionNPC.GotoLable(Self,'@TakeOff' + sItemName,False);
          end else begin
            Dispose(UserItem);
            n10:=-3;
          end;
        end;
      end; //004DB26F
    end else n10:=-2; //004DB25F
      
  end else n10:=-1; //004DB268

  FailExit://004DB26F
  if n10 <= 0 then
    SendDefMessage(SM_TAKEOFF_FAIL,n10,0,0,0,'');
end;

procedure TPlayObject.ClientUseItems(nItemIdx: Integer; sItemName: String);//004DB3B0
  function GetUnbindItemName(nShape:Integer):String; //004E4214
  var
    I: Integer;
  begin
    Result:='';
    for I := 0 to g_UnbindList.Count - 1 do begin
      if Integer(g_UnbindList.Objects[I]) = nShape then begin
        Result:=g_UnbindList.Strings[I];
        break;
      end;        
    end;
  end;
  function GetUnBindItems(sItemName:String;nCount:Integer):Boolean; //004DB2DC
  var
    I: Integer;
    UserItem:pTUserItem;
  begin
    Result:=False;
    for I := 0 to nCount - 1 do begin
      New(UserItem);
      if UserEngine.CopyToUserItemFromName(sItemName,UserItem) then begin
        m_ItemList.Add(UserItem);
        if m_btRaceServer = RC_PLAYOBJECT then
          SendAddItem(UserItem);
        Result:=True;
      end else begin
        Dispose(UserItem);
        break;
      end;
    end;
  end;
var
  I          :Integer;
  boEatOK    :Boolean;
  UserItem   :pTUserItem;
  StdItem    :TItem;
  UserItem34 :TUserItem;
begin
  boEatOK:=False;
  StdItem:=nil;
  if m_boCanUseItem then begin
  if not m_boDeath then begin
    for I := 0 to m_ItemList.Count - 1 do begin
      UserItem:=m_ItemList.Items[I];
      if (UserItem <> nil) and (UserItem.MakeIndex = nItemIdx) then begin
        UserItem34:=UserItem^;
        StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
        if StdItem <> nil then begin
          case StdItem.StdMode of    //
            0,1,2,3: begin //药
              if EatItems(StdItem) then begin
                Dispose(UserItem);
                m_ItemList.Delete(I);
                boEatOK:=True;
              end;
              break;
            end;
            4: begin //书
              if ReadBook(StdItem) then begin
                Dispose(UserItem);
                m_ItemList.Delete(I);
                boEatOK:=True;
                if (m_MagicErgumSkill <> nil) and (not m_boUseThrusting) then begin
                  ThrustingOnOff(True);
                  SendSocket(nil,'+LNG');
                end;
                if (m_MagicBanwolSkill <> nil) and (not m_boUseHalfMoon) then begin
                  HalfMoonOnOff(True);
                  SendSocket(nil,'+WID');
                end;
                if (m_MagicRedBanwolSkill <> nil) and (not m_boRedUseHalfMoon) then begin
                  RedHalfMoonOnOff(True);
                  SendSocket(nil,'+WID');
                end;
              end;
            end;
            31: begin //解包物品
              if StdItem.AniCount = 0 then begin
                if (m_ItemList.Count + 6 -1) <= MAXBAGITEM then begin
                  Dispose(UserItem);
                  m_ItemList.Delete(I);
                  GetUnBindItems(GetUnbindItemName(StdItem.Shape),6);
                  boEatOK:=True;
                end;
              end else begin
                if UseStdmodeFunItem(StdItem) then begin
                  Dispose(UserItem);
                  m_ItemList.Delete(I);
                  boEatOK:=True;
                end;
              end;
            end;
          end;
        end;
        break;
      end;
    end;
  end;
  end else begin
    SendMsg(g_ManageNPC,RM_MENU_OK,0,Integer(Self),0,0,g_sCanotUseItemMsg);
  end;
  if boEatOK then begin
    WeightChanged();
    SendDefMessage(SM_EAT_OK,0,0,0,0,'');
      //004DB73F
    if StdItem.NeedIdentify = 1 then
      AddGameDataLog('11' +  #9 +
                     m_sMapName + #9 +
                     IntToStr(m_nCurrX) + #9 +
                     IntToStr(m_nCurrY) + #9 +
                     m_sCharName + #9 +
                     //UserEngine.GetStdItemName(UserItem34.wIndex) + #9 +
                     StdItem.Name + #9 +
                     IntToStr(UserItem34.MakeIndex) + #9 +
                     '1' + #9 +
                     '0');
  end else begin
    SendDefMessage(SM_EAT_FAIL,0,0,0,0,'');
  end;
      
end;
function TPlayObject.UseStdmodeFunItem(StdItem: TItem):Boolean;
begin
  Result:=False;
  if g_FunctionNPC <> nil then begin
    g_FunctionNPC.GotoLable(Self,'@StdModeFunc' + IntToStr(StdItem.AniCount),False);
    Result:=True;
  end;    
end;


function TPlayObject.ClientGetButchItem(BaseObject: TBaseObject; nX, nY: Integer;btDir: Byte;var dwDelayTime:LongWord):Boolean;//004DB7E0
var
  n10,n14:Integer;
  dwCheckTime:LongWord;
begin
  Result:=False;
  dwDelayTime:=0;
  dwCheckTime:=GetTickCount - m_dwTurnTick;
  if dwCheckTime < g_Config.dwTurnIntervalTime then begin
    dwDelayTime:=g_Config.dwTurnIntervalTime - dwCheckTime;
    exit;
  end;
  m_dwTurnTick:=GetTickCount;
  if (abs(nX - m_nCurrX) <= 2) and (abs(nY - m_nCurrY) <= 2) then begin
    if m_PEnvir.IsValidObject(nX,nY,2,BaseObject) then begin
      if BaseObject.m_boDeath and (not BaseObject.m_boSkeleton) and (BaseObject.m_boAnimal) then begin
        n10:=Random(16) + 5;
        n14:=Random(201) + 100;
        Dec(BaseObject.m_nBodyLeathery,n10);
        Dec(BaseObject.m_nMeatQuality,n14);
        if BaseObject.m_nMeatQuality < 0 then BaseObject.m_nMeatQuality:=0;
        if BaseObject.m_nBodyLeathery <= 0 then begin
          if (BaseObject.m_btRaceServer >= RC_ANIMAL) and (BaseObject.m_btRaceServer < RC_MONSTER) then begin
            BaseObject.m_boSkeleton:=True;
            ApplyMeatQuality();
            BaseObject.SendRefMsg(RM_SKELETON,BaseObject.m_btDirection,BaseObject.m_nCurrX,BaseObject.m_nCurrY,0,'');
          end;
          if not TakeBagItems(BaseObject) then begin
            SysMsg(sYouFoundNothing{未发现任何物品！！！},c_Red,t_Hint);
          end;
          BaseObject.m_nBodyLeathery:=50;
        end; //004DB945
        m_dwDeathTick:=GetTickCount();
      end;

    end; //004DB953
    m_btDirection:=btDir;
  end;
  SendRefMsg(RM_BUTCH,m_btDirection,m_nCurrX,m_nCurrY,0,'');
end;

procedure TPlayObject.ClientChangeMagicKey(nSkillIdx, nKey: integer); //004DB9A4
var
  I: Integer;
  UserMagic:pTUserMagic;
begin
  for I := 0 to m_MagicList.Count - 1 do begin
    UserMagic:=m_MagicList.Items[i];
    if UserMagic.MagicInfo.wMagicId = nSkillIdx then begin
      UserMagic.btKey:=nKey;
      break;
    end;
  end;
end;

procedure TPlayObject.ClientGroupClose; //004C3C10
begin
  if m_GroupOwner = nil then begin
    m_boAllowGroup:=False;
    exit;
  end;
  if m_GroupOwner <> Self then begin
    m_GroupOwner.DelMember(Self);
    m_boAllowGroup:=False;
  end else begin
    SysMsg('If you want to withdraw from group, use function of (del member).',c_Red,t_Hint);
  end;

  if g_FunctionNPC <> nil then
    g_FunctionNPC.GotoLable(Self,'@GroupClose',False);
end;

procedure TPlayObject.ClientCreateGroup(sHumName: String); //004DCCB4
var
  PlayObject:TPlayObject;
begin
  PlayObject:=UserEngine.GeTPlayObject(sHumName);
  if m_GroupOwner <> nil then begin
    SendDefMessage(SM_CREATEGROUP_FAIL,-1,0,0,0,'');
    exit;
  end;
  if (PlayObject = nil) or (PlayObject = Self) or PlayObject.m_boDeath or PlayObject.m_boGhost then begin
    SendDefMessage(SM_CREATEGROUP_FAIL,-2,0,0,0,'');
    exit;
  end;
  if (PlayObject.m_GroupOwner <> nil) then begin
    SendDefMessage(SM_CREATEGROUP_FAIL,-3,0,0,0,'');
    exit;
  end;
  if (not PlayObject.m_boAllowGroup) then begin
    SendDefMessage(SM_CREATEGROUP_FAIL,-4,0,0,0,'');
    exit;
  end;
  m_GroupMembers.Clear;
  m_GroupMembers.AddObject(m_sCharName,Self);
  m_GroupMembers.AddObject(sHumName,PlayObject);
  JoinGroup(Self);
  PlayObject.JoinGroup(Self);
  m_boAllowGroup:=True;
  SendDefMessage(SM_CREATEGROUP_OK,0,0,0,0,'');
  SendGroupMembers();
  if g_FunctionNPC <> nil then
    g_FunctionNPC.GotoLable(Self,'@GroupCreate',False);
end;

procedure TPlayObject.ClientAddGroupMember(sHumName: String); //004DCE48
var
  PlayObject:TPlayObject;
begin
  PlayObject:=UserEngine.GeTPlayObject(sHumName);


  if m_GroupOwner <> Self then begin
    SendDefMessage(SM_GROUPADDMEM_FAIL,-1,0,0,0,'');
    exit;
  end;
  if m_GroupMembers.Count > g_Config.nGroupMembersMax then begin
    SendDefMessage(SM_GROUPADDMEM_FAIL,-5,0,0,0,'');
    exit;
  end;
  if (PlayObject = nil) or (PlayObject = Self) or PlayObject.m_boDeath  or PlayObject.m_boGhost then begin
    SendDefMessage(SM_GROUPADDMEM_FAIL,-2,0,0,0,'');
    exit;
  end;
  if (PlayObject.m_GroupOwner <> nil) then begin
    SendDefMessage(SM_GROUPADDMEM_FAIL,-3,0,0,0,'');
    exit;
  end;
  if (not PlayObject.m_boAllowGroup) then begin
    SendDefMessage(SM_GROUPADDMEM_FAIL,-4,0,0,0,'');
    exit;
  end;

  m_GroupMembers.AddObject(sHumName,PlayObject);
  PlayObject.JoinGroup(Self);
  SendDefMessage(SM_GROUPADDMEM_OK,0,0,0,0,'');
  SendGroupMembers();
  if g_FunctionNPC <> nil then
    g_FunctionNPC.GotoLable(Self,'@GroupAddMember',False);
end;

procedure TPlayObject.ClientDelGroupMember(sHumName: String); //004DCFB8
var
  PlayObject:TPlayObject;
begin
  PlayObject:=UserEngine.GeTPlayObject(sHumName);
  if m_GroupOwner <> Self then begin
    SendDefMessage(SM_GROUPDELMEM_FAIL,-1,0,0,0,'');
    exit;
  end;
  if PlayObject = nil then begin
    SendDefMessage(SM_GROUPDELMEM_FAIL,-2,0,0,0,'');
    exit;
  end;
  if not IsGroupMember(PlayObject) then begin
    SendDefMessage(SM_GROUPDELMEM_FAIL,-3,0,0,0,'');
    exit;
  end;
  DelMember(PlayObject);
  SendDefMessage(SM_GROUPDELMEM_OK,0,0,0,0,sHumName);

  if g_FunctionNPC <> nil then
    g_FunctionNPC.GotoLable(Self,'@GroupDelMember',False);
end;

procedure TPlayObject.ClientDealTry(sHumName: String); //004DD0A8
var
  BaseObject:TBaseObject;
begin
  if g_Config.boDisableDeal then begin
    SendMsg(g_ManageNPC,RM_MENU_OK,0,Integer(Self),0,0,g_sDisableDealItemsMsg);
    exit;
  end;
  if m_boDealing then exit;
  if GetTickCount - m_DealLastTick < g_Config.dwTryDealTime{3000} then begin
    SendMsg(g_ManageNPC,RM_MENU_OK,0,Integer(Self),0,0,g_sPleaseTryDealLaterMsg);
    exit;
  end;

  if not m_boCanDeal then begin
    SendMsg(g_ManageNPC,RM_MENU_OK,0,Integer(Self),0,0,g_sCanotTryDealMsg);
    exit;
  end;  
  BaseObject:=GetPoseCreate();
  if (BaseObject <> nil) and (BaseObject <> self) then begin
    if (BaseObject.GetPoseCreate = Self) and (not BaseObject.m_boDealing) then begin
      if (BaseObject.m_btRaceServer = RC_PLAYOBJECT) then begin
        if (BaseObject.m_boAllowDeal and TPlayObject(BaseObject).m_boCanDeal) then begin
          BaseObject.SysMsg(m_sCharName + g_sOpenedDealMsg,c_Green,t_Hint);
          SysMsg(BaseObject.m_sCharName + g_sOpenedDealMsg,c_Green,t_Hint);
          TPlayObject(Self).OpenDealDlg(BaseObject);
          TPlayObject(BaseObject).OpenDealDlg(Self);
        end else begin //004DD1CC
          SysMsg(g_sPoseDisableDealMsg{'对方禁止进入交易'},c_Red,t_Hint);
        end;
      end;

    end else begin //004DD1E0
      SendDefMessage(SM_DEALTRY_FAIL,0,0,0,0,'');
    end;

  end else begin //004DD1F9
      SendDefMessage(SM_DEALTRY_FAIL,0,0,0,0,'');
  end;
    
end;

procedure TPlayObject.ClientAddDealItem(nItemIdx: integer; sItemName: String); //004DD79C
var
  I: Integer;
  bo11:Boolean;
  UserItem:pTUserItem;
  sUserItemName:String;
begin
  if (m_DealCreat = nil) or (not m_boDealing) then exit;
  if Pos(' ',sItemName) >= 0 then begin //折分物品名称(信件物品的名称后面加了使用次数)
    GetValidStr3(sItemName,sItemName,[' ']);
  end;
  bo11:=False;
  if not m_DealCreat.m_boDealOK then begin
    for I := 0 to m_Itemlist.Count - 1 do begin
      UserItem:=m_Itemlist.Items[i];
      if UserItem.MakeIndex = nItemIdx then begin
        //取自定义物品名称
        sUserItemName:=GetItemName(UserItem);

        if (CompareText(sUserItemName,sItemName) = 0) and
           (m_DealItemList.Count < 12) then begin
          m_DealItemList.Add(UserItem);
          TPlayObject(Self).SendAddDealItem(UserItem);
          m_Itemlist.Delete(i);
          bo11:=True;
          break;
        end;
      end;
    end;
  end; //004DDAA7
  if not bo11 then
    SendDefMessage(SM_DEALADDITEM_FAIL,0,0,0,0,'');
end;

procedure TPlayObject.ClientDelDealItem(nItemIdx: integer; sItemName: String); //004DD958
var
  I: Integer;
  bo11:Boolean;
  UserItem:pTUserItem;
  sUserItemName:String;
begin
  
  if g_Config.boCanNotGetBackDeal then begin
    SendMsg(g_ManageNPC,RM_MENU_OK,0,Integer(Self),0,0,g_sDealItemsDenyGetBackMsg);
    SendDefMessage(SM_DEALDELITEM_FAIL,0,0,0,0,'');
    exit;
  end;

  if (m_DealCreat = nil) or (not m_boDealing) then exit;

  if Pos(' ',sItemName) >= 0 then begin //折分物品名称(信件物品的名称后面加了使用次数)
    GetValidStr3(sItemName,sItemName,[' ']);
  end;

  bo11:=False;
  if not m_DealCreat.m_boDealOK then begin
    for I := 0 to m_DealItemList.Count - 1 do begin
      UserItem:=m_DealItemList.Items[i];
      if UserItem.MakeIndex = nItemIdx then begin

        //取自定义物品名称
        sUserItemName:=GetItemName(UserItem);

        if CompareText(sUserItemName,sItemName) = 0 then begin
          m_Itemlist.Add(UserItem);
          TPlayObject(Self).SendDelDealItem(UserItem);
          m_DealItemList.Delete(i);
          bo11:=True;
          break;
        end;
      end;
    end;
  end; //004DDAA7
  if not bo11 then
    SendDefMessage(SM_DEALDELITEM_FAIL,0,0,0,0,'');
end;

procedure TPlayObject.ClientCancelDeal;//004DD450
begin
  DealCancel();
end;

procedure TPlayObject.ClientChangeDealGold(nGold: Integer); //004DDB04
var
  bo09:Boolean;
begin

  //禁止取回放入交易栏内的金币
  if (m_nDealGolds > 0) and g_Config.boCanNotGetBackDeal then begin
    SendMsg(g_ManageNPC,RM_MENU_OK,0,Integer(Self),0,0,g_sDealItemsDenyGetBackMsg);
    SendDefMessage(SM_DEALDELITEM_FAIL,0,0,0,0,'');
    exit;
  end;
  
  if nGold < 0 then begin
    SendDefMessage(SM_DEALCHGGOLD_FAIL,m_nDealGolds,LoWord(m_nGold),HiWord(m_nGold),0,'');
    exit;
  end;
  bo09:=False;
  if (m_DealCreat <> nil) and (GetPoseCreate = m_DealCreat) then begin
    if not m_DealCreat.m_boDealOK then begin
      if (m_nGold + m_nDealGolds) >= nGold then begin
        m_nGold:=(m_nGold + m_nDealGolds) - nGold;
        m_nDealGolds:=nGold;
        SendDefMessage(SM_DEALCHGGOLD_OK,m_nDealGolds,LoWord(m_nGold),HiWord(m_nGold),0,'');
        TPlayObject(m_DealCreat).SendDefMessage(SM_DEALREMOTECHGGOLD,m_nDealGolds,0,0,0,'');
        m_DealCreat.m_DealLastTick:=GetTickCount();
        bo09:=True;
        m_DealLastTick:=GetTickCount();
      end; //004DDC50
    end;
  end;
  if not bo09 then begin
    SendDefMessage(SM_DEALCHGGOLD_FAIL,m_nDealGolds,LoWord(m_nGold),HiWord(m_nGold),0,'');
  end;
    
end;

procedure TPlayObject.ClientDealEnd;//004DDC8C
var
  I: Integer;
  bo11:Boolean;
  UserItem:pTUserItem;
  StdItem:TItem;
  PlayObject:TPlayObject;
begin
  m_boDealOK:=True;
  if m_DealCreat = nil then exit;
  if ((GetTickcount - m_DealLastTick) < g_Config.dwDealOKTime{1000}) or ((GetTickcount - m_DealCreat.m_DealLastTick) < g_Config.dwDealOKTime{1000}) then begin
    SysMsg(g_sDealOKTooFast,c_Red,t_Hint);
    DealCancel();
    exit;
  end;
  if m_DealCreat.m_boDealOK then begin
    bo11:=True;
    if (MAXBAGITEM - m_ItemList.Count) < m_DealCreat.m_DealItemList.Count  then begin
      bo11:=False;
      SysMsg(g_sYourBagSizeTooSmall,c_Red,t_Hint);
    end;
    if (m_nGoldMax - m_nGold) < m_DealCreat.m_nDealGolds then begin
      SysMsg(g_sYourGoldLargeThenLimit,c_Red,t_Hint);
      bo11:= False;
    end;
    if (MAXBAGITEM - m_DealCreat.m_ItemList.Count) < m_DealItemList.Count then begin
      SysMsg(g_sDealHumanBagSizeTooSmall,c_Red,t_Hint);
      bo11:=False;
    end;
    if (m_DealCreat.m_nGoldMax - m_DealCreat.m_nGold) < m_nDealGolds then begin
      SysMsg(g_sDealHumanGoldLargeThenLimit,c_Red,t_Hint);
      bo11:= False;
    end;
    if bo11 then begin
      for I := 0 to m_DealItemList.Count - 1 do begin
        UserItem:=m_DealItemList.Items[i];
        m_DealCreat.AddItemToBag(UserItem);
        TPlayObject(m_DealCreat).SendAddItem(UserItem);
        StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
        if StdItem <> nil then begin
          if not IsCheapStuff(StdItem.StdMode) then begin
            //004DDF49
            if StdItem.NeedIdentify = 1 then
              AddGameDataLog('8' +  #9 +
                     m_sMapName + #9 +
                     IntToStr(m_nCurrX) + #9 +
                     IntToStr(m_nCurrY) + #9 +
                     m_sCharName + #9 +
                     //UserEngine.GetStdItemName(UserItem.wIndex) + #9 +
                     StdItem.Name + #9 +
                     IntToStr(UserItem.MakeIndex) + #9 +
                     '1' + #9 +
                     m_DealCreat.m_sCharName);
          end;
        end;          
      end; //004DDF5A
      if m_nDealGolds > 0 then begin
        Inc(m_DealCreat.m_nGold,m_nDealGolds);
        m_DealCreat.GoldChanged();
            //004DE05E
          if g_boGameLogGold then
            AddGameDataLog('8' +  #9 +
                     m_sMapName + #9 +
                     IntToStr(m_nCurrX) + #9 +
                     IntToStr(m_nCurrY) + #9 +
                     m_sCharName + #9 +
                     sSTRING_GOLDNAME + #9 +
                     IntToStr(m_nGold) + #9 +
                     '1' + #9 +
                     m_DealCreat.m_sCharName);
      end;
      for I := 0 to m_DealCreat.m_DealItemList.Count - 1 do begin
        UserItem:=m_DealCreat.m_DealItemList.Items[i];
        AddItemToBag(UserItem);
        TPlayObject(Self).SendAddItem(UserItem);
        StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
        if StdItem <> nil then begin
          if not IsCheapStuff(StdItem.StdMode) then begin
            //004DE217
            if StdItem.NeedIdentify = 1 then
              AddGameDataLog('8' +  #9 +
                     m_DealCreat.m_sMapName + #9 +
                     IntToStr(m_DealCreat.m_nCurrX) + #9 +
                     IntToStr(m_DealCreat.m_nCurrY) + #9 +
                     m_DealCreat.m_sCharName + #9 +
                     //UserEngine.GetStdItemName(UserItem.wIndex) + #9 +
                     StdItem.Name + #9 +
                     IntToStr(UserItem.MakeIndex) + #9 +
                     '1' + #9 +
                     m_sCharName);
          end;
        end;          
      end; //004DDF5A
      if m_DealCreat.m_nDealGolds > 0 then begin
        Inc(m_nGold,m_DealCreat.m_nDealGolds);
        GoldChanged();
            //004DE36E
          if g_boGameLogGold then
            AddGameDataLog('8' +  #9 +
                     m_DealCreat.m_sMapName + #9 +
                     IntToStr(m_DealCreat.m_nCurrX) + #9 +
                     IntToStr(m_DealCreat.m_nCurrY) + #9 +
                     m_DealCreat.m_sCharName + #9 +
                     sSTRING_GOLDNAME + #9 +
                     IntToStr(m_DealCreat.m_nGold) + #9 +
                     '1' + #9 +
                     m_sCharName);
      end;
      //004DE37
      PlayObject:=TPlayObject(m_DealCreat);
      PlayObject.SendDefMessage(SM_DEALSUCCESS,0,0,0,0,'');
      PlayObject.SysMsg(g_sDealSuccessMsg{'交易成功...'},c_Green,t_Hint);
      PlayObject.m_DealCreat:=nil;
      PlayObject.m_boDealing:=False;
      PlayObject.m_DealItemList.Clear;
      PlayObject.m_nDealGolds:=0;
      PlayObject.m_boDealOK:=False;   //Jacky 增加

      SendDefMessage(SM_DEALSUCCESS,0,0,0,0,'');
      SysMsg(g_sDealSuccessMsg{'交易成功...'},c_Green,t_Hint);
      m_DealCreat:=nil;
      m_boDealing:=False;
      m_DealItemList.Clear;
      m_nDealGolds:=0;
      m_boDealOK:=False;   //Jacky 增加
    end else begin //004DE42F
      DealCancel();
    end;
  end else begin //004DE439
    SysMsg(g_sYouDealOKMsg{'你已经确认交易了'},c_Green,t_Hint);
    m_DealCreat.SysMsg(g_sPoseDealOKMsg{'对方已经确认交易了'},c_Green,t_Hint);
  end;
end;

procedure TPlayObject.ClientGetMinMap;//004DE550
var
  nMinMap:integer;
begin
  nMinMap:=m_PEnvir.nMinMap;
  if nMinMap > 0 then begin
    SendDefMessage(SM_READMINIMAP_OK,0,nMinMap,0,0,'');
  end else begin
    SendDefMessage(SM_READMINIMAP_FAIL,0,0,0,0,'');
  end;
    
end;

procedure TPlayObject.ClientMakeDrugItem(NPC: TObject;nItemName: String); //004DCAF8
var
  Merchant:TMerchant;
begin
  Merchant:=UserEngine.FindMerchant(NPC);
  if (Merchant = nil) or (not Merchant.m_boMakeDrug) then exit;
  if ((Merchant.m_PEnvir = m_PEnvir) and
     (abs(Merchant.m_nCurrX - m_nCurrX) < 15) and
     (abs(Merchant.m_nCurrY - m_nCurrY) < 15)) then
    Merchant.ClientMakeDrugItem(Self,nItemName);

    
end;

procedure TPlayObject.ClientOpenGuildDlg;//004DE8E0
var
  I: Integer;
  sC:String;
begin
  if m_MyGuild <> nil then begin
    sC:=TGuild(m_MyGuild).sGuildName + #13 + ' ' + #13;
    if m_nGuildRankNo = 1 then begin
      sC:=sC + '1' + #13;
    end else begin
      sC:=sC + '0' + #13;
    end;
    sC:=sC + '<Notice>' + #13;
    for I := 0 to TGuild(m_MyGuild).NoticeList.Count - 1 do begin
      if length(sC) > 5000 then break;
      sC:=sC + TGuild(m_MyGuild).NoticeList.Strings[I] + #13;
    end;    // for
    sC:=sC + '<KillGuilds>' + #13;
    for I := 0 to TGuild(m_MyGuild).GuildWarList.Count - 1 do begin
      if length(sC) > 5000 then break;
      sC:=sC + TGuild(m_MyGuild).GuildWarList.Strings[I] + #13;
    end;    // for
    sC:=sC + '<AllyGuilds>' + #13;
    for I := 0 to TGuild(m_MyGuild).GuildAllList.Count - 1 do begin
      if length(sC) > 5000 then break;
      sC:=sC + TGuild(m_MyGuild).GuildAllList.Strings[I] + #13;
    end;    // for
    m_DefMsg:=MakeDefaultMsg(SM_OPENGUILDDLG,0,0,0,1);
    SendSocket(@m_DefMsg,EncodeString(sC));
  end else begin
    SendDefMessage(SM_OPENGUILDDLG_FAIL,0,0,0,0,'');
  end;
    
end;

procedure TPlayObject.ClientGuildHome;//004DEBDC
begin
  ClientOpenGuildDlg();
end;

procedure TPlayObject.ClientGuildMemberList;//004DEBF0
var
  GuildRank:pTGuildRank;
  I,II:Integer;
  sSendMsg:String;
begin
  if m_MyGuild = nil then exit;
  for I:=0 to TGuild(m_MyGuild).m_RankList.Count -1 do begin
    GuildRank:=TGuild(m_MyGuild).m_RankList.Items[I];
    sSendMsg:=sSendMsg + '#' + IntToStr(GuildRank.nRankNo) + '/*' +  GuildRank.sRankName + '/';
    for II := 0 to GuildRank.MemberList.Count - 1 do begin
      if length(sSendMsg) > 5000 then break;
      sSendMsg:=sSendMsg + GuildRank.MemberList.Strings[II] + '/';
    end;
  end;
  m_DefMsg:=MakeDefaultMsg(SM_SENDGUILDMEMBERLIST,0,0,0,1);
  SendSocket(@m_DefMsg,EncodeString(sSendMsg));
end;

procedure TPlayObject.ClientGuildAddMember(sHumName: String);//004DEDB4
var
  nC:integer;
  PlayObject:TPlayObject;
begin
  nC:=1;  //'你没有权利使用这个命令。'
  if IsGuildMaster then begin
    PlayObject:=UserEngine.GeTPlayObject(sHumName);
    if PlayObject <> nil then begin
      if PlayObject.GetPoseCreate = Self then begin
        if PlayObject.m_boAllowGuild then begin
          if not TGuild(m_MyGuild).IsMember(sHumName) then begin
            if (PlayObject.m_MyGuild = nil) and (TGuild(m_MyGuild).m_RankList.Count < 400) then begin
              TGuild(m_MyGuild).AddMember(PlayObject);
              UserEngine.SendServerGroupMsg(SS_207,nServerIndex,TGuild(m_MyGuild).sGuildName);
              PlayObject.m_MyGuild:=m_MyGuild;
              PlayObject.m_sGuildRankName:=TGuild(m_MyGuild).GetRankName(PlayObject,PlayObject.m_nGuildRankNo);
              PlayObject.RefShowName();
              PlayObject.SysMsg('你已加入行会: ' + TGuild(m_MyGuild).sGuildName + ' 当前封号为: ' + PlayObject.m_sGuildRankName ,c_Green,t_Hint);
              nC:=0;
            end else nC:=4; //'对方已经加入其他行会。'
          end else nC:=3; //004DEEF4 '对方已经加入我们的行会。'
        end else begin //004DEEFD
          nC:=5; //'对方不允许加入行会。'
          PlayObject.SysMsg('你拒绝加入行会。 [允许命令为 @' + g_GameCommand.LETGUILD.sCmd + ']',c_Red,t_Hint);
        end;
      end else nC:=2; //004DEF15 '想加入进来的成员应该来面对掌门人。'
    end else nC:=2;//004DEF1E
  end;//004DEF25
  if nC = 0 then begin
    SendDefMessage(SM_GUILDADDMEMBER_OK,0,0,0,0,'');
  end else begin
    SendDefMessage(SM_GUILDADDMEMBER_FAIL,nC,0,0,0,'');
  end;
end;

procedure TPlayObject.ClientGuildDelMember(sHumName: String);//004DEFB8
var
  nC:integer;
  s14:String;
  PlayObject:TPlayObject;
begin
  nC:=1;
  if IsGuildMaster then begin
    if TGuild(m_MyGuild).IsMember(sHumName) then begin
      if m_sCharName <> sHumName then begin
        if TGuild(m_MyGuild).DelMember(sHumName) then begin
          PlayObject:=UserEngine.GeTPlayObject(sHumName);
          if PlayObject <> nil then begin
            PlayObject.m_MyGuild:=nil;
            PlayObject.RefRankInfo(0,'');
            PlayObject.RefShowName();//10/31
          end;//004DF078
          UserEngine.SendServerGroupMsg(SS_207,nServerIndex,TGuild(m_MyGuild).sGuildName);
          nC:=0;
        end else nC:=4;//004DF0A8
      end else begin //004DF0B4
        nC:=3;
        s14:=TGuild(m_MyGuild).sGuildName;
        if TGuild(m_MyGuild).CancelGuld(sHumName) then begin
          g_GuildManager.DelGuild(s14);
          UserEngine.SendServerGroupMsg(SS_206,nServerIndex,s14);
          m_MyGuild:=nil;
          RefRankInfo(0,'');
          RefShowName();//10/31
          SysMsg('行会' + s14 + '已被取消！！！',c_Red,t_Hint);
          nC:=0;
        end
      end;
    end else nC:=2;
  end;//004DF15C

  if nC = 0 then begin
    SendDefMessage(SM_GUILDDELMEMBER_OK,0,0,0,0,'');
  end else begin
    SendDefMessage(SM_GUILDDELMEMBER_FAIL,nC,0,0,0,'');
  end;

end;

procedure TPlayObject.ClientGuildUpdateNotice(sNotict: String);//004DF1EC
var
  sC:String;
begin
  if (m_MyGuild = nil) or (m_nGuildRankNo <> 1) then exit;
  TGuild(m_MyGuild).NoticeList.Clear;
  while (sNotict <> '') do begin
    sNotict:=GetValidStr3(sNotict,sC,[#$D]);
    TGuild(m_MyGuild).NoticeList.Add(sC);
  end;    // while
  TGuild(m_MyGuild).SaveGuildInfoFile();
  UserEngine.SendServerGroupMsg(SS_207,nServerIndex,TGuild(m_MyGuild).sGuildName);
  ClientOpenGuildDlg();
end;

procedure TPlayObject.ClientGuildUpdateRankInfo(sRankInfo: String);//004DF2E8
var
  nC:Integer;
begin
  if (m_MyGuild = nil) or (m_nGuildRankNo <> 1) then exit;
  nC:=TGuild(m_MyGuild).UpdateRank(sRankInfo);
  if nC = 0 then begin
    UserEngine.SendServerGroupMsg(SS_207,nServerIndex,TGuild(m_MyGuild).sGuildName);
    ClientGuildMemberList();
  end else begin
    if nC <= -2 then begin
      SendDefMessage(SM_GUILDRANKUPDATE_FAIL,nC,0,0,0,'');
    end;
      
  end;
    
end;

procedure TPlayObject.ClientGuildAlly;//004DF3AC
var
  n8:Integer;
  BaseObjectC:TBaseObject;
ResourceString
  sExceptionMsg = '[Exception] TPlayObject::ClientGuildAlly';
begin
try
  n8:= -1;
  BaseObjectC:=GetPoseCreate();
  if (BaseObjectC <> nil) and
     (BaseObjectC.m_MyGuild <> nil) and
     (BaseObjectC.m_btRaceServer = RC_PLAYOBJECT) and
     (BaseObjectC.GetPoseCreate = Self) then begin
    if TGuild(BaseObjectC.m_MyGuild).m_boEnableAuthAlly then begin
      if BaseObjectC.IsGuildMaster and IsGuildMaster then begin
        if TGuild(m_MyGuild).IsNotWarGuild(TGuild(BaseObjectC.m_MyGuild)) and
           TGuild(BaseObjectC.m_MyGuild).IsNotWarGuild(TGuild(m_MyGuild)) then begin

          TGuild(m_MyGuild).AllyGuild(TGuild(BaseObjectC.m_MyGuild));
          TGuild(BaseObjectC.m_MyGuild).AllyGuild(TGuild(m_MyGuild));
          
          TGuild(m_MyGuild).SendGuildMsg(TGuild(BaseObjectC.m_MyGuild).sGuildName + '行会已经和您的行会联盟成功。');
          TGuild(BaseObjectC.m_MyGuild).SendGuildMsg(TGuild(m_MyGuild).sGuildName + '行会已经和您的行会联盟成功。');
          TGuild(m_MyGuild).RefMemberName;
          TGuild(BaseObjectC.m_MyGuild).RefMemberName;
          UserEngine.SendServerGroupMsg(SS_207,nServerIndex,TGuild(m_MyGuild).sGuildName);
          UserEngine.SendServerGroupMsg(SS_207,nServerIndex,TGuild(BaseObjectC.m_MyGuild).sGuildName);
          n8:=0;
        end else n8:= -2;
      end else n8:= -3;
    end else n8:= -4;//004DF57C
  end;
  if n8 = 0 then begin
    SendDefMessage(SM_GUILDMAKEALLY_OK,0,0,0,0,'');
  end else begin
    SendDefMessage(SM_GUILDMAKEALLY_FAIL,n8,0,0,0,'');
  end;
except
  on e: Exception do begin
    MainOutMessage(sExceptionMsg);
    MainOutMessage(E.Message);
  end;
end;
end;

procedure TPlayObject.ClientGuildBreakAlly(sGuildName: String);//004DF604
var
  n10:Integer;
  Guild:TGuild;
begin
  n10:= -1;
  if not IsGuildMaster() then exit;
  Guild:=g_GuildManager.FindGuild(sGuildName);
  if Guild <> nil then begin
    if TGuild(m_MyGuild).IsAllyGuild(Guild) then begin
      TGuild(m_MyGuild).DelAllyGuild(Guild);
      Guild.DelAllyGuild(TGuild(m_MyGuild));
      TGuild(m_MyGuild).SendGuildMsg(Guild.sGuildName +  ' 行会与您的行会解除联盟成功！！！');
      Guild.SendGuildMsg(TGuild(m_MyGuild).sGuildName +  ' 行会解除了与您行会的联盟！！！');
      TGuild(m_MyGuild).RefMemberName();
      Guild.RefMemberName();
      UserEngine.SendServerGroupMsg(SS_207,nServerIndex,TGuild(m_MyGuild).sGuildName);
      UserEngine.SendServerGroupMsg(SS_207,nServerIndex,Guild.sGuildName);
      n10:=0;
    end else n10:= -2;
  end else n10:= -3; //004DF750
  if n10 = 0 then begin
    SendDefMessage(SM_GUILDBREAKALLY_OK,0,0,0,0,'');
  end else begin
    SendDefMessage(SM_GUILDMAKEALLY_FAIL,0,0,0,0,'');
  end;
    
    
end;
procedure TPlayObject.RecalcAdjusBonus();
   procedure AdjustAb (abil: byte; val: word; var lov, hiv: Word);
   var
      lo, hi: byte;
      i: integer;
   begin
      lo := Lobyte(abil);
      hi := Hibyte(abil);
      lov := 0; hiv := 0;
      for i:=1 to val do begin
         if lo + 1 < hi then begin
           Inc(lo);
           Inc(lov);
         end else begin
           Inc(hi);
           Inc(hiv);
         end;
      end;
   end;
var
  BonusTick:pTNakedAbility;
  NakedAbil:pTNakedAbility;
   l, m, adc, amc, asc, aac, amac: integer;
   ldc, lmc, lsc, lac, lmac, hdc, hmc, hsc, hac, hmac: Word;
begin
  BonusTick:=nil;
  NakedAbil:=nil;
  case m_btJob of
    jWarr: begin
      BonusTick:=@g_Config.BonusAbilofWarr;
      NakedAbil:=@g_Config.NakedAbilofWarr;
    end;
    jWizard: begin
      BonusTick:=@g_Config.BonusAbilofWizard;
      NakedAbil:=@g_Config.NakedAbilofWizard;
    end;
    jTaos: begin
      BonusTick:=@g_Config.BonusAbilofTaos;
      NakedAbil:=@g_Config.NakedAbilofTaos;
    end;
  end;


      adc := m_BonusAbil.DC div BonusTick.DC;
      amc := m_BonusAbil.MC div BonusTick.MC;
      asc := m_BonusAbil.SC div BonusTick.SC;
      aac := m_BonusAbil.AC div BonusTick.AC;
      amac := m_BonusAbil.MAC div BonusTick.MAC;


      AdjustAb (NakedAbil.DC, adc, ldc, hdc);
      AdjustAb (NakedAbil.MC, amc, lmc, hmc);
      AdjustAb (NakedAbil.SC, asc, lsc, hsc);
      AdjustAb (NakedAbil.AC, aac, lac, hac);
      AdjustAb (NakedAbil.MAC, amac, lmac, hmac);
      //lac  := 0;  hac := aac;
      //lmac := 0;  hmac := amac;
      
      m_WAbil.DC:=MakeLong(LoWord(m_WAbil.DC) + ldc,HiWord(m_WAbil.DC) + hdc);
      m_WAbil.MC:=MakeLong(LoWord(m_WAbil.MC) + lmc,HiWord(m_WAbil.MC) + hmc);
      m_WAbil.SC:=MakeLong(LoWord(m_WAbil.SC) + lsc,HiWord(m_WAbil.SC) + hsc);
      m_WAbil.AC:=MakeLong(LoWord(m_WAbil.AC) + lac,HiWord(m_WAbil.AC) + hac);
      m_WAbil.MAC:=MakeLong(LoWord(m_WAbil.MAC) + lmac,HiWord(m_WAbil.MAC) + hmac);

      m_WAbil.MaxHP:=_MIN(High(Word),m_WAbil.MaxHP + m_BonusAbil.HP div BonusTick.HP);
      m_WAbil.MaxMP:=_MIN(High(Word),m_WAbil.MaxMP + m_BonusAbil.MP div BonusTick.MP);
//      m_btSpeedPoint:=m_btSpeedPoint + m_BonusAbil.Speed div BonusTick.Speed;
//      m_btHitPoint:=m_btHitPoint + m_BonusAbil.Hit div BonusTick.Hit;
end;
procedure TPlayObject.ClientAdjustBonus(nPoint: Integer; sMsg: String);//004DF804
var
  BonusAbil:TNakedAbility;
  nTotleUsePoint:Integer;
begin
  FillChar(BonusAbil,SizeOf(TNakedAbility),#0);
  DecodeBuffer(sMsg,@BonusAbil,SizeOf(TNakedAbility));

  nTotleUsePoint:=BonusAbil.DC +
                  BonusAbil.MC +
                  BonusAbil.SC +
                  BonusAbil.AC +
                  BonusAbil.MAC +
                  BonusAbil.HP +
                  BonusAbil.MP +
                  BonusAbil.Hit +
                  BonusAbil.Speed +
                  BonusAbil.X2;

  if (nPoint + nTotleUsePoint) = m_nBonusPoint then begin
    m_nBonusPoint:=nPoint;
    Inc(m_BonusAbil.DC,BonusAbil.DC);
    Inc(m_BonusAbil.MC,BonusAbil.MC);
    Inc(m_BonusAbil.SC,BonusAbil.SC);
    Inc(m_BonusAbil.AC,BonusAbil.AC);
    Inc(m_BonusAbil.MAC,BonusAbil.MAC);
    Inc(m_BonusAbil.HP,BonusAbil.HP);
    Inc(m_BonusAbil.MP,BonusAbil.MP);
    Inc(m_BonusAbil.Hit,BonusAbil.Hit);
    Inc(m_BonusAbil.Speed,BonusAbil.Speed);
    Inc(m_BonusAbil.X2,BonusAbil.X2);

    RecalcAbilitys();
    SendMsg(Self,RM_ABILITY,0,0,0,0,'');
    SendMsg(Self,RM_SUBABILITY,0,0,0,0,'');
  end else begin
    SysMsg('非法数据调整！！！',c_Red,t_Hint);
  end;
end;

function TPlayObject.GetMyStatus: Integer;//004C145C
begin
  Result:=m_nHungerStatus div 1000;
  if Result > 4 then Result:=4;
end;

procedure TPlayObject.SendAdjustBonus; //004DA9E4
var
  sSendMsg:String;
  //NakedAbil:TNakedAbility;
begin
  m_DefMsg:=MakeDefaultMsg(SM_ADJUST_BONUS,m_nBonusPoint,0,0,0);
  sSendMsg:='';
  //NakedAbil:=m_BonusAbil;
  //FillChar(NakedAbil,SizeOf(TNakedAbility),#0);
  case m_btjob of    //
    jWarr: sSendMsg:=EncodeBuffer(@g_Config.BonusAbilofWarr,SizeOf(TNakedAbility)) + '/' +
                 EncodeBuffer(@m_BonusAbil,SizeOf(TNakedAbility)) + '/' +
                 EncodeBuffer(@g_Config.NakedAbilofWarr,SizeOf(TNakedAbility));
    jWizard: sSendMsg:=EncodeBuffer(@g_Config.BonusAbilofWizard,SizeOf(TNakedAbility)) + '/' +
                 EncodeBuffer(@m_BonusAbil,SizeOf(TNakedAbility)) + '/' +
                 EncodeBuffer(@g_Config.NakedAbilofWizard,SizeOf(TNakedAbility));
    jTaos: sSendMsg:=EncodeBuffer(@g_Config.BonusAbilofTaos,SizeOf(TNakedAbility)) + '/' +
                 EncodeBuffer(@m_BonusAbil,SizeOf(TNakedAbility)) + '/' +
                 EncodeBuffer(@g_Config.NakedAbilofTaos,SizeOf(TNakedAbility));
  end;    // case
  SendSocket(@m_DefMsg,sSendMsg);
end;

procedure TPlayObject.PKDie(PlayObject:TPlayObject);
var
  nWinLevel,nLostLevel,nWinExp,nLostExp:Integer;
  boWinLEvel,boLostLevel,boWinExp,boLostExp:Boolean;
begin
  nWinLevel:=g_Config.nKillHumanWinLevel;
  nLostLevel:=g_Config.nKilledLostLevel;
  nWinExp:=g_Config.nKillHumanWinExp;
  nLostExp:=g_Config.nKillHumanLostExp;

  boWinLEvel:=g_Config.boKillHumanWinLevel;
  boLostLevel:=g_Config.boKilledLostLevel;
  boWinExp:=g_Config.boKillHumanWinExp;
  boLostExp:=g_Config.boKilledLostExp;
  
  if m_PEnvir.Flag.boPKWINLEVEL then begin
    boWinLEvel:=True;
    nWinLevel:=m_PEnvir.Flag.nPKWINLEVEL;
  end;
  if m_PEnvir.Flag.boPKLOSTLEVEL then begin
    boLostLevel:=True;
    nLostLevel:=m_PEnvir.Flag.nPKLOSTLEVEL;
  end;
  if m_PEnvir.Flag.boPKWINEXP then begin
    boWinExp:=True;
    nWinExp:=m_PEnvir.Flag.nPKWINEXP;
  end;
  if m_PEnvir.Flag.boPKLOSTEXP then begin
    boLostExp:=True;
    nLostExp:=m_PEnvir.Flag.nPKLOSTEXP;
  end;
  
  if PlayObject.m_Abil.Level - m_Abil.Level > g_Config.nHumanLevelDiffer then begin
    if not PlayObject.IsGoodKilling(self) then begin
      PlayObject.IncPkPoint (g_Config.nKillHumanAddPKPoint{100});
      PlayObject.SysMsg (g_sYouMurderedMsg{'你犯了谋杀罪！！！'}, c_Red,t_Hint);
      SysMsg(format(g_sYouKilledByMsg,[m_LastHiter.m_sCharName]),c_Red,t_Hint);
      PlayObject.AddBodyLuck (-g_Config.nKillHumanDecLuckPoint{500});
      if PkLevel < 1 then
        if Random(5) = 0 then
          PlayObject.MakeWeaponUnlock;

      if g_FunctionNPC <> nil then begin
        g_FunctionNPC.GotoLable(PlayObject,'@OnMurder',False);
        g_FunctionNPC.GotoLable(Self,'@Murdered',False);
      end;
    end else begin
      PlayObject.SysMsg(g_sYouProtectedByLawOfDefense{'[你受到正当规则保护。]'}, c_Green,t_Hint);
    end;
    exit;
  end;
  if boWinLEvel then begin
    //Inc(PlayObject.m_Abil.Level,nWinLevel);
    if PlayObject.m_Abil.Level + nWinLevel <= MAXUPLEVEL then begin
      Inc(PlayObject.m_Abil.Level,nWinLevel);
    end else begin
      PlayObject.m_Abil.Level:=MAXUPLEVEL;
    end;
    PlayObject.HasLevelUp(PlayObject.m_Abil.Level - nWinLevel);

    if boLostLevel then begin
      if PKLevel >= 2 then begin
        if m_Abil.Level >= nLostLevel * 2 then
          Dec(m_Abil.Level,nLostLevel * 2);
      end else begin
      if m_Abil.Level >= nLostLevel then
        Dec(m_Abil.Level,nLostLevel);
      end;
    end;

  end;

  if boWinExp then begin
    PlayObject.WinExp(nWinExp);
    if boLostExp then begin
      if m_Abil.Exp >= LongWord(nLostExp) then begin
        if m_Abil.Exp >= LongWord(nLostExp) then begin
          Dec(m_Abil.Exp,LongWord(nLostExp));
        end else begin
          m_Abil.Exp:=0;
        end;
      end else begin
        if m_Abil.Level >= 1 then begin
          Dec(m_Abil.Level);
          Inc(m_Abil.Exp,GetLevelExp(m_Abil.Level));
          if m_Abil.Exp >= LongWord(nLostExp) then begin
            Dec(m_Abil.Exp,LongWord(nLostExp));
          end else begin
            m_Abil.Exp:=0;
          end;
        end else begin
          m_Abil.Level:=0;
          m_Abil.Exp:=0;
        end;
        //HasLevelUp(m_Abil.Level + 1);
      end;
    end;
  end;
end;

function TPlayObject.CancelGroup: Boolean;//004C397C
ResourceString
  sCanceGrop = 'Your group is disorganized.';
begin
  Result:=True;
  if m_GroupMembers.Count <= 1 then begin
    SendGroupText(sCanceGrop);
    m_GroupMembers.Clear;
    m_GroupOwner:=nil;
    Result:=False;
  end;    
end;

procedure TPlayObject.SendGroupMembers; //004DCBA4
var
  I: Integer;
  PlayObject:TPlayObject;
  sSendMsg:String;
begin
  sSendMsg:='';
  for I := 0 to m_GroupMembers.Count - 1 do begin
    PlayObject:=TPlayObject(m_GroupMembers.Objects[i]);
    sSendMsg:=sSendMsg + PlayObject.m_sCharName + '/';
  end;
  for I := 0 to m_GroupMembers.Count - 1 do begin
    PlayObject:=TPlayObject(m_GroupMembers.Objects[i]);
    PlayObject.SendDefMessage(SM_GROUPMEMBERS,0,0,0,0,sSendMsg);
  end;
end;

function TPlayObject.GetSpellPoint(UserMagic: pTUserMagic): Integer; //004C6910
begin
  Result:=ROUND(UserMagic.MagicInfo.wSpell / (UserMagic.MagicInfo.btTrainLv + 1) * (UserMagic.btLevel + 1)) + UserMagic.MagicInfo.btDefSpell;
end;

function TPlayObject.DoMotaebo(nDir: Byte; nMagicLevel: Integer): Boolean; ////004C3130
  function CanMotaebo(BaseObject:TBaseObject):Boolean;//0x004C30B0
  var
    nC:Integer;
  begin
    Result:=False;
    if (m_Abil.Level > BaseObject.m_Abil.Level) and (not BaseObject.m_boStickMode) then begin
      nC:=m_Abil.Level - BaseObject.m_Abil.Level;
      if Random(20) < ((nMagicLevel * 4) + 6 + nC) then begin
        if IsProperTarget(BaseObject) then Result:=True;
      end;
    end;      
  end;
var
  bo35:Boolean;
  I,nDmg,n24,n28:Integer;
  PoseCreate:TBaseObject;
  BaseObject_30:TBaseObject;
  BaseObject_34:TBaseObject;
  nX,nY:integer;
begin
  Result:=False;
  bo35:=True;
  m_btDirection:=nDir;
  BaseObject_34:=nil;
  n24:=nMagicLevel + 1;
  n28:=n24;
  PoseCreate:=GetPoseCreate();
  if PoseCreate <> nil  then begin
    for I:=0 to _MAX(2,nMagicLevel + 1) do begin
      PoseCreate:=GetPoseCreate();
      if PoseCreate <> nil  then begin
        n28:=0;
        if not CanMotaebo(PoseCreate) then break;
        if nMagicLevel >= 3 then begin
          if m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,m_btDirection,2,nX,nY) then begin
            BaseObject_30:=m_PEnvir.GetMovingObject(nX,nY,True);
            if (BaseObject_30 <> nil) and CanMotaebo(BaseObject_30) then
              BaseObject_30.CharPushed(m_btDirection,1);  //004C3237
          end; //004C323C
        end; //004C323C if nMagicLevel >= 3 then begin
        BaseObject_34:=PoseCreate;
        if PoseCreate.CharPushed(m_btDirection,1) <> 1 then break;
        GetFrontPosition(nX,nY);  //sub_004B2790
        if m_PEnvir.MoveToMovingObject(m_nCurrX,m_nCurrY,Self,nX,nY,False) > 0 then begin
          m_nCurrX:=nX;
          m_nCurrY:=nY;
          SendRefMsg(RM_RUSH,nDir,m_nCurrX,m_nCurrY,0,'');
          bo35:=False;
          Result:=True;
        end;
        Dec(n24);
      end; //004C32D7  if PoseCreate <> nil  then begin
    end; //004C32DD for i:=0 to _MAX(2,nMagicLevel + 1) do begin
  end else begin //004C32E8 if PoseCreate <> nil  then begin
    bo35:=False;
    for i:=0 to _MAX(2,nMagicLevel + 1) do begin
      GetFrontPosition(nX,nY);//sub_004B2790
      if m_PEnvir.MoveToMovingObject(m_nCurrX,m_nCurrY,Self,nX,nY,False) > 0 then begin
        m_nCurrX:=nX;
        m_nCurrY:=nY;
        SendRefMsg(RM_RUSH,nDir,m_nCurrX,m_nCurrY,0,'');
        Dec(n28);
      end else begin
        if m_PEnvir.CanWalk(nX,nY,True) then n28:=0
        else begin
          bo35:=True;
          break;
        end;          
      end;
    end; //004C33AD
  end; //004C33B3
  if (BaseObject_34 <> nil) then begin  //004C33B3
    if n24 < 0 then n24:=0;
    nDmg:=Random((n24 + 1) * 10) + ((n24 + 1) * 10);
    nDmg:=BaseObject_34.GetHitStruckDamage(Self,nDmg);
    BaseObject_34.StruckDamage(nDmg);
    BaseObject_34.SendRefMsg(RM_STRUCK,nDmg,BaseObject_34.m_WAbil.HP,BaseObject_34.m_WAbil.MaxHP,Integer(Self),'');
    if BaseObject_34.m_btRaceServer <> RC_PLAYOBJECT then begin
      BaseObject_34.SendMsg(BaseObject_34,RM_STRUCK,nDmg,BaseObject_34.m_WAbil.HP,BaseObject_34.m_WAbil.MaxHP,Integer(Self),'');
    end;
  end; //004C3464
  if bo35 then begin
    GetFrontPosition(nX,nY);  //sub_004B2790
    SendRefMsg(RM_RUSHKUNG,m_btDirection,nX,nY,0,'');
    SysMsg(sMateDoTooweak{冲撞力不够！！！},c_Red,t_Hint);
  end;
  if n28 > 0 then begin
    if n24 < 0 then n24:=0;
    nDmg:=Random(n24 * 10) + ((n24 + 1) * 3);
    nDmg:=GetHitStruckDamage(Self,nDmg);
    StruckDamage(nDmg);
    SendRefMsg(RM_STRUCK,nDmg,m_WAbil.HP,m_WAbil.MaxHP,0,'');
  end;
      
end;
function TPlayObject.DoSpell(UserMagic: pTUserMagic; nTargetX,
  nTargetY: Integer; BaseObject: TBaseObject): boolean; //004C6968
var
  nSpellPoint:integer;
begin
  Result:=False;
try
  if not MagicManager.IsWarrSkill(UserMagic.wMagIdx) then begin
    nSpellPoint:=GetSpellPoint(UserMagic);
    if nSpellPoint > 0 then begin
      if m_WAbil.MP < nSpellPoint then exit;
      DamageSpell(nSpellPoint);
      HealthSpellChanged();
    end;
    Result:=MagicManager.DoSpell(Self,UserMagic,nTargetX,nTargetY,BaseObject);
  end;
except
  on e: Exception do begin
    MainOutMessage(format('[Exception] TPlayObject.DoSpell MagID:%d X:%d Y:%d',[UserMagic.wMagIdx,nTargetX,nTargetY]));
    MainOutMessage(E.Message);
  end;

end;
end;

function TPlayObject.PileStones(nX, nY: Integer):Boolean; //004CB64C
var
  Event     :TEvent;
  PileEvent :TEvent;
  s1C       :String;
begin
  Result:=False;
  s1C:='';
  Event:=TEvent(m_PEnvir.GetEvent(nX,nY));
  if (Event <> nil) and (Event.m_nEventType = ET_MINE) then begin
    if TStoneMineEvent(Event).m_nMineCount > 0 then begin
      Dec(TStoneMineEvent(Event).m_nMineCount);
      if Random(g_Config.nMakeMineHitRate{4}) = 0 then begin
        PileEvent:=TEvent(m_PEnvir.GetEvent(m_nCurrX,m_nCurrY));
        if PileEvent = nil then begin //004CB71D
          PileEvent:=TPileStones.Create(m_PEnvir,m_nCurrX,m_nCurrY,ET_PILESTONES,5 * 60 * 1000);
          g_EventManager.AddEvent(PileEvent);
        end else begin
          if PileEvent.m_nEventType = ET_PILESTONES then
            TPileStones(PileEvent).AddEventParam;
        end;
        if Random(g_Config.nMakeMineRate{12}) = 0 then begin
          if m_PEnvir.Flag.boMINE then
            MakeMine()
          else if m_PEnvir.Flag.boMINE2 then
            MakeMine2();
        end;
        s1C:='1';
        DoDamageWeapon(Random(15) + 5);
        Result:=True;
      end; //004CB79C
    end else begin  //004CB782
      if (GetTickCount - TStoneMineEvent(Event).m_dwAddStoneMineTick) >10 * 60 * 1000 then
        TStoneMineEvent(Event).AddStoneMine();
    end;
  end; //004CB79C
  SendRefMsg(RM_HEAVYHIT,m_btDirection,m_nCurrX,m_nCurrY,0,s1C);
end;

procedure TPlayObject.SendSaveItemList(nBaseObject:Integer);//004DC120
var
  i:Integer;
  Item:TItem;
  sSendMsg:String;
  ClientItem:TClientItem;
  OClientItem:TOClientItem;
  StdItem:TStdItem;
  UserItem:PTUserItem;
begin
if m_nSoftVersionDateEx = 0 then begin
  sSendMsg:='';
  for I := 0 to m_StorageItemList.Count - 1 do begin
    UserItem:=m_StorageItemList.Items[i];

    Item:=UserEngine.GetStdItem(UserItem.wIndex);
    if Item <> nil then begin
      Item.GetStandardItem(StdItem);
      Item.GetItemAddValue(UserItem,StdItem);
      StdItem.Name := GetItemName(UserItem);
      CopyStdItemToOStdItem(@StdItem,@OClientItem.S);

      OClientItem.Dura:=UserItem.Dura;
      OClientItem.DuraMax:=UserItem.DuraMax;
      OClientItem.MakeIndex:=UserItem.MakeIndex;
      sSendMsg:=sSendMsg + EncodeBuffer(@OClientItem,SizeOf(TOClientItem)) + '/';
    end;

  end;
  m_DefMsg:=MakeDefaultMsg(SM_SAVEITEMLIST,nBaseObject,0,0,m_StorageItemList.Count);
  SendSocket(@m_DefMsg,sSendMsg);
end else begin
  sSendMsg:='';
  for I := 0 to m_StorageItemList.Count - 1 do begin
    UserItem:=m_StorageItemList.Items[i];
    Item:=UserEngine.GetStdItem(UserItem.wIndex);
    if Item <> nil then begin
      Item.GetStandardItem(ClientItem.S);
      Item.GetItemAddValue(UserItem,ClientItem.S);
      ClientItem.S.Name := GetItemName(UserItem);

      ClientItem.Dura:=UserItem.Dura;
      ClientItem.DuraMax:=UserItem.DuraMax;
      ClientItem.MakeIndex:=UserItem.MakeIndex;
      sSendMsg:=sSendMsg + EncodeBuffer(@ClientItem,SizeOf(TClientItem)) + '/';
    end;

  end;
  m_DefMsg:=MakeDefaultMsg(SM_SAVEITEMLIST,nBaseObject,0,0,m_StorageItemList.Count);
  SendSocket(@m_DefMsg,sSendMsg);
end;
end;
procedure TPlayObject.SendChangeGuildName; //004DE5A4
begin
  if m_MyGuild <> nil then begin
    SendDefMessage(SM_CHANGEGUILDNAME,0,0,0,0,TGuild(m_MyGuild).sGuildName + '/' + m_sGuildRankName);
  end else begin
    SendDefMessage(SM_CHANGEGUILDNAME,0,0,0,0,'');
  end;    
end;






procedure TPlayObject.SendDelItemList(ItemList: TStringList); //004D0DAC
var
  I: Integer;
  s10:String;
begin
  s10:='';
  for I := 0 to ItemList.Count - 1 do begin
    s10:=s10 + ItemList.Strings[i] + '/' + IntToStr(Integer(ItemList.Objects[i])) + '/';
  end;
  m_DefMsg:=MakeDefaultMsg(SM_DELITEMS,0,0,0,ItemList.Count);
  SendSocket(@m_DefMsg,EncodeString(s10));
end;

procedure TPlayObject.SendDelItems(UserItem: pTUserItem);//004D0BDC
var
  StdItem:TItem;
  StdItem80:TStdItem;
  ClientItem:TClientItem;
  OClientItem:TOClientItem;
begin
if (m_nSoftVersionDateEx = 0) and (m_dwClientTick = 0) then begin
  StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
  if StdItem <> nil then begin
    StdItem.GetStandardItem(StdItem80);
    StdItem.GetItemAddValue(UserItem,StdItem80);
    StdItem80.Name := GetItemName(UserItem);
    CopyStdItemToOStdItem(@StdItem80,@OClientItem.S);

    OClientItem.MakeIndex:=UserItem.MakeIndex;
    OClientItem.Dura:=UserItem.Dura;
    OClientItem.DuraMax:=UserItem.DuraMax;
    if StdItem.StdMode = 50 then begin
      OClientItem.S.Name:=OClientItem.S.Name + ' #' + IntToStr(UserItem.Dura);
    end;
    m_DefMsg:=MakeDefaultMsg(SM_DELITEM,Integer(Self),0,0,1);
    SendSocket(@m_DefMsg,EncodeBuffer(@OClientItem,SizeOf(TOClientItem)));
  end;
end else begin
  StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
  if StdItem <> nil then begin
    StdItem.GetStandardItem(ClientItem.S);
    StdItem.GetItemAddValue(UserItem,ClientItem.S);
    ClientItem.S.Name := GetItemName(UserItem);

    ClientItem.MakeIndex:=UserItem.MakeIndex;
    ClientItem.Dura:=UserItem.Dura;
    ClientItem.DuraMax:=UserItem.DuraMax;
    if StdItem.StdMode = 50 then begin
      ClientItem.S.Name:=ClientItem.S.Name + ' #' + IntToStr(UserItem.Dura);
    end;
    m_DefMsg:=MakeDefaultMsg(SM_DELITEM,Integer(Self),0,0,1);
    SendSocket(@m_DefMsg,EncodeBuffer(@ClientItem,SizeOf(TClientItem)));
  end;
end;
end;

procedure TPlayObject.SendUpdateItem(UserItem: pTUserItem);//004D0A10
var
  StdItem:TItem;
  StdItem80:TStdItem;
  ClientItem:TClientItem;
  OClientItem:TOClientItem;
begin

if (m_nSoftVersionDateEx = 0) and (m_dwClientTick = 0) then begin
  StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
  if StdItem <> nil then begin
    StdItem.GetStandardItem(StdItem80);
    StdItem.GetItemAddValue(UserItem,StdItem80);
    StdItem80.Name := GetItemName(UserItem);
    CopyStdItemToOStdItem(@StdItem80,@OClientItem.S);

    OClientItem.MakeIndex:=UserItem.MakeIndex;
    OClientItem.Dura:=UserItem.Dura;
    OClientItem.DuraMax:=UserItem.DuraMax;
    if StdItem.StdMode = 50 then begin
      OClientItem.S.Name:=ClientItem.S.Name + ' #' + IntToStr(UserItem.Dura);
    end;
    m_DefMsg:=MakeDefaultMsg(SM_UPDATEITEM,Integer(Self),0,0,1);
    SendSocket(@m_DefMsg,EncodeBuffer(@OClientItem,SizeOf(TOClientItem)));
  end;
end else begin
  StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
  if StdItem <> nil then begin
    StdItem.GetStandardItem(ClientItem.S);
    StdItem.GetItemAddValue(UserItem,ClientItem.S);
    ClientItem.S.Name := GetItemName(UserItem);

    ClientItem.MakeIndex:=UserItem.MakeIndex;
    ClientItem.Dura:=UserItem.Dura;
    ClientItem.DuraMax:=UserItem.DuraMax;
    if StdItem.StdMode = 50 then begin
      ClientItem.S.Name:=ClientItem.S.Name + ' #' + IntToStr(UserItem.Dura);
    end;
    m_DefMsg:=MakeDefaultMsg(SM_UPDATEITEM,Integer(Self),0,0,1);
    SendSocket(@m_DefMsg,EncodeBuffer(@ClientItem,SizeOf(TClientItem)));
  end;
end;
end;

function TPlayObject.CheckTakeOnItems(nWhere: Integer;var StdItem: TStdItem): Boolean; //004C5084
var
  Castle:TUserCastle;
begin
  Result:=False;
  if (StdItem.StdMode = 10) and (m_btGender <> gMan) then begin
    SysMsg(sWearNotOfWoMan,c_Red,t_Hint);
    exit;
  end;
  if (StdItem.StdMode = 11) and (m_btGender <> gWoMan) then begin
    SysMsg(sWearNotOfMan,c_Red,t_Hint);
    exit;
  end;
  if (nWhere = 1) or (nWhere = 2) then begin
    if StdItem.Weight > m_WAbil.MaxHandWeight then begin
      SysMsg(sHandWeightNot,c_Red,t_Hint);
      exit;
    end;
  end else begin
    if (StdItem.Weight + GetUserItemWeitht(nWhere)) > m_WAbil.MaxWearWeight then begin
      SysMsg(sWearWeightNot,c_Red,t_Hint);
      exit;
    end;
  end;
  Castle:=g_CastleManager.IsCastleMember(Self);
  case StdItem.Need of    //
    0: begin
      if m_Abil.Level >= StdItem.NeedLevel then begin
        Result:=True;
      end else begin
        SysMsg(g_sLevelNot,c_Red,t_Hint);
      end;
    end;
    1: begin
      if HiWord(m_WAbil.DC) >= StdItem.NeedLevel then begin
        Result:=True;
      end else begin
        SysMsg(g_sDCNot,c_Red,t_Hint);
      end;
    end;
    10: begin
      if( m_btJob = LoWord(StdItem.NeedLevel)) and (m_Abil.Level >= HiWord(StdItem.NeedLevel)) then begin
        Result:=True;
      end else begin
        SysMsg(g_sJobOrLevelNot,c_Red,t_Hint);
      end;
    end;
    11: begin
      if( m_btJob = LoWord(StdItem.NeedLevel)) and (HiWord(m_WAbil.DC) >= HiWord(StdItem.NeedLevel)) then begin
        Result:=True;
      end else begin
        SysMsg(g_sJobOrDCNot,c_Red,t_Hint);
      end;
    end;
    12: begin
      if( m_btJob = LoWord(StdItem.NeedLevel)) and (HiWord(m_WAbil.MC) >= HiWord(StdItem.NeedLevel)) then begin
        Result:=True;
      end else begin
        SysMsg(g_sJobOrMCNot,c_Red,t_Hint);
      end;
    end;
    13: begin
      if( m_btJob = LoWord(StdItem.NeedLevel)) and (HiWord(m_WAbil.SC) >= HiWord(StdItem.NeedLevel)) then begin
        Result:=True;
      end else begin
        SysMsg(g_sJobOrSCNot,c_Red,t_Hint);
      end;
    end;
    2: begin
      if HiWord(m_WAbil.MC) >= StdItem.NeedLevel then begin
        Result:=True;
      end else begin
        SysMsg(g_sMCNot,c_Red,t_Hint);
      end;
    end;
    3: begin
      if HiWord(m_WAbil.SC) >= StdItem.NeedLevel then begin
        Result:=True;
      end else begin
        SysMsg(g_sSCNot,c_Red,t_Hint);
      end;
    end;
    4: begin
      if m_btReLevel >= StdItem.NeedLevel then begin
        Result:=True;
      end else begin
        SysMsg(g_sReNewLevelNot,c_Red,t_Hint);
      end;
    end;
    40: begin
      if m_btReLevel >= LoWord(StdItem.NeedLevel) then begin
        if m_Abil.Level >= HiWord(StdItem.NeedLevel) then begin
          Result:=True;
        end else begin
          SysMsg(g_sLevelNot,c_Red,t_Hint);
        end;
      end else begin
        SysMsg(g_sReNewLevelNot,c_Red,t_Hint);
      end;
    end;
    41: begin
      if m_btReLevel >= LoWord(StdItem.NeedLevel) then begin
        if HiWord(m_WAbil.DC) >= HiWord(StdItem.NeedLevel) then begin
          Result:=True;
        end else begin
          SysMsg(g_sDCNot,c_Red,t_Hint);
        end;
      end else begin
        SysMsg(g_sReNewLevelNot,c_Red,t_Hint);
      end;
    end;
    42: begin
      if m_btReLevel >= LoWord(StdItem.NeedLevel) then begin
        if HiWord(m_WAbil.MC) >= HiWord(StdItem.NeedLevel) then begin
          Result:=True;
        end else begin
          SysMsg(g_sMCNot,c_Red,t_Hint);
        end;
      end else begin
        SysMsg(g_sReNewLevelNot,c_Red,t_Hint);
      end;
    end;
    43: begin
      if m_btReLevel >= LoWord(StdItem.NeedLevel) then begin
        if HiWord(m_WAbil.SC) >= HiWord(StdItem.NeedLevel) then begin
          Result:=True;
        end else begin
          SysMsg(g_sSCNot,c_Red,t_Hint);
        end;
      end else begin
        SysMsg(g_sReNewLevelNot,c_Red,t_Hint);
      end;
    end;
    44: begin
      if m_btReLevel >= LoWord(StdItem.NeedLevel) then begin
        if m_btCreditPoint >= HiWord(StdItem.NeedLevel) then begin
          Result:=True;
        end else begin
          SysMsg(g_sCreditPointNot,c_Red,t_Hint);
        end;
      end else begin
        SysMsg(g_sReNewLevelNot,c_Red,t_Hint);
      end;
    end;
    5: begin
      if m_btCreditPoint >= StdItem.NeedLevel then begin
        Result:=True;
      end else begin
        SysMsg(g_sCreditPointNot,c_Red,t_Hint);
      end;
    end;
    6: begin
      if (m_MyGuild <> nil)then begin
        Result:=True;
      end else begin
        SysMsg(g_sGuildNot,c_Red,t_Hint);
      end;
    end;
    60: begin
      if (m_MyGuild <> nil) and (m_nGuildRankNo = 1) then begin
        Result:=True;
      end else begin
        SysMsg(g_sGuildMasterNot,c_Red,t_Hint);
      end;
    end;
    7: begin
//      if (m_MyGuild <> nil) and (UserCastle.m_MasterGuild = m_MyGuild) then begin
      if (m_MyGuild <> nil) and (Castle <> nil) then begin
        Result:=True;
      end else begin
        SysMsg(g_sSabukHumanNot,c_Red,t_Hint);
      end;
    end;
    70: begin
//      if (m_MyGuild <> nil) and (UserCastle.m_MasterGuild = m_MyGuild) and (m_nGuildRankNo = 1) then begin
      if (m_MyGuild <> nil) and (Castle <> nil) and (m_nGuildRankNo = 1) then begin
        if m_Abil.Level >= StdItem.NeedLevel then begin
          Result:=True;
        end else begin
          SysMsg(g_sLevelNot,c_Red,t_Hint);
        end;
      end else begin
        SysMsg(g_sSabukMasterManNot,c_Red,t_Hint);
      end;
    end;
    8: begin
      if m_nMemberType <> 0 then begin
        Result:=True;
      end else begin
        SysMsg(g_sMemberNot,c_Red,t_Hint);
      end;
    end;
    81: begin
      if (m_nMemberType = LoWord(StdItem.NeedLevel)) and (m_nMemberLevel >= HiWord(StdItem.NeedLevel)) then begin
        Result:=True;
      end else begin
        SysMsg(g_sMemberTypeNot,c_Red,t_Hint);
      end;
    end;
    82: begin
      if (m_nMemberType >= LoWord(StdItem.NeedLevel)) and (m_nMemberLevel >= HiWord(StdItem.NeedLevel)) then begin
        Result:=True;
      end else begin
        SysMsg(g_sMemberTypeNot,c_Red,t_Hint);
      end;
    end;
  end;
  //if not Result then SysMsg(g_sCanottWearIt,c_Red,t_Hint);

end;

function TPlayObject.GetUserItemWeitht(nWhere: Integer): Integer; //004BF764
var
  I: Integer;
  n14:Integer;
  StdItem:TItem;
begin
  n14:=0;
  for I := Low(THumanUseItems) to High(THumanUseItems) do begin
    if (nWhere = -1) or (not (i = nWhere) and not (i = 1) and not (i = 2)) then begin
      StdItem:=UserEngine.GetStdItem(m_UseItems[i].wIndex);
      if StdItem <> nil then Inc(n14,StdItem.Weight);
    end;
  end;
  Result:=n14;
end;

function TPlayObject.EatItems(StdItem: TItem): Boolean;//004C6238
var
  boNeedRecalc:Boolean;
  nOldStatus:Integer;
begin
  Result:=False;
  if m_PEnvir.Flag.boNODRUG then begin
    SysMsg(sCanotUseDrugOnThisMap,c_Red,t_Hint);
    exit;
  end;
  case StdItem.StdMode of
    0: begin //004C62BA
      case StdItem.Shape of
        1: begin
          IncHealthSpell(StdItem.AC,StdItem.MAC);
          Result:=True;
        end;
        2: begin
          m_boUserUnLockDurg:=True;
          Result:=True;
        end;
        else begin
          {
          if ((StdItem.AC + m_nIncHealth) < 500) and (StdItem.AC > 0) then begin
            Inc(m_nIncHealth,StdItem.AC);
          end;
          if ((StdItem.MAC + m_nIncSpell) < 500) and (StdItem.MAC > 0) then begin
            Inc(m_nIncSpell,StdItem.MAC);
          end;
          }
          if (StdItem.AC > 0) then begin
            Inc(m_nIncHealth,StdItem.AC);
          end;
          if (StdItem.MAC > 0) then begin
            Inc(m_nIncSpell,StdItem.MAC);
          end;
          Result:=True;  
        end;
      end;
    end;
    1: begin
      nOldStatus:=GetMyStatus();
      Inc(m_nHungerStatus,StdItem.DuraMax div 10);
      m_nHungerStatus:=_MIN(5000,m_nHungerStatus);
      if nOldStatus <> GetMyStatus() then
        RefMyStatus();
      Result:=True;
    end;
    2: Result:=True;
    3: begin
      if StdItem.Shape = 12 then begin
        boNeedRecalc:=False;
        if StdItem.DC > 0 then begin
          m_wStatusArrValue[0{0x218}]:=StdItem.DC;
          m_dwStatusArrTimeOutTick[0{0x220}]:=GetTickCount + StdItem.MAC2 * 1000;
          SysMsg('Temporarily destructive power increased during ' + IntToStr(StdItem.MAC2) + 'sec.',c_Green,t_Hint);
          boNeedRecalc:=True;
        end;
        if StdItem.MC > 0 then begin
          m_wStatusArrValue[1{0x219}]:=StdItem.MC;
          m_dwStatusArrTimeOutTick[1{0x224}]:=GetTickCount + StdItem.MAC2 * 1000;
          SysMsg('Temporarily magic power increased during ' + IntToStr(StdItem.MAC2) + 'sec.',c_Green,t_Hint);
          boNeedRecalc:=True;
        end;
        if StdItem.SC > 0 then begin
          m_wStatusArrValue[2{0x21A}]:=StdItem.SC;
          m_dwStatusArrTimeOutTick[2{0x228}]:=GetTickCount + StdItem.MAC2 * 1000;
          SysMsg('Temporarily zen power increased during ' + IntToStr(StdItem.MAC2) + 'sec.',c_Green,t_Hint);
          boNeedRecalc:=True;
        end;
        if StdItem.AC2 > 0 then begin
          m_wStatusArrValue[3{0x21B}]:=StdItem.AC2;
          m_dwStatusArrTimeOutTick[3{0x22C}]:=GetTickCount + StdItem.MAC2 * 1000;
          SysMsg('Temporarily hitting speed increased during ' + IntToStr(StdItem.MAC2) + 'sec.',c_Green,t_Hint);
          boNeedRecalc:=True;
        end;
        if StdItem.AC > 0 then begin
          m_wStatusArrValue[4{0x21C}]:=StdItem.AC;
          m_dwStatusArrTimeOutTick[4{0x230}]:=GetTickCount + StdItem.MAC2 * 1000;
          SysMsg('Temporarily HP increased during ' + IntToStr(StdItem.MAC2) + 'sec.',c_Green,t_Hint);
          boNeedRecalc:=True;
        end;
        if StdItem.MAC > 0 then begin
          m_wStatusArrValue[5{0x21D}]:=StdItem.MAC;
          m_dwStatusArrTimeOutTick[5{0x234}]:=GetTickCount + StdItem.MAC2 * 1000;
          SysMsg('Temporarily MP increased during ' + IntToStr(StdItem.MAC2) + 'sec.',c_Green,t_Hint);
          boNeedRecalc:=True;
        end;
        if boNeedRecalc then begin
          RecalcAbilitys();
          SendMsg(Self,RM_ABILITY,0,0,0,0,'');
          Result:=True;
        end;
      end else begin
        Result:=EatUseItems(StdItem.Shape);
      end;        
    end;
  end;
end;

function TPlayObject.ReadBook(StdItem:TItem): Boolean; //004C67DC
var
  Magic:pTMagic;
  UserMagic:pTUserMagic;
  PlayObject:TPlayObject;
begin
  Result:=False;
  Magic:=UserEngine.FindMagic(StdItem.Name);
  if Magic <> nil then begin
    if not IsTrainingSkill(Magic.wMagicId) then begin
      if (Magic.btJob = 99) or (Magic.btJob = m_btJob) then begin
        if m_Abil.Level >= Magic.TrainLevel[0] then begin
          New(UserMagic);
          UserMagic.MagicInfo:=Magic;
          UserMagic.wMagIdx:=Magic.wMagicId;
          UserMagic.btKey:=0;
          UserMagic.btLevel:=0;
          UserMagic.nTranPoint:=0;
          m_MagicList.Add(UserMagic);
          RecalcAbilitys();
          if m_btRaceServer = RC_PLAYOBJECT  then begin
            PlayObject:=TPlayObject(Self);
            PlayObject.SendAddMagic(UserMagic);
          end;
          Result:=True;
        end;
      end;
    end;
  end;
end;

procedure TPlayObject.SendAddMagic(UserMagic: pTUserMagic); //004D12F4
var
  ClientMagic:TClientMagic;
begin
   ClientMagic.Key:=Char(UserMagic.btKey);
   ClientMagic.Level:=UserMagic.btLevel;
   ClientMagic.CurTrain:=UserMagic.nTranPoint;
   ClientMagic.Def:=UserMagic.MagicInfo^;
   m_DefMsg:=MakeDefaultMsg(SM_ADDMAGIC,0,0,0,1);
   SendSocket(@m_DefMsg,EncodeBuffer(@ClientMagic,SizeOf(TClientMagic)));
end;
procedure TPlayObject.SendDelMagic(UserMagic: pTUserMagic);
begin
  m_DefMsg:=MakeDefaultMsg(SM_DELMAGIC,UserMagic.wMagIdx,0,0,1);
  SendSocket(@m_DefMsg,'');
end;

function TPlayObject.EatUseItems(nShape: integer): Boolean; //004BD1BC
var
  Castle:TUserCastle;
begin
  Result:=False;
  case nShape of    //
    1: begin
      SendRefMsg(RM_SPACEMOVE_FIRE,0,0,0,0,'');
      BaseObjectMove(m_sHomeMap,'','');
      Result:=True;
    end;
    2: begin
      if not m_PEnvir.Flag.boNORANDOMMOVE then begin
        SendRefMsg(RM_SPACEMOVE_FIRE,0,0,0,0,'');
        BaseObjectMove(m_sMapName,'','');
        Result:=True;
      end;
    end;
    3: begin
      SendRefMsg(RM_SPACEMOVE_FIRE,0,0,0,0,'');
      if PKLevel < 2 then begin
        BaseObjectMove(m_sHomeMap,IntToStr(m_nHomeX),IntToStr(m_nHomeY));
      end else begin
        BaseObjectMove(g_Config.sRedHomeMap,IntToStr(g_Config.nRedHomeX),IntToStr(g_Config.nRedHomeY));
      end;
      Result:=True;
    end;
    4: begin
      if WeaptonMakeLuck() then Result:=True;
    end;
    5: begin
      if m_MyGuild <> nil then begin
        if not m_boInFreePKArea then begin
          Castle:=g_CastleManager.IsCastleMember(Self);
          {
          if UserCastle.IsMasterGuild(TGuild(m_MyGuild)) then begin
            BaseObjectMove(UserCastle.m_sHomeMap,IntToStr(UserCastle.GetHomeX),IntToStr(UserCastle.GetHomeY));
          }
          if (Castle <> nil) and Castle.IsMasterGuild(TGuild(m_MyGuild)) then begin
            BaseObjectMove(Castle.m_sHomeMap,IntToStr(Castle.GetHomeX),IntToStr(Castle.GetHomeY));
          end else begin
            SysMsg('无效',c_Red,t_Hint);
          end;
          Result:=True;
        end else begin //004BD3F7
          SysMsg('此处无法使用',c_Red,t_Hint);
        end;
      end;
    end;
    9: begin
      if RepairWeapon() then Result:=True;
    end;
    10: begin
      if SuperRepairWeapon() then Result:=True;
    end;
    11: begin
      if WinLottery() then Result:=True;
    end;
  end;
end;
procedure TPlayObject.MoveToHome;
begin
  SendRefMsg(RM_SPACEMOVE_FIRE,0,0,0,0,'');
  BaseObjectMove(m_sHomeMap,IntToStr(m_nHomeX),IntToStr(m_nHomeY));
end;

procedure TPlayObject.BaseObjectMove(sMap,sX,sY:String); //004BD0C4
var
  Envir:TEnvirnoment;
  nX,nY:Integer;
begin
  Envir:=m_PEnvir;
  if sMap = '' then sMap:=m_sMapName;
  if (sX <> '') and (sY <> '') then begin
    nX:=Str_ToInt(sX,0);
    nY:=Str_ToInt(sY,0);
    SpaceMove(sMap,nX,nY,0);
  end else begin
    MapRandomMove(sMap,0);
  end;
  if (Envir <> m_PEnvir) and (m_btRaceServer = RC_PLAYOBJECT) then begin
    m_boTimeRecall:=False;
  end;
      
end;
//使用祝福油
function TPlayObject.WeaptonMakeLuck: Boolean; //004BD4A0
var
  StdItem:TItem;
  nRand:Integer;
  boMakeLuck:Boolean;
begin
  Result:=False;
  if m_UseItems[U_WEAPON].wIndex <= 0 then exit;
  nRand:=0;
  StdItem:=UserEngine.GetStdItem(m_UseItems[U_WEAPON].wIndex);
  if StdItem <> nil then begin
    nRand:=abs((StdItem.DC2 - StdItem.DC)) div 5;
  end;
  if Random(g_Config.nWeaponMakeUnLuckRate{20}) = 1 then begin
    MakeWeaponUnlock();
  end else begin //004BD527
    boMakeLuck:=False;
    if m_UseItems[U_WEAPON].btValue[4] > 0 then begin
      Dec(m_UseItems[U_WEAPON].btValue[4]);
      SysMsg(g_sWeaptonMakeLuck{'武器被加幸运了...'},c_Green,t_Hint);
      boMakeLuck:=True;
    end else if m_UseItems[U_WEAPON].btValue[3] < g_Config.nWeaponMakeLuckPoint1{1} then begin
      Inc(m_UseItems[U_WEAPON].btValue[3]);
      SysMsg(g_sWeaptonMakeLuck{'武器被加幸运了...'},c_Green,t_Hint);
      boMakeLuck:=True;
    end else if (m_UseItems[U_WEAPON].btValue[3] < g_Config.nWeaponMakeLuckPoint2{3}) and (Random(nRand + g_Config.nWeaponMakeLuckPoint2Rate{6}) = 1) then begin
      Inc(m_UseItems[U_WEAPON].btValue[3]);
      SysMsg(g_sWeaptonMakeLuck{'武器被加幸运了...'},c_Green,t_Hint);
      boMakeLuck:=True;
    end else if (m_UseItems[U_WEAPON].btValue[3] < g_Config.nWeaponMakeLuckPoint3{7}) and (Random(nRand * g_Config.nWeaponMakeLuckPoint3Rate{10 + 30}) = 1) then begin
      Inc(m_UseItems[U_WEAPON].btValue[3]);
      SysMsg(g_sWeaptonMakeLuck{'武器被加幸运了...'},c_Green,t_Hint);
      boMakeLuck:=True;
    end;
    if m_btRaceServer = RC_PLAYOBJECT then begin
      RecalcAbilitys();
      SendMsg(Self,RM_ABILITY,0,0,0,0,'');
      SendMsg(Self,RM_SUBABILITY,0,0,0,0,'');
    end;
    if not boMakeLuck then SysMsg(g_sWeaptonNotMakeLuck{'无效'},c_Green,t_Hint);
  end;
  Result:=True;
end;

function TPlayObject.RepairWeapon: Boolean; //004BD69C
var
  nDura:Integer;
  UserItem:pTUserItem;
begin
  Result:=False;
  UserItem:=@m_UseItems[U_WEAPON];
  if (UserItem.wIndex <= 0) or (UserItem.DuraMax <= UserItem.Dura) then exit;
  Dec(UserItem.DuraMax,(UserItem.DuraMax - UserItem.Dura) div g_Config.nRepairItemDecDura{30});
  nDura:=_MIN(5000,UserItem.DuraMax - UserItem.Dura);
  if nDura > 0 then begin
    Inc(UserItem.Dura,nDura);
    SendMsg(Self,RM_DURACHANGE,1,UserItem.Dura,UserItem.DuraMax,0,'');
    SysMsg(g_sWeaponRepairSuccess{'武器修复成功...'},c_Green,t_Hint);
    Result:=True;
  end;    
end;

function TPlayObject.SuperRepairWeapon: Boolean; //004BD768
begin
  Result:=False;
  if m_UseItems[U_WEAPON].wIndex <= 0 then exit;
  m_UseItems[U_WEAPON].Dura:=m_UseItems[U_WEAPON].DuraMax;
  SendMsg(Self,RM_DURACHANGE,1,m_UseItems[U_WEAPON].Dura,m_UseItems[U_WEAPON].DuraMax,0,'');
  SysMsg(g_sWeaponRepairSuccess{'武器修复成功...'},c_Green,t_Hint);
  Result:=True;
end;

function TPlayObject.WinLottery: Boolean; //004BD7F8
var
  nGold,nWinLevel,nRate:Integer;
begin
  nGold:=0;
  nWinLevel:=0;
  {
  case Random(30000) of
    0..4999: begin //004BD866
     if nWinLotteryCount < nNoWinLotteryCount then begin
       nGold:=500;
       nWinLevel:=6;
       Inc(nWinLotteryLevel6);
     end;
    end;
    14000..15999: begin //004BD895
     if nWinLotteryCount < nNoWinLotteryCount then begin
       nGold:=1000;
       nWinLevel:=5;
       Inc(nWinLotteryLevel5);
     end;
    end;
    16000..16149: begin //004BD8C4
     if nWinLotteryCount < nNoWinLotteryCount then begin
       nGold:=10000;
       nWinLevel:=4;
       Inc(nWinLotteryLevel4);
     end;
    end;
    16150..16169: begin //004BD8F0
     if nWinLotteryCount < nNoWinLotteryCount then begin
       nGold:=100000;
       nWinLevel:=3;
       Inc(nWinLotteryLevel3);
     end;
    end;
    16170..16179: begin //004BD918
     if nWinLotteryCount < nNoWinLotteryCount then begin
       nGold:=200000;
       nWinLevel:=2;
       Inc(nWinLotteryLevel2);
     end;
    end;
    16180 + 1820: begin //004BD940
     if nWinLotteryCount < nNoWinLotteryCount then begin
       nGold:=1000000;
       nWinLevel:=1;
       Inc(nWinLotteryLevel1);
     end;
    end;
  end;
  }
  nRate:=Random(g_Config.nWinLotteryRate);
  if nRate in [g_Config.nWinLottery6Min..g_Config.nWinLottery6Max] then begin
    if g_Config.nWinLotteryCount < g_Config.nNoWinLotteryCount then begin
      nGold:=g_Config.nWinLottery6Gold;
      nWinLevel:=6;
      Inc(g_Config.nWinLotteryLevel6);
    end;
  end else
  if nRate in [g_Config.nWinLottery5Min..g_Config.nWinLottery5Max] then begin
    if g_Config.nWinLotteryCount < g_Config.nNoWinLotteryCount then begin
      nGold:=g_Config.nWinLottery5Gold;
      nWinLevel:=5;
      Inc(g_Config.nWinLotteryLevel5);
    end;
  end else
  if nRate in [g_Config.nWinLottery4Min..g_Config.nWinLottery4Max] then begin
    if g_Config.nWinLotteryCount < g_Config.nNoWinLotteryCount then begin
      nGold:=g_Config.nWinLottery4Gold;
      nWinLevel:=4;
      Inc(g_Config.nWinLotteryLevel4);
    end;
  end else
  if nRate in [g_Config.nWinLottery3Min..g_Config.nWinLottery3Max] then begin
    if g_Config.nWinLotteryCount < g_Config.nNoWinLotteryCount then begin
      nGold:=g_Config.nWinLottery3Gold;
      nWinLevel:=3;
      Inc(g_Config.nWinLotteryLevel3);
    end;
  end else
  if nRate in [g_Config.nWinLottery2Min..g_Config.nWinLottery2Max] then begin
    if g_Config.nWinLotteryCount < g_Config.nNoWinLotteryCount then begin
      nGold:=g_Config.nWinLottery2Gold;
      nWinLevel:=2;
      Inc(g_Config.nWinLotteryLevel2);
    end;
  end else
  if nRate in [g_Config.nWinLottery1Min + g_Config.nWinLottery1Max] then begin
    if g_Config.nWinLotteryCount < g_Config.nNoWinLotteryCount then begin
      nGold:=g_Config.nWinLottery1Gold;
      nWinLevel:=1;
      Inc(g_Config.nWinLotteryLevel1);
    end;
  end;
  if nGold > 0 then begin
    case nWinLevel of    //
      1: SysMsg(g_sWinLottery1Msg{'祝贺您，中了一等奖。'},c_Green,t_Hint);
      2: SysMsg(g_sWinLottery2Msg{'祝贺您，中了二等奖。'},c_Green,t_Hint);
      3: SysMsg(g_sWinLottery3Msg{'祝贺您，中了三等奖。'},c_Green,t_Hint);
      4: SysMsg(g_sWinLottery4Msg{'祝贺您，中了四等奖。'},c_Green,t_Hint);
      5: SysMsg(g_sWinLottery5Msg{'祝贺您，中了五等奖。'},c_Green,t_Hint);
      6: SysMsg(g_sWinLottery6Msg{'祝贺您，中了六等奖。'},c_Green,t_Hint);
    end;  
    if IncGold(nGold) then begin
      GoldChanged();
    end else begin
      DropGoldDown(nGold,True,nil,nil);
    end;
      
  end else begin
    Inc(g_Config.nNoWinLotteryCount,500);
    SysMsg(g_sNotWinLotteryMsg{'等下次机会吧！！！'},c_Red,t_Hint);
  end;
  Result:=True;
end;




procedure TPlayObject.ChangeServerMakeSlave(SlaveInfo: pTSlaveInfo);  //004DF84C
var
  nSlavecount:Integer;
  BaseObject:TBaseObject;
begin
  if m_btJob = jTaos then begin
    nSlavecount:=1;
  end else begin
    nSlavecount:=5;
  end;
  BaseObject:=MakeSlave(SlaveInfo.sSlaveName,3,SlaveInfo.btSlaveLevel,nSlavecount,SlaveInfo.dwRoyaltySec);
  if BaseObject <> nil then begin
    BaseObject.n294:=SlaveInfo.nKillCount;
    BaseObject.m_btSlaveExpLevel:=SlaveInfo.btSlaveExpLevel;
    BaseObject.m_WAbil.HP:=SlaveInfo.nHP;
    BaseObject.m_WAbil.MP:=SlaveInfo.nMP;
    if (1500 - SlaveInfo.btSlaveLevel * 200) < BaseObject.m_nWalkSpeed then begin
      BaseObject.m_nWalkSpeed:=1500 - SlaveInfo.btSlaveLevel * 200;
    end;
    if Integer(2000 - SlaveInfo.btSlaveLevel * 200) < BaseObject.m_nNextHitTime then begin
      BaseObject.m_nWalkSpeed:=2000 - SlaveInfo.btSlaveLevel * 200;
    end;
    RecalcAbilitys();
  end;
end;

procedure TPlayObject.SendDelDealItem(UserItem:pTUserItem); //004DD5D0
var
  pStdItem:TItem;
  StdItem:TStdItem;
  ClientItem:TClientItem;
  OClientItem:TOClientItem;
begin

  SendDefMessage(SM_DEALDELITEM_OK,0,0,0,0,'');
  if m_DealCreat <> nil then begin
    if TPlayObject(m_DealCreat).m_nSoftVersionDateEx = 0 then begin
      pStdItem:=UserEngine.GetStdItem(UserItem.wIndex);
      if pStdItem <> nil then begin
        pStdItem.GetStandardItem(StdItem);
        //pStdItem.GetItemAddValue(UserItem, StdItem);
        StdItem.Name := GetItemName(UserItem);
        CopyStdItemToOStdItem(@StdItem,@OClientItem.S);


        OClientItem.MakeIndex:=UserItem.MakeIndex;
        OClientItem.Dura:=UserItem.Dura;
        OClientItem.DuraMax:=UserItem.DuraMax;
      end;
      m_DefMsg:=MakeDefaultMsg(SM_DEALREMOTEDELITEM,Integer(Self),0,0,1);
      TPlayObject(m_DealCreat).SendSocket(@m_DefMsg,EncodeBuffer(@OClientItem,SizeOf(TOClientItem)));
    end else begin
      pStdItem:=UserEngine.GetStdItem(UserItem.wIndex);
      if pStdItem <> nil then begin
        pStdItem.GetStandardItem(ClientItem.S);
        ClientItem.S.Name := GetItemName(UserItem);


        ClientItem.MakeIndex:=UserItem.MakeIndex;
        ClientItem.Dura:=UserItem.Dura;
        ClientItem.DuraMax:=UserItem.DuraMax;
      end;
      m_DefMsg:=MakeDefaultMsg(SM_DEALREMOTEDELITEM,Integer(Self),0,0,1);
      TPlayObject(m_DealCreat).SendSocket(@m_DefMsg,EncodeBuffer(@ClientItem,SizeOf(TClientItem)));
    end;
    m_DealCreat.m_DealLastTick:=GetTickCount();
    m_DealLastTick:=GetTickCount();
  end;
end;
{
procedure TPlayObject.SendAddDealItem(UserItem: pTUserItem); //004DD464
var
  StdItem:pTStdItem;
  StdItem80:TStdItem;
  ClientItem:TClientItem;
  OClientItem:TOClientItem;
  //sItemNewName:String;
begin

  //sItemNewName:=GetItemName(UserItem.MakeIndex);
if m_nSoftVersionDateEx = 0 then begin
  SendDefMessage(SM_DEALADDITEM_OK,0,0,0,0,'');
  if m_DealCreat <> nil then begin
    StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
    if StdItem <> nil then begin
      StdItem80:=StdItem^;
      ItemUnit.GetItemAddValue(UserItem,StdItem80);
      //OClientItem.S:=StdItem80;
      CopyStdItemToOStdItem(@StdItem80,@OClientItem.S);
      //if sItemNewName <> '' then
      //  OClientItem.S.Name:=sItemNewName;
      OClientItem.MakeIndex:=UserItem.MakeIndex;
      OClientItem.Dura:=UserItem.Dura;
      OClientItem.DuraMax:=UserItem.DuraMax;
    end;
    m_DefMsg:=MakeDefaultMsg(SM_DEALREMOTEADDITEM,Integer(Self),0,0,1);
    TPlayObject(m_DealCreat).SendSocket(@m_DefMsg,EncodeBuffer(@OClientItem,SizeOf(TOClientItem)));
    m_DealCreat.m_DealLastTick:=GetTickCount();
    m_DealLastTick:=GetTickCount();
  end;
end else begin
  SendDefMessage(SM_DEALADDITEM_OK,0,0,0,0,'');
  if m_DealCreat <> nil then begin
    StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
    if StdItem <> nil then begin
      StdItem80:=StdItem^;
      ItemUnit.GetItemAddValue(UserItem,StdItem80);
      ClientItem.S:=StdItem80;
      //if sItemNewName <> '' then
      //  ClientItem.S.Name:=sItemNewName;
      ClientItem.MakeIndex:=UserItem.MakeIndex;
      ClientItem.Dura:=UserItem.Dura;
      ClientItem.DuraMax:=UserItem.DuraMax;
    end;
    m_DefMsg:=MakeDefaultMsg(SM_DEALREMOTEADDITEM,Integer(Self),0,0,1);
    TPlayObject(m_DealCreat).SendSocket(@m_DefMsg,EncodeBuffer(@ClientItem,SizeOf(TClientItem)));
    m_DealCreat.m_DealLastTick:=GetTickCount();
    m_DealLastTick:=GetTickCount();
  end;
end;
end;
}
procedure TPlayObject.SendAddDealItem(UserItem: pTUserItem); //004DD464
var
  StdItem:TItem;
  StdItem80:TStdItem;
  ClientItem:TClientItem;
  OClientItem:TOClientItem;
begin
  SendDefMessage(SM_DEALADDITEM_OK,0,0,0,0,'');
  if m_DealCreat <> nil then begin
    if TPlayObject(m_DealCreat).m_nSoftVersionDateEx = 0 then begin
      StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
      if StdItem <> nil then begin
        StdItem.GetStandardItem(StdItem80);
        StdItem.GetItemAddValue(UserItem,StdItem80);
        StdItem80.Name := GetItemName(UserItem);
        CopyStdItemToOStdItem(@StdItem80,@OClientItem.S);


        OClientItem.MakeIndex:=UserItem.MakeIndex;
        OClientItem.Dura:=UserItem.Dura;
        OClientItem.DuraMax:=UserItem.DuraMax;
        m_DefMsg:=MakeDefaultMsg(SM_DEALREMOTEADDITEM,Integer(Self),0,0,1);
        TPlayObject(m_DealCreat).SendSocket(@m_DefMsg,EncodeBuffer(@OClientItem,SizeOf(TOClientItem)));
        m_DealCreat.m_DealLastTick:=GetTickCount();
        m_DealLastTick:=GetTickCount();
      end;
    end else begin
      StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
      if StdItem <> nil then begin
        StdItem.GetStandardItem(ClientItem.S);
        StdItem.GetItemAddValue(UserItem,ClientItem.S);
        ClientItem.S.Name := GetItemName(UserItem);

        
        ClientItem.MakeIndex:=UserItem.MakeIndex;
        ClientItem.Dura:=UserItem.Dura;
        ClientItem.DuraMax:=UserItem.DuraMax;
        m_DefMsg:=MakeDefaultMsg(SM_DEALREMOTEADDITEM,Integer(Self),0,0,1);
        TPlayObject(m_DealCreat).SendSocket(@m_DefMsg,EncodeBuffer(@ClientItem,SizeOf(TClientItem)));
        m_DealCreat.m_DealLastTick:=GetTickCount();
        m_DealLastTick:=GetTickCount();
      end;
    end;
  end;
end;
procedure TPlayObject.OpenDealDlg(BaseObject:TBaseObject); //004DD300
begin
  m_boDealing:=True;
  m_DealCreat:=BaseObject;
  GetBackDealItems();
  SendDefMessage(SM_DEALMENU,0,0,0,0,m_DealCreat.m_sCharName);
  m_DealLastTick:=GetTickCount();
end;

procedure TPlayObject.JoinGroup(PlayObject: TPlayObject); //004C3AE4
begin
  m_GroupOwner:=PlayObject;
  //SendGroupText(m_sCharName + ' 已加入小组.');
  SendGroupText(format(g_sJoinGroup,[m_sCharName]));
end;

procedure TPlayObject.MakeMine; //004CB3AC
  function RandomDrua():Integer;
  begin
    Result:=Random(g_Config.nStoneGeneralDuraRate{13000}) + g_Config.nStoneMinDura{3000};
    if Random(g_Config.nStoneAddDuraRate{20}) = 0 then begin
      Result:=Result + Random(g_Config.nStoneAddDuraMax{10000});
    end;
  end;
var
  UserItem:pTUserItem;
  nRandom:Integer;
begin
  if m_ItemList.Count >= MAXBAGITEM then exit;
  
  nRandom:=Random(g_Config.nStoneTypeRate{120});
  if nRandom in [g_Config.nGoldStoneMin{1}..g_Config.nGoldStoneMax{2}] then begin
    New(UserItem);
    if UserEngine.CopyToUserItemFromName(g_Config.sGoldStone,UserItem) then begin
      UserItem.Dura:=RandomDrua();
      m_ItemList.Add(UserItem);
      WeightChanged();
      SendAddItem(UserItem);
    end else Dispose(UserItem);
    exit;
  end;
  if nRandom in [g_Config.nSilverStoneMin{3}..g_Config.nSilverStoneMax{20}] then begin
    New(UserItem);
    if UserEngine.CopyToUserItemFromName(g_Config.sSilverStone,UserItem) then begin
      UserItem.Dura:=RandomDrua();
      m_ItemList.Add(UserItem);
      WeightChanged();
      SendAddItem(UserItem);
    end else Dispose(UserItem);
    exit;
  end;
  if nRandom in [g_Config.nSteelStoneMin{21}..g_Config.nSteelStoneMax{45}] then begin
    New(UserItem);
    if UserEngine.CopyToUserItemFromName(g_Config.sSteelStone,UserItem) then begin
      UserItem.Dura:=RandomDrua();
      m_ItemList.Add(UserItem);
      WeightChanged();
      SendAddItem(UserItem);
    end else Dispose(UserItem);
    exit;
  end;
  if nRandom in [g_Config.nBlackStoneMin{46}..g_Config.nBlackStoneMax{56}] then begin
    New(UserItem);
    if UserEngine.CopyToUserItemFromName(g_Config.sBlackStone,UserItem) then begin
      UserItem.Dura:=RandomDrua();
      m_ItemList.Add(UserItem);
      WeightChanged();
      SendAddItem(UserItem);
    end else Dispose(UserItem);
    exit;
  end;
  New(UserItem);
  if UserEngine.CopyToUserItemFromName(g_Config.sCopperStone,UserItem) then begin
    UserItem.Dura:=RandomDrua();
    m_ItemList.Add(UserItem);
    WeightChanged();
    SendAddItem(UserItem);
  end else Dispose(UserItem);


  {
  case Random(120) of    //
    1..2: begin
      New(UserItem);
      if UserEngine.CopyToUserItemFromName(sGoldStone,UserItem) then begin
        UserItem.Dura:=RandomDrua();
        m_ItemList.Add(UserItem);
        WeightChanged();
        SendAddItem(UserItem);
      end else Dispose(UserItem);
    end;
    3..20: begin
      New(UserItem);
      if UserEngine.CopyToUserItemFromName(sSilverStone,UserItem) then begin
        UserItem.Dura:=RandomDrua();
        m_ItemList.Add(UserItem);
        WeightChanged();
        SendAddItem(UserItem);
      end else Dispose(UserItem);
    end;
    21..45: begin
      New(UserItem);
      if UserEngine.CopyToUserItemFromName(sSteelStone,UserItem) then begin
        UserItem.Dura:=RandomDrua();
        m_ItemList.Add(UserItem);
        WeightChanged();
        SendAddItem(UserItem);
      end else Dispose(UserItem);
    end;
    46..56: begin
      New(UserItem);
      if UserEngine.CopyToUserItemFromName(sBlackStone,UserItem) then begin
        UserItem.Dura:=RandomDrua();
        m_ItemList.Add(UserItem);
        WeightChanged();
        SendAddItem(UserItem);
      end else Dispose(UserItem);
    end;
    else begin
      New(UserItem);
      if UserEngine.CopyToUserItemFromName(sCopperStone,UserItem) then begin
        UserItem.Dura:=RandomDrua();
        m_ItemList.Add(UserItem);
        WeightChanged();
        SendAddItem(UserItem);
      end else Dispose(UserItem);
    end;
  end;
  }
end;

procedure TPlayObject.MakeMine2;
  function RandomDrua():Integer;
  begin
    Result:=Random(g_Config.nStoneGeneralDuraRate{13000}) + g_Config.nStoneMinDura{3000};
    if Random(g_Config.nStoneAddDuraRate{20}) = 0 then begin
      Result:=Result + Random(g_Config.nStoneAddDuraMax{10000});
    end;
  end;
var
  UserItem:pTUserItem;
  nRandom:Integer;
begin
  if m_ItemList.Count >= MAXBAGITEM then exit;

 case Random(120) of    //
    1..2: begin
      New(UserItem);
      if UserEngine.CopyToUserItemFromName(g_Config.sGemStone1,UserItem) then begin
        UserItem.Dura:=RandomDrua();
        m_ItemList.Add(UserItem);
        WeightChanged();
        SendAddItem(UserItem);
      end else Dispose(UserItem);
    end;
    3..20: begin
      New(UserItem);
      if UserEngine.CopyToUserItemFromName(g_Config.sGemStone2,UserItem) then begin
        UserItem.Dura:=RandomDrua();
        m_ItemList.Add(UserItem);
        WeightChanged();
        SendAddItem(UserItem);
      end else Dispose(UserItem);
    end;
    21..45: begin
      New(UserItem);
      if UserEngine.CopyToUserItemFromName(g_Config.sGemStone3,UserItem) then begin
        UserItem.Dura:=RandomDrua();
        m_ItemList.Add(UserItem);
        WeightChanged();
        SendAddItem(UserItem);
      end else Dispose(UserItem);
    end;
    else begin
      New(UserItem);
      if UserEngine.CopyToUserItemFromName(g_Config.sGemStone4,UserItem) then begin
        UserItem.Dura:=RandomDrua();
        m_ItemList.Add(UserItem);
        WeightChanged();
        SendAddItem(UserItem);
      end else Dispose(UserItem);
    end;
  end;
end;

function TPlayObject.QuestCheckItem(sItemName: String; var nCount,
  nParam: Integer; var nDura: Integer): pTUserItem; //004C4B78
var
  I: Integer;
  UserItem:pTUserItem;
  s1C:String;
begin
  Result:=nil;
  nParam:=0;
  nDura:=0;
  nCount:=0;
  for I := 0 to m_ItemList.Count - 1 do begin
    UserItem:=m_ItemList.Items[i];
    s1C:=UserEngine.GetStdItemName(UserItem.wIndex);
    if CompareText(s1C,sItemName) = 0 then begin
      if UserItem.Dura > nDura then begin
        nDura:=UserItem.Dura;
        Result:=UserItem;
      end;
      Inc(nParam,UserItem.Dura);
      if Result = nil then
        Result:=UserItem;
      Inc(nCount);
    end; //004C4C97
  end;
end;

function TPlayObject.QuestTakeCheckItem(CheckItem: pTUserItem):Boolean; //004C4F6C
var
  I: Integer;
  UserItem: pTUserItem;
begin
  Result:=False;
  for I := 0 to m_ItemList.Count - 1 do begin
    UserItem:=m_ItemList.Items[I];
    if UserItem = CheckItem then begin
      SendDelItems(UserItem);
      Dispose(UserItem);
      m_ItemList.Delete(I);
      Result:=True;
      break;
    end;
  end;
  for I := Low(m_UseItems) to High(m_UseItems) do begin
    if @m_UseItems[I] = CheckItem then begin
      SendDelItems(@m_UseItems[I]);
      m_UseItems[I].wIndex:=0;
      Result:=True;
      break;
    end;
  end;
end;

procedure TPlayObject.ClientQueryRepairCost(nParam1, nInt: Integer;
  sMsg: String); //004DBCCC
var
  I: Integer;
  UserItem:pTUserItem;
  UserItemA:pTUserItem;
  Merchant:TMerchant;
  sUserItemName:String;
begin
  UserItemA:=nil;
  for I := 0 to m_ItemList.Count - 1 do begin
    UserItem:=m_ItemList.Items[I];
    if (UserItem.MakeIndex = nInt) then begin
      //取自定义物品名称
      sUserItemName:=GetItemName(UserItem);

      if (CompareText(sUserItemName,sMsg) = 0) then begin
        UserItemA:=UserItem;
        break;
      end;
    end;
  end; 
  if UserItemA = nil then exit;
  Merchant:=UserEngine.FindMerchant(TObject(nParam1));
  if (Merchant <> nil) and
     ((Merchant.m_PEnvir = m_PEnvir) and
     (abs(Merchant.m_nCurrX - m_nCurrX) < 15) and
     (abs(Merchant.m_nCurrY - m_nCurrY) < 15)) then 
    Merchant.ClientQueryRepairCost(Self,UserItemA);

end;

procedure TPlayObject.ClientRepairItem(nParam1, nInt: Integer;
  sMsg: String); //004DBFC0
var
  I: Integer;
  UserItem:pTUserItem;
  Merchant:TMerchant;
  sUserItemName:String;
begin
  UserItem:=nil;
  for I := 0 to m_ItemList.Count - 1 do begin
    UserItem:=m_ItemList.Items[I];
    //取自定义物品名称
    sUserItemName:=GetItemName(UserItem);

    if (UserItem.MakeIndex = nInt) and
       (CompareText(sUserItemName,sMsg) = 0) then begin
      break;
    end;
  end;    // for
  if UserItem = nil then exit;
  Merchant:=UserEngine.FindMerchant(TObject(nParam1));
  if (Merchant <> nil) and
     ((Merchant.m_PEnvir = m_PEnvir) and
     (abs(Merchant.m_nCurrX - m_nCurrX) < 15) and
     (abs(Merchant.m_nCurrY - m_nCurrY) < 15)) then
    Merchant.ClientRepairItem(Self,UserItem);
end;


procedure TPlayObject.ClientStorageItem(NPC: TObject;
  nItemIdx: Integer; sMsg: String); //004DC2B8
var
  Merchant:TMerchant;
  I:Integer;
  UserItem:pTUserItem;
  bo19:Boolean;
  StdItem:TItem;
  sUserItemName:String;
begin
  bo19:=False;
  UserItem:=nil;

  if Pos(' ',sMsg) >= 0 then //折分物品名称(信件物品的名称后面加了使用次数)
    GetValidStr3(sMsg,sMsg,[' ']);
  
  if (m_nPayMent = 1) and not g_Config.boTryModeUseStorage then begin
    SysMsg(g_sTryModeCanotUseStorage{'试玩模式不可以使用仓库功能！！！'},c_Red,t_Hint);
    exit;
  end;
  for I := 0 to m_ItemList.Count - 1 do begin
    UserItem:=m_ItemList.Items[I];
    //取自定义物品名称
    sUserItemName:=GetItemName(UserItem);

    if (UserItem.MakeIndex = nItemIdx) and (CompareText(sUserItemName,sMsg) = 0) then begin
      Merchant:=UserEngine.FindMerchant(NPC);
      if (Merchant <> nil) and
         (Merchant.m_boStorage) and //检查NPC是否允许存物品
         (((Merchant.m_PEnvir = m_PEnvir) and
         (abs(Merchant.m_nCurrX - m_nCurrX) < 15) and
         (abs(Merchant.m_nCurrY - m_nCurrY) < 15)) or (Merchant = g_FunctionNPC)) then begin
        if m_StorageItemList.Count < 39 then begin
          m_StorageItemList.Add(UserItem);
          m_ItemList.Delete(I);
          WeightChanged();
          SendDefMessage(SM_STORAGE_OK,0,0,0,0,'');
          StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
          //004DC55E
          if StdItem.NeedIdentify = 1 then
            AddGameDataLog('1' +  #9 +
                     m_sMapName + #9 +
                     IntToStr(m_nCurrX) + #9 +
                     IntToStr(m_nCurrY) + #9 +
                     m_sCharName + #9 +
                     //UserEngine.GetStdItemName(UserItem.wIndex) + #9 +
                     StdItem.Name + #9 +
                     IntToStr(UserItem.MakeIndex) + #9 +
                     '1' + #9 +
                     '0');
        end else begin
          SendDefMessage(SM_STORAGE_FULL,0,0,0,0,'');
        end;
        bo19:=True;
      end;
      break;
    end;
  end;
  if not bo19 then SendDefMessage(SM_STORAGE_FAIL,0,0,0,0,'');

end;
procedure TPlayObject.ClientTakeBackStorageItem(NPC: TObject;
  nItemIdx: Integer; sMsg: String); //004DC664
var
  Merchant:TMerchant;
  I:Integer;
  UserItem:pTUserItem;
  bo19:Boolean;
  StdItem:TItem;
  sUserItemName:String;
begin
  bo19:=False;
  UserItem:=nil;
  Merchant:=UserEngine.FindMerchant(NPC);
  if Merchant = nil then exit;    
  if (m_nPayMent = 1) and not g_Config.boTryModeUseStorage then begin
    SysMsg(g_sTryModeCanotUseStorage{'试玩模式不可以使用仓库功能！！！'},c_Red,t_Hint);
    exit;
  end;
  if not m_boCanGetBackItem then begin
    SendMsg(Merchant,RM_MENU_OK,0,Integer(Self),0,0,g_sStorageIsLockedMsg + '\ \'
                      + '仓库开锁命令: @' + g_GameCommand.UNLOCKSTORAGE.sCmd + '\'
                      + '仓库加锁命令: @' + g_GameCommand.LOCK.sCmd + '\'
                      + '设置密码命令: @' + g_GameCommand.SETPASSWORD.sCmd + '\'
                      + '修改密码命令: @' + g_GameCommand.CHGPASSWORD.sCmd);
    exit;
  end;
  {
  if m_boPasswordLocked then begin
    SendMsg(Merchant,RM_MENU_OK,0,Integer(Self),0,0,g_sStorageIsLockedMsg + '\ \'
                      + '仓库开锁命令: @' + g_GameCommand.UNLOCK + '\'
                      + '仓库加锁命令: @' + g_GameCommand.LOCK + '\'
                      + '设置密码命令: @' + g_GameCommand.SETPASSWORD + '\'
                      + '修改密码命令: @' + g_GameCommand.CHGPASSWORD);
    exit;
  end;
  }

  for I := 0 to m_StorageItemList.Count - 1 do begin
    UserItem:=m_StorageItemList.Items[I];

    //取自定义物品名称
    sUserItemName:=GetItemName(UserItem);

    if (UserItem.MakeIndex = nItemIdx) and
       (CompareText(sUserItemName,sMsg) = 0) then begin

      if (IsAddWeightAvailable(UserEngine.GetStdItemWeight(UserItem.wIndex))) then begin
        if (Merchant <> nil) and
           (Merchant.m_boGetback) and //检查NPC是否允许取物品
           (((Merchant.m_PEnvir = m_PEnvir) and
           (abs(Merchant.m_nCurrX - m_nCurrX) < 15) and
           (abs(Merchant.m_nCurrY - m_nCurrY) < 15)) or (Merchant = g_FunctionNPC)) then begin

          if AddItemToBag(UserItem) then begin
            SendAddItem(UserItem);
            m_StorageItemList.Delete(I);
            SendDefMessage(SM_TAKEBACKSTORAGEITEM_OK,nItemIdx,0,0,0,'');
            StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
            if StdItem.NeedIdentify = 1 then
              AddGameDataLog('0' +  #9 +
                     m_sMapName + #9 +
                     IntToStr(m_nCurrX) + #9 +
                     IntToStr(m_nCurrY) + #9 +
                     m_sCharName + #9 +
                     //UserEngine.GetStdItemName(UserItem.wIndex) + #9 +
                     StdItem.Name + #9 +
                     IntToStr(UserItem.MakeIndex) + #9 +
                     '1' + #9 +
                     '0');
          end else begin
            SendDefMessage(SM_TAKEBACKSTORAGEITEM_FULLBAG,0,0,0,0,'');
          end;

          bo19:=True;
        end;
      end else begin
        SysMsg(g_sCanotGetItems{'无法携带更多的东西！！！'},c_Red,t_Hint);
      end;
      break;
    end;
  end;
  if not bo19 then SendDefMessage(SM_TAKEBACKSTORAGEITEM_FAIL,0,0,0,0,'');
end;

procedure TPlayObject.MakeSaveRcd(var HumanRcd: THumDataInfo);//004B3580
var
  I: Integer;
  HumData:pTHumData;
  HumItems:pTHumItems;
  BagItems:pTBagItems;
  HumMagic:pTHumMagic;
  UserMagic:pTUserMagic;
  StorageItems:pTStorageItems;
begin
  HumData:=@HumanRcd.Data;
  HumData.sChrName:=m_sCharName;
  HumData.sCurMap:=m_sMapName;
  HumData.wCurX:=m_nCurrX;
  HumData.wCurY:=m_nCurrY;
  HumData.btDir:=m_btDirection;
  HumData.btHair:=m_btHair;
  HumData.btSex:=m_btGender;
  HumData.btJob:=m_btJob;
  HumData.nGold:=m_nGold;

  HumData.Abil.Level:=m_Abil.Level;
  HumData.Abil.HP:=m_Abil.HP;
  HumData.Abil.MP:=m_Abil.MP;
  HumData.Abil.MaxHP:=m_Abil.MaxHP;
  HumData.Abil.MaxMP:=m_Abil.MaxMP;
  HumData.Abil.Exp:=m_Abil.Exp;
  HumData.Abil.MaxExp:=m_Abil.MaxExp;
  HumData.Abil.Weight:=m_Abil.Weight;
  HumData.Abil.MaxWeight:=m_Abil.MaxWeight;
  HumData.Abil.WearWeight:=m_Abil.WearWeight;
  HumData.Abil.MaxWearWeight:=m_Abil.MaxWearWeight;
  HumData.Abil.HandWeight:=m_Abil.HandWeight;
  HumData.Abil.MaxHandWeight:=m_Abil.MaxHandWeight;


  //HumData.Abil:=m_Abil;
  HumData.Abil.HP:=m_WAbil.HP;
  HumData.Abil.MP:=m_WAbil.MP;

  HumData.wStatusTimeArr:=m_wStatusTimeArr;
  HumData.sHomeMap:=m_sHomeMap;
  HumData.wHomeX:=m_nHomeX;
  HumData.wHomeY:=m_nHomeY;
  HumData.nPKPoint:=m_nPkPoint;
  HumData.BonusAbil:=m_BonusAbil;// 08/09
  HumData.nBonusPoint:=m_nBonusPoint;// 08/09
  HumData.sStoragePwd:=m_sStoragePwd;
  HumData.btCreditPoint:=m_btCreditPoint;
  HumData.btReLevel:=m_btReLevel;

  HumData.sMasterName:=m_sMasterName;
  HumData.boMaster:=m_boMaster;
  HumData.sDearName:=m_sDearName;

  HumData.nGameGold:=m_nGameGold;
  HumData.nGamePoint:=m_nGamePoint;


  if m_boAllowGroup then HumData.btAllowGroup:=1
  else HumData.btAllowGroup:=0;
  HumData.btF9:=btB2;
  HumData.btAttatckMode:=m_btAttatckMode;
  HumData.btIncHealth:=m_nIncHealth;
  HumData.btIncSpell:=m_nIncSpell;
  HumData.btIncHealing:=m_nIncHealing;
  HumData.btFightZoneDieCount:=m_nFightZoneDieCount;
  HumData.sAccount:=m_sUserID;
  HumData.btEE:=nC4;
  HumData.boLockLogon:=m_boLockLogon;
  HumData.wContribution:=m_wContribution;
  HumData.btEF:=btC8;
  HumData.nHungerStatus:=m_nHungerStatus;
  HumData.boAllowGuildReCall:=m_boAllowGuildReCall;
  HumData.wGroupRcallTime:=m_wGroupRcallTime;
  HumData.dBodyLuck:=m_dBodyLuck;
  HumData.boAllowGroupReCall:=m_boAllowGroupReCall;
  HumData.QuestUnitOpen:=m_QuestUnitOpen;
  HumData.QuestUnit:=m_QuestUnit;
  HumData.QuestFlag:=m_QuestFlag;

  HumItems:=@HumanRcd.Data.HumItems;
  HumItems[U_DRESS]:=m_UseItems[U_DRESS];
  HumItems[U_WEAPON]:=m_UseItems[U_WEAPON];
  HumItems[U_RIGHTHAND]:=m_UseItems[U_RIGHTHAND];
  HumItems[U_HELMET]:=m_UseItems[U_NECKLACE];
  HumItems[U_NECKLACE]:=m_UseItems[U_HELMET];
  HumItems[U_ARMRINGL]:=m_UseItems[U_ARMRINGL];
  HumItems[U_ARMRINGR]:=m_UseItems[U_ARMRINGR];
  HumItems[U_RINGL]:=m_UseItems[U_RINGL];
  HumItems[U_RINGR]:=m_UseItems[U_RINGR];
  HumItems[U_BUJUK]:=m_UseItems[U_BUJUK];
  HumItems[U_BELT]:=m_UseItems[U_BELT];
  HumItems[U_BOOTS]:=m_UseItems[U_BOOTS];
  HumItems[U_CHARM]:=m_UseItems[U_CHARM];

  BagItems:=@HumanRcd.Data.BagItems;
  for I := 0 to m_ItemList.Count - 1 do begin
    if I >= MAXBAGITEM then break;
    BagItems[I]:=pTUserItem(m_ItemList.Items[I])^;
  end;
  HumMagic:=@HumanRcd.Data.Magic;
  for I := 0 to m_MagicList.Count - 1 do begin
    if I >= MAXMAGIC then break;
    UserMagic:=m_MagicList.Items[I];
    HumMagic[I].wMagIdx:=UserMagic.wMagIdx;
    HumMagic[I].btLevel:=UserMagic.btLevel;
    HumMagic[I].btKey:=UserMagic.btKey;
    HumMagic[I].nTranPoint:=UserMagic.nTranPoint;
  end;
  StorageItems:=@HumanRcd.Data.StorageItems;
  for I := 0 to m_StorageItemList.Count -1 do begin
    if I >= High(TStorageItems) then break;
    StorageItems[I]:=pTUserItem(m_StorageItemList.Items[I])^;
  end;
end;


procedure TPlayObject.RefRankInfo(nRankNo:Integer;sRankName:string);//004CAE3C
begin
  m_nGuildRankNo:=nRankNo;
  m_sGuildRankName:=sRankName;
  SendMsg(Self,RM_CHANGEGUILDNAME,0,0,0,0,'');
end;



procedure TPlayObject.GetOldAbil(var OAbility: TOAbility);
begin
  {
  FillChar(OAbility, SizeOf(TOAbility), #0);
  OAbility.Level:=m_WAbil.Level;
  OAbility.AC:=MakeWord(LoWord(m_WAbil.AC),HiWord(m_WAbil.AC));
  OAbility.MAC:=MakeWord(LoWord(m_WAbil.MAC),HiWord(m_WAbil.MAC));
  OAbility.DC:=MakeWord(LoWord(m_WAbil.DC),HiWord(m_WAbil.DC));
  OAbility.MC:=MakeWord(LoWord(m_WAbil.MC),HiWord(m_WAbil.MC));
  OAbility.SC:=MakeWord(LoWord(m_WAbil.SC),HiWord(m_WAbil.SC));
  OAbility.HP:=m_WAbil.HP;
  OAbility.MP:=m_WAbil.MP;
  OAbility.MaxHP:=m_WAbil.MaxHP;
  OAbility.MaxMP:=m_WAbil.MaxMP;
  OAbility.Exp:=m_WAbil.Exp;
  OAbility.MaxExp:=m_WAbil.MaxExp;
  OAbility.Weight:=m_WAbil.Weight;
  OAbility.MaxWeight:=m_WAbil.MaxWeight;
  OAbility.WearWeight:=m_WAbil.WearWeight;
  OAbility.MaxWearWeight:=_MAX(High(Byte),m_WAbil.MaxWearWeight);
  OAbility.HandWeight:=m_WAbil.HandWeight;
  OAbility.MaxHandWeight:=_MAX(High(Byte),m_WAbil.MaxHandWeight);
  }
  FillChar(OAbility, SizeOf(TOAbility), #0);
  OAbility.Level:=m_WAbil.Level;
  OAbility.AC:=MakeWord(_MIN(High(Byte),LoWord(m_WAbil.AC)),_MIN(High(Byte),HiWord(m_WAbil.AC)));
  OAbility.MAC:=MakeWord(_MIN(High(Byte),LoWord(m_WAbil.MAC)),_MIN(High(Byte),HiWord(m_WAbil.MAC)));
  OAbility.DC:=MakeWord(_MIN(High(Byte),LoWord(m_WAbil.DC)),_MIN(High(Byte),HiWord(m_WAbil.DC)));
  OAbility.MC:=MakeWord(_MIN(High(Byte),LoWord(m_WAbil.MC)),_MIN(High(Byte),HiWord(m_WAbil.MC)));
  OAbility.SC:=MakeWord(_MIN(High(Byte),LoWord(m_WAbil.SC)),_MIN(High(Byte),HiWord(m_WAbil.SC)));
  OAbility.HP:=m_WAbil.HP;
  OAbility.MP:=m_WAbil.MP;
  OAbility.MaxHP:=m_WAbil.MaxHP;
  OAbility.MaxMP:=m_WAbil.MaxMP;
  OAbility.Exp:=m_WAbil.Exp;
  OAbility.MaxExp:=m_WAbil.MaxExp;
  OAbility.Weight:=m_WAbil.Weight;
  OAbility.MaxWeight:=m_WAbil.MaxWeight;
  OAbility.WearWeight:=_MIN(High(Byte),m_WAbil.WearWeight);
  OAbility.MaxWearWeight:=_MIN(High(Byte),m_WAbil.MaxWearWeight);
  OAbility.HandWeight:=_MIN(High(Byte),m_WAbil.HandWeight);
  OAbility.MaxHandWeight:=_MIN(High(Byte),m_WAbil.MaxHandWeight);
end;

function TPlayObject.GetHitMsgCount: Integer;
var
  I: Integer;
  SendMessage:pTSendMessage;
begin
  Result:=0;
  try
    EnterCriticalSection(ProcessMsgCriticalSection);
    for I := 0 to m_MsgList.Count - 1 do begin
      SendMessage:=m_Msglist.Items[i];
      if (SendMessage.wIdent = CM_HIT) or
         (SendMessage.wIdent = CM_HEAVYHIT) or
         (SendMessage.wIdent = CM_BIGHIT) or
         (SendMessage.wIdent = CM_POWERHIT) or
         (SendMessage.wIdent = CM_LONGHIT) or
         (SendMessage.wIdent = CM_WIDEHIT) or
         (SendMessage.wIdent = CM_FIREHIT) then begin
        Inc(Result);
      end;        
    end;
  finally
    LeaveCriticalSection(ProcessMsgCriticalSection);
  end;
end;

function TPlayObject.GetSpellMsgCount: Integer;
var
  I: Integer;
  SendMessage:pTSendMessage;
begin
  Result:=0;
  try
    EnterCriticalSection(ProcessMsgCriticalSection);
    for I := 0 to m_MsgList.Count - 1 do begin
      SendMessage:=m_Msglist.Items[i];
      if (SendMessage.wIdent = CM_SPELL) then begin
        Inc(Result);
      end;
    end;
  finally
    LeaveCriticalSection(ProcessMsgCriticalSection);
  end;
end;

function TPlayObject.GetRunMsgCount: Integer;
var
  I: Integer;
  SendMessage:pTSendMessage;
begin
  Result:=0;
  try
    EnterCriticalSection(ProcessMsgCriticalSection);
    for I := 0 to m_MsgList.Count - 1 do begin
      SendMessage:=m_Msglist.Items[i];
      if (SendMessage.wIdent = CM_RUN) then begin
        Inc(Result);
      end;
    end;
  finally
    LeaveCriticalSection(ProcessMsgCriticalSection);
  end;
end;

function TPlayObject.GetWalkMsgCount: Integer;
var
  I: Integer;
  SendMessage:pTSendMessage;
begin
  Result:=0;
  try
    EnterCriticalSection(ProcessMsgCriticalSection);
    for I := 0 to m_MsgList.Count - 1 do begin
      SendMessage:=m_Msglist.Items[i];
      if (SendMessage.wIdent = CM_WALK) then begin
        Inc(Result);
      end;
    end;
  finally
    LeaveCriticalSection(ProcessMsgCriticalSection);
  end;
end;

function TPlayObject.GetTurnMsgCount: Integer;
var
  I: Integer;
  SendMessage:pTSendMessage;
begin
  Result:=0;
  try
    EnterCriticalSection(ProcessMsgCriticalSection);
    for I := 0 to m_MsgList.Count - 1 do begin
      SendMessage:=m_Msglist.Items[i];
      if (SendMessage.wIdent = CM_TURN) then begin
        Inc(Result);
      end;
    end;
  finally
    LeaveCriticalSection(ProcessMsgCriticalSection);
  end;
end;

function TPlayObject.GetSiteDownMsgCount: Integer;
var
  I: Integer;
  SendMessage:pTSendMessage;
begin
  Result:=0;
  EnterCriticalSection(ProcessMsgCriticalSection);
  try
    for I := 0 to m_MsgList.Count - 1 do begin
      SendMessage:=m_Msglist.Items[i];
      if (SendMessage.wIdent = CM_SITDOWN) then begin
        Inc(Result);
      end;
    end;
  finally
    LeaveCriticalSection(ProcessMsgCriticalSection);
  end;
end;



function TPlayObject.CheckActionStatus(wIdent:Word;var dwDelayTime:LongWord): Boolean;
var
  dwCheckTime:LongWord;
  dwCurrTick:LongWord;
  dwActionIntervalTime:LongWord;
begin
  Result:=False;
  dwDelayTime:=0;
  //检查人物弯腰停留时间
  if not g_Config.boDisableStruck then begin
    dwCheckTime:=GetTickCount - m_dwStruckTick;
    if g_Config.dwStruckTime > dwCheckTime then begin
      dwDelayTime:=g_Config.dwStruckTime - dwCheckTime;
      m_btOldDir:=m_btDirection;
      exit;
    end;
  end;

  //检查二个不同操作之间所需间隔时间
  dwCheckTime:=GetTickCount - m_dwActionTick;

  if m_boTestSpeedMode then begin
    SysMsg('间隔: ' + IntToStr(dwCheckTime),c_Blue,t_Notice);
  end;

  if m_wOldIdent = wIdent then begin //当二次操作一样时，则将 boFirst 设置为 真 ，退出由调用函数本身检查二个相同操作之间的间隔时间

    Result:=True;
    exit;
  end;
  if not g_Config.boControlActionInterval then begin
    Result:=True;
    exit;
  end;

  dwActionIntervalTime:=m_dwActionIntervalTime;
  case wIdent of
    CM_LONGHIT: begin
      //跑位刺杀
      if g_Config.boControlRunLongHit and (m_wOldIdent = CM_RUN) and (m_btOldDir <> m_btDirection) then begin
        dwActionIntervalTime:=m_dwRunLongHitIntervalTime;
      end;
    end;
    CM_HIT: begin
      //走位攻击
      if g_Config.boControlWalkHit and (m_wOldIdent = CM_WALK) and (m_btOldDir <> m_btDirection) then begin
        dwActionIntervalTime:=m_dwWalkHitIntervalTime;
      end;
      //跑位攻击
      if g_Config.boControlRunHit and (m_wOldIdent = CM_RUN) and (m_btOldDir <> m_btDirection) then begin
        dwActionIntervalTime:=m_dwRunHitIntervalTime;
      end;
    end;
    CM_RUN: begin
      //跑位刺杀
      if g_Config.boControlRunLongHit and (m_wOldIdent = CM_LONGHIT) and (m_btOldDir <> m_btDirection) then begin
        dwActionIntervalTime:=m_dwRunLongHitIntervalTime;
      end;
      //跑位攻击
      if g_Config.boControlRunHit and (m_wOldIdent = CM_HIT) and (m_btOldDir <> m_btDirection) then begin
        dwActionIntervalTime:=m_dwRunHitIntervalTime;
      end;
      //跑位魔法
      if g_Config.boControlRunMagic and (m_wOldIdent = CM_SPELL) and (m_btOldDir <> m_btDirection) then begin
        dwActionIntervalTime:=m_dwRunMagicIntervalTime;
      end;
    end;
    CM_WALK: begin
      //走位攻击
      if g_Config.boControlWalkHit and (m_wOldIdent = CM_HIT) and (m_btOldDir <> m_btDirection) then begin
        dwActionIntervalTime:=m_dwWalkHitIntervalTime;
      end;
      //跑位刺杀
      if g_Config.boControlRunLongHit and (m_wOldIdent = CM_LONGHIT) and (m_btOldDir <> m_btDirection) then begin
        dwActionIntervalTime:=m_dwRunLongHitIntervalTime;
      end;      
    end;
    CM_SPELL: begin
      //跑位魔法
      if g_Config.boControlRunMagic and (m_wOldIdent = CM_RUN) and (m_btOldDir <> m_btDirection) then begin
        dwActionIntervalTime:=m_dwRunMagicIntervalTime;
      end;
    end;
  end;

  //将几个攻击操作合并成一个攻击操作代码
  if (wIdent = CM_HIT) or
     (wIdent = CM_HEAVYHIT) or
     (wIdent = CM_BIGHIT) or
     (wIdent = CM_POWERHIT) or
//     (wIdent = CM_LONGHIT) or
     (wIdent = CM_WIDEHIT) or
     (wIdent = CM_FIREHIT) then begin

    wIdent:=CM_HIT;
  end;



  if dwCheckTime >= dwActionIntervalTime then begin
    m_dwActionTick:=GetTickCount();
    Result:=True;
  end else begin
    dwDelayTime:=dwActionIntervalTime - dwCheckTime;
  end;
  m_wOldIdent:=wIdent;
  m_btOldDir := m_btDirection;
  {
  dwCheckTime:=GetTickCount - m_dwActionTick;
  if dwCheckTime >= m_dwActionTime then begin
    m_dwActionTick:=GetTickCount();
    m_wOldIdent:=wIdent;
    Result:=True;
  end else begin
    dwDelayTime:=m_dwActionTime - dwCheckTime;
//    m_dwActionTime:=m_dwActionTime + 20;
  end;
  }
end;
procedure TPlayObject.SetScriptLabel(sLabel: String);
begin
  m_CanJmpScriptLableList.Clear;
  m_CanJmpScriptLableList.Add(sLabel);
end;
//取得当前脚本可以跳转的标签
procedure TPlayObject.GetScriptLabel(sMsg: String);
var
  sText:String;
  sData:String;
  sCmdStr,sLabel:String;
begin
  m_CanJmpScriptLableList.Clear;
  while (True) do begin
    if sMsg = '' then break;
    sMsg:=GetValidStr3(sMsg,sText,['\']);
    if sText <> '' then begin
      sData:='';
      while (Pos('<',sText) > 0) and (Pos('>',sText) > 0) and (sText <> '') do begin
        if sText[1] <> '<' then begin
          sText:='<' + GetValidStr3(sText,sData,['<']);
        end;
        sText:=ArrestStringEx(sText,'<','>',sCmdStr);
        sLabel:=GetValidStr3(sCmdStr,sCmdStr,['/']);
        if sLabel <> '' then
          m_CanJmpScriptLableList.Add(sLabel);
      end;
    end;
  end;
end;

function TPlayObject.LableIsCanJmp(sLabel: String): Boolean;
var
  I: Integer;
begin
  Result:=False;
  if CompareText(sLabel,'@main') = 0 then begin
    Result:=True;
    exit;
  end;
  for I := 0 to m_CanJmpScriptLableList.Count - 1 do begin
    if CompareText(sLabel,m_CanJmpScriptLableList.Strings[I]) = 0 then begin
      Result:=True;
      break;
    end;
  end;
  if CompareText(sLabel,m_sPlayDiceLabel) = 0 then begin
    m_sPlayDiceLabel:='';
    Result:=True;
    exit;
  end;
end;

procedure TPlayObject.RecalcAbilitys;
begin
  inherited;
  RecalcAdjusBonus();
end;

procedure TPlayObject.UpdateVisibleGay(BaseObject: TBaseObject);
var
  I                 :Integer;
  boIsVisible       :Boolean;
  VisibleBaseObject :pTVisibleBaseObject;
begin
  boIsVisible:=False;
  if (BaseObject.m_btRaceServer = RC_PLAYOBJECT) or (BaseObject.m_Master <> nil) then
    m_boIsVisibleActive:=True;//如果是人物或宝宝则置TRUE

    
  for I := 0 to m_VisibleActors.Count - 1 do begin
    VisibleBaseObject:=m_VisibleActors.Items[i];
    if VisibleBaseObject.BaseObject = BaseObject then begin
      VisibleBaseObject.nVisibleFlag:=1;
      boIsVisible:=True;
      break;
    end;
  end;
  if boIsVisible then exit;
  New(VisibleBaseObject);
  VisibleBaseObject.nVisibleFlag := 2;
  VisibleBaseObject.BaseObject   := BaseObject;
  m_VisibleActors.Add(VisibleBaseObject);
  if (BaseObject.m_btRaceServer = RC_PLAYOBJECT) then begin
    SendWhisperMsg(TPlayObject(BaseObject));
  end;
end;

procedure TPlayObject.SearchViewRange;
var
  I           :Integer;
  nStartX     :Integer;
  nEndX       :Integer;
  nStartY     :Integer;
  nEndY       :Integer;
  n18         :Integer;
  n1C         :Integer;
  nIdx        :Integer;
  n24         :Integer;
  MapCellInfo :pTMapCellinfo;
  OSObject    :pTOSObject;
  BaseObject  :TBaseObject;
  MapItem     :pTMapItem;
  MapEvent    :TEvent;
  VisibleBaseObject :pTVisibleBaseObject;
  VisibleMapItem    :pTVisibleMapItem;
  nCheckCode        :Integer;
ResourceString
  sExceptionMsg1 = '[Exception] TPlayObject::SearchViewRange Code:%d';
  sExceptionMsg2 = '[Exception] TPlayObject::SearchViewRange 1-%d %s %s %d %d %d';

begin
  n24:=0;
  try
    nCheckCode:=2;
    for I := 0 to m_VisibleItems.Count - 1 do begin
      pTVisibleMapItem(m_VisibleItems.Items[I]).nVisibleFlag:=0;
    end;
    nCheckCode:=3;
    for I := 0 to m_VisibleEvents.Count - 1 do begin
      TEvent(m_VisibleEvents.Items[i]).nVisibleFlag:=0;
    end;
    nCheckCode:=4;
    for I := 0 to m_VisibleActors.Count - 1 do begin
      pTVisibleBaseObject(m_VisibleActors.Items[i]).nVisibleFlag:=0;
    end;
    nCheckCode:=5;
  except
    MainOutMessage(format(sExceptionMsg1,[nCheckCode]));
    KickException();
  end;
  nCheckCode:=6;

  nStartX :=m_nCurrX - m_nViewRange;
  nEndX   :=m_nCurrX + m_nViewRange;
  nStartY :=m_nCurrY - m_nViewRange;
  nEndY   :=m_nCurrY + m_nViewRange;
  try
    nCheckCode:=7;
    for n18:= nStartX to nEndX do begin
      nCheckCode:=8;
      for n1C:= nStartY to nEndY  do begin
        nCheckCode:=9;
        if m_PEnvir.GetMapCellInfo(n18,n1C,MapCellInfo) and (MapCellInfo.ObjList <> nil) then begin
          nCheckCode:=10;
          n24:=1;
          nIdx:=0;
          while (True) do begin
            nCheckCode:=11;
            if MapCellInfo.ObjList.Count <= nIdx then break;    //004B9858
              OSObject:=MapCellInfo.ObjList.Items[nIdx];
              nCheckCode:=12;
              if OSObject <> nil then begin
                nCheckCode:=13;
                if OSObject.btType = OS_MOVINGOBJECT then begin
                  nCheckCode:=14;
                  if (GetTickCount - OSObject.dwAddTime) >= 60 * 1000 then begin
                    Dispose(OSObject);
                    MapCellInfo.ObjList.Delete(nIdx);
                    if MapCellInfo.ObjList.Count > 0 then Continue;
                    MapCellInfo.ObjList.Free;
                    MapCellInfo.ObjList:=nil;
                    break;
                  end; //004B9907
                  nCheckCode:=15;
                  BaseObject:=TBaseObject(OSObject.CellObj);
                  if BaseObject <> nil then begin
                    nCheckCode:=16;
                    if not BaseObject.m_boGhost and not BaseObject.m_boFixedHideMode and not BaseObject.m_boObMode then begin
                      nCheckCode:=17;
                      if (m_btRaceServer < RC_ANIMAL) or
                         (m_Master <> nil) or
                         m_boCrazyMode or
                         m_boNastyMode or
                         m_boWantRefMsg or
                         ((BaseObject.m_Master <> nil) and (abs(BaseObject.m_nCurrX - m_nCurrX) <= 3) and (abs(BaseObject.m_nCurrY - m_nCurrY) <= 3)) or
                         (BaseObject.m_btRaceServer = RC_PLAYOBJECT) then begin
                            nCheckCode:=18;
                            UpdateVisibleGay(BaseObject);
                            nCheckCode:=19;
                      end;//004B99E2
                    end; //004B99E2
                  end; //004B99E2 if BaseObject <> nil then begin
                end; //004B99E2 if OSObject.btType = OS_MOVINGOBJECT then begin
                nCheckCode:=20;
                if m_btRaceServer = RC_PLAYOBJECT then begin
                  if OSObject.btType = OS_ITEMOBJECT then begin
                    nCheckCode:=21;
                    if (GetTickCount - OSObject.dwAddTime) > g_Config.dwClearDropOnFloorItemTime{60 * 60 * 1000} then begin
                      Dispose(pTMapItem(OSObject.CellObj));//Jacky 10/22  防止占用内存不释放现象
                      Dispose(OSObject);
                      MapCellInfo.ObjList.Delete(nIdx);
                      if MapCellInfo.ObjList.Count > 0 then Continue;
                      MapCellInfo.ObjList.Free;
                      MapCellInfo.ObjList:=nil;
                      break;
                    end; //004B9A8E
                    MapItem:=pTMapItem(OSObject.CellObj);
                    nCheckCode:=28;
                    UpdateVisibleItem(n18,n1C,MapItem);
                    if (MapItem.OfBaseObject <> nil) or (MapItem.DropBaseObject <> nil) then begin
                      nCheckCode:=29;
                      if (GetTickCount - MapItem.dwCanPickUpTick) > g_Config.dwFloorItemCanPickUpTime {2 * 60 * 1000} then begin
                        nCheckCode:=30;
                        MapItem.OfBaseObject:=nil;
                        MapItem.DropBaseObject:=nil;
                      end else begin //004B9AF6
                        nCheckCode:=31;
                        if TBaseObject(MapItem.OfBaseObject) <> nil then begin
                          nCheckCode:=32;
                          if TBaseObject(MapItem.OfBaseObject).m_boGhost then MapItem.OfBaseObject:=nil;
                        end;
                        nCheckCode:=33;
                        if TBaseObject(MapItem.DropBaseObject) <> nil then begin
                          nCheckCode:=34;
                          if TBaseObject(MapItem.DropBaseObject).m_boGhost then MapItem.DropBaseObject:=nil;
                        end;
                        nCheckCode:=35;
                      end; //004B9B38
                    end;
                  end; //004B9B38 if OSObject.btType = OS_ITEMOBJECT then begin
                  nCheckCode:=36;
                  if OSObject.btType = OS_EVENTOBJECT then begin
                    nCheckCode:=37;
                    MapEvent:=TEvent(OSObject.CellObj);
                    if MapEvent.m_boVisible then begin
                      nCheckCode:=38;
                      UpdateVisibleEvent(n18,n1C,MapEvent);
                    end;
                    nCheckCode:=39;
                  end;
                end
              end; //004B9B81 if OSObject <> nil then begin
            Inc(nIdx);
          end; //while (True) do begin
        end;
      end; //for n1C:= n10 to n14  do begin
    end; //for n18:= n8 to nC do begin
  except
    on e: Exception do begin

      MainOutMessage(format(sExceptionMsg2,[n24,m_sCharName,m_sMapName,m_nCurrX,m_nCurrY,nCheckCode]));
      {
      MainOutMessage(m_sCharName + ',' +
                     m_sMapName + ',' +
                     IntToStr(m_nCurrX) + ',' +
                     IntToStr(m_nCurrY) + ',' +
                     ' SearchViewRange 1-' +
                     IntToStr(n24));
      }
      MainOutMessage(E.Message);
      KickException();
    end;
  end;
  nCheckCode:=40;
  n24:=2;
  try
    n18:=0;
    while (True) do begin
      if m_VisibleActors.Count <= n18 then break;
      nCheckCode:=41;
      VisibleBaseObject:=m_VisibleActors.Items[n18];
      nCheckCode:=42;
      if VisibleBaseObject.nVisibleFlag = 0 then begin
        nCheckCode:=43;
        if m_btRaceServer = RC_PLAYOBJECT then begin
          nCheckCode:=44;
          BaseObject:=TBaseObject(VisibleBaseObject.BaseObject);
          {
          if not BaseObject.m_boFixedHideMode then
            SendMsg(BaseObject,RM_DISAPPEAR,0,0,0,0,'');
          }
          nCheckCode:=45;
          if not BaseObject.m_boFixedHideMode and (not BaseObject.m_boGhost) then begin//01/21 修改防止人物退出时发送重复的消息占用带宽，人物进入隐身模式时人物不消失问题
            nCheckCode:=46;
            SendMsg(BaseObject,RM_DISAPPEAR,0,0,0,0,'');
          end;
          nCheckCode:=47;
        end;
        m_VisibleActors.Delete(n18);
        nCheckCode:=48;
        Dispose(VisibleBaseObject);
        nCheckCode:=49;
        Continue;
      end;
      nCheckCode:=50;
      if (m_btRaceServer = RC_PLAYOBJECT) and (VisibleBaseObject.nVisibleFlag = 2) then begin
        nCheckCode:=51;
        BaseObject:=TBaseObject(VisibleBaseObject.BaseObject);
        nCheckCode:=52;
        if BaseObject <> Self then begin
          nCheckCode:=53;
          if BaseObject.m_boDeath then begin
            nCheckCode:=54;
            if BaseObject.m_boSkeleton then begin
              nCheckCode:=55;
              SendMsg(BaseObject,RM_SKELETON,BaseObject.m_btDirection,BaseObject.m_nCurrX,BaseObject.m_nCurrY,0,'');
              nCheckCode:=56;
            end else begin //004B9DA8
              nCheckCode:=57;
              SendMsg(BaseObject,RM_DEATH,BaseObject.m_btDirection,BaseObject.m_nCurrX,BaseObject.m_nCurrY,0,'');
              nCheckCode:=58;
            end;
          end else begin //004B9DD3
            nCheckCode:=59;
            SendMsg(BaseObject,RM_TURN,BaseObject.m_btDirection,BaseObject.m_nCurrX,BaseObject.m_nCurrY,0,BaseObject.GetShowName);
            nCheckCode:=60;
          end;
        end; //004B9E09
      end;
      Inc(n18);
    end;
  except
    on e: Exception do begin
      MainOutMessage(format(sExceptionMsg2,[n24,m_sCharName,m_sMapName,m_nCurrX,m_nCurrY,nCheckCode]));
    {MainOutMessage(m_sCharName + ',' +
                   m_sMapName + ',' +
                   IntToStr(m_nCurrX) + ',' +
                   IntToStr(m_nCurrY) + ',' +
                   ' SearchViewRange 2');}
      KickException();
    end;
  end;
  try
//    if (m_btRaceServer = RC_PLAYOBJECT) then begin
      I:=0;
      while (True) do begin
        if m_VisibleItems.Count <= I then break;
        VisibleMapItem:=m_VisibleItems.Items[I];
        if VisibleMapItem.nVisibleFlag = 0 then begin
          SendMsg(Self,RM_ITEMHIDE,0,Integer(VisibleMapItem.MapItem),VisibleMapItem.nX,VisibleMapItem.nY,'');
          m_VisibleItems.Delete(I);
          Dispose(VisibleMapItem);
          Continue;
        end; //004B9F6C
        if VisibleMapItem.nVisibleFlag = 2 then begin
          SendMsg(Self,RM_ITEMSHOW,VisibleMapItem.wLooks,Integer(VisibleMapItem.MapItem),VisibleMapItem.nX,VisibleMapItem.nY,VisibleMapItem.sName);
        end;
        Inc(I);
      end;
      I:=0;
      while (True) do begin
        if m_VisibleEvents.Count <= I then break;
        MapEvent:=m_VisibleEvents.Items[I];
        if MapEvent.nVisibleFlag = 0 then begin
          SendMsg(Self,RM_HIDEEVENT,0,Integer(MapEvent),MapEvent.m_nX,MapEvent.m_nY,'');
          m_VisibleEvents.Delete(I);
          Continue;
        end; //004BA053
        if MapEvent.nVisibleFlag = 2 then begin
          SendMsg(Self,RM_SHOWEVENT,MapEvent.m_nEventType,Integer(MapEvent),MakeLong(MapEvent.m_nX,MapEvent.m_nEventParam),MapEvent.m_nY,'');
        end;
        Inc(I);
      end;
//    end;
  except
    MainOutMessage(m_sCharName + ',' +
                   m_sMapName + ',' +
                   IntToStr(m_nCurrX) + ',' +
                   IntToStr(m_nCurrY) + ',' +
                   ' SearchViewRange 3');

    KickException();
  end;
end;





{
function TPlayObject.GetShowName: String;
var
  sShowName:String;
  sGuildName:String;
  sDearName:String;
  sMasterName:String;
begin
try
  //sShowName:=m_sCharName;
  if m_MyGuild <> nil then begin
    if UserCastle.IsMasterGuild(TGuild(m_MyGuild)) then begin
      sGuildName:='(' + UserCastle.sName + ')' + TGuild(m_MyGuild).sGuildName + '[' + m_sGuildRankName + ']';
    end else begin
      if g_boShowGuildName or (UserCastle.boUnderWar and (m_boInFreePKArea or UserCastle.IsCastleWarArea(m_PEnvir,m_nCurrX,m_nCurrY))) then begin
        sGuildName:= TGuild(m_MyGuild).sGuildName + '[' + m_sGuildRankName + ']';
      end;
    end;
  end;
  if m_sMasterName <> '' then begin
    if m_boMaster then begin
      sMasterName:= m_sMasterName + '的师傅';
    end else begin
      sMasterName:= m_sMasterName + '的徒弟';
    end;
  end;
  if m_sDearName <> '' then begin
    if m_btGender = gMan then begin
      sDearName:= m_sDearName + '的老公';
    end else begin
      sDearName:= m_sDearName + '的老婆';
    end;
  end;
  sShowName:=sGuildName;
  sShowName:= sShowName + '\' + m_sCharName;
  if sDearName <> '' then begin
    sShowName:= sShowName + '\' + sDearName;
  end;
  if sMasterName <> '' then begin
    sShowName:= sShowName + '\' + sMasterName;
  end;

  Result:=sShowName;
except
  on e: Exception do begin
    MainOutMessage('[Exception] TPlayObject.GetShowName');
    MainOutMessage(E.Message);
  end;
end;
end;
}
function TPlayObject.GetShowName: String;
var
  sShowName:String;
  sCharName:String;
  sGuildName:String;
  sDearName:String;
  sMasterName:String;
  Castle:TUserCastle;
ResourceString
  sExceptionMsg = '[Exception] TPlayObject::GetShowName';
begin
try
  //sShowName:=m_sCharName;
  sCharName:='';
  sGuildName:='';
  sDearName:='';
  sMasterName:='';
  if m_MyGuild <> nil then begin
    Castle:=g_CastleManager.IsCastleMember(Self);
    {
    if UserCastle.IsMasterGuild(TGuild(m_MyGuild)) then begin
      sGuildName:=AnsiReplaceText(g_sCastleGuildName,'%castlename',UserCastle.m_sName);
      sGuildName:=AnsiReplaceText(sGuildName,'%guildname',TGuild(m_MyGuild).sGuildName);
      sGuildName:=AnsiReplaceText(sGuildName,'%rankname',m_sGuildRankName);
      }
    if Castle <> nil then begin
      sGuildName:=AnsiReplaceText(g_sCastleGuildName,'%castlename',Castle.m_sName);
      sGuildName:=AnsiReplaceText(sGuildName,'%guildname',TGuild(m_MyGuild).sGuildName);
      sGuildName:=AnsiReplaceText(sGuildName,'%rankname',m_sGuildRankName);
    end else begin
      Castle:=g_CastleManager.InCastleWarArea(Self);
      //01/25 多城堡
      //if g_Config.boShowGuildName or (UserCastle.m_boUnderWar and (m_boInFreePKArea or UserCastle.InCastleWarArea(m_PEnvir,m_nCurrX,m_nCurrY))) then begin
      if g_Config.boShowGuildName or (((Castle <> nil) and Castle.m_boUnderWar) or m_boInFreePKArea) then begin
        sGuildName:=AnsiReplaceText(g_sNoCastleGuildName,'%guildname',TGuild(m_MyGuild).sGuildName);
        sGuildName:=AnsiReplaceText(sGuildName,'%rankname',m_sGuildRankName);
      end;
    end;
  end;
  if not g_Config.boShowRankLevelName then begin
    if m_btReLevel > 0 then begin
      case m_btJob of
        jWarr: sCharName:=AnsiReplaceText(g_sWarrReNewName,'%chrname',m_sCharName);
        jWizard: sCharName:=AnsiReplaceText(g_sWizardReNewName,'%chrname',m_sCharName);
        jTaos: sCharName:=AnsiReplaceText(g_sTaosReNewName,'%chrname',m_sCharName);
      end;
    end else begin
      sCharName:=m_sCharName;
    end;
  end else begin
    sCharName:=format(m_sRankLevelName,[m_sCharName]);
  end;
    

  if m_sMasterName <> '' then begin
    if m_boMaster then begin
      //sMasterName:= m_sMasterName + '的师傅';
      sMasterName:= format(g_sMasterName,[m_sMasterName]);
    end else begin
      //sMasterName:= m_sMasterName + '的徒弟';
      sMasterName:= format(g_sNoMasterName,[m_sMasterName]);
    end;
  end;
  if m_sDearName <> '' then begin
    if m_btGender = gMan then begin
      //sDearName:= m_sDearName + '的老公';
      sDearName:= format(g_sManDearName,[m_sDearName]);
    end else begin
      sDearName:= format(g_sWoManDearName,[m_sDearName]);// + '的老婆';
    end;
  end;
  
  sShowName:=AnsiReplaceText(g_sHumanShowName,'%chrname',sCharName);
  sShowName:=AnsiReplaceText(sShowName,'%guildname',sGuildName);
  sShowName:=AnsiReplaceText(sShowName,'%dearname',sDearName);
  sShowName:=AnsiReplaceText(sShowName,'%mastername',sMasterName);
  Result:=sShowName;
except
  on e: Exception do begin
    MainOutMessage(sExceptionMsg);
    MainOutMessage(E.Message);
  end;
end;
end;
function TPlayObject.CheckItemsNeed(StdItem:TItem): Boolean;
var
  Castle:TUserCastle;
begin
  Result:=True;
  Castle:=g_CastleManager.IsCastleMember(Self);
  case StdItem.Need of
    6: begin
      if (m_MyGuild = nil)then begin
        Result:=False;
      end;
    end;
    60: begin
      if (m_MyGuild = nil) or (m_nGuildRankNo <> 1) then begin
        Result:=False;
      end;
    end;
    7: begin
      //if (m_MyGuild = nil) or (UserCastle.m_MasterGuild <> m_MyGuild) then begin
      if Castle = nil then begin        
        Result:=False;
      end;
    end;
    70: begin
      //if (m_MyGuild = nil) or (UserCastle.m_MasterGuild <> m_MyGuild) or (m_nGuildRankNo <> 1) then begin
      if (Castle = nil) or (m_nGuildRankNo <> 1) then begin        
        Result:=False;
      end;
    end;
    8: begin
      if m_nMemberType = 0 then Result:=False;
    end;
    81: begin
      if (m_nMemberType <> LoWord(StdItem.NeedLevel)) or (m_nMemberLevel < HiWord(StdItem.NeedLevel)) then
        Result:=False;
    end;
    82: begin
      if (m_nMemberType < LoWord(StdItem.NeedLevel)) or (m_nMemberLevel < HiWord(StdItem.NeedLevel)) then
        Result:=False;
    end;
  end;

end;
procedure TPlayObject.CheckMarry;
var
  boIsfound:Boolean;
  sUnMarryFileName:String;
  LoadList:TStringList;
  I:Integer;
  sSayMsg:String;
begin
  boIsfound:=False;
  sUnMarryFileName:=g_Config.sEnvirDir + 'UnMarry.txt';
  if FileExists(sUnMarryFileName) then begin
    LoadList:=TStringList.Create;
    LoadList.LoadFromFile(sUnMarryFileName);
    for I := 0 to LoadList.Count - 1 do begin
      if CompareText(LoadList.Strings[i],m_sCharName) = 0 then begin
        LoadList.Delete(i);
        boIsfound:=True;
        break;
      end;
    end;
    LoadList.SaveToFile(sUnMarryFileName);
    LoadList.Free;
  end;
  if boIsfound then begin
    if m_btGender = gMan then begin
      sSayMsg:=AnsiReplaceText(g_sfUnMarryManLoginMsg,'%d',m_sDearName);
      sSayMsg:=AnsiReplaceText(sSayMsg,'%s',m_sDearName);
    end else begin
      sSayMsg:=AnsiReplaceText(g_sfUnMarryWoManLoginMsg,'%d',m_sCharName);
      sSayMsg:=AnsiReplaceText(sSayMsg,'%s',m_sCharName);
    end;
    SysMsg(sSayMsg,c_Red,t_Hint);
    m_sDearName:='';
    RefShowName;
  end;
  m_DearHuman:=UserEngine.GeTPlayObject(m_sDearName);
  if m_DearHuman <> nil then begin
    m_DearHuman.m_DearHuman:=Self;
    if m_btGender = gMan then begin
      sSayMsg:=AnsiReplaceText(g_sManLoginDearOnlineSelfMsg,'%d',m_sDearName);
      sSayMsg:=AnsiReplaceText(sSayMsg,'%s',m_sCharName);
      sSayMsg:=AnsiReplaceText(sSayMsg,'%m',m_DearHuman.m_PEnvir.sMapDesc);
      sSayMsg:=AnsiReplaceText(sSayMsg,'%x',IntToStr(m_DearHuman.m_nCurrX));
      sSayMsg:=AnsiReplaceText(sSayMsg,'%y',IntToStr(m_DearHuman.m_nCurrY));
      SysMsg(sSayMsg,c_Blue,t_Hint);

      sSayMsg:=AnsiReplaceText(g_sManLoginDearOnlineDearMsg,'%d',m_sDearName);
      sSayMsg:=AnsiReplaceText(sSayMsg,'%s',m_sCharName);
      sSayMsg:=AnsiReplaceText(sSayMsg,'%m',m_PEnvir.sMapDesc);
      sSayMsg:=AnsiReplaceText(sSayMsg,'%x',IntToStr(m_nCurrX));
      sSayMsg:=AnsiReplaceText(sSayMsg,'%y',IntToStr(m_nCurrY));
      m_DearHuman.SysMsg(sSayMsg,c_Blue,t_Hint);
    end else begin
      sSayMsg:=AnsiReplaceText(g_sWoManLoginDearOnlineSelfMsg,'%d',m_sDearName);
      sSayMsg:=AnsiReplaceText(sSayMsg,'%s',m_sCharName);
      sSayMsg:=AnsiReplaceText(sSayMsg,'%m',m_DearHuman.m_PEnvir.sMapDesc);
      sSayMsg:=AnsiReplaceText(sSayMsg,'%x',IntToStr(m_DearHuman.m_nCurrX));
      sSayMsg:=AnsiReplaceText(sSayMsg,'%y',IntToStr(m_DearHuman.m_nCurrY));
      SysMsg(sSayMsg,c_Blue,t_Hint);

      sSayMsg:=AnsiReplaceText(g_sWoManLoginDearOnlineDearMsg,'%d',m_sDearName);
      sSayMsg:=AnsiReplaceText(sSayMsg,'%s',m_sCharName);
      sSayMsg:=AnsiReplaceText(sSayMsg,'%m',m_PEnvir.sMapDesc);
      sSayMsg:=AnsiReplaceText(sSayMsg,'%x',IntToStr(m_nCurrX));
      sSayMsg:=AnsiReplaceText(sSayMsg,'%y',IntToStr(m_nCurrY));
      m_DearHuman.SysMsg(sSayMsg,c_Blue,t_Hint);
    end;
  end else begin
    if m_btGender = gMan then begin
      SysMsg(g_sManLoginDearNotOnlineMsg,c_Red,t_Hint);
    end else begin
      SysMsg(g_sWoManLoginDearNotOnlineMsg,c_Red,t_Hint);
    end;
  end;

end;
procedure TPlayObject.CheckMaster;
var
  boIsfound:Boolean;
  sSayMsg:String;
  I:Integer;
  Human:TPlayObject;
begin
//处理强行脱离师徒关系
  boIsfound:=False;
  g_UnForceMasterList.Lock;
  try
    for I := 0 to g_UnForceMasterList.Count - 1 do begin
      if CompareText(g_UnForceMasterList.Strings[i],m_sCharName) = 0 then begin
        g_UnForceMasterList.Delete(i);
        SaveUnForceMasterList();
        boIsfound:=True;
        break;
      end;
    end;
  finally
    g_UnForceMasterList.UnLock;
  end;

  if boIsfound then begin
    if m_boMaster then begin
      sSayMsg:=AnsiReplaceText(g_sfUnMasterLoginMsg,'%d',m_sMasterName);
      sSayMsg:=AnsiReplaceText(sSayMsg,'%s',m_sMasterName);
    end else begin
      sSayMsg:=AnsiReplaceText(g_sfUnMasterListLoginMsg,'%d',m_sMasterName);
      sSayMsg:=AnsiReplaceText(sSayMsg,'%s',m_sMasterName);
    end;
    SysMsg(sSayMsg,c_Red,t_Hint);
    m_sMasterName:='';
    RefShowName;
  end;

  if (m_sMasterName <> '') and not m_boMaster then begin
    if m_Abil.Level >= g_Config.nMasterOKLevel then begin
      Human:=UserEngine.GeTPlayObject(m_sMasterName);
      if (Human <> nil) and (not Human.m_boDeath) and (not Human.m_boGhost) then begin
        sSayMsg:=AnsiReplaceText(g_sYourMasterListUnMasterOKMsg,'%d',m_sCharName);
        Human.SysMsg(sSayMsg,c_Red,t_Hint);
        SysMsg(g_sYouAreUnMasterOKMsg,c_Red,t_Hint);

        //如果大徒弟则将师父上的名字去掉
        if m_sCharName = Human.m_sMasterName then begin
          Human.m_sMasterName:='';
          Human.RefShowName;
        end;
        for I := 0 to Human.m_MasterList.Count - 1 do begin
          if Human.m_MasterList.Items[I] = Self then begin
            Human.m_MasterList.Delete(I);
            break;
          end;
        end;
            
        m_sMasterName:='';
        RefShowName;
        if Human.m_btCreditPoint + g_Config.nMasterOKCreditPoint <= High(Byte) then begin
          Inc(Human.m_btCreditPoint,g_Config.nMasterOKCreditPoint);
        end;
        Inc(Human.m_nBonusPoint,g_Config.nMasterOKBonusPoint);
        Human.SendMsg(Human,RM_ADJUST_BONUS,0,0,0,0,'');
      end else begin
      //如果师父不在线则保存到记录表中
        g_UnMasterList.Lock;
        try
          boIsfound:=False;
          for I := 0 to g_UnMasterList.Count - 1 do begin
            if CompareText(g_UnMasterList.Strings[i],m_sCharName) = 0 then begin
              boIsfound:=True;
              break;
            end;
          end;
          if not boIsfound then begin
            g_UnMasterList.Add(m_sMasterName);
          end;
        finally
          g_UnMasterList.UnLock;
        end;
        if not boIsfound then begin
          SaveUnMasterList();
        end;
        SysMsg(g_sYouAreUnMasterOKMsg,c_Red,t_Hint);
        m_sMasterName:='';
        RefShowName;
      end;
    end;
  end;
    

//处理出师记录
  boIsfound:=False;
  g_UnMasterList.Lock;
  try
    for I := 0 to g_UnMasterList.Count - 1 do begin
      if CompareText(g_UnMasterList.Strings[i],m_sCharName) = 0 then begin
        g_UnMasterList.Delete(i);
        SaveUnMasterList();
        boIsfound:=True;
        break;
      end;
    end;
  finally
    g_UnMasterList.UnLock;
  end;
  
  if boIsfound and m_boMaster then begin
    SysMsg(g_sUnMasterLoginMsg,c_Red,t_Hint);

    m_sMasterName:='';
    RefShowName;

    if m_btCreditPoint + g_Config.nMasterOKCreditPoint <= High(Byte) then begin
      Inc(m_btCreditPoint,g_Config.nMasterOKCreditPoint);
    end;
    Inc(m_nBonusPoint,g_Config.nMasterOKBonusPoint);
    SendMsg(Self,RM_ADJUST_BONUS,0,0,0,0,'');
  end;

  if m_sMasterName = '' then exit;
  if m_boMaster then begin
    //师父上线通知      
    m_MasterHuman:=UserEngine.GeTPlayObject(m_sMasterName);
    if m_MasterHuman <> nil then begin
      m_MasterHuman.m_MasterHuman:=Self;
      m_MasterList.Add(m_MasterHuman);
      
      sSayMsg:=AnsiReplaceText(g_sMasterOnlineSelfMsg,'%d',m_sMasterName);
      sSayMsg:=AnsiReplaceText(sSayMsg,'%s',m_sCharName);
      sSayMsg:=AnsiReplaceText(sSayMsg,'%m',m_MasterHuman.m_PEnvir.sMapDesc);
      sSayMsg:=AnsiReplaceText(sSayMsg,'%x',IntToStr(m_MasterHuman.m_nCurrX));
      sSayMsg:=AnsiReplaceText(sSayMsg,'%y',IntToStr(m_MasterHuman.m_nCurrY));
      SysMsg(sSayMsg,c_Blue,t_Hint);

      sSayMsg:=AnsiReplaceText(g_sMasterOnlineMasterListMsg,'%d',m_sMasterName);
      sSayMsg:=AnsiReplaceText(sSayMsg,'%s',m_sCharName);
      sSayMsg:=AnsiReplaceText(sSayMsg,'%m',m_PEnvir.sMapDesc);
      sSayMsg:=AnsiReplaceText(sSayMsg,'%x',IntToStr(m_nCurrX));
      sSayMsg:=AnsiReplaceText(sSayMsg,'%y',IntToStr(m_nCurrY));
      m_MasterHuman.SysMsg(sSayMsg,c_Blue,t_Hint);
    end else begin
      SysMsg(g_sMasterNotOnlineMsg,c_Red,t_Hint);
    end;
  end else begin
    //徒弟上线通知
    if m_sMasterName <> '' then begin
      m_MasterHuman:=UserEngine.GeTPlayObject(m_sMasterName);
      if m_MasterHuman <> nil then begin

        if m_MasterHuman.m_sMasterName = m_sCharName then begin
          m_MasterHuman.m_MasterHuman:=Self;
        end;

        m_MasterHuman.m_MasterList.Add(Self);

        sSayMsg:=AnsiReplaceText(g_sMasterListOnlineSelfMsg,'%d',m_sMasterName);
        sSayMsg:=AnsiReplaceText(sSayMsg,'%s',m_sCharName);
        sSayMsg:=AnsiReplaceText(sSayMsg,'%m',m_MasterHuman.m_PEnvir.sMapDesc);
        sSayMsg:=AnsiReplaceText(sSayMsg,'%x',IntToStr(m_MasterHuman.m_nCurrX));
        sSayMsg:=AnsiReplaceText(sSayMsg,'%y',IntToStr(m_MasterHuman.m_nCurrY));
        SysMsg(sSayMsg,c_Blue,t_Hint);

        sSayMsg:=AnsiReplaceText(g_sMasterListOnlineMasterMsg,'%d',m_sMasterName);
        sSayMsg:=AnsiReplaceText(sSayMsg,'%s',m_sCharName);
        sSayMsg:=AnsiReplaceText(sSayMsg,'%m',m_PEnvir.sMapDesc);
        sSayMsg:=AnsiReplaceText(sSayMsg,'%x',IntToStr(m_nCurrX));
        sSayMsg:=AnsiReplaceText(sSayMsg,'%y',IntToStr(m_nCurrY));
        m_MasterHuman.SysMsg(sSayMsg,c_Blue,t_Hint);
      end else begin
        SysMsg(g_sMasterListNotOnlineMsg,c_Red,t_Hint);
      end;
    end;
  end;
end;
procedure TPlayObject.MakeGhost;
var
  I: Integer;
  sSayMsg:String;
  Human:TPlayObject;
ResourceString
  sExceptionMsg = '[Exception] TPlayObject::MakeGhost';
begin
try
  if (g_HighLevelHuman = Self)   then g_HighLevelHuman:=nil;
  if (g_HighPKPointHuman = Self) then g_HighPKPointHuman:=nil;
  if (g_HighDCHuman = Self)      then g_HighDCHuman:=nil;
  if (g_HighMCHuman = Self)      then g_HighMCHuman:=nil;
  if (g_HighSCHuman = Self)      then g_HighSCHuman:=nil;
  if (g_HighOnlineHuman = Self)  then g_HighOnlineHuman:=nil;
  //人物下线后通知配偶，并把对方的相关记录清空
  if m_DearHuman <> nil then begin
    if m_btGender = gMan then begin
      sSayMsg:=AnsiReplaceText(g_sManLongOutDearOnlineMsg,'%d',m_sDearName);
      sSayMsg:=AnsiReplaceText(sSayMsg,'%s',m_sCharName);
      sSayMsg:=AnsiReplaceText(sSayMsg,'%m',m_PEnvir.sMapDesc);
      sSayMsg:=AnsiReplaceText(sSayMsg,'%x',IntToStr(m_nCurrX));
      sSayMsg:=AnsiReplaceText(sSayMsg,'%y',IntToStr(m_nCurrY));
      m_DearHuman.SysMsg(sSayMsg,c_Red,t_Hint);
    end else begin
      sSayMsg:=AnsiReplaceText(g_sWoManLongOutDearOnlineMsg,'%d',m_sDearName);
      sSayMsg:=AnsiReplaceText(sSayMsg,'%s',m_sCharName);
      sSayMsg:=AnsiReplaceText(sSayMsg,'%m',m_PEnvir.sMapDesc);
      sSayMsg:=AnsiReplaceText(sSayMsg,'%x',IntToStr(m_nCurrX));
      sSayMsg:=AnsiReplaceText(sSayMsg,'%y',IntToStr(m_nCurrY));
      m_DearHuman.SysMsg(sSayMsg,c_Red,t_Hint);
    end;
    m_DearHuman.m_DearHuman:=nil;
    m_DearHuman:=nil;
  end;
  if (m_MasterHuman <> nil) or (m_MasterList.Count > 0) then begin
    if m_boMaster then begin
      for I := 0 to m_MasterList.Count - 1 do begin
        Human:=TPlayObject(m_MasterList.Items[I]);
        sSayMsg:=AnsiReplaceText(g_sMasterLongOutMasterListOnlineMsg,'%s',m_sCharName);
        sSayMsg:=AnsiReplaceText(sSayMsg,'%m',m_PEnvir.sMapDesc);
        sSayMsg:=AnsiReplaceText(sSayMsg,'%x',IntToStr(m_nCurrX));
        sSayMsg:=AnsiReplaceText(sSayMsg,'%y',IntToStr(m_nCurrY));
        Human.SysMsg(sSayMsg,c_Red,t_Hint);
        Human.m_MasterHuman:=nil;
      end;
    end else begin
      if m_MasterHuman = nil then exit;
      sSayMsg:=AnsiReplaceText(g_sMasterListLongOutMasterOnlineMsg,'%d',m_sMasterName);
      sSayMsg:=AnsiReplaceText(sSayMsg,'%s',m_sCharName);
      sSayMsg:=AnsiReplaceText(sSayMsg,'%m',m_PEnvir.sMapDesc);
      sSayMsg:=AnsiReplaceText(sSayMsg,'%x',IntToStr(m_nCurrX));
      sSayMsg:=AnsiReplaceText(sSayMsg,'%y',IntToStr(m_nCurrY));
      m_MasterHuman.SysMsg(sSayMsg,c_Red,t_Hint);

      //如果为大徒弟则将对方的记录清空
      if m_MasterHuman.m_sMasterName = m_sCharName then begin
        m_MasterHuman.m_MasterHuman:=nil;
      end;

      for I := 0 to m_MasterHuman.m_MasterList.Count - 1 do begin
        if m_MasterHuman.m_MasterList.Items[I] = Self then begin
          m_MasterHuman.m_MasterList.Delete(I);
          break;
        end;
      end;
    end;
  end;
except
  on e: Exception do begin
    MainOutMessage(sExceptionMsg);
    MainOutMessage(E.Message);
  end;

end;
  inherited;
end;

function TPlayObject.GetMyInfo: String;
var
  sMyInfo:String;
begin
  sMyInfo:=g_sMyInfo;
  sMyInfo:=AnsiReplaceText(sMyInfo,'%name',m_sCharName);
  sMyInfo:=AnsiReplaceText(sMyInfo,'%map',m_PEnvir.sMapDesc);
  sMyInfo:=AnsiReplaceText(sMyInfo,'%x',IntToStr(m_nCurrX));
  sMyInfo:=AnsiReplaceText(sMyInfo,'%y',IntToStr(m_nCurrY));
  sMyInfo:=AnsiReplaceText(sMyInfo,'%level',IntToStr(m_Abil.Level));
  sMyInfo:=AnsiReplaceText(sMyInfo,'%gold',IntToStr(m_nGold));
  sMyInfo:=AnsiReplaceText(sMyInfo,'%pk',IntToStr(m_nPkPoint));
  sMyInfo:=AnsiReplaceText(sMyInfo,'%minhp',IntToStr(m_WAbil.HP));
  sMyInfo:=AnsiReplaceText(sMyInfo,'%maxhp',IntToStr(m_WAbil.MaxHP));
  sMyInfo:=AnsiReplaceText(sMyInfo,'%minmp',IntToStr(m_WAbil.MP));
  sMyInfo:=AnsiReplaceText(sMyInfo,'%maxmp',IntToStr(m_WAbil.MaxMP));
  sMyInfo:=AnsiReplaceText(sMyInfo,'%mindc',IntToStr(LoWord(m_WAbil.DC)));
  sMyInfo:=AnsiReplaceText(sMyInfo,'%maxdc',IntToStr(HiWord(m_WAbil.DC)));
  sMyInfo:=AnsiReplaceText(sMyInfo,'%minmc',IntToStr(LoWord(m_WAbil.MC)));
  sMyInfo:=AnsiReplaceText(sMyInfo,'%maxmc',IntToStr(HiWord(m_WAbil.MC)));
  sMyInfo:=AnsiReplaceText(sMyInfo,'%minsc',IntToStr(LoWord(m_WAbil.SC)));
  sMyInfo:=AnsiReplaceText(sMyInfo,'%maxsc',IntToStr(HiWord(m_WAbil.SC)));
  sMyInfo:=AnsiReplaceText(sMyInfo,'%logontime',DateTimeToStr(m_dLogonTime));
  sMyInfo:=AnsiReplaceText(sMyInfo,'%logonlong',IntToStr((GetTickCount - m_dwLogonTick) div 60000));
  Result:=sMyInfo;
end;

function TPlayObject.CheckItemBindUse(UserItem: pTUserItem): Boolean;
var
  I: Integer;
  ItemBind:pTItemBind;
begin
  Result:=True;
  g_ItemBindAccount.Lock;
  try
    for I := 0 to g_ItemBindAccount.Count - 1 do begin
      ItemBind:=g_ItemBindAccount.Items[I];
      if (ItemBind.nMakeIdex = UserItem.MakeIndex) and
         (ItemBind.nItemIdx = UserItem.wIndex) then begin
        Result:=False;
        if (CompareText(ItemBind.sBindName,m_sUserID) = 0) then begin
          Result:=True;
        end else begin
          SysMsg(g_sItemIsNotThisAccount,c_Red,t_Hint);
        end;          
        exit;
      end;
    end;
  finally
    g_ItemBindAccount.UnLock;
  end;
  
  g_ItemBindIPaddr.Lock;
  try
    for I := 0 to g_ItemBindIPaddr.Count - 1 do begin
      ItemBind:=g_ItemBindIPaddr.Items[I];
      if (ItemBind.nMakeIdex = UserItem.MakeIndex) and
         (ItemBind.nItemIdx = UserItem.wIndex) then begin
        Result:=False;
        if (CompareText(ItemBind.sBindName,m_sIPaddr) = 0) then begin
          Result:=True;
        end else begin
          SysMsg(g_sItemIsNotThisIPaddr,c_Red,t_Hint);
        end;
        exit;
      end;
    end;
  finally
    g_ItemBindIPaddr.UnLock;
  end;
  g_ItemBindCharName.Lock;
  try
    for I := 0 to g_ItemBindCharName.Count - 1 do begin
      ItemBind:=g_ItemBindCharName.Items[I];
      if (ItemBind.nMakeIdex = UserItem.MakeIndex) and
         (ItemBind.nItemIdx = UserItem.wIndex) then begin
        Result:=False;
        if (CompareText(ItemBind.sBindName,m_sCharName) = 0) then begin
          Result:=True;
        end else begin
          SysMsg(g_sItemIsNotThisCharName,c_Red,t_Hint);
        end;
        exit;
      end;
    end;
  finally
    g_ItemBindCharName.UnLock;
  end;
end;

procedure TPlayObject.ProcessClientPassword(ProcessMsg: pTProcessMessage);
var
  nLen:Integer;
  sData:String;
begin
//  SysMsg(ProcessMsg.sMsg,c_Red,t_Hint);
  if ProcessMsg.wParam = 0 then begin
    ProcessUserLineMsg('@' + g_GameCommand.UNLOCK.sCmd);
    exit;
  end;

  sData:=ProcessMsg.sMsg;
  nLen:=length(sData);
  if m_boSetStoragePwd then begin
    m_boSetStoragePwd:=False;
    if (nLen > 3) and (nLen < 8) then begin
      m_sTempPwd:=sData;
      m_boReConfigPwd:=True;
      SysMsg(g_sReSetPasswordMsg,c_Green,t_Hint);{'请重复输入一次仓库密码：'}
      SendMsg(Self,RM_PASSWORD,0,0,0,0,'');
    end else begin
      SysMsg(g_sPasswordOverLongMsg,c_Red,t_Hint);{'输入的密码长度不正确！！！，密码长度必须在 4 - 7 的范围内，请重新设置密码。'}
    end;
    exit;
  end;
  if m_boReConfigPwd then begin
    m_boReConfigPwd:=False;
    if CompareStr(m_sTempPwd,sData) = 0 then begin
      m_sStoragePwd:=sData;
      m_boPasswordLocked:=True;
      m_sTempPwd:='';
      SysMsg(g_sReSetPasswordOKMsg,c_Blue,t_Hint);{'密码设置成功！！，仓库已经自动上锁，请记好您的仓库密码，在取仓库时需要使用此密码开锁。'}
    end else begin
      m_sTempPwd:='';
      SysMsg(g_sReSetPasswordNotMatchMsg,c_Red,t_Hint);
    end;
    exit;
  end;
  if m_boUnLockPwd or m_boUnLockStoragePwd then begin
    if CompareStr(m_sStoragePwd,sData) = 0 then begin
      m_boPasswordLocked:=False;
      if m_boUnLockPwd then begin
        if g_Config.boLockDealAction then m_boCanDeal:=True;
        if g_Config.boLockDropAction then m_boCanDrop:=True;
        if g_Config.boLockWalkAction then m_boCanWalk:=True;
        if g_Config.boLockRunAction then m_boCanRun:=True;
        if g_Config.boLockHitAction then m_boCanHit:=True;
        if g_Config.boLockSpellAction then m_boCanSpell:=True;
        if g_Config.boLockSendMsgAction then m_boCanSendMsg:=True;
        if g_Config.boLockUserItemAction then m_boCanUseItem:=True;
        if g_Config.boLockInObModeAction then begin
          m_boObMode:=False;
          m_boAdminMode:=False;
        end;
        m_boLockLogoned:=True;
        SysMsg(g_sPasswordUnLockOKMsg,c_Blue,t_Hint);
      end;
      if m_boUnLockStoragePwd then begin
        if g_Config.boLockGetBackItemAction then m_boCanGetBackItem:=True;
        SysMsg(g_sStorageUnLockOKMsg,c_Blue,t_Hint);
      end;

    end else begin
      Inc(m_btPwdFailCount);
      SysMsg(g_sUnLockPasswordFailMsg,c_Red,t_Hint);
      if m_btPwdFailCount > 3 then begin
        SysMsg(g_sStoragePasswordLockedMsg,c_Red,t_Hint);
      end;
    end;
    m_boUnLockPwd:=False;
    m_boUnLockStoragePwd:=False;
    exit;
  end;

  if m_boCheckOldPwd then begin
    m_boCheckOldPwd:=False;
    if m_sStoragePwd = sData then begin
      SendMsg(Self,RM_PASSWORD,0,0,0,0,'');
      SysMsg(g_sSetPasswordMsg,c_Green,t_Hint);
      m_boSetStoragePwd:=True;
    end else begin
      Inc(m_btPwdFailCount);
      SysMsg(g_sOldPasswordIncorrectMsg,c_Red,t_Hint);
      if m_btPwdFailCount > 3 then begin
        SysMsg(g_sStoragePasswordLockedMsg,c_Red,t_Hint);
        m_boPasswordLocked:=True;
      end;
    end;
    exit;
  end;
end;


procedure TPlayObject.ScatterBagItems(ItemOfCreat: TBaseObject);
const
  DropWide:Integer = 2;
var
  i:Integer;
  pu:pTUserItem;
  DelList:TStringList;
  boDropall:Boolean;
ResourceString
  sExceptionMsg = '[Exception] TPlayObject::ScatterBagItems';
begin
   DelList:=nil;
   if m_boAngryRing or m_boNoDropItem or m_PEnvir.Flag.boNODROPITEM then exit; //不死戒指

   boDropall:=False;
   if g_Config.boDieRedScatterBagAll and (PKLevel >= 2 )then begin
     boDropall:=True;
   end;

   //非红名掉1/3 //红名全掉

   try
     for i:=m_ItemList.Count - 1 downto 0 do begin
       if boDropall or (Random(g_Config.nDieScatterBagRate{3}) = 0) then begin
         if DropItemDown (pTUserItem(m_ItemList[i]),DropWide,True,ItemOfCreat,Self) then begin
           pu := pTUserItem(m_ItemList[i]);
           if m_btRaceServer = RC_PLAYOBJECT then begin
             if DelList = nil then DelList:=TStringList.Create;
               DelList.AddObject(UserEngine.GetStdItemName (pu.wIndex), TObject(pu.MakeIndex));
             end;
             Dispose(PTUserItem(m_ItemList[i]));
             m_ItemList.Delete (i);
           end;
       end;
     end;
     if DelList <> nil then begin
       SendMsg (self, RM_SENDDELITEMLIST,0,Integer(DelList),0,0,'');
     end;
   except
     MainOutMessage(sExceptionMsg);
   end;
end;

procedure TPlayObject.RecallHuman(sHumName: String);
var
  PlayObject:TPlayObject;
  nX,nY,n18,n1C:Integer;
begin
  PlayObject:=UserEngine.GeTPlayObject(sHumName);
  if PlayObject <> nil then begin
    if GetFrontPosition(nX,nY) then begin
      if sub_4C5370(nX,nY,3,n18,n1C) then begin
        PlayObject.SendRefMsg(RM_SPACEMOVE_FIRE,0,0,0,0,'');
        PlayObject.SpaceMove(m_sMapName,n18,n1C,0);
      end;
    end else begin
      SysMsg('召唤失败！！！',c_Red,t_Hint);
    end;
  end else begin
    SysMsg(format(g_sNowNotOnLineOrOnOtherServer,[sHumName]),c_Red,t_Hint);
  end;
end;

procedure TPlayObject.ReQuestGuildWar(sGuildName: String);
var
  Guild:TGuild;
  WarGuild:pTWarGuild;
  boReQuestOK:Boolean;
begin
  if not IsGuildMaster then begin
    SysMsg('只有行会掌门人才能申请！！！',c_Red,t_Hint);
    exit;
  end;
  if nServerIndex <> 0 then begin
    SysMsg('这个命令不能在本服务器上使用！！！',c_Red,t_Hint);
    exit;
  end;
  Guild:=g_GuildManager.FindGuild(sGuildName);
  if Guild = nil then begin
    SysMsg('行会不存在！！！',c_Red,t_Hint);
    exit;
  end;
  boReQuestOK:=False;
  WarGuild:=TGuild(m_MyGuild).AddWarGuild(Guild);
  if WarGuild <> nil then begin
    if Guild.AddWarGuild(TGuild(m_MyGuild)) = nil then begin
      WarGuild.dwWarTick:=0;
    end else begin
      boReQuestOK:=True;
    end;
  end;
  if boReQuestOK then begin
    UserEngine.SendServerGroupMsg(SS_207,nServerIndex,TGuild(m_MyGuild).sGuildName);
    UserEngine.SendServerGroupMsg(SS_207,nServerIndex,Guild.sGuildName);
  end;     
    
end;

function TPlayObject.CheckDenyLogon():Boolean;
begin
  Result:=False;
  if GetDenyIPaddrList(m_sIPaddr) then begin
    SysMsg(g_sYourIPaddrDenyLogon,c_Red,t_Hint);
    Result:=True;
  end else
  if GetDenyAccountList(m_sUserID) then begin
    SysMsg(g_sYourAccountDenyLogon,c_Red,t_Hint);
    Result:=True;
  end else
  if GetDenyChrNameList(m_sCharName) then begin
    SysMsg(g_sYourCharNameDenyLogon,c_Red,t_Hint);
    Result:=True;
  end;
  if Result then m_boEmergencyClose:=True;
end;


end.
