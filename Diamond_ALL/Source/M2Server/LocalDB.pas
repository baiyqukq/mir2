unit LocalDB;

interface

uses
  Windows, Messages, SysUtils, StrUtils, Variants, Classes, Graphics, Controls, Forms,ActiveX,
  Dialogs, M2Share, ADODB, DB, HUtil32, Grobal2, SDK, ObjNpc, ItemUnit;


type
  TDefineInfo = record
    sName:String;
    sText:String;
  end;
  pTDefineInfo = ^TDefineInfo;
  TQDDinfo = record
    n00     :Integer;
    s04     :String;
    sList   :TStringList;
  end;
  pTQDDinfo = ^TQDDinfo;
  TGoodFileHeader = record
    nItemCount    :Integer;
    Resv          :array[0..251] of Integer;
  end;
  TFrmDB = class{(TForm)}
  private
    procedure QMangeNPC;
    procedure QFunctionNPC;
    procedure RobotNPC();
    procedure DeCodeStringList(StringList:TStringList);
    { Private declarations }
  public
    Query: TADOQuery;

    constructor Create();
    destructor Destroy; override;
    function LoadMonitems(MonName:String;var ItemList:TList):Integer;
    function LoadItemsDB():Integer;
    function LoadMapRoute():Integer;
    function LoadMapInfo():Integer;
    function LoadMonsterDB():Integer;
    function LoadMagicDB():Integer;
    function LoadMonGen():Integer;
    function LoadUnbindList():Integer;
    function LoadMapQuest():Integer;
    function LoadQuestDiary():Integer;
    function LoadAdminList():Boolean;
    function LoadMerchant():Integer;
    function LoadGuardList():Integer;
    function LoadNpcs():Integer;
    function LoadMakeItem():Integer;
    function LoadStartPoint():Integer;
    function LoadNpcScript(NPC:TNormNpc;sPatch,sScritpName:String):Integer;
    function LoadScriptFile(NPC:TNormNpc;sPatch,sScritpName:String;boFlag:Boolean):Integer;
    function LoadGoodRecord(NPC:TMerchant;sFile:String):Integer;
    function LoadGoodPriceRecord(NPC:TMerchant;sFile:String):Integer;

    function SaveGoodRecord(NPC:TMerchant;sFile:String):Integer;
    function SaveGoodPriceRecord(NPC:TMerchant;sFile:String):Integer;

    function  LoadUpgradeWeaponRecord(sNPCName:String;DataList:TList):Integer;
    function  SaveUpgradeWeaponRecord(sNPCName:String;DataList:TList):Integer;
    procedure ReLoadMerchants();
    procedure ReLoadNpc();

    function SaveAdminList():Boolean;
    { Public declarations }
  end;
  
var
  FrmDB: TFrmDB;
  nDeCryptString:Integer= -1;
implementation

uses ObjBase, Envir;


//{$R *.dfm}

{ TFrmDB }
//00487630
function TFrmDB.LoadAdminList():Boolean;
var
  i:Integer;
  AdminInfo :pTAdminInfo;
ResourceString
  sSQLString = 'SELECT * FROM TBL_ADMIN';
begin
  Result:=False;
  EnterCriticalSection(ProcessHumanCriticalSection);
  try
  try
    Query.SQL.Clear;
    Query.SQL.Add(sSQLString);
    try
      Query.Open;
    finally
    end;

    UserEngine.m_AdminList.Lock;
    try
      UserEngine.m_AdminList.Clear;
      for i:=0 to Query.RecordCount -1 do begin
        New(AdminInfo);
        AdminInfo.nLv         := Query.FieldByName('FLD_ADMINLEVEL').AsInteger;
        AdminInfo.sChrName    := Query.FieldByName('FLD_PLAYERNAME').AsString;
        AdminInfo.sIPaddr     := Query.FieldByName('FLD_IP').AsString;

        UserEngine.m_AdminList.Add(AdminInfo);

        Query.Next;
      end;
    finally
      UserEngine.m_AdminList.UnLock;
    end;
  finally
    Query.Close;
  end;
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;
  Result:=True;
end;

function TFrmDB.SaveAdminList():Boolean;
var
  i:Integer;
  AdminInfo :pTAdminInfo;
ResourceString
  sSQLString = 'DELETE * FROM TBL_ADMIN';
  sSQLString2= 'INSERT TBL_ADMIN(FLD_ADMINLEVEL, FLD_PLAYERNAME, FLD_IP) VALUES( %d, ''%s'', ''%s'' )';
begin
  Result:=False;
  EnterCriticalSection(ProcessHumanCriticalSection);
  try
  try
    Query.SQL.Clear;
    Query.SQL.Add(sSQLString);
    try
      Query.ExecSQL;
    finally
    end;

    try
      UserEngine.m_AdminList.Lock;
      Query.SQL.Clear;
      for I := 0 to UserEngine.m_AdminList.Count - 1 do begin
        AdminInfo:=pTAdminInfo(UserEngine.m_AdminList.Items[I]);

        Query.Close;
      	Query.SQL.Text:=Format(sSQLString2, [AdminInfo.nLv, AdminInfo.sChrName, AdminInfo.sIPaddr]);

      	if (Query.ExecSQL<=0) then begin
					Break;
      	end;
      end;

    finally
      UserEngine.m_AdminList.UnLock;
    end;
  finally
    Query.Close;
  end;
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;
  Result:=True;
end;


//00488A68
function TFrmDB.LoadGuardList(): Integer;
var
  i,nX,nY,nDir:Integer;
  sGuardName,sMap:String;
  tGuard:TBaseObject;
ResourceString
  sSQLString = 'SELECT * FROM TBL_GUARD';
begin
  EnterCriticalSection(ProcessHumanCriticalSection);
  try
  try
    Result := -1;
    Query.SQL.Clear;
    Query.SQL.Add(sSQLString);
    try
      Query.Open;
    finally
      Result:= -2;
    end;
    for i:=0 to Query.RecordCount -1 do begin
      sGuardName        := Query.FieldByName('FLD_GUARDNAME').AsString;
      sMap              := Query.FieldByName('FLD_MAPNAME').AsString;
      nX                := Query.FieldByName('FLD_X').AsInteger;
      nY                := Query.FieldByName('FLD_Y').AsInteger;
      nDir              := Query.FieldByName('FLD_DIRECTION').AsInteger;

      if (sGuardName <> '') and (sMap <> '') then begin
        tGuard:=UserEngine.RegenMonsterByName(sMap,nX,nY,sGuardName);
        //sMapName,nX,nY,sName
        if tGuard <> nil then tGuard.m_btDirection:=nDir;
      end;

      Result := 1;
      Query.Next;
    end;
  finally
    Query.Close;
  end;
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;
end;
//004855E0
function TFrmDB.LoadItemsDB: Integer;
var
  i,Idx:Integer;
  Item:TItem;
ResourceString
  sSQLString = 'SELECT * FROM TBL_STDITEMS ORDER BY FLD_ID';
begin
  EnterCriticalSection(ProcessHumanCriticalSection);
  try
  try
    for I := 0 to UserEngine.StdItemList.Count - 1 do begin
      TItem(UserEngine.StdItemList.Items[I]).Free;
    end;
    UserEngine.StdItemList.Clear;
    Result := -1;
    Query.SQL.Clear;
    Query.SQL.Add(sSQLString);
    try
      Query.Open;
    finally
      Result:= -2;
    end;
    for i:=0 to Query.RecordCount -1 do begin
      Item := TItem.Create;
      Idx            := Query.FieldByName('FLD_ID').AsInteger;
      Item.Name      := Query.FieldByName('FLD_NAME').AsString;
      Item.StdMode   := Query.FieldByName('FLD_STDMode').AsInteger;
      Item.Shape     := Query.FieldByName('FLD_SHAPE').AsInteger;
      Item.Weight    := Query.FieldByName('FLD_WEIGHT').AsInteger;
      Item.AniCount  := Query.FieldByName('FLD_ANICOUNT').AsInteger;
      Item.Source    := Query.FieldByName('FLD_SOURCE').AsInteger;
      Item.Reserved  := Query.FieldByName('FLD_RESERVED').AsInteger;
      Item.Looks     := Query.FieldByName('FLD_IMGINDEX').AsInteger;
      Item.DuraMax   := Word(Query.FieldByName('FLD_DURAMAX').AsInteger);
      Item.AC        := ROUND(Query.FieldByName('FLD_AC').AsInteger * (g_Config.nItemsACPowerRate / 10));
      Item.AC2       := ROUND(Query.FieldByName('FLD_ACMAX').AsInteger * (g_Config.nItemsACPowerRate / 10));
      Item.MAC       := ROUND(Query.FieldByName('FLD_MAC').AsInteger * (g_Config.nItemsACPowerRate / 10));
      Item.MAC2      := ROUND(Query.FieldByName('FLD_MACMAX').AsInteger * (g_Config.nItemsACPowerRate / 10));
      Item.DC        := ROUND(Query.FieldByName('FLD_DC').AsInteger * (g_Config.nItemsPowerRate / 10));
      Item.DC2       := ROUND(Query.FieldByName('FLD_DCMAX').AsInteger * (g_Config.nItemsPowerRate / 10));
      Item.MC        := ROUND(Query.FieldByName('FLD_MC').AsInteger * (g_Config.nItemsPowerRate / 10));
      Item.MC2       := ROUND(Query.FieldByName('FLD_MCMAX').AsInteger * (g_Config.nItemsPowerRate / 10));
      Item.SC        := ROUND(Query.FieldByName('FLD_SC').AsInteger * (g_Config.nItemsPowerRate / 10));
      Item.SC2       := ROUND(Query.FieldByName('FLD_SCMAX').AsInteger * (g_Config.nItemsPowerRate / 10));
      Item.Need      := Query.FieldByName('FLD_NEED').AsInteger;
      Item.NeedLevel := Query.FieldByName('FLD_NEEDLEVEL').AsInteger;
      Item.Price     := Query.FieldByName('FLD_PRICE').AsInteger;
      Item.Unique    := Query.FieldByName('FLD_UNIQUEITEM').AsBoolean;
      Item.Light     := Query.FieldByName('FLD_LIGHT').AsBoolean;


      Item.NeedIdentify:=GetGameLogItemNameList(Item.Name);

      case Item.StdMode of
        5,6: Item.ItemType := ITEM_WEAPON;
        10,11: Item.ItemType := ITEM_ARMOR;
        15,19,20,21,22,23,24,26,51,52,53,54,62,63,64: Item.ItemType := ITEM_ACCESSORY;
        else Item.ItemType := ITEM_ETC;
      end;

      if UserEngine.StdItemList.Count = Idx-1 then begin
        UserEngine.StdItemList.Add(Item);
        Result := 1;
      end else begin
        Memo.Lines.Add(format('加载物品(Idx:%d Name:%s)数据失败！！！',[Idx,Item.Name]));
        Result := -100;
        exit;
      end;
      Query.Next;
    end;
    g_boGameLogGold:=GetGameLogItemNameList(sSTRING_GOLDNAME) = 1;
    g_boGameLogHumanDie:=GetGameLogItemNameList(g_sHumanDieEvent) = 1;
    g_boGameLogGameGold:=GetGameLogItemNameList(g_Config.sGameGoldName) = 1;
    g_boGameLogGamePoint:=GetGameLogItemNameList(g_Config.sGamePointName) = 1;
  finally
    Query.Close;
  end;
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;
end;
//00486330
function TFrmDB.LoadMagicDB():Integer;
var
  i:Integer;
  Magic:pTMagic;
ResourceString
  sSQLString = 'SELECT * FROM TBL_MAGIC ORDER BY FLD_ID';
begin
  Result:= -1;
  EnterCriticalSection(ProcessHumanCriticalSection);
  try
  try
    UserEngine.SwitchMagicList();
    {
    for I := 0 to UserEngine.MagicList.Count - 1 do begin
      Dispose(pTMagic(UserEngine.MagicList.Items[I]));
    end;
    UserEngine.MagicList.Clear;
    }

    Query.SQL.Clear;
    Query.SQL.Add(sSQLString);
    try
      Query.Open;
    finally
      Result:= -2;
    end;
    for i:=0 to Query.RecordCount -1 do begin
      New(Magic);
      Magic.wMagicId      := Query.FieldByName('FLD_ID').AsInteger;
      Magic.sMagicName    := Trim(Query.FieldByName('FLD_NAME').AsString);
      Magic.btEffectType  := Query.FieldByName('FLD_EFFECTTYPE').AsInteger;
      Magic.btEffect      := Query.FieldByName('FLD_EFFECT').AsInteger;
      Magic.wSpell        := Query.FieldByName('FLD_SPELL').AsInteger;
      Magic.wPower        := Query.FieldByName('FLD_POWER').AsInteger;
      Magic.wMaxPower     := Query.FieldByName('FLD_MAXPOWER').AsInteger;
      Magic.btJob         := Query.FieldByName('FLD_JOB').AsInteger;
      Magic.TrainLevel[0] := Query.FieldByName('FLD_NEEDL1').AsInteger;
      Magic.TrainLevel[1] := Query.FieldByName('FLD_NEEDL2').AsInteger;
      Magic.TrainLevel[2] := Query.FieldByName('FLD_NEEDL3').AsInteger;
      Magic.TrainLevel[3] := Magic.TrainLevel[2]; //Query.FieldByName('FLD_NEEDL3').AsInteger;
      Magic.MaxTrain[0]   := Query.FieldByName('FLD_L1TRAIN').AsInteger;
      Magic.MaxTrain[1]   := Query.FieldByName('FLD_L2TRAIN').AsInteger;
      Magic.MaxTrain[2]   := Query.FieldByName('FLD_L3TRAIN').AsInteger;
      Magic.MaxTrain[3]   := Magic.MaxTrain[2];
      Magic.btTrainLv     := MaxSkillLevel;
      Magic.dwDelayTime   := Query.FieldByName('FLD_DELAY').AsInteger;
      Magic.btDefSpell    := Query.FieldByName('FLD_DEFSPELL').AsInteger;
      Magic.btDefPower    := Query.FieldByName('FLD_DEFPOWER').AsInteger;
      Magic.btDefMaxPower := Query.FieldByName('FLD_DEFMAXPOWER').AsInteger;
      Magic.sDescr        := Trim(Query.FieldByName('FLD_DESCR').AsString);
      if Magic.wMagicId > 0 then begin
        UserEngine.m_MagicList.Add(Magic);
      end else begin
        Dispose(Magic);
      end;
      Result := 1;
      Query.Next;
    end;
  finally
    Query.Close;
  end;
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;
end;

function TFrmDB.LoadMakeItem(): Integer; //00488CDC
var
  I,n14:Integer;
  s18,s20,s24:String;
  LoadList:TStringList;
  sFileName:String;
  List28:TStringList;
begin
  Result:= -1;
  sFileName:=g_Config.sEnvirDir + 'MakeItem.txt';
  if FileExists(sFileName) then begin
    LoadList:=TStringList.Create;
    LoadList.LoadFromFile(sFileName);
    List28:=nil;
    s24:='';
    for I := 0 to LoadList.Count - 1 do begin
      s18:=Trim(LoadList.Strings[I]);
      if (s18 <> '') and (s18[1] <> ';') then begin
        if s18[1] = '[' then begin
          if List28 <> nil then
            g_MakeItemList.AddObject(s24,List28);
          List28:=TStringList.Create;
          ArrestStringEx(s18,'[',']',s24);
        end else begin
          if List28 <> nil then begin
            s18:=GetValidStr3(s18,s20,[' ',#9]);
            n14:=Str_ToInt(Trim(s18),1);
            List28.AddObject(s20,TObject(n14));
          end;
        end;
      end;
    end;    // for
    if List28 <> nil then
      g_MakeItemList.AddObject(s24,List28);
    LoadList.Free;
    Result:=1;
  end;
end;


function TFrmDB.LoadMapInfo: Integer;
  function LoadMapQuest(sName:String):TMerchant;
  var
    QuestNPC:TMerchant;
  begin
    QuestNPC:=TMerchant.Create;
    QuestNPC.m_sMapName:='0';
    QuestNPC.m_nCurrX:=0;
    QuestNPC.m_nCurrY:=0;
    QuestNPC.m_sCharName:=sName;
    QuestNPC.m_nFlag:=0;
    QuestNPC.m_wAppr:=0;
    QuestNPC.m_sFilePath:='MapQuest_def\';
    QuestNPC.m_boIsHide:=True;
    QuestNPC.m_boIsQuest:=False;
    UserEngine.QuestNPCList.Add(QuestNPC);

    Result:=QuestNPC;
  end;

var
  i:Integer;

  sFlag,s34,s38,sMapName,sMapDesc,sReConnectMap:String;
  nIdx,nServerIndex:Integer;

  MapFlag:TMapFlag;
  QuestNPC:TMerchant;
ResourceString
  sSQLString = 'SELECT * FROM TBL_MAPINFO';
begin
  Result:= -1;
  try
    EnterCriticalSection(ProcessHumanCriticalSection);
  try
    Query.SQL.Clear;
    Query.SQL.Add(sSQLString);
    MiniMapList.Clear;
    try
      Query.Open;
    finally
      Result:= -2;
    end;
    for i:=0 to Query.RecordCount -1 do begin
      sMapName      := Trim(Query.FieldByName('FLD_MAPFILENAME').AsString);
      sMapDesc      := Trim(Query.FieldByName('FLD_MAPNAME').AsString);
      sFlag         := Trim(Query.FieldByName('FLD_FLAGS').AsString);
      nServerIndex  := Query.FieldByName('FLD_SERVERINDEX').AsInteger;
      
      //if sMapName = '' then Continue;

      nIdx          := Query.FieldByName('FLD_MINIMAP').AsInteger;
      if nIdx > 0 then
        MiniMapList.AddObject(sMapName,TObject(nIdx));

      FillChar(MapFlag,SizeOf(TMapFlag),#0);
      MapFlag.nL:=1;
      QuestNPC:=nil;
      MapFlag.boSAFE:=False;
      MapFlag.nNEEDSETONFlag:= -1;
      MapFlag.nNeedONOFF:= -1;
      MapFlag.nMUSICID:=-1;

      while (True) do begin
        if sFlag = '' then break;
        sFlag:=GetValidStr3(sFlag,s34,[' ', ',', #9]);
        if s34 = '' then break;

        if CompareText(s34,'SAFE') = 0 then begin
          MapFlag.boSAFE:=True;
          Continue;
        end;
        if CompareText(s34,'DARK') = 0 then begin
          MapFlag.boDarkness:=True;
          Continue;
        end;
        if CompareText(s34,'FIGHT') = 0 then begin
          MapFlag.boFightZone:=True;
          Continue;
        end;
        if CompareText(s34,'FIGHT3') = 0 then begin
          MapFlag.boFight3Zone:=True;
          Continue;
        end;
        if CompareText(s34,'DAY') = 0 then begin
          MapFlag.boDayLight:=True;
          Continue;
        end;
        if CompareText(s34,'QUIZ') = 0 then begin
          MapFlag.boQUIZ:=True;
          Continue;
        end;
        if CompareLStr(s34,'NORECONNECT',length('NORECONNECT')) then begin
          MapFlag.boNORECONNECT:=True;
          ArrestStringEx(s34,'(',')',sReConnectMap);
          MapFlag.sNoReConnectMap:=sReConnectMap;
          if MapFlag.sNoReConnectMap = '' then Result:= -11;
          Continue;
        end;
        if CompareLStr(s34,'CHECKQUEST',length('CHECKQUEST')) then begin
          ArrestStringEx(s34,'(',')',s38);
          QuestNPC:=LoadMapQuest(s38);
          Continue;
        end;
        if CompareLStr(s34,'NEEDSET_ON',length('NEEDSET_ON')) then begin
          MapFlag.nNeedONOFF:=1;
          ArrestStringEx(s34,'(',')',s38);
          MapFlag.nNEEDSETONFlag:=Str_ToInt(s38,-1);
          Continue;
        end;
        if CompareLStr(s34,'NEEDSET_OFF',length('NEEDSET_OFF')) then begin
          MapFlag.nNeedONOFF:=0;
          ArrestStringEx(s34,'(',')',s38);
          MapFlag.nNEEDSETONFlag:=Str_ToInt(s38,-1);
          Continue;
        end;
        if CompareLStr(s34,'MUSIC',length('MUSIC')) then begin
          MapFlag.boMUSIC:=True;
          ArrestStringEx(s34,'(',')',s38);
          MapFlag.nMUSICID:=Str_ToInt(s38,-1);
          Continue;
        end;
        if CompareLStr(s34,'EXPRATE',length('EXPRATE')) then begin
          MapFlag.boEXPRATE:=True;
          ArrestStringEx(s34,'(',')',s38);
          MapFlag.nEXPRATE:=Str_ToInt(s38,-1);
          Continue;
        end;
        if CompareLStr(s34,'PKWINLEVEL',length('PKWINLEVEL')) then begin
          MapFlag.boPKWINLEVEL:=True;
          ArrestStringEx(s34,'(',')',s38);
          MapFlag.nPKWINLEVEL:=Str_ToInt(s38,-1);
          Continue;
        end;
        if CompareLStr(s34,'PKWINEXP',length('PKWINEXP')) then begin
          MapFlag.boPKWINEXP:=True;
          ArrestStringEx(s34,'(',')',s38);
          MapFlag.nPKWINEXP:=Str_ToInt(s38,-1);
          Continue;
        end;
        if CompareLStr(s34,'PKLOSTLEVEL',length('PKLOSTLEVEL')) then begin
          MapFlag.boPKLOSTLEVEL:=True;
          ArrestStringEx(s34,'(',')',s38);
          MapFlag.nPKLOSTLEVEL:=Str_ToInt(s38,-1);
          Continue;
        end;
        if CompareLStr(s34,'PKLOSTEXP',length('PKLOSTEXP')) then begin
          MapFlag.boPKLOSTEXP:=True;
          ArrestStringEx(s34,'(',')',s38);
          MapFlag.nPKLOSTEXP:=Str_ToInt(s38,-1);
          Continue;
        end;
        if CompareLStr(s34,'DECHP',length('DECHP')) then begin
          MapFlag.boDECHP:=True;
          ArrestStringEx(s34,'(',')',s38);

          MapFlag.nDECHPPOINT:=Str_ToInt(GetValidStr3(s38,s38,['/']),-1);
          MapFlag.nDECHPTIME:=Str_ToInt(s38,-1);
          Continue;
        end;
        if CompareLStr(s34,'INCHP',length('INCHP')) then begin
          MapFlag.boINCHP:=True;
          ArrestStringEx(s34,'(',')',s38);

          MapFlag.nINCHPPOINT:=Str_ToInt(GetValidStr3(s38,s38,['/']),-1);
          MapFlag.nINCHPTIME:=Str_ToInt(s38,-1);
          Continue;
        end;
        if CompareLStr(s34,'DECGAMEGOLD',length('DECGAMEGOLD')) then begin
          MapFlag.boDECGAMEGOLD:=True;
          ArrestStringEx(s34,'(',')',s38);

          MapFlag.nDECGAMEGOLD:=Str_ToInt(GetValidStr3(s38,s38,['/']),-1);
          MapFlag.nDECGAMEGOLDTIME:=Str_ToInt(s38,-1);
          Continue;
        end;
        if CompareLStr(s34,'DECGAMEPOINT',length('DECGAMEPOINT')) then begin
          MapFlag.boDECGAMEPOINT:=True;
          ArrestStringEx(s34,'(',')',s38);

          MapFlag.nDECGAMEPOINT:=Str_ToInt(GetValidStr3(s38,s38,['/']),-1);
          MapFlag.nDECGAMEPOINTTIME:=Str_ToInt(s38,-1);
          Continue;
        end;
        if CompareLStr(s34,'INCGAMEGOLD',length('INCGAMEGOLD')) then begin
          MapFlag.boINCGAMEGOLD:=True;
          ArrestStringEx(s34,'(',')',s38);

          MapFlag.nINCGAMEGOLD:=Str_ToInt(GetValidStr3(s38,s38,['/']),-1);
          MapFlag.nINCGAMEGOLDTIME:=Str_ToInt(s38,-1);
          Continue;
        end;
        if CompareLStr(s34,'INCGAMEPOINT',length('INCGAMEPOINT')) then begin
          MapFlag.boINCGAMEPOINT:=True;
          ArrestStringEx(s34,'(',')',s38);

          MapFlag.nINCGAMEPOINT:=Str_ToInt(GetValidStr3(s38,s38,['/']),-1);
          MapFlag.nINCGAMEPOINTTIME:=Str_ToInt(s38,-1);
          Continue;
        end;
        if CompareText(s34,'RUNHUMAN') = 0 then begin
          MapFlag.boRUNHUMAN:= True;
          Continue;
        end;
        if CompareText(s34,'RUNMON') = 0 then begin
          MapFlag.boRUNMON:= True;
          Continue;
        end;
        if CompareText(s34,'NEEDHOLE') = 0 then begin
          MapFlag.boNEEDHOLE := True;
          Continue;
        end;
        if CompareText(s34,'NORECALL') = 0 then begin
          MapFlag.boNORECALL := True;
          Continue;
        end;
        if CompareText(s34,'NOGUILDRECALL') = 0 then begin
          MapFlag.boNOGUILDRECALL := True;
          Continue;
        end;
        if CompareText(s34,'NODEARRECALL') = 0 then begin
          MapFlag.boNODEARRECALL := True;
          Continue;
        end;
        if CompareText(s34,'NOMASTERRECALL') = 0 then begin
          MapFlag.boNOMASTERRECALL := True;
          Continue;
        end;
        if CompareText(s34,'NORANDOMMOVE') = 0 then begin
          MapFlag.boNORANDOMMOVE := True;
          Continue;
        end;
        if CompareText(s34,'NODRUG') = 0 then begin
          MapFlag.boNODRUG := True;
          Continue;
        end;
        if CompareText(s34,'MINE') = 0 then begin
          MapFlag.boMINE := True;
          Continue;
        end;
        if CompareText(s34,'MINE2') = 0 then begin
          MapFlag.boMINE2 := True;
          Continue;
        end;
        if CompareText(s34,'NOTHROWITEM') = 0 then begin
          MapFlag.boNOTHROWITEM := True;
          Continue;
        end;
        if CompareText(s34,'NODROPITEM') = 0 then begin
          MapFlag.boNODROPITEM := True;
          Continue;
        end;
        if CompareText(s34,'NOPOSITIONMOVE') = 0 then begin
          MapFlag.boNOPOSITIONMOVE := True;
          Continue;
        end;
        if CompareText(s34,'NOHORSE') = 0 then begin
          MapFlag.boNOPOSITIONMOVE := True;
          Continue;
        end;
        if CompareText(s34,'NOCHAT') = 0 then begin
          MapFlag.boNOCHAT := True;
          Continue;
        end;
        if (s34[1] = 'L') then begin
          MapFlag.nL:= Str_ToInt(Copy(s34,2,Length(s34) -1),1);
        end;
      end;
      if g_MapManager.AddMapInfo(sMapName,sMapDesc,nServerIndex,@MapFlag,QuestNPC) = nil then Result:= -10;
      
      Result := 1;
      Query.Next;
    end;
  finally
    Query.Close;
  end;
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;

  LoadMapRoute();
end;


function TFrmDB.LoadMapRoute():Integer;
var
  i,nSMapX,nSMapY,nDMapX,nDMapY:Integer;
  sSMapNO,sDMapNO:String;
ResourceString
  sSQLString = 'SELECT * FROM TBL_MOVEMAPEVENT';
begin
  Result:= -1;
  EnterCriticalSection(ProcessHumanCriticalSection);
  try
  try
    Query.SQL.Clear;
    Query.SQL.Add(sSQLString);
    try
      Query.Open;
    finally
      Result:= -2;
    end;
    for i:=0 to Query.RecordCount -1 do begin
      sSMapNO       := Trim(Query.FieldByName('FLD_SMAPFILENAME').AsString);
      nSMapX        := Query.FieldByName('FLD_SX').AsInteger;
      nSMapY        := Query.FieldByName('FLD_SY').AsInteger;
      sDMapNO       := Trim(Query.FieldByName('FLD_DMAPFILENAME').AsString);
      nDMapX        := Query.FieldByName('FLD_DX').AsInteger;
      nDMapY        := Query.FieldByName('FLD_DY').AsInteger;

      g_MapManager.AddMapRoute(sSMapNO,nSMapX,nSMapY,sDMapNO,nDMapX,nDMapY);

      Result := 1;
      Query.Next;
    end;
  finally
    Query.Close;
  end;
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;
end;


procedure TFrmDB.QFunctionNPC;
var
  sScriptFile :String;
  sScritpDir  :String;
  SaveList    :TStringList;
  sShowFile   :String;
begin
try
  sScriptFile:=g_Config.sEnvirDir + sMarket_Def + 'QFunction-0.txt';
  sShowFile:=ReplaceChar(sScriptFile,'\','/');
  sScritpDir:=g_Config.sEnvirDir + sMarket_Def;
  if not DirectoryExists(sScritpDir) then
    mkdir(Pchar(sScritpDir));

  if not FileExists(sScriptFile) then begin
    SaveList:=TStringList.Create;
    SaveList.Add(';此脚为功能脚本，用于实现各种与脚本有关的功能');
    SaveList.SaveToFile(sScriptFile);
    SaveList.Free;
  end;
  if FileExists(sScriptFile) then begin
    g_FunctionNPC:=TMerchant.Create;
    g_FunctionNPC.m_sMapName  := '0';
    g_FunctionNPC.m_nCurrX    := 0;
    g_FunctionNPC.m_nCurrY    := 0;
    g_FunctionNPC.m_sCharName := 'QFunction';
    g_FunctionNPC.m_nFlag     := 0;
    g_FunctionNPC.m_wAppr     := 0;
    g_FunctionNPC.m_sFilePath := sMarket_Def;
    g_FunctionNPC.m_sScript   := 'QFunction';
    g_FunctionNPC.m_boIsHide  := True;
    g_FunctionNPC.m_boIsQuest := False;
    UserEngine.AddMerchant(g_FunctionNPC);
  end else begin
    g_FunctionNPC:=nil;
  end;
except
  g_FunctionNPC:=nil;
end;
end;

procedure TFrmDB.QMangeNPC();
var
  sScriptFile :String;
  sScritpDir  :String;
  SaveList    :TStringList;
  sShowFile   :String;
begin
try
  sScriptFile:=g_Config.sEnvirDir + 'MapQuest_def\' + 'QManage.txt';
  sShowFile:=ReplaceChar(sScriptFile,'\','/');
  sScritpDir:=g_Config.sEnvirDir + 'MapQuest_def\';
  if not DirectoryExists(sScritpDir) then
    mkdir(Pchar(sScritpDir));

  if not FileExists(sScriptFile) then begin
    SaveList:=TStringList.Create;
    SaveList.Add(';此脚为登录脚本，人物每次登录时都会执行此脚本，所有人物初始设置都可以放在此脚本中。');
    SaveList.Add(';修改脚本内容，可用@ReloadManage命令重新加载该脚本，不须重启程序。');
    SaveList.Add('[@Login]');
    SaveList.Add('#if');
    SaveList.Add('#act');
//    tSaveList.Add(';设置10倍杀怪经验');    
//    tSaveList.Add(';CANGETEXP 1 10');
    SaveList.Add('#say');
    SaveList.Add('翎风游戏登录脚本运行成功，欢迎进入本游戏！！！\ \');
    SaveList.Add('<关闭/@exit> \ \');
    SaveList.Add('登录脚本文件位于: \');
    SaveList.Add(sShowFile + '\');
    SaveList.Add('脚本内容请自行按自己的要求修改。');
    SaveList.SaveToFile(sScriptFile);
    SaveList.Free;
  end;
  if FileExists(sScriptFile) then begin
    g_ManageNPC:=TMerchant.Create;
    g_ManageNPC.m_sMapName:='0';
    g_ManageNPC.m_nCurrX:=0;
    g_ManageNPC.m_nCurrY:=0;
    g_ManageNPC.m_sCharName:='QManage';
    g_ManageNPC.m_nFlag:=0;
    g_ManageNPC.m_wAppr:=0;
    g_ManageNPC.m_sFilePath:='MapQuest_def\';
    g_ManageNPC.m_boIsHide:=True;
    g_ManageNPC.m_boIsQuest:=False;
    UserEngine.QuestNPCList.Add(g_ManageNPC);
  end else begin
    g_ManageNPC:=nil;
  end;
except
  g_ManageNPC:=nil;
end;
end;
procedure TFrmDB.RobotNPC();
var
  sScriptFile:String;
  sScritpDir :String;
  tSaveList:TStringList;
begin
try
  sScriptFile:=g_Config.sEnvirDir + 'Robot_def\' + 'RobotManage.txt';
  sScritpDir:=g_Config.sEnvirDir + 'Robot_def\';
  if not DirectoryExists(sScritpDir) then
    mkdir(Pchar(sScritpDir));

  if not FileExists(sScriptFile) then begin
    tSaveList:=TStringList.Create;
    tSaveList.Add(';此脚为机器人专用脚本，用于机器人处理功能用的脚本。');
    tSaveList.SaveToFile(sScriptFile);
    tSaveList.Free;
  end;
  if FileExists(sScriptFile) then begin
    g_RobotNPC:=TMerchant.Create;
    g_RobotNPC.m_sMapName:='0';
    g_RobotNPC.m_nCurrX:=0;
    g_RobotNPC.m_nCurrY:=0;
    g_RobotNPC.m_sCharName:='RobotManage';
    g_RobotNPC.m_nFlag:=0;
    g_RobotNPC.m_wAppr:=0;
    g_RobotNPC.m_sFilePath:='Robot_def\';
    g_RobotNPC.m_boIsHide:=True;
    g_RobotNPC.m_boIsQuest:=False;
    UserEngine.QuestNPCList.Add(g_RobotNPC);
  end else begin
    g_RobotNPC:=nil;
  end;
except
  g_RobotNPC:=nil;
end;
end;
//00489414
function TFrmDB.LoadMapQuest(): Integer;
var
  sFileName,tStr:String;
  tMapQuestList:TStringList;
  i:Integer;
  sMap,s1C,s20,sMonName,sItem,sQuest,s30,s34:String;
  n38,n3C:Integer;
  boGrouped:Boolean;
  Map:TEnvirnoment;
begin
    Result:=1;
    sFileName:=g_Config.sEnvirDir + 'MapQuest.txt';
    if FileExists(sFileName) then begin
      tMapQuestList:=TStringList.Create;
      tMapQuestList.LoadFromFile(sFileName);
      for i:=0 to tMapQuestList.Count -1 do begin
        tStr:=tMapQuestList.Strings[i];
        if (tStr <> '') and (tStr[1] <> ';') then begin
          tStr:=GetValidStr3(tStr, sMap, [' ', #9]);
          tStr:=GetValidStr3(tStr, s1C, [' ', #9]);
          tStr:=GetValidStr3(tStr, s20, [' ', #9]);
          tStr:=GetValidStr3(tStr, sMonName, [' ', #9]);
          if (sMonName <> '') and (sMonName[1] = '"') then
            ArrestStringEx(sMonName,'"','"',sMonName);
          tStr:=GetValidStr3(tStr, sItem, [' ', #9]);
          if (sItem <> '') and (sItem[1] = '"') then
            ArrestStringEx(sItem,'"','"',sItem);
          tStr:=GetValidStr3(tStr, sQuest, [' ', #9]);
          tStr:=GetValidStr3(tStr, s30, [' ', #9]);
          if (sMap <> '') and (sMonName <> '') and (sQuest <> '') then begin
            Map:=g_MapManager.FindMap(sMap);
            if Map <> nil then begin
              ArrestStringEx(s1C,'[',']',s34);
              n38:=Str_ToInt(s34,0);
              n3C:=Str_ToInt(s20,0);
              if CompareLStr(s30,'GROUP',length('GROUP')) then boGrouped:=True
              else boGrouped:=False;
              if not Map.CreateQuest(n38,n3C,sMonName,sItem,sQuest,boGrouped) then Result:= -i;
              //nFlag,boFlag,Monster,Item,Quest,boGrouped
            end else Result:= -i;
          end else Result:= -i;
        end;
      end;
      tMapQuestList.Free;
    end;
    QMangeNPC();
    QFunctionNPC();
    RobotNPC();
end;


function TFrmDB.LoadMerchant(): Integer;
var
  i:Integer;
  boUse:Boolean;
  tMerchantNPC:TMerchant;
ResourceString
  sSQLString = 'SELECT * FROM TBL_MERCHANT';
begin
  Result:= -1;
  EnterCriticalSection(ProcessHumanCriticalSection);
  try
  try
    Query.SQL.Clear;
    Query.SQL.Add(sSQLString);
    try
      Query.Open;
    finally
      Result:= -2;
    end;
    for i:=0 to Query.RecordCount -1 do begin
      boUse                       := Query.FieldByName('FLD_ENABLED').AsBoolean;
      if boUse then begin
        tMerchantNPC:=TMerchant.Create;

        tMerchantNPC.m_sScript      := Query.FieldByName('FLD_SCRIPTFILE').AsString;
        tMerchantNPC.m_sMapName     := Query.FieldByName('FLD_MAPNAME').AsString;
        tMerchantNPC.m_nCurrX       := Query.FieldByName('FLD_X').AsInteger;
        tMerchantNPC.m_nCurrY       := Query.FieldByName('FLD_Y').AsInteger;
        tMerchantNPC.m_sCharName    := Query.FieldByName('FLD_NAME').AsString;
        tMerchantNPC.m_nFlag        := Query.FieldByName('FLD_FLAG').AsInteger;
        tMerchantNPC.m_wAppr        := Query.FieldByName('FLD_APPEARANCE').AsInteger;
        tMerchantNPC.m_boCastle     := Query.FieldByName('FLD_ISCASTLE').AsBoolean;
        tMerchantNPC.m_boCanMove    := Query.FieldByName('FLD_CANMOVE').AsBoolean;
        tMerchantNPC.m_dwMoveTime   := Query.FieldByName('FLD_MOVETIME').AsInteger;
        
        if (tMerchantNPC.m_sScript <> '') and (tMerchantNPC.m_sMapName <> '') then
          UserEngine.AddMerchant(tMerchantNPC)
        else
          tMerchantNPC.Free;

      end;

      Result := 1;
      Query.Next;
    end;
  finally
    Query.Close;
  end;
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;
end;

//004867F4
function TFrmDB.LoadMonGen(): Integer;
var
  i:Integer;
  boLoads:Boolean;
  MonGenInfo:pTMonGenInfo;
ResourceString
  sSQLString = 'SELECT * FROM TBL_MONGEN ORDER BY FLD_MAPNAME';
begin
  Result:=0;
  EnterCriticalSection(ProcessHumanCriticalSection);
  try
    Query.SQL.Clear;
    Query.SQL.Add(sSQLString);
    try
      Query.Open;
    finally
      Result:= -1;
    end;
    for i:=0 to Query.RecordCount -1 do begin
      boLoads                 := Query.FieldByName('FLD_LOAD').AsBoolean;
      if boLoads then begin
        New(MonGenInfo);
        MonGenInfo.sMapName   := Trim(Query.FieldByName('FLD_MAPNAME').AsString);
        MonGenInfo.nX         := Query.FieldByName('FLD_X').AsInteger;
        MonGenInfo.nY         := Query.FieldByName('FLD_Y').AsInteger;
        MonGenInfo.sMonName   := Trim(Query.FieldByName('FLD_MONNAME').AsString);
        MonGenInfo.nRange     := Query.FieldByName('FLD_RANGE').AsInteger;
        MonGenInfo.nCount     := Query.FieldByName('FLD_COUNT').AsInteger;
        MonGenInfo.dwZenTime  := Query.FieldByName('FLD_GENTIME').AsInteger * 60 * 1000;
        MonGenInfo.nMissionGenRate  := Query.FieldByName('FLD_SMALLGENRATE').AsInteger;

        if (MonGenInfo.sMapName <> '') and
           (MonGenInfo.sMonName <> '') and
           (MonGenInfo.dwZenTime <> 0) and
           (g_MapManager.GetMapInfo(nServerIndex,MonGenInfo.sMapName) <> nil) then begin

          MonGenInfo.CertList:=TList.Create;
          MonGenInfo.Envir:=g_MapManager.FindMap(MonGenInfo.sMapName);
          if MonGenInfo.Envir <> nil then begin
            UserEngine.m_MonGenList.Add(MonGenInfo);
          end else begin
            Dispose(MonGenInfo);
          end;
        end;
      end;

      Result := 1;
      Query.Next;
    end;
    Query.Close;
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;
end;

//00485E04
function TFrmDB.LoadMonsterDB():Integer;
var
  i:Integer;
  Monster:pTMonInfo;
ResourceString
  sSQLString = 'SELECT * FROM TBL_MONSTER';
begin
  Result:=0;
  EnterCriticalSection(ProcessHumanCriticalSection);
  try
    for I := 0 to UserEngine.MonsterList.Count - 1 do begin
      Dispose(pTMonInfo(UserEngine.MonsterList.Items[I]));
    end;
    UserEngine.MonsterList.Clear;

    Query.SQL.Clear;
    Query.SQL.Add(sSQLString);
    try
      Query.Open;
    finally
      Result:= -1;
    end;
    for i:=0 to Query.RecordCount -1 do begin
      New(Monster);
      Monster.ItemList     := TList.Create;
      Monster.sName        := Trim(Query.FieldByName('FLD_NAME').AsString);
      Monster.btRace       := Query.FieldByName('FLD_RACE').AsInteger;
      Monster.btRaceImg    := Query.FieldByName('FLD_RACEIMG').AsInteger;
      Monster.wAppr        := Query.FieldByName('FLD_IMGINDEX').AsInteger;
      Monster.wLevel       := Query.FieldByName('FLD_LV').AsInteger;
      Monster.btLifeAttrib := Query.FieldByName('FLD_UNDEAD').AsInteger;
      Monster.wCoolEye     := Query.FieldByName('FLD_COOLEYE').AsInteger;
      Monster.dwExp        := Query.FieldByName('FLD_EXP').AsInteger;

      //城门或城墙的状态跟HP值有关，如果HP异常，将导致城墙显示不了
      if Monster.btRace in [110,111] then begin //如果为城墙或城门由HP不加倍
        Monster.wHP          := Query.FieldByName('FLD_HP').AsInteger;
      end else begin
        Monster.wHP          := ROUND(Query.FieldByName('FLD_HP').AsInteger * (g_Config.nMonsterPowerRate / 10));
      end;

      Monster.wMP          := ROUND(Query.FieldByName('FLD_MP').AsInteger * (g_Config.nMonsterPowerRate / 10));
      Monster.wAC          := ROUND(Query.FieldByName('FLD_AC').AsInteger * (g_Config.nMonsterPowerRate / 10));
      Monster.wMAC         := ROUND(Query.FieldByName('FLD_MAC').AsInteger * (g_Config.nMonsterPowerRate / 10));
      Monster.wDC          := ROUND(Query.FieldByName('FLD_DC').AsInteger * (g_Config.nMonsterPowerRate / 10));
      Monster.wMaxDC       := ROUND(Query.FieldByName('FLD_DCMAX').AsInteger * (g_Config.nMonsterPowerRate / 10));
      Monster.wMC          := ROUND(Query.FieldByName('FLD_MC').AsInteger * (g_Config.nMonsterPowerRate / 10));
      Monster.wSC          := ROUND(Query.FieldByName('FLD_SC').AsInteger * (g_Config.nMonsterPowerRate / 10));
      Monster.wSpeed       := Query.FieldByName('FLD_AGILITY').AsInteger;
      Monster.wHitPoint    := Query.FieldByName('FLD_ACCURATE').AsInteger;
      Monster.wWalkSpeed   := _MAX(200,Query.FieldByName('FLD_WALK_SPD').AsInteger);
      Monster.wWalkStep    := _MAX(1,Query.FieldByName('FLD_WALKSTEP').AsInteger);
      Monster.wWalkWait    := Query.FieldByName('FLD_WALKWAIT').AsInteger;
      Monster.wAttackSpeed := Query.FieldByName('FLD_ATTACK_SPD').AsInteger;
      Monster.wAntiPush    := Query.FieldByName('FLD_ATTACK_SPD').AsInteger;
      Monster.boAggro      := Query.FieldByName('FLD_AGGRO').AsBoolean;
      Monster.boTame       := Query.FieldByName('FLD_TAME').AsBoolean;

      if Monster.wWalkSpeed < 200 then Monster.wWalkSpeed:= 200;
      if Monster.wAttackSpeed < 200 then Monster.wAttackSpeed:= 200;
      Monster.ItemList:=nil;
      LoadMonitems(Monster.sName,Monster.ItemList);

      UserEngine.MonsterList.Add(Monster);
      Result := 1;
      Query.Next;
    end;
    Query.Close;
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;
end;

function TFrmDB.LoadMonitems(MonName:String;var ItemList:TList):Integer;//00485ABC
var
  I: Integer;
  s24:String;
  LoadList:TStringList;
  MonItem:pTMonItem;
  s28,s2C,s30:String;
  n18,n1C,n20:Integer;
begin
  Result:=0;
  s24:=g_Config.sEnvirDir + 'MonItems\' + MonName + '.txt';
  if FileExists(s24) then begin
    if ItemList <> nil then begin
      for I := 0 to Itemlist.Count - 1 do begin
        DisPose(pTMonItem(ItemList.Items[I]));
      end;
      ItemList.Clear;
    end; //00485B81
    LoadList:=TStringList.Create;
    LoadList.LoadFromFile(s24);
    for I := 0 to LoadList.Count - 1 do begin
      s28:=LoadList.Strings[I];
      if (s28 <> '') and (s28[1] <> ';') then begin
        s28:=GetValidStr3(s28,s30,[' ','/',#9]);
        n18:=Str_ToInt(s30,-1);
        s28:=GetValidStr3(s28,s30,[' ','/',#9]);
        n1C:=Str_ToInt(s30,-1);
        s28:=GetValidStr3(s28,s30,[' ',#9]);
        if s30 <> '' then begin
          if s30[1] = '"' then
            ArrestStringEx(s30,'"','"',s30);
        end;
        s2C:=s30;
        s28:=GetValidStr3(s28,s30,[' ',#9]);
        n20:=Str_ToInt(s30,1);
        if (n18 > 0) and (n1C > 0) and (s2C <> '') then begin
          if ItemList = nil then ItemList:=TList.Create;
          New(MonItem);
          MonItem.SelPoint:=n18 -1;
          MonItem.MaxPoint:=n1C;
          MonItem.ItemName:=s2C;
          MonItem.Count:=n20;
          ItemList.Add(MonItem);
          Inc(Result);
        end;
      end;
    end;
    LoadList.Free;
  end;
    
end;
//00488178
function TFrmDB.LoadNpcs(): Integer;
var
  i,nType:Integer;
  boUse:Boolean;
  NPC:TNormNpc;
ResourceString
  sSQLString = 'SELECT * FROM TBL_NPC';
begin
  Result:= -1;
  EnterCriticalSection(ProcessHumanCriticalSection);
  try
  try
    Query.SQL.Clear;
    Query.SQL.Add(sSQLString);
    try
      Query.Open;
    finally
      Result:= -2;
    end;
    for i:=0 to Query.RecordCount -1 do begin
      boUse                       := Query.FieldByName('FLD_ENABLED').AsBoolean;
      if boUse then begin
        NPC:=nil;

        nType := Query.FieldByName('FLD_TYPE').AsInteger;
        case nType of
          0: NPC:=TMerchant.Create;
          1: NPC:=TGuildOfficial.Create;
          2: NPC:=TCastleOfficial.Create;
        end;
        if NPC <> nil then begin
          NPC.m_sMapName            := Query.FieldByName('FLD_MAPNAME').AsString;
          NPC.m_nCurrX              := Query.FieldByName('FLD_X').AsInteger;
          NPC.m_nCurrY              := Query.FieldByName('FLD_Y').AsInteger;
          NPC.m_sCharName           := Query.FieldByName('FLD_NAME').AsString;
          NPC.m_nFlag               := Query.FieldByName('FLD_FLAG').AsInteger;
          NPC.m_wAppr               := Query.FieldByName('FLD_APPEARANCE').AsInteger;
          UserEngine.QuestNPCList.Add(NPC);
        end;
      end;

      Result := 1;
      Query.Next;
    end;
  finally
    Query.Close;
  end;
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;
end;
//00489840
function TFrmDB.LoadQuestDiary(): Integer;
  function sub_48978C(nIndex:Integer):String;
  begin
    if nIndex >= 1000 then begin
      Result:=IntToStr(nIndex);
      exit;
    end;
    if nIndex >= 100 then begin
      Result:=IntToStr(nIndex) + '0';
      exit;
    end;
    Result:=IntToStr(nIndex) + '00';
  end;
var
  i,ii:Integer;
  QDDinfoList:TList;
  QDDinfo:pTQDDinfo;
  s14,s18,s1C,s20:String;
  bo2D:Boolean;
  nC:Integer;
  LoadList:TStringList;
begin
    Result:=1;
    for i:=0 to QuestDiaryList.Count -1 do begin
       QDDinfoList:=QuestDiaryList.Items[i];
       for ii:=0 to QDDinfoList.Count -1 do begin
         QDDinfo:=QDDinfoList.Items[ii];
         QDDinfo.sList.Free;
         Dispose(QDDinfo);
       end;
       QDDinfoList.Free;
    end;
    QuestDiaryList.Clear;
    bo2D:=False;
    nC:=1;
    while (True) do begin
      QDDinfoList:=nil;
      s14:='QuestDiary\' + sub_48978C(nC) + '.txt';
      if FileExists(s14) then begin
        s18:='';
        QDDinfo:=nil;
        LoadList:=TStringList.Create;
        LoadList.LoadFromFile(s14);
        for i:=0 to LoadList.Count -1 do begin
          s1C:=LoadList.Strings[i];
          if (s1C <> '') and (s1C[1] <> ';') then begin
            if (s1C[1] = '[') and (length(s1C) > 2) then begin
              if s18 = '' then begin
                ArrestStringEx(s1C,'[',']',s18);
                QDDinfoList:=TList.Create;
                New(QDDinfo);
                QDDinfo.n00:=nC;
                QDDinfo.s04:=s18;
                QDDinfo.sList:=TStringList.Create;
                QDDinfoList.Add(QDDinfo);
                bo2D:=True;
              end else begin
                if s1C[1] <> '@' then begin
                  s1C:=GetValidStr3(s1C,s20,[' ',#9]);
                  ArrestStringEx(s20,'[',']',s20);
                  New(QDDinfo);
                  QDDinfo.n00:=Str_ToInt(s20,0);
                  QDDinfo.s04:=s1C;
                  QDDinfo.sList:=TStringList.Create;
                  QDDinfoList.Add(QDDinfo);
                  bo2D:=True;
                end else bo2D:=False;
              end;
            end else begin //00489AFD
              if bo2D then QDDinfo.sList.Add(s1C);
            end;
          end;//00489B11
        end;
        LoadList.Free;
      end;//00489B25
      if QDDinfoList <> nil then QuestDiaryList.Add(QDDinfoList)
      else QuestDiaryList.Add(nil);
      Inc(nC);
      if nC >= 105 then break;
    end;

end;
//00488EF0
function TFrmDB.LoadStartPoint(): Integer;
var
  i:Integer;
  sMap:String;
  StartPoint:pTStartPoint;
ResourceString
  sSQLString = 'SELECT * FROM TBL_STARTPOINT';
begin
  Result:= -1;
  EnterCriticalSection(ProcessHumanCriticalSection);
  try
    Query.SQL.Clear;
    Query.SQL.Add(sSQLString);
    try
      Query.Open;
    finally
      Result:= -2;
    end;

    try
      g_StartPoint.Lock;
      for I := 0 to g_StartPoint.Count - 1 do begin
        Dispose(pTStartPoint(g_StartPoint.Items[I]));
      end;
      g_StartPoint.Clear;

      for i:=0 to Query.RecordCount -1 do begin
        sMap                          := Query.FieldByName('FLD_MAPNAME').AsString;
        if (sMap <> '') then begin
          New(StartPoint);
          StartPoint.sMapName         := sMap;
          StartPoint.nX               := Query.FieldByName('FLD_X').AsInteger;
          StartPoint.nY               := Query.FieldByName('FLD_Y').AsInteger;
          StartPoint.Envir            := g_MapManager.FindMap(sMap);
          StartPoint.btJob            := 99;
          StartPoint.dwWhisperTick    := GetTickCount();
          g_StartPoint.Add(StartPoint);
          Result:=1;
        end;
        Query.Next;
      end;
    finally
      g_StartPoint.UnLock;
    end;
    Query.Close;
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;
end;
//00489240
function TFrmDB.LoadUnbindList(): Integer;
var
  sFileName,tStr,sData,s20:String;
  tUnbind:pTUnbindInfo;
  LoadList:TStringList;
  i:Integer;
  n10:Integer;
begin
    Result:=0;
    sFileName:=g_Config.sEnvirDir + 'UnbindList.txt';
    if FileExists(sFileName) then begin
      LoadList:=TStringList.Create;
      LoadList.LoadFromFile(sFileName);
      for i:=0 to LoadList.Count -1 do begin
        tStr:=LoadList.Strings[i];
        if (tStr <> '') and (tStr[1] <> ';') then begin
          //New(tUnbind);
          tStr:=GetValidStr3(tStr, sData, [' ', #9]);
          tStr:=GetValidStrCap(tStr, s20, [' ', #9]);
          if (s20 <> '') and (s20[1] = '"') then
            ArrestStringEx(s20,'"','"',s20);

          n10:=Str_ToInt(sData,0);
          if n10 > 0 then g_UnbindList.AddObject(s20,TObject(n10))
          else begin
            Result:=-i;  //需要取负数
            break;
          end;
        end;
      end;
      LoadList.Free;
    end;
end;

function TFrmDB.LoadNpcScript(NPC: TNormNpc; sPatch,
  sScritpName: String): Integer; //0048C4D8
begin
  if sPatch = '' then sPatch:=sNpc_def;
  Result:=LoadScriptFile(NPC,sPatch,sScritpName,False);
end;

function TFrmDB.LoadScriptFile(NPC: TNormNpc; sPatch, sScritpName: String;
  boFlag: Boolean): Integer; //0048B684
var
  nQuestIdx,I,n1C,n20,n24,nItemType,nPriceRate: Integer;
  n6C,n70:Integer;
  sScritpFileName,s30,s34,s38,s3C,s40,s44,s48,s4C,s50:String;
  LoadList:TStringList;
  DefineList:TList;
  s54,s58,s5C,s74:String;
  DefineInfo:pTDefineInfo;
  bo8D:Boolean;
  Script:pTScript;
  SayingRecord:pTSayingRecord;
  SayingProcedure:pTSayingProcedure;
  QuestConditionInfo:pTQuestConditionInfo;
  QuestActionInfo:pTQuestActionInfo;
  Goods:pTGoods;
  function LoadCallScript(sFileName,sLabel:String;List:TStringList):Boolean; //00489BD4
  var
    I: Integer;
    LoadStrList:TStringList;
    bo1D:Boolean;
    s18:String;
  begin
    Result:=False;
    if FileExists(sFileName) then begin
      LoadStrList:=TStringList.Create;
      LoadStrList.LoadFromFile(sFileName);
      DeCodeStringList(LoadStrList);
      sLabel:='[' + sLabel + ']';
      bo1D:=False;
      for I := 0 to LoadStrList.Count - 1 do begin
        s18:=Trim(LoadStrList.Strings[i]);
        if s18 <> '' then begin
          if not bo1D then begin
            if (s18[1] = '[') and (CompareText(s18,sLabel) = 0) then begin
              bo1D:=True;
              List.Add(s18);
            end;              
          end else begin //00489CBF
            if s18[1] <> '{'  then begin
              if s18[1] = '}'  then begin
                bo1D:=False;
                Result:=True;
                break;
              end else begin  //00489CD9
                List.Add(s18);
              end;
            end;
          end;
        end; //00489CE4 if s18 <> '' then begin
      end; // for I := 0 to LoadStrList.Count - 1 do begin
      LoadStrList.Free;
    end;
      
  end;
  procedure LoadScriptcall(LoadList:TStringList); //0048B138
  var
    I: Integer;
    s14,s18,s1C,s20,s34:String;
  begin
    for I := 0 to LoadList.Count - 1 do begin
      s14:=Trim(LoadList.Strings[i]);
      if (s14 <> '') and (s14[1] = '#') and (CompareLStr(s14,'#CALL',length('#CALL'))) then begin
        s14:=ArrestStringEx(s14,'[',']',s1C);
        s20:=Trim(s1C);
        s18:=Trim(s14);
        s34:=g_Config.sEnvirDir + 'QuestDiary\' + s20;
        if LoadCallScript(s34,s18,LoadList) then begin
          LoadList.Strings[i]:='#ACT';
          LoadList.Insert(i + 1,'goto ' + s18);
        end else begin
          MainOutMessage('script error, load fail: ' + s20 + s18);
        end;
      end;
    end;
  end;

  function LoadDefineInfo(LoadList:TStringList;List:TList):String; //0048B35C
  var
    I: Integer;
    s14,s28,s1C,s20,s24:String;
    DefineInfo:pTDefineInfo;
    LoadStrList:TStringList;
  begin
    for I := 0 to LoadList.Count - 1 do begin
      s14:=Trim(LoadList.Strings[i]);
      if (s14 <> '') and (s14[1] = '#') then begin
        if CompareLStr(s14,'#SETHOME',length('#SETHOME')) then begin
          Result:=Trim(GetValidStr3(s14,s1C,[' ',#9]));
          LoadList.Strings[i]:='';
        end;
        if CompareLStr(s14,'#DEFINE',length('#DEFINE')) then begin
          s14:=(GetValidStr3(s14,s1C,[' ',#9]));
          s14:=(GetValidStr3(s14,s20,[' ',#9]));
          s14:=(GetValidStr3(s14,s24,[' ',#9]));
          New(DefineInfo);
          DefineInfo.sName:=UpperCase(s20);
          DefineInfo.sText:=s24;
          List.Add(DefineInfo);
          LoadList.Strings[i]:='';
        end; //0048B505
        if CompareLStr(s14,'#INCLUDE',length('#INCLUDE')) then begin
          s28:=Trim(GetValidStr3(s14,s1C,[' ',#9]));
          s28:=g_Config.sEnvirDir + 'Defines\' + s28;
          if FileExists(s28) then begin
            LoadStrList:=TStringList.Create;
            LoadStrList.LoadFromFile(s28);
            Result:=LoadDefineInfo(LoadStrList,List);
            LoadStrList.Free;
          end else begin
            MainOutMessage('script error, load fail: ' + s28);
          end;
          LoadList.Strings[i]:='';
        end;
      end;
    end;
  end;
  function MakeNewScript():pTScript; //00489D74
  var
    ScriptInfo:pTScript;
  begin
    New(ScriptInfo);
    ScriptInfo.boQuest:=False;
    FillChar(ScriptInfo.QuestInfo,SizeOf(TQuestInfo),#0);
    nQuestIdx:=0;
    ScriptInfo.RecordList:=TList.Create;
    NPC.m_ScriptList.Add(ScriptInfo);
    Result:=ScriptInfo;
  end;
  function QuestCondition(sText:String;QuestConditionInfo:pTQuestConditionInfo):Boolean; //00489DDC
  var
    sCmd,sParam1,sParam2,sParam3,sParam4,sParam5,sParam6:String;
    nCMDCode:Integer;
  Label L001;
  begin
    Result:=False;
    sText:=GetValidStrCap(sText,sCmd,[' ',#9]);
    sText:=GetValidStrCap(sText,sParam1,[' ',#9]);
    sText:=GetValidStrCap(sText,sParam2,[' ',#9]);
    sText:=GetValidStrCap(sText,sParam3,[' ',#9]);
    sText:=GetValidStrCap(sText,sParam4,[' ',#9]);
    sText:=GetValidStrCap(sText,sParam5,[' ',#9]);
    sText:=GetValidStrCap(sText,sParam6,[' ',#9]);
    sCmd:=UpperCase(sCmd);
    nCMDCode:=0;
    if sCmd = sCHECK then begin
      nCMDCode:=nCHECK;
      ArrestStringEx(sParam1,'[',']',sParam1);
      if not IsStringNumber(sParam1) then nCMDCode:=0;
      if not IsStringNumber(sParam2) then nCMDCode:=0;
      Goto L001;
    end;
    if sCmd = sCHECKOPEN then begin
      nCMDCode:=nCHECKOPEN;
      ArrestStringEx(sParam1,'[',']',sParam1);
      if not IsStringNumber(sParam1) then nCMDCode:=0;
      if not IsStringNumber(sParam2) then nCMDCode:=0;
      Goto L001;
    end;

    if sCmd = sCHECKUNIT then begin
      nCMDCode:=nCHECKUNIT;
      ArrestStringEx(sParam1,'[',']',sParam1);
      if not IsStringNumber(sParam1) then nCMDCode:=0;
      if not IsStringNumber(sParam2) then nCMDCode:=0;
      Goto L001;
    end;
    if sCmd = sCHECKPKPOINT then begin
      nCMDCode:=nCHECKPKPOINT;
      Goto L001;
    end;
    if sCmd = sCHECKGOLD then begin
      nCMDCode:=nCHECKGOLD;
      Goto L001;
    end;
    if sCmd = sCHECKLEVEL then begin
      nCMDCode:=nCHECKLEVEL;
      Goto L001;
    end;
    if sCmd = sCHECKJOB then begin
      nCMDCode:=nCHECKJOB;
      Goto L001;
    end;
    if sCmd = sRANDOM then begin //00489FB2
      nCMDCode:=nRANDOM;
      Goto L001;
    end;
    if sCmd = sCHECKITEM then begin
      nCMDCode:=nCHECKITEM;
      Goto L001;
    end;
    if sCmd = sGENDER then begin
      nCMDCode:=nGENDER;
      Goto L001;
    end;
    if sCmd = sCHECKBAGGAGE then begin
      nCMDCode:=nCHECKBAGGAGE;
      Goto L001;
    end;

    if sCmd = sCHECKNAMELIST then begin
      nCMDCode:=nCHECKNAMELIST;
      Goto L001;
    end;
    if sCmd = sSC_HASGUILD then begin
      nCMDCode:=nSC_HASGUILD;
      Goto L001;
    end;

    if sCmd = sSC_ISGUILDMASTER then begin
      nCMDCode:=nSC_ISGUILDMASTER;
      Goto L001;
    end;
    if sCmd = sSC_CHECKCASTLEMASTER then begin
      nCMDCode:=nSC_CHECKCASTLEMASTER;
      Goto L001;
    end;
    if sCmd = sSC_ISNEWHUMAN then begin
      nCMDCode:=nSC_ISNEWHUMAN;
      Goto L001;
    end;
    if sCmd = sSC_CHECKMEMBERTYPE then begin
      nCMDCode:=nSC_CHECKMEMBERTYPE;
      Goto L001;
    end;
    if sCmd = sSC_CHECKMEMBERLEVEL then begin
      nCMDCode:=nSC_CHECKMEMBERLEVEL;
      Goto L001;
    end;
    if sCmd = sSC_CHECKGAMEGOLD then begin
      nCMDCode:=nSC_CHECKGAMEGOLD;
      Goto L001;
    end;
    if sCmd = sSC_CHECKGAMEPOINT then begin
      nCMDCode:=nSC_CHECKGAMEPOINT;
      Goto L001;
    end;
    if sCmd = sSC_CHECKNAMELISTPOSITION then begin
      nCMDCode:=nSC_CHECKNAMELISTPOSITION;
      Goto L001;
    end;
    if sCmd = sSC_CHECKGUILDLIST then begin
      nCMDCode:=nSC_CHECKGUILDLIST;
      Goto L001;
    end;
    if sCmd = sSC_CHECKRENEWLEVEL then begin
      nCMDCode:=nSC_CHECKRENEWLEVEL;
      Goto L001;
    end;
    if sCmd = sSC_CHECKSLAVELEVEL then begin
      nCMDCode:=nSC_CHECKSLAVELEVEL;
      Goto L001;
    end;
    if sCmd = sSC_CHECKSLAVENAME then begin
      nCMDCode:=nSC_CHECKSLAVENAME;
      Goto L001;
    end;
    if sCmd = sSC_CHECKCREDITPOINT then begin
      nCMDCode:=nSC_CHECKCREDITPOINT;
      Goto L001;
    end;
    if sCmd = sSC_CHECKOFGUILD then begin
      nCMDCode:=nSC_CHECKOFGUILD;
      Goto L001;
    end;
    if sCmd = sSC_CHECKPAYMENT then begin
      nCMDCode:=nSC_CHECKPAYMENT;
      Goto L001;
    end;

    if sCmd = sSC_CHECKUSEITEM then begin
      nCMDCode:=nSC_CHECKUSEITEM;
      Goto L001;
    end;
    if sCmd = sSC_CHECKBAGSIZE then begin
      nCMDCode:=nSC_CHECKBAGSIZE;
      Goto L001;
    end;
    if sCmd = sSC_CHECKLISTCOUNT then begin
      nCMDCode:=nSC_CHECKLISTCOUNT;
      Goto L001;
    end;
    if sCmd = sSC_CHECKDC then begin
      nCMDCode:=nSC_CHECKDC;
      Goto L001;
    end;
    if sCmd = sSC_CHECKMC then begin
      nCMDCode:=nSC_CHECKMC;
      Goto L001;
    end;
    if sCmd = sSC_CHECKSC then begin
      nCMDCode:=nSC_CHECKSC;
      Goto L001;
    end;
    if sCmd = sSC_CHECKHP then begin
      nCMDCode:=nSC_CHECKHP;
      Goto L001;
    end;
    if sCmd = sSC_CHECKMP then begin
      nCMDCode:=nSC_CHECKMP;
      Goto L001;
    end;
    if sCmd = sSC_CHECKITEMTYPE then begin
      nCMDCode:=nSC_CHECKITEMTYPE;
      Goto L001;
    end;
    if sCmd = sSC_CHECKEXP then begin
      nCMDCode:=nSC_CHECKEXP;
      Goto L001;
    end;
    if sCmd = sSC_CHECKCASTLEGOLD then begin
      nCMDCode:=nSC_CHECKCASTLEGOLD;
      Goto L001;
    end;
    if sCmd = sSC_PASSWORDERRORCOUNT then begin
      nCMDCode:=nSC_PASSWORDERRORCOUNT;
      Goto L001;
    end;
    if sCmd = sSC_ISLOCKPASSWORD then begin
      nCMDCode:=nSC_ISLOCKPASSWORD;
      Goto L001;
    end;
    if sCmd = sSC_ISLOCKSTORAGE then begin
      nCMDCode:=nSC_ISLOCKSTORAGE;
      Goto L001;
    end;
    if sCmd = sSC_CHECKBUILDPOINT then begin
      nCMDCode:=nSC_CHECKBUILDPOINT;
      Goto L001;
    end;
    if sCmd = sSC_CHECKAURAEPOINT then begin
      nCMDCode:=nSC_CHECKAURAEPOINT;
      Goto L001;
    end;
    if sCmd = sSC_CHECKSTABILITYPOINT then begin
      nCMDCode:=nSC_CHECKSTABILITYPOINT;
      Goto L001;
    end;
    if sCmd = sSC_CHECKFLOURISHPOINT then begin
      nCMDCode:=nSC_CHECKFLOURISHPOINT;
      Goto L001;
    end;
    if sCmd = sSC_CHECKCONTRIBUTION then begin
      nCMDCode:=nSC_CHECKCONTRIBUTION;
      Goto L001;
    end;
    if sCmd = sSC_CHECKRANGEMONCOUNT then begin
      nCMDCode:=nSC_CHECKRANGEMONCOUNT;
      Goto L001;
    end;
    if sCmd = sSC_CHECKITEMADDVALUE then begin
      nCMDCode:=nSC_CHECKITEMADDVALUE;
      Goto L001;
    end;
{$IF SoftVersion = VERENT}
    if sCmd = sSC_CHECKINMAPRANGE then begin
      nCMDCode:=nSC_CHECKINMAPRANGE;
      Goto L001;
    end;
{$IFEND}
    if sCmd = sSC_CASTLECHANGEDAY then begin
      nCMDCode:=nSC_CASTLECHANGEDAY;
      Goto L001;
    end;
    if sCmd = sSC_CASTLEWARDAY then begin
      nCMDCode:=nSC_CASTLEWARDAY;
      Goto L001;
    end;
    if sCmd = sSC_ONLINELONGMIN then begin
      nCMDCode:=nSC_ONLINELONGMIN;
      Goto L001;
    end;
    if sCmd = sSC_CHECKGUILDCHIEFITEMCOUNT then begin
      nCMDCode:=nSC_CHECKGUILDCHIEFITEMCOUNT;
      Goto L001;
    end;
    if sCmd = sSC_CHECKNAMEDATELIST then begin
      nCMDCode:=nSC_CHECKNAMEDATELIST;
      Goto L001;
    end;
    if sCmd = sSC_CHECKMAPHUMANCOUNT then begin
      nCMDCode:=nSC_CHECKMAPHUMANCOUNT;
      Goto L001;
    end;
    if sCmd = sSC_CHECKMAPMONCOUNT then begin
      nCMDCode:=nSC_CHECKMAPMONCOUNT;
      Goto L001;
    end;
    if sCmd = sSC_CHECKVAR then begin
      nCMDCode:=nSC_CHECKVAR;
      Goto L001;
    end;
    if sCmd = sSC_CHECKSERVERNAME then begin
      nCMDCode:=nSC_CHECKSERVERNAME;
      Goto L001;
    end;

    if sCmd = sSC_ISATTACKGUILD then begin
      nCMDCode:=nSC_ISATTACKGUILD;
      Goto L001;
    end;
    if sCmd = sSC_ISDEFENSEGUILD then begin
      nCMDCode:=nSC_ISDEFENSEGUILD;
      Goto L001;
    end;

    if sCmd = sSC_ISATTACKALLYGUILD then begin
      nCMDCode:=nSC_ISATTACKALLYGUILD;
      Goto L001;
    end;
    if sCmd = sSC_ISDEFENSEALLYGUILD then begin
      nCMDCode:=nSC_ISDEFENSEALLYGUILD;
      Goto L001;
    end;

    if sCmd = sSC_ISCASTLEGUILD then begin
      nCMDCode:=nSC_ISCASTLEGUILD;
      Goto L001;
    end;
    if sCmd = sSC_CHECKCASTLEDOOR then begin
      nCMDCode:=nSC_CHECKCASTLEDOOR;
      Goto L001;
    end;

    if sCmd = sSC_ISSYSOP then begin
      nCMDCode:=nSC_ISSYSOP;
      Goto L001;
    end;
    if sCmd = sSC_ISADMIN then begin
      nCMDCode:=nSC_ISADMIN;
      Goto L001;
    end;
    if sCmd = sSC_CHECKGROUPCOUNT then begin
      nCMDCode:=nSC_CHECKGROUPCOUNT;
      Goto L001;
    end;

    if sCmd = sCHECKACCOUNTLIST then begin
      nCMDCode:=nCHECKACCOUNTLIST;
      Goto L001;
    end;
    if sCmd = sCHECKIPLIST then begin
      nCMDCode:=nCHECKIPLIST;
      Goto L001;
    end;
    if sCmd = sCHECKBBCOUNT then begin
      nCMDCode:=nCHECKBBCOUNT;
      Goto L001;
    end;
    if sCmd = sCHECKCREDITPOINT then begin
      nCMDCode:=nCHECKCREDITPOINT;
      Goto L001;
    end;

    if sCmd = sDAYTIME then begin
      nCMDCode:=nDAYTIME;
      Goto L001;
    end;
    if sCmd = sCHECKITEMW then begin
      nCMDCode:=nCHECKITEMW;
      Goto L001;
    end;
    if sCmd = sISTAKEITEM then begin
      nCMDCode:=nISTAKEITEM;
      Goto L001;
    end;
    if sCmd = sCHECKDURA then begin
      nCMDCode:=nCHECKDURA;
      Goto L001;
    end;
    if sCmd = sCHECKDURAEVA then begin
      nCMDCode:=nCHECKDURAEVA;
      Goto L001;
    end;
    if sCmd = sDAYOFWEEK then begin
      nCMDCode:=nDAYOFWEEK;
      Goto L001;
    end;
    if sCmd = sHOUR then begin
      nCMDCode:=nHOUR;
      Goto L001;
    end;
    if sCmd = sMIN then begin
      nCMDCode:=nMIN;
      Goto L001;
    end;
    if sCmd = sCHECKLUCKYPOINT then begin
      nCMDCode:=nCHECKLUCKYPOINT;
      Goto L001;
    end;
    if sCmd = sCHECKMONMAP then begin
      nCMDCode:=nCHECKMONMAP;
      Goto L001;
    end;
    if sCmd = sCHECKMONAREA then begin
      nCMDCode:=nCHECKMONAREA;
      Goto L001;
    end;
    if sCmd = sCHECKHUM then begin
      nCMDCode:=nCHECKHUM;
      Goto L001;
    end;
    if sCmd = sEQUAL then begin
      nCMDCode:=nEQUAL;
      Goto L001;
    end;

    if sCmd = sLARGE then begin
      nCMDCode:=nLARGE;
      Goto L001;
    end;

    if sCmd = sSMALL then begin
      nCMDCode:=nSMALL;
      Goto L001;
    end;

    if sCmd = sSC_CHECKPOSEDIR then begin
      nCMDCode:=nSC_CHECKPOSEDIR;
      Goto L001;
    end;

    if sCmd = sSC_CHECKPOSELEVEL then begin
      nCMDCode:=nSC_CHECKPOSELEVEL;
      Goto L001;
    end;

    if sCmd = sSC_CHECKPOSEGENDER then begin
      nCMDCode:=nSC_CHECKPOSEGENDER;
      Goto L001;
    end;

    if sCmd = sSC_CHECKLEVELEX then begin
      nCMDCode:=nSC_CHECKLEVELEX;
      Goto L001;
    end;

    if sCmd = sSC_CHECKBONUSPOINT then begin
      nCMDCode:=nSC_CHECKBONUSPOINT;
      Goto L001;
    end;

    if sCmd = sSC_CHECKMARRY then begin
      nCMDCode:=nSC_CHECKMARRY;
      Goto L001;
    end;
    if sCmd = sSC_CHECKPOSEMARRY then begin
      nCMDCode:=nSC_CHECKPOSEMARRY;
      Goto L001;
    end;
    if sCmd = sSC_CHECKMARRYCOUNT then begin
      nCMDCode:=nSC_CHECKMARRYCOUNT;
      Goto L001;
    end;
    if sCmd = sSC_CHECKMASTER then begin
      nCMDCode:=nSC_CHECKMASTER;
      Goto L001;
    end;
    if sCmd = sSC_HAVEMASTER then begin
      nCMDCode:=nSC_HAVEMASTER;
      Goto L001;
    end;
    if sCmd = sSC_CHECKPOSEMASTER then begin
      nCMDCode:=nSC_CHECKPOSEMASTER;
      Goto L001;
    end;
    if sCmd = sSC_POSEHAVEMASTER then begin
      nCMDCode:=nSC_POSEHAVEMASTER;
      Goto L001;
    end;
    if sCmd = sSC_CHECKISMASTER then begin
      nCMDCode:=nSC_CHECKISMASTER;
      Goto L001;
    end;
    if sCmd = sSC_CHECKPOSEISMASTER then begin
      nCMDCode:=nSC_CHECKPOSEISMASTER;
      Goto L001;
    end;
    if sCmd = sSC_CHECKNAMEIPLIST then begin
      nCMDCode:=nSC_CHECKNAMEIPLIST;
      Goto L001;
    end;
    if sCmd = sSC_CHECKACCOUNTIPLIST then begin
      nCMDCode:=nSC_CHECKACCOUNTIPLIST;
      Goto L001;
    end;
    if sCmd = sSC_CHECKSLAVECOUNT then begin
      nCMDCode:=nSC_CHECKSLAVECOUNT;
      Goto L001;
    end;

    if sCmd = sSC_CHECKPOS then begin
      nCMDCode:=nSC_CHECKPOS;
      Goto L001;
    end;
    if sCmd = sSC_CHECKMAP then begin
      nCMDCode:=nSC_CHECKMAP;
      Goto L001;
    end;
    if sCmd = sSC_REVIVESLAVE then begin
      nCMDCode:=nSC_REVIVESLAVE;
      Goto L001;
    end;
    if sCmd = sSC_CHECKMAGICLVL then begin
      nCMDCode:=nSC_CHECKMAGICLVL;
      Goto L001;
    end;
    if sCmd = sSC_CHECKGROUPCLASS then begin
      nCMDCode:=nSC_CHECKGROUPCLASS;
      Goto L001;
    end;
    //------------------------------


    L001:
    if nCMDCode > 0 then begin
      QuestConditionInfo.nCmdCode:=nCMDCode;
      if (sParam1 <> '') and (sParam1[1] = '"') then begin
        ArrestStringEx(sParam1,'"','"',sParam1);
      end;
      if (sParam2 <> '') and (sParam2[1] = '"') then begin
        ArrestStringEx(sParam2,'"','"',sParam2);
      end;
      if (sParam3 <> '') and (sParam3[1] = '"') then begin
        ArrestStringEx(sParam3,'"','"',sParam3);
      end;
      if (sParam4 <> '') and (sParam4[1] = '"') then begin
        ArrestStringEx(sParam4,'"','"',sParam4);
      end;
      if (sParam5 <> '') and (sParam5[1] = '"') then begin
        ArrestStringEx(sParam5,'"','"',sParam5);
      end;
      if (sParam6 <> '') and (sParam6[1] = '"') then begin
        ArrestStringEx(sParam6,'"','"',sParam6);
      end;
      QuestConditionInfo.sParam1:=sParam1;
      QuestConditionInfo.sParam2:=sParam2;
      QuestConditionInfo.sParam3:=sParam3;
      QuestConditionInfo.sParam4:=sParam4;
      QuestConditionInfo.sParam5:=sParam5;
      QuestConditionInfo.sParam6:=sParam6;
      if IsStringNumber(sParam1) then
        QuestConditionInfo.nParam1:=Str_ToInt(sParam1,0);
      if IsStringNumber(sParam2) then
        QuestConditionInfo.nParam2:=Str_ToInt(sParam2,0);
      if IsStringNumber(sParam3) then
        QuestConditionInfo.nParam3:=Str_ToInt(sParam3,0);
      if IsStringNumber(sParam4) then
        QuestConditionInfo.nParam4:=Str_ToInt(sParam4,0);
      if IsStringNumber(sParam5) then
        QuestConditionInfo.nParam5:=Str_ToInt(sParam5,0);
      if IsStringNumber(sParam6) then
        QuestConditionInfo.nParam6:=Str_ToInt(sParam6,0);
      Result:=True;
    end;
      
  end;
  function QuestAction(sText:String;QuestActionInfo:pTQuestActionInfo):Boolean; //0048A640
  var
    sCmd,sParam1,sParam2,sParam3,sParam4,sParam5,sParam6:String;
    nCMDCode:Integer;
  Label L001;
  begin
    Result:=False;
    sText:=GetValidStrCap(sText,sCmd,[' ',#9]);
    sText:=GetValidStrCap(sText,sParam1,[' ',#9]);
    sText:=GetValidStrCap(sText,sParam2,[' ',#9]);
    sText:=GetValidStrCap(sText,sParam3,[' ',#9]);
    sText:=GetValidStrCap(sText,sParam4,[' ',#9]);
    sText:=GetValidStrCap(sText,sParam5,[' ',#9]);
    sText:=GetValidStrCap(sText,sParam6,[' ',#9]);
    sCmd:=UpperCase(sCmd);
    nCmdCode:=0;
    if sCmd = sSET then begin
      nCMDCode:=nSET;
      ArrestStringEx(sParam1,'[',']',sParam1);
      if not IsStringNumber(sParam1) then nCMDCode:=0;
      if not IsStringNumber(sParam2) then nCMDCode:=0;
    end;

    if sCmd = sRESET then begin
      nCMDCode:=nRESET;
      ArrestStringEx(sParam1,'[',']',sParam1);
      if not IsStringNumber(sParam1) then nCMDCode:=0;
      if not IsStringNumber(sParam2) then nCMDCode:=0;
    end;
    if sCmd = sSETOPEN then begin
      nCMDCode:=nSETOPEN;
      ArrestStringEx(sParam1,'[',']',sParam1);
      if not IsStringNumber(sParam1) then nCMDCode:=0;
      if not IsStringNumber(sParam2) then nCMDCode:=0;
    end;
    if sCmd = sSETUNIT then begin
      nCMDCode:=nSETUNIT;
      ArrestStringEx(sParam1,'[',']',sParam1);
      if not IsStringNumber(sParam1) then nCMDCode:=0;
      if not IsStringNumber(sParam2) then nCMDCode:=0;
    end;
    if sCmd = sRESETUNIT then begin
      nCMDCode:=nRESETUNIT;
      ArrestStringEx(sParam1,'[',']',sParam1);
      if not IsStringNumber(sParam1) then nCMDCode:=0;
      if not IsStringNumber(sParam2) then nCMDCode:=0;
    end;
    if sCmd = sTAKE then begin
      nCMDCode:=nTAKE;
      Goto L001;
    end;
    if sCmd = sSC_GIVE then begin
      nCMDCode:=nSC_GIVE;
      Goto L001;
    end;
    if sCmd = sCLOSE then begin
      nCMDCode:=nCLOSE;
      Goto L001;
    end;
    if sCmd = sBREAK then begin
      nCMDCode:=nBREAK;
      Goto L001;
    end;
    if sCmd = sGOTO then begin
      nCMDCode:=nGOTO;
      Goto L001;
    end;
    if sCmd = sADDNAMELIST then begin
      nCMDCode:=nADDNAMELIST;
      Goto L001;
    end;
    if sCmd = sDELNAMELIST then begin
      nCMDCode:=nDELNAMELIST;
      Goto L001;
    end;
    if sCmd = sADDGUILDLIST then begin
      nCMDCode:=nADDGUILDLIST;
      Goto L001;
    end;         
    if sCmd = sDELGUILDLIST then begin
      nCMDCode:=nDELGUILDLIST;
      Goto L001;
    end;
    if sCmd = sSC_MAPTING then begin
      nCMDCode:=nSC_MAPTING;
      Goto L001;
    end;
    if sCmd = sSC_LINEMSG then begin
      nCMDCode:=nSC_LINEMSG;
      Goto L001;
    end;

    if sCmd = sADDACCOUNTLIST then begin
      nCMDCode:=nADDACCOUNTLIST;
      Goto L001;
    end;
    if sCmd = sDELACCOUNTLIST then begin
      nCMDCode:=nDELACCOUNTLIST;
      Goto L001;
    end;
    if sCmd = sADDIPLIST then begin
      nCMDCode:=nADDIPLIST;
      Goto L001;
    end;
    if sCmd = sDELIPLIST then begin
      nCMDCode:=nDELIPLIST;
      Goto L001;
    end;
    if sCmd = sSENDMSG then begin
      nCMDCode:=nSENDMSG;
      Goto L001;
    end;
    if sCmd = sCHANGEMODE then begin
      nCMDCode:=nCHANGEMODE;
      Goto L001;
    end;
    if sCmd = sPKPOINT then begin
      nCMDCode:=nPKPOINT;
      Goto L001;
    end;
    if sCmd = sCHANGEXP then begin
      nCMDCode:=nCHANGEXP;
      Goto L001;
    end;
    if sCmd = sSC_RECALLMOB then begin
      nCMDCode:=nSC_RECALLMOB;
      Goto L001;
    end;
    if sCmd = sKICK then begin
      nCMDCode:=nKICK;
      Goto L001;
    end;
    if sCmd = sTAKEW then begin
      nCMDCode:=nTAKEW;
      Goto L001;
    end;
    if sCmd = sTIMERECALL then begin
      nCMDCode:=nTIMERECALL;
      Goto L001;
    end;
    if sCmd = sSC_PARAM1 then begin
      nCMDCode:=nSC_PARAM1;
      Goto L001;
    end;
    if sCmd = sSC_PARAM2 then begin
      nCMDCode:=nSC_PARAM2;
      Goto L001;
    end;
    if sCmd = sSC_PARAM3 then begin
      nCMDCode:=nSC_PARAM3;
      Goto L001;
    end;
    if sCmd = sSC_PARAM4 then begin
      nCMDCode:=nSC_PARAM4;
      Goto L001;
    end;
    if sCmd = sSC_EXEACTION then begin
      nCMDCode:=nSC_EXEACTION;
      Goto L001;
    end;

    if sCmd = sMAPMOVE then begin
      nCMDCode:=nMAPMOVE;
      Goto L001;
    end;
    if sCmd = sMAP then begin
      nCMDCode:=nMAP;
      Goto L001;
    end;
    if sCmd = sTAKECHECKITEM then begin
      nCMDCode:=nTAKECHECKITEM;
      Goto L001;
    end;
    if sCmd = sMONGEN then begin
      nCMDCode:=nMONGEN;
      Goto L001;
    end;
    if sCmd = sMONCLEAR then begin
      nCMDCode:=nMONCLEAR;
      Goto L001;
    end;
    if sCmd = sMOV then begin
      nCMDCode:=nMOV;
      Goto L001;
    end;
    if sCmd = sINC then begin
      nCMDCode:=nINC;
      Goto L001;
    end;
    if sCmd = sDEC then begin
      nCMDCode:=nDEC;
      Goto L001;
    end;
    if sCmd = sSUM then begin
      nCMDCode:=nSUM;
      Goto L001;
    end;
    if sCmd = sBREAKTIMERECALL then begin
      nCMDCode:=nBREAKTIMERECALL;
      Goto L001;
    end;

    if sCmd = sMOVR then begin
      nCMDCode:=nMOVR;
      Goto L001;
    end;
    if sCmd = sEXCHANGEMAP then begin
      nCMDCode:=nEXCHANGEMAP;
      Goto L001;
    end;
    if sCmd = sRECALLMAP then begin
      nCMDCode:=nRECALLMAP;
      Goto L001;
    end;
    if sCmd = sADDBATCH then begin
      nCMDCode:=nADDBATCH;
      Goto L001;
    end;
    if sCmd = sBATCHDELAY then begin
      nCMDCode:=nBATCHDELAY;
      Goto L001;
    end;
    if sCmd = sBATCHMOVE then begin
      nCMDCode:=nBATCHMOVE;
      Goto L001;
    end;
    if sCmd = sPLAYDICE then begin
      nCMDCode:=nPLAYDICE;
      Goto L001;
    end;
    if sCmd = sGOQUEST then begin
      nCMDCode:=nGOQUEST;
      Goto L001;
    end;
    if sCmd = sENDQUEST then begin
      nCMDCode:=nENDQUEST;
      Goto L001;
    end;
    if sCmd = sSC_HAIRCOLOR then begin
      nCMDCode:=nSC_HAIRCOLOR;
      Goto L001;
    end;
    if sCmd = sSC_WEARCOLOR then begin
      nCMDCode:=nSC_WEARCOLOR;
      Goto L001;
    end;
    if sCmd = sSC_HAIRSTYLE then begin
      nCMDCode:=nSC_HAIRSTYLE;
      Goto L001;
    end;
    if sCmd = sSC_MONRECALL then begin
      nCMDCode:=nSC_MONRECALL;
      Goto L001;
    end;
    if sCmd = sSC_HORSECALL then begin
      nCMDCode:=nSC_HORSECALL;
      Goto L001;
    end;
    if sCmd = sSC_HAIRRNDCOL then begin
      nCMDCode:=nSC_HAIRRNDCOL;
      Goto L001;
    end;
    if sCmd = sSC_KILLHORSE then begin
      nCMDCode:=nSC_KILLHORSE;
      Goto L001;
    end;
    if sCmd = sSC_RANDSETDAILYQUEST then begin
      nCMDCode:=nSC_RANDSETDAILYQUEST;
      Goto L001;
    end;


    if sCmd = sSC_CHANGELEVEL then begin
      nCMDCode:=nSC_CHANGELEVEL;
      Goto L001;
    end;
    if sCmd = sSC_MARRY then begin
      nCMDCode:=nSC_MARRY;
      Goto L001;
    end;
    if sCmd = sSC_UNMARRY then begin
      nCMDCode:=nSC_UNMARRY;
      Goto L001;
    end;
    if sCmd = sSC_GETMARRY then begin
      nCMDCode:=nSC_GETMARRY;
      Goto L001;
    end;
    if sCmd = sSC_GETMASTER then begin
      nCMDCode:=nSC_GETMASTER;
      Goto L001;
    end;
    if sCmd = sSC_CLEARSKILL then begin
      nCMDCode:=nSC_CLEARSKILL;
      Goto L001;
    end;
    if sCmd = sSC_DELNOJOBSKILL then begin
      nCMDCode:=nSC_DELNOJOBSKILL;
      Goto L001;
    end;
    if sCmd = sSC_DELSKILL then begin
      nCMDCode:=nSC_DELSKILL;
      Goto L001;
    end;
    if sCmd = sSC_ADDSKILL then begin
      nCMDCode:=nSC_ADDSKILL;
      Goto L001;
    end;
    if sCmd = sSC_SKILLLEVEL then begin
      nCMDCode:=nSC_SKILLLEVEL;
      Goto L001;
    end;
    if sCmd = sSC_CHANGEPKPOINT then begin
      nCMDCode:=nSC_CHANGEPKPOINT;
      Goto L001;
    end;
    if sCmd = sSC_CHANGEEXP then begin
      nCMDCode:=nSC_CHANGEEXP;
      Goto L001;
    end;
    if sCmd = sSC_CHANGEJOB then begin
      nCMDCode:=nSC_CHANGEJOB;
      Goto L001;
    end;
    if sCmd = sSC_MISSION then begin
      nCMDCode:=nSC_MISSION;
      Goto L001;
    end;
    if sCmd = sSC_MOBPLACE then begin
      nCMDCode:=nSC_MOBPLACE;
      Goto L001;
    end;
    if sCmd = sSC_SETMEMBERTYPE then begin
      nCMDCode:=nSC_SETMEMBERTYPE;
      Goto L001;
    end;
    if sCmd = sSC_SETMEMBERLEVEL then begin
      nCMDCode:=nSC_SETMEMBERLEVEL;
      Goto L001;
    end;
    if sCmd = sSC_GAMEGOLD then begin
      nCMDCode:=nSC_GAMEGOLD;
      Goto L001;
    end;
    if sCmd = sSC_GAMEPOINT then begin
      nCMDCode:=nSC_GAMEPOINT;
      Goto L001;
    end;
    if sCmd = sSC_PKZONE then begin
      nCMDCode:=nSC_PKZONE;
      Goto L001;
    end;
    if sCmd = sSC_RESTBONUSPOINT then begin
      nCMDCode:=nSC_RESTBONUSPOINT;
      Goto L001;
    end;
    if sCmd = sSC_TAKECASTLEGOLD then begin
      nCMDCode:=nSC_TAKECASTLEGOLD;
      Goto L001;
    end;
    if sCmd = sSC_HUMANHP then begin
      nCMDCode:=nSC_HUMANHP;
      Goto L001;
    end;
    if sCmd = sSC_HUMANMP then begin
      nCMDCode:=nSC_HUMANMP;
      Goto L001;
    end;
    if sCmd = sSC_BUILDPOINT then begin
      nCMDCode:=nSC_BUILDPOINT;
      Goto L001;
    end;
    if sCmd = sSC_AURAEPOINT then begin
      nCMDCode:=nSC_AURAEPOINT;
      Goto L001;
    end;
    if sCmd = sSC_STABILITYPOINT then begin
      nCMDCode:=nSC_STABILITYPOINT;
      Goto L001;
    end;
    if sCmd = sSC_FLOURISHPOINT then begin
      nCMDCode:=nSC_FLOURISHPOINT;
      Goto L001;
    end;
    if sCmd = sSC_OPENMAGICBOX then begin
      nCMDCode:=nSC_OPENMAGICBOX;
      Goto L001;
    end;
    if sCmd = sSC_SETRANKLEVELNAME then begin
      nCMDCode:=nSC_SETRANKLEVELNAME;
      Goto L001;
    end;
    if sCmd = sSC_GMEXECUTE then begin
      nCMDCode:=nSC_GMEXECUTE;
      Goto L001;
    end;
    if sCmd = sSC_GUILDCHIEFITEMCOUNT then begin
      nCMDCode:=nSC_GUILDCHIEFITEMCOUNT;
      Goto L001;
    end;
    if sCmd = sSC_ADDNAMEDATELIST then begin
      nCMDCode:=nSC_ADDNAMEDATELIST;
      Goto L001;
    end;
    if sCmd = sSC_DELNAMEDATELIST then begin
      nCMDCode:=nSC_DELNAMEDATELIST;
      Goto L001;
    end;
    if sCmd = sSC_MOBFIREBURN then begin
      nCMDCode:=nSC_MOBFIREBURN;
      Goto L001;
    end;
    if sCmd = sSC_MESSAGEBOX then begin
      nCMDCode:=nSC_MESSAGEBOX;
      Goto L001;
    end;
    if sCmd = sSC_SETSCRIPTFLAG then begin
      nCMDCode:=nSC_SETSCRIPTFLAG;
      Goto L001;
    end;
    if sCmd = sSC_SETAUTOGETEXP then begin
      nCMDCode:=nSC_SETAUTOGETEXP;
      Goto L001;
    end;
    if sCmd = sSC_VAR then begin
      nCMDCode:=nSC_VAR;
      Goto L001;
    end;
    if sCmd = sSC_LOADVAR then begin
      nCMDCode:=nSC_LOADVAR;
      Goto L001;
    end;
    if sCmd = sSC_SAVEVAR then begin
      nCMDCode:=nSC_SAVEVAR;
      Goto L001;
    end;
    if sCmd = sSC_CALCVAR then begin
      nCMDCode:=nSC_CALCVAR;
      Goto L001;
    end;
    if sCmd = sSC_AUTOADDGAMEGOLD then begin
      nCMDCode:=nSC_AUTOADDGAMEGOLD;
      Goto L001;
    end;
    if sCmd = sSC_AUTOSUBGAMEGOLD then begin
      nCMDCode:=nSC_AUTOSUBGAMEGOLD;
      Goto L001;
    end;

    if sCmd = sSC_RECALLGROUPMEMBERS then begin
      nCMDCode:=nSC_RECALLGROUPMEMBERS;
      Goto L001;
    end;
    if sCmd = sSC_CLEARNAMELIST then begin
      nCMDCode:=nSC_CLEARNAMELIST;
      Goto L001;
    end;
    if sCmd = sSC_CHANGENAMECOLOR then begin
      nCMDCode:=nSC_CHANGENAMECOLOR;
      Goto L001;
    end;
    if sCmd = sSC_CLEARPASSWORD then begin
      nCMDCode:=nSC_CLEARPASSWORD;
      Goto L001;
    end;
    if sCmd = sSC_RENEWLEVEL then begin
      nCMDCode:=nSC_RENEWLEVEL;
      Goto L001;
    end;
    if sCmd = sSC_KILLMONEXPRATE then begin
      nCMDCode:=nSC_KILLMONEXPRATE;
      Goto L001;
    end;
    if sCmd = sSC_POWERRATE then begin
      nCMDCode:=nSC_POWERRATE;
      Goto L001;
    end;
    if sCmd = sSC_CHANGEMODE then begin
      nCMDCode:=nSC_CHANGEMODE;
      Goto L001;
    end;
    if sCmd = sSC_CHANGEPERMISSION then begin
      nCMDCode:=nSC_CHANGEPERMISSION;
      Goto L001;
    end;
    if sCmd = sSC_KILL then begin
      nCMDCode:=nSC_KILL;
      Goto L001;
    end;
    if sCmd = sSC_KICK then begin
      nCMDCode:=nSC_KICK;
      Goto L001;
    end;
    if sCmd = sSC_BONUSPOINT then begin
      nCMDCode:=nSC_BONUSPOINT;
      Goto L001;
    end;
    if sCmd = sSC_RESTRENEWLEVEL then begin
      nCMDCode:=nSC_RESTRENEWLEVEL;
      Goto L001;
    end;
    if sCmd = sSC_DELMARRY then begin
      nCMDCode:=nSC_DELMARRY;
      Goto L001;
    end;
    if sCmd = sSC_DELMASTER then begin
      nCMDCode:=nSC_DELMASTER;
      Goto L001;
    end;
    if sCmd = sSC_MASTER then begin
      nCMDCode:=nSC_MASTER;
      Goto L001;
    end;
    if sCmd = sSC_UNMASTER then begin
      nCMDCode:=nSC_UNMASTER;
      Goto L001;
    end;
    if sCmd = sSC_CREDITPOINT then begin
      nCMDCode:=nSC_CREDITPOINT;
      Goto L001;
    end;
    if sCmd = sSC_CLEARNEEDITEMS then begin
      nCMDCode:=nSC_CLEARNEEDITEMS;
      Goto L001;
    end;
    if sCmd = sSC_CLEARMAKEITEMS then begin
      nCMDCode:=nSC_CLEARMAEKITEMS;
      Goto L001;
    end;

    if sCmd = sSC_SETSENDMSGFLAG then begin
      nCMDCode:=nSC_SETSENDMSGFLAG;
      Goto L001;
    end;
    if sCmd = sSC_UPGRADEITEMS then begin
      nCMDCode:=nSC_UPGRADEITEMS;
      Goto L001;
    end;
    if sCmd = sSC_UPGRADEITEMSEX then begin
      nCMDCode:=nSC_UPGRADEITEMSEX;
      Goto L001;
    end;
    if sCmd = sSC_MONGENEX then begin
      nCMDCode:=nSC_MONGENEX;
      Goto L001;
    end;
    if sCmd = sSC_CLEARMAPMON then begin
      nCMDCode:=nSC_CLEARMAPMON;
      Goto L001;
    end;

    if sCmd = sSC_SETMAPMODE then begin
      nCMDCode:=nSC_SETMAPMODE;
      Goto L001;
    end;

    if sCmd = sSC_KILLSLAVE then begin
      nCMDCode:=nSC_KILLSLAVE;
      Goto L001;
    end;
    if sCmd = sSC_CHANGEGENDER then begin
      nCMDCode:=nSC_CHANGEGENDER;
      Goto L001;
    end;

    if sCmd = sSC_MAPTING then begin
      nCMDCode:=nSC_MAPTING;
      Goto L001;
    end;

    if sCmd = sSC_GUILDRECALL then begin
      nCMDCode:=nSC_GUILDRECALL;
      Goto L001;
    end;
    if sCmd = sSC_GROUPRECALL then begin
      nCMDCode:=nSC_GROUPRECALL;
      Goto L001;
    end;
    if sCmd = sSC_GROUPADDLIST then begin
      nCMDCode:=nSC_GROUPADDLIST;
      Goto L001;
    end;
    if sCmd = sSC_CLEARLIST then begin
      nCMDCode:=nSC_CLEARLIST;
      Goto L001;
    end;
    if sCmd = sSC_GROUPMOVEMAP then begin
      nCMDCode:=nSC_GROUPMOVEMAP;
      Goto L001;
    end;
    if sCmd = sSC_SAVESLAVES then begin
      nCMDCode:=nSC_SAVESLAVES;
      Goto L001;
    end;

    L001:
    if nCMDCode > 0 then begin
      QuestActionInfo.nCmdCode:=nCMDCode;
      if (sParam1 <> '') and (sParam1[1] = '"') then begin
        ArrestStringEx(sParam1,'"','"',sParam1);
      end;
      if (sParam2 <> '') and (sParam2[1] = '"') then begin
        ArrestStringEx(sParam2,'"','"',sParam2);
      end;
      if (sParam3 <> '') and (sParam3[1] = '"') then begin
        ArrestStringEx(sParam3,'"','"',sParam3);
      end;
      if (sParam4 <> '') and (sParam4[1] = '"') then begin
        ArrestStringEx(sParam4,'"','"',sParam4);
      end;
      if (sParam5 <> '') and (sParam5[1] = '"') then begin
        ArrestStringEx(sParam5,'"','"',sParam5);
      end;
      if (sParam6 <> '') and (sParam6[1] = '"') then begin
        ArrestStringEx(sParam6,'"','"',sParam6);
      end;
      QuestActionInfo.sParam1:=sParam1;
      QuestActionInfo.sParam2:=sParam2;
      QuestActionInfo.sParam3:=sParam3;
      QuestActionInfo.sParam4:=sParam4;
      QuestActionInfo.sParam5:=sParam5;
      QuestActionInfo.sParam6:=sParam6;
      if IsStringNumber(sParam1) then
        QuestActionInfo.nParam1:=Str_ToInt(sParam1,0);
      if IsStringNumber(sParam2) then
        QuestActionInfo.nParam2:=Str_ToInt(sParam2,1);
      if IsStringNumber(sParam3) then
        QuestActionInfo.nParam3:=Str_ToInt(sParam3,1);
      if IsStringNumber(sParam4) then
        QuestActionInfo.nParam4:=Str_ToInt(sParam4,0);
      if IsStringNumber(sParam5) then
        QuestActionInfo.nParam5:=Str_ToInt(sParam5,0);
      if IsStringNumber(sParam6) then
        QuestActionInfo.nParam6:=Str_ToInt(sParam6,0);
      Result:=True;
    end;
  end;
begin   //0048B684
  Result:= -1;
  n6C:=0;
  n70:=0;
  sScritpFileName:=g_Config.sEnvirDir + sPatch + sScritpName + '.txt';
  if FileExists(sScritpFileName) then begin
    LoadList:=TStringList.Create;
    try
      LoadList.LoadFromFile(sScritpFileName);
      DeCodeStringList(LoadList);
    except
      LoadList.Free;
      exit;
    end;
    i:=0;
    while (True) do  begin
      LoadScriptcall(LoadList);
      Inc(i);
      if i >= 101 then break;
    end;    // while
    DefineList:=TList.Create;
    //LoadList.SaveToFile('.\check.txt');
    s54:=LoadDefineInfo(LoadList,DefineList);
    New(DefineInfo);
    DefineInfo.sName:='@HOME';
    if s54 = '' then s54:='@main';
    DefineInfo.sText:=s54;
    DefineList.Add(DefineInfo);
    // 常量处理
    for I := 0 to LoadList.Count - 1 do begin
      s34:=Trim(LoadList.Strings[i]);
      if (s34 <> '') then begin
        if (s34[1] = '[') then begin
          bo8D:=False;
        end else begin //0048B83F
          if (s34[1] = '#') and
             (CompareLStr(s34,'#IF',Length('#IF')) or
              CompareLStr(s34,'#ACT',Length('#ACT')) or
              CompareLStr(s34,'#ELSEACT',Length('#ELSEACT'))) then begin
            bo8D:=True;
          end else begin //0048B895
            if bo8D then begin
              // 将Define 好的常量换成指定值
              for n20 := 0 to DefineList.Count - 1 do begin
                DefineInfo:=DefineList.Items[n20];
                n1C:=0;
                while (True) do  begin
                  n24:=Pos(DefineInfo.sName,UpperCase(s34));
                  if n24 <= 0 then break;
                  s58:=Copy(s34,1,n24 - 1);
                  s5C:=Copy(s34,length(DefineInfo.sName) + n24,256);
                  s34:=s58 + DefineInfo.sText + s5C;
                  LoadList.Strings[i]:=s34;
                  Inc(n1C);
                  if n1C >= 10 then break;
                end;
              end; // 将Define 好的常量换成指定值

            end; //0048B97D
          end;
        end; //0048B97D
      end; //0048B97D if (s34 <> '') then begin
    end; //for I := 0 to LoadList.Count - 1 do begin
    // 常量处理

    //释放常量定义内容
    //0048B98C
    for I := 0 to DefineList.Count - 1 do begin
      Dispose(pTDefineInfo(DefineList.Items[i]));
    end;    // for I := 0 to List64.Count - 1 do begin
    DefineList.Free;
    //释放常量定义内容
    //LoadList.SaveToFile('.\check.txt');

    Script:=nil;
    SayingRecord:=nil;
    nQuestIdx:=0;

    for I := 0 to LoadList.Count - 1 do begin //0048B9FC
      s34:=Trim(LoadList.Strings[i]);
      if (s34 = '') or (s34[1] = ';') or (s34[1] = '/') then Continue;
      if (n6C = 0) and (boFlag) then begin
        //物品价格倍率
        if s34[1] = '%' then begin  //0048BA57
          s34:=Copy(s34,2,Length(s34) - 1);
          nPriceRate:=Str_ToInt(s34,-1);
          if nPriceRate >= 55 then begin
            TMerchant(NPC).m_nPriceRate:=nPriceRate;
          end;
          Continue;
        end;
        //物品交易类型
        if s34[1] = '+' then begin
          s34:=Copy(s34,2,Length(s34) - 1);
          nItemType:=Str_ToInt(s34,-1);
          if nItemType >= 0 then begin
            TMerchant(NPC).m_ItemTypeList.Add(Pointer(nItemType));
          end;
          Continue;
        end;
        //增加处理NPC可执行命令设置
        if s34[1] = '(' then begin
          ArrestStringEx(s34,'(',')',s34);
          if s34 <> '' then begin
            while (s34 <> '') do  begin
              s34:=GetValidStr3(s34,s30,[' ',',',#9]);
              if CompareText(s30,sBUY) = 0 then begin
                TMerchant(NPC).m_boBuy:=True;
                Continue;
              end else if CompareText(s30,sSELL) = 0 then begin
                TMerchant(NPC).m_boSell:=True;
                Continue;
              end else if CompareText(s30,sMAKEDURG) = 0 then begin
                TMerchant(NPC).m_boMakeDrug:=True;
                Continue;
              end else if CompareText(s30,sPRICES) = 0 then begin
                TMerchant(NPC).m_boPrices:=True;
                Continue;
              end else if CompareText(s30,sSTORAGE) = 0 then begin
                TMerchant(NPC).m_boStorage:=True;
                Continue;
              end else if CompareText(s30,sGETBACK) = 0 then begin
                TMerchant(NPC).m_boGetback:=True;
                Continue;
              end else if CompareText(s30,sUPGRADENOW) = 0 then begin
                TMerchant(NPC).m_boUpgradenow:=True;
                Continue;
              end else if CompareText(s30,sGETBACKUPGNOW) = 0 then begin
                TMerchant(NPC).m_boGetBackupgnow:=True;
                Continue;
              end else if CompareText(s30,sREPAIR) = 0 then begin
                TMerchant(NPC).m_boRepair:=True;
                Continue;
              end else if CompareText(s30,sSUPERREPAIR) = 0 then begin
                TMerchant(NPC).m_boS_repair:=True;
                Continue;
              end else if CompareText(s30,sSL_SENDMSG) = 0 then begin
                TMerchant(NPC).m_boSendmsg:=True;
                Continue;
              end else if CompareText(s30,sUSEITEMNAME) = 0 then begin
                TMerchant(NPC).m_boUseItemName:=True;
                Continue;
              end;

            end;    // while
          end;
          Continue;
        end;
        //增加处理NPC可执行命令设置
      end; //0048BAF0

      if s34[1] = '{' then begin
        if CompareLStr(s34,'{Quest',length('{Quest')) then begin
          s38:=GetValidStr3(s34,s3C,[' ','}',#9]);
          GetValidStr3(s38,s3C,[' ','}',#9]);
          n70:=Str_ToInt(s3C,0);
          Script:=MakeNewScript();
          Script.nQuest:=n70;
          Inc(n70);
        end; //0048BBA4  
        if CompareLStr(s34,'{~Quest',length('{~Quest')) then Continue;
      end; //0048BBBE
      
      if (n6C = 1)and (Script <> nil) and (s34[1] = '#') then begin
        s38:=GetValidStr3(s34,s3C,['=',' ',#9]);
        Script.boQuest:=True;
        if CompareLStr(s34,'#IF',length('#IF')) then begin
          ArrestStringEx(s34,'[',']',s40);
          Script.QuestInfo[nQuestIdx].wFlag:=Str_ToInt(s40,0);
          GetValidStr3(s38,s44,['=',' ',#9]);
          n24:=Str_ToInt(s44,0);
          if n24 <> 0 then n24:=1;
          Script.QuestInfo[nQuestIdx].btValue:=n24;
        end; //0048BCBD

        
        if CompareLStr(s34,'#RAND',length('#RAND')) then begin
          Script.QuestInfo[nQuestIdx].nRandRage:=Str_ToInt(s44,0);
        end;
        Continue;
      end; //0048BCF0

      if s34[1] = '[' then begin
        n6C:=10;
        if Script = nil then  begin
          Script := MakeNewScript();
          Script.nQuest:=n70;
        end;
        if CompareText(s34,'[goods]') = 0 then begin
          n6C:=20;
          Continue;
        end;

        s34:=ArrestStringEx(s34,'[',']',s74);
        New(SayingRecord);
        SayingRecord.ProcedureList:=TList.Create;
        SayingRecord.sLabel:=s74;
        s34:=GetValidStrCap(s34,s74,[' ',#9]);
        if CompareText(s74,'TRUE') = 0 then begin
          SayingRecord.boExtJmp:=True;
        end else begin
          SayingRecord.boExtJmp:=False;
        end;
          
        New(SayingProcedure);
        SayingRecord.ProcedureList.Add(SayingProcedure);
        SayingProcedure.ConditionList:=TList.Create;
        SayingProcedure.ActionList:=TList.Create;
        SayingProcedure.sSayMsg:='';
        SayingProcedure.ElseActionList:=TList.Create;
        SayingProcedure.sElseSayMsg:='';
        Script.RecordList.Add(SayingRecord);
        Continue;
      end; //0048BE05
      if (Script <> nil) and (SayingRecord <> nil) then begin
        if (n6C >= 10) and (n6C < 20) and (s34[1] = '#')then begin
          if CompareText(s34,'#IF') = 0 then begin
            if (SayingProcedure.ConditionList.Count > 0) or (SayingProcedure.sSayMsg <> '') then begin  //0048BE53
              New(SayingProcedure);
              SayingRecord.ProcedureList.Add(SayingProcedure);
              SayingProcedure.ConditionList:=TList.Create;
              SayingProcedure.ActionList:=TList.Create;
              SayingProcedure.sSayMsg:='';
              SayingProcedure.ElseActionList:=TList.Create;
              SayingProcedure.sElseSayMsg:='';
            end; //0048BECE
            n6C:=11;
          end; //0048BED5
          if CompareText(s34,'#ACT') = 0 then n6C:=12;
          if CompareText(s34,'#SAY') = 0 then n6C:=10;
          if CompareText(s34,'#ELSEACT') = 0 then n6C:=13;
          if CompareText(s34,'#ELSESAY') = 0 then n6C:=14;
          Continue;
        end; //0048BF3E

        if (n6C = 10) and (SayingProcedure <> nil) then
          SayingProcedure.sSayMsg:=SayingProcedure.sSayMsg + s34;

        if (n6C = 11) then begin
          New(QuestConditionInfo);
          FillChar(QuestConditionInfo^,SizeOf(TQuestConditionInfo),#0);
          if QuestCondition(Trim(s34),QuestConditionInfo) then begin
            SayingProcedure.ConditionList.Add(QuestConditionInfo);
          end else begin
            Dispose(QuestConditionInfo);
            MainOutMessage('脚本错误: ' + s34 + ' 第:' + IntToStr(i) + ' 行: ' + sScritpFileName);
          end;
        end; //0048C004

        if (n6C = 12) then begin
          New(QuestActionInfo);
          FillChar(QuestActionInfo^,SizeOf(TQuestActionInfo),#0);
          if QuestAction(Trim(s34),QuestActionInfo) then begin
            SayingProcedure.ActionList.Add(QuestActionInfo);
          end else begin
            Dispose(QuestActionInfo);
            MainOutMessage('脚本错误: ' + s34 + ' 第:' + IntToStr(i) + ' 行: ' + sScritpFileName);
          end;
        end; //0048C0B1

        if (n6C = 13) then begin
          New(QuestActionInfo);
          FillChar(QuestActionInfo^,SizeOf(TQuestActionInfo),#0);
          if QuestAction(Trim(s34),QuestActionInfo) then begin
            SayingProcedure.ElseActionList.Add(QuestActionInfo);
          end else begin
            Dispose(QuestActionInfo);
            MainOutMessage('脚本错误: ' + s34 + ' 第:' + IntToStr(i) + ' 行: ' + sScritpFileName);
          end;
        end;
        if (n6C = 14) then
          SayingProcedure.sElseSayMsg:=SayingProcedure.sElseSayMsg + s34;
      end;
      if (n6C = 20) and boFlag then begin
        s34:=GetValidStrCap(s34,s48,[' ',#9]);
        s34:=GetValidStrCap(s34,s4C,[' ',#9]);
        s34:=GetValidStrCap(s34,s50,[' ',#9]);
        if (s48 <> '') and (s50 <> '') then begin
          if (s48[1] = '"') then begin
            ArrestStringEx(s48,'"','"',s48);
          end;

          if CanSellItem(s48) then begin
            New(Goods);
          
            Goods.sItemName:=s48;
            Goods.nCount:=Str_ToInt(s4C,0);
            Goods.dwRefillTime:=Str_ToInt(s50,0);
            Goods.dwRefillTick:=0;
            TMerchant(NPC).m_RefillGoodsList.Add(Goods);
          end;
        end; //0048C2D2
      end; //0048C2D2      
    end;    // for
    LoadList.Free;
  end else begin //0048C2EB
    MainOutMessage('Script file not found: ' + sScritpFileName);
  end;
  Result:=1;
end;

function TFrmDB.SaveGoodRecord(NPC: TMerchant; sFile: String):Integer;//0048C748
var
  I,II: Integer;
  sFileName:String;
  FileHandle:Integer;
  UserItem:pTUserItem;
  List:TList;
  Header420:TGoodFileHeader;
begin
  Result:= -1;
  sFileName:='.\Envir\Market_Saved\' + sFile + '.sav';
  if FileExists(sFileName) then begin
    FileHandle:= FileOpen(sFileName, fmOpenWrite or fmShareDenyNone);
  end else begin
    FileHandle:=FileCreate(sFileName);
  end;
  if FileHandle > 0 then begin
    FillChar(Header420,SizeOf(TGoodFileHeader),#0);
    for I := 0 to NPC.m_GoodsList.Count - 1 do begin
      List:=TList(NPC.m_GoodsList.Items[i]);
      Inc(Header420.nItemCount,List.Count);
    end;
    FileWrite(FileHandle,Header420,SizeOf(TGoodFileHeader));
    for I := 0 to NPC.m_GoodsList.Count - 1 do begin
      List:=TList(NPC.m_GoodsList.Items[i]);
      for II := 0 to List.Count - 1 do begin
        UserItem:=List.Items[II];
        FileWrite(FileHandle,UserItem^,SizeOf(TUserItem));
      end;
    end;
    FileClose(FileHandle);
    Result:=1;    
  end;
end;

function TFrmDB.SaveGoodPriceRecord(NPC: TMerchant; sFile: String):Integer;//0048CA64
var
  I: Integer;
  sFileName:String;
  FileHandle:Integer;
  ItemPrice:pTItemPrice;
  Header420:TGoodFileHeader;
begin
  Result:= -1;
  sFileName:='.\Envir\Market_Prices\' + sFile + '.prc';
  if FileExists(sFileName) then begin
    FileHandle:= FileOpen(sFileName, fmOpenWrite or fmShareDenyNone);
  end else begin
    FileHandle:=FileCreate(sFileName);
  end;
  if FileHandle > 0 then begin
    FillChar(Header420,SizeOf(TGoodFileHeader),#0);
    Header420.nItemCount:=NPC.m_ItemPriceList.Count;
    FileWrite(FileHandle,Header420,SizeOf(TGoodFileHeader));
    for I := 0 to NPC.m_ItemPriceList.Count - 1 do begin
      ItemPrice:=NPC.m_ItemPriceList.Items[I];
      FileWrite(FileHandle,ItemPrice^,SizeOf(TItemPrice));
    end;
    FileClose(FileHandle);
    Result:=1;    
  end;

end;
procedure TFrmDB.ReLoadNpc; //
begin

end;
procedure TFrmDB.ReLoadMerchants; //00487BD8
var
  i,ii,nX,nY:Integer;
  sMapName:String;
  boUse,boNewNpc:Boolean;
  tMerchantNPC:TMerchant;
ResourceString
  sSQLString = 'SELECT * FROM TBL_MERCHANT';
begin
  EnterCriticalSection(ProcessHumanCriticalSection);
  try
  try
    for i := 0 to UserEngine.m_MerchantList.Count - 1 do begin
      tMerchantNPC:=TMerchant(UserEngine.m_MerchantList.Items[i]);
      tMerchantNPC.m_nFlag:= -1;
    end;

    Query.SQL.Clear;
    Query.SQL.Add(sSQLString);
    try
      Query.Open;
    finally

    end;

    for i:=0 to Query.RecordCount -1 do begin
      boUse                         := Query.FieldByName('FLD_ENABLED').AsBoolean;
      if boUse then begin
        sMapName                    := Query.FieldByName('FLD_MAPNAME').AsString;
        nX                          := Query.FieldByName('FLD_X').AsInteger;
        nY                          := Query.FieldByName('FLD_Y').AsInteger;

        //Update existing NPC's
        boNewNpc:=True;
        for II := 0 to UserEngine.m_MerchantList.Count - 1 do begin
          tMerchantNPC:=TMerchant(UserEngine.m_MerchantList.Items[II]);
          if (tMerchantNPC.m_sMapName = sMapName) and
             (tMerchantNPC.m_nCurrX = nX) and
             (tMerchantNPC.m_nCurrY = nY) then begin
            boNewNpc:=False;
            tMerchantNPC.m_sScript      := Query.FieldByName('FLD_SCRIPTFILE').AsString;
            tMerchantNPC.m_sCharName    := Query.FieldByName('FLD_NAME').AsString;
            tMerchantNPC.m_nFlag        := Query.FieldByName('FLD_FLAG').AsInteger;
            tMerchantNPC.m_wAppr        := Query.FieldByName('FLD_APPEARANCE').AsInteger;
            tMerchantNPC.m_boCastle     := Query.FieldByName('FLD_ISCASTLE').AsBoolean;
            tMerchantNPC.m_boCanMove    := Query.FieldByName('FLD_CANMOVE').AsBoolean;
            tMerchantNPC.m_dwMoveTime   := Query.FieldByName('FLD_MOVETIME').AsInteger;
            
            break;
          end;
        end;


        if boNewNpc then begin
          tMerchantNPC:=TMerchant.Create;
          tMerchantNPC.m_sMapName     := sMapName;
          tMerchantNPC.m_PEnvir:=g_MapManager.FindMap(tMerchantNPC.m_sMapName);

          if tMerchantNPC.m_PEnvir <> nil then begin
            tMerchantNPC.m_sScript      := Query.FieldByName('FLD_SCRIPTFILE').AsString;
            tMerchantNPC.m_nCurrX       := nX;
            tMerchantNPC.m_nCurrY       := nY;
            tMerchantNPC.m_sCharName    := Query.FieldByName('FLD_NAME').AsString;
            tMerchantNPC.m_nFlag        := Query.FieldByName('FLD_FLAG').AsInteger;
            tMerchantNPC.m_wAppr        := Query.FieldByName('FLD_APPEARANCE').AsInteger;
            tMerchantNPC.m_boCastle     := Query.FieldByName('FLD_ISCASTLE').AsBoolean;
            tMerchantNPC.m_boCanMove    := Query.FieldByName('FLD_CANMOVE').AsBoolean;
            tMerchantNPC.m_dwMoveTime   := Query.FieldByName('FLD_MOVETIME').AsInteger;
            
            if (tMerchantNPC.m_sScript <> '') and (tMerchantNPC.m_sMapName <> '') then begin
              UserEngine.m_MerchantList.Add(tMerchantNPC);
              tMerchantNPC.Initialize;
            end;
          end else tMerchantNPC.Free;
        end;
      end;

      Query.Next;
    end;

    for i := UserEngine.m_MerchantList.Count - 1 downto 0 do begin
      tMerchantNPC:=TMerchant(UserEngine.m_MerchantList.Items[i]);
      if tMerchantNPC.m_nFlag = -1 then begin
        tMerchantNPC.m_boGhost:=True;
        tMerchantNPC.m_dwGhostTick:=GetTickCount();
//        UserEngine.MerchantList.Delete(I);
      end;
    end;
  finally
    Query.Close;
  end;
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;
end;

function TFrmDB.LoadUpgradeWeaponRecord(sNPCName: String;
  DataList: TList): Integer;//0048CBD0
var
  I: Integer;
  FileHandle:Integer;
  sFileName:String;
  UpgradeInfo:pTUpgradeInfo;
  UpgradeRecord:TUpgradeInfo;
  nRecordCount:Integer;
begin
  Result:= -1;
  sFileName:='.\Envir\Market_Upg\' + sNPCName + '.upg';
  if FileExists(sFileName) then begin
    FileHandle:= FileOpen(sFileName, fmOpenRead or fmShareDenyNone);
    if FileHandle > 0 then begin
      FileRead(FileHandle,nRecordCount,SizeOf(Integer));
      for I := 0 to nRecordCount - 1 do begin
        if FileRead(FileHandle,UpgradeRecord,SizeOf(TUpgradeInfo)) = SizeOf(TUpgradeInfo) then begin
          New(UpgradeInfo);
          UpgradeInfo^:=UpgradeRecord;
          UpgradeInfo.dwGetBackTick:=0;
          DataList.Add(UpgradeInfo);
        end;
      end;
      FileClose(FileHandle);
      Result:=1;
    end;
  end;
end;

function TFrmDB.SaveUpgradeWeaponRecord(sNPCName: String; DataList: TList):Integer;
var
  I: Integer;
  FileHandle:Integer;
  sFileName:String;
  UpgradeInfo:pTUpgradeInfo;
begin
  Result:= -1;
  sFileName:='.\Envir\Market_Upg\' + sNPCName + '.upg';
  if FileExists(sFileName) then begin
    FileHandle:= FileOpen(sFileName, fmOpenWrite or fmShareDenyNone);
  end else begin
    FileHandle:=FileCreate(sFileName);
  end;
  if FileHandle > 0 then begin
    FileWrite(FileHandle,DataList.Count,SizeOf(Integer));
    for I := 0 to DataList.Count - 1 do begin
      UpgradeInfo:=DataList.Items[I];
      FileWrite(FileHandle,UpgradeInfo^,SizeOf(TUpgradeInfo));
    end;
    FileClose(FileHandle);
    Result:=1;
  end;
end;

function TFrmDB.LoadGoodRecord(NPC: TMerchant; sFile: String): Integer;//0048C574
var
  I: Integer;
  sFileName:String;
  FileHandle:Integer;
  UserItem:pTUserItem;
  List:TList;
  Header420:TGoodFileHeader;
begin
  Result:= -1;
  sFileName:='.\Envir\Market_Saved\' + sFile + '.sav';
  if FileExists(sFileName) then begin
    FileHandle:= FileOpen(sFileName, fmOpenRead or fmShareDenyNone);
    List:=nil;
    if FileHandle > 0 then begin
      if FileRead(FileHandle,Header420,SizeOf(TGoodFileHeader)) = SizeOf(TGoodFileHeader) then begin
        for I := 0 to Header420.nItemCount - 1 do begin
          New(UserItem);
          if FileRead(FileHandle,UserItem^,SizeOf(TUserItem)) = SizeOf(TUserItem) then begin
            if List = nil then begin
              List:=TList.Create;
              List.Add(UserItem)
            end else begin
              if pTUserItem(List.Items[0]).wIndex = UserItem.wIndex then begin
                List.Add(UserItem);
              end else begin
                NPC.m_GoodsList.Add(List);
                List:=TList.Create;
                List.Add(UserItem);
              end;
            end;
          end;
        end;
        if List <> nil then
          NPC.m_GoodsList.Add(List);
        FileClose(FileHandle);
        Result:=1;
      end;
    end;
  end;
end;

function TFrmDB.LoadGoodPriceRecord(NPC: TMerchant; sFile: String): Integer;//0048C918
var
  I: Integer;
  sFileName:String;
  FileHandle:Integer;
  ItemPrice:pTItemPrice;
  Header420:TGoodFileHeader;
begin
  Result:= -1;
  sFileName:='.\Envir\Market_Prices\' + sFile + '.prc';
  if FileExists(sFileName) then begin
    FileHandle:= FileOpen(sFileName, fmOpenRead or fmShareDenyNone);
    if FileHandle > 0 then begin
      if FileRead(FileHandle,Header420,SizeOf(TGoodFileHeader)) = SizeOf(TGoodFileHeader) then begin
        for I := 0 to Header420.nItemCount - 1 do begin
          New(ItemPrice);
          if FileRead(FileHandle,ItemPrice^,SizeOf(TItemPrice)) = SizeOf(TItemPrice) then begin
            NPC.m_ItemPriceList.Add(ItemPrice);
          end else begin
            Dispose(ItemPrice);
            break;
          end;
        end;
      end;
      FileClose(FileHandle);
      Result:=1;
    end;
  end;
end;
{
procedure DeCryptString(Src,Dest:PChar;nSrc:Integer;var nDest:Integer);stdcall;
begin

end;
}
function DeCodeString(sSrc:String):String;
var
  Dest:array[0..1024] of Char;
  nDest:Integer;
begin
  if sSrc = '' then exit;
  {if (nDeCryptString >= 0) and Assigned(PlugProcArray[nDeCryptString].nProcAddr) then begin
    FillChar(Dest,SizeOf(Dest),0);
    TDeCryptString(PlugProcArray[nDeCryptString].nProcAddr)(@sSrc[1],@Dest,length(sSrc),nDest);
    Result:=strpas(PChar(@Dest));
    exit;
  end;}
  Result:=sSrc;
//  DeCryptString(@sSrc[1],@Dest,length(sSrc),nDest);

end;
procedure TFrmDB.DeCodeStringList(StringList: TStringList);
var
  I: Integer;
  sLine:String;
begin
  if StringList.Count > 0 then begin
    sLine:=StringList.Strings[0];
    if not CompareLStr(sLine,sENCYPTSCRIPTFLAG,length(sENCYPTSCRIPTFLAG)) then begin
      exit;
    end;
  end;

  for I := 0 to StringList.Count - 1 do begin
    sLine:=StringList.Strings[I];
    sLine:=DeCodeString(sLine);
    StringList.Strings[I]:=sLine;
  end;
end;


constructor TFrmDB.Create();
begin
  inherited;
  CoInitialize(nil);

  Query:=TADOQuery.Create(nil);
end;

destructor TFrmDB.Destroy;
begin
  Query.Free;
  CoUnInitialize;
  inherited;
end;

initialization
begin

end;
finalization
begin

end;

end.
