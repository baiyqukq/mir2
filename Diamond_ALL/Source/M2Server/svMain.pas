unit svMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NMUDP, JSocket, ExtCtrls, Buttons, StdCtrls, IniFiles, M2Share,
  Grobal2, SDK, HUtil32, RunSock, Envir, ItemUnit, Magic, NoticeM, Guild, Event,
  Castle,  FrnEngn, UsrEngn, MudUtil, SyncObjs, Menus, ComCtrls, Grids, MD5Unit;

type
  TFrmMain = class(TForm)
    MemoLog: TMemo;
    Timer1: TTimer;
    RunTimer: TTimer;
    DBSocket: TClientSocket;
    ConnectTimer: TTimer;
    StartTimer: TTimer;
    SaveVariableTimer: TTimer;
    CloseTimer: TTimer;
    LogUDP: TNMUDP;
    MainMenu: TMainMenu;
    MENU_CONTROL: TMenuItem;
    MENU_CONTROL_START: TMenuItem;
    MENU_CONTROL_STOP: TMenuItem;
    MENU_CONTROL_EXIT: TMenuItem;
    MENU_CONTROL_RELOAD_CONF: TMenuItem;
    MENU_CONTROL_CLEARLOGMSG: TMenuItem;
    MENU_HELP: TMenuItem;
    MENU_HELP_ABOUT: TMenuItem;
    MENU_MANAGE: TMenuItem;
    MENU_CONTROL_RELOAD: TMenuItem;
    MENU_CONTROL_RELOAD_ITEMDB: TMenuItem;
    MENU_CONTROL_RELOAD_MAGICDB: TMenuItem;
    MENU_CONTROL_RELOAD_MONSTERDB: TMenuItem;
    MENU_OPTION: TMenuItem;
    MENU_OPTION_GENERAL: TMenuItem;
    MENU_OPTION_SERVERCONFIG: TMenuItem;
    MENU_OPTION_GAME: TMenuItem;
    MENU_OPTION_FUNCTION: TMenuItem;
    MENU_CONTROL_RELOAD_MONSTERSAY: TMenuItem;
    MENU_CONTROL_RELOAD_DISABLEMAKE: TMenuItem;
    MENU_CONTROL_GATE: TMenuItem;
    MENU_CONTROL_GATE_OPEN: TMenuItem;
    MENU_CONTROL_GATE_CLOSE: TMenuItem;
    MENU_VIEW: TMenuItem;
    MENU_VIEW_GATE: TMenuItem;
    MENU_VIEW_SESSION: TMenuItem;
    MENU_VIEW_ONLINEHUMAN: TMenuItem;
    MENU_VIEW_LEVEL: TMenuItem;
    MENU_VIEW_LIST: TMenuItem;
    MENU_MANAGE_ONLINEMSG: TMenuItem;
    MENU_VIEW_KERNELINFO: TMenuItem;
    MENU_TOOLS: TMenuItem;
    MENU_TOOLS_MERCHANT: TMenuItem;
    MENU_TOOLS_NPC: TMenuItem;
    MENU_OPTION_ITEMFUNC: TMenuItem;
    MENU_TOOLS_MONGEN: TMenuItem;
    MENU_CONTROL_RELOAD_STARTPOINT: TMenuItem;
    G1: TMenuItem;
    MENU_OPTION_MONSTER: TMenuItem;
    MENU_TOOLS_IPSEARCH: TMenuItem;
    MENU_MANAGE_CASTLE: TMenuItem;
    GridGate: TStringGrid;
    Panel1: TPanel;
    LbUserCount: TLabel;
    LbTimeCount: TLabel;
    LbRunTime: TLabel;
    Label20: TLabel;
    Label2: TLabel;
    Label1: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

    procedure MemoLogChange(Sender: TObject);
    procedure MemoLogDblClick(Sender: TObject);
    procedure MENU_CONTROL_EXITClick(Sender: TObject);
    procedure MENU_CONTROL_RELOAD_CONFClick(Sender: TObject);
    procedure MENU_CONTROL_CLEARLOGMSGClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure MENU_CONTROL_RELOAD_ITEMDBClick(Sender: TObject);
    procedure MENU_CONTROL_RELOAD_MAGICDBClick(Sender: TObject);
    procedure MENU_CONTROL_RELOAD_MONSTERDBClick(Sender: TObject);
    procedure MENU_CONTROL_STARTClick(Sender: TObject);
    procedure MENU_CONTROL_STOPClick(Sender: TObject);
    procedure MENU_HELP_ABOUTClick(Sender: TObject);
    procedure MENU_OPTION_SERVERCONFIGClick(Sender: TObject);
    procedure MENU_OPTION_GENERALClick(Sender: TObject);
    procedure MENU_OPTION_GAMEClick(Sender: TObject);
    procedure MENU_OPTION_FUNCTIONClick(Sender: TObject);
    procedure MENU_CONTROL_RELOAD_MONSTERSAYClick(Sender: TObject);
    procedure MENU_CONTROL_RELOAD_DISABLEMAKEClick(Sender: TObject);
    procedure MENU_CONTROL_GATE_OPENClick(Sender: TObject);
    procedure MENU_CONTROL_GATE_CLOSEClick(Sender: TObject);
    procedure MENU_CONTROLClick(Sender: TObject);
    procedure MENU_VIEW_GATEClick(Sender: TObject);
    procedure MENU_VIEW_SESSIONClick(Sender: TObject);
    procedure MENU_VIEW_ONLINEHUMANClick(Sender: TObject);
    procedure MENU_VIEW_LEVELClick(Sender: TObject);
    procedure MENU_VIEW_LISTClick(Sender: TObject);
    procedure MENU_MANAGE_ONLINEMSGClick(Sender: TObject);
    procedure MENU_VIEW_KERNELINFOClick(Sender: TObject);
    procedure MENU_TOOLS_MERCHANTClick(Sender: TObject);
    procedure MENU_OPTION_ITEMFUNCClick(Sender: TObject);
    procedure MENU_TOOLS_MONGENClick(Sender: TObject);
    procedure MENU_CONTROL_RELOAD_STARTPOINTClick(Sender: TObject);
    procedure G1Click(Sender: TObject);
    procedure MENU_OPTION_MONSTERClick(Sender: TObject);
    procedure MENU_TOOLS_IPSEARCHClick(Sender: TObject);
    procedure MENU_MANAGE_CASTLEClick(Sender: TObject);
  private
    boServiceStarted  :Boolean;
    procedure GateSocketClientError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure GateSocketClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure GateSocketClientConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure GateSocketClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure DBSocketConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure DBSocketError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure DBSocketRead(Sender: TObject; Socket: TCustomWinSocket);

    procedure Timer1Timer(Sender: TObject);
    procedure StartTimerTimer(Sender: TObject);
    procedure CloseTimerTimer(Sender: TObject);
    procedure SaveVariableTimerTimer(Sender: TObject);
    procedure RunTimerTimer(Sender: TObject);
    procedure ConnectTimerTimer(Sender: TObject);
                
    procedure StartService();
    procedure StopService();
    procedure SaveItemNumber;
    function  LoadClientFile():Boolean;
    procedure StartEngine;
    procedure MakeStoneMines;
    procedure ReloadConfig(Sender: TObject);
    procedure ClearMemoLog();
    procedure CloseGateSocket();
    { Private declarations }
  public
    GateSocket:TServerSocket;
    procedure AppOnIdle (Sender: TObject; var Done: Boolean);
    procedure OnProgramException(Sender: TObject; E: Exception);
    procedure SetMenu(); virtual;
    procedure MyMessage(var MsgData:TWmCopyData);message WM_COPYDATA;    
    { Public declarations }
  end;

  function  LoadAbuseInformation(FileName:String):Boolean;
  procedure LoadServerTable();
  procedure WriteConLog(MsgList:TStringList);
  procedure ChangeCaptionText(Msg:PChar;nLen:Integer);stdcall;
  procedure UserEngineThread(ThreadInfo:pTThreadInfo);stdcall;
  procedure ProcessGameRun();

var
  FrmMain: TFrmMain;
  g_GateSocket: TServerSocket;
implementation
uses
  LocalDB, InterServerMsg, InterMsgClient, IdSrvClient, FSrvValue,
  GeneralConfig, GameConfig, FunctionConfig, ObjRobot, ViewSession,
  ViewOnlineHuman, ViewLevel, ViewList, OnlineMsg, ViewKernelInfo,
  ConfigMerchant, ItemSet, ConfigMonGen, EDcode, EncryptUnit,
  GameCommand, MonsterConfig, RunDB, CastleManage;
var
  sCaption:String;
  sCaptionExtText:String;
  l_dwRunTimeTick:LongWord;
  boRemoteOpenGateSocket:Boolean = False;
  boRemoteOpenGateSocketed:Boolean = False;
  sChar:String = ' ?';
  sRun:String = 'Run';
{$R *.dfm}
procedure ChangeCaptionText(Msg:PChar;nLen:Integer);stdcall;
var
  sMsg:String;
begin
  if (nLen > 0) and (nLen < 30) then begin
    setlength(sMsg,nLen);
    Move(Msg^,sMsg[1],nLen);
    sCaptionExtText:=sMsg;
  end;
end;

function LoadAbuseInformation(FileName:String):Boolean;
var
  i:integer;
  sText:String;
begin
  Result:=False;
  if FileExists(FileName) then begin
    AbuseTextList.Clear;
    AbuseTextList.LoadFromFile(FileName);
    i:=0;
    while (True) do begin
      if AbuseTextList.Count <= i then break;
      sText:=Trim(AbuseTextList.Strings[i]);
      if sText = '' then begin
        AbuseTextList.Delete(i);
        Continue;
      end;
      Inc(i);
    end;
    Result:=True;
  end;
end;

procedure LoadServerTable();//004E3E64
var
  i,ii:Integer;
  LoadList:TStringList;
  GateList:TStringList;
  SrvNetInfo:pTSrvNetInfo;
  sLineText,sGateMsg:String;
  sServerIdx,sIPaddr,sPort:String;
begin
  for I:=0 to ServerTableList.Count -1 do begin
    TList(ServerTableList.Items[I]).Free;
  end;
  ServerTableList.Clear;
  if FileExists('.\!servertable.txt') then begin
    LoadList:=TStringList.Create;
    LoadList.LoadFromFile('.\!servertable.txt');
    for I:=0 to LoadList.Count - 1 do begin
      sLineText:=Trim(LoadList.Strings[i]);
      if (sLineText <> '') and (sLineText[1] <> ';') then begin
        sGateMsg:=Trim(GetValidStr3(sLineText, sGateMsg, [' ', #9]));
        if sGateMsg <> '' then begin
          GateList:=TStringList.Create;
          for II:=0 to 30 do begin
            if sGateMsg = '' then break;
            sGateMsg:=Trim(GetValidStr3(sGateMsg, sIPaddr, [' ', #9]));
            sGateMsg:=Trim(GetValidStr3(sGateMsg, sPort, [' ', #9]));
            if (sIPaddr <> '') and (sPort <> '') then begin
              GateList.AddObject(sIPaddr,TObject(Str_ToInt(sPort,0)));
            end;
          end;
          ServerTableList.Add(GateList);
        end;
      end;
    end;
    LoadList.Free;
  end else begin
    ShowMessage('File not found... <!servertable.txt>');
  end;
end;

procedure WriteConLog(MsgList:TStringList);
var
  I: Integer;
  Year, Month, Day, Hour, Min, Sec, MSec: Word;
  sLogDir,sLogFileName:String;
  LogFile:TextFile;
begin
  if MsgList.Count <= 0 then exit;
  DecodeDate(Date, Year, Month, Day);
  DecodeTime(Time, Hour, Min, Sec, MSec);
  if not DirectoryExists(g_Config.sConLogDir) then begin
    //CreateDirectory(PChar(g_Config.sConLogDir),nil);
    CreateDir(g_Config.sConLogDir);
  end;
  sLogDir:=g_Config.sConLogDir + IntToStr(Year) + '-' + IntToStr2(Month) + '-' + IntToStr2(Day);
  if not DirectoryExists(sLogDir) then begin
    CreateDirectory(PChar(sLogDir),nil);
  end;
  sLogFileName:=sLogDir + '\C-' + IntToStr(nServerIndex) + '-' + IntToStr2(Hour) + 'H' + IntToStr2((Min div 10 * 2) * 5) + 'M.txt';
  AssignFile(LogFile,sLogFileName);
  if not FileExists(sLogFileName) then begin
    Rewrite(LogFile);
  end else begin
    Append(LogFile);
  end;
  for I := 0 to MsgList.Count - 1 do begin
    WriteLn(LogFile,'1' + #9 + MsgList.Strings[I]);
  end;    // for
  CloseFile(LogFile);
end;


procedure TFrmMain.SaveItemNumber();
var
  I:Integer;
begin
try
  Config.WriteInteger('Setup','ItemNumber',g_Config.nItemNumber);
  Config.WriteInteger('Setup','ItemNumberEx',g_Config.nItemNumberEx);
  for I := Low(g_Config.GlobalVal) to High(g_Config.GlobalVal) do begin
    Config.WriteInteger('Setup','GlobalVal' + IntToStr(I),g_Config.GlobalVal[I])
  end;
  Config.WriteInteger('Setup','WinLotteryCount',g_Config.nWinLotteryCount);
  Config.WriteInteger('Setup','NoWinLotteryCount',g_Config.nNoWinLotteryCount);
  Config.WriteInteger('Setup','WinLotteryLevel1',g_Config.nWinLotteryLevel1);
  Config.WriteInteger('Setup','WinLotteryLevel2',g_Config.nWinLotteryLevel2);
  Config.WriteInteger('Setup','WinLotteryLevel3',g_Config.nWinLotteryLevel3);
  Config.WriteInteger('Setup','WinLotteryLevel4',g_Config.nWinLotteryLevel4);
  Config.WriteInteger('Setup','WinLotteryLevel5',g_Config.nWinLotteryLevel5);
  Config.WriteInteger('Setup','WinLotteryLevel6',g_Config.nWinLotteryLevel6);

except

end;
end;
procedure TFrmMain.AppOnIdle (Sender: TObject; var Done: Boolean);
begin
//   MainOutMessage ('空闲');
end;
procedure TFrmMain.OnProgramException (Sender: TObject; E: Exception);
begin
  MainOutMessage(E.Message);
end;

procedure TFrmMain.DBSocketError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
 ErrorCode:=0;
 Socket.Close;
end;

procedure TFrmMain.DBSocketRead(Sender: TObject; Socket: TCustomWinSocket);
var
  tStr:String;
begin
  EnterCriticalSection(UserDBSection);
  try
    tStr:=Socket.ReceiveText;
    g_Config.sDBSocketRecvText:=g_Config.sDBSocketRecvText + tStr;

    if not g_Config.boDBSocketWorking then begin
      g_Config.sDBSocketRecvText:='';
    end;
  finally
    LeaveCriticalSection(UserDBSection);
  end;
end;

procedure TFrmMain.Timer1Timer(Sender: TObject); //004E5418
var
  boWriteLog :Boolean;
  i          :Integer;
  nRow       :Integer;
  wHour      :Word;
  wMinute    :Word;
  wSecond    :Word;
  tSecond    :Integer;
  sSrvType   :String;
  tTimeCount :Currency;
  GateInfo   :pTGateInfo;
//  sGate,tGate      :String;
  LogFile :TextFile;
  MemoryStream:TMemoryStream;
  s28:String;
begin
//  Caption:=sCaption + ' [' + sCaptionExtText + ']';
  Caption:= format('%s - %s',[g_sTitleName,sCaption]);
  EnterCriticalSection(LogMsgCriticalSection);
  try
    if MemoLog.Lines.Count > 500 then MemoLog.Clear;
    boWriteLog:=True;
    if MainLogMsgList.Count > 0 then begin
      try
        if not FileExists(sLogFileName) then begin
          AssignFile(LogFile,sLogFileName);
          Rewrite(LogFile);
        end else begin
          AssignFile(LogFile,sLogFileName);
          Append(LogFile);
        end;
        boWriteLog:=False;
      except
        MemoLog.Lines.Add('Failed to write to log file...');
      end;
    end;
    for i:=0 to MainLogMsgList.Count - 1 do begin
      MemoLog.Lines.Add(MainLogMsgList.Strings[i]);
      if not boWriteLog then begin
        Writeln(LogFile,MainLogMsgList.Strings[i]);
      end;
    end;
    MainLogMsgList.Clear;
    if not boWriteLog then CloseFile(LogFile);
    for I := 0 to LogStringList.Count - 1 do begin
      MemoryStream:=TMemoryStream.Create;
      try
        s28:='1' + #9 + IntToStr(g_Config.nServerNumber) + #9 + IntToStr(nServerIndex) + #9 + LogStringList.Strings[I];
        MemoryStream.Write(s28[1],length(s28));
        LogUDP.SendStream(MemoryStream);
      finally
        MemoryStream.Free;
      end;
    end;
    LogStringList.Clear;
    if LogonCostLogList.Count > 0 then begin
      WriteConLog(LogonCostLogList);
    end;
    LogonCostLogList.Clear;  
  finally
    LeaveCriticalSection(LogMsgCriticalSection);
  end;


  if nServerIndex = 0 then begin
    sSrvType:='[M]';
  end else begin
    if FrmMsgClient.MsgClient.Socket.Connected then begin
      sSrvType:='[S]';
    end else begin
      sSrvType:='[ ]';
    end;
  end;
  //检查线程 运行时间
  //g_dwEngineRunTime:=GetTickCount - g_dwEngineTick;

  tSecond:=(GetTickCount() - g_dwStartTick) div 1000;
  wHour:=tSecond div 3600;
  wMinute:=(tSecond div 60) mod 60;
  wSecond:=tSecond mod 60;
  LbRunTime.Caption:= IntToStr(wHour) + ':' +
                      IntToStr(wMinute) + ':' +
                      IntToStr(wSecond) + ' ' + sSrvType;{ +
                      IntToStr(g_dwEngineRunTime) + g_sProcessName + '-' + g_sOldProcessName;}
  LbUserCount.Caption:= '(' + IntToStr(UserEngine.MonsterCount) + ')   ' +
                        IntToStr(UserEngine.OnlinePlayObject) + '/' +
                        IntToStr(UserEngine.PlayObjectCount) + '[' +
                        IntToStr(UserEngine.LoadPlayCount) + '/' +
                        IntToStr(UserEngine.m_PlayObjectFreeList.Count) + ']';
  {
  Label1.Caption:= 'Run' + IntToStr(nRunTimeMin) + '/' + IntToStr(nRunTimeMax) + ' ' +
                   'Soc' + IntToStr(g_nSockCountMin) + '/' + IntToStr(g_nSockCountMax) + ' ' +
                   'Usr' + IntToStr(g_nUsrTimeMin) + '/' + IntToStr(g_nUsrTimeMax);
  }
  Label1.Caption:= format('Run:%d/%d Soc:%d/%d Usr:%d/%d',[nRunTimeMin,nRunTimeMax,g_nSockCountMin,g_nSockCountMax,g_nUsrTimeMin,g_nUsrTimeMax]);
  {
  Label2.Caption:= 'Hum' + IntToStr(g_nHumCountMin) + '/' + IntToStr(g_nHumCountMax) + ' ' +
                   'Mon' + IntToStr(g_nMonTimeMin) + '/' + IntToStr(g_nMonTimeMax) + ' ' +
                   'UsrRot' + IntToStr(dwUsrRotCountMin) + '/' + IntToStr(dwUsrRotCountMax) + ' ' +
                   'Merch' + IntToStr(UserEngine.dwProcessMerchantTimeMin) + '/' + IntToStr(UserEngine.dwProcessMerchantTimeMax) + ' ' +
                   'Npc' + IntToStr(UserEngine.dwProcessNpcTimeMin) + '/' + IntToStr(UserEngine.dwProcessNpcTimeMax) + ' ' +
                   '(' + IntToStr(g_nProcessHumanLoopTime) + ')';
  }
  Label2.Caption:= format('Hum:%d/%d UsrRot:%d/%d Merch:%d/%d Npc:%d/%d (%d)',[g_nHumCountMin,
                                                                                  g_nHumCountMax,
                                                                                  dwUsrRotCountMin,
                                                                                  dwUsrRotCountMax,
                                                                                  UserEngine.dwProcessMerchantTimeMin,
                                                                                  UserEngine.dwProcessMerchantTimeMax,
                                                                                  UserEngine.dwProcessNpcTimeMin,
                                                                                  UserEngine.dwProcessNpcTimeMax,
                                                                                  g_nProcessHumanLoopTime]);


  {
  Label20.Caption:='MonG' + IntToStr(g_nMonGenTime) + '/' + IntToStr(g_nMonGenTimeMin) + '/' + IntToStr(g_nMonGenTimeMax) + ' ' +
                   'MonP' + IntToStr(g_nMonProcTime) + '/' + IntToStr(g_nMonProcTimeMin) + '/' + IntToStr(g_nMonProcTimeMax) + ' ' +
                   'ObjRun' + IntToStr(g_nBaseObjTimeMin) + '/' + IntToStr(g_nBaseObjTimeMax);
  }
  Label20.Caption:=format('MonG:%d/%d/%d MonP:%d/%d/%d ObjRun:%d/%d',[g_nMonGenTime,g_nMonGenTimeMin,g_nMonGenTimeMax,g_nMonProcTime,g_nMonProcTimeMin,g_nMonProcTimeMax,g_nBaseObjTimeMin,g_nBaseObjTimeMax]);

  tTimeCount:=GetTickCount() / (24 * 60 * 60 * 1000);
  if tTimeCount >= 36 then LbTimeCount.Font.Color:=clBlue
  else LbTimeCount.Font.Color:=clMaroon;
  LbTimeCount.Caption:=CurrToStr(tTimeCount) + '天';
  {
  //004E5B78
  for i:= Low(RunSocket.GateList) to High(RunSocket.GateList) do begin
    GateInfo:=@RunSocket.GateList[i];
    if GateInfo.boUsed and (GateInfo.Socket <> nil) then begin
      if GateInfo.nSendMsgBytes < 1024 then begin
        tGate:=IntToStr(GateInfo.nSendMsgBytes) + 'b ';
      end else begin//004E5BDA
        tGate:=IntToStr(GateInfo.nSendMsgBytes div 1024) + 'kb ';
      end;//004E5C0A
      sGate:='[G' + IntToStr(i) + ': ' +
             IntToStr(GateInfo.nSendMsgCount) + '/' +
             IntToStr(GateInfo.nSendRemainCount) + ' ' +
             tGate + IntToStr(GateInfo.nSendedMsgCount) + ']' + sGate;
    end;//004E5C90
  end;
  Label3.Caption:=sGate;
  }
 // GridGate
  nRow:=1;
  //for i:= Low(RunSocket.GateList) to High(RunSocket.GateList) do begin
  for i:= Low(g_GateArr) to High(g_GateArr) do begin
    GridGate.Cells[0,I + 1]:='';
    GridGate.Cells[1,I + 1]:='';
    GridGate.Cells[2,I + 1]:='';
    GridGate.Cells[3,I + 1]:='';
    GridGate.Cells[4,I + 1]:='';
    GridGate.Cells[5,I + 1]:='';
    GridGate.Cells[6,I + 1]:='';
    GateInfo:=@g_GateArr[i];
    //GateInfo:=@RunSocket.GateList[i];
    if GateInfo.boUsed and (GateInfo.Socket <> nil) then begin
      GridGate.Cells[0,nRow]:=IntToStr(I);
      GridGate.Cells[1,nRow]:=GateInfo.sAddr + ':' + IntToStr(GateInfo.nPort);
      GridGate.Cells[2,nRow]:=IntToStr(GateInfo.nSendMsgCount);
      GridGate.Cells[3,nRow]:=IntToStr(GateInfo.nSendedMsgCount);
      GridGate.Cells[4,nRow]:=IntToStr(GateInfo.nSendRemainCount);
      if GateInfo.nSendMsgBytes < 1024 then begin
        GridGate.Cells[5,nRow]:=IntToStr(GateInfo.nSendMsgBytes) + 'b';
      end else begin
        GridGate.Cells[5,nRow]:=IntToStr(GateInfo.nSendMsgBytes div 1024) + 'kb';
      end;
      GridGate.Cells[6,nRow]:=IntToStr(GateInfo.nUserCount) + '/' + IntToStr(GateInfo.UserList.Count);
      Inc(nRow);
    end;
  end;

  Inc(nRunTimeMax);

  if g_nSockCountMax   > 0 then Dec(g_nSockCountMax);
  if g_nUsrTimeMax     > 0 then Dec(g_nUsrTimeMax);
  if g_nHumCountMax    > 0 then Dec(g_nHumCountMax);
  if g_nMonTimeMax     > 0 then Dec(g_nMonTimeMax);
  if dwUsrRotCountMax  > 0 then Dec(dwUsrRotCountMax);
  if g_nMonGenTimeMin  > 1 then Dec(g_nMonGenTimeMin,2);
  if g_nMonProcTimeMin > 1 then Dec(g_nMonProcTimeMin,2);
  if g_nBaseObjTimeMax > 0 then Dec(g_nBaseObjTimeMax);
    
end;

procedure TFrmMain.StartTimerTimer(Sender: TObject);//004E4848
var
  nCode:Integer;
begin
  SendGameCenterMsg(SG_STARTNOW,'正在启动游戏主程序...');
  StartTimer.Enabled:=False;
  FrmDB:=TFrmDB.Create();
  StartService();

  try
    if SizeOf(THumDataInfo)<> SIZEOFTHUMAN then begin
      ShowMessage('SizeOf(THuman) ' + IntToStr(sizeof(THumDataInfo)) + ' <> SIZEOFTHUMAN ' + IntToStr(SIZEOFTHUMAN));
      Close;
      exit;
    end;
    if not LoadClientFile then begin
      Close;
      exit;
    end;

    FrmDB.Query.ConnectionString:=g_sADODBString;


    LoadGameLogItemNameList();
    LoadDenyIPAddrList();
    LoadDenyAccountList();
    LoadDenyChrNameList();
    LoadNoClearMonList();
    g_Config.nServerFile_CRCB:=CalcFileCRC(Application.ExeName);
    MemoLog.Lines.Add('loading StdItem.DB...');
    nCode:=FrmDB.LoadItemsDB;
    if nCode < 0 then begin
      MemoLog.Lines.Add('StdItems.DB : Failure was occurred while reading this file.' + 'Code= ' + IntToStr(nCode));
      exit;
    end;
    MemoLog.Lines.Add(format('StdItem.DB loaded(%d).',[UserEngine.StdItemList.Count]));

    MemoLog.Lines.Add('loading MapFiles...');
    nCode:= FrmDB.LoadMapInfo;
    if nCode < 0 then begin
      MemoLog.Lines.Add('MapInfo : Failure occurred.' + 'Code= ' + IntToStr(nCode));
      exit;
    end;
    MemoLog.Lines.Add(format('Mapfile loaded(%d).',[g_MapManager.Count]));

    MemoLog.Lines.Add('loading Monster.DB...');
    nCode:= FrmDB.LoadMonsterDB;
    if nCode < 0 then begin
      MemoLog.Lines.Add('Monster.DB : Failure was occurred while reading this file.' + 'Code= ' + IntToStr(nCode));
      exit;
    end;
    MemoLog.Lines.Add(format('Monster.DB loaded(%d).',[UserEngine.MonsterList.Count]));

    MemoLog.Lines.Add('loading Magic.DB...');
    nCode:= FrmDB.LoadMagicDB;
    if nCode < 0 then begin
      MemoLog.Lines.Add('Magic.DB : Failure was occurred while reading this file.' + 'Code= ' + IntToStr(nCode));
      exit;
    end;
    MemoLog.Lines.Add(format('Magic.DB loaded(%d).',[UserEngine.m_MagicList.Count]));

    MemoLog.Lines.Add('loading MonGen.txt...');
    nCode:= FrmDB.LoadMonGen;
    if nCode < 0 then begin
      MemoLog.Lines.Add('MonGen.txt : Failure was occurred while reading this file.' + 'Code= ' + IntToStr(nCode));
      exit;
    end;
    MemoLog.Lines.Add(format('MonGen.txt loaded(%d).',[UserEngine.m_MonGenList.Count]));
    
    MemoLog.Lines.Add('loading GenMsg.txt...');
    LoadMonSayMsg();
    MemoLog.Lines.Add(format('GenMsg.txt loaded(%d).',[g_MonSayMsgList.Count]));
    LoadDisableTakeOffList();
    LoadMonDropLimitList();
    LoadDisableMakeItem();
    LoadEnableMakeItem();
    LoadAllowSellOffItem();
    LoadDisableMoveMap;
    ItemUnit.LoadCustomItemName();
    LoadDisableSendMsgList();
    LoadItemBindIPaddr();
    LoadItemBindAccount();
    LoadItemBindCharName();
    LoadUnMasterList();
    LoadUnForceMasterList();
    MemoLog.Lines.Add('loading UnbindList.txt...');
    nCode:= FrmDB.LoadUnbindList;
    if nCode < 0 then begin
      MemoLog.Lines.Add('UnbindList.txt : Failure was occurred while reading this file.' + 'Code= ' + IntToStr(nCode));
      exit;
    end;
    MemoLog.Lines.Add('UnbindList information loaded.');

    MemoLog.Lines.Add('loading MapQuest.txt...');
    nCode:= FrmDB.LoadMapQuest;
    if nCode < 0 then begin
      MemoLog.Lines.Add('MapQuest.txt : Failure was occurred while reading this file.' + 'Code= ' + IntToStr(nCode));
      exit;
    end;
    MemoLog.Lines.Add('MapQuest information loaded.');

    MemoLog.Lines.Add('loading QuestDiary\*.txt...');
    nCode:= FrmDB.LoadQuestDiary;
    if nCode < 0 then begin
      MemoLog.Lines.Add('QuestDiary\*.txt : Failure was occurred while reading this file.' + 'Code= ' + IntToStr(nCode));
      exit;
    end;
    MemoLog.Lines.Add('QuestDiary information loaded.');

    if LoadAbuseInformation('.\!Abuse.txt') then begin
      MemoLog.Lines.Add('!Abuse.txt loaded..');
    end;

    MemoLog.Lines.Add('loading LineNotice...');
    if not LoadLineNotice(g_Config.sNoticeDir + 'LineNotice.txt') then  begin
      MemoLog.Lines.Add('LineNotice.txt : Failed to load.');
    end;
    MemoLog.Lines.Add('LineNotice loaded...');

    FrmDB.LoadAdminList();
    MemoLog.Lines.Add('AdminList loaded..');
    g_GuildManager.LoadGuildInfo();
    MemoLog.Lines.Add('GuildList loaded..');

    g_CastleManager.LoadCastleList();
    MemoLog.Lines.Add('CastleList loaded..');


    //UserCastle.Initialize;
    g_CastleManager.Initialize;
    MemoLog.Lines.Add('Castle initialized..');
    if (nServerIndex=0) then FrmSrvMsg.StartMsgServer
    else FrmMsgClient.ConnectMsgServer;
    StartEngine();
    boStartReady:=True;
    Sleep(500);

{$IF DBSOCKETMODE = TIMERENGINE}
    ConnectTimer.Enabled:=True;
{$ELSE}
    FillChar(g_Config.DBSOcketThread,SizeOf(g_Config.DBSOcketThread),0);
    g_Config.DBSOcketThread.Config:=@g_Config;
    g_Config.DBSOcketThread.hThreadHandle:=CreateThread(nil,
                                                 0,
                                                 @DBSocketThread,
                                                 @g_Config.DBSOcketThread,
                                                 0,
                                                 g_Config.DBSOcketThread.dwThreadID);
{$IFEND}
{$IF IDSOCKETMODE = THREADENGINE}
    FillChar(g_Config.IDSocketThread,SizeOf(g_Config.IDSocketThread),0);
    g_Config.IDSocketThread.Config:=@g_Config;
    g_Config.IDSocketThread.hThreadHandle:=CreateThread(nil,
                                                 0,
                                                 @IDSocketThread,
                                                 @g_Config.IDSocketThread,
                                                 0,
                                                 g_Config.IDSocketThread.dwThreadID);

{$IFEND}
     g_dwRunTick := GetTickCount();

    n4EBD1C  := 0;
    g_dwUsrRotCountTick := GetTickCount();
{$IF USERENGINEMODE = THREADENGINE}
    FillChar(g_Config.UserEngineThread,SizeOf(g_Config.UserEngineThread),0);
    g_Config.UserEngineThread.Config:=@g_Config;
    g_Config.UserEngineThread.hThreadHandle:=CreateThread(nil,
                                                 0,
                                                 @UserEngineThread,
                                                 @g_Config.UserEngineThread,
                                                 0,
                                                 g_Config.UserEngineThread.dwThreadID);
 {$ELSE}

{$IFEND}
    RunTimer.Enabled:=True;
    SendGameCenterMsg(SG_STARTOK,'游戏主程序启动完成...');
    GateSocket.Address:=g_Config.sGateAddr;
    GateSocket.Port:=g_Config.nGatePort;
    g_GateSocket:=GateSocket;

    boRemoteOpenGateSocket:=True;
  except
    on e: Exception do
      MainOutMessage('StartTimer exception: ' + E.Message);
  end;
end;

procedure TFrmMain.StartEngine(); //004E5F2C
var
  nCode:Integer;
  nCheckCode:Integer;
ResourceString
  sExceptionMsg = '[Exception] TFrmMain::StartEngine - Code=%d';
begin
  nCheckCode := 0;
  try
{$IF IDSOCKETMODE = TIMERENGINE}
    FrmIDSoc.Initialize;
    MemoLog.Lines.Add('IDSoc Initialized..');
{$IFEND}

    nCheckCode := 1;
    g_MapManager.LoadMapDoor;
    MemoLog.Lines.Add('GrobalEnvir loaded..');

    nCheckCode := 2;
    MakeStoneMines();
    MemoLog.Lines.Add('MakeStoneMines...');

    nCheckCode := 3;
    nCode:= FrmDB.LoadMerchant;
    if nCode < 0 then begin
      MemoLog.Lines.Add('Merchant.txt : Failure was occurred while reading this file.' + 'Code= ' + IntToStr(nCode));
      exit;
    end;
    MemoLog.Lines.Add('Merchant loaded...');

    nCheckCode := 4;
    if not g_Config.boVentureServer then begin
     nCode:= FrmDB.LoadGuardList;
     if nCode < 0 then begin
        MemoLog.Lines.Add('Guardlist.txt : Failure was occurred while reading this file.' + 'Code= ' + IntToStr(nCode));
      end;
      MemoLog.Lines.Add('GuardList loaded..');
    end;

    nCheckCode := 5;
    nCode:= FrmDB.LoadNpcs;
    if nCode < 0 then begin
      MemoLog.Lines.Add('Npc.txt : Failure was occurred while reading this file.' + 'Code= ' + IntToStr(nCode));
      exit;
    end;
    MemoLog.Lines.Add('Npc loaded..');

    nCheckCode := 6;
    nCode:= FrmDB.LoadMakeItem;
    if nCode < 0 then begin
      MemoLog.Lines.Add('MakeItem.txt : Failure was occurred while reading this file.' + 'Code= ' + IntToStr(nCode));
      exit;
    end;
    MemoLog.Lines.Add('MakeItem loaded..');

    nCheckCode := 7;
    nCode:= FrmDB.LoadStartPoint;
    if nCode < 0 then begin
      MemoLog.Lines.Add('StartPoint.txt : Failure was occurred while reading this file.' + 'Code= ' + IntToStr(nCode));
      Close;
    end;
    MemoLog.Lines.Add('StartPoints loaded...');

    nCheckCode := 8;
    FrontEngine.Resume;
    MemoLog.Lines.Add('F-Engine resumed..');

    nCheckCode := 9;
    UserEngine.Initialize;
    MemoLog.Lines.Add('U-Engine initialized..');
  except
    MainOutMessage(format(sExceptionMsg, [nCheckCode]));
  end;
end;

procedure TFrmMain.MakeStoneMines();//004E5E88
var
  i,nW,nH:Integer;
  Envir:TEnvirnoment;
begin
  for i:=0 to g_MapManager.Count -1 do begin
    Envir:=TEnvirnoment(g_MapManager.Items[i]);
    if Envir.Flag.boMINE or Envir.Flag.boMINE2 then begin
      for nW:=0 to Envir.Header.wWidth - 1 do begin
        for nH:=0 to Envir.Header.wHeight - 1 do begin
          //if (nW mod 2 = 0) and (nH mod 2 = 0) then
            TStoneMineEvent.Create(Envir,nW,nH,ET_MINE);
        end;
      end;
    end;      
  end;
end;
function TFrmMain.LoadClientFile():Boolean;
begin
  MemoLog.Lines.Add('loading client version information..');
  if not (g_Config.sClientFile1='') then g_Config.nClientFile1_CRC:=CalcFileCRC(g_Config.sClientFile1);
  if not (g_Config.sClientFile2='') then g_Config.nClientFile2_CRC:=CalcFileCRC(g_Config.sClientFile2);
  if not (g_Config.sClientFile3='') then g_Config.nClientFile3_CRC:=CalcFileCRC(g_Config.sClientFile3);

  if (g_Config.nClientFile1_CRC<>0) or (g_Config.nClientFile2_CRC<>0) or (g_Config.nClientFile3_CRC<>0) then begin
    Result:=True;
  end else begin
    MemoLog.Lines.Add('Loading client version information failed. check !setup.txt -> [setup] -> clientfile1,..');
    Result:=False;
  end;
end;
procedure TFrmMain.FormCreate(Sender: TObject);
var
  nX,nY:Integer;
  Year, Month, Day: Word;
  MemoryStream:TMemoryStream;

ResourceString
  sDemoVersion   = 'DemoVersion';
  sGateIdx       = 'Idx';
  sGateIPaddr    = 'Address';
  sGateListMsg   = 'Msg';
  sGateSendCount = 'SCount';
  sGateMsgCount  = 'MCount';
  sGateSendKB    = 'KB';
  sGateUserCount = 'Users';
begin
  Randomize;

  g_dwGameCenterHandle:=Str_ToInt(ParamStr(1),0);
  nX:=Str_ToInt(ParamStr(2),-1);
  nY:=Str_ToInt(ParamStr(3),-1);
  if (nX >= 0) or (nY >= 0) then begin
    Left:=nX;
    Top:=nY;
  end;
//{$IF (SoftVersion = VERSTD) or (SoftVersion = VERPRO) or (SoftVersion = VERENT)}
  //FrmMain.Menu:=MainMenu;
//  SetMenu();
//{$IFEND}
{$IF SoftVersion = VERDEMO}
  sCaptionExtText:=sDemoVersion;
{$IFEND}

  SendGameCenterMsg(SG_FORMHANDLE,IntToStr(Self.Handle));


  MemoryStream:=TMemoryStream.Create;
  Application.Icon.SaveToStream(MemoryStream);
  //-1868105650 龙
  //1242102148 标准
  g_Config.nAppIconCrc:=CalcBufferCRC(MemoryStream.Memory,MemoryStream.Size);
{$IF VEROWNER = TEST}
  g_Config.nAppIconCrc:=-1;
{$IFEND}
  //MemoLog.Lines.Add(IntToStr(g_Config.nAppIconCrc));
  MemoryStream.Free;
  DecodeDate(Date, Year, Month, Day);

  {if (Year > ENDYEAR) or ((Month * 30 + Day) > ENDMONTH * 30 + ENDDAY) then begin
    Application.MessageBox('程序版本太老，请立即下载最新版本！！！','提示信息',MB_OK + MB_ICONWARNING);
  end;

  if (Year > ENDYEAR) or ((Month * 30 + Day) > ENDMONTH * 30 + ENDDAY + 7) then begin
    Application.MessageBox('请立即下载最新版本！！！','提示信息',MB_OK + MB_ICONERROR);
    exit;
  end;}


  GridGate.RowCount:= 21;
  GridGate.Cells[0,0]:=sGateIdx;
  GridGate.Cells[1,0]:=sGateIPaddr;
  GridGate.Cells[2,0]:=sGateListMsg;
  GridGate.Cells[3,0]:=sGateSendCount;
  GridGate.Cells[4,0]:=sGateMsgCount;
  GridGate.Cells[5,0]:=sGateSendKB;
  GridGate.Cells[6,0]:=sGateUserCount;
{$IF SoftVersion = VERDEMO}
  DECODESCRIPT.Visible:=True;
{$IFEND}
  {
  GridGate.Cells[0,1]:='0';
  GridGate.Cells[1,1]:='888.888.888.888:8888';
  GridGate.Cells[2,1]:='10000';
  GridGate.Cells[3,1]:='10000';
  GridGate.Cells[4,1]:='10000';
  GridGate.Cells[5,1]:='10000';
  }


  GateSocket:=TServerSocket.Create(Owner);
  GateSocket.OnClientConnect    := GateSocketClientConnect;
  GateSocket.OnClientDisconnect := GateSocketClientDisconnect;
  GateSocket.OnClientError      := GateSocketClientError;
  GateSocket.OnClientRead       := GateSocketClientRead;

  DBSocket.OnConnect        := DBSocketConnect;
  DBSocket.OnError          := DBSocketError;
  DBSocket.OnRead           := DBSocketRead;

  Timer1.OnTimer            := Timer1Timer;
  RunTimer.OnTimer          := RunTimerTimer;
  StartTimer.OnTimer        := StartTimerTimer;
  SaveVariableTimer.OnTimer := SaveVariableTimerTimer;
  ConnectTimer.OnTimer      := ConnectTimerTimer;
  CloseTimer.OnTimer        := CloseTimerTimer;
  MemoLog.OnChange          := MemoLogChange;
  StartTimer.Enabled        := True;
end;
procedure TFrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
ResourceString
  sCloseServerYesNo = 'Are you sure you want to close the server?';
  sCloseServerTitle = 'Confirm';
begin
  if not boServiceStarted then begin
//    Application.Terminate;
    exit;
  end;
  if g_boExitServer then begin
    boStartReady:=False;
    StopService();
//    Sleep(500);
    exit;
  end;
  CanClose:=False;
//  if MessageDlg('是否确认退出服务器？', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
  if Application.MessageBox(PChar(sCloseServerYesNo),PChar(sCloseServerTitle),MB_YESNO + MB_ICONQUESTION) = mrYes then begin
    g_boExitServer:=True;
    CloseGateSocket();
    g_Config.boKickAllUser:=True;
    RunSocket.CloseAllGate;
    GateSocket.Close;
    CloseTimer.Enabled:=True;
  end;
end;

procedure TFrmMain.CloseTimerTimer(Sender: TObject);
ResourceString
  sCloseServer = '%s [Saving Players(%d/%d)...]';
begin 
  Caption:=format(sCloseServer,[g_Config.sServerName,UserEngine.OnlinePlayObject,FrontEngine.SaveListCount]);
  if UserEngine.OnlinePlayObject = 0 then begin
    if FrontEngine.IsIdle then begin
      CloseTimer.Enabled:=False;
      Close;
    end;
  end;
end;

procedure TFrmMain.SaveVariableTimerTimer(Sender: TObject);
begin
  SaveItemNumber();
end;

procedure TFrmMain.GateSocketClientError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  RunSocket.CloseErrGate(Socket,ErrorCode);
end;

procedure TFrmMain.GateSocketClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  RunSocket.CloseGate(Socket);
end;

procedure TFrmMain.GateSocketClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  RunSocket.AddGate(Socket);
end;

procedure TFrmMain.GateSocketClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  RunSocket.SocketRead(Socket);
end;

procedure TFrmMain.RunTimerTimer(Sender: TObject);
begin
  if boStartReady then begin
     RunSocket.Run;
{$IF IDSOCKETMODE = TIMERENGINE}
    FrmIDSoc.Run;
{$IFEND}
    UserEngine.Run;
{$IF USERENGINEMODE = TIMERENGINE}
      ProcessGameRun();
{$IFEND}
    //EventManager.Run;
    if nServerIndex = 0 then
      FrmSrvMsg.Run
    else FrmMsgClient.Run;
  end;
  Inc(n4EBD1C);
  if (GetTickCount - g_dwRunTick) > 250 then begin
    g_dwRunTick:=GetTickCount();
    nRunTimeMin:=n4EBD1C;
    if nRunTimeMax > nRunTimeMin then nRunTimeMax:=nRunTimeMin;
    n4EBD1C:=0;
  end;
  if boRemoteOpenGateSocket then begin
    if not boRemoteOpenGateSocketed then begin
      boRemoteOpenGateSocketed:=True;
      try
        if assigned(g_GateSocket) then begin
          g_GateSocket.Active:=True;
        end;
      except
        on e: Exception do begin
          MainOutMessage(E.Message);
        end;
      end;
    end;
  end;
end;

procedure TFrmMain.ConnectTimerTimer(Sender: TObject);
begin
  if DBSocket.Active then exit;
  DBSocket.Active:=True;
end;

procedure TFrmMain.ReloadConfig(Sender: TObject);
begin
try
  LoadConfig();
//  LoadMonSayMsg();
  FrmIDSoc.Timer1Timer(Sender);
  if not (nServerIndex = 0) then begin
    if not FrmMsgClient.MsgClient.Active then begin
      FrmMsgClient.MsgClient.Active:=True;
    end;
  end;
  LogUDP.RemoteHost:=g_Config.sLogServerAddr;
  LogUDP.RemotePort:=g_Config.nLogServerPort;
  LoadServerTable();
  LoadClientFile();
finally

end;
end;

procedure TFrmMain.MemoLogChange(Sender: TObject);
begin
  if MemoLog.Lines.Count > 500 then MemoLog.Clear;
end;

procedure TFrmMain.MemoLogDblClick(Sender: TObject);
begin
  ClearMemoLog();
end;

procedure TFrmMain.MENU_CONTROL_EXITClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmMain.MENU_CONTROL_RELOAD_CONFClick(Sender: TObject);
begin
  ReloadConfig(Sender);
end;

procedure TFrmMain.MENU_CONTROL_CLEARLOGMSGClick(Sender: TObject);
begin
  ClearMemoLog();
end;

procedure TFrmMain.SpeedButton1Click(Sender: TObject);
begin
  ReloadConfig(Sender);
end;

procedure TFrmMain.MENU_CONTROL_RELOAD_ITEMDBClick(Sender: TObject);
begin
  FrmDB.LoadItemsDB();
  MainOutMessage('INFO: Item database has been reloaded...');
end;

procedure TFrmMain.MENU_CONTROL_RELOAD_MAGICDBClick(Sender: TObject);
begin
  FrmDB.LoadMagicDB();
  MainOutMessage('INFO: Magic database has been reloaded...');
end;

procedure TFrmMain.MENU_CONTROL_RELOAD_MONSTERDBClick(Sender: TObject);
begin
  FrmDB.LoadMonsterDB();
  MainOutMessage('INFO: Monster database has been reloaded...');
end;

procedure TFrmMain.StartService;
var
  TimeNow: TDateTime;
  Year, Month, Day, Hour, Min, Sec, MSec:Word;
  F: TextFile;
  Config:pTM2Config;
 
begin
  Config:=@g_Config;
  MENU_CONTROL_START.Enabled:=False;
  MENU_CONTROL_STOP.Enabled:=False;

//  ShowMessage(IntToStr(High(LongWord)));
  nRunTimeMax       := 99999;
  g_nSockCountMax   := 0;
  g_nUsrTimeMax     := 0;
  g_nHumCountMax    := 0;
  g_nMonTimeMax     := 0;
  g_nMonGenTimeMax  := 0;
  g_nMonProcTime    := 0;
  g_nMonProcTimeMin := 0;
  g_nMonProcTimeMax := 0;
  dwUsrRotCountMin  := 0;
  dwUsrRotCountMax  := 0;
  g_nProcessHumanLoopTime  := 0;
  g_dwHumLimit        := 30;
  g_dwMonLimit        := 30;
  g_dwZenLimit        := 5;
  g_dwNpcLimit        := 5;
  g_dwSocLimit        := 10;
  nDecLimit         := 20;

  Config.sDBSocketRecvText := '';
  Config.boDBSocketWorking :=False;
  Config.nLoadDBErrorCount := 0;
  Config.nLoadDBCount      := 0;
  Config.nSaveDBCount      := 0;
  Config.nDBQueryID        := 0;
  Config.nItemNumber       := 0;
  Config.nItemNumberEx     :=High(Integer) div 2;
  boStartReady               := False;
  g_boExitServer             := False;
  boFilterWord               := True;
  Config.nWinLotteryCount  := 0;
  Config.nNoWinLotteryCount:= 0;
  Config.nWinLotteryLevel1 := 0;
  Config.nWinLotteryLevel2 := 0;
  Config.nWinLotteryLevel3 := 0;
  Config.nWinLotteryLevel4 := 0;
  Config.nWinLotteryLevel5 := 0;
  Config.nWinLotteryLevel6 := 0;
  FillChar(g_Config.GlobalVal, SizeOf(g_Config.GlobalVal), #0);
  FillChar(g_Config.GlobaDyMval, SizeOf(g_Config.GlobaDyMval), #0);
{$IF USECODE = USEREMOTECODE}
  New(Config.Encode6BitBuf);
  Config.Encode6BitBuf^:=g_Encode6BitBuf;

  New(Config.Decode6BitBuf);
  Config.Decode6BitBuf^:=g_Decode6BitBuf;
{$IFEND}

  LoadConfig();
  Memo              := MemoLog;
  nServerIndex      := 0;
  RunSocket         := TRunSocket.Create();
  MainLogMsgList    := TStringList.Create;
  LogStringList     := TStringList.Create;
  LogonCostLogList  := TStringList.Create;
  g_MapManager      := TMapManager.Create;
  ItemUnit          := TItemUnit.Create;
  MagicManager      := TMagicManager.Create;
  NoticeManager     := TNoticeManager.Create;
  g_GuildManager    := TGuildManager.Create;
  g_EventManager    := TEventManager.Create;
  g_CastleManager   := TCastleManager.Create;
  {
  g_UserCastle        := TUserCastle.Create;

  CastleManager.Add(g_UserCastle);
  }

  FrontEngine       := TFrontEngine.Create(True);
  UserEngine        := TUserEngine.Create();
  RobotManage       := TRobotManage.Create;
  g_MakeItemList    := TStringList.Create;
  g_StartPoint      := TGList.Create;
  ServerTableList   := TList.Create;
  g_DenySayMsgList  := TQuickList.Create;
  MiniMapList       := TStringList.Create;
  g_UnbindList      := TStringList.Create;
  LineNoticeList    := TStringList.Create;
  QuestDiaryList    := TList.Create;
  ItemEventList     := TStringList.Create;
  AbuseTextList     := TStringList.Create;

  g_MonSayMsgList       := TStringList.Create;
  g_ChatLoggingList     := TGStringList.Create;
  g_DisableMakeItemList := TGStringList.Create;
  g_EnableMakeItemList  := TGStringList.Create;
  g_DisableSellOffList  := TGStringList.Create;
  g_DisableMoveMapList  := TGStringList.Create;
  g_ItemNameList        := TGList.Create;
  g_DisableSendMsgList  := TGStringList.Create;
  g_MonDropLimitLIst    := TGStringList.Create;
  g_DisableTakeOffList  := TGStringList.Create;
  g_UnMasterList        := TGStringList.Create;
  g_UnForceMasterList   := TGStringList.Create;
  g_GameLogItemNameList := TGStringList.Create;
  g_DenyIPAddrList      := TGStringList.Create;
  g_DenyChrNameList     := TGStringList.Create;
  g_DenyAccountList     := TGStringList.Create;
  g_NoClearMonList      := TGStringList.Create;

  g_ItemBindIPaddr      :=TGList.Create;
  g_ItemBindAccount     :=TGList.Create;
  g_ItemBindCharName    :=TGList.Create;
//  n4EBBD0           := 0;
  InitializeCriticalSection(LogMsgCriticalSection);
  InitializeCriticalSection(ProcessMsgCriticalSection);
  InitializeCriticalSection(ProcessHumanCriticalSection);

  InitializeCriticalSection(Config.UserIDSection);
  InitializeCriticalSection(UserDBSection);
  CS_6              := TCriticalSection.Create;
  //MD5               := TMD5.Create;
  g_DynamicVarList  := TList.Create;

  TimeNow:=Now();
  DecodeDate(TimeNow, Year, Month, Day);
  DecodeTime(TimeNow, Hour, Min, Sec, MSec);
  sLogFileName:=g_Config.sLogDir{'.\Log\'} + IntToStr(Year) + '-' + IntToStr2(Month) + '-' + IntToStr2(Day) + '.' + IntToStr2(Hour) + '-' + IntToStr2(Min) + '.txt';
  
  if not DirectoryExists(g_Config.sLogDir) then begin
    if CreateDir(Config.sLogDir) then begin
      AssignFile(F, sLogFileName);
      Rewrite(F);
      CloseFile(F);
    end;
  end;

  

  nShiftUsrDataNameNo := 1;

  DBSocket.Address  := g_Config.sDBAddr;
  DBSocket.Port     := g_Config.nDBPort;
//  DBSocket.Active   := True;

  sCaption        := g_Config.sServerName;// +' ' + DateToStr(Date)+ ' ' + TimeToStr(Time);
  Caption:= format('%s - %s',[g_sTitleName,sCaption]);
  LoadServerTable();

  LogUDP.RemoteHost   := g_Config.sLogServerAddr;
  LogUDP.RemotePort   := g_Config.nLogServerPort;
//  ConnectTimer.Enabled:= True;

  Application.OnIdle  := AppOnIdle;
  Application.OnException := OnProgramException;
  dwRunDBTimeMax        := GetTickCount();
  g_dwStartTick         := GetTickCount();
  Timer1.Enabled      := True;
//  StartTimer.Enabled  := True;

  boServiceStarted:=True;
  MENU_CONTROL_STOP.Enabled:=True;
end;

procedure TFrmMain.StopService;
var
  I: Integer;
  Config:pTM2Config;
  ThreadInfo:pTThreadInfo;
begin
  Config:=@g_Config;
  MENU_CONTROL_START.Enabled:=False;
  MENU_CONTROL_STOP.Enabled:=False;
  Timer1.Enabled:=False;
  RunTimer.Enabled:=False;
  FrmIDSoc.Close;
  GateSocket.Close;
  Memo:=nil;
  SaveItemNumber();
  SaveChatLog();
  g_CastleManager.Free;
//  UserCastle.Save;
//  UserCastle.Free;

{$IF USERENGINEMODE = THREADENGINE}
  ThreadInfo:=@Config.UserEngineThread;
  ThreadInfo.boTerminaled:=True;
  if WaitForSingleObject(ThreadInfo.hThreadHandle,1000) <> 0 then begin
    SuspendThread(ThreadInfo.hThreadHandle);
  end;
{$IFEND}
{$IF DBSOCKETMODE = THREADENGINE}
  ThreadInfo:=@Config.DBSocketThread;
  ThreadInfo.boTerminaled:=True;
  if WaitForSingleObject(ThreadInfo.hThreadHandle,1000) <> 0 then begin
    SuspendThread(ThreadInfo.hThreadHandle);
  end;
{$IFEND}
  FrontEngine.Terminate();
//  FrontEngine.WaitFor;
  FrontEngine.Free;
  MagicManager.Free;
  UserEngine.Free;
  RobotManage.Free;
  //MessageBox(0,PChar(IntToStr(CertCheck.Count)),'aaa',MB_OK);
  RunSocket.Free;

  ConnectTimer.Enabled:=False;
  DBSocket.Close;

  MainLogMsgList.Free;
  LogStringList.Free;
  LogonCostLogList.Free;
  g_MapManager.Free;
  ItemUnit.Free;

  NoticeManager.Free;
  g_GuildManager.Free;
  for I := 0 to g_MakeItemList.Count - 1 do begin
    TStringList(g_MakeItemList.Objects[I]).Free;
  end;
  g_MakeItemList.Free;
  g_StartPoint.Free;
  ServerTableList.Free;
  g_DenySayMsgList.Free;
  MiniMapList.Free;
  g_UnbindList.Free;
  LineNoticeList.Free;
  QuestDiaryList.Free;
  ItemEventList.Free;
  AbuseTextList.Free;
  
  g_MonSayMsgList.Free;
  g_ChatLoggingList.Free;
  g_DisableMakeItemList.Free;
  g_EnableMakeItemList.Free;
  g_DisableSellOffList.Free;
  g_DisableMoveMapList.Free;
  g_ItemNameList.Free;
  g_DisableSendMsgList.Free;
  g_MonDropLimitLIst.Free;
  g_DisableTakeOffList.Free;
  g_UnMasterList.Free;
  g_UnForceMasterList.Free;
  g_GameLogItemNameList.Free;
  g_DenyIPAddrList.Free;
  g_DenyChrNameList.Free;
  g_DenyAccountList.Free;
  g_NoClearMonList.Free;
  for I := 0 to g_ItemBindIPaddr.Count - 1 do begin
    DisPose(pTItemBind(g_ItemBindIPaddr.Items[I]));
  end;
  for I := 0 to g_ItemBindAccount.Count - 1 do begin
    DisPose(pTItemBind(g_ItemBindAccount.Items[I]));
  end;
  for I := 0 to g_ItemBindCharName.Count - 1 do begin
    DisPose(pTItemBind(g_ItemBindCharName.Items[I]));
  end;
  g_ItemBindIPaddr.Free;
  g_ItemBindAccount.Free;
  g_ItemBindCharName.Free;

  DeleteCriticalSection(LogMsgCriticalSection);
  DeleteCriticalSection(ProcessMsgCriticalSection);
  DeleteCriticalSection(ProcessHumanCriticalSection);

  DeleteCriticalSection(Config.UserIDSection);
  DeleteCriticalSection(UserDBSection);


  CS_6.Free;
  for I := 0 to g_DynamicVarList.Count - 1 do begin
    Dispose(pTDynamicVar(g_DynamicVarList.Items[I]));
  end;
  g_DynamicVarList.Free;
  
  boServiceStarted:=False;
  MENU_CONTROL_START.Enabled:=True;
{$IF USECODE = USEREMOTECODE}
  Dispose(g_Config.Encode6BitBuf);
  Dispose(g_Config.Decode6BitBuf);
{$IFEND}
end;

procedure TFrmMain.MENU_CONTROL_STARTClick(Sender: TObject);
begin
  StartService();
end;

procedure TFrmMain.MENU_CONTROL_STOPClick(Sender: TObject);
begin
  StopService();
end;

procedure TFrmMain.MENU_HELP_ABOUTClick(Sender: TObject);
begin
  MemoLog.Lines.Add(g_sProductName);
  MemoLog.Lines.Add(format(g_sVersion,[0]));
  MemoLog.Lines.Add(g_sUpDateTime);
  MemoLog.Lines.Add(g_sProgram);
  MemoLog.Lines.Add(g_sWebSite);
  MemoLog.Lines.Add(g_sBbsSite);
end;

procedure TFrmMain.DBSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  MainOutMessage('DBServer Connected(' + Socket.RemoteAddress + ':' +  IntToStr(Socket.RemotePort) + ')');
end;

procedure TFrmMain.MENU_OPTION_SERVERCONFIGClick(Sender: TObject);
begin
  FrmServerValue:=TFrmServerValue.Create(Owner);
  FrmServerValue.Top:=Self.Top + 20;
  FrmServerValue.Left:=Self.Left;
  FrmServerValue.AdjuestServerConfig();
  FrmServerValue.Free;
end;

procedure TFrmMain.MENU_OPTION_GENERALClick(Sender: TObject);
begin
  frmGeneralConfig:=TfrmGeneralConfig.Create(Owner);
  frmGeneralConfig.Top:=Self.Top + 20;
  frmGeneralConfig.Left:=Self.Left;
  frmGeneralConfig.Open();
  frmGeneralConfig.Free;
  Caption:=g_Config.sServerName;
end;

procedure TFrmMain.MENU_OPTION_GAMEClick(Sender: TObject);
begin
  frmGameConfig:=TfrmGameConfig.Create(Owner);
  frmGameConfig.Top:=Self.Top + 20;
  frmGameConfig.Left:=Self.Left;
  frmGameConfig.Open;
  frmGameConfig.Free;
end;


procedure TFrmMain.MENU_OPTION_FUNCTIONClick(Sender: TObject);
begin
  frmFunctionConfig:=TfrmFunctionConfig.Create(Owner);
  frmFunctionConfig.Top:=Self.Top + 20;
  frmFunctionConfig.Left:=Self.Left;
  frmFunctionConfig.Open;
  frmFunctionConfig.Free;
end;

procedure TFrmMain.G1Click(Sender: TObject);
begin
  frmGameCmd:=TfrmGameCmd.Create(Owner);
  frmGameCmd.Top:=Self.Top + 20;
  frmGameCmd.Left:=Self.Left;
  frmGameCmd.Open;
  frmGameCmd.Free;
end;

procedure TFrmMain.MENU_OPTION_MONSTERClick(Sender: TObject);
begin
  frmMonsterConfig:=TfrmMonsterConfig.Create(Owner);
  frmMonsterConfig.Top:=Self.Top + 20;
  frmMonsterConfig.Left:=Self.Left;
  frmMonsterConfig.Open;
  frmMonsterConfig.Free;
end;
procedure TFrmMain.MENU_CONTROL_RELOAD_MONSTERSAYClick(Sender: TObject);
begin
  UserEngine.ClearMonSayMsg();
  LoadMonSayMsg();
  MainOutMessage('Monster say reloaded...');
end;

procedure TFrmMain.MENU_CONTROL_RELOAD_DISABLEMAKEClick(Sender: TObject);
begin
  LoadDisableTakeOffList();
  LoadDisableMakeItem();
  LoadEnableMakeItem();
  LoadAllowSellOffItem();
  LoadDisableMoveMap();
  ItemUnit.LoadCustomItemName();
  LoadDisableSendMsgList();
  LoadGameLogItemNameList();
  LoadItemBindIPaddr();
  LoadItemBindAccount();
  LoadItemBindCharName();
  LoadUnMasterList();
  LoadUnForceMasterList();
  LoadDenyIPAddrList();
  LoadDenyAccountList();
  LoadDenyChrNameList();
  LoadNoClearMonList();
  FrmDB.LoadAdminList();
  MainOutMessage('Loaded disable lists...');
end;


procedure TFrmMain.MENU_CONTROL_RELOAD_STARTPOINTClick(Sender: TObject);
begin
  FrmDB.LoadStartPoint();
  MainOutMessage('Reloaded startpoints...');
end;

procedure TFrmMain.MENU_CONTROL_GATE_OPENClick(Sender: TObject);
ResourceString
  sGatePortOpen = 'Gate Opened(%s:%d)';
begin
  if not GateSocket.Active then begin
    GateSocket.Active:=True;
    MainOutMessage(format(sGatePortOpen,[GateSocket.Address,GateSocket.Port]));
  end;
end;

procedure TFrmMain.MENU_CONTROL_GATE_CLOSEClick(Sender: TObject);
begin
  CloseGateSocket();
end;
procedure TFrmMain.CloseGateSocket;
var
  I: Integer;
ResourceString
  sGatePortClose = 'Gate Closed(%s:%d)';
begin
  if GateSocket.Active then begin
    for I := 0 to GateSocket.Socket.ActiveConnections - 1 do begin
      GateSocket.Socket.Connections[I].Close;
    end;
    GateSocket.Active:=False;
    MainOutMessage(format(sGatePortClose,[GateSocket.Address,GateSocket.Port]));
  end;
end;

procedure TFrmMain.MENU_CONTROLClick(Sender: TObject);
begin
  if GateSocket.Active then begin
    MENU_CONTROL_GATE_OPEN.Enabled:=False;
    MENU_CONTROL_GATE_CLOSE.Enabled:=True;
  end else begin
    MENU_CONTROL_GATE_OPEN.Enabled:=True;
    MENU_CONTROL_GATE_CLOSE.Enabled:=False;
  end;
end;

procedure UserEngineProcess(Config:pTM2Config;ThreadInfo:pTThreadInfo);
var
  nRunTime  :Integer;
  dwRunTick :LongWord;
begin
  l_dwRunTimeTick:=0;
  dwRunTick:=GetTickCount();
  ThreadInfo.dwRunTick:=dwRunTick;
  while not ThreadInfo.boTerminaled do begin
    nRunTime:=GetTickCount - ThreadInfo.dwRunTick;
    if ThreadInfo.nRunTime < nRunTime then ThreadInfo.nRunTime:=nRunTime;
    if ThreadInfo.nMaxRunTime < nRunTime then ThreadInfo.nMaxRunTime:=nRunTime;
    if GetTickCount - dwRunTick >= 1000 then begin
      dwRunTick:=GetTickCount();
      if ThreadInfo.nRunTime > 0 then Dec(ThreadInfo.nRunTime);
    end;
      
    ThreadInfo.dwRunTick:=GetTickCount();
    ThreadInfo.boActived:=True;
    ThreadInfo.nRunFlag:=125;
    if Config.boThreadRun then
      ProcessGameRun();
    Sleep(1);
  end;
end;
procedure UserEngineThread(ThreadInfo:pTThreadInfo);stdcall;
var
  nErrorCount:Integer;
ResourceString
  sExceptionMsg = '[Exception] UserEngineThread ErrorCount = %d';
begin
  nErrorCount:=0;
  while True do begin
    try
      UserEngineProcess(ThreadInfo.Config,ThreadInfo);
      break;
    except
      Inc(nErrorCount);
      if nErrorCount > 10 then break;
      MainOutMessage(format(sExceptionMsg,[nErrorCount]));
    end;
  end;
  ExitThread(0);
end;
procedure ProcessGameRun();
var
  I:Integer;
begin
      EnterCriticalSection(ProcessHumanCriticalSection);
      try
        UserEngine.PrcocessData;
        g_EventManager.Run;
        RobotManage.Run;
        if GetTickCount - l_dwRunTimeTick > 10000 then begin
          l_dwRunTimeTick:=GetTickCount();
          g_GuildManager.Run;
          //CastleManager.Run;
          //UserCastle.Run;
          g_CastleManager.Run;
          g_DenySayMsgList.Lock;
          try
            for I:=g_DenySayMsgList.Count - 1 downto 0 do begin
              if GetTickCount > LongWord(g_DenySayMsgList.Objects[I]) then begin
                g_DenySayMsgList.Delete(I);
              end;
            end;
          finally
            g_DenySayMsgList.UnLock;
          end;
        end;
      finally
        LeaveCriticalSection(ProcessHumanCriticalSection);
      end;
end;
procedure TFrmMain.MENU_VIEW_GATEClick(Sender: TObject);
begin
  MENU_VIEW_GATE.Checked:= not MENU_VIEW_GATE.Checked;
  GridGate.Visible:=MENU_VIEW_GATE.Checked;
end;

procedure TFrmMain.MENU_VIEW_SESSIONClick(Sender: TObject);
begin
  frmViewSession:=TfrmViewSession.Create(Owner);
  frmViewSession.Top:=Top + 20;
  frmViewSession.Left:=Left;
  frmViewSession.Open();
  frmViewSession.Free;
end;

procedure TFrmMain.MENU_VIEW_ONLINEHUMANClick(Sender: TObject);
begin
  frmViewOnlineHuman:=TfrmViewOnlineHuman.Create(Owner);
  frmViewOnlineHuman.Top:=Top + 20;
  frmViewOnlineHuman.Left:=Left;
  frmViewOnlineHuman.Open();
  frmViewOnlineHuman.Free;
end;

procedure TFrmMain.MENU_VIEW_LEVELClick(Sender: TObject);
begin
  frmViewLevel:=TfrmViewLevel.Create(Owner);
  frmViewLevel.Top:=Top + 20;
  frmViewLevel.Left:=Left;
  frmViewLevel.Open();
  frmViewLevel.Free;
end;

procedure TFrmMain.MENU_VIEW_LISTClick(Sender: TObject);
begin
  frmViewList:=TfrmViewList.Create(Owner);
  frmViewList.Top:=Top + 20;
  frmViewList.Left:=Left;
  frmViewList.Open();
  frmViewList.Free;
end;

procedure TFrmMain.MENU_MANAGE_ONLINEMSGClick(Sender: TObject);
begin
  frmOnlineMsg:=TfrmOnlineMsg.Create(Owner);
  frmOnlineMsg.Top:=Top + 20;
  frmOnlineMsg.Left:=Left;
  frmOnlineMsg.Open();
  frmOnlineMsg.Free;
end;


procedure TFrmMain.SetMenu;
begin
  FrmMain.Menu:=MainMenu;
end;

procedure TFrmMain.MENU_VIEW_KERNELINFOClick(Sender: TObject);
begin
  frmViewKernelInfo:=TfrmViewKernelInfo.Create(Owner);
  frmViewKernelInfo.Top:=Top + 20;
  frmViewKernelInfo.Left:=Left;
  frmViewKernelInfo.Open();
  frmViewKernelInfo.Free;
end;

procedure TFrmMain.MENU_TOOLS_MERCHANTClick(Sender: TObject);
begin
  frmConfigMerchant:=TfrmConfigMerchant.Create(Owner);
  frmConfigMerchant.Top:=Top + 20;
  frmConfigMerchant.Left:=Left;
  frmConfigMerchant.Open();
  frmConfigMerchant.Free;
end;

procedure TFrmMain.MENU_OPTION_ITEMFUNCClick(Sender: TObject);
begin
  frmItemSet:=TfrmItemSet.Create(Owner);
  frmItemSet.Top:=Top + 20;
  frmItemSet.Left:=Left;
  frmItemSet.Open();
  frmItemSet.Free;
end;

procedure TFrmMain.ClearMemoLog;
begin
 if Application.MessageBox('Do you want to clear the log?','M2Server',MB_YESNO + MB_ICONQUESTION) = mrYes then begin
   MemoLog.Clear;
 end;
end;

procedure TFrmMain.MENU_TOOLS_MONGENClick(Sender: TObject);
begin
  frmConfigMonGen:=TfrmConfigMonGen.Create(Owner);
  frmConfigMonGen.Top:=Top + 20;
  frmConfigMonGen.Left:=Left;
  frmConfigMonGen.Open();
  frmConfigMonGen.Free;
end;

procedure TFrmMain.MyMessage(var MsgData: TWmCopyData);
var
  sData:String;
  wIdent:Word;
begin
  wIdent:=HiWord(MsgData.From);
//  ProgramType:=TProgamType(LoWord(MsgData.From));
  sData:=StrPas(MsgData.CopyDataStruct^.lpData);
  case wIdent of    //
    GS_QUIT: begin
      g_boExitServer:=True;
      CloseGateSocket();
      g_Config.boKickAllUser:=True;
      CloseTimer.Enabled:=True;
    end;
    1: ;
    2: ;
    3: ;
  end;    // case
end;



procedure TFrmMain.MENU_TOOLS_IPSEARCHClick(Sender: TObject);
var
  sIPaddr:String;
begin
  sIPaddr:=InputBox('IP所在地区查询','输入IP地址:','192.168.0.1');
  if not IsIPaddr(sIPaddr) then begin
    Application.MessageBox('输入的IP地址格式不正确！！！','错误信息',MB_OK + MB_ICONERROR);
    exit;
  end;
  if not IsIPaddr(sIPaddr) then begin
    Application.MessageBox('输入的IP地址格式不正确！！！','错误信息',MB_OK + MB_ICONERROR);
    exit;
  end;
  MemoLog.Lines.Add(format('%s:%s',[sIPaddr,GetIPLocal(sIPaddr)]));
end;

procedure TFrmMain.MENU_MANAGE_CASTLEClick(Sender: TObject);
begin
  frmCastleManage:=TfrmCastleManage.Create(Owner);
  frmCastleManage.Top:=Top + 20;
  frmCastleManage.Left:=Left;
  frmCastleManage.Open();
  frmCastleManage.Free;
end;



initialization
begin

end;
finalization
begin

end;
end.




