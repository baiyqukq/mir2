unit ObjBase;

interface
uses
  Windows, Classes, SysUtils, Forms, StrUtils, Math, SDK, Grobal2, Envir,
  ItemUnit, MD5Unit;

type
  TClientAction = (cHit,cMagHit,cRun,cWalk,cDigUp,cTurn);
//  TSayMsgType = (s_NoneMsg,s_GroupMsg,s_GuildMsg,s_SystemMsg,s_NoticeMsg);

type
  TBaseObject = class;

  pTStartPoint=^TStartPoint;
  TStartPoint=record
    sMapName:String[MapNameLen];
    nX:Integer;
    nY:Integer;
    btJob:Byte;
    Envir:TEnvirnoment;
    dwWhisperTick:LongWord;
  end;


  pTSendMessage=^TSendMessage;
  TSendMessage=record
     wIdent:word;
     wParam:word;
     nParam1:integer;
     nParam2:integer;
     nParam3:integer;
     dwDeliveryTime:dword;
     BaseObject:TBaseObject;
     boLateDelivery:Boolean;
     Buff:pointer;
  end;


  pTVisibleBaseObject=^TVisibleBaseObject;
  TVisibleBaseObject=record
    BaseObject:TBaseObject;
    nVisibleFlag:Integer;
  end;

  pTVisibleMapItem=^TVisibleMapItem;
  TVisibleMapItem=record
     nX,nY:integer;
     MapItem:pTMapItem;
     sName:String;
     wLooks:word;
     nVisibleFlag:integer;
  end;

  TBaseObject = class
    m_sMapName                :String[MapNameLen]; //0x04
    m_sCharName               :String[ActorNameLen]; //0x15
    m_nCurrX                  :Integer;    //0x24  人物所在座标X(4字节)
    m_nCurrY                  :Integer;    //0x28  人物所在座标Y(4字节)
    m_btDirection             :Byte;       //0x2C  人物所在方向(1字节)
    m_btGender                :Byte;       //0x2D  人物的性别(1字节)
    m_btHair                  :Byte;       //0x2E  人物的头发(1字节)
    m_btJob                   :Byte;       //0x2F  人物的职业(1字节)
    m_nGold                   :Integer;    //0x30  人物金币数(4字节)
    m_Abil                    :TAbility; //TAbility;   //0x34 -> 0x5B
    m_nCharStatus             :Integer;    //0x5C
    m_sHomeMap                :String[MapNameLen]; //0x78  //回城地图
    m_nHomeX                  :Integer;    //0x8C  //回城座标X
    m_nHomeY                  :Integer;    //0x90  //回城座标Y
      bo94                    :Boolean;    //0x94
    m_boOnHorse               :Boolean;    //0x95
    m_btHorseType             :Byte;
    m_btDressEffType          :Byte;
      n98                     :Integer;    //0x98
      n9C                     :Integer;    //0x9C
      nA0                     :Integer;    //0xA0
      nA4                     :Integer;    //0xA4
      nA8                     :Integer;    //0xA8
    m_nPkPoint                :Integer;    //0xAC  人物的PK值(4字节)
    m_boAllowGroup            :Boolean;    //0xB0  允许组队
    m_boAllowGuild            :Boolean;    //0xB1  允许加入行会
      btB2                    :Byte;       //0xB2
      btB3                    :Byte;       //0xB3
    m_nIncHealth              :Integer;    //0x0B4
    m_nIncSpell               :Integer;    //0x0B8
    m_nIncHealing             :Integer;    //0x0BC
    m_nFightZoneDieCount      :Integer;    //0x0C0  //在行会占争地图中死亡次数
      nC4                     :Integer;
      btC8                    :Byte;     //0xC8
      btC9                    :Byte;     //0xC9
    m_BonusAbil               :TNakedAbility; //0x0CA TNakedAbility
    m_CurBonusAbil            :TNakedAbility; //0x0DE
    m_nBonusPoint             :Integer;        //0x0F4
    m_nHungerStatus           :Integer;        //0x0F8
    m_boAllowGuildReCall      :Boolean;        //0xFC
//      btFC               :Byte;
    m_btFD                    :Byte;
    m_btFE                    :Byte;
    m_btFF                    :Byte;
    m_dBodyLuck               :Double;        //0x100
    m_nBodyLuckLevel          :Integer;       //0x108
    m_wGroupRcallTime         :Word;          //0x10C
    m_boAllowGroupReCall      :Boolean;       //0x10E
    m_QuestUnitOpen           :TQuestUnit;    //0x10F
    m_QuestUnit               :TQuestUnit;    //0x11C
    m_QuestFlag               :TQuestFlag;    //0x128 129
    m_nCharStatusEx           :Integer;
    m_dwFightExp              :LongWord;      //0x194   //怪物经验值
    m_WAbil                   :TAbility;      //0x198
    m_AddAbil                 :TAddAbility;   //0x1C0
    m_nViewRange              :Integer;       //0x1E4   //可视范围大小
    m_wStatusTimeArr          :TStatusTime;   //0x60
    m_dwStatusArrTick         :array [0..MAX_STATUS_ATTRIBUTE -1] of LongWord; //0x1E8
    m_wStatusArrValue         :array [0..5] of Word; //0x218
    m_dwStatusArrTimeOutTick  :array [0..5] of LongWord; // :Tarry220;           //0x220
    m_wAppr                   :Word;         //0x238	Appearance
    m_btRaceServer            :Byte;         //0x23A   //角色类型
    m_btRaceImg               :Byte;         //0x23B   //角色外形
    m_btHitPoint              :Byte;         //0x23C   人物攻击准确度(Byte)
    m_nHitPlus                :ShortInt;      //0x23D
    m_nHitDouble              :ShortInt;      //0x23E
    m_dwGroupRcallTick        :LongWord;     //0x240  记忆使用间隔(Dword)
    m_boRecallSuite           :Boolean;      //0x244  记忆全套
      bo245                   :Boolean;      //0x245
    m_boTestGa                :Boolean;      //0x246  //是否输入Testga 命令
    m_boGsa                   :Boolean;      //0x247  //是否输入gsa 命令
    m_nHealthRecover          :ShortInt;      //0x248
    m_nSpellRecover           :ShortInt;      //0x249
    m_btAntiPoison            :Byte;         //0x24A
    m_nPoisonRecover          :ShortInt;     //0x24B
    m_nAntiMagic              :ShortInt;     //0x24C
    m_nLuck                   :Integer;      //0x250  人物的幸运值Luck
    m_nPerHealth              :Integer;      //0x254
    m_nPerHealing             :Integer;      //0x258
    m_nPerSpell               :Integer;      //0x25C
    m_dwIncHealthSpellTick    :LongWord;     //0x260
    m_btGreenPoisoningPoint   :Byte;         //0x264  中绿毒降HP点数
    m_nGoldMax                :Integer;      //0x268  人物身上最多可带金币数(Dword)
    m_btSpeedPoint            :Byte;         //0x26C  人物敏捷度(Byte)
    m_btPermission            :Byte;         //0x26D  人物权限等级
    m_nHitSpeed               :ShortInt;     //0x26E  //1-18 更改数据类型
    m_btLifeAttrib            :Byte;         //0x26F
    m_btCoolEye               :Byte;         //0x270
    m_GroupOwner              :TBaseObject;    //0x274
    m_GroupMembers            :TStringList;  //0x278  组成员
    m_boHearWhisper           :Boolean;      //0x27C  允许私聊
    m_boBanShout              :Boolean;      //0x27D  允许群聊
    m_boBanGuildChat          :Boolean;      //0x27E  拒绝行会聊天
    m_boAllowDeal             :Boolean;      //0x27F  是不允许交易
    m_BlockWhisperList        :TStringList;  //0x280  禁止私聊人员列表
    m_dwShoutMsgTick          :LongWord;     //0x284
    m_Master                  :TBaseObject;    //0x288  是否被召唤(主人)
    m_dwMasterRoyaltyTick     :LongWord;     //0x28C  怪物叛变时间
    m_dwMasterTick            :LongWord;      //0x290
      n294                    :Integer;      //0x294  杀怪计数
    m_btSlaveExpLevel         :Byte;         //0x298  宝宝等级 1-7
    m_btSlaveMakeLevel        :Byte;         //0x299  召唤等级
    m_SlaveList               :TList;        //0x29C  下属列表
      bt2A0                   :Byte;         //0x2A0
    m_boSlaveRelax            :Boolean;      //0x2A0  宝宝攻击状态(休息/攻击)(Byte)
    m_btAttatckMode           :Byte;         //0x2A1  下属攻击状态
    m_btNameColor             :Byte;       //0x2A2  人物名字的颜色(Byte)
    m_nLight                  :Integer;    //0x2A4  亮度
    m_boGuildWarArea          :Boolean;    //0x2A8  行会占争范围
    m_Castle                  :TObject;    //0x2AC //所属城堡
      bo2B0                   :Boolean;    //0x2B0
    m_dw2B4Tick               :LongWord;   //0x2B4
    m_boSuperMan              :Boolean;    //0x2B8  无敌模式
      bo2B9                   :Boolean;    //0x2B9
      bo2BA                   :Boolean;    //0x2BA
    m_boAnimal                :Boolean;    //0x2BB
    m_boNoItem                :Boolean;    //0x2BC
    m_boFixedHideMode         :Boolean;    //0x2BD
    m_boStickMode             :Boolean;    //0x2BE
      bo2BF                   :Boolean;    //0x2BF
    m_boNoAttackMode          :Boolean;    //0x2C0
    m_boNoTame                :Boolean;    //0x2C1
    m_boSkeleton              :Boolean;    //0x2C2
    m_nMeatQuality            :Integer;    //0x2C4
    m_nBodyLeathery           :Integer;    //0x2C8
    m_boHolySeize             :Boolean;    //0x2CC
    m_dwHolySeizeTick         :LongWord;     //0x2D0
    m_dwHolySeizeInterval     :LongWord;     //0x2D4
    m_boCrazyMode             :Boolean;      //0x2D8
    m_dwCrazyModeTick         :LongWord;     //0x2DC
    m_dwCrazyModeInterval     :LongWord;     //0x2E0
    m_boShowHP                :Boolean;      //0x2E4
//      nC2E6                   :Integer;      //0x2E6
    m_dwShowHPTick            :LongWord;     //0x2E8  心灵启示检查时间(Dword)
    m_dwShowHPInterval        :LongWord;     //0x2EC  心灵启示有效时长(Dword)
      bo2F0                   :Boolean;      //0x2F0
    m_dwDupObjTick            :LongWord;     //0x2F4
    m_PEnvir                  :TEnvirnoment; //0x2F8
    m_boGhost                 :Boolean;    //0x2FC
    m_dwGhostTick             :LongWord;   //0x300
    m_boDeath                 :Boolean;    //0x304
    m_dwDeathTick             :LongWord;   //0x308
    m_btMonsterWeapon         :Byte;       //0x30C 怪物所拿的武器
    m_dwStruckTick            :LongWord;   //0x310
    m_boWantRefMsg            :Boolean;    //0x314
    m_boAddtoMapSuccess       :Boolean;    //0x315
    m_bo316                   :Boolean;    //0x316
    m_boDealing               :Boolean;    //0x317
    m_DealLastTick            :LongWord;   //0x318 交易最后操作时间
    m_DealCreat               :TBaseObject;  //0x31C
    m_MyGuild                 :TOBject;    //0x320
    m_nGuildRankNo            :Integer;    //0x324
    m_sGuildRankName          :String;     //0x328
    m_sScriptLable            :String;     //0x32C
    m_btAttackSkillCount      :Byte;       //0x330
      bt331                   :Byte;
      bt332                   :Byte;
      bt333                   :Byte;
    m_btAttackSkillPointCount :Byte;       //0x334
      bo335                   :Boolean;    //0x335
      bo336                   :Boolean;    //0x336
      bo337                   :Boolean;    //0x337
    m_boMission               :Boolean;    //0x338
    m_nMissionX               :Integer;    //0x33C
    m_nMissionY               :Integer;    //0x340
    m_boHideMode              :Boolean;    //0x344  隐身戒指(Byte)
    m_boStoneMode             :Boolean;    //0x345
    m_boCoolEye               :Boolean;    //0x346  //是否可以看到隐身人物
    m_boUserUnLockDurg        :Boolean;    //0x347  //是否用了神水
    m_boTransparent           :Boolean;    //0x348  //魔法隐身了
    m_boAdminMode             :Boolean;    //0x349  管理模式(Byte)
    m_boObMode                :Boolean;    //0x34A  隐身模式(Byte)
    m_boTeleport              :Boolean;    //0x34B  传送戒指(Byte)
    m_boParalysis             :Boolean;    //0x34C  麻痹戒指(Byte)
    m_boUnParalysis           :Boolean;
    m_boRevival               :Boolean;    //0x34D  复活戒指(Byte)
    m_boUnRevival             :Boolean;    //防复活
      bo34E                   :boolean;
      bo34F                   :Boolean;
    m_dwRevivalTick           :LongWord;   //0x350  复活戒指使用间隔计数(Dword)
    m_boFlameRing             :Boolean;    //0x354  火焰戒指(Byte)
    m_boRecoveryRing          :Boolean;    //0x355  治愈戒指(Byte)
    m_boAngryRing             :Boolean;    //0x356  未知戒指(Byte)
    m_boMagicShield           :Boolean;    //0x357  护身戒指(Byte)
    m_boUnMagicShield         :Boolean;    //防护身
    m_boMuscleRing            :Boolean;    //0x358  活力戒指(Byte)
    m_boFastTrain             :Boolean;    //0x359  技巧项链(Byte)
    m_boProbeNecklace         :Boolean;    //0x35A  探测项链(Byte)
    m_boGuildMove             :Boolean;    //行会传送
    m_boSupermanItem          :Boolean;
    m_bopirit                 :Boolean;    //祈祷

    m_boNoDropItem            :Boolean;
    m_boNoDropUseItem         :Boolean;
    m_boExpItem               :Boolean;
    m_boPowerItem             :Boolean;

    m_rExpItem                :Real;
    m_rPowerItem              :Real;
    m_dwPKDieLostExp          :LongWord;   //PK 死亡掉经验，不够经验就掉等级
    m_nPKDieLostLevel         :Integer;    //PK 死亡掉等级

    m_boAbilSeeHealGauge      :Boolean;    //0x35B  //心灵启示
    m_boAbilMagBubbleDefence  :Boolean;    //0x35C  //魔法盾
    m_btMagBubbleDefenceLevel :Byte;       //0x35D
    m_dwSearchTime            :LongWord;   //0x360
    m_dwSearchTick            :LongWord;   //0x364
    m_dwRunTick               :LongWord;   //0x368
    m_nRunTime                :Integer;    //0x36C
    m_nHealthTick             :Integer;    //0x370    //特别指定为 此类型  此处用到 004C7CF8
    m_nSpellTick              :Integer;    //0x374
    m_TargetCret              :TBaseObject;  //0x378
    m_dwTargetFocusTick       :LongWord;   //0x37C
    m_LastHiter               :TBaseObject;  //0x380  人物被对方杀害时对方指针(Dword)
    m_LastHiterTick           :LongWord;   //0x384
    m_ExpHitter               :TBaseObject;  //0x388
    m_ExpHitterTick           :LongWord;   //0x38C
    m_dwTeleportTick          :LongWord;   //0x390  传送戒指使用间隔(Dword)
    m_dwProbeTick             :LongWord;   //0x394  探测项链使用间隔(Dword)
    m_dwMapMoveTick           :LongWord;   //0x398
    m_boPKFlag                :Boolean;    //0x39C  人物攻击变色标志(Byte)
    m_dwPKTick                :LongWord;   //0x3A0  人物攻击变色时间长度(Dword)
    m_nMoXieSuite             :Integer;    //0x3A4  魔血一套(Dword)
    m_nHongMoSuite            :Integer;    //0x3A8 虹魔一套(Dword)
    m_n3AC                    :Integer;    //0x3AC
    m_db3B0                   :Double;     //0x3B0
    m_dwPoisoningTick         :LongWord;   //0x3B8 中毒处理间隔时间(Dword)
    m_dwDecPkPointTick        :LongWord;   //0x3BC  减PK值时间(Dword)
    m_DecLightItemDrugTick    :LongWord;   //0x3C0
    m_dwVerifyTick            :LongWord;   //0x3C4
    m_dwCheckRoyaltyTick      :LongWord;   //0x3C8
    m_dwDecHungerPointTick    :LongWord;   //0x3CC
    m_dwHPMPTick              :LongWord;   //0x3D0
    m_MsgList                 :TList;      //0x3D4
    m_VisibleHumanList        :TList;      //0x3D8
    m_VisibleItems            :TList;      //0x3DC
    m_VisibleEvents           :TList;      //0x3E0
    m_SendRefMsgTick          :LongWord;   //0x3E4
    m_boInFreePKArea          :Boolean;    //0x3E8  是否在开行会战(Byte)
      LIst_3EC                :TList;      //0x3EC
      dwTick3F0               :LongWord;   //0x3F0
      dwTick3F4               :LongWord;   //0x3F4
    m_dwHitTick               :LongWord;   //0x3F8
    m_dwWalkTick              :LongWord;   //0x3FC
    m_dwSearchEnemyTick       :LongWord;   //0x400
    m_boNameColorChanged      :Boolean;    //0x404
    m_boIsVisibleActive       :Boolean;    //是否在可视范围内有人物,及宝宝
    m_nProcessRunCount        :ShortInt;
    m_VisibleActors           :TList;      //0x408
    m_ItemList                :TList;      //0x40C  人物背包(Dword)数量
    m_DealItemList            :TList;      //0x410
    m_nDealGolds              :Integer;    //0x414  交易的金币数量(Dword)
    m_boDealOK                :Boolean;    //0x418  确认交易标志(Byte
    m_MagicList               :TList;      //0x41C  技能表
    m_UseItems                :THumanUseItems;  //0x420  + D8 -> 4F8
    m_SayMsgList              :TList;
    m_StorageItemList         :TList;      //0x4F8
    m_nWalkSpeed              :Integer;   //0x4FC
    m_nWalkStep               :Integer;    //0x500
    m_nWalkCount              :Integer;    //0x504
    m_dwWalkWait              :LongWord;   //0x508
    m_dwWalkWaitTick          :LongWord;   //0x50C
    m_boWalkWaitLocked        :Boolean;    //0x510
    m_nNextHitTime            :Integer;    //0x514
    m_MagicOneSwordSkill      :pTUserMagic;    //0x518
    m_MagicPowerHitSkill      :pTUserMagic;    //0x51C
    m_MagicErgumSkill         :pTUserMagic;    //0x520 刺杀剑法
    m_MagicBanwolSkill        :pTUserMagic;    //0x524 半月弯刀
    m_MagicRedBanwolSkill     :pTUserMagic;
    m_MagicFireSwordSkill     :pTUserMagic;    //0x528
    m_MagicCrsSkill           :pTUserMagic;    //0x528
    m_Magic41Skill            :pTUserMagic;    //0x528
    m_MagicTwnHitSkill        :pTUserMagic;    //0x528
    m_Magic43Skill            :pTUserMagic;    //0x528
    m_boPowerHit              :Boolean;     //0x52C
    m_boUseThrusting          :Boolean;     //0x52D
    m_boUseHalfMoon           :Boolean;     //0x52E
    m_boRedUseHalfMoon        :Boolean;
    m_boFireHitSkill          :Boolean;     //0x52F
    m_boCrsHitkill            :Boolean;
    m_bo41kill                :Boolean;
    m_boTwinHitSkill          :Boolean;
    m_bo43kill                :Boolean;
    m_dwLatestFireHitTick     :LongWord;    //0x530
    m_dwDoMotaeboTick         :LongWord;    //0x534
    m_dwLatestTwinHitTick     :LongWord;
    m_boDenyRefStatus         :Boolean;//是否刷新在地图上信息；
    m_boAddToMaped            :Boolean;  //是否增加地图计数
    m_boDelFormMaped          :Boolean;  //是否从地图中删除计数
    m_boAutoChangeColor       :Boolean;
    m_dwAutoChangeColorTick   :LongWord;
    m_nAutoChangeIdx          :Integer;

    m_boFixColor              :Boolean;  //固定颜色
    m_nFixColorIdx            :Integer;
    m_nFixStatus              :Integer;
    m_boFastParalysis         :Boolean; //快速麻痹，受攻击后麻痹立即消失

    m_boSmashSet              :Boolean;
    m_boHwanDevilSet          :Boolean;
    m_boPuritySet             :Boolean;
    m_boMundaneSet            :Boolean;
    m_boNokChiSet             :Boolean;
    m_boTaoBuSet              :Boolean;
    m_boFiveStringSet         :Boolean;

    m_boNastyMode             :Boolean;
  private
    function  GetLevelExp(nLevel: Integer): LongWord;
    function  InSafeArea: Boolean;
    procedure UpdateVisibleGay(BaseObject:TBaseObject);virtual;
    function  Walk(nIdent:Integer): Boolean;
    function  AddToMap():Boolean;
    procedure UseLamp();
    procedure CheckPKStatus();
    procedure UpdateVisibleItem(wX,wY:Integer;MapItem:PTMapItem);
    procedure UpdateVisibleEvent(wX,wY:Integer;MapEvent:TObject);
    function  RecalcBagWeight():Integer;
    procedure RecalcHitSpeed();
    procedure DecPKPoint(nPoint:Integer);
    function  GetCharColor(BaseObject:TBaseObject):Byte;
    function  GetNamecolor: Byte;
    procedure SendUpdateDelayMsg(BaseObject: TBaseObject; wIdent, wParam: Word;
      lParam1, lParam2, lParam3: Integer; sMsg: String; dwDelay: LongWord);
    procedure LeaveGroup();
    procedure DelMember(BaseObject:TBaseObject);
    procedure HearMsg(sMsg:String);    
    procedure AttackDir(TargeTBaseObject:TBaseObject;wHitMode:Word;nDir:Integer);virtual;
    procedure DamageSpell(nSpellPoint:Integer);
    procedure DoDamageWeapon(nWeaponDamage:Integer);
    function GetFeatureEx: Word;
  public
    constructor Create();virtual;
    destructor Destroy; override;
    procedure SendMsg(BaseObject:TBaseObject;wIdent,wParam:Word;nParam1,nParam2,nParam3:Integer;sMsg:String);
    procedure SendFirstMsg(BaseObject:TBaseObject;wIdent,wParam:Word;lParam1,lParam2,lParam3:Integer;sMsg:String);
    procedure SendDelayMsg(BaseObject:TBaseObject;wIdent,wParam:Word;lParam1,lParam2,lParam3:Integer;sMsg:String;dwDelay:LongWord);
    procedure SendRefMsg(wIdent,wParam:Word;nParam1,nParam2,nParam3:Integer;sMsg:String);
    procedure SendUpdateMsg(BaseObject: TBaseObject; wIdent, wParam: Word; lParam1,lParam2, lParam3: Integer; sMsg: String);
    procedure SendActionMsg(BaseObject: TBaseObject; wIdent, wParam: Word;
      lParam1, lParam2, lParam3: Integer; sMsg: String);
    procedure SendAttackMsg(wIdent:Word;btDir:Byte;nX,nY:Integer);
    procedure SysMsg(sMsg:String;MsgColor:TMsgColor;MsgType:TMsgType);
    procedure SendGroupText(sMsg:String);
    procedure MonsterSayMsg(AttackBaseObject:TBaseObject;MonStatus:TMonStatus);
    function  IsVisibleHuman():Boolean;
    procedure RecalcLevelAbilitys;
    function  PKLevel():Integer;
    function  InSafeZone():Boolean;OverLoad;
    function  InSafeZone(Envir:TEnvirnoment;nX,nY:Integer):Boolean;OverLoad;
    procedure OpenHolySeizeMode(dwInterval:LongWord);
    procedure BreakHolySeizeMode;
    procedure OpenCrazyMode(nTime:Integer);
    procedure BreakCrazyMode();
    procedure HealthSpellChanged();
    function  _Attack(var wHitMode:Word;AttackTarget:TBaseObject):Boolean;
    function  GetHitStruckDamage(Target:TBaseObject;nDamage:integer):Integer;
    procedure HasLevelUp(nLevel: Integer);
    procedure sub_4BC87C();
    procedure GoldChanged();
    procedure GameGoldChanged;

      function  GetGuildRelation (cert1:TBaseObject; cert2:TBaseObject):Integer;
      function  IsGoodKilling(cert:TBaseObject):Boolean;
      procedure IncPkPoint(nPoint:Integer);
      procedure AddBodyLuck(dLuck:Double);
      procedure MakeWeaponUnlock();
      procedure ScatterGolds(GoldOfCreat:TBaseObject);
      function  DropGoldDown (nGold:Integer;boFalg:Boolean;GoldOfCreat,DropGoldCreat:TBaseObject):Boolean;
      function  DropItemDown(UserItem: pTUserItem; nScatterRange:Integer;boDieDrop:Boolean;ItemOfCreat,DropCreat:TBaseObject): Boolean;
      procedure DamageHealth(nDamage:Integer);
      function  GetAttackPower(nBasePower, nPower: Integer): Integer;
      function  CharPushed(nDir,nPushCount:Integer): Integer;
      function  GetDropPosition (nOrgX,nOrgY,nRange:Integer;var nDX:Integer;var nDY:Integer):Boolean;
      function  GetBackDir(nDir: integer): Integer;
      function  GetMapBaseObjects (tEnvir:TEnvirnoment;nX,nY:Integer;nRage:Integer;rList:TList):Boolean;
      function  MagPassThroughMagic(sx, sy, tx, ty, ndir, magpwr: integer;
        undeadattack: Boolean): integer;
      procedure KickException;
      function  GetMagStruckDamage(BaseObject:TBaseObject;nDamage:Integer):Integer;
      procedure DamageBubbleDefence(nInt:Integer);
      procedure BreakOpenHealth;
      function  GetCharStatus: Integer;
      procedure MakeOpenHealth;
      procedure IncHealthSpell(nHP, nMP: Integer);
      procedure ItemDamageRevivalRing;
      function  CalcGetExp(nLevel: Integer;nExp:Integer): Integer;
      procedure GainSlaveExp(nLevel: Integer);
      procedure MapRandomMove(sMapName:String;nInt:Integer);
      procedure TurnTo(nDir:integer);
      procedure FeatureChanged();
      function  GetFeatureToLong():Integer;
      function  GetPoseCreate():TBaseObject;
      function  GetFeature(BaseObject: TBaseObject):Integer;
      function  IsGroupMember(target: TBaseObject): Boolean;
      procedure AbilCopyToWAbil();
    procedure ChangePKStatus(boWarFlag: Boolean);
    procedure StruckDamage(nDamage:integer);
    function  sub_4C4CD4(sItemName:String;var nCount:Integer):pTUserItem;
    procedure StatusChanged;
    function  GeTBaseObjectInfo():String;
    procedure TrainSkill(UserMagic:pTUserMagic;nTranPoint:Integer);
    function  CheckMagicLevelup(UserMagic:pTUserMagic):Boolean;
    function  MagCanHitTarget(nX,nY:Integer;TargeTBaseObject:TBaseObject):Boolean;
    procedure sub_4C713C(Magic: pTUserMagic);
    function  MagBubbleDefenceUp(nLevel,nSec:Integer):Boolean;
    procedure ApplyMeatQuality();
    function  TakeBagItems(BaseObject:TBaseObject):Boolean;
    function  AddItemToBag(UserItem: PTUserItem): Boolean;
    function  DelBagItem(nIndex:Integer):Boolean;overload;
    function  DelBagItem(nItemIndex:Integer;sItemName:String):Boolean;overload;
    procedure WeightChanged();
    function  IsTrainingSkill(nIndex:Integer):Boolean;
    procedure SetQuestFlagStatus(nFlag:Integer;nValue:Integer);
    function  GetQuestFalgStatus(nFlag:integer):Integer;
    procedure SetQuestUnitOpenStatus(nFlag:Integer;nValue:Integer);
    function  GetQuestUnitOpenStatus(nFlag:integer):Integer;
    procedure SetQuestUnitStatus(nFlag:Integer;nValue:Integer);
    function  GetQuestUnitStatus(nFlag:integer):Integer;
    function  GetAttackDir(BaseObject:TBaseObject;var btDir:Byte):Boolean;
    function  TargetInSpitRange(BaseObject:TBaseObject;var btDir:Byte):Boolean;
    procedure MonsterRecalcAbilitys();
    procedure RefNameColor;
    procedure SetPKFlag(BaseObject:TBaseObject);
    procedure SetLastHiter(BaseObject:TBaseObject);
    function  EnterAnotherMap(Envir:TEnvirnoment;nDMapX,nDMapY:Integer):Boolean;
    function  sub_4DD704():Boolean;
    function  DefenceUp(nSec:Integer):Boolean;
    function  MagDefenceUp(nSec:Integer):Boolean;
    function  AttPowerUp(nPower, nTime: Integer): Boolean;
    function  SCPowerUp(nSec:Integer):Boolean;
    procedure RefShowName;
    function  MakeSlave(sMonName:String;nMakeLevel,nExpLevel,nMaxMob:Integer;dwRoyaltySec:LongWord):TBaseObject;
    function  MakePosion(nType,nTime,nPoint:Integer):Boolean;
    function  GetFrontPosition(var nX: Integer; var nY: Integer):Boolean;
    function  GetBackPosition(var nX:Integer;var nY:Integer):Boolean;
    function  WalkTo(btDir: Byte;boFlag:boolean): Boolean;
    procedure SpaceMove(sMap: String; nX, nY: Integer; nInt:Integer);
    function  sub_4C5370(nX, nY:Integer;nRange: Integer;var nDX, nDY:Integer):Boolean;
    function  CheckItems(sItemName:String):pTUserItem;
    function  MagMakeDefenceArea(nX,nY,nRange,nSec:Integer;btState:Byte):Integer;
    function  sub_4C3538():Integer;
    function  IsGuildMaster():Boolean;
    procedure LoadSayMsg();
    procedure DisappearA();
    function  GetShowName():String;virtual;
    procedure DropUseItems(BaseObject:TBaseObject); virtual;
    procedure ScatterBagItems(ItemOfCreat:TBaseObject); virtual;
    function  GetMessage(Msg:pTProcessMessage):Boolean;virtual; //FFFF
    procedure Initialize();virtual;//FFFE
    procedure Disappear();virtual;//FFFD
    function  Operate(ProcessMsg:pTProcessMessage):Boolean;virtual;//FFFC
    procedure SearchViewRange();virtual;//dynamic;
    procedure Run();virtual;//dynamic;//FFFB
    procedure ProcessSayMsg(sMsg:String); virtual;//FFFA
    procedure MakeGhost;virtual;
    procedure Die();virtual;//FFF9;
    procedure ReAlive();virtual;//FFF8;
    procedure RecalcAbilitys();virtual; //FFF7
    function  IsProtectTarget(BaseObject:TBaseObject):Boolean; virtual; //FFF6
    function  IsAttackTarget(BaseObject:TBaseObject):Boolean; virtual; //FFF5
    function  IsProperTarget(BaseObject:TBaseObject):Boolean; virtual; //FFF4
    function  IsProperFriend(BaseObject:TBaseObject):Boolean; virtual; //FFF3
    procedure SetTargetCreat(BaseObject:TBaseObject); virtual; //FFF2
    procedure DelTargetCreat(); virtual; //FFF1
    procedure RecallSlave(sSlaveName:String);

    function  GetMagicInfo(nMagicID:Integer):pTUserMagic;
    procedure AddItemSkill(nIndex:Integer);
    procedure DelItemSkill(nIndex:Integer);
  end;

implementation

uses M2Share, Guild, HUtil32, EDcode, ObjNpc, IdSrvClient, Event,
  ObjMon, LocalDB, Castle, EncryptUnit, svMain;



{ TBaseObject }

constructor TBaseObject.Create; //4B780C
begin
  m_boGhost               := False;
  m_dwGhostTick           := 0;
  m_boDeath               := False;
  m_dwDeathTick           := 0;
  m_SendRefMsgTick        := GetTickCount();
  m_btDirection           := 4;
  m_btRaceServer          := RC_ANIMAL;
  m_btRaceImg             := 0;
  m_btHair                := 0;
  m_btJob                 := jWarr;
  m_nGold                 := 0;
  m_wAppr                 := 0;
  bo2B9                   := True;
  m_nViewRange            := 5;
  m_sHomeMap              := '0';
  bo94                    := False;
  m_btPermission          := 0;
  m_nLight                := 0;
  m_btNameColor           := 255;
  m_nHitPlus              := 0;
  m_nHitDouble            := 0;
  m_dBodyLuck             := 0;
  m_wGroupRcallTime       := 0;
  m_dwGroupRcallTick      := GetTickCount();
  m_boRecallSuite         := False;
  bo245                   := False;
  m_boTestGa              := False;
  m_boGsa                 := False;
  bo2BA                   := False;
  m_boAbilSeeHealGauge    := False;
  m_boPowerHit            := False;
  m_boUseThrusting        := False;
  m_boUseHalfMoon         := False;
  m_boRedUseHalfMoon      := False;
  m_boFireHitSkill        := False;
  m_boTwinHitSkill        := False;
  m_btHitPoint            := 5;
  m_btSpeedPoint          := 15;
  m_nHitSpeed             := 0;
  m_btLifeAttrib          := 0;
  m_btAntiPoison          := 0;
  m_nPoisonRecover        := 0;
  m_nHealthRecover        := 0;
  m_nSpellRecover         := 0;
  m_nAntiMagic            := 0;
  m_nLuck                 := 0;
  m_nIncSpell             := 0;
  m_nIncHealth            := 0;
  m_nIncHealing           := 0;
  m_nPerHealth            := 5;
  m_nPerHealing           := 5;
  m_nPerSpell             := 5;
  m_dwIncHealthSpellTick  := GetTickCount();
  m_btGreenPoisoningPoint := 0;
  m_nFightZoneDieCount    := 0;
//  m_nGoldMax       := 5000000;
  m_nGoldMax              := g_Config.nHumanMaxGold;
  m_nCharStatus           := 0;
  m_nCharStatusEx         := 0;
  FillChar(m_wStatusTimeArr,SizeOf(TStatusTime),#0);   //004B7A83
  FillChar(m_BonusAbil, SizeOf(TNakedAbility), #0);
  FillChar(m_CurBonusAbil, SizeOf(TNakedAbility), #0);

  FillChar(m_wStatusArrValue, Sizeof(m_wStatusArrValue), 0);
  FillChar(m_dwStatusArrTimeOutTick, SizeOf(m_dwStatusArrTimeOutTick), #0);
  m_boAllowGroup          := False;
  m_boAllowGuild          := False;
  btB2                    := 0;
  m_btAttatckMode         := 0;
  m_boInFreePKArea        := False;
  m_boGuildWarArea        := False;
  bo2B0                   := False;
  m_boSuperMan            := False;
  m_boSkeleton            := False;
  bo2BF                   := False;
  m_boHolySeize           := False;
  m_boCrazyMode           := False;
  m_boShowHP              := False;
  bo2F0                   := False;
  m_boAnimal              := False;
  m_boNoItem              := False;
  m_nBodyLeathery         := 50;
  m_boFixedHideMode       := False;
  m_boStickMode           := False;
  m_boNoAttackMode        := False;
  m_boNoTame              := False;
  m_boPKFlag              := False;
  m_nMoXieSuite           := 0;
  m_nHongMoSuite          := 0;
  m_db3B0                 := 0;
  FillChar(m_AddAbil, SizeOf(TAddAbility), #0);
  m_MsgList               := TList.Create;
  m_VisibleHumanList      := TList.Create;
  LIst_3EC                := TList.Create;
  m_VisibleActors         := TList.Create;
  m_VisibleItems          := TList.Create;
  m_VisibleEvents         := TList.Create;
  m_ItemList              := TList.Create;
  m_DealItemList          := TList.Create;
  m_boIsVisibleActive     := False;
  m_nProcessRunCount      := 0;
  m_nDealGolds            := 0;
  m_MagicList             := TList.Create;
  m_StorageItemList       := TList.Create;
  FillChar(m_UseItems, SizeOf(THumanUseItems), 0);
  m_MagicOneSwordSkill    := nil;
  m_MagicPowerHitSkill    := nil;
  m_MagicErgumSkill       := nil;
  m_MagicBanwolSkill      := nil;
  m_MagicRedBanwolSkill   := nil;
  m_MagicFireSwordSkill   := nil;
  m_MagicCrsSkill         := nil;
  m_Magic41Skill          := nil;
  m_MagicTwnHitSkill      := nil;
  m_Magic43Skill          := nil;
  m_GroupOwner            := nil;
  m_Castle                := nil;
  m_Master                := nil;
  n294                    := 0;
  m_btSlaveExpLevel       := 0;
  bt2A0                   := 0;
  m_GroupMembers          := TStringList.Create;
  m_boHearWhisper         := True;
  m_boBanShout            := True;
  m_boBanGuildChat        := True;
  m_boAllowDeal           := True;
  m_boAllowGroupReCall    := False;
  m_BlockWhisperList      := TStringList.Create;
  m_SlaveList             := TList.Create;
  FillChar(m_WAbil, SizeOf(TAbility), #0);
  FillChar(m_QuestUnitOpen, SizeOf(TQuestUnit),#0);
  FillChar(m_QuestUnit,SizeOf(TQuestUnit),#0);
  m_Abil.Level            := 1;
  m_Abil.AC               := 0;
  m_Abil.MAC              := 0;
  m_Abil.DC               := MakeLong(1,4);
  m_Abil.MC               := MakeLong(1,2);
  m_Abil.SC               := MakeLong(1,2);
  m_Abil.HP               := 15;
  m_Abil.MP               := 15;
  m_Abil.MaxHP            := 15;
  m_Abil.MaxMP            := 15;
  m_Abil.Exp              := 0;
  m_Abil.MaxExp           := 50;
  m_Abil.Weight           := 0;
  m_Abil.MaxWeight        := 100;
  m_boWantRefMsg          := False;
  m_boDealing             := False;
  m_DealCreat             := nil;
  m_MyGuild               := nil;
  m_nGuildRankNo         := 0;
  m_sGuildRankName       := '';
  m_sScriptLable         := '';
  m_boMission            := False;
  m_boHideMode           := False;
  m_boStoneMode          := False;
  m_boCoolEye            := False;
  m_boUserUnLockDurg     := False;
  m_boTransparent        := False;
  m_boAdminMode          := False;
  m_boObMode             := False;
  m_dwRunTick            := GetTickCount + LongWord(Random(1500));
  m_nRunTime             := 250;
  m_dwSearchTime         := Random(2000) + 2000;
  m_dwSearchTick         := GetTickCount;
  m_dwDecPkPointTick     := GetTickCount;
  m_DecLightItemDrugTick := GetTickCount();
  m_dwPoisoningTick      := GetTickCount;
  m_dwVerifyTick         := GetTickCount();
  m_dwCheckRoyaltyTick   := GetTickCount();
  m_dwDecHungerPointTick := GetTickCount();
  m_dwHPMPTick           := GetTickCount();
  m_dwShoutMsgTick       := 0;
  m_dwTeleportTick       := 0;
  m_dwProbeTick          := 0;
  m_dwMapMoveTick        := GetTickCount();
  m_dwMasterTick         := 0;
  m_nWalkSpeed           := 1400;
  m_nNextHitTime         := 2000;
  m_nWalkCount           := 0;
  m_dwWalkWaitTick       := GetTickCount();
  m_boWalkWaitLocked     := False;
  m_nHealthTick         := 0;
  m_nSpellTick          := 0;
  m_TargetCret          := nil;
  m_LastHiter           := nil;
  m_ExpHitter           := nil;
  m_SayMsgList          := nil;
  m_boDenyRefStatus     := False;
  m_btHorseType         := 0;
  m_btDressEffType      := 0;
  m_dwPKDieLostExp      := 0;
  m_nPKDieLostLevel     := 0;
  m_boAddToMaped          := True;
  m_boAutoChangeColor     := False;
  m_dwAutoChangeColorTick := GetTickCount();
  m_nAutoChangeIdx        := 0;

  m_boFixColor            := False;
  m_nFixColorIdx          := 0;
  m_nFixStatus            := -1;
  m_boFastParalysis       := False;

  m_boNastyMode           := False;
end;

destructor TBaseObject.Destroy;//004B80C0
var
  I           :Integer;
  SendMessage :pTSendMessage;
  nCheckCode  :Integer;
ResourceString
  sExceptionMsg = '[Exception] TBaseObject::Destroy Code: %d';
begin
 nCheckCode:=0;
  try
    nCheckCode:=1;
    for I:=0 to m_MsgList.Count -1 do begin
      nCheckCode:=2;
      SendMessage:=m_MsgList.Items[I];
      if (SendMessage.wIdent = RM_SENDDELITEMLIST) and (SendMessage.nParam1 <> 0) then begin
        nCheckCode:=3;
        if TStringList(SendMessage.nParam1) <> nil then begin
          TStringList(SendMessage.nParam1).Free;
          nCheckCode:=4;
        end;
      end;
      if (SendMessage.wIdent = RM_10401) and (SendMessage.nParam1 <> 0) then begin
        nCheckCode:=5;
        Dispose(pTSlaveInfo(SendMessage.nParam1));
      end;
      nCheckCode:=6;
      if (SendMessage.Buff <> nil) then begin
        nCheckCode:=7;
        FreeMem(SendMessage.Buff);
      end;
      Dispose(SendMessage);
      nCheckCode:=8;
    end;//004B81EE
    nCheckCode:=9;
    m_MsgList.Free;
    nCheckCode:=10;
    m_VisibleHumanList.Free;
    nCheckCode:=11;
    for i:=0 to LIst_3EC.Count -1 do begin

    end;//004B8249
    LIst_3EC.Free;
    nCheckCode:=12;
    for i:=0 to m_VisibleActors.Count -1 do begin
      Dispose(pTVisibleBaseObject(m_VisibleActors.Items[i]));
    end;//004B8296
    nCheckCode:=13;
    m_VisibleActors.Free;
    nCheckCode:=14;
    for i:=0 to m_VisibleItems.Count -1 do begin
      Dispose(pTVisibleMapItem(m_VisibleItems.Items[i]));
    end;//004B82E3
    nCheckCode:=15;
    m_VisibleItems.Free;
    nCheckCode:=16;
    m_VisibleEvents.Free;
    nCheckCode:=17;
    for i:=0 to m_ItemList.Count -1 do begin
      Dispose(PTUserItem(m_ItemList.Items[i]));
    end;//004B833E
    nCheckCode:=18;
    m_ItemList.Free;
    nCheckCode:=19;
    for i:=0 to m_DealItemList.Count -1 do begin
      Dispose(pTUserItem(m_DealItemList.Items[i]));
    end;//004B838B
    m_DealItemList.Free;
    nCheckCode:=20;
    for i:=0 to m_MagicList.Count -1 do begin
      Dispose(pTUserMagic(m_MagicList.Items[i]));
    end;//004B83D8
    m_MagicList.Free;
    nCheckCode:=21;
    for i:=0 to m_StorageItemList.Count -1 do begin
      Dispose(pTUserItem(m_StorageItemList.Items[i]));
    end;//004B8425
    m_StorageItemList.Free;
    nCheckCode:=22;
    m_GroupMembers.Free;
    nCheckCode:=23;
    m_BlockWhisperList.Free;
    nCheckCode:=24;
    m_SlaveList.Free;
    nCheckCode:=25;
  except
    on e: Exception do begin
      MainOutMessage(format(sExceptionMsg,[nCheckCode]));
      MainOutMessage(E.Message);
    end;
  end;
  {
  for I := 0 to CertCheck.Count - 1 do begin
    if CertCheck.Items[I] = Self then begin
      CertCheck.Delete(I);
      break;
    end;
  end;
  }
  inherited;
end;

procedure TBaseObject.ChangePKStatus(boWarFlag:Boolean);//004B84C8
begin
  if m_boInFreePKArea <> boWarFlag then begin
    m_boInFreePKArea:=boWarFlag;
    m_boNameColorChanged:=True;
  end;
end;

function TBaseObject.GetDropPosition (nOrgX,nOrgY,nRange:Integer;var nDX:Integer;var nDY:Integer):Boolean;//004C5238
var
 i,ii,iii:Integer;
 nItemCount,n24,n28,n2C:integer;
begin
  n24:=999;
  Result:=False;
  n28:=0; //09/10
  n2C:=0; //09/10
  for I := 1 to nRange do begin
    for II := -I to I  do begin
      for III := -I to I do begin
        nDX:=nOrgX + III;
        nDY:=nOrgY + II;
        if m_PEnvir.GetItemEx(nDX,nDY,nItemCount) = nil then begin
          if m_PEnvir.bo2C then begin
            Result:=True;
            break;
          end;
        end else begin
          if m_PEnvir.bo2C and (n24 > nItemCount) then begin
            n24:=nItemCount;
            n28:=nDX;
            n2C:=nDY;
          end;
        end;
      end;
      if Result then break;
    end;
    if Result then break;
  end;
  if not Result then begin
    if n24 < 8 then begin
      nDX:=n28;
      nDY:=n2C;
    end else begin
      nDX:=nOrgX;
      nDY:=nOrgY;
    end;
  end;
end;
//004C5478
function  TBaseObject.DropItemDown (UserItem:pTUserItem;nScatterRange:Integer;boDieDrop:Boolean;ItemOfCreat,DropCreat:TBaseObject): Boolean;
var
   dx, dy, idura: integer;
   MapItem, pr: pTMapItem;
   StdItem:TItem;
   logcap: string;
begin
   Result := FALSE;
   StdItem:= UserEngine.GetStdItem (UserItem.wIndex);
   if StdItem <> nil then begin
      if StdItem.StdMode = 40 then begin
         idura := UserItem.Dura;
         idura := idura - 2000;
         if idura < 0 then idura := 0;
         UserItem.Dura := idura;
      end;

      New(MapItem);
      MapItem.UserItem := UserItem^;
      MapItem.Name := GetItemName(UserItem); //取自定义物品名称

      MapItem.Looks := StdItem.Looks;
      if StdItem.StdMode = 45 then begin  //林荤困, 格犁
         MapItem.Looks := GetRandomLook (MapItem.Looks, StdItem.Shape);
      end;
      MapItem.AniCount := StdItem.AniCount;
      MapItem.Reserved := 0;
      MapItem.Count := 1;
      MapItem.OfBaseObject:=ItemOfCreat;
      MapItem.dwCanPickUpTick:=GetTickCount();
      MapItem.DropBaseObject:=DropCreat;
      GetDropPosition (m_nCurrX, m_nCurrY, nScatterRange, dx, dy);
      pr := m_PEnvir.AddToMap (dx, dy, OS_ITEMOBJECT, TObject (MapItem));
      if pr = MapItem then begin
         SendRefMsg (RM_ITEMSHOW, MapItem.Looks, integer(MapItem), dx, dy, MapItem.Name);
         if boDieDrop then logcap := '15'
         else logcap := '7';
         if not IsCheapStuff (StdItem.StdMode) then
            //004C5716
            if StdItem.NeedIdentify = 1 then
              AddGameDataLog (logcap + #9 +
                        m_sMapName + #9 +
                        IntToStr(m_nCurrX) + #9 +
                        IntToStr(m_nCurrY) + #9 +
                        m_sCharName + #9 +
                        //UserEngine.GetStdItemName(ui.wIndex) + #9 +
                        StdItem.Name + #9 +
                        IntToStr(UserItem.MakeIndex) + #9 +
                        BoolToIntStr(m_btRaceServer = RC_PLAYOBJECT) + #9 +
                        '0');
         Result := TRUE;
      end else begin
         Dispose (MapItem);
      end;
   end;
end;

procedure  TBaseObject.GoldChanged();//004C49F4
begin
  if m_btRaceServer = RC_PLAYOBJECT then begin
    SendUpdateMsg(Self,RM_GOLDCHANGED,0,0,0,0,'');
  end;
end;
procedure  TBaseObject.GameGoldChanged();//004C49F4
begin
  if m_btRaceServer = RC_PLAYOBJECT then begin
    SendUpdateMsg(Self,RM_GAMEGOLDCHANGED,0,0,0,0,'');
  end;
end;

procedure TBaseObject.RecalcLevelAbilitys();//004BF7DC
var
  nLevel,n:integer;
begin
{$IF OEMVER = OEM775}

{$ELSE}
  nLevel:=m_Abil.Level;
  case m_btJob of
    jTaos: begin
      //m_Abil.MaxHP:=_MIN(High(Word),14 + ROUND((nLevel / 6 + 2.5) * nLevel));
      m_Abil.MaxHP:=_MIN(High(Word),14 + ROUND(((nLevel / g_Config.nLevelValueOfTaosHP + g_Config.nLevelValueOfTaosHPRate) * nLevel)));

      //m_Abil.MaxMP:=_MIN(High(Word),13 + ROUND((nLevel / 8)* 2.2 * nLevel));
      m_Abil.MaxMP:=_MIN(High(Word),13 + ROUND(((nLevel / g_Config.nLevelValueOfTaosMP)* 2.2 * nLevel)));

      m_Abil.MaxWeight:=50 + ROUND((nLevel / 4) * nLevel);
      m_Abil.MaxWearWeight:=15 + ROUND((nLevel / 50) * nLevel);
      m_Abil.MaxHandWeight:=12 + ROUND((nLevel / 42) * nLevel);

      n:=nLevel div 7;
      m_Abil.DC:=MakeLong(_MAX(n-1, 0), _MAX(1, n));
      m_Abil.MC:=0;
      m_Abil.SC:=MakeLong(_MAX(n-1, 0), _MAX(1, n));
      m_Abil.AC:=0;

      n:=ROUND(nLevel / 6);
      m_Abil.MAC:=MakeLong(n div 2, n + 1);
    end;
    jWizard: begin
      //m_Abil.MaxHP:=_MIN(High(Word),14 + ROUND((nLevel / 15 + 1.8) * nLevel));
      m_Abil.MaxHP:=_MIN(High(Word),14 + ROUND(((nLevel / g_Config.nLevelValueOfWizardHP + g_Config.nLevelValueOfWizardHPRate) * nLevel)));

      m_Abil.MaxMP:=_MIN(High(Word),13 + ROUND((nLevel / 5 + 2) * 2.2 * nLevel));
      m_Abil.MaxWeight:=50 + ROUND((nLevel / 5) * nLevel);
      m_Abil.MaxWearWeight:= 15 + ROUND((nLevel / 100) * nLevel);
      m_Abil.MaxHandWeight:= 12 + ROUND((nLevel / 90) * nLevel);

      n:=nLevel div 7;
      m_Abil.DC:=MakeLong(_MAX(n-1, 0), _MAX(1, n));
      m_Abil.MC:=MakeLong(_MAX(n-1, 0), _MAX(1, n));
      m_Abil.SC:=0;
      m_Abil.AC:=0;
      m_Abil.MAC:=0;
    end;
    jWarr: begin
      //m_Abil.MaxHP:=_MIN(High(Word),14 + ROUND((nLevel / 4.0 + 4.5 + nLevel / 20) * nLevel));
      m_Abil.MaxHP:=_MIN(High(Word),14 + ROUND(((nLevel / g_Config.nLevelValueOfWarrHP + g_Config.nLevelValueOfWarrHPRate + nLevel / 20) * nLevel)));

      m_Abil.MaxMP:=_MIN(High(Word),11 + ROUND(nLevel * 3.5));
      m_Abil.MaxWeight:= 50 + ROUND((nLevel / 3) * nLevel);
      m_Abil.MaxWearWeight:= 15 + ROUND((nLevel / 20) * nLevel);
      m_Abil.MaxHandWeight:= 12 + ROUND((nLevel / 13) * nLevel);

      m_Abil.DC:= MakeLong(_MAX((nLevel div 5) - 1, 1), _MAX(1, (nLevel div 5)));
      m_Abil.SC:= 0;
      m_Abil.MC:= 0;
      m_Abil.AC:= MakeLong(0, (nLevel div 7));
      m_Abil.MAC:= 0;
    end;
  end;
  if m_Abil.HP > m_Abil.MaxHP then m_Abil.HP:=m_Abil.MaxHP;
  if m_Abil.MP > m_Abil.MaxMP then m_Abil.MP:=m_Abil.MaxMP;
{$IFEND}
end;

procedure TBaseObject.HasLevelUp(nLevel:Integer);//004BED6C
begin
  m_Abil.MaxExp:=GetLevelExp(m_Abil.Level);
  RecalcLevelAbilitys();
  RecalcAbilitys();
  SendMsg(Self, RM_LEVELUP, 0, m_Abil.Exp, 0, 0, '');
  
{$IFDEF FOR_ABIL_POINT}
//4/16老 何磐 利侩
   if prevlevel + 1 = Abil.Level then begin
      BonusPoint := BonusPoint + GetBonusPoint (Job, Abil.Level);
      SendMsg (self, RM_ADJUST_BONUS, 0, 0, 0, 0, '');
   end else begin
      if prevlevel <> Abil.Level then begin
         //焊呈胶 器牢飘甫 贸澜何磐 促矫 拌魂茄促.
         BonusPoint := GetLevelBonusSum (Job, Abil.Level);
         FillChar (BonusAbil, sizeof(TNakedAbility), #0);
         FillChar (CurBonusAbil, sizeof(TNakedAbility), #0);
         //if prevlevel <> 0 then begin
         RecalcLevelAbilitys;  //饭骇俊 蝶弗 瓷仿摹甫 拌魂茄促.
         //end else begin
         //   RecalcLevelAbilitys_old;
         //   BonusPoint := 0;
         //end;
         SendMsg (self, RM_ADJUST_BONUS, 0, 0, 0, 0, '');
      end;
   end;
{$ENDIF}

  if (g_FunctionNPC <> nil) then
    g_FunctionNPC.GotoLable(TPlayObject(Self),'@LevelUp',False);
end;

procedure AddUserLog(sMsg: String);//004E42F8
begin
  MainOutMessage(sMsg);
end;

function TBaseObject.WalkTo(btDir:Byte;boFlag:boolean):Boolean;//004C3F64
var
  nOX,nOY,nNX,nNY,n20,n24:Integer;
  //Envir:TEnvirnoment;
  bo29:Boolean;
ResourceString
  sExceptionMsg = '[Exception] TBaseObject::WalkTo';
begin
  Result:=False;
  if m_boHolySeize then exit;
  try
    nOX:=m_nCurrX;
    nOY:=m_nCurrY;
//    Envir:=m_PEnvir;
    m_btDirection:=btDir;
    nNX:=0;
    nNY:=0;
   case btDir of
      DR_UP         :begin nNX:= m_nCurrX;   nNY:= m_nCurrY-1; end;
      DR_UPRIGHT    :begin nNX:= m_nCurrX+1; nNY:= m_nCurrY-1; end;
      DR_RIGHT      :begin nNX:= m_nCurrX+1; nNY:= m_nCurrY; end;
      DR_DOWNRIGHT  :begin nNX:= m_nCurrX+1; nNY:= m_nCurrY+1; end;
      DR_DOWN       :begin nNX:= m_nCurrX;   nNY:= m_nCurrY+1; end;
      DR_DOWNLEFT   :begin nNX:= m_nCurrX-1; nNY:= m_nCurrY+1; end;
      DR_LEFT       :begin nNX:= m_nCurrX-1; nNY:= m_nCurrY; end;
      DR_UPLEFT     :begin nNX:= m_nCurrX-1; nNY:= m_nCurrY-1; end;
   end;
   if (nNX >= 0) and ((m_PEnvir.Header.wWidth - 1 ) >= nNX) and
      (nNY >= 0) and ((m_PEnvir.Header.wHeight - 1) >= nNY) then begin
     bo29:=True;
     if bo2BA and not m_PEnvir.CanSafeWalk(nNX,nNY) then bo29:=False;
     if m_Master <> nil then begin
       m_Master.m_PEnvir.GetNextPosition(m_Master.m_nCurrX,m_Master.m_nCurrY,m_Master.m_btDirection,1,n20,n24);
       if (nNX = n20) and (nNY = n24) then bo29:=False;
     end;
     if bo29 then begin
       if m_PEnvir.MoveToMovingObject(m_nCurrX,m_nCurrY,Self,nNX,nNY,boFlag) > 0 then begin
         m_nCurrX:=nNX;
         m_nCurrY:=nNY;
       end;
     end;
   end;
   if (m_nCurrX <> nOX) or (m_nCurrY <> nOY) then begin
     if Walk(RM_WALK) then begin
       if m_boTransparent and m_boHideMode then m_wStatusTimeArr[STATE_TRANSPARENT{0x70}]:=1;
       Result:=True;
     end else begin
       m_PEnvir.DeleteFromMap(m_nCurrX,m_nCurrY,OS_MOVINGOBJECT,Self);
       m_nCurrX:=nOX;
       m_nCurrY:=nOY;
       m_PEnvir.AddToMap(m_nCurrX,m_nCurrY,OS_MOVINGOBJECT,Self);
     end;
   end;
  except
    MainOutMessage(sExceptionMsg);
  end;
end;

function TBaseObject.IsGroupMember(target:TBaseObject):Boolean; //004C3908
var
  I: Integer;
begin
  Result:=False;
  if m_GroupOwner = nil then exit;
  for I := 0 to m_GroupOwner.m_GroupMembers.Count - 1 do begin
    if m_GroupOwner.m_GroupMembers.Objects[i] = target then begin
      Result:=True;
      break;
    end;
  end;
end;

function TBaseObject.PKLevel(): Integer;//004BF0A0
begin
  Result:=m_nPkPoint div 100;
end;

procedure TBaseObject.HealthSpellChanged;//004C4A24
begin
  if m_btRaceServer = RC_PLAYOBJECT then begin
    SendUpdateMsg(Self,RM_HEALTHSPELLCHANGED,0,0,0,0,'');
  end;
  if m_boShowHP then begin
    SendRefMsg(RM_HEALTHSPELLCHANGED,0,0,0,0,'');
  end;
end;
function TBaseObject.CalcGetExp(nLevel:Integer;nExp:Integer):Integer;   //004BE59F
begin

  if g_Config.boHighLevelKillMonFixExp or (m_Abil.Level < (nLevel + 10)) then begin
    Result:=nExp;
  end else begin
    Result := nExp - ROUND((nExp / 15) * (m_Abil.Level - (nLevel + 10)));
  end;
  if Result <= 0 then Result:=1;
end;

procedure TBaseObject.RefNameColor();//004BF124
begin
  SendRefMsg(RM_CHANGENAMECOLOR,0,0,0,0,'');
end;

procedure TBaseObject.GainSlaveExp(nLevel:Integer); //004BE8BC
  function GetUpKillCount ():Integer;  //004BE864
  var
    tCount:Integer;
  begin
    if m_btSlaveExpLevel < SLAVEMAXLEVEL -2 then begin
      tCount:=g_Config.MonUpLvNeedKillCount[m_btSlaveExpLevel];
    end else begin
      tCount:=0;
    end;
//    Result:= ((m_Abil.Level shl 4) - m_Abil.Level) + 100 + tCount
    Result:=((m_Abil.Level * g_Config.nMonUpLvRate{16}) - m_Abil.Level) + g_Config.nMonUpLvNeedKillBase{100} + tCount
  end;
{
var
  nNeedCount:Integer;
}
begin
  Inc(n294,nLevel);
  if GetUpKillCount() < n294 then begin
    Dec(n294,GetUpKillCount);
    if m_btSlaveExpLevel < (m_btSlaveMakeLevel * 2 + 1) then begin
      Inc(m_btSlaveExpLevel);
      RecalcAbilitys();
      RefNameColor();
    end;
  end;//004BE92F
end;

function TBaseObject.DropGoldDown(nGold:Integer;boFalg:Boolean;GoldOfCreat,DropGoldCreat:TBaseObject): Boolean; //004C5794
var
  MapItem,MapItemA:PTMapItem;
  nX,nY:Integer;
  s20:String;
begin
  Result:=False;
  New(MapItem);
  FillChar(MapItem^,SizeOf(TMapItem),#0);
  MapItem.Name:=sSTRING_GOLDNAME;
  MapItem.Count:=nGold;
  MapItem.Looks:=GetGoldShape(nGold);
  MapItem.OfBaseObject:=GoldOfCreat;
  MapItem.dwCanPickUpTick:=GetTickCount();
  MapItem.DropBaseObject:=DropGoldCreat;
  GetDropPosition (m_nCurrX, m_nCurrY, 3, nX,nY);
  MapItemA:=m_PEnvir.AddToMap (nX, nY, OS_ITEMOBJECT, TObject (MapItem));
  if MapItemA <> nil then begin
    if MapItemA <> MapItem then begin
      Dispose(MapItem);
      MapItem:=MapItemA;
    end;
    SendRefMsg (RM_ITEMSHOW, MapItem.Looks, integer(MapItem), nX, nY, MapItem.Name);
    if m_btRaceServer = RC_PLAYOBJECT then begin
      if boFalg then s20:='15'
      else s20:='7';
           //004C5995
          if g_boGameLogGold then
            AddGameDataLog (s20 + #9 +
                        m_sMapName + #9 +
                        IntToStr(m_nCurrX) + #9 +
                        IntToStr(m_nCurrY) + #9 +
                        m_sCharName + #9 +
                        sSTRING_GOLDNAME + #9 +
                        IntToStr(nGold) + #9 +
                        BoolToIntStr(m_btRaceServer = RC_PLAYOBJECT) + #9 +
                        '0');
    end; //004C599A
    Result:=True;
  end else Dispose(MapItem);    
end;

function TBaseObject.GetGuildRelation(cert1, cert2: TBaseObject): Integer; //004BF380
begin
  Result:=0;
  m_boGuildWarArea:=False;
  if (cert1.m_MyGuild= nil) or (cert2.m_MyGuild = nil) then exit;
  if cert1.InSafeArea or (cert2.InSafeArea) then exit;
  if TGuild(cert1.m_MyGuild).GuildWarList.Count <= 0 then exit;
  m_boGuildWarArea:=True;
  if TGuild(cert1.m_MyGuild).IsWarGuild(TGuild(cert2.m_MyGuild)) and
     TGuild(cert2.m_MyGuild).IsWarGuild(TGuild(cert1.m_MyGuild)) then Result:=2;

  if cert1.m_MyGuild = cert2.m_MyGuild then Result:=1;
  if TGuild(cert1.m_MyGuild).IsAllyGuild(TGuild(cert2.m_MyGuild)) and
     TGuild(cert2.m_MyGuild).IsAllyGuild(TGuild(cert1.m_MyGuild)) then Result:=3;
end;

procedure TBaseObject.IncPkPoint(nPoint: Integer); //004BF4D4
var
  nOldPKLevel:Integer;
begin
  nOldPKLevel:=PKLevel;
  Inc(m_nPkPoint,nPoint);
  if PKLevel <> nOldPKLevel then begin
    if PKLevel <= 2 then RefNameColor;
  end;    
end;

procedure TBaseObject.AddBodyLuck(dLuck:Double); //004BF580
var
  n:Integer;
begin
  if (dLuck > 0) and (m_dBodyLuck < 5 * BODYLUCKUNIT) then begin
    m_dBodyLuck := m_dBodyLuck + dLuck;
  end;
  if (dLuck < 0) and (m_dBodyLuck > -(5 * BODYLUCKUNIT)) then begin
    m_dBodyLuck := m_dBodyLuck + dLuck;
  end;

  n := Trunc (m_dBodyLuck / BODYLUCKUNIT);
  if n > 5 then n := 5;
  if n < -10 then n := -10;
  m_nBodyLuckLevel := n;
end;

procedure TBaseObject.MakeWeaponUnlock; //004C1198
begin
  if m_UseItems[U_WEAPON].wIndex <= 0 then exit;
  if m_UseItems[U_WEAPON].btValue[3] > 0 then begin
    Dec(m_UseItems[U_WEAPON].btValue[3]);
    SysMsg(g_sTheWeaponIsCursed,c_Red,t_Hint);
  end else begin
    if m_UseItems[U_WEAPON].btValue[4] < 10 then begin
      Inc(m_UseItems[U_WEAPON].btValue[4]);
      SysMsg(g_sTheWeaponIsCursed,c_Red,t_Hint);
    end;
  end;
  if m_btRaceServer = RC_PLAYOBJECT then begin
    RecalcAbilitys();
    SendMsg(Self,RM_ABILITY,0,0,0,0,'');
    SendMsg(Self,RM_SUBABILITY,0,0,0,0,'');
  end;
end;

function TBaseObject.GetAttackPower(nBasePower,nPower:Integer):Integer;
var
  PlayObject:TPlayObject;
begin
  if nPower < 0 then nPower := 0;
  if m_nLuck > 0 then begin
    if Random(10 - _MIN(9,m_nLuck)) = 0 then Result := nBasePower + nPower
    else Result := nBasePower + Random(nPower + 1);
  end else begin
    Result := nBasePower + Random(nPower + 1);
    if m_nLuck < 0 then begin
      if Random(10 - _MAX(0,-m_nLuck)) = 0 then Result := nBasePower;
    end;
  end;
  if m_btRaceServer = RC_PLAYOBJECT then begin
    PlayObject:=TPlayObject(Self);
    //Result:=Result * PlayObject.m_nPowerMult + ROUND(Result * (PlayObject.m_nPowerMultPoint / 100));
    Result:=ROUND(Result * (PlayObject.m_nPowerRate / 100));
    if PlayObject.m_boPowerItem then
      Result:=ROUND(m_rPowerItem * Result);
  end;
  if m_boAutoChangeColor then begin
    Result:=Result * m_nAutoChangeIdx + 1;
  end;
  if m_boFixColor then begin
    Result:=Result * m_nFixColorIdx + 1;
  end;

end;
procedure TBaseObject.DamageHealth(nDamage: Integer); //004BE3FC
var
  nSpdam:Integer;
begin
  if ((m_LastHiter = nil) or not m_LastHiter.m_boUnMagicShield) and m_boMagicShield and (nDamage > 0) and (m_WAbil.MP > 0) then begin
    nSpdam := Round (nDamage * 1.5);
    if integer(m_WAbil.MP) >= nSpdam then begin
      m_WAbil.MP := m_WAbil.MP - nSpdam;
      nSpdam := 0;
    end else begin
      nSpdam := nSpdam - m_WAbil.MP;
      m_WAbil.MP := 0;
    end;
    nDamage := Round (nSpdam / 1.5);
    HealthSpellChanged();
  end;
  if nDamage > 0 then begin
    if (m_WAbil.HP - nDamage) > 0 then begin
      m_WAbil.HP:=m_WAbil.HP - nDamage;
    end else begin
      m_WAbil.HP:=0;
    end;
  end else begin
    if (m_WAbil.HP - nDamage) < m_WAbil.MaxHP then begin
      m_WAbil.HP:=m_WAbil.HP - nDamage;
    end else begin
      m_WAbil.HP:= m_WAbil.MaxHP;
    end;
  end;
end;
function  TBaseObject.GetBackDir(nDir:integer):Integer;//004B2708
begin
  Result:=0;
  case nDir of
    DR_UP:Result:= DR_DOWN;
    DR_DOWN:Result:= DR_UP;
    DR_LEFT:Result:= DR_RIGHT;
    DR_RIGHT:Result:= DR_LEFT;
    DR_UPLEFT:Result:= DR_DOWNRIGHT;
    DR_UPRIGHT:Result:= DR_DOWNLEFT;
    DR_DOWNLEFT:Result:= DR_UPRIGHT;
    DR_DOWNRIGHT:Result:= DR_UPLEFT;
  end;
end;
function  TBaseObject.CharPushed (nDir,nPushCount:Integer): integer; //004C2F90
var
   i, nx, ny, olddir, oldx, oldy, nBackDir: integer;
begin
   Result := 0;
   olddir := m_btDirection;
   oldx := m_nCurrX;
   oldy := m_nCurrY;
   m_btDirection := ndir;
   nBackDir:=GetBackDir(ndir);
   for i:=0 to nPushCount - 1 do begin
     GetFrontPosition(nx, ny);
     if m_PEnvir.CanWalk (nX,nY,False) then begin
       if m_PEnvir.MoveToMovingObject(m_nCurrX,m_nCurrY,Self,nX,nY,False) > 0 then begin
         m_nCurrX := nX;
         m_nCurrY := nY;
            //SendRefMsg(RM_PUSH, GetBackDir(ndir), m_nCurrX, m_nCurrY, 0, '');
         SendRefMsg(RM_PUSH, nBackDir, m_nCurrX, m_nCurrY, 0, '');
         Inc(Result);
         if m_btRaceServer >= RC_ANIMAL then
            m_dwWalkTick := m_dwWalkTick + 800;
       end else break;
     end else break;
   end;

   m_btDirection:=nBackDir;
   if Result = 0 then m_btDirection:=olddir;
end;

function  TBaseObject.MagPassThroughMagic (sx, sy, tx, ty, ndir, magpwr: integer; undeadattack: Boolean): integer; //004C69F4
var
   i, tcount: integer;
   BaseObject:TBaseObject;
begin
   tcount := 0;
   for i:=0 to 12 do begin
     BaseObject:=TBaseObject(m_PEnvir.GetMovingObject(sx,sy,True));
     if BaseObject <> nil then begin
       if IsProperTarget (BaseObject) then begin
         if Random(10) >= BaseObject.m_nAntiMagic then begin
           if undeadattack then
             magpwr := Round (magpwr * 1.5);

           BaseObject.SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 0, 0, '', 600);
           Inc (tcount);
         end;
       end;
     end;
     if not ((abs(sx-tx) <= 0) and (abs(sy-ty) <= 0)) then begin
       ndir := GetNextDirection (sx, sy, tx, ty);
       if not m_PEnvir.GetNextPosition (sx, sy, ndir, 1, sx, sy) then
         break;
     end else
       break;
   end;
   Result := tcount;

end;


function TBaseObject.GetShowName: String; //004C129C
var
  sShowName:String;
begin
  sShowName:=m_sCharName;
  Result:=FilterShowName(sShowName);
  if (m_Master <> nil) and not m_Master.m_boObMode then begin
    Result:=Result + '(' + m_Master.m_sCharName + ')';
  end;

  {
  if m_btRaceServer <> RC_PLAYOBJECT then begin
    sShowName:=m_sCharName;
    Result:=FilterShowName(sShowName);
    if (m_Master <> nil) and not m_Master.m_boObMode then begin
      Result:=Result + '(' + m_Master.m_sCharName + ')';
    end;
  end else begin//004C1340
    Result:=m_sCharName;
    if m_MyGuild <> nil then begin
      if UserCastle.IsMasterGuild(TGuild(m_MyGuild)) then begin
        Result:=Result + '\' + TGuild(m_MyGuild).sGuildName + '(' + UserCastle.sName + ')';
      end else begin
        if g_boShowGuildName or (UserCastle.boUnderWar and (m_boInFreePKArea or UserCastle.IsCastleWarArea(m_PEnvir,m_nCurrX,m_nCurrY))) then begin
          Result:=Result + '\' + TGuild(m_MyGuild).sGuildName + '[' + m_sGuildRankName + ']';
        end;
      end;
    end;
  end;
  }
end;


procedure TBaseObject.RecalcAbilitys;//004C03B0
var
  wOldHP,wOldMP  :Word;
  boOldHideMode  :Boolean;
  nOldLight      :Integer;
  I              :Integer;
  StdItem        :TItem;

  boRecallSuite  :Array[0..3] of Boolean;
  boMoXieSuite   :Array[0..2] of Boolean;

  boHongMoSuite1 :Boolean;
  boHongMoSuite2 :Boolean;
  boHongMoSuite3 :Boolean;
  boSpirit       :Array[0..3] of Boolean;

  boSmash1,boSmash2,boSmash3:Boolean;
  boHwanDevil1,boHwanDevil2,boHwanDevil3:Boolean;
  boPurity1,boPurity2,boPurity3:Boolean;
  boMundane1,boMundane2:Boolean;
  boNokChi1,boNokChi2:Boolean;
  boTaoBu1,boTaoBu2:Boolean;
  boFiveString1,boFiveString2,boFiveString3:Boolean;
begin
  FillChar(m_AddAbil,SizeOf(TAddAbility),#0);
  wOldHP             := m_WAbil.HP;
  wOldMP             := m_WAbil.MP;
  m_WAbil            := m_Abil;
  m_WAbil.HP         := wOldHP;
  m_WAbil.MP         := wOldMP;
  m_WAbil.Weight     := 0;
  m_WAbil.WearWeight := 0;
  m_WAbil.HandWeight := 0;
  m_btAntiPoison     := 0;
  m_nPoisonRecover   := 0;
  m_nHealthRecover   := 0;
  m_nSpellRecover    := 0;
  m_nAntiMagic       := 1;
  m_nLuck            := 0;
  m_nHitSpeed        := 0;
  m_boExpItem        := False;
  m_rExpItem         := 0;
  m_boPowerItem      := False;
  m_rPowerItem       := 0;
  boOldHideMode      := m_boHideMode;
  m_boHideMode       := False;
  m_boTeleport       := False;
  m_boParalysis      := False;
  m_boRevival        := False;
  m_boUnRevival      := False;
  m_boFlameRing      := False;
  m_boRecoveryRing   := False;
  m_boAngryRing      := False;
  m_boMagicShield    := False;
  m_boUnMagicShield  := False;
  m_boMuscleRing     := False;
  m_boFastTrain      := False;
  m_boProbeNecklace  := False;
  m_boSupermanItem   := False;
  m_boGuildMove      := False;
  m_boUnParalysis    := False;
  m_boExpItem        := False;
  m_boPowerItem      := False;
  m_boNoDropItem     := False;
  m_boNoDropUseItem  := False;
  m_bopirit          := False;
  m_btHorseType      := 0;
  m_btDressEffType   := 0;

  m_nMoXieSuite      := 0;
  boMoXieSuite[0]    := False;
  boMoXieSuite[1]    := False;
  boMoXieSuite[2]    := False;
  m_db3B0            := 0;
  m_nHongMoSuite     := 0;
  boHongMoSuite1     := False;
  boHongMoSuite2     := False;
  boHongMoSuite3     := False;

  boSpirit[0]        := False;
  boSpirit[1]        := False;
  boSpirit[2]        := False;
  boSpirit[3]        := False;

  m_boRecallSuite    := False;
  boRecallSuite[0]   := False;
  boRecallSuite[1]   := False;
  boRecallSuite[2]   := False;
  boRecallSuite[3]   := False;

  m_boSmashSet        := False;
  boSmash1            := False;
  boSmash2            := False;
  boSmash3            := False;

  m_boHwanDevilSet    := False;
  boHwanDevil1        := False;
  boHwanDevil2        := False;
  boHwanDevil3        := False;

  m_boPuritySet       := False;
  boPurity1           := False;
  boPurity2           := False;
  boPurity3           := False;

  m_boMundaneSet      := False;
  boMundane1          := False;
  boMundane2          := False;

  m_boNokChiSet       := False;
  boNokChi1           := False;
  boNokChi2           := False;

  m_boTaoBuSet        := False;
  boTaoBu1            := False;
  boTaoBu2            := False;

  m_boFiveStringSet   := False;
  boFiveString1       := False;
  boFiveString2       := False;
  boFiveString3       := False;

  m_dwPKDieLostExp   := 0;
  m_nPKDieLostLevel  := 0;

  for I:=Low(THumanUseItems) to High(THumanUseItems) do begin
    if (m_UseItems[I].wIndex <= 0) or (m_UseItems[I].Dura <= 0) then Continue;
    StdItem:=UserEngine.GetStdItem(m_UseItems[I].wIndex);
    if StdItem = nil then Continue;
    StdItem.ApplyItemParameters(m_AddAbil);

    if (I = U_WEAPON) or (I = U_RIGHTHAND) or (I = U_DRESS) then begin
      if I = U_DRESS then begin
        Inc(m_WAbil.WearWeight,StdItem.Weight);
      end else begin
        Inc(m_WAbil.HandWeight,StdItem.Weight);
      end;
      //新增开始
      if StdItem.AniCount = 120 then m_boFastTrain     := True;
      if StdItem.AniCount = 121 then m_boProbeNecklace := True;
      if StdItem.AniCount = 145 then m_boGuildMove     := True;
      if StdItem.AniCount = 111 then begin
        m_wStatusTimeArr[STATE_TRANSPARENT{8 0x70}]:=6 * 10 * 1000;
        m_boHideMode:=True;
      end;
      if StdItem.AniCount = 112 then m_boTeleport     := True;
      if StdItem.AniCount = 113 then m_boParalysis    := True;
      if StdItem.AniCount = 114 then m_boRevival      := True;
      if StdItem.AniCount = 115 then m_boFlameRing    := True;
      if StdItem.AniCount = 116 then m_boRecoveryRing := True;
      if StdItem.AniCount = 117 then m_boAngryRing    := True;
      if StdItem.AniCount = 118 then m_boMagicShield  := True;
      if StdItem.AniCount = 119 then m_boMuscleRing   := True;
      if StdItem.AniCount = 135 then begin
        boMoXieSuite[0]:=True;
        Inc(m_nMoXieSuite,StdItem.Weight div 10);
      end;
      if StdItem.AniCount = 138 then begin
        Inc(m_nHongMoSuite,StdItem.Weight);
      end;
      if StdItem.AniCount = 139 then m_boUnParalysis:=True;
      if StdItem.AniCount = 140 then m_boSupermanItem:=True;
      if StdItem.AniCount = 141 then begin
        m_boExpItem:=True;
        m_rExpItem:=m_rExpItem + (m_UseItems[i].Dura / g_Config.nItemExpRate);
      end;
      if StdItem.AniCount = 142 then begin
        m_boPowerItem:=True;
        m_rPowerItem:=m_rPowerItem + (m_UseItems[i].Dura / g_Config.nItemPowerRate);
      end;
      if StdItem.AniCount = 182 then begin
        m_boExpItem:=True;
        m_rExpItem:=m_rExpItem + (m_UseItems[i].DuraMax / g_Config.nItemExpRate);
      end;
      if StdItem.AniCount = 183 then begin
        m_boPowerItem:=True;
        m_rPowerItem:=m_rPowerItem + (m_UseItems[i].DuraMax / g_Config.nItemPowerRate);
      end;

      if StdItem.AniCount = 143 then m_boUnMagicShield:=True;
      if StdItem.AniCount = 144 then m_boUnRevival:=True;
      if StdItem.AniCount = 170 then m_boAngryRing:=True;
      if StdItem.AniCount = 171 then m_boNoDropItem:=True;
      if StdItem.AniCount = 172 then m_boNoDropUseItem:=True;
      if StdItem.AniCount = 150 then begin //麻痹护身
        m_boParalysis:=True;
        m_boMagicShield:=True;
      end;
      if StdItem.AniCount = 151 then begin //麻痹火球
        m_boParalysis:=True;
        m_boFlameRing:=True;
      end;
      if StdItem.AniCount = 152 then begin //麻痹防御
        m_boParalysis:=True;
        m_boRecoveryRing:=True;
      end;
      if StdItem.AniCount = 153 then begin //麻痹负载
        m_boParalysis:=True;
        m_boMuscleRing:=True;
      end;
      if StdItem.Shape = 154 then begin //护身火球
        m_boMagicShield:=True;
        m_boFlameRing:=True;
      end;
      if StdItem.AniCount = 155 then begin //护身防御
        m_boMagicShield:=True;
        m_boRecoveryRing:=True;
      end;
      if StdItem.AniCount = 156 then begin //护身负载
        m_boMagicShield:=True;
        m_boMuscleRing:=True;
      end;

      if StdItem.AniCount = 157 then begin //传送麻痹
        m_boTeleport:=True;
        m_boParalysis:=True;
      end;

      if StdItem.AniCount = 158 then begin //传送护身
        m_boTeleport:=True;
        m_boMagicShield:=True;
      end;

      if StdItem.AniCount = 159 then begin //传送探测
        m_boTeleport:=True;
        m_boProbeNecklace:=True;
      end;
      if StdItem.AniCount = 160 then begin //传送复活
        m_boTeleport:=True;
        m_boRevival:=True;
      end;
      if StdItem.AniCount = 161 then begin //麻痹复活
        m_boParalysis:=True;
        m_boRevival:=True;
      end;
      if StdItem.AniCount = 162 then begin //护身复活
        m_boMagicShield:=True;
        m_boRevival:=True;
      end;
      if StdItem.AniCount = 180 then begin //PK 死亡掉经验
        m_dwPKDieLostExp:=StdItem.DuraMax * g_Config.dwPKDieLostExpRate;
//        m_nPKDieLostLevel:=1;
      end;
      if StdItem.AniCount = 181 then begin //PK 死亡掉等级
        m_nPKDieLostLevel:=StdItem.DuraMax div g_Config.nPKDieLostLevelRate;
      end;
      //新增结束
    end else begin
      Inc(m_WAbil.WearWeight,StdItem.Weight);
    end;
    Inc(m_WAbil.Weight,StdItem.Weight);
    if (i = U_WEAPON) then begin
      if (StdItem.Source - 1 - 10) < 0 then begin
        m_AddAbil.btWeaponStrong:=StdItem.Source; //强度+
      end;
      if (StdItem.Source <= -1) and (StdItem.Source >= -50) then begin // -1 to -50
        m_AddAbil.btUndead:=m_AddAbil.btUndead + -StdItem.Source;//Holy+
      end;
      if (StdItem.Source <= -51) and (StdItem.Source >= -100) then begin // -51 to -100
        m_AddAbil.btUndead:=m_AddAbil.btUndead + (StdItem.Source + 50);//Holy-
      end;

      Continue;
    end;
    if (i = U_RIGHTHAND) then begin
      if StdItem.Shape in [1..50] then
        m_btDressEffType:=StdItem.Shape;
      if StdItem.Shape in [51..100] then
        m_btHorseType:=StdItem.Shape - 50;
      Continue;
    end;
      
    if (I = U_DRESS) then begin
      if m_UseItems[I].btValue[5] > 0 then
        m_btDressEffType:=m_UseItems[I].btValue[5];
      if StdItem.AniCount > 0 then
        m_btDressEffType:=StdItem.AniCount;

      if StdItem.Light then m_nLight := 3;

      Continue;
    end;
      //新增开始
      if StdItem.Shape = 139 then m_boUnParalysis  := True;
      if StdItem.Shape = 140 then m_boSupermanItem := True;
      if StdItem.Shape = 141 then begin
        m_boExpItem:=True;
        m_rExpItem:=m_rExpItem + (m_UseItems[i].Dura / g_Config.nItemExpRate);
      end;
      if StdItem.Shape = 142 then begin
        m_boPowerItem:=True;
        m_rPowerItem:=m_rPowerItem + (m_UseItems[i].Dura / g_Config.nItemPowerRate);
      end;
      if StdItem.Shape = 182 then begin
        m_boExpItem:=True;
        m_rExpItem:=m_rExpItem + (m_UseItems[i].DuraMax / g_Config.nItemExpRate);
      end;
      if StdItem.Shape = 183 then begin
        m_boPowerItem:=True;
        m_rPowerItem:=m_rPowerItem + (m_UseItems[i].DuraMax / g_Config.nItemPowerRate);
      end;
      if StdItem.Shape = 143 then m_boUnMagicShield := True;
      if StdItem.Shape = 144 then m_boUnRevival     := True;
      if StdItem.Shape = 170 then m_boAngryRing     := True;
      if StdItem.Shape = 171 then m_boNoDropItem    := True;
      if StdItem.Shape = 172 then m_boNoDropUseItem := True;

      if StdItem.Shape = 150 then begin //麻痹护身
        m_boParalysis:=True;
        m_boMagicShield:=True;
      end;
      if StdItem.Shape = 151 then begin //麻痹火球
        m_boParalysis:=True;
        m_boFlameRing:=True;
      end;
      if StdItem.Shape = 152 then begin //麻痹防御
        m_boParalysis:=True;
        m_boRecoveryRing:=True;
      end;
      if StdItem.Shape = 153 then begin //麻痹负载
        m_boParalysis:=True;
        m_boMuscleRing:=True;
      end;
      if StdItem.Shape = 154 then begin //护身火球
        m_boMagicShield:=True;
        m_boFlameRing:=True;
      end;
      if StdItem.Shape = 155 then begin //护身防御
        m_boMagicShield:=True;
        m_boRecoveryRing:=True;
      end;
      if StdItem.Shape = 156 then begin //护身负载
        m_boMagicShield:=True;
        m_boMuscleRing:=True;
      end;

      if StdItem.Shape = 157 then begin //传送麻痹
        m_boTeleport:=True;
        m_boParalysis:=True;
      end;

      if StdItem.Shape = 158 then begin //传送护身
        m_boTeleport:=True;
        m_boMagicShield:=True;
      end;

      if StdItem.Shape = 159 then begin //传送探测
        m_boTeleport:=True;
        m_boProbeNecklace:=True;
      end;
      if StdItem.Shape = 160 then begin //传送复活
        m_boTeleport:=True;
        m_boRevival:=True;
      end;
      if StdItem.Shape = 161 then begin //麻痹复活
        m_boParalysis:=True;
        m_boRevival:=True;
      end;
      if StdItem.Shape = 162 then begin //护身复活
        m_boMagicShield:=True;
        m_boRevival:=True;
      end;
      if StdItem.Shape = 180 then begin //PK 死亡掉经验
        m_dwPKDieLostExp:=StdItem.DuraMax * g_Config.dwPKDieLostExpRate;
//        m_nPKDieLostLevel:=1;
      end;
      if StdItem.Shape = 181 then begin //PK 死亡掉等级
        m_nPKDieLostLevel:=StdItem.DuraMax div g_Config.nPKDieLostLevelRate;
      end;
      //新增结束
    if (i = U_NECKLACE) then begin
      if StdItem.Shape = 120 then m_boFastTrain:=True;
      if StdItem.Shape = 121 then m_boProbeNecklace:=True;
      if StdItem.Shape = 123 then boRecallSuite[0]:=True;
      if StdItem.Shape = 145 then m_boGuildMove:=True;
      if StdItem.Shape = 127 then boSpirit[0]:=True;
      if StdItem.Shape = 135 then begin
        boMoXieSuite[0]:=True;
        Inc(m_nMoXieSuite,StdItem.AniCount);
      end;
      if StdItem.Shape = 138 then begin
        boHongMoSuite1:=True;
        Inc(m_nHongMoSuite,StdItem.AniCount);
      end;
      if StdItem.Shape = 200 then boSmash1:=True;
      if StdItem.Shape = 203 then boHwanDevil1:=True;
      if StdItem.Shape = 206 then boPurity1:=True;
      if StdItem.Shape = 216 then boFiveString1:=True;
    end;
    if (i = U_RINGR) or (i = U_RINGL) then begin
      if StdItem.Shape = 111 then begin
        m_wStatusTimeArr[STATE_TRANSPARENT{8 0x70}]:=6 * 10 * 1000;
        m_boHideMode:=True;
      end;
      if StdItem.Shape = 112 then m_boTeleport     := True;
      if StdItem.Shape = 113 then m_boParalysis    := True;
      if StdItem.Shape = 114 then m_boRevival      := True;
      if StdItem.Shape = 115 then m_boFlameRing    := True;
      if StdItem.Shape = 116 then m_boRecoveryRing := True;
      if StdItem.Shape = 117 then m_boAngryRing    := True;
      if StdItem.Shape = 118 then m_boMagicShield  := True;
      if StdItem.Shape = 119 then m_boMuscleRing   := True;
      if StdItem.Shape = 122 then boRecallSuite[1] := True;
      if StdItem.Shape = 128 then boSpirit[1]      := True;
      if StdItem.Shape = 133 then begin
        boMoXieSuite[1]:=True;
        Inc(m_nMoXieSuite,StdItem.AniCount);
      end;
      if StdItem.Shape = 136 then begin
        boHongMoSuite2:=True;
        Inc(m_nHongMoSuite,StdItem.AniCount);
      end;
      if StdItem.Shape = 201 then boSmash2:=True;
      if StdItem.Shape = 204 then boHwanDevil2:=True;
      if StdItem.Shape = 207 then boPurity2:=True;
      if StdItem.Shape = 210 then boMundane1:=True;
      if StdItem.Shape = 212 then boNokChi1:=True;
      if StdItem.Shape = 214 then boTaoBu1:=True;
      if StdItem.Shape = 217 then boFiveString2:=True;
    end;
    if (i = U_ARMRINGL) or (i = U_ARMRINGR) then begin
      if (StdItem.Source <= -1) and (StdItem.Source >= -50) then begin // -1 to -50
        m_AddAbil.btUndead:=m_AddAbil.btUndead + -StdItem.Source;//Holy+
      end;
      if (StdItem.Source <= -51) and (StdItem.Source >= -100) then begin // -51 to -100
        m_AddAbil.btUndead:=m_AddAbil.btUndead + (StdItem.Source + 50);//Holy-
      end;
      
      if StdItem.Shape = 124 then boRecallSuite[2] := True;
      if StdItem.Shape = 126 then boSpirit[2]      := True;
      if StdItem.Shape = 145 then m_boGuildMove  := True;
      if StdItem.Shape = 134 then begin
        boMoXieSuite[2]:=True;
        Inc(m_nMoXieSuite,StdItem.AniCount);
      end;
      if StdItem.Shape = 137 then begin
        boHongMoSuite3:=True;
        Inc(m_nHongMoSuite,StdItem.AniCount);
      end;
      if StdItem.Shape = 202 then boSmash3:=True;
      if StdItem.Shape = 205 then boHwanDevil3:=True;
      if StdItem.Shape = 208 then boPurity3:=True;
      if StdItem.Shape = 211 then boMundane2:=True;
      if StdItem.Shape = 213 then boNokChi2:=True;
      if StdItem.Shape = 215 then boTaoBu2:=True;
      if StdItem.Shape = 218 then boFiveString3:=True;
    end;
    if (i = U_HELMET) then begin
      if StdItem.Shape = 125 then boRecallSuite[3] := True;
      if StdItem.Shape = 129 then boSpirit[3]      := True;
    end;
  end;

  if boRecallSuite[0] and
     boRecallSuite[1] and
     boRecallSuite[2] and
     boRecallSuite[3] then m_boRecallSuite:=True;
  if boMoXieSuite[0] and
     boMoXieSuite[1] and
     boMoXieSuite[2] then Inc(m_nMoXieSuite,50);
  if boHongMoSuite1 and
     boHongMoSuite2 and
     boHongMoSuite3 then Inc(m_AddAbil.wHitPoint,2);

  if boSpirit[0] and
     boSpirit[1] and
     boSpirit[2] and
     boSpirit[3] then m_bopirit:=True;

  if boSmash1 and boSmash2 and boSmash3 then m_boSmashSet:=True;
  if boHwanDevil1 and boHwanDevil2 and boHwanDevil3 then m_boHwanDevilSet:=True;
  if boPurity1 and boPurity2 and boPurity3 then m_boPuritySet:=True;
  if boMundane1 and boMundane2 then m_boMundaneSet:=True;
  if boNokChi1 and boNokChi2 then m_boNokChiSet:=True;
  if boTaoBu1 and boTaoBu2 then m_boTaoBuSet:=True;
  if boFiveString1 and boFiveString2 and boFiveString3 then m_boFiveStringSet:=True;

  m_WAbil.Weight:=RecalcBagWeight();



  if m_boTransparent and (m_wStatusTimeArr[STATE_TRANSPARENT{8 0x70}] > 0) then //004C08D7
    m_boHideMode:=True;

  if m_boHideMode then begin //004C08E8
    if not boOldHideMode then begin
      m_nCharStatus:=GetCharStatus();
      StatusChanged();
    end;
  end else begin
    if boOldHideMode then begin      //004C091B
      m_wStatusTimeArr[STATE_TRANSPARENT{8 0x70}]:=0; //0x70
      m_nCharStatus:=GetCharStatus();
      StatusChanged();
    end;
  end;

  if m_btRaceServer = RC_PLAYOBJECT then //01-20 增加此行，只有类型为人物的角色才重新计算攻击敏捷
    RecalcHitSpeed();

  nOldLight:=m_nLight;
  if (m_UseItems[U_RIGHTHAND].wIndex > 0) and (m_UseItems[U_RIGHTHAND].Dura > 0) then
    m_nLight:=3
  else m_nLight:=0;
  if nOldLight <> m_nLight then
    SendRefMsg(RM_CHANGELIGHT,0,0,0,0,'');

  Inc(m_btSpeedPoint,m_AddAbil.wSpeedPoint);
  Inc(m_btHitPoint,m_AddAbil.wHitPoint);
  Inc(m_btAntiPoison,m_AddAbil.wAntiPoison);
  Inc(m_nPoisonRecover,m_AddAbil.wPoisonRecover);
  Inc(m_nHealthRecover,m_AddAbil.wHealthRecover);
  Inc(m_nSpellRecover,m_AddAbil.wSpellRecover);
  Inc(m_nAntiMagic,m_AddAbil.wAntiMagic);
  Inc(m_nLuck,m_AddAbil.btLuck);
  Dec(m_nLuck,m_AddAbil.btUnLuck);
  m_nHitSpeed:=m_AddAbil.nHitSpeed;//004C0A53

  Inc(m_WAbil.MaxWeight,m_AddAbil.Weight);
  Inc(m_WAbil.MaxWearWeight,m_AddAbil.WearWeight);
  Inc(m_WAbil.MaxHandWeight,m_AddAbil.HandWeight);

  m_WAbil.MaxHP:=_MIN(High(Word),m_Abil.MaxHP + m_AddAbil.wHP);
  m_WAbil.MaxMP:=_MIN(High(Word),m_Abil.MaxMP + m_AddAbil.wMP);

  m_WAbil.AC  := MakeLong(LoWord(m_AddAbil.wAC)  + LoWord(m_Abil.AC),  HiWord(m_AddAbil.wAC)  + HiWord(m_Abil.AC));
  m_WAbil.MAC := MakeLong(LoWord(m_AddAbil.wMAC) + LoWord(m_Abil.MAC), HiWord(m_AddAbil.wMAC) + HiWord(m_Abil.MAC));
  m_WAbil.DC  := MakeLong(LoWord(m_AddAbil.wDC)  + LoWord(m_Abil.DC),  HiWord(m_AddAbil.wDC)  + HiWord(m_Abil.DC));
  m_WAbil.MC  := MakeLong(LoWord(m_AddAbil.wMC)  + LoWord(m_Abil.MC),  HiWord(m_AddAbil.wMC)  + HiWord(m_Abil.MC));
  m_WAbil.SC  := MakeLong(LoWord(m_AddAbil.wSC)  + LoWord(m_Abil.SC),  HiWord(m_AddAbil.wSC)  + HiWord(m_Abil.SC));

  if m_wStatusTimeArr[STATE_DEFENCEUP{10 0x72}] > 0 then //004C0BCD
    m_WAbil.AC  := MakeLong(LoWord(m_WAbil.AC),HiWord(m_WAbil.AC) + 2 + (m_Abil.Level div 7));
  if m_wStatusTimeArr[STATE_MAGDEFENCEUP{11 0x74}] > 0 then //004C0C17
    m_WAbil.MAC := MakeLong(LoWord(m_WAbil.MAC),HiWord(m_WAbil.MAC) + 2 + (m_Abil.Level div 7));


  if m_wStatusArrValue[0] > 0 then //  if n218 > 0 then
    m_WAbil.DC  := MakeLong(LoWord(m_WAbil.DC),HiWord(m_WAbil.DC) + 2 + m_wStatusArrValue[0]{n218});


  if m_wStatusArrValue[1] > 0 then //  if n219 > 0 then
    m_WAbil.MC  := MakeLong(LoWord(m_WAbil.MC),HiWord(m_WAbil.MC) + 2 + m_wStatusArrValue[1]{n219});


  if m_wStatusArrValue[2] > 0 then //  if n21A > 0 then
    m_WAbil.SC  := MakeLong(LoWord(m_WAbil.SC),HiWord(m_WAbil.SC) + 2 + m_wStatusArrValue[2]{n21A});


  if m_wStatusArrValue[3] > 0 then //  if n21B > 0 then
    Inc(m_nHitSpeed,m_wStatusArrValue[3]{n21B});


  if m_wStatusArrValue[4] > 0 then begin //  if n21C > 0 then
    //Inc(m_WAbil.MaxHP,m_wStatusArrValue[4]{n21C});
    m_WAbil.MaxHP:=_MIN(High(Word),m_WAbil.MaxHP + m_wStatusArrValue[4]);
  end;


  if m_wStatusArrValue[5] > 0 then begin //  if n21D > 0 then
    //Inc(m_WAbil.MaxMP,m_wStatusArrValue[5]{n21D});
    m_WAbil.MaxMP:=_MIN(High(Word),m_WAbil.MaxMP + m_wStatusArrValue[5]);
  end;

  if m_boFlameRing then AddItemSkill(1)
  else DelItemSkill(1);
    
  if m_boRecoveryRing then AddItemSkill(2)
  else DelItemSkill(2);

  if m_boMuscleRing then begin //活力
    Inc(m_WAbil.MaxWeight,m_WAbil.MaxWeight);
    Inc(m_WAbil.MaxWearWeight,m_WAbil.MaxWearWeight);
    Inc(m_WAbil.MaxHandWeight,m_WAbil.MaxHandWeight);
  end;
  if m_nMoXieSuite > 0 then begin //魔血
    if m_WAbil.MaxMP <= m_nMoXieSuite then
      m_nMoXieSuite:= m_WAbil.MaxMP -1;
    Dec(m_WAbil.MaxMP,m_nMoXieSuite);
    //Inc(m_WAbil.MaxHP,m_nMoXieSuite);
    m_WAbil.MaxHP:=_MIN(High(Word),m_WAbil.MaxHP + m_nMoXieSuite);
  end;
  if m_bopirit then begin //Bonus DC Min +2,DC Max +5,A.Speed + 2
    m_WAbil.DC  := MakeLong(LoWord(m_WAbil.DC) + 2,HiWord(m_WAbil.DC) + 2 + 5);
    Inc(m_nHitSpeed, 2);
  end;
  if m_boSmashSet then begin //Attack Speed +1, DC1-3
    m_WAbil.DC  := MakeLong(LoWord(m_WAbil.DC) + 1,HiWord(m_WAbil.DC) + 2 + 3);
    Inc(m_nHitSpeed);
  end;
  if m_boHwanDevilSet then begin
    //Hand Carrying Weight Increase +5, Bag Weight Limit Increase +20, +MC 1-2
    Inc(m_WAbil.MaxHandWeight,5);
    Inc(m_WAbil.MaxWeight,20);
    m_WAbil.MC  := MakeLong(LoWord(m_WAbil.MC) + 1,HiWord(m_WAbil.MC) + 2 + 2);
  end;
  if m_boPuritySet then begin //Holy +3, Sc 1-2
    m_AddAbil.btUndead:=m_AddAbil.btUndead + -3;
    m_WAbil.SC  := MakeLong(LoWord(m_WAbil.SC) + 1,HiWord(m_WAbil.SC) + 2 + 2);
  end;
  if m_boMundaneSet then begin //Bonus of Hp+50
    m_WAbil.MaxHP:=_MIN(High(Word),m_WAbil.MaxHP + 50);
  end;
  if m_boNokChiSet then begin  //Bonus of Mp+50
    m_WAbil.MaxMP:=_MIN(High(Word),m_WAbil.MaxMP + 50);
  end;
  if m_boTaoBuSet then begin //Bonus of Hp+30, Mp+30
    m_WAbil.MaxHP:=_MIN(High(Word),m_WAbil.MaxHP + 30);
    m_WAbil.MaxMP:=_MIN(High(Word),m_WAbil.MaxMP + 30);
  end;
  if m_boFiveStringSet then begin //Bonus of Hp +30%, Ac+2
    m_WAbil.MaxHP:=_MIN(High(Word),(m_WAbil.MaxHP div 100) * 30);
    Inc(m_btHitPoint,2);
  end;

  if m_btRaceServer = RC_PLAYOBJECT then begin
    SendUpdateMsg(Self,RM_CHARSTATUSCHANGED,m_nHitSpeed,m_nCharStatus,0,0,'');
  end;

  if (m_btRaceServer >= RC_ANIMAL) then begin //004C0EA0
    MonsterRecalcAbilitys();
  end;

//限制最高属性
    m_WAbil.AC  := MakeLong(_MIN(MAXHUMPOWER,LoWord(m_WAbil.AC)),_MIN(MAXHUMPOWER,HiWord(m_WAbil.AC)));
    m_WAbil.MAC := MakeLong(_MIN(MAXHUMPOWER,LoWord(m_WAbil.MAC)),_MIN(MAXHUMPOWER,HiWord(m_WAbil.MAC)));
    m_WAbil.DC  := MakeLong(_MIN(MAXHUMPOWER,LoWord(m_WAbil.DC)),_MIN(MAXHUMPOWER,HiWord(m_WAbil.DC)));
    m_WAbil.MC  := MakeLong(_MIN(MAXHUMPOWER,LoWord(m_WAbil.MC)),_MIN(MAXHUMPOWER,HiWord(m_WAbil.MC)));
    m_WAbil.SC  := MakeLong(_MIN(MAXHUMPOWER,LoWord(m_WAbil.SC)),_MIN(MAXHUMPOWER,HiWord(m_WAbil.SC)));
(*
{$IF SoftVersion = VERFREE}
    m_WAbil.AC  := MakeLong(_MIN(400,LoWord(m_WAbil.AC)),_MIN(400,HiWord(m_WAbil.AC)));
    m_WAbil.MAC := MakeLong(_MIN(400,LoWord(m_WAbil.MAC)),_MIN(400,HiWord(m_WAbil.MAC)));
    m_WAbil.DC  := MakeLong(_MIN(400,LoWord(m_WAbil.DC)),_MIN(400,HiWord(m_WAbil.DC)));
    m_WAbil.MC  := MakeLong(_MIN(400,LoWord(m_WAbil.MC)),_MIN(400,HiWord(m_WAbil.MC)));
    m_WAbil.SC  := MakeLong(_MIN(400,LoWord(m_WAbil.SC)),_MIN(400,HiWord(m_WAbil.SC)));
{$ELSEIF SoftVersion = VERSTD}
    m_WAbil.AC  := MakeLong(_MIN(500,LoWord(m_WAbil.AC)),_MIN(500,HiWord(m_WAbil.AC)));
    m_WAbil.MAC := MakeLong(_MIN(500,LoWord(m_WAbil.MAC)),_MIN(500,HiWord(m_WAbil.MAC)));
    m_WAbil.DC  := MakeLong(_MIN(500,LoWord(m_WAbil.DC)),_MIN(500,HiWord(m_WAbil.DC)));
    m_WAbil.MC  := MakeLong(_MIN(500,LoWord(m_WAbil.MC)),_MIN(500,HiWord(m_WAbil.MC)));
    m_WAbil.SC  := MakeLong(_MIN(500,LoWord(m_WAbil.SC)),_MIN(500,HiWord(m_WAbil.SC)));
{$ELSEIF SoftVersion = VEROEM}
    m_WAbil.AC  := MakeLong(_MIN(500,LoWord(m_WAbil.AC)),_MIN(500,HiWord(m_WAbil.AC)));
    m_WAbil.MAC := MakeLong(_MIN(500,LoWord(m_WAbil.MAC)),_MIN(500,HiWord(m_WAbil.MAC)));
    m_WAbil.DC  := MakeLong(_MIN(500,LoWord(m_WAbil.DC)),_MIN(500,HiWord(m_WAbil.DC)));
    m_WAbil.MC  := MakeLong(_MIN(500,LoWord(m_WAbil.MC)),_MIN(500,HiWord(m_WAbil.MC)));
    m_WAbil.SC  := MakeLong(_MIN(500,LoWord(m_WAbil.SC)),_MIN(500,HiWord(m_WAbil.SC)));
{$ELSEIF SoftVersion = VERPRO}
    m_WAbil.AC  := MakeLong(_MIN(1000,LoWord(m_WAbil.AC)),_MIN(1000,HiWord(m_WAbil.AC)));
    m_WAbil.MAC := MakeLong(_MIN(1000,LoWord(m_WAbil.MAC)),_MIN(1000,HiWord(m_WAbil.MAC)));
    m_WAbil.DC  := MakeLong(_MIN(1000,LoWord(m_WAbil.DC)),_MIN(1000,HiWord(m_WAbil.DC)));
    m_WAbil.MC  := MakeLong(_MIN(1000,LoWord(m_WAbil.MC)),_MIN(1000,HiWord(m_WAbil.MC)));
    m_WAbil.SC  := MakeLong(_MIN(1000,LoWord(m_WAbil.SC)),_MIN(1000,HiWord(m_WAbil.SC)));
{$ELSEIF SoftVersion = VERENT}

{$IFEND}
*)
{$IF (SoftVersion = VERPRO) or (SoftVersion = VERENT)}
  if g_Config.boHungerSystem and g_Config.boHungerDecPower then begin
    case m_nHungerStatus of    //
      0..999: begin
        m_WAbil.DC:= MakeLong(ROUND(LoWord(m_WAbil.DC) * 0.2),ROUND(HiWord(m_WAbil.DC) * 0.2));
        m_WAbil.MC:= MakeLong(ROUND(LoWord(m_WAbil.MC) * 0.2),ROUND(HiWord(m_WAbil.MC) * 0.2));
        m_WAbil.SC:= MakeLong(ROUND(LoWord(m_WAbil.SC) * 0.2),ROUND(HiWord(m_WAbil.SC) * 0.2));
      end;
      1000..1999: begin
        m_WAbil.DC:= MakeLong(ROUND(LoWord(m_WAbil.DC) * 0.4),ROUND(HiWord(m_WAbil.DC) * 0.4));
        m_WAbil.MC:= MakeLong(ROUND(LoWord(m_WAbil.MC) * 0.4),ROUND(HiWord(m_WAbil.MC) * 0.4));
        m_WAbil.SC:= MakeLong(ROUND(LoWord(m_WAbil.SC) * 0.4),ROUND(HiWord(m_WAbil.SC) * 0.4));
      end;
      2000..2999: begin
        m_WAbil.DC:= MakeLong(ROUND(LoWord(m_WAbil.DC) * 0.6),ROUND(HiWord(m_WAbil.DC) * 0.6));
        m_WAbil.MC:= MakeLong(ROUND(LoWord(m_WAbil.MC) * 0.6),ROUND(HiWord(m_WAbil.MC) * 0.6));
        m_WAbil.SC:= MakeLong(ROUND(LoWord(m_WAbil.SC) * 0.6),ROUND(HiWord(m_WAbil.SC) * 0.6));
      end;
      3000..3999: begin
        m_WAbil.DC:= MakeLong(ROUND(LoWord(m_WAbil.DC) * 0.9),ROUND(HiWord(m_WAbil.DC) * 0.9));
        m_WAbil.MC:= MakeLong(ROUND(LoWord(m_WAbil.MC) * 0.9),ROUND(HiWord(m_WAbil.MC) * 0.9));
        m_WAbil.SC:= MakeLong(ROUND(LoWord(m_WAbil.SC) * 0.9),ROUND(HiWord(m_WAbil.SC) * 0.9));
      end;
    end;
  end;
{$IFEND}


    
end;

procedure TBaseObject.BreakOpenHealth();//004BDCD0
begin
  if m_boShowHP then begin
    m_boShowHP:=False;
    m_nCharStatusEx:= m_nCharStatusEx xor STATE_OPENHEATH;
    m_nCharStatus:=GetCharStatus();
    SendRefMsg(RM_CLOSEHEALTH,0,0,0,0,'');
  end;
end;

procedure TBaseObject.MakeOpenHealth(); //004BDC7C
begin
  m_boShowHP:=True;
  m_nCharStatusEx:= m_nCharStatusEx or STATE_OPENHEATH;
  m_nCharStatus:=GetCharStatus();
  SendRefMsg(RM_OPENHEALTH,0,m_WAbil.HP,m_WAbil.MaxHP,0,'');
end;


procedure TBaseObject.IncHealthSpell(nHP,nMP:Integer);//004BCAA4
begin
  if (nHP < 0) or (nMP < 0) then exit;
  if (m_WAbil.HP + nHP) >= m_WAbil.MaxHP then m_WAbil.HP:=m_WAbil.MaxHP
  else Inc(m_WAbil.HP,nHP);
  if (m_WAbil.MP + nMP) >= m_WAbil.MaxMP then m_WAbil.MP:=m_WAbil.MaxMP
  else Inc(m_WAbil.MP,nMP);
  HealthSpellChanged();    
end;

procedure TBaseObject.ItemDamageRevivalRing();//004C022C
var
  i:integer;
  pSItem: TItem;
  nDura,tDura :Integer;
  PlayObject:TPlayObject;
begin
  for i:=Low(THumanUseItems) to High(THumanUseItems) do begin
    if m_UseItems[i].wIndex > 0 then begin
      pSItem:=UserEngine.GetStdItem(m_UseItems[i].wIndex);
      if pSItem <> nil then begin
//        if (i = U_RINGR) or (i = U_RINGL) then begin
          if (pSItem.Shape in [114,160,161,162]) or (((i = U_WEAPON) or (i = U_RIGHTHAND)) and (pSItem.AniCount in [114,160,161,162])) then begin
            nDura:=m_UseItems[i].Dura;
            tDura:=Round(nDura / 1000{1.03});
            Dec(nDura,1000);
            if nDura <= 0 then begin
              nDura:=0;
              m_UseItems[i].Dura:= nDura;
              if m_btRaceServer = RC_PLAYOBJECT then begin
                PlayObject:=TPlayObject(Self);
                PlayObject.SendDelItems(@m_UseItems[i]);
              end;//004C0310
              m_UseItems[i].wIndex:=0;
              RecalcAbilitys();
            end else begin//004C0331
              m_UseItems[i].Dura:= nDura;
            end;
            if tDura <> Round(nDura / 1000{1.03}) then begin
              SendMsg(Self,RM_DURACHANGE,i,nDura,m_UseItems[i].DuraMax,0,'');
            end;
            //break;
          end;//004C0397
//        end;//004C0397
      end;//004C0397 if pSItem <> nil then begin
    end;//if UseItems[i].wIndex > 0 then begin
  end;// for i:=Low(UseItems) to High(UseItems) do begin
end;

procedure TBaseObject.Run; //004C7720
var
  i:integer;
  boChg:Boolean;
  boNeedRecalc:Boolean;
  nHP, nMP, n18:Integer; //
  dwC,dwInChsTime:LongWord;
  ProcessMsg:TProcessMessage;
  BaseObject:TBaseObject;
  nCheckCode:Integer;
  dwRunTick:LongWord;
  nInteger:Integer;
ResourceString
  sExceptionMsg0 = '[Exception] TBaseObject::Run 0';
  sExceptionMsg1 = '[Exception] TBaseObject::Run 1';
  sExceptionMsg2 = '[Exception] TBaseObject::Run 2';
  sExceptionMsg3 = '[Exception] TBaseObject::Run 3';
  sExceptionMsg4 = '[Exception] TBaseObject::Run 4 Code:%d';
  sExceptionMsg5 = '[Exception] TBaseObject::Run 5';
  sExceptionMsg6 = '[Exception] TBaseObject::Run 6';
begin
  nCheckCode:=0;
  dwRunTick:=GetTickCount();
  try
    while GetMessage(@ProcessMsg) do begin
      nCheckCode:=1000;
      Operate(@ProcessMsg);
      nCheckCode:=1001;
    end;
  except
    on e: Exception do begin
      MainOutMessage(sExceptionMsg0);
      MainOutMessage(E.Message);
    end;
  end;
  //SetProcessName('TBaseObject.Run 1');
  //004C7798
  try
    if m_boSuperMan then begin
		m_WAbil.HP:=m_WAbil.MaxHP;
		m_WAbil.MP:=m_WAbil.MaxMP;
	end;

    //004C77DA
    dwC:=(GetTickCount() - m_dwHPMPTick) div 20;
    m_dwHPMPTick:=GetTickCount();

    Inc(m_nHealthTick,dwC);
    Inc(m_nSpellTick,dwC);

    if not m_boDeath then begin
		// 自动恢复HP
		if (m_WAbil.HP < m_WAbil.MaxHP) and (m_nHealthTick >= g_Config.nHealthFillTime) then begin
			n18:= (m_WAbil.MaxHP div 75) + 1;
			//nPlus = m_WAbility.MaxHP / 15 + 1;        

			if (m_WAbil.HP + n18) < m_WAbil.MaxHP then begin
				Inc(m_WAbil.HP,n18);
			end else begin
				m_WAbil.HP:=m_WAbil.MaxHP;
			end;

			HealthSpellChanged;
		end;

		//自动恢复MP
		if (m_WAbil.MP < m_WAbil.MaxMP) and (m_nSpellTick >= g_Config.nSpellFillTime) then begin
			n18:= (m_WAbil.MaxMP div 18) + 1;

			if (m_WAbil.MP + n18) < m_WAbil.MaxMP then begin
				Inc(m_WAbil.MP,n18);
			end else begin
				m_WAbil.MP:=m_WAbil.MaxMP;
			end;

			HealthSpellChanged;
		end;

		//004C7934
		if m_WAbil.HP = 0 then begin
			if ((m_LastHiter = nil) or not m_LastHiter.m_boUnRevival{防复活}) and m_boRevival and (GetTickCount - m_dwRevivalTick > g_Config.dwRevivalTime{60 * 1000}) then begin
				m_dwRevivalTick:= GetTickCount();
				ItemDamageRevivalRing;
				m_WAbil.HP := m_WAbil.MaxHP;
				HealthSpellChanged;
				SysMsg (g_sRevivalRecoverMsg{'复活戒指生效，体力恢复'}, c_Green,t_Hint);
			end;
			if m_WAbil.HP = 0 then Die;
		end;

		if m_nHealthTick >= g_Config.nHealthFillTime then m_nHealthTick:=0;
		if m_nSpellTick >= g_Config.nSpellFillTime then m_nSpellTick:=0;

	end else begin
		if (GetTickCount() - m_dwDeathTick > g_Config.dwMakeGhostTime {3 * 60 * 1000}) then
			MakeGhost();
	end;
	except
		on e: Exception do begin
			MainOutMessage(sExceptionMsg1);
			MainOutMessage(E.Message);
		end;
	end;

  //004C7A34
  try
    if not m_boDeath and ((m_nIncSpell > 0) or (m_nIncHealth > 0) or (m_nIncHealing > 0)) then begin
      //004C7A7A
      dwInChsTime:=600 - _MIN(400,m_Abil.Level * 10);


      if ((GetTickCount - m_dwIncHealthSpellTick) >= dwInChsTime) and not m_boDeath then begin
        dwC:=_MIN(200,(GetTickCount - m_dwIncHealthSpellTick - dwInChsTime));
        m_dwIncHealthSpellTick:=GetTickCount() + dwC;
        if (m_nIncSpell > 0) or (m_nIncHealth > 0) or (m_nPerHealing > 0) then begin
          //004C7B1C

          if (m_nPerHealth <= 0) then m_nPerHealth:= 1;
          if (m_nPerSpell <= 0) then m_nPerSpell:= 1;
          if (m_nPerHealing <= 0) then m_nPerHealing:= 1;

          //004C7B67
          if m_nIncHealth < m_nPerHealth then begin
            nHP:=m_nIncHealth;
            m_nIncHealth:=0;
          end else begin
            //004C7B94
            nHP:=m_nPerHealth;
            Dec(m_nIncHealth,m_nPerHealth);
          end;

          //004C7BB2
          if m_nIncSpell < m_nPerSpell then begin
            nMP:=m_nIncSpell;
            m_nIncSpell:=0;
          end else begin
            //004C7BDF
            nMP:=m_nPerSpell;
            Dec(m_nIncSpell,m_nPerSpell);
          end;
          
          //004C7BFD
          if m_nIncHealing < m_nPerHealing then begin
            Inc(nHP,m_nIncHealing);
            m_nIncHealing:=0;
          end else begin
            //004C7C2A
            Inc(nHP,m_nPerHealing);
            Dec(m_nIncHealing,m_nPerHealing);
          end;
          m_nPerHealth:=(m_Abil.Level div 10 + 5);
          m_nPerSpell:=(m_Abil.Level div 10 + 5);
          m_nPerHealing:=5;
          IncHealthSpell(nHP,nMP);

          //004C7C9B
          if m_WAbil.HP = m_WAbil.MaxHP then begin
            m_nIncHealth:=0;
            m_nIncHealing:=0;
          end;
          if m_WAbil.MP = m_WAbil.MaxMP then begin
            m_nIncSpell:=0;
          end;
        end;
      end;
    end else begin //004C7CEA
      m_dwIncHealthSpellTick:=GetTickCount();
    end;
    //004C7CF8
    if (m_nHealthTick < - g_Config.nHealthFillTime) and (m_WAbil.HP > 1) then begin //Jacky ????
      dec(m_WAbil.HP);
      Inc(m_nHealthTick,g_Config.nHealthFillTime);
      HealthSpellChanged();
    end;
    //检查HP/MP值是否大于最大值，大于则降低到正常大小
    boNeedRecalc:=False;
    if m_WAbil.HP > m_WAbil.MaxHP then begin
      boNeedRecalc:=True;
      m_WAbil.HP:=m_WAbil.MaxHP -1;
    end;
    if m_WAbil.MP > m_WAbil.MaxMP then begin
      boNeedRecalc:=True;
      m_WAbil.MP:=m_WAbil.MaxMP -1;
    end;
    if boNeedRecalc then HealthSpellChanged();

  except
    MainOutMessage(sExceptionMsg2);
  end;

  //004C7D59
  //TBaseObject.Run 3 清理目标对象
  try
    if (m_TargetCret <> nil) then begin
      if ((GetTickCount() - m_dwTargetFocusTick) > 30000) or
         m_TargetCret.m_boDeath or
         m_TargetCret.m_boGhost or
         (m_TargetCret.m_PEnvir <> m_PEnvir) or // 08/06 增加，弓箭卫士在人物进入房间后再出来，还会攻击人物(人物的攻击目标没清除)
         (abs(m_TargetCret.m_nCurrX - m_nCurrX) > 15) or
         (abs(m_TargetCret.m_nCurrY - m_nCurrY) > 15) then begin
          //004C7DE4
          m_TargetCret:=nil;
      end;
    end;
    //004C7DEF
    if (m_LastHiter <> nil) then begin
      if ((GetTickCount() - m_LastHiterTick) > 30000) or
         m_LastHiter.m_boDeath or
         m_LastHiter.m_boGhost then begin
          //004C7E34
        m_LastHiter:=nil;
      end;
    end;
    //004C7E3F
    //
    if (m_ExpHitter <> nil) then begin
      if ((GetTickCount() - m_ExpHitterTick) > 6000) or
         m_ExpHitter.m_boDeath or
         m_ExpHitter.m_boGhost then begin
          //004C7E84
        m_ExpHitter:=nil;
      end;
    end;
    //004C7E8F
    if (m_Master <> nil) then begin
      m_boNoItem:=True;
      //宝宝变色
      if m_boAutoChangeColor and (GetTickCount - m_dwAutoChangeColorTick > g_Config.dwBBMonAutoChangeColorTime) then begin
        m_dwAutoChangeColorTick:=GetTickCount();
        case m_nAutoChangeIdx of    //
          0: nInteger:=STATE_TRANSPARENT;
          1: nInteger:=POISON_STONE;
          2: nInteger:=POISON_DONTMOVE;
          3: nInteger:=POISON_68;
          4: nInteger:=POISON_DECHEALTH;
          5: nInteger:=POISON_LOCKSPELL;
          6: nInteger:=POISON_DAMAGEARMOR;
          else begin
            m_nAutoChangeIdx:=0;
            nInteger:=STATE_TRANSPARENT;
          end;
        end;
        Inc(m_nAutoChangeIdx);
        m_nCharStatus:=(m_nCharStatusEx and $FFFFF) or (($80000000 shr nInteger) or 0);
        StatusChanged();
      end;
      if m_boFixColor and (m_nFixStatus <> m_nCharStatus) then begin
        case m_nFixColorIdx of    //
          0: nInteger:=STATE_TRANSPARENT;
          1: nInteger:=POISON_STONE;
          2: nInteger:=POISON_DONTMOVE;
          3: nInteger:=POISON_68;
          4: nInteger:=POISON_DECHEALTH;
          5: nInteger:=POISON_LOCKSPELL;
          6: nInteger:=POISON_DAMAGEARMOR;
          else begin
            m_nFixColorIdx:=0;
            nInteger:=STATE_TRANSPARENT;
          end;
        end;
        m_nCharStatus:=(m_nCharStatusEx and $FFFFF) or (($80000000 shr nInteger) or 0);
        m_nFixStatus:=m_nCharStatus;
        StatusChanged();
      end;
        
        
      // 宝宝在主人死亡后死亡处理
      if (m_Master.m_boDeath and ((GetTickCount - m_Master.m_dwDeathTick) > 1000)) then begin
        if g_Config.boMasterDieMutiny and (m_Master.m_LastHiter <> nil) and (Random(g_Config.nMasterDieMutinyRate) = 0) then begin
          m_Master:=nil;
          m_btSlaveExpLevel:=High(g_Config.SlaveColor);
          RecalcAbilitys();
          m_WAbil.DC:=MakeLong(LoWord(m_WAbil.DC) * g_Config.nMasterDieMutinyPower,HiWord(m_WAbil.DC) * g_Config.nMasterDieMutinyPower);
          m_nWalkSpeed:=m_nWalkSpeed div g_Config.nMasterDieMutinySpeed;
          RefNameColor;
          RefShowName;
        end else begin
          //004C7EFF
          m_WAbil.HP:=0;
        end;
      end;
      if m_Master.m_boGhost and ((GetTickCount - m_Master.m_dwGhostTick) > 1000) then begin
        MakeGhost;
      end;
      {
      if (m_Master.m_boDeath and ((GetTickCount - m_Master.m_dwDeathTick) > 1000)) or
         (m_Master.m_boGhost and ((GetTickCount - m_Master.m_dwGhostTick) > 1000)) then begin

        if g_Config.boMasterDieMutiny and (m_Master.m_LastHiter = nil) and (Random(g_Config.nMasterDieMutinyRate) = 0) then begin
          m_Master:=nil;
          m_btSlaveExpLevel:=High(g_Config.SlaveColor);
          RecalcAbilitys();
          m_WAbil.DC:=MakeLong(LoWord(m_WAbil.DC) * g_Config.nMasterDieMutinyPower,HiWord(m_WAbil.DC) * g_Config.nMasterDieMutinyPower);
          m_nWalkSpeed:=m_nWalkSpeed div g_Config.nMasterDieMutinySpeed;
          RefNameColor;
          RefShowName;
        end else begin
          //004C7EFF
          m_WAbil.HP:=0;
        end;
      end;
      }
    end;
    //004C7F0B
    //清除宝宝列表中已经死亡及叛变的宝宝信息
    for i:=m_SlaveList.Count -1 downto 0 do begin
      if TBaseObject(m_SlaveList.Items[i]).m_boDeath or
         TBaseObject(m_SlaveList.Items[i]).m_boGhost or
         (TBaseObject(m_SlaveList.Items[i]).m_Master <> Self) then

      m_SlaveList.Delete(i);
    end;
    //004C7F8A
    if m_boHolySeize and ((GetTickCount() - m_dwHolySeizeTick) > m_dwHolySeizeInterval) then begin
      BreakHolySeizeMode();
    end;
    //004C7FB7
    if m_boCrazyMode and ((GetTickCount() - m_dwCrazyModeTick) > m_dwCrazyModeInterval) then begin
      BreakCrazyMode();
    end;
    if m_boShowHP and ((GetTickCount() - m_dwShowHPTick) > m_dwShowHPInterval) then begin
      BreakOpenHealth();
    end;
  except
    MainOutMessage(sExceptionMsg3);
  end;

  //SetProcessName('TBaseObject.Run ');
  //004C802F
  try
    nCheckCode:=4;
    // 减少PK值开始
    if (GetTickCount() - m_dwDecPkPointTick) > g_Config.dwDecPkPointTime{120000} then begin
      m_dwDecPkPointTick:=GetTickCount();
      if m_nPkPoint > 0 then begin
        DecPKPoint(g_Config.nDecPkPointCount{1});
      end;
    end;
    // 减少PK值结束

    //检查照明物品及PK状态 开始
    nCheckCode:=41;
    if (GetTickCount - m_DecLightItemDrugTick) > g_Config.dwDecLightItemDrugTime{500} then begin
      Inc(m_DecLightItemDrugTick,g_Config.dwDecLightItemDrugTime{500});
      if m_btRaceServer = RC_PLAYOBJECT then begin
        UseLamp();
        CheckPKStatus();
      end;
    end;
    //检查照明物品及PK状态 结束

    nCheckCode:=42;
    if (GetTickCount - m_dwCheckRoyaltyTick) > 10000 then begin
      m_dwCheckRoyaltyTick:=GetTickCount();
      if m_Master <> nil then begin
        if (g_dwSpiritMutinyTick > GetTickCount) and (m_btSlaveExpLevel < 5) then begin
          m_dwMasterRoyaltyTick:=0;
        end;
          
        //宝宝叛变  开始
        nCheckCode:=423;
        if (GetTickCount > m_dwMasterRoyaltyTick) then begin
          for I := 0 to m_Master.m_SlaveList.Count - 1 do begin
            nCheckCode:=424;
            if m_Master.m_SlaveList.Items[i] = Self then begin
              nCheckCode:=425;
              m_Master.m_SlaveList.Delete(i);
              break;
            end;
          end;
          m_Master:=nil;
          m_WAbil.HP:=m_WAbil.HP div 10;
          nCheckCode:=426;
          RefShowName();
        end;
        //宝宝叛变 结束
        nCheckCode:=427;
        if m_dwMasterTick <> 0 then begin
          if (GetTickCount -  m_dwMasterTick) > 12 * 60 * 60 * 1000 then begin
            m_WAbil.HP:=0;
          end;
        end;
      end; //004C81DB
    end;
    nCheckCode:=43;
    if (GetTickCount -  m_dwVerifyTick) > 30 * 1000 then begin
      m_dwVerifyTick:=GetTickCount();
      // 清组队已死亡成员
      if (m_GroupOwner <> nil) then begin
        if m_GroupOwner.m_boDeath or m_GroupOwner.m_boGhost then begin
          m_GroupOwner:=nil;
        end;
      end;
      nCheckCode:=44;
      if m_GroupOwner = Self then begin
        for I := m_GroupMembers.Count - 1 downto 0 do begin
          BaseObject:=TBaseObject(m_GroupMembers.Objects[i]);
          if BaseObject.m_boDeath or (BaseObject.m_boGhost) then
            m_GroupMembers.Delete(i);
        end;
      end;
      // 清组队已死亡成员 结束
      nCheckCode:=45;
      // 检查交易双方 状态
      if (m_DealCreat <> nil) and (m_DealCreat.m_boGhost) then
        m_DealCreat:=nil;
      nCheckCode:=46;  
      if not m_boDenyRefStatus then
        m_PEnvir.VerifyMapTime(m_nCurrX,m_nCurrY,Self);  //刷新在地图上位置的时间
    end;
  except
    on e: Exception do begin
      MainOutMessage(format(sExceptionMsg4,[nCheckCode]));
      MainOutMessage(E.Message);
    end;
  end;

  //SetProcessName('TBaseObject.Run 5');
  try
    boChg:=False;
    boNeedRecalc:=False;
    //004C832E
//    for i:=0 to MAX_STATUS_ATTRIBUTE - 1 do begin
    for i:=Low(m_dwStatusArrTick) to High(m_dwStatusArrTick) do begin  //004C832E
      if (m_wStatusTimeArr[i] > 0) and (m_wStatusTimeArr[i] < 60000) then begin
        if (GetTickCount() - m_dwStatusArrTick[i]) > 1000 then begin
          Dec(m_wStatusTimeArr[i]);
          Inc(m_dwStatusArrTick[i],1000);
          if (m_wStatusTimeArr[i] = 0) then begin
            boChg:=True;
            case i of
              STATE_TRANSPARENT: begin
                m_boHideMode:=False;
              end;
              STATE_DEFENCEUP: begin
                boNeedRecalc:=True;
                SysMsg('Defense strength is back to normal.',c_Green,t_Hint);
              end;
              STATE_MAGDEFENCEUP :begin
                boNeedRecalc:=True;
                SysMsg('Magical defense strength is back to normal.',c_Green,t_Hint);
              end;
              STATE_BUBBLEDEFENCEUP :begin
                m_boAbilMagBubbleDefence:=False;
              end;
            end;
          end;
        end;
      end;
    end;
    //004C8409
    for i:=Low(m_wStatusArrValue) to High(m_wStatusArrValue) do begin
      if m_wStatusArrValue{218}[i] > 0 then begin
        if GetTickCount() > m_dwStatusArrTimeOutTick{220}[i] then begin
          m_wStatusArrValue[i]:=0;
          boNeedRecalc:=True;
          case i of
            0: begin
              SysMsg('Removed temporarily increased destructive power.',c_Green,t_Hint);
            end;
            1: begin
              SysMsg('Removed temporarily increased magic power.',c_Green,t_Hint);
            end;
            2: begin
              SysMsg('Removed temporarily increased zen power.',c_Green,t_Hint);
            end;
            3: begin
              SysMsg('Removed temporarily increased hitting speed.',c_Green,t_Hint);
            end;
            4: begin
              SysMsg('Removed temporarily increased HP.',c_Green,t_Hint);
            end;
            5: begin
              SysMsg('Removed temporarily increased MP.',c_Green,t_Hint);
            end;
            6: begin  //New
              SysMsg('Removed temporarily decreased attack ability.',c_Green,t_Hint);
            end;
          end;
        end;
      end;
    end;

    //004C84F5
    if boChg then begin
      m_nCharStatus:=GetCharStatus();
      StatusChanged();
    end;
    //004C8511
    if boNeedRecalc then begin
      RecalcAbilitys();
      SendMsg(Self, RM_ABILITY, 0, 0, 0, 0, '');
    end;
  except
    MainOutMessage(sExceptionMsg5);
  end;

  //SetProcessName('TBaseObject.Run 6');
  //004C855A
  try
    if (GetTickCount - m_dwPoisoningTick) > g_Config.dwPosionDecHealthTime{2500} then begin
      m_dwPoisoningTick:=GetTickCount();
      if m_wStatusTimeArr[POISON_DECHEALTH{0 0x60}] > 0 then begin
        if m_boAnimal then Dec(m_nMeatQuality,1000);
        DamageHealth(m_btGreenPoisoningPoint + 1);
        m_nHealthTick:=0;
        m_nSpellTick:=0;
        HealthSpellChanged();
      end;
    end;
  except
    MainOutMessage(sExceptionMsg6);
  end;
  {
  if boOpenHealth then begin
    if (GetTickCount() - dwOpenHealthStart) > dwOpenHealthTime then begin
      BreakOpenHealth();
    end;
  end;
  }
  g_nBaseObjTimeMin:=GetTickCount - dwRunTick;
  if g_nBaseObjTimeMax < g_nBaseObjTimeMin then g_nBaseObjTimeMax:=g_nBaseObjTimeMin;


end;


function TBaseObject.GetFrontPosition(var nX:Integer;var nY:Integer):Boolean;//004B2790
var
  Envir:TEnvirnoment;
begin
  Envir:=m_PEnvir;
  nX:=m_nCurrX;
  nY:=m_nCurrY;
  case m_btDirection of    //
    DR_UP: begin
      if nY > 0 then Dec(nY);
    end;
    DR_UPRIGHT: begin
      if (nX < (Envir.Header.wWidth -1)) and (nY > 0) then begin
       Inc(nX);
       Dec(nY);
      end;
    end;
    DR_RIGHT: begin
     if nX < (Envir.Header.wWidth -1) then Inc(nX);
    end;
    DR_DOWNRIGHT: begin
      if (nX < (Envir.Header.wWidth -1)) and (nY < (Envir.Header.wHeight -1)) then begin
       Inc(nX);
       Inc(nY);
      end;
    end;
    DR_DOWN: begin
     if nY < (Envir.Header.wHeight -1) then Inc(nY);
    end;
    DR_DOWNLEFT: begin
      if (nX > 0) and (nY < (Envir.Header.wHeight -1)) then begin
       Dec(nX);
       Inc(nY);
      end;
    end;
    DR_LEFT: begin
      if nX > 0 then Dec(nX);
    end;
    DR_UPLEFT: begin
      if (nX > 0) and (nY > 0) then begin
        Dec(nX);
        Dec(nY);
      end;
    end;
  end;
  Result:=True;
end;

procedure TBaseObject.SpaceMove(sMap:String;nX,nY:Integer;nInt:Integer);//004BCD1C
  function GetRandXY(Envir:TEnvirnoment;var nX:Integer;var nY:Integer):Boolean;
  var
    n14,n18,n1C:Integer;
  begin
    Result:=False;
    if Envir.Header.wWidth < 80 then n18:=3
    else n18:=10;
    if Envir.Header.wHeight < 150 then begin
      if Envir.Header.wHeight < 50 then n1C:=2
      else n1C:=15;
    end else n1C:=50;
    n14:=0;
    while (True) do begin
      if Envir.CanWalk(nX,nY,True) then begin
        Result:=True;
        break;
      end;
      if nX < (Envir.Header.wWidth - n1C -1) then Inc(nX,n18)
      else begin
        nX:=Random(Envir.Header.wWidth);
        if nY < (Envir.Header.wHeight - n1C -1) then Inc(nY,n18)
        else nY:=Random(Envir.Header.wHeight);
      end;
      Inc(n14);
      if n14 >= 201 then break;             
    end;
  end;
var
  I: Integer;
  Envir,OldEnvir:TEnvirnoment;
  nOldX,nOldY:Integer;
  bo21:Boolean;
  PlayObject:TPlayObject;
begin
  Envir:=g_MapManager.FindMap(sMap);
  if Envir <> nil then begin
    if nServerIndex = Envir.nServerIndex then begin
      OldEnvir := m_PEnvir;
      nOldX    := m_nCurrX;
      nOldY    := m_nCurrY;
      bo21     := False;

      m_PEnvir.DeleteFromMap(m_nCurrX,m_nCurrY,OS_MOVINGOBJECT,Self);
      m_VisibleHumanList.Clear;
      for I := 0 to m_VisibleItems.Count - 1 do begin
        Dispose(pTVisibleMapItem(m_VisibleItems.Items[i]));
      end;
      m_VisibleItems.Clear;
      for I := 0 to m_VisibleActors.Count - 1 do begin
        Dispose(pTVisibleBaseObject(m_VisibleActors.Items[i]));
      end;
      m_VisibleActors.Clear;
      m_VisibleEvents.Clear; //01/21 移动时清除列表
      m_PEnvir:=Envir;
      m_sMapName:=Envir.sMapName;
      m_nCurrX:=nX;
      m_nCurrY:=nY;
      if GetRandXY(m_PEnvir,m_nCurrX,m_nCurrY) then begin
        m_PEnvir.AddToMap(m_nCurrX,m_nCurrY,OS_MOVINGOBJECT,Self);
        SendMsg(Self,RM_CLEAROBJECTS,0,0,0,0,'');
        SendMsg(Self,RM_CHANGEMAP,0,0,0,0,m_sMapName);
        if nInt = 1 then begin
          SendRefMsg(RM_SPACEMOVE_SHOW2,m_btDirection,m_nCurrX,m_nCurrY,0,'');
        end else SendRefMsg(RM_SPACEMOVE_SHOW,m_btDirection,m_nCurrX,m_nCurrY,0,'');
        m_dwMapMoveTick:=GetTickCount();
        m_bo316:=True;
        bo21:=True;
      end; //004BCFA9
      if not bo21 then begin
        m_PEnvir := OldEnvir;
        m_nCurrX := nOldX;
        m_nCurrY := nOldY;
        m_PEnvir.AddToMap(m_nCurrX,m_nCurrY,OS_MOVINGOBJECT,Self);
      end;
    end else begin //004BCFF6
      if GetRandXY(Envir,nX,nY) then begin
        if m_btRaceServer = RC_PLAYOBJECT then begin
          DisappearA();
          m_bo316:=True;
          PlayObject:=TPlayObject(Self);
          PlayObject.m_sSwitchMapName:=Envir.sMapName;
          PlayObject.m_nSwitchMapX:=nX;
          PlayObject.m_nSwitchMapY:=nY;
          PlayObject.m_boSwitchData:=True;
          PlayObject.m_nServerIndex:=Envir.nServerIndex;
          PlayObject.m_boEmergencyClose:=True;
          PlayObject.m_boReconnection:=True;
        end else KickException();
      end;
    end;
  end;
end;

procedure TBaseObject.RefShowName();//004BF0C4
begin
  SendRefMsg(RM_USERNAME,0,0,0,0,GetShowName);
end;

function TBaseObject.Operate(ProcessMsg:pTProcessMessage):Boolean;//004C716C
var
  nDamage          :Integer;
  nTargetX         :Integer;
  nTargetY         :Integer;
  nPower           :Integer;
  nRage            :Integer;
  TargetBaseObject :TBaseObject;
ResourceString
  sExceptionMsg = '[Exception] TBaseObject::Operate ';
begin
  Result:=False;
try
  case ProcessMsg.wIdent of
    RM_MAGSTRUCK,
    RM_MAGSTRUCK_MINE: begin //10025
      if (ProcessMsg.wIdent = RM_MAGSTRUCK) and
         (m_btRaceServer >= RC_ANIMAL) and
         (not bo2BF) and (m_Abil.Level < 50) then begin
        m_dwWalkTick:=m_dwWalkTick + 800 + LongWord(Random(1000));
      end;
      nDamage:=GetMagStruckDamage(nil,ProcessMsg.nParam1);
      if nDamage > 0 then begin
        StruckDamage(nDamage);
        HealthSpellChanged();
        SendRefMsg(RM_STRUCK_MAG,nDamage,m_WAbil.HP,m_WAbil.MaxHP,Integer(ProcessMsg.BaseObject),'');
        if m_btRaceServer <> RC_PLAYOBJECT then begin
          if m_boAnimal then Dec(m_nMeatQuality,nDamage * 1000);
          SendMsg(Self,RM_STRUCK,nDamage,m_WAbil.HP,m_WAbil.MaxHP,Integer(ProcessMsg.BaseObject){AttackBaseObject},'');
        end;          
      end;
      if m_boFastParalysis then begin
        m_wStatusTimeArr[POISON_STONE]:=1;
        m_boFastParalysis:=False;
      end;
    end;
    RM_MAGHEALING: begin //10026
      if (m_nIncHealing + ProcessMsg.nParam1) < 300 then begin
        if m_btRaceServer = RC_PLAYOBJECT then begin
          Inc(m_nIncHealing,ProcessMsg.nParam1);
          m_nPerHealing:=5;
        end else begin
          Inc(m_nIncHealing,ProcessMsg.nParam1);
          m_nPerHealing:=5;
        end;
      end else m_nIncHealing:=300;
    end;
    RM_10101: begin //10101
      SendRefMsg(Integer(ProcessMsg.BaseObject),
                 ProcessMsg.wParam{nPower},
                 ProcessMsg.nParam1{HP},
                 ProcessMsg.nParam2{MaxHP},
                 ProcessMsg.nParam3{AttackSrc},
                 ProcessMsg.sMsg);
      if (Integer(ProcessMsg.BaseObject) = RM_STRUCK) and (m_btRaceServer <> RC_PLAYOBJECT) then begin
        SendMsg(Self,Integer(ProcessMsg.BaseObject),
                ProcessMsg.wParam,
                ProcessMsg.nParam1,
                ProcessMsg.nParam2,
                ProcessMsg.nParam3{AttackBaseObject},
                ProcessMsg.sMsg);
      end;
      if m_boFastParalysis then begin
        m_wStatusTimeArr[POISON_STONE]:=1;
        m_boFastParalysis:=False;
      end;             
    end;
    RM_DELAYMAGIC: begin //10154 004C726E
      nPower:=ProcessMsg.wParam;
      nTargetX:=LoWord(ProcessMsg.nParam1);
      nTargetY:=HiWord(ProcessMsg.nParam1);
      nRage:=ProcessMsg.nParam2;
      TargetBaseObject:=TBaseObject(ProcessMsg.nParam3);
      if (TargetBaseObject <> nil) and
         (TargetBaseObject.GetMagStruckDamage(Self,nPower) > 0) then begin

        SetTargetCreat{0FFF2}(TargetBaseObject);
        if TargetBaseObject.m_btRaceServer >= RC_ANIMAL then
          nPower:=ROUND(nPower / 1.2);
        if (abs(nTargetX - TargetBaseObject.m_nCurrX) <= nRage) and (abs(nTargetY - TargetBaseObject.m_nCurrY) <= nRage )then
          TargetBaseObject.SendMsg(Self,RM_MAGSTRUCK,0,nPower,0,0,'');
      end;         
    end;
    RM_10155: begin //10155
      MapRandomMove(ProcessMsg.sMsg,ProcessMsg.wParam);
    end;
    RM_DELAYPUSHED: begin
      nPower:=ProcessMsg.wParam;
      nTargetX:=LoWord(ProcessMsg.nParam1);
      nTargetY:=HiWord(ProcessMsg.nParam1);
      nRage:=ProcessMsg.nParam2;
      TargetBaseObject:=TBaseObject(ProcessMsg.nParam3);
      if (TargetBaseObject <> nil) then begin
        TargetBaseObject.CharPushed (nPower, nRage);
      end;
    end;
    RM_POISON: begin //10300 004C74AB
      TargetBaseObject:=TBaseObject(ProcessMsg.nParam2);
      if TargetBaseObject <> nil then begin
        if IsProperTarget{FFF4}(TargetBaseObject) then begin
          SetTargetCreat{0FFF2}(TargetBaseObject);
          if (m_btRaceServer = RC_PLAYOBJECT) and (TargetBaseObject.m_btRaceServer = RC_PLAYOBJECT) then begin
            SetPKFlag(TargetBaseObject);
          end;
          SetLastHiter(TargetBaseObject);


        end;
        MakePosion(ProcessMsg.wParam{中毒类型},ProcessMsg.nParam1{nPower},ProcessMsg.nParam3{});
      end else MakePosion(ProcessMsg.wParam{中毒类型},ProcessMsg.nParam1{nPower},ProcessMsg.nParam3);
        
    end;
    RM_TRANSPARENT: begin //10308
      MagicManager.MagMakePrivateTransparent(Self,ProcessMsg.nParam1);
    end;
    RM_DOOPENHEALTH: begin //10412
      MakeOpenHealth();
    end;
{$IF CHECKNEWMSG = 1}
    else begin
      MainOutMessage(format('人物: %s 消息: Ident %d Param %d P1 %d P2 %d P3 %d Msg %s',
                            [m_sCharName,
                            ProcessMsg.wIdent,
                            ProcessMsg.wParam,
                            ProcessMsg.nParam1,
                            ProcessMsg.nParam2,
                            ProcessMsg.nParam3,
                            ProcessMsg.sMsg]));
    end;
{$IFEND}    
  end;
except
  on e: Exception do begin
    MainOutMessage(sExceptionMsg);
    MainOutMessage(E.Message);
  end;
end;
end;



function TBaseObject.MakeSlave(sMonName:String;nMakeLevel,nExpLevel,nMaxMob:Integer;dwRoyaltySec:LongWord):TBaseObject;//004C37C0
var
  nX,nY:Integer;
  MonObj:TBaseObject;
begin
  Result:=nil;
  if m_SlaveList.Count < nMaxMob then begin
    GetFrontPosition(nX,nY);  // sub_004B2790
    MonObj:=UserEngine.RegenMonsterByName(m_PEnvir.sMapName,nX,nY,sMonName);
    if MonObj <> nil then begin
      MonObj.m_Master:=Self;
      MonObj.m_dwMasterRoyaltyTick := GetTickCount + dwRoyaltySec * 1000;
      MonObj.m_btSlaveMakeLevel := nMakeLevel;
      MonObj.m_btSlaveExpLevel := nExpLevel;
      MonObj.RecalcAbilitys;
      if MonObj.m_WAbil.HP < MonObj.m_WAbil.MaxHP then begin
        MonObj.m_WAbil.HP := MonObj.m_WAbil.HP + (MonObj.m_WAbil.MaxHP - MonObj.m_WAbil.HP) div 2;
      end;
      MonObj.RefNameColor;
      m_SlaveList.Add (MonObj);
      Result := MonObj;
    end;
  end;
end;

//004C4DB8
function TBaseObject.AddItemToBag(UserItem:PTUserItem):Boolean;
begin
  Result:=False;
  if m_ItemList.Count < MAXBAGITEM then begin
    m_ItemList.Add(UserItem);
    WeightChanged();
    Result:=True;
  end;
end;


function TBaseObject.GetQuestFalgStatus(nFlag: integer): Integer;//004C1490
var
  n10,n14:Integer;
begin
  Result:=0;
  Dec(nFlag);
  if nFlag < 0 then exit;
  n10:=nFlag div 8;
  n14:=(nFlag mod 8);
  if (n10 - SizeOf(TQuestFlag)) < 0 then begin
    if ((128 shr n14) and (m_QuestFlag[n10])) <> 0 then Result:=1
    else Result:=0;
  end;

  //note: swapped the results around...
end;



procedure TBaseObject.SetQuestFlagStatus(nFlag:Integer;nValue:Integer);//004C1508
var
  n10,n14:Integer;
  bt15:Byte;
begin
  Dec(nFlag);
  if nFlag < 0 then exit;
  n10:=nFlag div 8;
  n14:=(nFlag mod 8);
  if (n10 - SizeOf(TQuestFlag)) < 0 then begin
    bt15:=m_QuestFlag[n10];
    if nValue = 0 then begin
      m_QuestFlag[n10]:=(not (128 shr n14)) and (bt15);
    end else begin
      m_QuestFlag[n10]:=(128 shr n14) or (bt15);
    end;
  end;
end;


function TBaseObject.GetQuestUnitOpenStatus(nFlag: integer): Integer;//004C159C
var
  n10,n14:Integer;
begin
  Result:=0;
  Dec(nFlag);
  if nFlag < 0 then exit;
  n10:=nFlag div 8;
  n14:=(nFlag mod 8);
  if (n10 - SizeOf(TQuestUnit)) < 0 then begin
    if ((128 shr n14) and (m_QuestUnitOpen[n10])) <> 0 then Result:=1
    else Result:=0;
  end;
end;

procedure TBaseObject.SetQuestUnitOpenStatus(nFlag:Integer;nValue:Integer);//004C1614
var
  n10,n14:Integer;
  bt15:Byte;
begin
  Dec(nFlag);
  if nFlag < 0 then exit;
  n10:=nFlag div 8;
  n14:=(nFlag mod 8);
  if (n10 - SizeOf(TQuestUnit)) < 0 then begin
    bt15:=m_QuestUnitOpen[n10];
    if nValue = 0 then begin
      m_QuestUnitOpen[n10]:=(not (128 shr n14)) and (bt15);
    end else begin
      m_QuestUnitOpen[n10]:=(128 shr n14) or (bt15);
    end;
  end;
end;

function TBaseObject.GetQuestUnitStatus(nFlag: integer): Integer;//004C16A8
var
  n10,n14:Integer;
begin
  Result:=0;
  Dec(nFlag);
  if nFlag < 0 then exit;
  n10:=nFlag div 8;
  n14:=(nFlag mod 8);
  if (n10 - SizeOf(TQuestUnit)) < 0 then begin
    if ((128 shr n14) and (m_QuestUnit[n10])) <> 0 then Result:=1
    else Result:=0;
  end;
end;

procedure TBaseObject.SetQuestUnitStatus(nFlag:Integer;nValue:Integer);//004C1720
var
  n10,n14:Integer;
  bt15:Byte;
begin
  Dec(nFlag);
  if nFlag < 0 then exit;
  n10:=nFlag div 8;
  n14:=(nFlag mod 8);
  if (n10 - SizeOf(TQuestUnit)) < 0 then begin
    bt15:=m_QuestUnit[n10];
    if nValue = 0 then begin
      m_QuestUnit[n10]:=(not (128 shr n14)) and (bt15);
    end else begin
      m_QuestUnit[n10]:=(128 shr n14) or (bt15);
    end;
  end;
end;

//004C368C
function TBaseObject.GetPoseCreate: TBaseObject;
var
  nX,nY:Integer;
begin
  Result:=nil;
  if GetFrontPosition(nX,nY) then begin
    Result:=m_PEnvir.GetMovingObject(nX,nY,True);
  end;    
end;


function TBaseObject.GetAttackDir(BaseObject: TBaseObject; var btDir: Byte): Boolean; //004C3CA0
begin
  Result:=False;
  if (m_nCurrX -1 <= BaseObject.m_nCurrX) and
     (m_nCurrX +1 >= BaseObject.m_nCurrX) and
     (m_nCurrY -1 <= BaseObject.m_nCurrY) and
     (m_nCurrY +1 >= BaseObject.m_nCurrY) and
     ((m_nCurrX <> BaseObject.m_nCurrX) or
     (m_nCurrY <> BaseObject.m_nCurrY)) then begin
    Result:=True;
    if ((m_nCurrX -1) = BaseObject.m_nCurrX) and (m_nCurrY = BaseObject.m_nCurrY) then begin
      btDir:=DR_LEFT;
      exit;
    end;
    if ((m_nCurrX +1) = BaseObject.m_nCurrX) and (m_nCurrY = BaseObject.m_nCurrY) then begin
      btDir:=DR_RIGHT;
      exit;
    end;
    if (m_nCurrX = BaseObject.m_nCurrX) and ((m_nCurrY - 1) = BaseObject.m_nCurrY) then begin
      btDir:=DR_UP;
      exit;
    end;
    if (m_nCurrX = BaseObject.m_nCurrX) and ((m_nCurrY + 1) = BaseObject.m_nCurrY) then begin
      btDir:=DR_DOWN;
      exit;
    end;
    if ((m_nCurrX -1) = BaseObject.m_nCurrX) and ((m_nCurrY - 1) = BaseObject.m_nCurrY) then begin
      btDir:=DR_UPLEFT;
      exit;
    end;
    if ((m_nCurrX +1) = BaseObject.m_nCurrX) and ((m_nCurrY - 1) = BaseObject.m_nCurrY) then begin
      btDir:=DR_UPRIGHT;
      exit;
    end;
    if ((m_nCurrX -1) = BaseObject.m_nCurrX) and ((m_nCurrY + 1) = BaseObject.m_nCurrY) then begin
      btDir:=DR_DOWNLEFT;
      exit;
    end;
    if ((m_nCurrX +1) = BaseObject.m_nCurrX) and ((m_nCurrY + 1) = BaseObject.m_nCurrY) then begin
      btDir:=DR_DOWNRIGHT;
      exit;
    end;
    btDir:=0;
  end;
end;

function TBaseObject.TargetInSpitRange(BaseObject: TBaseObject;var btDir: Byte): Boolean; //004C3E68
var
  nX,nY:Integer;
begin
  Result:=False;
  if (abs(BaseObject.m_nCurrX - m_nCurrX) <= 2) and (abs(BaseObject.m_nCurrY - m_nCurrY) <= 2) then begin
    nX:=BaseObject.m_nCurrX - m_nCurrX;
    nY:=BaseObject.m_nCurrY - m_nCurrY;
    if (abs(nX) <= 1) and (abs(nY) <= 1) then begin
      GetAttackDir(BaseObject,btDir);
      Result:=True;
      exit;
    end;
    Inc(nX,2);
    Inc(nY,2);
    if ((nX >= 0) and (nX <= 4)) and ((nY >= 0) and (nY <= 4)) then begin
      btDir:=GetNextDirection(m_nCurrX,m_nCurrY,BaseObject.m_nCurrX,BaseObject.m_nCurrY);
      if g_Config.SpitMap[btDir,nY,nX] = 1 then
        Result:=True;
    end;

  end;

end;

//004BF6F0
function TBaseObject.RecalcBagWeight:Integer;
var
  I: Integer;
  UserItem:PTUserItem;
  StdItem:TItem;
begin
  Result:=0;
  for I := 0 to m_ItemList.Count - 1 do begin
    UserItem:=m_ItemList.Items[i];
    StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
    if StdItem <> nil then begin
      Inc(Result,StdItem.Weight);
    end;
  end;
end;

//004BFD50
procedure TBaseObject.RecalcHitSpeed;
var
  I: Integer;
  UserMagic:pTUserMagic;
  BonusTick:pTNakedAbility;
begin
  BonusTick:=nil;
  case m_btJob of
    jWarr: BonusTick:=@g_Config.BonusAbilofWarr;
    jWizard: BonusTick:=@g_Config.BonusAbilofWizard;
    jTaos: BonusTick:=@g_Config.BonusAbilofTaos;
  end;
  m_btHitPoint:=DEFHIT + m_BonusAbil.Hit div BonusTick.Hit;

  case m_btJob of
    jTaos: m_btSpeedPoint := DEFSPEED + m_BonusAbil.Speed div BonusTick.Speed + 3;  //档荤绰 扁夯 刮酶捞 臭促.
    else m_btSpeedPoint := DEFSPEED + m_BonusAbil.Speed div BonusTick.Speed;
  end;


  m_nHitPlus:=0;
  m_nHitDouble:=0;
  
  m_MagicOneSwordSkill  := nil;
  m_MagicPowerHitSkill  := nil;
  m_MagicErgumSkill     := nil;
  m_MagicBanwolSkill    := nil;
  m_MagicRedBanwolSkill := nil;
  m_MagicFireSwordSkill := nil;
  m_MagicCrsSkill       := nil;
  m_Magic41Skill        := nil;
  m_MagicTwnHitSkill    := nil;
  m_Magic43Skill        := nil;
  for I := 0 to m_MagicList.Count - 1 do begin
    UserMagic:=m_MagicList.Items[i];
    case UserMagic.wMagIdx of
      SKILL_ONESWORD: begin  //内功心法
        m_MagicOneSwordSkill:=UserMagic;
        if UserMagic.btLevel > 0 then begin
          m_btHitPoint:=m_btHitPoint + ROUND(9/3* UserMagic.btLevel);
        end;
      end;
      SKILL_YEDO: begin //攻杀剑法
        m_MagicPowerHitSkill:=UserMagic;
        if UserMagic.btLevel > 0 then begin
          m_btHitPoint:=m_btHitPoint + ROUND(3/3* UserMagic.btLevel);
        end;
        m_nHitPlus:=DEFHIT + UserMagic.btLevel;
        m_btAttackSkillCount:=7 - UserMagic.btLevel;
        m_btAttackSkillPointCount:=Random(m_btAttackSkillCount);
      end;
      SKILL_ERGUM: begin //刺杀剑法
        m_MagicErgumSkill:=UserMagic;
      end;
      SKILL_BANWOL: begin //半月弯刀
        m_MagicBanwolSkill:=UserMagic;
      end;
      SKILL_REDBANWOL: begin
        m_MagicRedBanwolSkill:=UserMagic;
      end;
      SKILL_FIRESWORD: begin //烈火剑法
        m_MagicFireSwordSkill:=UserMagic;
        m_nHitDouble:= 4 + UserMagic.btLevel * 4;
      end;
      SKILL_ILKWANG: begin //基本剑法
        m_MagicOneSwordSkill:=UserMagic;
        if UserMagic.btLevel > 0 then begin
          m_btHitPoint:=m_btHitPoint + ROUND(8/3* UserMagic.btLevel);
        end;
      end;
      SKILL_CROSSMOON: begin
        m_MagicCrsSkill:=UserMagic;
      end;
      41: begin
        m_Magic41Skill:=UserMagic;
      end;
      SKILL_TWINBLADE: begin
        m_MagicTwnHitSkill:=UserMagic;
      end;
      43: begin
        m_Magic43Skill:=UserMagic;
      end;
    end;
  end;
end;


//004BFFD0
procedure TBaseObject.AddItemSkill(nIndex: Integer);
var
  Magic      :pTMagic;
  UserMagic  :pTUserMagic;
  PlayObject :TPlayObject;
begin
  Magic:=nil;
  case nIndex of
    1: Magic:=UserEngine.FindMagic(g_Config.sFireBallSkill);
    2: Magic:=UserEngine.FindMagic(g_Config.sHealSkill);
  end;
  if Magic <> nil then begin
    if not IsTrainingSkill(Magic.wMagicId) then begin
      New(UserMagic);
      UserMagic.MagicInfo  := Magic;
      UserMagic.wMagIdx    := Magic.wMagicId;
      UserMagic.btKey      := 0;
      UserMagic.btLevel    := 1;
      UserMagic.nTranPoint := 0;
      m_MagicList.Add(UserMagic);
      if m_btRaceServer = RC_PLAYOBJECT then begin
        {
        PlayObject:=TPlayObject(Self);
        PlayObject.SendAddMagic(UserMagic);
        }
        TPlayObject(Self).SendAddMagic(UserMagic);
      end;
    end;
  end;
end;

function TBaseObject.AddToMap: Boolean; //004BA5E4
var
  Point:Pointer;
begin
  Point:=m_PEnvir.AddToMap(m_nCurrX,m_nCurrY,OS_MOVINGOBJECT,Self);
  if Point <> nil then Result:=True
  else Result:=False;
  if not m_boFixedHideMode then
    SendRefMsg(RM_TURN,m_btDirection,m_nCurrX,m_nCurrY,0,'');
end;

procedure TBaseObject.AttackDir(TargeTBaseObject: TBaseObject; wHitMode: Word;
  nDir: Integer);//004C2C50
  function GetMagicSpell(UserMagic:pTUserMagic):Integer;
  begin
    Result:=ROUND(UserMagic.MagicInfo.wSpell / (UserMagic.MagicInfo.btTrainLv + 1) * (UserMagic.btLevel + 1));
  end;
  //武器升级设置
  procedure CheckWeaponUpgradeStatus(UserItem:pTUserItem); //004C27C0
  begin
    //if (UserItem.btValue[0] + UserItem.btValue[1] + UserItem.btValue[2]) < 20 then begin
    if (UserItem.btValue[0] + UserItem.btValue[1] + UserItem.btValue[2]) < g_Config.nUpgradeWeaponMaxPoint then begin
      case UserItem.btValue[10] of
        1: UserItem.wIndex:=0;
        10..13: UserItem.btValue[0]:=UserItem.btValue[0] + UserItem.btValue[10] - 9;
        20..23: UserItem.btValue[1]:=UserItem.btValue[1] + UserItem.btValue[10] - 19;
        30..33: UserItem.btValue[2]:=UserItem.btValue[2] + UserItem.btValue[10] - 29;
      end;
    end else UserItem.wIndex:=0;
    UserItem.btValue[10]:=0;
  end;
  procedure CheckWeaponUpgrade(); //004C2854
  var
    UseItems:TUserItem;
    PlayObject:TPlayObject;
    StdItem:TItem;
  begin
    if m_UseItems[U_WEAPON].btValue[10] > 0 then begin
      UseItems:=m_UseItems[U_WEAPON];
      CheckWeaponUpgradeStatus(@m_UseItems[U_WEAPON]);
      if m_UseItems[U_WEAPON].wIndex = 0 then begin
        SysMsg(g_sTheWeaponBroke,c_Red,t_Hint);
        PlayObject:=TPlayObject(Self);
        PlayObject.SendDelItems(@UseItems);
        //PlayObject.StatusChanged;
        SendRefMsg(RM_BREAKWEAPON,0,0,0,0,'');
        StdItem:=UserEngine.GetStdItem(UseItems.wIndex);
        //004C29E0
        if StdItem.NeedIdentify = 1 then
          AddGameDataLog('21' +  #9 +
                     m_sMapName + #9 +
                     IntToStr(m_nCurrX) + #9 +
                     IntToStr(m_nCurrY) + #9 +
                     m_sCharName + #9 +
                     //UserEngine.GetStdItemName(UseItems.wIndex) + #9 +
                     StdItem.Name + #9 +
                     IntToStr(UseItems.MakeIndex) + #9 +
                     '1' + #9 +
                     '0');
        FeatureChanged();
      end else begin
        SysMsg(sTheWeaponRefineSuccessfull,c_Red,t_Hint);
        PlayObject:=TPlayObject(Self);
        PlayObject.SendUpdateItem(@m_UseItems[U_WEAPON]);
        StdItem:=UserEngine.GetStdItem(UseItems.wIndex);
        //004C2B14
        if StdItem.NeedIdentify = 1 then
          AddGameDataLog('20' +  #9 +
                     m_sMapName + #9 +
                     IntToStr(m_nCurrX) + #9 +
                     IntToStr(m_nCurrY) + #9 +
                     m_sCharName + #9 +
                     //UserEngine.GetStdItemName(UseItems.wIndex) + #9 +
                     StdItem.Name + #9 +
                     IntToStr(UseItems.MakeIndex) + #9 +
                     '1' + #9 +
                     '0');
        RecalcAbilitys();
        SendMsg(Self,RM_ABILITY,0,0,0,0,'');
        SendMsg(Self,RM_SUBABILITY,0,0,0,0,'');
      end;
    end;
  end;
var
  AttackTarget :TBaseObject;
  boPowerHit   :Boolean;
  boFireHit    :Boolean;
  boCrsHit     :Boolean;
  bo41         :Boolean;
  boTwinHit    :Boolean;
  bo43         :Boolean;
  wIdent       :Word;
  nCheckCode   :Integer;
ResourceString
  sExceptionMsg = '[Exception] TBaseObject::AttackDir Code: %d';
begin //004C2C50
  nCheckCode:=0;
try
  if (wHitMode = 5) and (m_MagicBanwolSkill <> nil) then begin //半月
    if m_WAbil.MP > 0 then begin
      DamageSpell(m_MagicBanwolSkill.MagicInfo.btDefSpell + GetMagicSpell(m_MagicBanwolSkill));
      HealthSpellChanged();
    end else wHitMode:=RM_HIT;
  end;
  if (wHitMode = 12) and (m_MagicRedBanwolSkill <> nil) then begin
    if m_WAbil.MP > 0 then begin
      DamageSpell(m_MagicRedBanwolSkill.MagicInfo.btDefSpell + GetMagicSpell(m_MagicRedBanwolSkill));
      HealthSpellChanged();
    end else wHitMode:=RM_HIT;
  end;
  if (wHitMode = 8) and (m_MagicCrsSkill <> nil) then begin
    if m_WAbil.MP > 0 then begin
      DamageSpell(m_MagicCrsSkill.MagicInfo.btDefSpell + GetMagicSpell(m_MagicCrsSkill));
      HealthSpellChanged();
    end else wHitMode:=RM_HIT;
  end;

  nCheckCode:=4;
  m_btDirection:=nDir;
  if TargeTBaseObject = nil then begin
    nCheckCode:=41;
    AttackTarget:=GetPoseCreate();
  end else AttackTarget:=TargeTBaseObject;
  if (AttackTarget <> nil) and (m_UseItems[U_WEAPON].wIndex > 0) then begin
    nCheckCode:=42;
    CheckWeaponUpgrade();
  end;
  nCheckCode:=5;
  boPowerHit:=m_boPowerHit;
  boFireHit:=m_boFireHitSkill;
  boCrsHit:=m_boCrsHitkill;
  bo41:=m_bo41kill;
  boTwinHit:=m_boTwinHitSkill;
  bo43:=m_bo43kill;
  if _Attack(wHitMode,AttackTarget) then begin
    nCheckCode:=6;
    SetTargetCreat(AttackTarget); //$FFF2
    nCheckCode:=7;
  end;
  wIdent:=RM_HIT;
  if m_btRaceServer = RC_PLAYOBJECT then begin
    case wHitMode of
      0: wIdent:=RM_HIT;
      1: wIdent:=RM_HEAVYHIT;
      2: wIdent:=RM_BIGHIT;
      3: if boPowerHit then wIdent:=RM_SPELL2;
      4: if m_MagicErgumSkill <> nil then wIdent:=RM_LONGHIT;
      5: if m_MagicBanwolSkill <> nil then wIdent:=RM_WIDEHIT;
      7: if boFireHit then wIdent:=RM_FIREHIT;
      8: if m_MagicCrsSkill <> nil then wIdent:=RM_CRSHIT;
      9: if boTwinHit then wIdent:=RM_TWINHIT;
      {10: if boTwinHit then wIdent:=RM_TWINHIT;
      11: if bo43 then wIdent:=RM_43;}
      12: if m_MagicRedBanwolSkill <> nil then wIdent:=RM_WIDEHIT;
    end;
  end;
  nCheckCode:=8;
  SendAttackMsg(wIdent,m_btDirection,m_nCurrX,m_nCurrY);
  nCheckCode:=9;
except
  on e: Exception do begin
    MainOutMessage(format(sExceptionMsg,[nCheckCode]));
    MainOutMessage(E.Message);
  end;
end;
end;

procedure TBaseObject.CheckPKStatus;//004BC83C
begin
  if m_boPKFlag and ((GetTickCount - m_dwPKTick) > g_Config.dwPKFlagTime{60 * 1000}) then begin
    m_boPKFlag:=False;
    RefNameColor();
  end;
end;

procedure TBaseObject.DamageSpell(nSpellPoint: Integer); //004BE50C
begin
  if nSpellPoint > 0 then begin
    if (m_WAbil.MP - nSpellPoint) > 0 then
      Dec(m_WAbil.MP,nSpellPoint)
    else m_WAbil.MP:=0;
  end else begin
    if (m_WAbil.MP - nSpellPoint) < m_WAbil.MaxMP then
      Dec(m_WAbil.MP,nSpellPoint)
    else m_WAbil.MP:=m_WAbil.MaxMP;
  end;    
end;

//004BF520
procedure TBaseObject.DecPKPoint(nPoint: Integer);
var
  nC:Integer;
begin
  nC:=PKLevel();
  Dec(m_nPkPoint,nPoint);
  if m_nPkPoint < 0 then m_nPkPoint:=0;
  if (PKLevel <> nC) and (nC > 0 ) and (nC <= 2)then begin
    RefNameColor();
  end;
end;

//004C01B8
procedure TBaseObject.DelItemSkill(nIndex: Integer);
  procedure DeleteSkill(sSkillName:String); //004C00B8
  var
    I: Integer;
    UserMagic:pTUserMagic;
    PlayObject:TPlayObject;
  begin
    for I := 0 to m_MagicList.Count - 1 do begin
      UserMagic:=m_MagicList.Items[i];
      if UserMagic.MagicInfo.sMagicName = sSkillName then begin
        PlayObject:=TPlayObject(Self);
        PlayObject.SendDelMagic(UserMagic);
        Dispose(UserMagic);
        m_MagicList.Delete(i);
        break;
      end;
    end;
  end;
begin
  if m_btRaceServer <> RC_PLAYOBJECT then exit;
  case nIndex of
    1: if m_btJob <> jWizard then DeleteSkill(g_Config.sFireBallSkill);
    2: if m_btJob <> jTaos then DeleteSkill(g_Config.sHealSkill)
  end;
end;

//004C39E8
procedure TBaseObject.DelMember(BaseObject: TBaseObject);
var
  I: Integer;
  PlayObject:TPlayObject;
begin
  if m_GroupOwner <> BaseObject then begin
    for I := 0 to m_GroupMembers.Count - 1 do begin
      if m_GroupMembers.Objects[i] = BaseObject then begin
        BaseObject.LeaveGroup();
        m_GroupMembers.Delete(i);
        break;
      end;
    end;
  end else begin//004C3A65
    for I := m_GroupMembers.Count - 1 downto 0  do begin
      TBaseObject(m_GroupMembers.Objects[i]).LeaveGroup;
      m_GroupMembers.Delete(i);
    end;
  end;
  PlayObject:=TPlayObject(Self);
  if not PlayObject.CancelGroup then begin
    PlayObject.SendDefMessage(SM_GROUPCANCEL,0,0,0,0,'');
  end else PlayObject.SendGroupMembers();
end;

procedure TBaseObject.DoDamageWeapon(nWeaponDamage: Integer); //004C17B4
var
  nDura,nDuraPoint:Integer;
  PlayObject:TPlayObject;
  StdItem:TItem;
begin
  if m_UseItems[U_WEAPON].wIndex <= 0 then exit;
  nDura:=m_UseItems[U_WEAPON].Dura;
  nDuraPoint:=Round(nDura / 1.03);
  Dec(nDura,nWeaponDamage);
  if nDura <= 0 then begin
    nDura:=0;
    m_UseItems[U_WEAPON].Dura:=nDura;
    if m_btRaceServer = RC_PLAYOBJECT then begin
      PlayObject:=TPlayObject(Self);
      PlayObject.SendDelItems(@m_UseItems[U_WEAPON]);
      StdItem:=UserEngine.GetStdItem(m_UseItems[U_WEAPON].wIndex);
            //004C195A
      if StdItem.NeedIdentify = 1 then
            AddGameDataLog ('3' + #9 +
                        m_sMapName + #9 +
                        IntToStr(m_nCurrX) + #9 +
                        IntToStr(m_nCurrY) + #9 +
                        m_sCharName + #9 +
                        //UserEngine.GetStdItemName(m_UseItems[U_WEAPON].wIndex) + #9 +
                        StdItem.Name + #9 +
                        IntToStr(m_UseItems[U_WEAPON].MakeIndex) + #9 +
                        BoolToIntStr(m_btRaceServer = RC_PLAYOBJECT) + #9 +
                        '0');
    end;
    m_UseItems[U_WEAPON].wIndex:=0;
    SendMsg(Self,RM_DURACHANGE,U_WEAPON,nDura,m_UseItems[U_WEAPON].DuraMax,0,'');
  end else begin //004C199D
    m_UseItems[U_WEAPON].Dura:=nDura;
  end;
  if (nDura / 1.03) <> nDuraPoint then begin
    SendMsg(Self,RM_DURACHANGE,U_WEAPON,m_UseItems[U_WEAPON].Dura,m_UseItems[U_WEAPON].DuraMax,0,'');
  end;
end;

//004BF180
{
function TBaseObject.GetCharColor(BaseObject:TBaseObject): Byte;
var
  n10:Integer;
  nCheckCode:Integer;
begin
  nCheckCode:=0;
try
  Result:=BaseObject.GetNamecolor();
  nCheckCode:=1;
  if BaseObject.m_btRaceServer = RC_PLAYOBJECT then begin
    if BaseObject.PKLevel < 2 then begin
      if BaseObject.m_boPKFlag then Result:=g_Config.btPKFlagNameColor;//$2F
      nCheckCode:=2;
      n10:=GetGuildRelation(Self,BaseObject);
      nCheckCode:=3;
      case n10 of
        1,3: Result:=g_Config.btAllyAndGuildNameColor;//$B4;
        2: Result:=g_Config.btWarGuildNameColor;//$45;
      end;
      if BaseObject.m_PEnvir.m_boFight3Zone then begin
        if m_MyGuild = BaseObject.m_MyGuild then Result:=g_Config.btAllyAndGuildNameColor//$B4
        else Result:=g_Config.btWarGuildNameColor//$45;
      end;
    end; //004BF218
    nCheckCode:=4;
    if UserCastle.m_boUnderWar and m_boInFreePKArea and BaseObject.m_boInFreePKArea then begin
      nCheckCode:=5;
      Result:=g_Config.btInFreePKAreaNameColor;//$DD;
      m_boGuildWarArea:=True;
      nCheckCode:=6;
      if (m_MyGuild = nil) then exit;        
      if UserCastle.IsMasterGuild(TGuild(m_MyGuild)) then begin
        nCheckCode:=7;
        if (m_MyGuild = BaseObject.m_MyGuild) or
           (TGuild(m_MyGuild).IsAllyGuild(TGuild(BaseObject.m_MyGuild))) then begin
          nCheckCode:=8;
          Result:=g_Config.btAllyAndGuildNameColor//$B4;
        end else begin //004BF2A8
          nCheckCode:=9;
          if UserCastle.IsAttackGuild(TGuild(BaseObject.m_MyGuild)) then begin
            nCheckCode:=10;
            Result:=g_Config.btWarGuildNameColor//$45;
          end;
        end;
      end else begin //004BF2CE
        nCheckCode:=11;
        if UserCastle.IsAttackGuild(TGuild(m_MyGuild)) then begin
          nCheckCode:=12;
          if (m_MyGuild = BaseObject.m_MyGuild) or
             (TGuild(m_MyGuild).IsAllyGuild(TGuild(BaseObject.m_MyGuild))) then begin
            nCheckCode:=13;
            Result:=g_Config.btAllyAndGuildNameColor//$B4;
          end else begin
            nCheckCode:=14;
            if UserCastle.IsMember(BaseObject) then begin
              nCheckCode:=15;
              Result:=g_Config.btWarGuildNameColor//$45;
            end;
          end;
        end; //004BF379
      end;
    end;
  end else begin //004BF339
    //if (BaseObject.m_btSlaveExpLevel - 8) < 0 then begin
    if (BaseObject.m_btSlaveExpLevel < SLAVEMAXLEVEL) then begin
      Result:=g_Config.SlaveColor[BaseObject.m_btSlaveExpLevel];
    end;
    if BaseObject.m_boCrazyMode then Result:=$F9;
    if BaseObject.m_boHolySeize then Result:=$7D;
  end;
except
  on e: Exception do begin
    MainOutMessage('[Exception] TBaseObject.GetCharColor Code: ' + IntToStr(nCheckCode));
    MainOutMessage(E.Message);
  end;
end;
end;
}
function TBaseObject.GetCharColor(BaseObject:TBaseObject): Byte;
var
  n10:Integer;
  nCheckCode:Integer;
  Castle:TUserCastle;
begin
  nCheckCode:=0;
  Result:=BaseObject.GetNamecolor();
  nCheckCode:=1;
  if BaseObject.m_btRaceServer = RC_PLAYOBJECT then begin
    if BaseObject.PKLevel < 2 then begin
      if BaseObject.m_boPKFlag then Result:=g_Config.btPKFlagNameColor;//$2F
      nCheckCode:=2;
      n10:=GetGuildRelation(Self,BaseObject);
      nCheckCode:=3;
      case n10 of
        1,3: Result:=g_Config.btAllyAndGuildNameColor;//$B4;
        2: Result:=g_Config.btWarGuildNameColor;//$45;
      end;
      if BaseObject.m_PEnvir.Flag.boFight3Zone then begin
        if m_MyGuild = BaseObject.m_MyGuild then Result:=g_Config.btAllyAndGuildNameColor//$B4
        else Result:=g_Config.btWarGuildNameColor//$45;
      end;
    end; //004BF218
    nCheckCode:=4;
    Castle:=g_CastleManager.InCastleWarArea(BaseObject);
//    if  UserCastle.m_boUnderWar and m_boInFreePKArea and BaseObject.m_boInFreePKArea then begin
    if (Castle <> nil) and Castle.m_boUnderWar and m_boInFreePKArea and BaseObject.m_boInFreePKArea then begin
      nCheckCode:=5;
      Result:=g_Config.btInFreePKAreaNameColor;//$DD;
      m_boGuildWarArea:=True;
      nCheckCode:=6;
      if (m_MyGuild = nil) then exit;        
//      if UserCastle.IsMasterGuild(TGuild(m_MyGuild)) then begin
      if Castle.IsMasterGuild(TGuild(m_MyGuild)) then begin
        nCheckCode:=7;
        if (m_MyGuild = BaseObject.m_MyGuild) or
           (TGuild(m_MyGuild).IsAllyGuild(TGuild(BaseObject.m_MyGuild))) then begin
          nCheckCode:=8;
          Result:=g_Config.btAllyAndGuildNameColor//$B4;
        end else begin //004BF2A8
          nCheckCode:=9;
          //if UserCastle.IsAttackGuild(TGuild(BaseObject.m_MyGuild)) then begin
          if Castle.IsAttackGuild(TGuild(BaseObject.m_MyGuild)) then begin
            nCheckCode:=10;
            Result:=g_Config.btWarGuildNameColor//$45;
          end;
        end;
      end else begin //004BF2CE
        nCheckCode:=11;
//        if UserCastle.IsAttackGuild(TGuild(m_MyGuild)) then begin
        if Castle.IsAttackGuild(TGuild(m_MyGuild)) then begin
          nCheckCode:=12;
          if (m_MyGuild = BaseObject.m_MyGuild) or
             (TGuild(m_MyGuild).IsAllyGuild(TGuild(BaseObject.m_MyGuild))) then begin
            nCheckCode:=13;
            Result:=g_Config.btAllyAndGuildNameColor//$B4;
          end else begin
            nCheckCode:=14;
//            if UserCastle.IsMember(BaseObject) then begin
            if Castle.IsMember(BaseObject) then begin
              nCheckCode:=15;
              Result:=g_Config.btWarGuildNameColor//$45;
            end;
          end;
        end; //004BF379
      end;
    end;
  end else begin //004BF339
    //if (BaseObject.m_btSlaveExpLevel - 8) < 0 then begin
    if (BaseObject.m_btSlaveExpLevel < SLAVEMAXLEVEL) then begin
      Result:=g_Config.SlaveColor[BaseObject.m_btSlaveExpLevel];
    end;
    if BaseObject.m_boCrazyMode then Result:=$F9;
    //if BaseObject.m_boNastyMode then Result:=$F9;
    if BaseObject.m_boHolySeize then Result:=$7D;
  end;
end;

function TBaseObject.GetLevelExp(nLevel:Integer):LongWord;//004BEDC8
begin
  if nLevel <= MAXLEVEL{51} then begin
    Result:=g_Config.dwNeedExps[nLevel]
  end else begin
    Result:=g_Config.dwNeedExps[High(g_Config.dwNeedExps)];
    //Result:=$FFFFFFFF;
  end;
end;

//004BF144
function  TBaseObject.GetNamecolor():Byte;
begin
  Result:=m_btNameColor;
  if PKLevel = 1 then Result:=g_Config.btPKLevel1NameColor;//$FB;
  if PKLevel >= 2 then Result:= g_Config.btPKLevel2NameColor;//$F9;
end;

procedure TBaseObject.HearMsg(sMsg: String);//004BB2A0
begin
  if sMsg <> '' then SendMsg(nil,RM_HEAR,0,g_Config.btHearMsgFColor,g_Config.btHearMsgBColor,0,sMsg);
end;

function TBaseObject.InSafeArea():Boolean;//004BEF8C
var
  I: Integer;
  sC:String;
  n14,n18,n1C:Integer;
  StartPoint:pTStartPoint;
begin
  g_StartPoint.Lock;
  try
    for I := 0 to g_StartPoint.Count - 1 do begin
      StartPoint:=g_StartPoint.Items[I];
      if StartPoint.Envir = m_PEnvir then begin
        if (abs(m_nCurrX - StartPoint.nX) <= 60) and (abs(m_nCurrY - StartPoint.nY) <= 60) then begin
          Result:=True;
          break;
        end;
      end;
    end;
  finally
    g_StartPoint.UnLock;
  end;
end;

procedure TBaseObject.MonsterRecalcAbilitys; //004BE934
var
  n8:Integer;
begin
  m_WAbil.DC:=MakeLong(LoWord(m_WAbil.DC),HiWord(m_Abil.DC));
  n8:=0;
  if (m_btRaceServer = MONSTER_WHITESKELETON) or
     (m_btRaceServer = MONSTER_ELFMONSTER) or
     (m_btRaceServer = MONSTER_ELFWARRIOR) then begin


    m_WAbil.DC:=MakeLong(LoWord(m_WAbil.DC),ROUND((m_btSlaveExpLevel * 0.1 + 0.3) * 3.0 * m_btSlaveExpLevel + HiWord(m_WAbil.DC)));
    n8:=n8 + ROUND((m_btSlaveExpLevel * 0.1 + 0.3) * m_Abil.MaxHP) * m_btSlaveExpLevel;
    n8:=n8 + m_Abil.MaxHP;
    if m_btSlaveExpLevel > 0 then m_WAbil.MaxHP:=n8
    else m_WAbil.MaxHP:=m_Abil.MaxHP;
  end else begin //004BEA85
    n8:=m_Abil.MaxHP;
    m_WAbil.DC:=MakeLong(LoWord(m_WAbil.DC),ROUND(m_btSlaveExpLevel * 2 + HiWord(m_WAbil.DC)));
    n8:=n8 + ROUND(m_Abil.MaxHP * 0.15) * m_btSlaveExpLevel;
    m_WAbil.MaxHP:=_MIN(ROUND(m_Abil.MaxHP + m_btSlaveExpLevel * 60),n8);
    //m_WAbil.MAC:=0; 01/20 取消此行，防止怪物升级后魔防变0
  end;
  //m_btHitPoint:=15; 01/20 取消此行，防止怪物升级后准确率变15
end;
procedure TPlayObject.ShowMapInfo(sMap,sX,sY:String);
var
  Map:TEnvirnoment;
  nX,nY:Integer;
  MapCellInfo:pTMapCellinfo;
begin
  nX:=Str_ToInt(sX,0);
  nY:=Str_ToInt(sY,0);
  if (sMap <> '') and (nX >= 0) and (nY >= 0)then begin
    Map:=g_MapManager.FindMap(sMap);
    if Map <> nil then begin
      if Map.GetMapCellInfo(nX,nY,MapCellInfo) then begin
        SysMsg('Cell Flag: ' + IntToStr(MapCellInfo.chFlag),c_Green,t_Hint);
        if MapCellInfo.ObjList <> nil then begin
          SysMsg('Cell Count: ' + IntToStr(MapCellInfo.ObjList.Count),c_Green,t_Hint);
        end;
      end else begin
        SysMsg('Failed to get cell information for map: ' + sMap ,c_Red,t_Hint);
      end;
    end;
  end else begin
    SysMsg('请按正确格式输入: ' + g_GameCommand.MAPINFO.sCmd + ' 地图号 X Y',c_Green,t_Hint);
  end;
end;



procedure TBaseObject.SendFirstMsg(BaseObject: TBaseObject; wIdent, wParam: Word;
  lParam1, lParam2, lParam3: Integer; sMsg: String); //004B84FC
var
  SendMessage:pTSendMessage;
begin
    try
      EnterCriticalSection(ProcessMsgCriticalSection);
      if not m_boGhost then begin
        New(SendMessage);
        SendMessage.wIdent         :=wIdent;
        SendMessage.wParam         :=wParam;
        SendMessage.nParam1        :=lParam1;
        SendMessage.nParam2        :=lParam2;
        SendMessage.nParam3        :=lParam3;
        SendMessage.dwDeliveryTime :=0;
        SendMessage.BaseObject       :=BaseObject;
        if sMsg <> '' then begin
          try
            GetMem(SendMessage.Buff,Length(sMsg) + 1);
            Move(sMsg[1],SendMessage.Buff^,Length(sMsg) + 1);
          except
            SendMessage.Buff:=nil;
          end;
        end else begin
          SendMessage.Buff:=nil;
        end;
        m_MsgList.Insert(0,SendMessage);
      end;
    finally
      LeaveCriticalSection(ProcessMsgCriticalSection);
    end;
end;

procedure TBaseObject.SendMsg(BaseObject: TBaseObject; wIdent, wParam: Word; nParam1, nParam2, nParam3: Integer; sMsg: String);//004B865C
var
  SendMessage:pTSendMessage;
begin
    try
      EnterCriticalSection(ProcessMsgCriticalSection);
      if not m_boGhost then begin
        New(SendMessage);
        SendMessage.wIdent         :=wIdent;
        SendMessage.wParam         :=wParam;
        SendMessage.nParam1        :=nParam1;
        SendMessage.nParam2        :=nParam2;
        SendMessage.nParam3        :=nParam3;
        SendMessage.dwDeliveryTime :=0;
        SendMessage.BaseObject     :=BaseObject;
        SendMessage.boLateDelivery :=False;
        if sMsg <> '' then begin
          try
            GetMem(SendMessage.Buff,Length(sMsg) + 1);
            Move(sMsg[1],SendMessage.Buff^,Length(sMsg) + 1);
          except
            SendMessage.Buff:=nil;
          end;
        end else begin
          SendMessage.Buff:=nil;
        end;
        m_MsgList.Add(SendMessage);
      end;
    finally
      LeaveCriticalSection(ProcessMsgCriticalSection);
    end;
end;

procedure TBaseObject.SendDelayMsg(BaseObject: TBaseObject; wIdent,
  wParam: Word; lParam1, lParam2, lParam3: Integer; sMsg: String;
  dwDelay: LongWord);//004B87C4
var
  SendMessage:pTSendMessage;
begin
    try
      EnterCriticalSection(ProcessMsgCriticalSection);
      if not m_boGhost then begin
        New(SendMessage);
        SendMessage.wIdent         :=wIdent;
        SendMessage.wParam         :=wParam;
        SendMessage.nParam1        :=lParam1;
        SendMessage.nParam2        :=lParam2;
        SendMessage.nParam3        :=lParam3;
        SendMessage.dwDeliveryTime :=GetTickCount + dwDelay;
        SendMessage.BaseObject     :=BaseObject;
        SendMessage.boLateDelivery :=True;
        if sMsg <> '' then begin
          try
            GetMem(SendMessage.Buff,Length(sMsg) + 1);
            Move(sMsg[1],SendMessage.Buff^,Length(sMsg) + 1);
          except
            SendMessage.Buff:=nil;
          end;
        end else begin
          SendMessage.Buff:=nil;
        end;
        m_MsgList.Add(SendMessage);
      end;
    finally
      LeaveCriticalSection(ProcessMsgCriticalSection);
    end;
end;

procedure TBaseObject.SendUpdateDelayMsg(BaseObject: TBaseObject; wIdent,
  wParam: Word; lParam1, lParam2, lParam3: Integer; sMsg: String;
  dwDelay: LongWord);//004B8930
var
  SendMessage:pTSendMessage;
  i:integer;
begin
  EnterCriticalSection(ProcessMsgCriticalSection);
  try
    i:=0;
    while (True) do begin
      if m_MsgList.Count <= i then break;
      SendMessage:=m_MsgList.Items[i];
      if (SendMessage.wIdent = wIdent) and (SendMessage.nParam1 = lParam1) then begin
        m_MsgList.Delete(i);
        if SendMessage.Buff <> nil then FreeMem(SendMessage.Buff);
        Dispose(SendMessage);
        Continue;
      end;
      Inc(i);
    end;
  finally
    LeaveCriticalSection(ProcessMsgCriticalSection);
  end;
  SendDelayMsg(BaseObject,wIdent,wParam,lParam1,lParam2,lParam3,sMsg,dwDelay);
end;

procedure TBaseObject.SendUpdateMsg(BaseObject: TBaseObject; wIdent, wParam: Word;
  lParam1, lParam2, lParam3: Integer; sMsg: String);//004B8A7C
var
  SendMessage:pTSendMessage;
  i:Integer;
begin
  try
    EnterCriticalSection(ProcessMsgCriticalSection);
    i:=0;
    while (True) do begin
      if m_MsgList.Count <= i then break;
      SendMessage:=m_MsgList.Items[i];
      if SendMessage.wIdent = wIdent then begin
        m_MsgList.Delete(i);
        if SendMessage.Buff <> nil then FreeMem(SendMessage.Buff);
        Dispose(SendMessage);
        Continue;
      end;
      Inc(i);
    end;
  finally
    LeaveCriticalSection(ProcessMsgCriticalSection);
  end;
  SendMsg(BaseObject,wIdent,wParam,lParam1,lParam2,lParam3,sMsg);
end;

procedure TBaseObject.SendActionMsg(BaseObject: TBaseObject; wIdent, wParam: Word;
  lParam1, lParam2, lParam3: Integer; sMsg: String);//004B8A7C
var
  SendMessage:pTSendMessage;
  i:Integer;
begin
  EnterCriticalSection(ProcessMsgCriticalSection);
  try
    i:=0;
    while (True) do begin
      if m_MsgList.Count <= i then break;
      SendMessage:=m_MsgList.Items[i];
      if (SendMessage.wIdent = CM_TURN) or
         (SendMessage.wIdent = CM_WALK) or
         (SendMessage.wIdent = CM_SITDOWN) or
         (SendMessage.wIdent = CM_HORSERUN) or
         (SendMessage.wIdent = CM_RUN) or
         (SendMessage.wIdent = CM_HIT) or
         (SendMessage.wIdent = CM_HEAVYHIT) or
         (SendMessage.wIdent = CM_BIGHIT) or
         (SendMessage.wIdent = CM_POWERHIT) or
         (SendMessage.wIdent = CM_LONGHIT) or
         (SendMessage.wIdent = CM_WIDEHIT) or
         (SendMessage.wIdent = CM_FIREHIT) then begin
        m_MsgList.Delete(i);
        if SendMessage.Buff <> nil then FreeMem(SendMessage.Buff);
        Dispose(SendMessage);
        Continue;
      end;
      Inc(i);
    end;
  finally
    LeaveCriticalSection(ProcessMsgCriticalSection);
  end;
  SendMsg(BaseObject,wIdent,wParam,lParam1,lParam2,lParam3,sMsg);
end;

function TBaseObject.GetMessage(Msg:pTProcessMessage): Boolean;//004B8BA4($FFFF)
var
  I:Integer;
  SendMessage:pTSendMessage;
begin
  Result:=False;
  EnterCriticalSection(ProcessMsgCriticalSection);
  try
    I:=0;
    Msg.wIdent:=0;
    while m_MsgList.Count > I do begin
      SendMessage:=m_MsgList.Items[I];
      if (SendMessage.dwDeliveryTime <> 0) and (GetTickCount < SendMessage.dwDeliveryTime)then begin
        Inc(I);
        Continue;
      end;
      m_MsgList.Delete(I);
      Msg.wIdent:=SendMessage.wIdent;
      Msg.wParam:=SendMessage.wParam;
      Msg.nParam1:=SendMessage.nParam1;
      Msg.nParam2:=SendMessage.nParam2;
      Msg.nParam3:=SendMessage.nParam3;
      Msg.BaseObject:=SendMessage.BaseObject;
      Msg.dwDeliveryTime:=SendMessage.dwDeliveryTime;
      Msg.boLateDelivery:=SendMessage.boLateDelivery;
      if SendMessage.Buff <> nil then begin
        Msg.sMsg:=StrPas(SendMessage.Buff);
        FreeMem(SendMessage.Buff);
      end else begin
        Msg.sMsg:='';
      end;
      Dispose(SendMessage);
      Result:=True;
      break;
    end;
  finally
    LeaveCriticalSection(ProcessMsgCriticalSection);
  end;
end;

function TBaseObject.GetMapBaseObjects(tEnvir: TEnvirnoment; nX, nY,nRage: Integer; rList: TList):Boolean;//004B8D2C
var
  III: Integer;
  x,y: Integer;
  nStartX,nStartY,nEndX,nEndY:Integer;
  MapCellInfo:pTMapCellinfo;
  OSObject:pTOSObject;
  BaseObject:TBaseObject;
ResourceString
  sExceptionMsg = '[Exception] TBaseObject::GetMapBaseObjects';
begin
  Result:=False;
  if rList = nil then exit;
  try
    nStartX:=nX - nRage;
    nEndX:=nX + nRage;
    nStartY:=nY - nRage;
    nEndY:=nY + nRage;
    for x:= nStartX to nEndX do begin
      for y := nStartY to nEndY do begin
        if tEnvir.GetMapCellInfo(x,y,MapCellInfo) and (MapCellInfo.ObjList <> nil) then begin
          for III := 0 to MapCellInfo.ObjList.Count - 1 do begin
            OSObject:=MapCellInfo.ObjList.Items[III];
            if (OSObject <> nil) and (OSObject.btType = OS_MOVINGOBJECT) then begin
              BaseObject:=TBaseObject(OSObject.CellObj);
              if (BaseObject <> nil) and (not BaseObject.m_boDeath) and (not BaseObject.m_boGhost) then begin
                rList.Add(BaseObject);
              end;
            end;
          end;
        end;
      end;
    end;
  except
    MainOutMessage(sExceptionMsg);
  end;
  Result:=True;
end;

procedure TBaseObject.SendRefMsg(wIdent, wParam: Word; nParam1, nParam2, nParam3: Integer; sMsg: String);//004B8EBC
var
  II,nC: Integer;
  nCX,nCY,nLX,nLY,nHX,nHY:Integer;
  MapCellInfo:pTMapCellinfo;
  OSObject:pTOSObject;
  BaseObject:TBaseObject;
ResourceString
  sExceptionMsg = '[Exception] TBaseObject::SendRefMsg Name = %s';
begin
  if m_PEnvir = nil then begin
    MainOutMessage(m_sCharName + ' SendRefMsg nil PEnvir ');
    exit;
  end;
  //if m_boObMode or m_boFixedHideMode then exit;
  //01/21 增加，原来直接不发信息，如果隐身模式则只发送信息给自己
  if m_boObMode or m_boFixedHideMode then begin
    SendMsg(Self,wIdent,wParam,nParam1,nParam2,nParam3,sMsg);
    exit;
  end;

  EnterCriticalSection(ProcessMsgCriticalSection);
  try
    if ((GetTickCount - m_SendRefMsgTick) >= 500) or (m_VisibleHumanList.Count = 0) then begin
      m_SendRefMsgTick:=GetTickCount();
      m_VisibleHumanList.Clear;
      nLX:=m_nCurrX - g_Config.nSendRefMsgRange{12};
      nHX:=m_nCurrX + g_Config.nSendRefMsgRange{12};
      nLY:=m_nCurrY - g_Config.nSendRefMsgRange{12};
      nHY:=m_nCurrY + g_Config.nSendRefMsgRange{12};
      for nCX:= nLX to nHX do begin
        for nCY:= nLY to nHY do begin
            if m_PEnvir.GetMapCellInfo(nCX,nCY,MapCellInfo) then begin
              if MapCellInfo.ObjList <> nil then begin
                for II := MapCellInfo.ObjList.Count - 1 downto 0 do begin
                  OSObject:=MapCellInfo.ObjList.Items[II];
                  if OSObject <> nil then begin
                    if OSObject.btType = OS_MOVINGOBJECT then begin
                      if (GetTickCount - OSObject.dwAddTime) >= 60 * 1000 then begin
                        DisPose(OSObject);
                        MapCellInfo.ObjList.Delete(II);
                        if MapCellInfo.ObjList.Count <= 0 then begin
                          MapCellInfo.ObjList.Free;
                          MapCellInfo.ObjList:=nil;
                          break;
                        end;
                      end else begin//004B90A4
                        try
                          BaseObject:=TBaseObject(OSObject.CellObj);
                          if (BaseObject <> nil)and not BaseObject.m_boGhost then begin
                            if (BaseObject.m_btRaceServer = RC_PLAYOBJECT) then begin
                              BaseObject.SendMsg(Self,wIdent,wParam,nParam1,nParam2,nParam3,sMsg);
                              m_VisibleHumanList.Add(BaseObject);
                            end else //004B9125
                            if BaseObject.m_boWantRefMsg then begin
                              if (wIdent = RM_STRUCK) or (wIdent = RM_HEAR) or (wIdent = RM_DEATH) then begin
                                BaseObject.SendMsg(Self,wIdent,wParam,nParam1,nParam2,nParam3,sMsg);
                                m_VisibleHumanList.Add(BaseObject);
                              end;
                            end;
                          end;
                        except
                          on e: Exception do begin
                            MapCellInfo.ObjList.Delete(II);
                            if MapCellInfo.ObjList.Count <= 0 then begin
                              MapCellInfo.ObjList.Free;
                              MapCellInfo.ObjList:=nil;
                            end;
                            MainOutMessage(format(sExceptionMsg,[m_sCharName]));
                            MainOutMessage(E.Message);
                          end;
                        end;
                      end;
                    end;
                  end;
                end; //for I := 0 to MapCellInfo.ObjList.Count - 1 do begin
              end; //if MapCellInfo.ObjList <> nil then begin
            end; //if PEnvir.GetMapCellInfo(nC,n10,MapCellInfo) then begin
        end;
      end;
      exit;
    end; //004B91FC

    for nC:= 0 to m_VisibleHumanList.Count - 1 do begin
      BaseObject:=TBaseObject(m_VisibleHumanList.Items[nC]);
      if BaseObject.m_boGhost then Continue;
      if (BaseObject.m_PEnvir = m_PEnvir) and
         (abs(BaseObject.m_nCurrX - m_nCurrX) < 11) and
         (abs(BaseObject.m_nCurrY - m_nCurrY) < 11) then begin
        if BaseObject.m_btRaceServer = RC_PLAYOBJECT then begin
          BaseObject.SendMsg(Self,wIdent,wParam,nParam1,nParam2,nParam3,sMsg);
        end else
        if BaseObject.m_boWantRefMsg then begin
          if (wIdent = RM_STRUCK) or (wIdent = RM_HEAR) or (wIdent = RM_DEATH) then begin
            BaseObject.SendMsg(Self,wIdent,wParam,nParam1,nParam2,nParam3,sMsg);
          end;
        end; //if BaseObject.m_boWantRefMsg then begin
      end; //if (BaseObject.m_PEnvir = m_PEnvir) and
    end; //for nC:= 0 to m_VisibleHumanList.Count - 1 do begin
  finally
    LeaveCriticalSection(ProcessMsgCriticalSection);
  end;
end;


procedure TBaseObject.UpdateVisibleGay(BaseObject:TBaseObject);//004B939C
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
end;

procedure TBaseObject.UpdateVisibleItem(wX, wY: Integer; MapItem: PTMapItem);//004B94FC
var
  I: Integer;
  boIsVisible:Boolean;
  VisibleMapItem:pTVisibleMapItem;
begin
  boIsVisible:=False;
  for I := 0 to m_VisibleItems.Count - 1 do begin
    VisibleMapItem:=m_VisibleItems.Items[i];
    if VisibleMapItem.MapItem = MapItem then begin
      VisibleMapItem.nVisibleFlag:=1;
      boIsVisible:=True;
      break;
    end;
  end;
  if boIsVisible then exit;
    New(VisibleMapItem);
    VisibleMapItem.nVisibleFlag:=2;
    VisibleMapItem.nX:=wX;
    VisibleMapItem.nY:=wY;
    VisibleMapItem.MapItem:=MapItem;
    VisibleMapItem.sName:=MapItem.Name;
    VisibleMapItem.wLooks:=MapItem.Looks;
    m_VisibleItems.Add(VisibleMapItem);
end;

procedure TBaseObject.UpdateVisibleEvent(wX, wY: Integer; MapEvent: TObject); //004B95D0
var
  I: Integer;
  boIsVisible:Boolean;
  Event:TEvent;
begin
  boIsVisible:=False;
  for I := 0 to m_VisibleEvents.Count - 1 do begin
    Event:=m_VisibleEvents.Items[i];
    if Event = MapEvent then begin
      Event.nVisibleFlag:=1;
      boIsVisible:=True;
      break;
    end;
  end;
  if boIsVisible then exit;
  TEvent(MapEvent).nVisibleFlag:=2;
  TEvent(MapEvent).m_nX:=wX;
  TEvent(MapEvent).m_nY:=wY;
  m_VisibleEvents.Add(MapEvent);
end;
function TBaseObject.IsVisibleHuman: Boolean;
var
  I:Integer;
  VisibleBaseObject:pTVisibleBaseObject;
begin
  Result:=False;
  for I := 0 to m_VisibleActors.Count - 1 do begin
    VisibleBaseObject:=m_VisibleActors.Items[i];
    if (VisibleBaseObject.BaseObject.m_btRaceServer = RC_PLAYOBJECT) or (VisibleBaseObject.BaseObject.m_Master <> nil) then begin
      Result:=True;
      break;
    end;
  end;
end;

procedure TBaseObject.SearchViewRange;//004B966C
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
  MapItem     :PTMapItem;
  MapEvent    :TEvent;
  VisibleBaseObject:pTVisibleBaseObject;
  nCheckCode       :Integer;
ResourceString
  sExceptionMsg1 = '[Exception] TBaseObject::SearchViewRange Code:%d';
  sExceptionMsg2 = '[Exception] TBaseObject::SearchViewRange 1-%d %s %s %d %d %d';

begin
  nCheckCode:=0;
  if m_PEnvir = nil then begin
    MainOutMessage('SearchViewRange nil PEnvir');
    exit;
  end;
  nCheckCode:=1;
  n24:=0;
  m_boIsVisibleActive:=False;//先置为FALSE
  try
    nCheckCode:=4;
    for I := 0 to m_VisibleActors.Count - 1 do begin
      pTVisibleBaseObject(m_VisibleActors.Items[I]).nVisibleFlag:=0;
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
                      end;
                    end;
                  end;
                end;
              end;
            Inc(nIdx);
          end;
        end;
      end;
    end;
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
        m_VisibleActors.Delete(n18);
        nCheckCode:=48;
        Dispose(VisibleBaseObject);
        nCheckCode:=49;
        Continue;
      end;
      nCheckCode:=50;
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
end;

function TBaseObject.GetFeatureToLong: Integer; //004BA23C
begin
  Result:=GetFeature(nil);
end;
function TBaseObject.GetFeatureEx():Word;
begin
  if m_boOnHorse then begin
    Result:=MakeWord(m_btHorseType,m_btDressEffType);
  end else begin
    Result:=MakeWord(0,m_btDressEffType);
  end;
end;
function TBaseObject.GetFeature(BaseObject: TBaseObject):Integer;//004BA25C
var
  nDress,nWeapon,nHair,nRaceImg,nAppr:Integer;
  StdItem:TItem;
  bo25:Boolean;
begin
  if m_btRaceServer = RC_PLAYOBJECT then begin
    nDress:=0;
    //衣服
    if m_UseItems[U_DRESS].wIndex > 0 then begin
      StdItem:=UserEngine.GetStdItem(m_UseItems[U_DRESS].wIndex);
      if StdItem <> nil then begin
        nDress:=StdItem.Shape * 2;
      end;
    end;
    Inc(nDress,m_btGender);
    nWeapon:=0;
    //武器
    if m_UseItems[U_WEAPON].wIndex > 0 then begin
      StdItem:=UserEngine.GetStdItem(m_UseItems[U_WEAPON].wIndex);
      if StdItem <> nil then begin
        nWeapon:=StdItem.Shape * 2;
      end;
    end;
    Inc(nWeapon,m_btGender);
    nHair:=m_btHair * 2 + m_btGender;
    Result:=MakeHumanFeature(0,nDress,nWeapon,nHair);
    exit;
  end;//004BA32F
  
  bo25:=False;
  if (BaseObject <> nil) and (BaseObject.bo245) then
    bo25:=True;
  if bo25 then begin
    nRaceImg:=m_btRaceImg;
    nAppr:=m_wAppr;
    case nAppr of   
      0: begin
        nRaceImg:=12;
        nAppr:=5;
      end;
      1: begin
        nRaceImg:=11;
        nAppr:=9;
      end;
      160: begin
        nRaceImg:=10;
        nAppr:=0;
      end;
      161: begin
        nRaceImg:=10;
        nAppr:=1;
      end;
      162: begin
        nRaceImg:=11;
        nAppr:=6;
      end;
      163: begin
        nRaceImg:=11;
        nAppr:=3;
      end;
    end;
    
    Result:=MakeMonsterFeature(nRaceImg,m_btMonsterWeapon,nAppr);
    exit;
  end;//004BA40E

  Result:=MakeMonsterFeature(m_btRaceImg,m_btMonsterWeapon,m_wAppr);
end;

function TBaseObject.GetCharStatus():Integer;//004BA43C
var
  I: Integer;
  nStatus:Integer;
begin
  nStatus:=0;
  for I := Low(TStatusTime) to High(TStatusTime) do begin
    if m_wStatusTimeArr[I] > 0 then begin
      nStatus:=($80000000 shr I) or nStatus;
    end;
  end;
  Result:=(m_nCharStatusEx and $FFFFF) or nStatus;
end;

procedure TBaseObject.AbilCopyToWAbil;//004BA494
begin
  m_WAbil:=m_Abil;
end;

procedure TBaseObject.Initialize;//4BA4B8
var
  I: Integer;
  UserMagic:pTUserMagic;
begin
  AbilCopyToWAbil();
  for I := 0 to m_MagicList.Count - 1 do begin
    UserMagic:=m_MagicList.Items[i];
    if UserMagic.btLevel >= 4 then UserMagic.btLevel:=0;
  end;
  m_boAddtoMapSuccess:=True;
  if m_PEnvir.CanWalk(m_nCurrX,m_nCurrY,True) and AddToMap() then
    m_boAddtoMapSuccess:=False;
  m_nCharStatus:=GetCharStatus();
  AddBodyLuck(0);
  LoadSayMsg();
  if g_Config.boMonSayMsg then MonsterSayMsg(nil,s_MonGen);
end;

//==============================
//取得怪物说话信息列表
procedure TBaseObject.LoadSayMsg();
var
  I: Integer;
begin
  for I := 0 to g_MonSayMsgList.Count - 1 do begin
    if CompareText(g_MonSayMsgList.Strings[I],m_sCharName) = 0 then begin
      m_SayMsgList:=TList(g_MonSayMsgList.Objects[I]);
      break;
    end;
  end;
end;
procedure TBaseObject.Disappear(); //004BA580
begin

end;

procedure TBaseObject.FeatureChanged;//004BA58C
begin
  SendRefMsg(RM_FEATURECHANGED,GetFeatureEx,GetFeatureToLong,0,0,'')
end;

procedure TBaseObject.StatusChanged();//004BA5B4
begin
  SendRefMsg(RM_CHARSTATUSCHANGED, m_nHitSpeed,m_nCharStatus, 0, 0, '')
end;

procedure TBaseObject.DisappearA(); //004BA65C
begin
  m_PEnvir.DeleteFromMap(m_nCurrX,m_nCurrY,OS_MOVINGOBJECT,Self);
  SendRefMsg(RM_DISAPPEAR, 0, 0, 0, 0, '');
end;

procedure  TBaseObject.KickException; //004BA6A8
var
  PlayObject:TPlayObject;
begin
   if m_btRaceServer = RC_PLAYOBJECT then begin
      m_sMapName := g_Config.sHomeMap;
      m_nCurrX := g_Config.nHomeX;
      m_nCurrY := g_Config.nHomeY;
      PlayObject:= TPlayObject(self);
      PlayObject.m_boEmergencyClose := TRUE;
   end else begin  //
      m_boDeath:=True;
      m_dwDeathTick:=GetTickCount;
      MakeGhost;
   end;
end;

function TBaseObject.Walk(nIdent:Integer):Boolean;//004BA724
var
  I: Integer;
  MapCellInfo:pTMapCellinfo;
  OSObject:pTOSObject;
  GateObj:pTGateObj;
  bo1D:Boolean;
  Event:TEvent;
  PlayObject:TPlayObject;
  nCheckCode:Integer;
ResourceString
  sExceptionMsg = '[Exception] TBaseObject::Walk  CheckCode:%d %s %s %d:%d';
begin
  Result:=True;
  nCheckCode:= -1;
  if m_PEnvir = nil then begin
    MainOutMessage('Walk nil PEnvir');
    exit;
  end;
  try
    nCheckCode:=1;
    bo1D:=m_PEnvir.GetMapCellInfo(m_nCurrX,m_nCurrY,MapCellInfo);
    GateObj:=nil;
    Event:=nil;
    nCheckCode:=2;
    if bo1D and (MapCellInfo.ObjList <> nil)then begin
      for I := 0 to MapCellInfo.ObjList.Count - 1 do begin
        OSObject:=MapCellInfo.ObjList.Items[i];
        if OSObject.btType = OS_GATEOBJECT then begin
         GateObj:=pTGateObj(OSObject.CellObj);
        end;
        if OSObject.btType = OS_EVENTOBJECT then begin
          if TEvent(OSObject.CellObj).m_OwnBaseObject <> nil then
            Event:=TEvent(OSObject.CellObj);
        end;
        if OSObject.btType = OS_MAPEVENT then begin

        end;
        if OSObject.btType = OS_DOOR then begin

        end;
        if OSObject.btType = OS_ROON then begin

        end;
      end;
    end;
    nCheckCode:=3;
    if Event <> nil then begin
      if Event.m_OwnBaseObject.IsProperTarget(Self) then  //FFF4
        SendMsg(Event.m_OwnBaseObject,RM_MAGSTRUCK_MINE,0,Event.m_nDamage,0,0,'');
    end;
    nCheckCode:=4;
    if Result and (GateObj <> nil) then begin
      if m_btRaceServer = RC_PLAYOBJECT then begin
        if m_PEnvir.ArroundDoorOpened(m_nCurrX,m_nCurrY) then begin
          //004BA89E
          if (not TEnvirnoment(GateObj.DEnvir).Flag.boNEEDHOLE) or (g_EventManager.GetEvent(m_PEnvir,m_nCurrX,m_nCurrY,ET_DIGOUTZOMBI) <> nil) then begin
            if nServerIndex = TEnvirnoment(GateObj.DEnvir).nServerIndex then begin
              if not EnterAnotherMap(TEnvirnoment(GateObj.DEnvir),GateObj.nDMapX,GateObj.nDMapY) then begin
                Result:=False;
              end;
            end else begin //004BA914
              DisappearA();
              m_bo316:=True;
              PlayObject:=TPlayObject(Self);
              PlayObject.m_sSwitchMapName:=TEnvirnoment(GateObj.DEnvir).sMapName;
              PlayObject.m_nSwitchMapX:=GateObj.nDMapX;
              PlayObject.m_nSwitchMapY:=GateObj.nDMapY;
              PlayObject.m_boSwitchData:=True;
              PlayObject.m_nServerIndex:=TEnvirnoment(GateObj.DEnvir).nServerIndex;
              PlayObject.m_boEmergencyClose:=True;
              PlayObject.m_boReconnection:=True;
            end;
          end;
        end;
      end else Result:=False;
    end else begin  //004BA998
      nCheckCode:=5;
      if Result then begin
        nCheckCode:=6;
        SendRefMsg(nIdent,m_btDirection,m_nCurrX,m_nCurrY,0,'');
      end;
    end;
  except
    on e: Exception do begin
      MainOutMessage(format(sExceptionMsg,[nCheckCode,m_sCharname,m_sMapName,m_nCurrX,m_nCurrY]));
      {MainOutMessage('[Exception] TBaseObject.Walk  CheckCode: ' + IntToStr(nCheckCode) + ' ' +
                    m_sCharname + ' ' +
                    m_sMapName + ' ' +
                    IntToStr(m_nCurrX) + ':' +
                    IntToStr(m_nCurrY));}
      MainOutMessage(E.Message);
    end;
  end;
end;

function TBaseObject.EnterAnotherMap(Envir: TEnvirnoment; nDMapX,
  nDMapY: Integer): Boolean; //004BAADC
var
  I           :Integer;
  MapCellInfo :pTMapCellinfo;
  OldEnvir    :TEnvirnoment;
  nOldX       :Integer;
  nOldY       :Integer;
  Castle      :TUserCastle;
ResourceString
  sExceptionMsg1 = '[Exception] TBaseObject::EnterAnotherMap -> MsgTargetList Clear';
  sExceptionMsg2 = '[Exception] TBaseObject::EnterAnotherMap -> VisbleItems Dispose';
  sExceptionMsg3 = '[Exception] TBaseObject::EnterAnotherMap -> VisbleItems Clear';
  sExceptionMsg4 = '[Exception] TBaseObject::EnterAnotherMap -> VisbleEvents Clear';
  sExceptionMsg5 = '[Exception] TBaseObject::EnterAnotherMap -> VisbleActors Dispose';
  sExceptionMsg6 = '[Exception] TBaseObject::EnterAnotherMap -> VisbleActors Clear';
  sExceptionMsg7 = '[Exception] TBaseObject::EnterAnotherMap';
begin
  Result:=False;
  try
    if m_Abil.Level < Envir.nRequestLevel then exit;
    if Envir.QuestNPC <> nil then TMerchant(Envir.QuestNPC).Click(TPlayObject(Self));
    if Envir.Flag.nNEEDSETONFlag >=  0 then begin
      if GetQuestFalgStatus(Envir.Flag.nNEEDSETONFlag) <> Envir.Flag.nNeedONOFF then exit;
    end;
    if not Envir.GetMapCellInfo(nDMapX,nDMapY,MapCellInfo) then exit;
    Castle:=g_CastleManager.IsCastlePalaceEnvir(Envir);
    if (Castle <> nil) and (m_btRaceServer = RC_PLAYOBJECT) then begin
      if not Castle.CheckInPalace(m_nCurrX,m_nCurrY,Self) then exit;
    end;
    {
    if (UserCastle.m_MapPalace = Envir) and (m_btRaceServer = RC_PLAYOBJECT) then begin
      if not UserCastle.CheckInPalace(m_nCurrX,m_nCurrY,Self) then exit;
    end;
    }
    if Envir.Flag.boNOHORSE then m_boOnHorse:=False;
    OldEnvir:=m_PEnvir;
    nOldX:=m_nCurrX;
    nOldY:=m_nCurrY;
    DisappearA();
    try
      m_VisibleHumanList.Clear;
    except
      MainOutMessage(sExceptionMsg1);
    end;
    try
      for I := 0 to m_VisibleItems.Count - 1 do begin
        Dispose(pTVisibleMapItem(m_VisibleItems.Items[i]));
      end;
    except
      MainOutMessage(sExceptionMsg2);
    end;
    try
      m_VisibleItems.Clear;
    except
      MainOutMessage(sExceptionMsg3);
    end;

    try
      m_VisibleEvents.Clear;
    except
      MainOutMessage(sExceptionMsg4);
    end;
    try
      for I := 0 to m_VisibleActors.Count - 1 do begin
        Dispose(pTVisibleBaseObject(m_VisibleActors.Items[i]));
      end;
    except
      MainOutMessage(sExceptionMsg5);
    end;
    try
      m_VisibleActors.Clear;
    except
      MainOutMessage(sExceptionMsg6);
    end;
    SendMsg(Self,RM_CLEAROBJECTS,0,0,0,0,'');
    m_PEnvir:=Envir;
    m_sMapName:=Envir.sMapName;
    m_nCurrX:=nDMapX;
    m_nCurrY:=nDMapY;
    SendMsg(Self,RM_CHANGEMAP,0,0,0,0,Envir.sMapName);
    if AddToMap() then begin
      m_dwMapMoveTick:=GetTickCount();
      m_bo316:=True;
      Result:=True;
    end else begin
      m_PEnvir:=OldEnvir;
      m_nCurrX:=nOldX;
      m_nCurrY:=nOldY;
      m_PEnvir.AddToMap(m_nCurrX,m_nCurrY,OS_MOVINGOBJECT,Self);
    end;
    if m_btRaceServer = RC_PLAYOBJECT then begin //复位泡点，及金币，时间
      TPlayObject(Self).m_dwIncGamePointTick:=GetTickCount();
      TPlayObject(Self).m_dwIncGameGoldTick:=GetTickCount();
      TPlayObject(Self).m_dwAutoGetExpTick:=GetTickCount();
    end;

    if m_PEnvir.Flag.boFight3Zone and (m_PEnvir.Flag.boFight3Zone <> OldEnvir.Flag.boFight3Zone) then
      RefShowName();
  except
    MainOutMessage(sExceptionMsg7);
  end;
end;

procedure TBaseObject.TurnTo(nDir: integer); //004BB048
begin
  m_btDirection:=nDir;
  SendRefMsg(RM_TURN,nDir,m_nCurrX,m_nCurrY,0,'');
end;

procedure TBaseObject.ProcessSayMsg(sMsg: String);//004BB084
var
  sCharName:String;
begin
  if m_btRaceServer = RC_PLAYOBJECT then sCharName:=m_sCharName
  else sCharName:=FilterShowName(m_sCharName);    
  SendRefMsg(RM_HEAR,0,g_Config.btHearMsgFColor,g_Config.btHearMsgBColor,0, sCharName + ':' + sMsg);
end;

procedure TBaseObject.SysMsg(sMsg:String;MsgColor:TMsgColor;MsgType:TMsgType);//004BB124
begin
  if g_Config.boShowPreFixMsg then begin
    case MsgType of
      t_Mon: sMsg:=g_Config.sMonSayMsgpreFix + sMsg;
      t_Hint: sMsg:=g_Config.sHintMsgPreFix + sMsg;
    {
    s_GroupMsg: sMsg:=g_Config.sGroupMsgPreFix + sMsg;
    s_GuildMsg: sMsg:=g_Config.sGuildMsgPreFix + sMsg;
    }
      t_GM: sMsg:=g_Config.sGMRedMsgpreFix + sMsg;
      t_System: sMsg:=g_Config.sSysMsgPreFix + sMsg;
      t_Notice: sMsg:=g_Config.sLineNoticePreFix + sMsg;
      t_Cust:   sMsg:=g_Config.sCustMsgpreFix + sMsg;
      t_Castle: sMsg:=g_Config.sCastleMsgpreFix + sMsg;
    end;
  end;
  {
  case MsgColor of
    c_Green: SendMsg(Self,RM_SYSMESSAGE2,0,0,0,0,sMsg);
    c_Blue: SendMsg(Self,RM_SYSMESSAGE3,0,0,0,0,sMsg);
    else SendMsg(Self,RM_SYSMESSAGE,0,0,0,0,sMsg);
  end;
  }
  case MsgColor of
    c_Green: SendMsg(Self,RM_SYSMESSAGE,0,g_Config.btGreenMsgFColor,g_Config.btGreenMsgBColor,0,sMsg);
    c_Blue: SendMsg(Self,RM_SYSMESSAGE,0,g_Config.btBlueMsgFColor,g_Config.btBlueMsgBColor,0,sMsg);
    else begin
      if MsgType = t_Cust then begin
        SendMsg(Self,RM_SYSMESSAGE,0,g_Config.btCustMsgFColor,g_Config.btCustMsgBColor,0,sMsg);
      end else begin
        SendMsg(Self,RM_SYSMESSAGE,0,g_Config.btRedMsgFColor,g_Config.btRedMsgBColor,0,sMsg);
      end;
    end;
  end;
end;
procedure TBaseObject.MonsterSayMsg(AttackBaseObject:TBaseObject;MonStatus:TMonStatus);
var
  I: Integer;
  nMsgColor:Integer;
  sMsg:String;
  MonSayMsg:pTMonSayMsg;
  sAttackName:String;
begin
  if m_SayMsgList = nil then exit;
  if (m_btRaceServer = RC_PLAYOBJECT) then exit;
  if (AttackBaseObject <> nil) then begin
    if (AttackBaseObject.m_btRaceServer <> RC_PLAYOBJECT) and (AttackBaseObject.m_Master = nil) then begin
      exit;
    end;
    if AttackBaseObject.m_Master <> nil then sAttackName:=AttackBaseObject.m_Master.m_sCharName
    else sAttackName:=AttackBaseObject.m_sCharName;
  end;
  for I := 0 to m_SayMsgList.Count - 1 do begin
    MonSayMsg:=m_SayMsgList.Items[I];
    sMsg:=AnsiReplaceText(MonSayMsg.sSayMsg,'%s',FilterShowName(m_sCharName));
    sMsg:=AnsiReplaceText(sMsg,'%d',sAttackName);
    if (MonSayMsg.State = MonStatus) and (Random(MonSayMsg.nRate) = 0) then begin
      if MonStatus = s_MonGen then begin
        UserEngine.SendBroadCastMsg(sMsg,t_Mon);
        break;
      end;
      if MonSayMsg.Color = c_White then begin
        ProcessSayMsg(sMsg);
      end else begin
        AttackBaseObject.SysMsg(sMsg,MonSayMsg.Color,t_Mon);
      end;
      break;
    end;
  end;
end;

procedure TBaseObject.SendGroupText(sMsg: String);//004BB1CC
var
  I: Integer;
  PlayObject:TPlayObject;
begin
  sMsg:=g_Config.sGroupMsgPreFix + sMsg;
  if m_GroupOwner <> nil then begin
    for I := 0 to m_GroupOwner.m_GroupMembers.Count - 1 do  begin
      PlayObject:=TPlayObject(m_GroupOwner.m_GroupMembers.Objects[i]);
      PlayObject.SendMsg(Self,RM_GROUPMESSAGE,0,g_Config.btGroupMsgFColor,g_Config.btGroupMsgBColor,0,sMsg);
    end;
  end;    
end;



procedure TBaseObject.MakeGhost(); //004BB300
begin
  m_boGhost:=True;
  m_dwGhostTick:=GetTickCount();
  DisappearA();
end;

procedure TBaseObject.ApplyMeatQuality; //004BB32C
var
  I: Integer;
  StdItem:TItem;
  UserItem:pTUseritem;
begin
  for I := 0 to m_ItemList.Count - 1 do begin
    UserItem:=m_ItemList.Items[i];
    StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
    if StdItem <> nil then begin
      if StdItem.StdMode = 40 then begin
        UserItem.Dura:=m_nMeatQuality;
      end;
    end;
  end;
end;

function TBaseObject.TakeBagItems(BaseObject: TBaseObject): Boolean; //004BB3B0
var
  UserItem:pTUseritem;
  PlayObject:TPlayObject;
begin
  Result:=False;
  while (True) do begin
    if BaseObject.m_ItemList.Count <= 0 then break;
    UserItem:=BaseObject.m_ItemList.Items[0];
    if not AddItemToBag(UserItem) then break;
    if Self is TPlayObject then begin
      PlayObject:=TPlayObject(Self);
      PlayObject.SendAddItem(UserItem);
      Result:=True;
    end;
    BaseObject.m_ItemList.Delete(0);
  end;
end;
{
procedure TBaseObject.ScatterBagItems(ItemOfCreat:TBaseObject); //004BB44C
var
   i, dropwide: integer;
   pu: PTUserItem;
   dellist: TStringList;
   boDropall: Boolean;
begin
   dellist := nil;
   if m_boAngryRing or m_boNoDropItem or m_PEnvir.Flag.boNODROPITEM then exit; //不死戒指

   boDropall := TRUE;
   if m_btRaceServer = RC_PLAYOBJECT then begin
      dropwide := 2;
      if PKLevel < 2 then boDropall := FALSE; //荤恩篮 1/3犬伏肺 冻焙促.
      //弧盎捞绰 促 冻焙促.
   end else
      dropwide := 3;

   try
      for i:=m_ItemList.Count-1 downto 0 do begin
         if (Random(3) = 0) or boDropall then begin
            if DropItemDown (pTUserItem(m_ItemList[i]), dropwide, TRUE,ItemOfCreat,Self) then begin
               pu := PTUserItem(m_ItemList[i]);
               if m_btRaceServer = RC_PLAYOBJECT then begin
                  if dellist = nil then dellist := TStringList.Create;
                  dellist.AddObject(UserEngine.GetStdItemName (pu.wIndex), TObject(pu.MakeIndex));
               end;
               Dispose(PTUserItem(m_ItemList[i]));
               m_ItemList.Delete (i);
            end;
         end;
      end;
      if dellist <> nil then begin
         SendMsg (self, RM_SENDDELITEMLIST, 0, integer(dellist), 0, 0, '');
      end;
   except
      MainOutMessage ('[Exception] TBaseObject.ScatterBagItems');
   end;
end;
}

procedure TBaseObject.ScatterBagItems(ItemOfCreat:TBaseObject); //004BB44C
const
  DropWide:Integer = 3;
var
  I,II:Integer;
  UserItem:pTUserItem;
  StdItem:TItem;
  boCanNotDrop:Boolean;
  MonDrop:pTMonDrop;
ResourceString
  sExceptionMsg = '[Exception] TBaseObject::ScatterBagItems';
begin
  try
    g_MonDropLimitLIst.Lock;
    try
      for I:=m_ItemList.Count - 1 downto 0 do begin
        UserItem:=m_ItemList.Items[I];
        StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
        boCanNotDrop:=False;
        if StdItem <> nil then begin
          for II:= 0 to g_MonDropLimitLIst.Count - 1 do begin
            if CompareText(StdItem.Name,g_MonDropLimitLIst.Strings[II]) = 0 then begin
              MonDrop:=pTMonDrop(g_MonDropLimitLIst.Objects[II]);
              if MonDrop.nDropCount < MonDrop.nCountLimit then begin
                Inc(MonDrop.nDropCount);
                g_MonDropLimitLIst.Objects[II]:=TObject(MonDrop);
              end else begin
                Inc(MonDrop.nNoDropCount);
                boCanNotDrop:=True;
              end;
              break;
            end;
          end;
        end;
        if boCanNotDrop then Continue;
          
        if DropItemDown(UserItem,DropWide,True,ItemOfCreat,Self) then begin
          Dispose(UserItem);
          m_ItemList.Delete(I);
        end;
      end;
    finally
      g_MonDropLimitLIst.UnLock;
    end;
  except
    MainOutMessage(sExceptionMsg);
  end;
end;
procedure TBaseObject.ScatterGolds(GoldOfCreat:TBaseObject); //004BB63C
var
  I, nGold: integer;
begin
   if m_nGold > 0 then begin
      I:=0;
      while (True) do begin
//      for i:=0 to 18 do begin
         if m_nGold > g_Config.nMonOneDropGoldCount then begin
            nGold := g_Config.nMonOneDropGoldCount;
            m_nGold := m_nGold - g_Config.nMonOneDropGoldCount;
         end else begin
            nGold := m_nGold;
            m_nGold := 0;
         end;
         if nGold > 0 then begin
            if not DropGoldDown (nGold, TRUE,GoldOfCreat,Self) then begin
               m_nGold := m_nGold + nGold;
               break;
            end;
         end else break;
        Inc(I);
        if I >= 17 then break;          
      end;
      GoldChanged;
   end;
end;

procedure TBaseObject.DropUseItems(BaseObject:TBaseObject); //004BB6C8
var
  nC,nRate:Integer;
  StdItem:TItem;
  DropItemList:TStringList;
ResourceString
  sExceptionMsg = '[Exception] TBaseObject::DropUseItems';
begin
  DropItemList:=nil;
  try
    if m_boNoDropUseItem then exit;  
    if m_btRaceServer = RC_PLAYOBJECT then begin
      nC:=0;
      while (True) do begin
        StdItem:=UserEngine.GetStdItem(m_UseItems[nC].wIndex);
        if StdItem <> nil then begin
          if StdItem.Reserved and 8 <> 0 then begin
            if DropItemList = nil then DropItemList:=TStringList.Create;
            DropItemList.AddObject('',TObject(m_UseItems[nC].MakeIndex));
            //004BB885
            if StdItem.NeedIdentify = 1 then
              AddGameDataLog('16' +  #9 +
                     m_sMapName + #9 +
                     IntToStr(m_nCurrX) + #9 +
                     IntToStr(m_nCurrY) + #9 +
                     m_sCharName + #9 +
                     //UserEngine.GetStdItemName(m_UseItems[nC].wIndex) + #9 +
                     StdItem.Name + #9 +
                     IntToStr(m_UseItems[nC].MakeIndex) + #9 +
                     BoolToIntStr(m_btRaceServer = RC_PLAYOBJECT) + #9 +
                     '0');
            m_UseItems[nC].wIndex:=0;
          end;
        end;
        Inc(nC);
        if nC >= 9 then break;
      end;
    end;
    if PKLevel > 2 then nRate:=15
    else nRate:=30;
    nC:=0;
    While (True) do begin
      if Random(nRate) = 0 then begin
        if DropItemDown(@m_UseItems[nC],2,True,BaseObject,Self) then begin
          StdItem:=UserEngine.GetStdItem(m_UseItems[nC].wIndex);
          if StdItem <> nil then begin
            if StdItem.Reserved and 10 = 0 then begin
              if m_btRaceServer = RC_PLAYOBJECT then begin
                if DropItemList = nil then DropItemList:=TStringList.Create;
                DropItemList.AddObject(UserEngine.GetStdItemName(m_UseItems[nC].wIndex),TObject(m_UseItems[nC].MakeIndex));
              end;
              m_UseItems[nC].wIndex:=0;
            end; //004BB9A9
          end;
        end; //004BB9A9
      end;
      Inc(nC);
      if nC >= 9 then break;
    end;
    if DropItemList <> nil then
      SendMsg(Self,RM_SENDDELITEMLIST,0,Integer(DropItemList),0,0,'');
  except
    MainOutMessage(sExceptionMsg);
  end;
end;

procedure TBaseObject.Die; //004BBA98
var
  boPK,guildwarkill :Boolean;
  tStr:String;
  tExp:LongWord;
  i:Integer;
  GroupHuman:TPlayObject;
  QuestNPC:TMerchant;
  tCheck:Boolean;
  AttackBaseObject:TBaseObject;
  Castle:TUserCastle;
ResourceString
  sExceptionMsg1 = '[Exception] TBaseObject::Die 1';
  sExceptionMsg2 = '[Exception] TBaseObject::Die 2';
  sExceptionMsg3 = '[Exception] TBaseObject::Die 3';
begin
  //004BBABB
  if m_boSuperMan then exit;
  if m_boSupermanItem then exit;
    
  m_boDeath:=True;
  m_dwDeathTick:=GetTickCount();
  sub_4BC87C();
  if m_Master <> nil then begin
    m_ExpHitter:=nil;
    m_LastHiter:=nil;
  end;
  m_nIncSpell   :=0;
  m_nIncHealth  :=0;
  m_nIncHealing :=0;
  //004BBB30
  try
    if (m_btRaceServer <> RC_PLAYOBJECT) and (m_LastHiter <> nil) then begin
      if g_Config.boMonSayMsg then MonsterSayMsg(m_LastHiter,s_Die);

      if (m_ExpHitter <> nil) then begin
        if m_ExpHitter.m_btRaceServer = RC_PLAYOBJECT then begin
          if g_FunctionNPC <> nil then
            g_FunctionNPC.GotoLable(TPlayObject(m_ExpHitter),'@OnKillMob',False);

          tExp:=m_ExpHitter.CalcGetExp(m_Abil.Level,m_dwFightExp);
          if not g_Config.boVentureServer then begin
            TPlayObject(m_ExpHitter).GainExp(tExp);
          end;//004BBBBF
          //是否执行任务脚本
          if m_PEnvir.IsCheapStuff then begin
            if m_ExpHitter.m_GroupOwner <> nil then begin
              for i:= 0 to m_ExpHitter.m_GroupOwner.m_GroupMembers.Count -1 do begin
                GroupHuman:=TPlayObject(m_ExpHitter.m_GroupOwner.m_GroupMembers.Objects[i]);
                if not GroupHuman.m_boDeath and (m_ExpHitter.m_PEnvir = GroupHuman.m_PEnvir) and (abs(m_ExpHitter.m_nCurrX - GroupHuman.m_nCurrX) <= 12) and (abs(m_ExpHitter.m_nCurrX - GroupHuman.m_nCurrX) <= 12) and (m_ExpHitter = GroupHuman) then begin
                  tCheck:=False;
                end else begin//004BBCB3
                  tCheck:=True;
                end;//004BBCB7
                QuestNPC:=TMerchant(m_PEnvir.GetQuestNPC(GroupHuman,m_sCharName,'',tCheck));
                if QuestNPC <> nil then begin
                  QuestNPC.Click(GroupHuman);
                end;
              end;//004BBD08
            end;//004BBD08
            QuestNPC:=TMerchant(m_PEnvir.GetQuestNPC(m_ExpHitter,m_sCharName,'',False));
            if QuestNPC <> nil then begin
              QuestNPC.Click(TPlayObject(m_ExpHitter));
            end;
          end;
        end else begin;//004BBD5B
          if m_ExpHitter.m_Master <> nil then begin
            m_ExpHitter.GainSlaveExp(m_Abil.Level);
            tExp:=m_ExpHitter.m_Master.CalcGetExp(m_Abil.Level,m_dwFightExp);
            if not g_Config.boVentureServer then begin
              TPlayObject(m_ExpHitter.m_Master).GainExp(tExp);
            end;
          end;
        end;
      end else begin;//004BBDD2
        if m_LastHiter.m_btRaceServer = RC_PLAYOBJECT then begin
          if g_FunctionNPC <> nil then
            g_FunctionNPC.GotoLable(TPlayObject(m_LastHiter),'@OnKillMob',False);

          tExp:=m_LastHiter.CalcGetExp(m_Abil.Level,m_dwFightExp);
          if not g_Config.boVentureServer then begin
            TPlayObject(m_LastHiter).GainExp(tExp);
          end;
        end;//004BBE21
      end;//004BBE21
    end;//004BBE21
    if (g_Config.boMonSayMsg) and (m_btRaceServer = RC_PLAYOBJECT) and (m_LastHiter <> nil) then begin
      m_LastHiter.MonsterSayMsg(Self,s_KillHuman);
    end;
    m_Master:=nil;
  except
    on e: Exception do begin
      MainOutMessage (sExceptionMsg1);
      MainOutMessage(E.Message);
    end;
  end;
   try
      boPK:=False;
      if (not g_Config.boVentureServer) and (not m_PEnvir.Flag.boFightZone) and (not m_PEnvir.Flag.boFight3Zone) then begin
         if (m_btRaceServer = RC_PLAYOBJECT) and (m_LastHiter <> nil) and (PKLevel < 2) then begin
//            if (m_LastHiter.m_btRaceServer = RC_PLAYOBJECT) then
            if (m_LastHiter.m_btRaceServer = RC_PLAYOBJECT) or (m_LastHiter.m_btRaceServer = RC_NPC) then
              {修改日期2004/07/21，允许NPC杀死人物}

               boPK:=True;
            if m_LastHiter.m_Master <> nil then
               if m_LastHiter.m_Master.m_btRaceServer = RC_PLAYOBJECT then begin
                  m_LastHiter := m_LastHiter.m_Master;
                  boPK:=True;
               end;
         end;
      end;

      if boPK and (m_LastHiter <> nil) then begin
         guildwarkill := FALSE;
         if (m_MyGuild <> nil) and (m_LastHiter.m_MyGuild <> nil) then begin

            if GetGuildRelation (self, m_LastHiter) = 2 then
               guildwarkill := TRUE;
         end;
         Castle:=g_CastleManager.InCastleWarArea(Self);
         if ((Castle <> nil) and Castle.m_boUnderWar) or (m_boInFreePKArea) then
           guildwarkill := TRUE;
         {
         if UserCastle.m_boUnderWar then
            if (m_boInFreePKArea) or (UserCastle.InCastleWarArea(m_PEnvir, m_nCurrX, m_nCurrY)) then
               guildwarkill := TRUE;
         }
         (*
         if not guildwarkill then begin
            if not m_LastHiter.IsGoodKilling(self) then begin
               m_LastHiter.IncPkPoint (nKillHumanAddPKPoint{100});
               m_LastHiter.SysMsg ('你犯了谋杀罪！！！', c_Red,t_Hint);
               SysMsg('你被 ' + m_LastHiter.m_sCharName + '杀害了！！！',c_Red,t_Hint);
               m_LastHiter.AddBodyLuck (-nKillHumanDecLuckPoint{500});
               if PkLevel < 1 then
                  if Random(5) = 0 then
                     m_LastHiter.MakeWeaponUnlock;
            end else
               m_LastHiter.SysMsg ('[你受到正当规则保护。]', c_Green,t_Hint);
         end;
         *)
         //=================================================================
         //
         if not guildwarkill then begin
           if (g_Config.boKillHumanWinLevel or g_Config.boKillHumanWinExp or m_PEnvir.Flag.boPKWINLEVEL or m_PEnvir.Flag.boPKWINEXP) and (m_LastHiter.m_btRaceServer = RC_PLAYOBJECT) then begin
             TPlayObject(Self).PKDie(TPlayObject(m_LastHiter));
           end else begin
             if not m_LastHiter.IsGoodKilling(self) then begin
               m_LastHiter.IncPkPoint (g_Config.nKillHumanAddPKPoint{100});
               m_LastHiter.SysMsg (g_sYouMurderedMsg{'你犯了谋杀罪！！！'}, c_Red,t_Hint);
               SysMsg(format(g_sYouKilledByMsg,[m_LastHiter.m_sCharName]),c_Red,t_Hint);
               m_LastHiter.AddBodyLuck (-g_Config.nKillHumanDecLuckPoint{500});
               if PkLevel < 1 then
                 if Random(5) = 0 then
                    m_LastHiter.MakeWeaponUnlock;
             end else
               m_LastHiter.SysMsg (g_sYouProtectedByLawOfDefense{'[你受到正当规则保护。]'}, c_Green,t_Hint);
           end;
           //检查攻击人是否用了着经验或等级装备
           if m_LastHiter.m_btRaceServer = RC_PLAYOBJECT then begin
             if m_LastHiter.m_dwPKDieLostExp > 0 then begin
               if m_Abil.Exp >= m_LastHiter.m_dwPKDieLostExp then begin
                 Dec(m_Abil.Exp,m_LastHiter.m_dwPKDieLostExp);
               end else m_Abil.Exp:=0;
             end;
             if m_LastHiter.m_nPKDieLostLevel > 0 then begin
               if m_Abil.Level >= m_LastHiter.m_nPKDieLostLevel then begin
                 Dec(m_Abil.Level,m_LastHiter.m_nPKDieLostLevel);
               end else m_Abil.Level:=0;
             end;               
           end;
           
         end;

         //=================================================================
      end;
   except
      MainOutMessage (sExceptionMsg2);
   end;

   try
      if (not m_PEnvir.Flag.boFightZone) and  //004BC0C1
         (not m_PEnvir.Flag.boFight3Zone) and
         (not m_boAnimal) then begin
         AttackBaseObject:=m_ExpHitter;
         if (m_ExpHitter <> nil) and (m_ExpHitter.m_Master <> nil) then begin
           AttackBaseObject:=m_ExpHitter.m_Master;
         end;
         if m_btRaceServer <> RC_PLAYOBJECT then begin
           DropUseItems(AttackBaseObject);
           if (m_Master = nil) and ((not m_boNoItem) or (not m_PEnvir.Flag.boNODROPITEM)) then
             ScatterBagItems(AttackBaseObject);
           if (m_btRaceServer >= RC_ANIMAL) and (m_Master = nil) and ((not m_boNoItem) or (not m_PEnvir.Flag.boNODROPITEM)) then
             ScatterGolds(AttackBaseObject);
         end else begin //004BC1B0
           if (not m_boNoItem) or (not m_PEnvir.Flag.boNODROPITEM )then begin  {修改日期2004/07/21，增加此行，允许设置 m_boNoItem 后人物死亡不掉物品}
             if AttackBaseObject <> nil then begin
               if (g_Config.boKillByHumanDropUseItem and (AttackBaseObject.m_btRaceServer = RC_PLAYOBJECT)) or (g_Config.boKillByMonstDropUseItem and (AttackBaseObject.m_btRaceServer <> RC_PLAYOBJECT)) then
                 DropUseItems(nil);
             end else begin
               DropUseItems(nil);
             end;
             if g_Config.boDieScatterBag then ScatterBagItems(nil);
             if g_Config.boDieDropGold then ScatterGolds(nil);
           end;
           AddBodyLuck( -(50 - (50 - m_Abil.Level * 5)));
         end; //004BC211
      end;

      if m_PEnvir.Flag.boFight3Zone then begin
         Inc (m_nFightZoneDieCount);
         if m_MyGuild <> nil then begin
            TGuild(m_MyGuild).TeamFightWhoDead (m_sCharName);
         end;

         if (m_LastHiter <> nil) then begin
            if (m_LastHiter.m_MyGuild <> nil) and (m_MyGuild <> nil) then begin
               TGuild(m_LastHiter.m_MyGuild).TeamFightWhoWinPoint (m_LastHiter.m_sCharName, 100);  //matchpoint 刘啊, 俺牢己利 扁废
               tStr:=TGuild(m_LastHiter.m_MyGuild).sGuildName + ':' +
                      IntToStr(TGuild(m_LastHiter.m_MyGuild).nContestPoint) + '  ' +
                      TGuild(m_MyGuild).sGuildName + ':' +
                      IntToStr(TGuild(m_MyGuild).nContestPoint);
               UserEngine.CryCry (RM_CRY, m_PEnvir, m_nCurrX, m_nCurrY, 1000,g_Config.btCryMsgFColor,g_Config.btCryMsgBColor, '- ' + tStr);
            end;
         end;
      end;

      if m_btRaceServer = RC_PLAYOBJECT then begin
         //Jacky 2004/09/05
         //人物死亡立即退组，以防止组队刷经验
         if m_GroupOwner <> nil then m_GroupOwner.DelMember(Self);


         if m_LastHiter <> nil then begin
            if m_LastHiter.m_btRaceServer = RC_PLAYOBJECT then tStr := m_LastHiter.m_sCharName
            else tStr := '#' + m_LastHiter.m_sCharName;
         end else tStr := '####';
      //004BC523
      AddGameDataLog('19' +  #9 +
                     m_sMapName + #9 +
                     IntToStr(m_nCurrX) + #9 +
                     IntToStr(m_nCurrY) + #9 +
                     m_sCharName + #9 +
                     'FZ-' + BoolToIntStr(m_PEnvir.Flag.boFightZone) +
                     '_F3-' + BoolToIntStr(m_PEnvir.Flag.boFight3Zone) + #9 +
                     '0' + #9 +
                     '1' + #9 +
                     tStr);
      end;
      //减少地图上怪物计数
      if (m_Master = nil) and (not m_boDelFormMaped) then begin
        m_PEnvir.DelObjectCount(Self);
        m_boDelFormMaped:=True;
      end;
        
      SendRefMsg (RM_DEATH, m_btDirection, m_nCurrX, m_nCurrY, 1, '');
   except
      MainOutMessage (sExceptionMsg3);
   end;
end;

procedure TBaseObject.ReAlive; //004BC710
begin
  m_boDeath:=False;
  SendRefMsg(RM_ALIVE,m_btDirection,m_nCurrX,m_nCurrY,0,'');
end;

procedure TBaseObject.SetLastHiter(BaseObject: TBaseObject); //004BC74C
begin
  m_LastHiter:=BaseObject;
  m_LastHiterTick:=GetTickCount();
  if m_ExpHitter = nil then begin
    m_ExpHitter:=BaseObject;
    m_ExpHitterTick:=GetTickCount();
  end else begin
    if m_ExpHitter = BaseObject then
      m_ExpHitterTick:=GetTickCount();
  end;
end;

procedure TBaseObject.SetPKFlag(BaseObject: TBaseObject); //004BC7BC
begin
  if (PKLevel < 2) and
     (BaseObject.PKLevel < 2) and
     (not m_PEnvir.Flag.boFightZone) and
     (not m_PEnvir.Flag.boFight3Zone) and
     (not m_boPKFlag) then begin

    BaseObject.m_dwPKTick:=GetTickCount();
    if not BaseObject.m_boPKFlag then begin
      BaseObject.m_boPKFlag:=True;
      BaseObject.RefNameColor();
    end;
  end;
end;



procedure TBaseObject.sub_4BC87C; //004BC87C
var
  I: Integer;
begin
  for I := 0 to LIst_3EC.Count - 1 do begin

  end;
  LIst_3EC.Clear;
end;

function TBaseObject.IsGoodKilling(cert: TBaseObject): Boolean; //004BC8D8
begin
  Result:=False;
  if cert.m_boPKFlag then Result:=True;
end;

//004C880C 0FFFF6
function TBaseObject.IsProtectTarget(BaseObject:TBaseObject): boolean;
begin
  Result:=True;
  if BaseObject = nil then exit;
  if (InSafeZone) or (BaseObject.InSafeZone) then Result:=False;
  if not BaseObject.m_boInFreePKArea then begin
    //新人保护
    if g_Config.boPKLevelProtect then begin
      if (m_Abil.Level > g_Config.nPKProtectLevel) then begin //如果大于指定等级
        if not BaseObject.m_boPKFlag and (BaseObject.m_Abil.Level <= g_Config.nPKProtectLevel) and (BaseObject.PKLevel < 2) then begin
          //被攻击的人物小指定等级没有红名，则不可以攻击。
          Result:=False;
          exit;
        end;
      end;
      if (m_Abil.Level <= g_Config.nPKProtectLevel) then begin //如果小于指定等级
        if not BaseObject.m_boPKFlag and (BaseObject.m_Abil.Level > g_Config.nPKProtectLevel) and (BaseObject.PKLevel < 2) then begin
          Result:=False;
          exit;
        end;
      end;
        
    end;
      


    {
    //大于指定级别的红名人物不可以杀指定级别未红名的人物。
    if (PKLevel >= 2) and (m_Abil.Level > 10) then begin
      if (BaseObject.m_Abil.Level <= 10) and (BaseObject.PKLevel < 2) then begin
        Result:=False;
        exit;
      end;
    end;

    //小于指定级别的非红名人物不可以杀指定级别红名人物。
    if (m_Abil.Level <= 10) and (PKLevel < 2) then begin
      if (BaseObject.PKLevel >= 2) and (BaseObject.m_Abil.Level > 10) then begin
        Result:=False;
        exit;
      end;
    end;
    }
    //大于指定级别的红名人物不可以杀指定级别未红名的人物。
    if (PKLevel >= 2) and (m_Abil.Level > g_Config.nRedPKProtectLevel) then begin
      if (BaseObject.m_Abil.Level <= g_Config.nRedPKProtectLevel) and (BaseObject.PKLevel < 2) then begin
        Result:=False;
        exit;
      end;
    end;

    //小于指定级别的非红名人物不可以杀指定级别红名人物。
    if (m_Abil.Level <= g_Config.nRedPKProtectLevel) and (PKLevel < 2) then begin
      if (BaseObject.PKLevel >= 2) and (BaseObject.m_Abil.Level > g_Config.nRedPKProtectLevel) then begin
        Result:=False;
        exit;
      end;
    end;

    if (GetTickCount - m_dwMapMoveTick < 3000) or (GetTickCount - BaseObject.m_dwMapMoveTick < 3000) then
      Result:=False;
  end;
end;

function TBaseObject.IsAttackTarget(BaseObject:TBaseObject): boolean; //004C89D0 0FFFF5
  function sub_4C88E4():Boolean;
  begin
    Result:=True;
  end;
var
  I:Integer;
begin
  Result:=False;
  if (BaseObject = nil) or (BaseObject = Self) then exit;
  if m_btRaceServer >= RC_ANIMAL{50} then begin
    if m_Master <> nil then begin
      if (m_Master.m_LastHiter = BaseObject) or
         (m_Master.m_ExpHitter = BaseObject) or
         (m_Master.m_TargetCret = BaseObject) then Result:=True;
      if BaseObject.m_TargetCret <> nil then begin
        if (BaseObject.m_TargetCret = m_Master) or
           (BaseObject.m_TargetCret.m_Master = m_Master) and
           (BaseObject.m_btRaceServer <> RC_PLAYOBJECT) then
          Result:=True;
      end; //004C8AB3
      if (BaseObject.m_TargetCret = Self) and (BaseObject.m_btRaceServer >= RC_ANIMAL) then
        Result:=True;
      //004C8AD1
      if BaseObject.m_Master <> nil then begin
        if (BaseObject.m_Master = m_Master.m_LastHiter) or (BaseObject.m_Master = m_Master.m_TargetCret) then
          Result:=True;
      end;//004C8B15
      if BaseObject.m_Master = m_Master then Result:=False;
      if BaseObject.m_boHolySeize then Result:=False;
      if m_Master.m_boSlaveRelax then Result:=False;
      if BaseObject.m_btRaceServer = RC_PLAYOBJECT then begin
        //if (m_Master.InSafeZone) or (BaseObject.InSafeZone) then begin
        if BaseObject.InSafeZone then
          Result:=False;  //004C8B6B
      end;
      BreakCrazyMode();
    end else begin  //004C8B79
      if BaseObject.m_btRaceServer = RC_PLAYOBJECT then Result:=True;
      if (m_btRaceServer > RC_PEACENPC{15}) and (m_btRaceServer < RC_ANIMAL{50}) then
        Result:=True;
      if BaseObject.m_Master <> nil then Result:=True;
    end; //004C8BB5
    if m_boCrazyMode and ((BaseObject.m_btRaceServer = RC_PLAYOBJECT) or (BaseObject.m_btRaceServer > RC_PEACENPC)) then Result:=True;
    if m_boNastyMode and ((BaseObject.m_btRaceServer < RC_NPC) or (BaseObject.m_btRaceServer > RC_PEACENPC)) then Result:=True;
  end else begin //004C8BCE
    if m_btRaceServer = RC_PLAYOBJECT then begin
      case m_btAttatckMode of    //
        HAM_ALL{0}: begin
          if (BaseObject.m_btRaceServer < RC_NPC{10}) or (BaseObject.m_btRaceServer > RC_PEACENPC{15})then
            Result:=True;
          if g_Config.boNonPKServer then
            Result:=sub_4C88E4();
        end;
        HAM_PEACE{1}: begin
          if BaseObject.m_btRaceServer >= RC_ANIMAL then
            Result:=True;
        end;
        HAM_DEAR: begin
          if BaseObject <> TPlayObject(Self).m_DearHuman then begin
            Result:=True;
          end;
        end;
        HAM_MASTER: begin
          if BaseObject.m_btRaceServer = RC_PLAYOBJECT then begin
            Result:=True;
            if TPlayObject(Self).m_boMaster then begin
              for I := 0 to TPlayObject(Self).m_MasterList.Count - 1 do begin
                if TPlayObject(Self).m_MasterList.Items[I] = BaseObject then begin
                  Result:=False;
                  break;
                end;
              end;
            end;
            if TPlayObject(BaseObject).m_boMaster then begin
              for I := 0 to TPlayObject(BaseObject).m_MasterList.Count - 1 do begin
                if TPlayObject(BaseObject).m_MasterList.Items[I] = Self then begin
                  Result:=False;
                  break;
                end;
              end;
            end;
          end else Result:=True;
        end;
        HAM_GROUP{2}: begin
          if (BaseObject.m_btRaceServer < RC_NPC) or (BaseObject.m_btRaceServer > RC_PEACENPC) then
            Result:=True;
          if BaseObject.m_btRaceServer = RC_PLAYOBJECT then
            if IsGroupMember (BaseObject) then
              Result:=False;
          if g_Config.boNonPKServer then
            Result:=sub_4C88E4();
        end;
        HAM_GUILD{3}: begin
          if (BaseObject.m_btRaceServer < RC_NPC) or (BaseObject.m_btRaceServer > RC_PEACENPC) then
            Result:=True;
          if BaseObject.m_btRaceServer = RC_PLAYOBJECT then
            if m_MyGuild <> nil then begin
              if TGuild(m_MyGuild).IsMember(BaseObject.m_sCharName) then
                Result:=False;
              if m_boGuildWarArea and (BaseObject.m_MyGuild <> nil) then begin
                if TGuild(m_MyGuild).IsAllyGuild(TGuild(BaseObject.m_MyGuild)) then
                  Result:=False;
              end;
            end;
          if g_Config.boNonPKServer then
            Result:=sub_4C88E4();
        end;
      HAM_PKATTACK{4}: begin
          if (BaseObject.m_btRaceServer < RC_NPC) or (BaseObject.m_btRaceServer > RC_PEACENPC) then
            Result:=True;
          if BaseObject.m_btRaceServer = RC_PLAYOBJECT then
            if PKLevel >= 2 then begin
              if BaseObject.PKLevel < 2 then
                Result:=True
              else Result:=False;
          end else begin
            if BaseObject.PKLevel >= 2 then
              Result:=True
            else Result:=False;
          end;
          if g_Config.boNonPKServer then
            Result:=sub_4C88E4();
        end;
      end;
    end else Result:= True;
  end; //004C8DF0
  if BaseObject.m_boAdminMode or BaseObject.m_boStoneMode then
    Result:=False;
end;

function TBaseObject.IsProperTarget(BaseObject:TBaseObject):Boolean; //004C8E30 0FFFF4
begin
  Result:=IsAttackTarget(BaseObject); //0FFFF5
  if Result then begin
    if (m_btRaceServer = RC_PLAYOBJECT) and (BaseObject.m_btRaceServer = RC_PLAYOBJECT) then begin
      Result:=IsProtectTarget(BaseObject); //0FFFF6
    end;
  end;
  if (BaseObject <> nil) and
     (m_btRaceServer = RC_PLAYOBJECT) and
     (BaseObject.m_Master <> nil) and
     (BaseObject.m_btRaceServer <> RC_PLAYOBJECT) then begin
    if BaseObject.m_Master = Self then begin
      if m_btAttatckMode <> HAM_ALL{0} then Result:=False;
    end else begin
      Result:=IsAttackTarget(BaseObject.m_Master);
      if InSafeZone or BaseObject.InSafeZone then Result:=False;
    end;      
  end;
end;

procedure TBaseObject.WeightChanged; //004C49BC
begin
  m_WAbil.Weight:=RecalcBagWeight();
  SendUpdateMsg(Self,RM_WEIGHTCHANGED,0,0,0,0,'');
end;

function TBaseObject.InSafeZone: Boolean; //004BEE20
var
  I: Integer;
  sMapName:String;
  StartPoint:pTStartPoint;
begin
  Result:=m_PEnvir.Flag.boSAFE;
  if Result then exit;
  if (m_PEnvir.sMapName <> g_Config.sRedHomeMap) or
     (abs(m_nCurrX - g_Config.nRedHomeX) > g_Config.nSafeZoneSize) or
     (abs(m_nCurrY - g_Config.nRedHomeY) > g_Config.nSafeZoneSize) then begin
    Result:=False;
  end else begin //004BEE98
    Result:=True;
  end;

  g_StartPoint.Lock;
  try
    for I := 0 to g_StartPoint.Count - 1 do begin
      StartPoint:=g_StartPoint.Items[I];
      if StartPoint.Envir = m_PEnvir then begin
        if (abs(m_nCurrX - StartPoint.nX) <= g_Config.nSafeZoneSize) and (abs(m_nCurrY - StartPoint.nY) <= g_Config.nSafeZoneSize) then begin
          Result:=True;
          break;
        end;
      end;
    end;
  finally
    g_StartPoint.UnLock;
  end;
end;

function TBaseObject.InSafeZone(Envir: TEnvirnoment; nX,
  nY: Integer): Boolean;
var
  I,nSafePoint: Integer;
  sMapName:String;
  StartPoint:pTStartPoint;
begin
  Result:=Envir.Flag.boSAFE;
  if Result then exit;
  if (Envir.sMapName <> g_Config.sRedHomeMap) or
     (abs(nX - g_Config.nRedHomeX) > g_Config.nSafeZoneSize) or
     (abs(nY - g_Config.nRedHomeY) > g_Config.nSafeZoneSize) then begin
    Result:=False;
  end else begin //004BEE98
    Result:=True;
  end;
  if Result then exit;

  try
    g_StartPoint.Lock;
    for I := 0 to g_StartPoint.Count - 1 do begin
      StartPoint:=g_StartPoint.Items[I];
      if StartPoint.Envir = m_PEnvir then begin
        if (abs(nX - StartPoint.nX) <= g_Config.nSafeZoneSize) and (abs(nY - StartPoint.nY) <= g_Config.nSafeZoneSize) then begin
          Result:=True;
          break;
        end;
      end;
    end;
  finally
    g_StartPoint.UnLock;
  end;
end;

//004BDBBC
procedure TBaseObject.OpenHolySeizeMode(dwInterval:LongWord);
begin
  m_boHolySeize:=True;
  m_dwHolySeizeTick:=GetTickCount();
  m_dwHolySeizeInterval:=dwInterval;
  RefNameColor();
end;
//004BDBF8
procedure TBaseObject.BreakHolySeizeMode;
begin
  m_boHolySeize:=False;
  RefNameColor();
end;

procedure TBaseObject.OpenCrazyMode(nTime:Integer); //004BDC14
begin
  m_boCrazyMode:=True;
  m_dwCrazyModeTick:=GetTickCount();
  m_dwCrazyModeInterval:=nTime * 1000;
  RefNameColor();
end;

procedure TBaseObject.BreakCrazyMode;  //004BDC54
begin
  if m_boCrazyMode then begin
    m_boCrazyMode:=False;
    RefNameColor();
  end;
end;

procedure TBaseObject.LeaveGroup; //004C3B70
ResourceString
  sExitGropMsg = '%s is out from group.';
begin
  SendGroupText(format(sExitGropMsg,[m_sCharName]));
  m_GroupOwner:=nil;
  SendMsg(Self,RM_GROUPCANCEL,0,0,0,0,'');
end;

function TBaseObject.GetMagicInfo(nMagicID: Integer): pTUserMagic; //004CBC7C
var
  I: Integer;
  UserMagic:pTUserMagic;
begin
  Result:=nil;
  for I := 0 to m_MagicList.Count - 1 do begin
    UserMagic:=m_MagicList.Items[i];
    if UserMagic.MagicInfo.wMagicId = nMagicID then begin
      Result:=UserMagic;
      break;
    end;
  end;
end;


//004C1268
procedure TBaseObject.TrainSkill(UserMagic: pTUserMagic;
  nTranPoint: Integer);
begin
  if m_boFastTrain then
    nTranPoint:=nTranPoint * 3;
  Inc(UserMagic.nTranPoint,nTranPoint);
end;

function TBaseObject.CheckMagicLevelup(UserMagic: pTUserMagic): Boolean; //004C7054
var
  n10:Integer;
begin
  Result:=False;
  if (UserMagic.btLevel < 4) and (UserMagic.MagicInfo.btTrainLv >= UserMagic.btLevel) then
    n10:=UserMagic.btLevel
  else n10:=0;
  
  if (UserMagic.MagicInfo.btTrainLv > UserMagic.btLevel) and
     (UserMagic.MagicInfo.MaxTrain[n10] <= UserMagic.nTranPoint) then begin

    if (UserMagic.MagicInfo.btTrainLv > UserMagic.btLevel) then begin
      Dec(UserMagic.nTranPoint,UserMagic.MagicInfo.MaxTrain[n10]);
      Inc(UserMagic.btLevel);
      SendUpdateDelayMsg(Self,RM_MAGIC_LVEXP,0,UserMagic.MagicInfo.wMagicId,UserMagic.btLevel,UserMagic.nTranPoint,'',800);
      sub_4C713C(UserMagic);
    end else begin
      UserMagic.nTranPoint:=UserMagic.MagicInfo.MaxTrain[n10];
    end;
    Result:=True;
  end; //004C7132    
end;


//004C914C
procedure TBaseObject.SetTargetCreat(BaseObject: TBaseObject);
begin
	m_TargetCret:=BaseObject;
	m_dwTargetFocusTick:=GetTickCount();
end;

procedure TBaseObject.DelTargetCreat();//004C9178
begin
  m_TargetCret:=nil;
end;

procedure TBaseObject.RecallSlave(sSlaveName:String);
var
  i,nX,nY,nFlag:Integer;
begin
  nFlag:=-1;
  GetFrontPosition(nX,nY);

  if sSlaveName = g_Config.sDragon then nFlag := 1;

  for i:=m_SlaveList.Count -1 downto 0 do begin
    if nFlag = 1 then begin
      if ((TBaseObject(m_SlaveList.Items[i]).m_sCharName = g_Config.sDragon) or
        (TBaseObject(m_SlaveList.Items[i]).m_sCharName = g_Config.sDragon1)) then begin
        TBaseObject(m_SlaveList.Items[i]).SpaceMove(m_PEnvir.sMapName, nX, nY, 1);
        Break;
      end;
    end else if (TBaseObject(m_SlaveList.Items[i]).m_sCharName = sSlaveName) then begin
      TBaseObject(m_SlaveList.Items[i]).SpaceMove(m_PEnvir.sMapName, nX, nY, 1);
      Break;
    end;
  end;
end;

function TBaseObject._Attack(var wHitMode: Word;  AttackTarget: TBaseObject): Boolean;//004C1EF4
  //攻击角色
  function DirectAttack(BaseObject:TBaseObject;nSecPwr:Integer):Boolean; //004C1B04
  begin
    Result:=False;
    if (m_btRaceServer = RC_PLAYOBJECT) or
       (BaseObject.m_btRaceServer = RC_PLAYOBJECT) or
       not (InSafeZone and BaseObject.InSafeZone)then begin
      if IsProperTarget(BaseObject) then begin
        if Random(BaseObject.m_btSpeedPoint) < m_btHitPoint then begin
          BaseObject.StruckDamage(nSecPwr);
          BaseObject.SendDelayMsg(TBaseObject(RM_STRUCK),
                                RM_10101,
                                nSecPwr,
                                BaseObject.m_WAbil.HP,
                                BaseObject.m_WAbil.MaxHP,
                                Integer(Self),
                                '',500);
          if BaseObject.m_btRaceServer <> RC_PLAYOBJECT then begin
            BaseObject.SendMsg(BaseObject,
                             RM_STRUCK,
                                nSecPwr,
                                BaseObject.m_WAbil.HP,
                                BaseObject.m_WAbil.MaxHP,
                                Integer(Self),
                                '');
          end;
          Result:=True;
        end;
      end;
    end;

  end;
  //刺杀前面一个位置的攻击
  function SwordLongAttack(nSecPwr:Integer):Boolean;  //004C1C24
  var
    nX,nY:Integer;
    BaseObject:TBaseObject;
  begin
    Result:=False;
    //Result:=g_boNotLimitSwordLong;
    nSecPwr:=ROUND(nSecPwr * g_Config.nSwordLongPowerRate / 100);
    if m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,m_btDirection,2,nX,nY) then begin
      BaseObject:=m_PEnvir.GetMovingObject(nX,nY,True);
      if BaseObject <> nil then begin
        if (nSecPwr > 0) and IsProperTarget(BaseObject) then begin
          Result:=DirectAttack(BaseObject,nSecPwr);
          SetTargetCreat(BaseObject);
        end;
        Result:=True;
      end;
    end;
  end;
  //半月攻击
  function SwordWideAttack(nSecPwr:Integer):Boolean;  //004C1CDC
  var
    nC,n10:Integer;
    nX,nY:Integer;
    BaseObject:TBaseObject;
  begin
    Result:=False;
    nC:=0;
    while (True) do begin
      n10:=(m_btDirection + g_Config.WideAttack[nC]) mod 8;
      if m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,n10,1,nX,nY) then begin
        BaseObject:=m_PEnvir.GetMovingObject(nX,nY,True);
        if (nSecPwr > 0) and (BaseObject <> nil) and IsProperTarget(BaseObject) then begin
          Result:=DirectAttack(BaseObject,nSecPwr);
          SetTargetCreat(BaseObject);
        end;
      end;
      Inc(nC);
      if nC >= 3 then break;
    end;    
  end;

  function CrsWideAttack(nSecPwr:Integer):Boolean;  
  var
    nC,n10:Integer;
    nX,nY:Integer;
    BaseObject:TBaseObject;
  begin
    Result:=False;
    nC:=0;
    while (True) do begin
      n10:=(m_btDirection + g_Config.CrsAttack[nC]) mod 8;
      if m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,n10,1,nX,nY) then begin
        BaseObject:=m_PEnvir.GetMovingObject(nX,nY,True);
        if (nSecPwr > 0) and (BaseObject <> nil) and IsProperTarget(BaseObject) then begin
          Result:=DirectAttack(BaseObject,nSecPwr);
          SetTargetCreat(BaseObject);
        end;
      end;
      Inc(nC);
      if nC >= 7 then break;
    end;    
  end;
  
  procedure sub_4C1E5C(nSecPwr:Integer);  //004C1E5C
  var
    btDir:Byte;
    nX,nY:Integer;
    BaseObject:TBaseObject;
    procedure sub_4C1DC0();
    begin
      if m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,btDir,1,nX,nY) then begin
        BaseObject:=m_PEnvir.GetMovingObject(nX,nY,True);
        if (nSecPwr > 0) and (BaseObject <> nil) then begin
          Result:=DirectAttack(BaseObject,nSecPwr);
        end;
      end;
    end;
  begin
    Result:=False;
    btDir:=m_btDirection;
    m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,btDir,1,nX,nY);
    sub_4C1DC0();
    btDir:=sub_4B2F80(m_btDirection,2);
    sub_4C1DC0();
    btDir:=sub_4B2F80(m_btDirection,6);
    sub_4C1DC0();
  end;
var
  nPower,nSecPwr,nWeaponDamage:Integer;
  bo21:Boolean;
  n20:Integer;
  nCheckCode:Integer;
ResourceString
  sExceptionMsg = '[Exception] TBaseObject::_Attack Name:= %s Code:=%d';
begin
  Result:=False;
  nCheckCode:=0;
try
  bo21:=False;
  nWeaponDamage:=0;
  nPower:=0;
  nSecPwr:=0;
  if AttackTarget <> nil then begin
    nPower:=GetAttackPower(LoWord(m_WAbil.DC),SmallInt((HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC))));
    if (wHitMode = 3) and m_boPowerHit then begin
      m_boPowerHit:=False;
      Inc(nPower,m_nHitPlus);
      bo21:=True;
    end;
    if (wHitMode = 7) and m_boFireHitSkill then begin //烈火剑法
      m_boFireHitSkill:=False;
      m_dwLatestFireHitTick:=GetTickCount(); //Jacky 禁止双烈火
      nPower:=nPower + ROUND(nPower / 100 * (m_nHitDouble * 10));
      bo21:=True;
    end;
    if (wHitMode = 9) and m_boTwinHitSkill then begin //烈火剑法
      m_boTwinHitSkill:=False;
      m_dwLatestTwinHitTick:=GetTickCount(); //Jacky 禁止双烈火
      nPower:=nPower + ROUND(nPower / 100 * (m_nHitDouble * 10));
      bo21:=True;
    end;
  end else begin
    nPower:=GetAttackPower(LoWord(m_WAbil.DC),SmallInt((HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC))));
    if (wHitMode = 3) and m_boPowerHit then begin
      m_boPowerHit:=False;
      Inc(nPower,m_nHitPlus);
      bo21:=True;
    end;
    //Jacky 防止砍空刀刀烈火
    if (wHitMode = 7) and m_boFireHitSkill then begin
      m_boFireHitSkill:=False;
      m_dwLatestFireHitTick:=GetTickCount(); //Jacky 禁止双烈火
    end;

    if (wHitMode = 9) and m_boTwinHitSkill then begin
      m_boTwinHitSkill:=False;
      m_dwLatestTwinHitTick:=GetTickCount(); //Jacky 禁止双烈火
    end;
    //
  end;
  nCheckCode:=1;
  if (wHitMode = 4) then begin //004C205A 刺杀
    nSecPwr:=0;
    if m_btRaceServer = RC_PLAYOBJECT then begin
      nCheckCode:=11;
      if m_MagicErgumSkill <> nil then begin
        nCheckCode:=12;
        nSecPwr:=ROUND(nPower / (m_MagicErgumSkill.MagicInfo.btTrainLv + 2) * (m_MagicErgumSkill.btLevel + 2));
        nCheckCode:=13;
      end;
    end else nSecPwr:=nSecPwr;
    if nSecPwr > 0 then begin
      nCheckCode:=110;
      if not SwordLongAttack(nSecPwr) and g_Config.boLimitSwordLong then wHitMode:=0;
      nCheckCode:=111;
    end;
  end;
  nCheckCode:=2;
  if (wHitMode = 5) then begin
    nSecPwr:=0;
    if m_btRaceServer = RC_PLAYOBJECT then begin
      if m_MagicBanwolSkill <> nil then begin
        nSecPwr:=ROUND(nPower / (m_MagicBanwolSkill.MagicInfo.btTrainLv + 10) * (m_MagicBanwolSkill.btLevel + 2));
      end;
    end else nSecPwr:=nSecPwr;
    if nSecPwr > 0 then SwordWideAttack(nSecPwr);
  end;
  if (wHitMode = 12) then begin
    nSecPwr:=0;
    if m_btRaceServer = RC_PLAYOBJECT then begin
      if m_MagicRedBanwolSkill <> nil then begin
        nSecPwr:=ROUND(nPower / (m_MagicRedBanwolSkill.MagicInfo.btTrainLv + 10) * (m_MagicRedBanwolSkill.btLevel + 2));
      end;
    end else nSecPwr:=nSecPwr;
    if nSecPwr > 0 then SwordWideAttack(nSecPwr);
  end;
  nCheckCode:=3;
  if (wHitMode = 6) then begin
    nSecPwr:=0;
    if m_btRaceServer = RC_PLAYOBJECT then begin
    end else nSecPwr:=nSecPwr;
    if nSecPwr > 0 then sub_4C1E5C(nSecPwr);
  end;
  if (wHitMode = 8) then begin
    nSecPwr:=0;
    if m_btRaceServer = RC_PLAYOBJECT then begin
      if m_MagicCrsSkill <> nil then begin
        nSecPwr:=ROUND(nPower / (m_MagicCrsSkill.MagicInfo.btTrainLv + 10) * (m_MagicCrsSkill.btLevel + 2));
      end;
    end else nSecPwr:=nSecPwr;
    if nSecPwr > 0 then CrsWideAttack(nSecPwr);
  end;


  if AttackTarget = nil then exit; //004C218D


  nCheckCode:=4;
  if IsProperTarget{0FFF4}(AttackTarget) then begin
    nCheckCode:=41;
    if AttackTarget.m_btHitPoint > 0 then begin
      if (m_btHitPoint < Random(AttackTarget.m_btSpeedPoint)) then begin
        nCheckCode:=42;
        nPower:=0;
      end;
    end;
    nCheckCode:=43;
  end else nPower:=0;
  nCheckCode:=5;
  if nPower > 0 then begin
    nPower:=AttackTarget.GetHitStruckDamage(Self,nPower);
    nWeaponDamage:=(Random(5) + 2) - m_AddAbil.btWeaponStrong;
  end;
  nCheckCode:=600;
  if nPower > 0 then begin     //004C21FC
    nCheckCode:=601;
    AttackTarget.StruckDamage(nPower);
    nCheckCode:=602;
    AttackTarget.SendDelayMsg(TBaseObject(RM_STRUCK),RM_10101,nPower,AttackTarget.m_WAbil.HP,AttackTarget.m_WAbil.MaxHP,Integer(Self),'',200);
    nCheckCode:=603;
    if not AttackTarget.m_boUnParalysis and m_boParalysis and (Random(AttackTarget.m_btAntiPoison + g_Config.nAttackPosionRate{5}) = 0) then begin
      nCheckCode:=604;
      AttackTarget.MakePosion(POISON_STONE,g_Config.nAttackPosionTime{5},0);
    end;
    nCheckCode:=605;
    //虹魔，吸血
    if m_nHongMoSuite > 0 then begin
      m_db3B0:=nPower / 100 * m_nHongMoSuite;
      if m_db3B0 >= 2.0 then begin
        n20:=TRUNC(m_db3B0);
        m_db3B0:=n20;
        DamageHealth(-n20);
      end;
    end;
    nCheckCode:=606;
    if (m_MagicOneSwordSkill <> nil) and
       (m_btRaceServer = RC_PLAYOBJECT) and
       (m_MagicOneSwordSkill.btLevel < 3) and
       (m_MagicOneSwordSkill.MagicInfo.TrainLevel[m_MagicOneSwordSkill.btLevel] <= m_Abil.Level) then begin
      nCheckCode:=607;
      TPlayObject(Self).TrainSkill(m_MagicOneSwordSkill,Random(3) + 1);
      nCheckCode:=608;
      if not TPlayObject(Self).CheckMagicLevelup(m_MagicOneSwordSkill) then begin
        nCheckCode:=609;
        SendDelayMsg(Self,RM_MAGIC_LVEXP,0,m_MagicOneSwordSkill.MagicInfo.wMagicId,m_MagicOneSwordSkill.btLevel,m_MagicOneSwordSkill.nTranPoint,'',3000);
      end;
      nCheckCode:=610;
    end;
    if bo21 and (m_MagicPowerHitSkill <> nil) and
      (m_btRaceServer = RC_PLAYOBJECT) and
      (m_MagicPowerHitSkill.btLevel < 3) and
      (m_MagicPowerHitSkill.MagicInfo.TrainLevel[m_MagicPowerHitSkill.btLevel] <= m_Abil.Level) then begin
      nCheckCode:=611;
      TPlayObject(Self).TrainSkill(m_MagicPowerHitSkill,Random(3) + 1);
      nCheckCode:=612;
      if not TPlayObject(Self).CheckMagicLevelup(m_MagicPowerHitSkill) then begin
        nCheckCode:=613;
        SendDelayMsg(Self,RM_MAGIC_LVEXP,0,m_MagicPowerHitSkill.MagicInfo.wMagicId,m_MagicPowerHitSkill.btLevel,m_MagicPowerHitSkill.nTranPoint,'',3000);
      end;
      nCheckCode:=614;
    end;
    nCheckCode:=6;
    if (wHitMode = 4) and (m_MagicErgumSkill <> nil) and
       (m_btRaceServer = RC_PLAYOBJECT) and
       (m_MagicErgumSkill.btLevel < 3) and
       (m_MagicErgumSkill.MagicInfo.TrainLevel[m_MagicErgumSkill.btLevel] <= m_Abil.Level) then begin
      nCheckCode:=61;
      TPlayObject(Self).TrainSkill(m_MagicErgumSkill, 1);
      nCheckCode:=62;
      if not TPlayObject(Self).CheckMagicLevelup(m_MagicErgumSkill) then begin
        nCheckCode:=63;
        SendDelayMsg(Self,RM_MAGIC_LVEXP,0,m_MagicErgumSkill.MagicInfo.wMagicId,m_MagicErgumSkill.btLevel,m_MagicErgumSkill.nTranPoint,'',3000);
      end;
    end;
    nCheckCode:=7;
    if (wHitMode = 5) and (m_MagicBanwolSkill <> nil) and
       (m_btRaceServer = RC_PLAYOBJECT) and
       (m_MagicBanwolSkill.btLevel < 3) and
       (m_MagicBanwolSkill.MagicInfo.TrainLevel[m_MagicBanwolSkill.btLevel] <= m_Abil.Level) then begin

      TPlayObject(Self).TrainSkill(m_MagicBanwolSkill,1);
      if not TPlayObject(Self).CheckMagicLevelup(m_MagicBanwolSkill) then begin
        SendDelayMsg(Self,RM_MAGIC_LVEXP,0,m_MagicBanwolSkill.MagicInfo.wMagicId,m_MagicBanwolSkill.btLevel,m_MagicBanwolSkill.nTranPoint,'',3000);
      end;
    end;
    if (wHitMode = 12) and (m_MagicRedBanwolSkill <> nil) and
       (m_btRaceServer = RC_PLAYOBJECT) and
       (m_MagicRedBanwolSkill.btLevel < 3) and
       (m_MagicRedBanwolSkill.MagicInfo.TrainLevel[m_MagicRedBanwolSkill.btLevel] <= m_Abil.Level) then begin

      TPlayObject(Self).TrainSkill(m_MagicRedBanwolSkill,1);
      if not TPlayObject(Self).CheckMagicLevelup(m_MagicRedBanwolSkill) then begin
        SendDelayMsg(Self,RM_MAGIC_LVEXP,0,m_MagicRedBanwolSkill.MagicInfo.wMagicId,m_MagicRedBanwolSkill.btLevel,m_MagicRedBanwolSkill.nTranPoint,'',3000);
      end;
    end;
    nCheckCode:=8;
    if (wHitMode = 7) and (m_MagicFireSwordSkill <> nil) and
       (m_btRaceServer = RC_PLAYOBJECT) and
       (m_MagicFireSwordSkill.btLevel < 3) and
       (m_MagicFireSwordSkill.MagicInfo.TrainLevel[m_MagicFireSwordSkill.btLevel] <= m_Abil.Level) then begin

      TPlayObject(Self).TrainSkill(m_MagicFireSwordSkill, 1);
      if not TPlayObject(Self).CheckMagicLevelup(m_MagicFireSwordSkill) then begin
        SendDelayMsg(Self,RM_MAGIC_LVEXP,0,m_MagicFireSwordSkill.MagicInfo.wMagicId,m_MagicFireSwordSkill.btLevel,m_MagicFireSwordSkill.nTranPoint,'',3000);
      end;
    end;

    if (wHitMode = 8) and (m_MagicCrsSkill <> nil) and
       (m_btRaceServer = RC_PLAYOBJECT) and
       (m_MagicCrsSkill.btLevel < 3) and
       (m_MagicCrsSkill.MagicInfo.TrainLevel[m_MagicCrsSkill.btLevel] <= m_Abil.Level) then begin

      TPlayObject(Self).TrainSkill(m_MagicCrsSkill, 1);
      if not TPlayObject(Self).CheckMagicLevelup(m_MagicCrsSkill) then begin
        SendDelayMsg(Self,RM_MAGIC_LVEXP,0,m_MagicCrsSkill.MagicInfo.wMagicId,m_MagicCrsSkill.btLevel,m_MagicCrsSkill.nTranPoint,'',3000);
      end;
    end;

    if (wHitMode = 9) and (m_MagicTwnHitSkill <> nil) and
       (m_btRaceServer = RC_PLAYOBJECT) and
       (m_MagicTwnHitSkill.btLevel < 3) and
       (m_MagicTwnHitSkill.MagicInfo.TrainLevel[m_MagicTwnHitSkill.btLevel] <= m_Abil.Level) then begin

      TPlayObject(Self).TrainSkill(m_MagicTwnHitSkill, 1);
      if not TPlayObject(Self).CheckMagicLevelup(m_MagicTwnHitSkill) then begin
        SendDelayMsg(Self,RM_MAGIC_LVEXP,0,m_MagicTwnHitSkill.MagicInfo.wMagicId,m_MagicTwnHitSkill.btLevel,m_MagicTwnHitSkill.nTranPoint,'',3000);
      end;
    end;

    Result:=True;
  end; //004C270C
  nCheckCode:=9;
  if (nWeaponDamage > 0) and (m_UseItems[U_WEAPON].wIndex > 0) then
    DoDamageWeapon(nWeaponDamage);
  if AttackTarget.m_btRaceServer <> RC_PLAYOBJECT then
    AttackTarget.SendMsg(AttackTarget,RM_STRUCK,nPower,AttackTarget.m_WAbil.HP,AttackTarget.m_WAbil.MaxHP,Integer(Self),'');
except
  on e: Exception do begin
    MainOutMessage(format(sExceptionMsg,[m_sCharName,nCheckCode]));
    MainOutMessage(E.Message);
  end;
end;
end;

procedure TBaseObject.SendAttackMsg(wIdent: Word; btDir: Byte; nX,nY: Integer);//004C2E0C
begin
  SendRefMsg(wIdent,btDir,nX,nY,0,'');
end;

function TBaseObject.GetHitStruckDamage(Target:TBaseObject;nDamage: integer): Integer; //004BDD20
var
  nArmor,nRnd:Integer;
begin
  nRnd:=((HiWord(m_WAbil.AC) - LoWord(m_WAbil.AC)) + 1);
	if (nRnd > 0) then
		nArmor:=LoWord(m_WAbil.AC) + (Random(nRnd))
	else
		nArmor:=LoWord(m_WAbil.AC);

	nDamage:=_MAX(0, nDamage - nArmor);

  if (nDamage > 0) then begin
	  if (m_btLifeAttrib = LA_UNDEAD) and (Target <> nil) then begin
      Inc(nDamage,Target.m_AddAbil.btUndead);
    end;
    if m_boAbilMagBubbleDefence then begin
      nDamage:=ROUND((nDamage / 1.0e2) * (m_btMagBubbleDefenceLevel + 2) * 8.0);
      DamageBubbleDefence(nDamage);
    end;
  end;
	Result:=nDamage;
end;

function TBaseObject.GetMagStruckDamage(BaseObject:TBaseObject;nDamage: Integer): Integer; //004BDDEC
var
  n14:Integer;
begin
  n14:=LoWord(m_WAbil.MAC) + Random(SmallInt(HiWord(m_WAbil.MAC) - LoWord(m_WAbil.MAC)) + 1);
  nDamage:=_MAX(0,nDamage - n14);
  if (m_btLifeAttrib = LA_UNDEAD) and (BaseObject <> nil) then begin
    Inc(nDamage,m_AddAbil.btUndead);
  end;
  if (nDamage > 0) and m_boAbilMagBubbleDefence then begin
    nDamage:=ROUND((nDamage / 1.0e2) * (m_btMagBubbleDefenceLevel + 2) * 8.0);
    DamageBubbleDefence(nDamage);
  end;

  Result:=nDamage;
end;

//004BDEB8
procedure TBaseObject.StruckDamage(nDamage: integer);
var
  I: Integer;
  nDam:Integer;
  nDura,nOldDura:integer;
  PlayObject:TPlayObject;
  StdItem:TItem;
  bo19:Boolean;
begin
  if nDamage <= 0 then exit;
  nDam:=Random(10) + 5;
  if m_wStatusTimeArr[POISON_DAMAGEARMOR{1 0x62}] > 0 then begin
    nDam:=ROUND(nDam * (g_Config.nPosionDamagarmor / 10){1.2});
    nDamage:=ROUND(nDamage * (g_Config.nPosionDamagarmor / 10){1.2});
  end;
  bo19:=False;
  if m_UseItems[U_DRESS].wIndex > 0 then begin
    nDura:=m_UseItems[U_DRESS].Dura;
    nOldDura:=ROUND(nDura / 1000);
    Dec(nDura,nDam);
    if nDura <= 0 then begin
      if m_btRaceServer = RC_PLAYOBJECT then begin
        PlayObject:=TPlayObject(Self);
        PlayObject.SendDelItems(@m_UseItems[U_DRESS]);
        StdItem:=UserEngine.GetStdItem(m_UseItems[U_DRESS].wIndex);
            //004BE088
        if StdItem.NeedIdentify = 1 then
            AddGameDataLog ('3' + #9 +
                        m_sMapName + #9 +
                        IntToStr(m_nCurrX) + #9 +
                        IntToStr(m_nCurrY) + #9 +
                        m_sCharName + #9 +
                        //UserEngine.GetStdItemName(m_UseItems[U_DRESS].wIndex) + #9 +
                        StdItem.Name + #9 +
                        IntToStr(m_UseItems[U_DRESS].MakeIndex) + #9 +
                        BoolToIntStr(m_btRaceServer = RC_PLAYOBJECT) + #9 +
                        '0');
        m_UseItems[U_DRESS].wIndex:=0;
        FeatureChanged();
      end;
      m_UseItems[U_DRESS].wIndex:=0;
      m_UseItems[U_DRESS].Dura:=0;
      bo19:=True;
    end else begin
      m_UseItems[U_DRESS].Dura:=nDura;
    end;
    if nOldDura <> ROUND(nDura / 1000) then begin
      SendMsg(Self,RM_DURACHANGE,U_DRESS,nDura,m_UseItems[U_DRESS].DuraMax,0,'');
    end;
  end;
  for I := Low(THumanUseItems) to High(THumanUseItems) do  begin
    if (m_UseItems[i].wIndex > 0) and (Random(8) = 0) then begin
      nDura:=m_UseItems[i].Dura;
      nOldDura:=ROUND(nDura / 1000);
      Dec(nDura,nDam);
      if nDura <= 0 then begin
        if m_btRaceServer = RC_PLAYOBJECT then begin
          PlayObject:=TPlayObject(Self);
          PlayObject.SendDelItems(@m_UseItems[i]);
          StdItem:=UserEngine.GetStdItem(m_UseItems[i].wIndex);
            //004BE2B8
          if StdItem.NeedIdentify = 1 then
            AddGameDataLog ('3' + #9 +
                        m_sMapName + #9 +
                        IntToStr(m_nCurrX) + #9 +
                        IntToStr(m_nCurrY) + #9 +
                        m_sCharName + #9 +
                        //UserEngine.GetStdItemName(m_UseItems[i].wIndex) + #9 +
                        StdItem.Name + #9 +
                        IntToStr(m_UseItems[i].MakeIndex) + #9 +
                        BoolToIntStr(m_btRaceServer = RC_PLAYOBJECT) + #9 +
                        '0');
          m_UseItems[i].wIndex:=0;
          FeatureChanged();
        end;
        m_UseItems[i].wIndex:=0;
        m_UseItems[i].Dura:=0;
        bo19:=True;
      end else begin
        m_UseItems[i].Dura:=nDura;
      end;
      if nOldDura <> ROUND(nDura / 1000) then begin
        SendMsg(Self,RM_DURACHANGE,i,nDura,m_UseItems[i].DuraMax,0,'');
      end;
    end;
  end;
  if bo19 then RecalcAbilitys();
  DamageHealth(nDamage);
end;


function TBaseObject.GeTBaseObjectInfo(): String; //004CF87C
begin
  Result:=m_sCharName + ' ' +
          '地图:' + m_sMapName + '(' + m_PEnvir.sMapDesc + ') ' +
          '座标:' + IntToStr(m_nCurrX) + '/' + IntToStr(m_nCurrY) + ' ' +
          '等级:' + IntToStr(m_Abil.Level) + ' ' +
          '经验:' + IntToStr(m_Abil.Exp) + ' ' +
          '生命值: ' + IntToStr(m_WAbil.HP) + '-' + IntToStr(m_WAbil.MaxHP) + ' ' +
          '魔法值: ' + IntToStr(m_WAbil.MP) + '-' + IntToStr(m_WAbil.MaxMP) + ' ' +
          '攻击力: ' + IntToStr(LoWord(m_WAbil.DC)) + '-' + IntToStr(HiWord(m_WAbil.DC)) + ' ' +
          '魔法力: ' + IntToStr(LoWord(m_WAbil.MC)) + '-' + IntToStr(HiWord(m_WAbil.MC)) + ' ' +
          '道术: ' + IntToStr(LoWord(m_WAbil.SC)) + '-' + IntToStr(HiWord(m_WAbil.SC)) + ' ' +
          '防御力: ' + IntToStr(LoWord(m_WAbil.AC)) + '-' + IntToStr(HiWord(m_WAbil.AC)) + ' ' +
          '魔防力: ' + IntToStr(LoWord(m_WAbil.MAC)) + '-' + IntToStr(HiWord(m_WAbil.MAC)) + ' ' +
          '准确:' + IntToStr(m_btHitPoint) + ' ' +
          '敏捷:' + IntToStr(m_btSpeedPoint);
end;


function TBaseObject.GetBackPosition(var nX,nY: Integer): Boolean;     //004B2900
var
  Envir:TEnvirnoment;
begin
  Envir:=m_PEnvir;
  nX:=m_nCurrX;
  nY:=m_nCurrY;
  case m_btDirection of
    DR_UP: if nY < (Envir.Header.wHeight - 1) then Inc(nY);
    DR_DOWN: if nY > 0 then Dec(nY);
    DR_LEFT: if nX < (Envir.Header.wWidth - 1) then Inc(nX);
    DR_RIGHT: if nX > 0 then Dec(nX);
    DR_UPLEFT: begin
      if (nX < (Envir.Header.wWidth - 1)) and (nY < (Envir.Header.wHeight - 1)) then begin
        Inc(nX);
        Inc(nY);
      end;
    end;
    DR_UPRIGHT: begin
      if (nX < (Envir.Header.wWidth - 1)) and (nY > 0) then begin
        Dec(nX);
        Inc(nY);
      end
    end;
    DR_DOWNLEFT: begin
      if (nX > 0) and (nY < (Envir.Header.wHeight - 1)) then begin
        Inc(nX);
        Dec(nY);
      end;
    end;
    DR_DOWNRIGHT: begin
      if (nX > 0) and (nY > 0) then begin
        Dec(nX);
        Dec(nY);
      end;
    end;
   end;
  Result:=True;
end;


function TBaseObject.MakePosion(nType, nTime, nPoint: Integer):Boolean;  //004C35A8
var
  nOldCharStatus:Integer;
begin
  Result:=False;
  if nType < MAX_STATUS_ATTRIBUTE then begin
    nOldCharStatus:=m_nCharStatus;
    if m_wStatusTimeArr[nType] > 0 then begin
      if m_wStatusTimeArr[nType] < nTime then begin
        m_wStatusTimeArr[nType]:=nTime;
      end;
    end else begin //004C35FF
      m_wStatusTimeArr[nType]:=nTime;
    end;
    m_dwStatusArrTick[nType]:=GetTickCount();
    m_nCharStatus:=GetCharStatus();
    m_btGreenPoisoningPoint:=nPoint;
    if nOldCharStatus <> m_nCharStatus then StatusChanged();
    if m_btRaceServer = RC_PLAYOBJECT then
      SysMsg(format(sYouPoisoned,[nTime,nPoint]),c_Red,t_Hint);

    Result:=True;
  end;  //004C366C

end;


function TBaseObject.sub_4DD704: Boolean; //004DD704
var
  I: Integer;
  SendMessage:pTSendMessage;
begin
  Result:=False;
  EnterCriticalSection(ProcessMsgCriticalSection);
  try
    for I := 0 to m_MsgList.Count - 1 do begin
      SendMessage:=m_Msglist.Items[i];
      if SendMessage.wIdent = RM_10401 then begin
        Result:=True;
        break;
      end;        
    end;
  finally
    LeaveCriticalSection(ProcessMsgCriticalSection);
  end;
end;

function TBaseObject.DelBagItem(nIndex: Integer): Boolean; //004C4F10
begin
  Result:=False;
  if (nIndex < 0) or (nIndex >= m_ItemList.Count) then exit;
  Dispose(pTUserItem(m_ItemList.Items[nIndex]));
  m_ItemList.Delete(nIndex);
  Result:=True;
end;

function TBaseObject.DelBagItem(nItemIndex: Integer;//004C4DFC
  sItemName: String): Boolean;
var
  I: Integer;
  UserItem:pTUserItem;
begin
  Result:=False;
  for I := 0 to m_ItemList.Count - 1 do begin
    UserItem:=m_ItemList.Items[I];
    if (UserItem.MakeIndex = nItemIndex) and
       (CompareText(UserEngine.GetStdItemName(UserItem.wIndex),sItemName) = 0) then begin
      Dispose(UserItem);
      m_ItemList.Delete(I);
      Result:=True;
      break;
    end;
  end;
  if Result then WeightChanged();
    
end;


function TBaseObject.sub_4C3538: Integer;//004C3538
var
  nC,n10:Integer;
begin
  Result:=0;
  nC:= -1;
  while (nC <> 2) do  begin
    n10:= -1;
    while (n10 <> 2) do  begin
      if not m_PEnvir.CanWalk(m_nCurrX + nC,m_nCurrY + n10,False) then begin
        if (nC <> 0) or (n10 <> 0) then
          Inc(Result);
      end;
      Inc(n10);
    end;
    Inc(nC);
  end;
end;


function TBaseObject.sub_4C5370(nX, nY:Integer;nRange: Integer;var nDX, nDY:Integer): Boolean; //004C5370
var
  I    :Integer;
  II   :Integer;
  III  :Integer;
begin
  Result:=False;
  if m_PEnvir.GetMovingObject(nX,nY,True) = nil then begin
    Result:=True;
    nDX:=nX;
    nDY:=nY;
  end;
  if not Result then begin
    for I := 1 to nRange do begin
      for II := -I to I do begin
        for III := -I to I do begin
          nDX := nX + III;
          nDY := nY + II;
          if m_PEnvir.GetMovingObject(nDX,nDY,True) = nil then begin
            Result:=True;
            break;
          end;
        end;
        if Result then break;
      end;
      if Result then break;
    end;
  end;
  if not Result then begin
    nDX:=nX;
    nDY:=nY;
  end;    
end;


function TBaseObject.IsTrainingSkill(nIndex: Integer): Boolean; //004C6780
var
  I: Integer;
  UserMagic:pTUserMagic;
begin
  Result:=False;
  for I := 0 to m_MagicList.Count - 1 do begin
    UserMagic:=m_MagicList.Items[i];
    if (UserMagic <> nil) and (UserMagic.wMagIdx = nIndex) then begin
      Result:=True;
      break;
    end;
  end;
end;


function TBaseObject.IsGuildMaster: Boolean; //004BF4A0
begin
  Result:=False;
  if (m_MyGuild <> nil) and (m_nGuildRankNo = 1) then
    Result:=True;
end;


function TBaseObject.MagCanHitTarget(nX, nY:Integer;
  TargeTBaseObject: TBaseObject): Boolean; //004C6B1C
var
  n14,n18,n1C,n20:Integer;
begin
  Result:=False;
  if TargeTBaseObject = nil then exit;
  n20:=abs(nX - TargeTBaseObject.m_nCurrX) + abs(nY - TargeTBaseObject.m_nCurrY);
  n14:=0;
  while (n14 < 13) do begin
    n18:=GetNextDirection(nX,nY,TargeTBaseObject.m_nCurrX,TargeTBaseObject.m_nCurrY);
    if m_PEnvir.GetNextPosition(nX,nY,n18,1,nX,nY) and m_PEnvir.IsValidCell(nX,nY) then begin
      if (nX = TargeTBaseObject.m_nCurrX) and (nY = TargeTBaseObject.m_nCurrY) then begin
        Result:=True;
        break;
      end else begin
        n1C:=abs(nX - TargeTBaseObject.m_nCurrX) + abs(nY - TargeTBaseObject.m_nCurrY);
        if n1C > n20 then begin
          Result:=True;
          break;
        end;
        n1C:=n20;
      end;
    end else begin
      break;
    end;
    Inc(n14);
  end;
end;

function TBaseObject.IsProperFriend(BaseObject: TBaseObject): boolean; //004C909C
  function IsFriend (cret: TBaseObject): Boolean; //004C8F08
  var
    I: Integer;
  begin
    Result:=False;
    if cret.m_btRaceServer = RC_PLAYOBJECT then begin  //措惑捞 荤恩牢 版快父
      case m_btAttatckMode of
        HAM_ALL:  Result:=True;
        HAM_PEACE: Result:=True;
        HAM_DEAR: begin
          if (Self = Cret) or (Cret = TPlayObject(Self).m_DearHuman) then begin
            Result:=True;
          end;            
        end;
        HAM_MASTER: begin
          if (Self = Cret) then begin
            Result:=True;
          end else
          if TPlayObject(Self).m_boMaster then begin
            for I := 0 to TPlayObject(Self).m_MasterList.Count - 1 do begin
              if TPlayObject(Self).m_MasterList.Items[I] = Cret then begin
                Result:=True;
                break;
              end;
            end;
          end else
          if TPlayObject(Cret).m_boMaster then begin
            for I := 0 to TPlayObject(Cret).m_MasterList.Count - 1 do begin
              if TPlayObject(Cret).m_MasterList.Items[I] = Self then begin
                Result:=True;
                break;
              end;
            end;
          end;
        end;
        HAM_GROUP: begin
          if cret = self then
            Result:=True;
          if IsGroupMember(cret)then
            Result:=True;
        end;
        HAM_GUILD: begin
          if cret = self then
            Result:=True;
          if m_MyGuild <> nil then begin
            if TGuild(m_MyGuild).IsMember(cret.m_sCharName) then
              Result:=True;
            if m_boGuildWarArea and (cret.m_MyGuild <> nil) then begin
              if TGuild(m_MyGuild).IsAllyGuild(TGuild(cret.m_MyGuild)) then
                Result:=True;
            end;
          end;
        end;
        HAM_PKATTACK: begin
          if cret = self then Result:=True;
          if PKLevel >= 2 then begin
            if cret.PKLevel < 2 then Result:=True;
          end else begin
            if cret.PKLevel >= 2 then Result:=True;
          end;
        end;
      end;
    end;
  end;
begin //004C909C
  Result:=False;
  if BaseObject = nil then exit;
  if (m_btRaceServer >= RC_ANIMAL) then begin
    if (BaseObject.m_btRaceServer >= RC_ANIMAL) then
      Result:=True;
    if BaseObject.m_Master <> nil then
      Result:=False;
    exit;
  end;
  if m_btRaceServer = RC_PLAYOBJECT then begin
    Result:=IsFriend(BaseObject);
    if BaseObject.m_btRaceServer < RC_ANIMAL then exit;
    if BaseObject.m_Master = self then begin
      Result:=True;
      exit;
    end;
    if BaseObject.m_Master <> nil then begin
      Result:=IsFriend(BaseObject.m_Master);
      exit;
    end;
  end else Result:=True;//004C913E    
end;

function TBaseObject.MagMakeDefenceArea(nX, nY, nRange, nSec: Integer;
  btState: Byte): Integer; //004C6F04
var
  III: Integer;
  I,II: Integer;
  nStartX,nStartY,nEndX,nEndY:Integer;
  MapCellInfo:pTMapCellinfo;
  OSObject:pTOSObject;
  BaseObject:TBaseObject;
begin
  Result:=0;
  nStartX:=nX - nRange;
  nEndX:=nX + nRange;
  nStartY:=nY - nRange;
  nEndY:=nY + nRange;
  for I := nStartX to nEndX do begin
    for II := nStartY to nEndY do begin
      if m_PEnvir.GetMapCellInfo(i,ii,MapCellInfo) and (MapCellInfo.ObjList <> nil) then begin
        for III := 0 to MapCellInfo.ObjList.Count - 1 do begin
          OSObject:=MapCellInfo.ObjList.Items[III];
          if (OSObject <> nil) and (OSObject.btType = OS_MOVINGOBJECT) then begin
            BaseObject:=TBaseObject(OSObject.CellObj);
            if (BaseObject <> nil) and (not BaseObject.m_boGhost) then begin
              if IsProperFriend(BaseObject) then begin
                if btState = 0 then begin
                  BaseObject.DefenceUp(nSec);
                end else begin
                  BaseObject.MagDefenceUp(nSec);
                end;
                Inc(Result);
              end
            end;
          end;
        end;
      end;
    end;
  end;
end;

function TBaseObject.DefenceUp(nSec: Integer): Boolean; //004C6C28
begin
  Result:=False;
  if m_wStatusTimeArr[STATE_DEFENCEUP{0x72}] > 0 then begin  //004C6C5C
    if m_wStatusTimeArr[STATE_DEFENCEUP{0x72}] < nSec then begin
      m_wStatusTimeArr[STATE_DEFENCEUP{0x72}]:=nSec;
      Result:=True;
    end;
  end else begin
    m_wStatusTimeArr[STATE_DEFENCEUP{0x72}]:=nSec;
    Result:=True;
  end;
  m_dwStatusArrTick[STATE_DEFENCEUP{0x20C}]:=GetTickCount;
  SysMsg(format(g_sDefenceUpTime,[nSec]),c_Green,t_Hint);
  //SysMsg('防御力增加' + IntToStr(nSec) + '秒',c_Green,t_Hint);
  RecalcAbilitys();
  SendMsg(Self,RM_ABILITY,0,0,0,0,'');
end;

function TBaseObject.AttPowerUp(nPower, nTime: Integer): Boolean;
var
  nMin,nSec:Integer;
begin
  Result:=False;

  m_wStatusArrValue[0]:=nPower;
  m_dwStatusArrTimeOutTick[0]:=GetTickCount + nTime * 1000;

  nMin := nTime div 60;
  nSec := nTime mod 60;

  SysMsg(format(g_sAttPowerUpTime,[nMin, nSec]),c_Green,t_Hint);
  RecalcAbilitys();
  SendMsg(Self,RM_ABILITY,0,0,0,0,'');
  Result:=True;
end;

function TBaseObject.SCPowerUp(nSec:Integer):Boolean;
begin
  {Result:=False;
  if m_wStatusTimeArr[POISON_6C] <> 0 then exit;
  m_wStatusTimeArr[POISON_6C]:=nSec;
  m_dwStatusArrTick[POISON_6C]:=GetTickCount();

  //SysMsg(format(g_sScPowerDefenceUpTime,[nSec]),c_Green,t_Hint);
  SysMsg('抗魔法力增加 ' + IntToStr(nSec) + ' sec',c_Green,t_Hint);
  RecalcAbilitys();
  SendMsg(Self,RM_ABILITY,0,0,0,0,'');
  Result:=True;}
end;

function TBaseObject.MagDefenceUp(nSec: Integer): Boolean; //004C6D38
begin
  Result:=False;
  if m_wStatusTimeArr[STATE_MAGDEFENCEUP{0x74}] > 0 then begin //004C6D6C
    if m_wStatusTimeArr[STATE_MAGDEFENCEUP{0x74}] < nSec then begin
      m_wStatusTimeArr[STATE_MAGDEFENCEUP{0x74}]:=nSec;
      Result:=True;
    end;
  end else begin
    m_wStatusTimeArr[STATE_MAGDEFENCEUP{0x74}]:=nSec;
    Result:=True;
  end;
  m_dwStatusArrTick[STATE_MAGDEFENCEUP{0x210}]:=GetTickCount;
  SysMsg(format(g_sMagDefenceUpTime,[nSec]),c_Green,t_Hint);
//  SysMsg('抗魔法力增加' + IntToStr(nSec) + '秒',c_Green,t_Hint);
  RecalcAbilitys();
  SendMsg(Self,RM_ABILITY,0,0,0,0,'');
end;

//魔法盾
function TBaseObject.MagBubbleDefenceUp(nLevel, nSec: Integer): Boolean; //004C6E4C
var
  nOldStatus:Integer;
begin
  Result:=False;
  if m_wStatusTimeArr[STATE_BUBBLEDEFENCEUP{0x76}] <> 0 then exit;   //004C6E79
  nOldStatus:=m_nCharStatus;
  m_wStatusTimeArr[STATE_BUBBLEDEFENCEUP{0x76}]:=nSec;
  m_dwStatusArrTick[STATE_BUBBLEDEFENCEUP{0x214}]:=GetTickCount();
  m_nCharStatus:=GetCharStatus();
  if nOldStatus <> m_nCharStatus then begin
    StatusChanged();
  end;
  m_boAbilMagBubbleDefence:=True;
  m_btMagBubbleDefenceLevel:=nLevel;
  Result:=True;
end;


function TBaseObject.sub_4C4CD4(sItemName: String;
  var nCount: Integer): pTUserItem; //004C4CD4
var
  I: Integer;
  sName:String;
begin
  Result:=nil;
  nCount:=0;
  for I := Low(THumanUseItems) to High(THumanUseItems) do begin
    sName:=UserEngine.GetStdItemName(m_UseItems[i].wIndex);
    if CompareText(sName,sItemName) = 0 then begin
      Result:=@m_UseItems[i];
      Inc(nCount);
    end;
  end;
end;


function TBaseObject.CheckItems(sItemName: String): pTUserItem; //004C4AB0
var
  I: Integer;
  UserItem:pTUserItem;
begin
  Result:=nil;
  for I := 0 to m_Itemlist.Count - 1 do begin
    UserItem:=m_ItemList.Items[I];
    if CompareText(UserEngine.GetStdItemName(UserItem.wIndex),sItemName) = 0 then begin
      Result:=UserItem;
      break;
    end;      
  end;    // for
end;


procedure TBaseObject.MapRandomMove(sMapName:String;nInt:Integer);//004BCB54
var
  oEnvir,Envir:TEnvirnoment;
  nX,nY,nEgdey:Integer;
begin
  oEnvir:=m_PEnvir;
  Envir:=g_MapManager.FindMap(sMapName);
  if Envir <> nil then begin
    if Envir.Header.wHeight < 150 then begin
      if Envir.Header.wHeight < 30 then begin
        nEgdey:=2;
      end else nEgdey:=20;
    end else nEgdey:=50;
    nX:=Random(Envir.Header.wWidth - nEgdey -1) + nEgdey;
    nY:=Random(Envir.Header.wHeight - nEgdey -1) + nEgdey;
    SpaceMove(sMapName,nX,nY,nInt);
  end;
end;


procedure TBaseObject.sub_4C713C(Magic:pTUserMagic); //004C713C
begin
  if Magic.MagicInfo.wMagicId = 28 then
    if Magic.btLevel >= 2 then m_boAbilSeeHealGauge:=True;
end;


procedure TBaseObject.UseLamp;//004C759C
var
  nOldDura:Integer;
  nDura:Integer;
  PlayObject:TPlayObject;
  Stditem:TItem;
ResourceString
  sExceptionMsg = '[Exception] TBaseObject::UseLamp';
begin
  try
    if m_UseItems[U_RIGHTHAND].wIndex > 0 then begin
      Stditem:=UserEngine.GetStdItem(m_UseItems[U_RIGHTHAND].wIndex);
      if (Stditem = nil) or (Stditem.Source <> 0) then exit;
        
      nOldDura:=ROUND(m_UseItems[U_RIGHTHAND].Dura / 1000);
      if g_Config.boDecLampDura then begin
        nDura:=m_UseItems[U_RIGHTHAND].Dura - 1;
      end else begin
        nDura:=m_UseItems[U_RIGHTHAND].Dura;
      end;
      if nDura <= 0 then begin
        m_UseItems[U_RIGHTHAND].Dura:=0;
        if m_btRaceServer = RC_PLAYOBJECT then begin
          PlayObject:=TPlayObject(Self);
          PlayObject.SendDelItems(@m_UseItems[U_RIGHTHAND]);
        end;
        m_UseItems[U_RIGHTHAND].wIndex:=0;
        m_nLight:=0;
        SendRefMsg(RM_CHANGELIGHT,0,0,0,0,'');
        SendMsg(Self,RM_LAMPCHANGEDURA,0,m_UseItems[U_RIGHTHAND].Dura,0,0,'');
        RecalcAbilitys();
//        FeatureChanged(); 01/21 取消 蜡烛是本人才可以看到的，不需要发送广播信息
      end else m_UseItems[U_RIGHTHAND].Dura:=nDura;
      if nOldDura <> ROUND(nDura / 1000) then begin
        SendMsg(Self,RM_LAMPCHANGEDURA,0,m_UseItems[U_RIGHTHAND].Dura,0,0,'');
      end;          
    end;
  except
    MainOutMessage(sExceptionMsg);
  end;
end;

procedure TBaseObject.DamageBubbleDefence(nInt: Integer); //004C6ED0
begin
  if m_wStatusTimeArr[STATE_BUBBLEDEFENCEUP{0x76}] > 0 then begin
    if m_wStatusTimeArr[STATE_BUBBLEDEFENCEUP{0x76}] > 3 then
      Dec(m_wStatusTimeArr[STATE_BUBBLEDEFENCEUP{0x76}],3)
    else m_wStatusTimeArr[STATE_BUBBLEDEFENCEUP{0x76}]:=1;
  end;
end;




end.

