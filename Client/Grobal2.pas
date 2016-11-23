unit Grobal2;

interface
uses
	Math,windows;
Const
	BUFFERSIZE    =1024;

	//客户端发送的命令
	CM_SOFTCLOSE  =0;



	//登录有关的命令
	CM_IDPASSWORD  =1;
	CM_QUERYUSERSTATE=2;
	CM_ADDNEWUSER =3;
	CM_UPDATEUSER =4;
	CM_SELECTSERVER =5;
	CM_CHANGEPASSWORD =6;

	CM_NEWCHR =7;						// New Charactor
	CM_QUERYCHR =8;						// Query Charactor
	CM_DELCHR =9;						// Delete Charactor
	CM_SELCHR =10;						// Select Charactor
	CM_QUERYUSERNAME=11;

	CM_SAY =22;

	CM_MAGICKEYCHANGE = 30;				// Magic Key Change
	CM_CREATEGROUP =42;					// Create Group
	CM_WANTMINIMAP =43;					// Want Mini Map
	CM_OPENGUILDDLG =45;				// Open Guild Dialog
	CM_GROUPMODE=41;					// Group Mode
	CM_ADDGROUPMEMBER =51;				// Add Group Member
	CM_DELGROUPMEMBER =52;				// Delete Group Member

	CM_SPEEDHACKUSER =59;				// Speed Hack User
	CM_ADJUST_BONUS =60;				// Adjust Bonus

	CM_QUERYBAGITEMS=62;				// Quey Bag Items
	CM_LOGINNOTICEOK = 63;				// Login Notice OK

	//! [动作命令1
	CM_TURN       =4001;
	CM_WALK       =4002;
	CM_SITDOWN    =4003;
	CM_RUN        =4004;
	CM_HIT        =4005;
	CM_POWERHIT   =4008;				// Power Hit
	CM_LONGHIT    =4009;				// Long Hit
	CM_WIDEHIT    =4010;				// Wide Hit
	CM_HEAVYHIT   =4011;				// Heavy Hit
	CM_BIGHIT     =4012;				// Big Hit
	CM_THROW      =4013;
	CM_FIREHIT    =4014;				// Fire Hit
	CM_SPELL      =4015;

	CM_CLICKNPC   =3015;				// Click NPC
	//! ]

	//! [动作命令2
	CM_OPENDOOR   =2001;				// Open door
	CM_DROPITEM =2010;					// Drop item
	CM_PICKUP =2011;					// Pickup
	CM_TAKEONITEM =2021;				// Take on item
	CM_TAKEOFFITEM = 2022;				// Take off item
	CM_EAT =2023;						// Eat
	CM_BUTCH =2024;						// Butch
	//! ]

	CM_MERCHANTDLGSELECT =2030;			// Merchant Dialog Select
	CM_MERCHANTQUERYSELLPRICE =2031;	// Merchant Query Sell Price
	CM_MERCHANTQUERYREPAIRCOST =2032;	// Merchant Query Repair Cost

	CM_USERSELLITEM =2040;				// User Sell Item
	CM_USERREPAIRITEM =2041;			// User Repair Item
	CM_USERSTORAGEITEM =2042;			// User Storage Item
	CM_USERGETDETAILITEM =2043;			// User Get Detail Item
	CM_USERBUYITEM =2044;				// User Buy Item
	CM_USERTAKEBACKSTORAGEITEM =2045;	// User Take Back Storage Item
	CM_USERMAKEDRUGITEM =2046;			// User Make Drug Item

	CM_DROPGOLD =2050;					// Grop Gold

	{****************************** Deal: Begin ******************************}
	CM_DEALTRY =2060;					// Deal Try
	CM_DEALCANCEL =2061;				// Deal Cancel
	CM_DEALADDITEM =2062;				// Deal Add Item
	CM_DEALDELITEM =2063;				// Deal Delete Item
	CM_DEALCHGGOLD =2064;				// Deal Change Gold
	CM_DEALEND =2069;					// Deal End
	{****************************** Deal: End ******************************}

	{****************************** Guild: Begin ******************************}
	CM_GUILDHOME =2070;					// Guild Home
	CM_GUILDMEMBERLIST =2071;			// Guild Member List
	CM_GUILDADDMEMBER =2072;			// Guild Add Member
	CM_GUILDDELMEMBER =2073;			// Guild Delete Member
	CM_GUILDUPDATENOTICE =2074;			// Guild Update Notice
	CM_GUILDUPDATERANKINFO =2075;		// Guild Update Rank Info
	{****************************** Guild: End ******************************}

	//装备项目
	U_WEAPON      =0;    //武器
	U_RIGHTHAND   =1;    //右手
	U_DRESS       =2;    //衣服
	U_HELMET      =3;    //头盔
	U_NECKLACE    =4;    //项链
	U_ARMRINGR    =5;    //右手戒指
	U_ARMRINGL    =6;    //左手戒指
	U_RINGR       =7;    //右戒指
	U_RINGL       =8;    //左戒指

	//服务器端发送的命令

	//登录、新帐号、新角色、查询角色等
	SM_NEWID_SUCCESS =101;
	SM_NEWID_FAIL =102;
	SM_PASSWD_FAIL =103;
	SM_NEEDUPDATE_ACCOUNT =104;
	SM_UPDATEID_SUCCESS =105;
	SM_UPDATEID_FAIL =106;
	SM_PASSOK_SELECTSERVER = 107;
	SM_SELECTSERVER_OK =109;
	SM_QUERYCHR =111;
	SM_QUERYCHR_FAIL =112;
	SM_NEWCHR_SUCCESS  =113;
	SM_NEWCHR_FAIL =114;
	SM_CHGPASSWD_SUCCESS =115;
	SM_CHGPASSWD_FAIL =116;
	SM_DELCHR_SUCCESS =117;
	SM_DELCHR_FAIL =118;
	SM_STARTPLAY=119;
	SM_STARTFAIL =120;

	SM_VERSION_FAIL =121;
	SM_OUTOFCONNECTION =122;
	SM_RECONNECT =125;
	SM_SENDNOTICE =202;

	SM_MYSTATUS =131;
	SM_TIMECHECK_MSG = 227;

	SM_CHANGEMAP   =201;
	SM_AREASTATE = 228;
	SM_NEWMAP =223;
	SM_MAPDESCRIPTION = 229;
	SM_LOGON =224;

	SM_CHANGELIGHT =240;
	SM_LAMPCHANGEDURA=241;
	SM_LIGHTING =242;

	SM_OPENDOOR_OK=249;
	SM_OPENDOOR_LOCK=250;
	SM_CLOSEDOOR =251;

	SM_DEATH=260;
	SM_NOWDEATH =261;
	SM_SKELETON=262;
	SM_ALIVE =263;
	SM_ABILITY =264;
	SM_SUBABILITY=265;
	SM_DAYCHANGING=266;
	SM_WINEXP =267;
	SM_LEVELUP =268;
	SM_HEALTHSPELLCHANGED =269;
	SM_ADJUST_BONUS =280;

	SM_STRUCK =310;
	SM_CHANGEFACE=311;
	SM_OPENHEALTH=312;
	SM_CLOSEHEALTH =313;
	SM_INSTANCEHEALGUAGE=314;
	SM_BREAKWEAPON=315;

	//对话消息
	SM_CRY=316;
	SM_GROUPMESSAGE =347;
	SM_GUILDMESSAGE =348;
	SM_WHISPER=349;
	SM_HEAR=351;
	SM_SYSMESSAGE=390;

	SM_USERNAME =352;
	SM_CHANGENAMECOLOR=353;

	//移动动作
	SM_TURN       =1001;
	SM_WALK       =1002;
	SM_SITDOWN    =1003;
	SM_RUN        =1004;
	SM_HIT        =1005;
	SM_POWERHIT   =1008;
	SM_LONGHIT    =1009;
	SM_WIDEHIT    =1010;
	SM_HEAVYHIT   =1011;
	SM_BIGHIT     =1012;
	SM_THROW      =1013;
	SM_FIREHIT    =1014;
	SM_SPELL      =1015;
	SM_BACKSTEP   =1021;
	SM_RUSH       =1022;
	SM_RUSHKUNG   =1023;

	SM_SPACEMOVE_HIDE =1041;
	SM_SPACEMOVE_HIDE2=1042;
	SM_SPACEMOVE_SHOW =1043;
	SM_SPACEMOVE_SHOW2=1044;
	SM_MOVEFAIL       =1045;
	SM_BUTCH          =1046;

	SM_FLYAXE         =1060;

	SM_MAGICFIRE      =1072;
	SM_MAGICFIRE_FAIL = 1073;

	SM_HIDE =1224;
	SM_GHOST=1225;
	SM_DISAPPEAR=1226;
	SM_DIGUP=1227;
	SM_DIGDOWN=1228;
	SM_SHOWEVENT =1229;
	SM_HIDEEVENT = 1230;

	SM_ADDITEM=2040;
	SM_BAGITEMS =2041;
	SM_UPDATEITEM=2042;
	SM_DELITEM =2043;
	SM_DELITEMS=2044;
	SM_DROPITEM_SUCCESS=2045;
	SM_DROPITEM_FAIL=2046;
	SM_ITEMSHOW=2047;
	SM_ITEMHIDE=2048;


	SM_TAKEON_OK=2052;
	SM_TAKEON_FAIL=2053;
	SM_TAKEOFF_OK=2054;
	SM_TAKEOFF_FAIL=2055;
	SM_EXCHGTAKEON_OK=2056;
	SM_EXCHGTAKEON_FAIL=2057;

	SM_SENDUSEITEMS=2058;
	SM_WEIGHTCHANGED=2059;
	SM_GOLDCHANGED=2060;
	SM_FEATURECHANGED=2061;
	SM_CHARSTATUSCHANGED=2062;
	SM_CLEAROBJECTS=2063;
	SM_EAT_OK=2064;
	SM_EAT_FAIL=2065;
	SM_ADDMAGIC=2066;
	SM_SENDMYMAGIC=2067;
	SM_DELMAGIC=2068;
	SM_MAGIC_LVEXP=2069;
	SM_DURACHANGE=2070;
	SM_MERCHANTSAY=2071;
	SM_MERCHANTDLGCLOSE=2072;

	SM_SENDGOODSLIST=2073;
	SM_SENDUSERMAKEDRUGITEMLIST=2074;
	SM_SENDUSERSELL=2075;
	SM_SENDUSERREPAIR=2076;
	SM_SENDBUYPRICE=2077;
	SM_USERSELLITEM_OK=2078;
	SM_USERSELLITEM_FAIL=2079;
	SM_SENDREPAIRCOST=2080;
	SM_USERREPAIRITEM_OK=2081;
	SM_USERREPAIRITEM_FAIL=2082;
	SM_STORAGE_OK=2083;
	SM_STORAGE_FULL=2084;
	SM_STORAGE_FAIL=2085;
	SM_SAVEITEMLIST=2086;

	SM_TAKEBACKSTORAGEITEM_OK=2087;
	SM_TAKEBACKSTORAGEITEM_FAIL=2088;
	SM_TAKEBACKSTORAGEITEM_FULLBAG=2089;

	SM_BUYITEM_SUCCESS=2090;
	SM_BUYITEM_FAIL=2091;

	SM_MAKEDRUG_SUCCESS=2092;
	SM_MAKEDRUG_FAIL=2093;

	SM_SENDDETAILGOODSLIST=2094;
	SM_TEST=2095;
	SM_GROUPMODECHANGED=2096;
	SM_CREATEGROUP_OK=2097;
	SM_CREATEGROUP_FAIL=2098;
	SM_GROUPADDMEM_OK=2099;
	SM_GROUPADDMEM_FAIL=2100;
	SM_GROUPDELMEM_OK=2101;
	SM_GROUPDELMEM_FAIL=2102;
	SM_GROUPCANCEL=2103;
	SM_GROUPMEMBERS=2104;

	SM_OPENGUILDDLG=2105;
	SM_SENDGUILDMEMBERLIST=2106;
	SM_OPENGUILDDLG_FAIL=2107;
	SM_CHANGEGUILDNAME=2124;
	SM_GUILDADDMEMBER_OK=2126;
	SM_GUILDADDMEMBER_FAIL=2127;
	SM_GUILDDELMEMBER_OK=2128;
	SM_GUILDDELMEMBER_FAIL=2129;
	SM_GUILDRANKUPDATE_FAIL=2130;
	SM_GUILDMAKEALLY_OK=2131;
	SM_GUILDMAKEALLY_FAIL=2132;
	SM_GUILDBREAKALLY_OK=2133;
	SM_GUILDBREAKALLY_FAIL=2134;

	SM_DEALTRY_FAIL=2108;
	SM_DEALMENU=2109;
	SM_DEALCANCEL=2110;
	SM_DEALADDITEM_OK=2111;
	SM_DEALADDITEM_FAIL=2112;
	SM_DEALDELITEM_OK=2113;
	SM_DEALDELITEM_FAIL=2114;
	SM_DEALREMOTEADDITEM=2115;
	SM_DEALREMOTEDELITEM=2116;
	SM_DEALCHGGOLD_OK=2117;
	SM_DEALCHGGOLD_FAIL=2118;
	SM_DEALREMOTECHGGOLD=2119;
	SM_DEALSUCCESS=2120;

	SM_SENDUSERSTORAGEITEM=2121;

	SM_READMINIMAP_OK=2122;
	SM_READMINIMAP_FAIL=2123;

	SM_SENDUSERSTATE=2125;

	SM_BUILDGUILD_OK=2135;
	SM_BUILDGUILD_FAIL=2136;
	SM_MENU_OK=2137;
	SM_DLGMSG=2138;
	SM_DONATE_OK=2139;
	SM_DONATE_FAIL=2140;

	SM_ACTION_MIN=2200;
	SM_ACTION_MAX=2499;
	SM_ACTION2_MIN=2500;
	SM_ACTION2_MAX=2999;

	RCC_MERCHANT  =1;
	RCC_GUARD     =2;

	VERSION_NUMBER_0522=522;

	DEFBLOCKSIZE =16;

	UNITX = 48;
	UNITY = 32;
	LOGICALMAPUNIT =20;
	HALFX = 24;
	HALFY = 16;

	ET_DIGOUTZOMBI =0;
	ET_PILESTONES = 1;
	ET_HOLYCURTAIN = 2;
	ET_FIRE= 3;
	ET_SCULPEICE = 4;

	STATE_STONE_MODE =0;
	STATE_OPENHEATH = 1;

	MAXBAGITEM = 52;

	DR_UP=0;
	DR_UPRIGHT =1;
	DR_RIGHT =2;
	DR_DOWNRIGHT =3;
	DR_DOWN =4;
	DR_DOWNLEFT =5;
	DR_LEFT =6;
	DR_UPLEFT =7;

type

	TDefaultMessage=packed record  //Size=12
	Ident :word;
	Recog :integer;  //识别码
	Param :smallint;
	Tag   :smallint;
	Series:smallint;
end;
//Ident=SM_DAYCHANGING
//   Param=DayBright
//   Tag=雾的浓度：0，1，2，3

TUserInfo=Record
Name:String[32];
Looks:integer;
StdMode:Integer;
Shape:Integer;
  end;

	TStdItem = record
		Name:String[16];   //物品名称
		Looks:integer;     //外观，即Items.WIL中的图片索引
		StdMode:integer;   //0/1/2/3：药， 5/6:武器，10/11：盔甲，15：头盔，22/23：戒指，24/26：手镯，19/20/21：项链
		Shape:integer;
		AC:Integer;
		MAC:integer;
		Weight:integer;
		DuraMax:integer;
		NeedIdentify:byte;
		DC,MC,SC:Integer;
		Source:integer;
		Need:integer;
		NeedLevel:integer;
	end;

	PTClientItem=^TClientItem;

	TClientItem=Record
		s:TStdItem;
		MakeIndex:Integer;
		Dura:Integer;
		DuraMax:Integer;
	end;

	TAbility= packed record
		MP,MaxMP:Integer;
		HP,MaxHP:integer;
		Exp,MaxExp:Integer;
		Level:Integer;
		Weight,MaxWeight:Integer;
		WearWeight,MaxWearWeight:Integer;
		HandWeight,MaxHandWeight:Integer;
		AC:Integer;
		MAC:Integer;
		DC:Integer;
		MC,SC:Integer;
	end;

	PTChrMsg=^TChrMsg;

	TChrMsg=Record
		Ident:integer;
		Dir:Integer;
		X,Y:Integer;
		State:integer;
		feature:integer;
		saying:string;
		Sound:integer;
	end;

	TUserStateInfo=Record
		UserName:String[32];
		GuildName:String[32];
		GuildRankName:String[32];
		NameColor:Integer;
		Feature:integer;
		UseItems:Array[0..127] of TClientItem;
	end;

  TUserCharacterInfo=Record
  Name:String;
  Job:byte;
  Hair:smallint;
  level:Integer;
  Sex:byte;
  end;

  TUserEntryInfo=Record
  LoginId:String[16];
  Password:String[16];
  UserName:String[32];
  SSNo:String[18];
  Quiz:String[32];
  Answer:String[32];
  Phone:String[15];
  EMail:String[64];

  end;

  TUserEntryAddInfo=Record
  Quiz2:String[32];
  Answer2:String[32];
  MobilePhone:String[15];
  BirthDay:String[16];
  end;

  PTDropItem=^TDropItem;
  TDropItem=record
	  Id:Integer;
	  X,Y:Integer;
	  Looks:integer;
	  FlashTime:LongInt;
	  Name:String[16];
	  BoFlash:Boolean;
	  FlashStepTime:LongInt;
	  FlashStep:Integer;
  end;

  TDef=Record
  Spell:integer;
  DefSpell:integer;
  EffectType:Integer;
  MagicId:Integer;
  Effect:Integer;
  DelayTime:Integer;
  MagicName:String[16];
  MaxTrain:Array [0..255] of integer;
  end;

  PTClientMagic=^TClientMagic;
  TClientMagic=Record
  Key:Char;
  Def:TDef;
  Level:Integer;
  CurTrain:Integer;
  end;

  TNakedAbility=Record
  DC,MC,SC,AC,MAC:Integer;
  HP,MP:Integer;
  Hit:integer;
  Speed:integer;
  end;

  TShortMessage=Record
  Ident:Integer;
  end;

  TMessageBodyW=Record
  Param1:integer;
  Param2:integer;
  Tag1:integer;
  Tag2:integer;
  end;

  TCharDesc=Record
  Feature:Integer;
  Status:Integer;
  end;

  TMessageBodyWL=Record
  lParam1,lParam2:longint;
  lTag1,lTag2:longint;
  end;

  PTClientGoods=^TClientGoods;
  TClientGoods=record
	  Name:string[16];
	  SubMenu:Integer;
	  Price:Integer;
	  Stock:integer;
	  Grade:integer;
  end;

function  MakeDefaultMsg (msg:smallint; Recog:integer; param, tag, series:smallint):TDefaultMessage;
function  UpInt(i:double):integer;
Function  RACEfeature(Feature:word):smallint;
Function  HAIRfeature(Feature:word):byte;
Function  DRESSfeature(Feature:word):byte;
Function  APPRfeature(Feature:word):byte;
Function  WEAPONfeature(Feature:word):byte;
function  MakeFeature(Race:Word;Appr,Hair,Dress,Weapon:byte):Integer;
implementation

function  MakeDefaultMsg (msg:smallint; Recog:integer; param, tag, series:smallint):TDefaultMessage;
begin
	result.Ident:=Msg;
	result.Param:=Param;
	result.Tag:=Tag;
	result.Series:=Series;
	result.Recog:=Recog;
end;

function  UpInt(i:double):integer;
begin
	result:=Ceil(i);
end;

//人物Feature属性的分解和合成，共32位，高16位为Race和Appr,
//   低16位中，最左四位表示Hair,接下来6位表示Dress,最右6位表示Weapon。
//   当Race=0时,Dress mod 2 表示性别
//   Race=0时武器也分男女，男的武器应该是偶数，女的是奇数
//*******对Feature的解释可以自己定义，但Race取值至少0..90，Appr:0..9
//*******Hair最多有6种发型（3600幅图片，每600幅图片一种发型），男女各3
//*******Dress的数量好象在Hum.WIL中表示，有多少种图片就有多少种服装，Hum.WIL可以扩展
//*******Weapon的数量见Weapon.WIL，有数万幅图片，同样的，每600幅对应一个Appr，分男女
//*********例如40800幅对应68种武器（男女合计）
Function  RACEfeature(Feature:word):smallint;
begin
	result:=Hiword(Feature) div 10;
end;

Function  HAIRfeature(Feature:word):byte;
begin
	result:=(LoWord(Feature) and $F000) shr 12 ;  //1111000000000000
end;

Function  DRESSfeature(Feature:word):byte;
begin
	result:=(LoWord(Feature) and $3F00) shr 7;    //0000111111000000
end;

Function  WEAPONfeature(Feature:word):byte;
begin
	result:=LoWord(Feature) and $3F;              //0000000000111111
end;

Function  APPRfeature(Feature:word):byte;
begin
	result:=hiword(Feature) mod 10;
end;

function  MakeFeature(Race:Word;Appr,Hair,Dress,Weapon:byte):Integer;
begin
	result:=MakeLong(((Hair And $0F)shl 12) + ((Dress And $3F) shl 6) + (Weapon And $3F) ,Race*10+Appr);
end;

end.
