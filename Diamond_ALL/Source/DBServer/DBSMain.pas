unit DBSMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls, JSocket, Buttons, IniFiles,
  Menus,Grobal2;
type
  pTServerInfo =^TServerInfo;
  TServerInfo = record
    nSckHandle :Integer;           //0x00
    sStr       :String;            //0x04
    bo08       :Boolean;           //0x08
    Socket     :TCustomWinSocket;  //0x0C
  end;
  
  pTHumSession = ^THumSession;
  THumSession = record
    sChrName   :String[14];
    nIndex     :Integer;
    Socket     :TCustomWinSocket; //0x20
    bo24       :Boolean;
    bo2C       :Boolean;
    dwTick30   :LongWord;
  end;
  

  TFrmDBSrv=class(TForm)
    ServerSocket: TServerSocket;
    Timer1: TTimer;
    AniTimer: TTimer;
    StartTimer: TTimer;
    Timer2: TTimer;
    MemoLog: TMemo;
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LbAutoClean: TLabel;
    Panel2: TPanel;
    BtnUserDBTool: TSpeedButton;
    LbTransCount: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    LbUserCount: TLabel;
    BtnReloadAddr: TButton;
    BtnEditAddrs: TButton;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    CkViewHackMsg: TCheckBox;
    MainMenu: TMainMenu;
    MENU_CONTROL: TMenuItem;
    V1: TMenuItem;
    MENU_OPTION: TMenuItem;
    MENU_MANAGE: TMenuItem;
    MENU_OPTION_GENERAL: TMenuItem;
    MENU_OPTION_GAMEGATE: TMenuItem;
    MENU_CONTROL_START: TMenuItem;
    MENU_CONTROL_STOP: TMenuItem;
    N1: TMenuItem;
    G1: TMenuItem;
    MENU_MANAGE_DATA: TMenuItem;
    MENU_MANAGE_TOOL: TMenuItem;
    MENU_TEST: TMenuItem;
    MENU_TEST_SELGATE: TMenuItem;
    Exit1: TMenuItem;
    procedure Timer1Timer(Sender : TObject);
    procedure FormCreate(Sender : TObject);
    procedure FormDestroy(Sender : TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure AniTimerTimer(Sender : TObject);
    procedure FormShow(Sender : TObject);
    procedure StartTimerTimer(Sender : TObject);
    procedure Timer2Timer(Sender : TObject);
    procedure BtnUserDBToolClick(Sender : TObject);
    procedure BtnReloadAddrClick(Sender : TObject);
    procedure BtnEditAddrsClick(Sender : TObject);
    procedure CkViewHackMsgClick(Sender : TObject);
    procedure WriteLogMsg(sMsg:String);
    procedure OutMainMessageA(sMsg:String);
    procedure ServerSocketClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocketClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocketClientError(Sender: TObject;
      Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
      var ErrorCode: Integer);
    procedure ServerSocketClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure MENU_MANAGE_DATAClick(Sender: TObject);
    procedure MENU_MANAGE_TOOLClick(Sender: TObject);
    procedure V1Click(Sender: TObject);
    procedure MENU_TEST_SELGATEClick(Sender: TObject);
    procedure MENU_CONTROL_STARTClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
  private
    n334:Integer;
    m_DefMsg:TDefaultMessage;
    n344:integer;
    n348:integer;
    s34C:String;

    ServerList:TList; //0x354
    HumSessionList:TList; //0x358
    m_boRemoteClose:Boolean;
    procedure MainOutMessage(sMsg:String);
    procedure ProcessServerPacket(ServerInfo: pTServerInfo);
    procedure ProcessServerMsg(sMsg: String; nLen: Integer;
      Socket: TCustomWinSocket);
    procedure SendSocket(Socket: TCustomWinSocket; sMsg: String);
    procedure LoadHumanRcd(sMsg: String; Socket: TCustomWinSocket);
    procedure SaveHumanRcd(nRecog: Integer;sMsg: String;
      Socket: TCustomWinSocket);
    procedure SaveHumanRcdEx(sMsg: String; nRecog: Integer;
      Socket: TCustomWinSocket);
    procedure ClearSocket(Socket:TCustomWinSocket);

    { Private declarations }
  public
    function  CopyHumData(sSrcChrName,sDestChrName,sUserID:String):Boolean;
    procedure DelHum(sChrName:String);
    procedure MyMessage(var MsgData:TWmCopyData);message WM_COPYDATA;
    { Public declarations }
  end;

var
  FrmDBSrv: TFrmDBSrv;

implementation

uses HumDB, DBShare, FIDHum, UsrSoc, AddrEdit, HUtil32, EDcode,
  IDSocCli, DBTools, TestSelGate, RouteManage;

{$R *.DFM}

procedure TFrmDBSrv.ServerSocketClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
var
  ServerInfo: pTServerInfo;
  sIPaddr:String;
begin
  sIPaddr:=Socket.RemoteAddress;
  if not CheckServerIP(sIPaddr) then begin
    OutMainMessage('·Ç·¨·þÎñÆ÷Á¬½Ó: ' + sIPaddr);
    Socket.Close;
    exit;
  end;
    
  if not boOpenDBBusy then begin
    New(ServerInfo);
    ServerInfo.bo08:=True;
    ServerInfo.nSckHandle:=Socket.SocketHandle;
    ServerInfo.sStr:='';
    ServerInfo.Socket:=Socket;
    ServerList.Add(ServerInfo);
  end else begin
    Socket.Close;
  end;
end;

procedure TFrmDBSrv.ServerSocketClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
var
  i:Integer;
  ServerInfo: pTServerInfo;
begin
  for i:=0 to ServerList.Count -1 do begin
    ServerInfo:=ServerList.Items[i];
    if ServerInfo.nSckHandle = Socket.SocketHandle then begin
      Dispose(ServerInfo);
      ServerList.Delete(i);
      ClearSocket(Socket);
      break;
    end;
  end;
end;

procedure TFrmDBSrv.ServerSocketClientError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  ErrorCode:=0;
  Socket.Close;
end;

procedure TFrmDBSrv.ServerSocketClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  i:integer;
  ServerInfo: pTServerInfo;
  s10:String;
begin
  g_CheckCode.dwThread0:=1001000;
  for i:=0 to ServerList.Count -1 do begin
    g_CheckCode.dwThread0:=1001001;
    ServerInfo:=ServerList.Items[i];
    g_CheckCode.dwThread0:=1001002;
    if ServerInfo.nSckHandle = Socket.SocketHandle then begin
      g_CheckCode.dwThread0:=1001003;
      s10:=Socket.ReceiveText;
      Inc(n4ADBF4);
      if s10 <> '' then begin
        g_CheckCode.dwThread0:=1001004;
        ServerInfo.sStr:=ServerInfo.sStr + s10;
        g_CheckCode.dwThread0:=1001005;
        if Pos('!',s10) > 0 then begin
          g_CheckCode.dwThread0:=1001006;
          ProcessServerPacket(ServerInfo);
          g_CheckCode.dwThread0:=1001007;
          Inc(n4ADBF8);
          Inc(n348);
          Break;
        end else begin//004A7DC7
          if Length(ServerInfo.sStr) > 81920 then begin
            ServerInfo.sStr:='';
            Inc(n4ADC2C);
          end;
        end;
      end;
      Break;
    end;
  end;
  g_CheckCode.dwThread0:=1001008;
end;
procedure TFrmDBSrv.ProcessServerPacket(ServerInfo:pTServerInfo);
var
  bo25:Boolean;
  sC,s1C,s20,s24:String;
  n14,n18:Integer;
  wE,w10:Word;
  DefMsg:TDefaultMessage;
begin
  g_CheckCode.dwThread0:=1001100;
  if boOpenDBBusy then exit;
  try
    bo25:=False;
    s1C:=ServerInfo.sStr;
    ServerInfo.sStr:='';
    s20:='';
    g_CheckCode.dwThread0:=1001101;
    s1C:=ArrestStringEx(s1C,'#','!',s20);
    g_CheckCode.dwThread0:=1001102;
    if s20 <> '' then begin
      g_CheckCode.dwThread0:=1001103;
      s20:=GetValidStr3(s20,s24,['/']);
      n14:=length(s20);
      if (n14 >= DEFBLOCKSIZE) and (s24 <> '') then begin
        wE:=Str_ToInt(s24,0) xor 170;
        w10:=n14;
        n18:=MakeLong(wE,w10);
        sC:=EncodeBuffer(@n18,SizeOf(Integer));
        s34C:=s24;
        if CompareBackLStr(s20,sC,Length(sC)) then begin
          g_CheckCode.dwThread0:=1001104;
          ProcessServerMsg(s20,n14,ServerInfo.Socket);
          g_CheckCode.dwThread0:=1001105;
          bo25:=True;
        end;
      end; //0x004A7F7B
    end; //0x004A7F7B
    if s1C <> '' then begin
      Inc(n4ADC00);
      Label4.Caption:='Error ' + IntToStr(n4ADC00);
    end; //0x004A7FB5
    if not bo25 then begin
      m_DefMsg:=MakeDefaultMsg(DBR_FAIL,0,0,0,0);
      {
      DefMsg:=MakeDefaultMsg(DBR_FAIL,0,0,0,0);
      n338:=DefMsg.Recog;
      n33C:=DefMsg.Ident;
      n340:=DefMsg.Tag;
      }
      SendSocket(ServerInfo.Socket,EncodeMessage(m_DefMsg));
      Inc(n4ADC00);
      Label4.Caption:='Error ' + IntToStr(n4ADC00);
    end; //0x004A8048
  finally
  end;
  g_CheckCode.dwThread0:=1001106;
end;
procedure TFrmDBSrv.SendSocket(Socket:TCustomWinSocket;sMsg:String);//0x004A8764
var
  n10:Integer;
  s18:String;
begin
  Inc(n4ADBFC);
  n10:=MakeLong(Str_ToInt(s34C,0) xor 170,Length(sMsg) + 6);
  s18:=EncodeBuffer(@n10,SizeOf(Integer));
  Socket.SendText('#' + s34C + '/' + sMsg + s18 + '!')
end;
procedure TFrmDBSrv.ProcessServerMsg(sMsg:String;nLen:Integer;Socket:TCustomWinSocket);//0x004A9278
var
  sDefMsg,sData:String;
  DefMsg:TDefaultMessage;
begin
  if nLen = DEFBLOCKSIZE then begin
    sDefMsg:=sMsg;
    sData:='';
  end else begin
    sDefMsg:=Copy(sMsg,1,DEFBLOCKSIZE);
    sData:=Copy(sMsg,DEFBLOCKSIZE + 1, Length(sMsg)- DEFBLOCKSIZE - 6);
  end; //0x004A9304
  DefMsg:=DecodeMessage(sDefMsg);
  case DefMsg.Ident of
    DB_LOADHUMANRCD: begin
      LoadHumanRcd(sData,Socket);
    end;
    DB_SAVEHUMANRCD: begin
      SaveHumanRcd(DefMsg.Recog,sData,Socket);
    end;
    DB_SAVEHUMANRCDEX: begin
      SaveHumanRcdEx(sData,DefMsg.Recog,Socket);
    end;
    else begin
      m_DefMsg:=MakeDefaultMsg(DBR_FAIL,0,0,0,0);
      SendSocket(Socket,EncodeMessage(m_DefMsg));
      Inc(n4ADC04);
    end;
  end;
  g_CheckCode.dwThread0:=1001216;
end;
procedure TFrmDBSrv.LoadHumanRcd(sMsg:String;Socket:TCustomWinSocket);
var
  sHumName       :String;
  sAccount       :String;
  sIPaddr        :String;
  nIndex         :Integer;
  nSessionID     :Integer;
  nCheckCode     :Integer;
  DefMsg         :TDefaultMessage;
  HumanRCD,HumanRCD2       :THumDataInfo;
  LoadHuman      :TLoadHuman;
  boFoundSession :Boolean;
begin
  DecodeBuffer(sMsg,@LoadHuman,SizeOf(TLoadHuman));
  sAccount:=LoadHuman.sAccount;
  sHumName:=LoadHuman.sChrName;
  sIPaddr:=LoadHuman.sUserAddr;
  nSessionID:=LoadHuman.nSessionID;
  nCheckCode:= -1;
  if (sAccount <> '') and (sHumName <> '') then begin
    if (FrmIDSoc.CheckSessionLoadRcd(sAccount,sIPaddr,nSessionID,boFoundSession)) then begin
      nCheckCode:= 1;
    end else begin
      if boFoundSession then begin
        OutMainMessage('[·Ç·¨ÖØ¸´ÇëÇó] ' + 'ÕÊºÅ: ' + sAccount + ' IP: ' + sIPaddr + ' ±êÊ¶: ' + IntToStr(nSessionID));
      end else begin
        OutMainMessage('[·Ç·¨ÇëÇó] ' + 'ÕÊºÅ: ' + sAccount + ' IP: ' + sIPaddr + ' ±êÊ¶: ' + IntToStr(nSessionID));
      end;
      //nCheckCode:= 1; //²âÊÔÓÃ£¬Õý³£È¥µô
    end;
  end;
  if nCheckCode = 1 then begin
    try
      if HumDataDB.OpenEx then begin
        nIndex:=HumDataDB.Index(sHumName);
        if nIndex >= 0 then begin
          if HumDataDB.Get(nIndex,HumanRCD) < 0 then nCheckCode:= -2;
        end else nCheckCode:= -3;
      end else nCheckCode:= -4;
    finally
      HumDataDB.Close();
    end;
  end;

  if nCheckCode = 1 then begin
    m_DefMsg:=MakeDefaultMsg(DBR_LOADHUMANRCD,1,0,0,1);
    SendSocket(Socket, EncodeMessage(m_DefMsg) + EncodeString(sHumName) + '/' + EncodeBuffer(@HumanRCD,SizeOf(THumDataInfo)));
  end else begin //0x004A8C7E
    m_DefMsg:=MakeDefaultMsg(DBR_LOADHUMANRCD,nCheckCode,0,0,0);
    SendSocket(Socket,EncodeMessage(m_DefMsg));
  end;
end;
//004A8D38
procedure TFrmDBSrv.SaveHumanRcd(nRecog:Integer;sMsg: String;Socket:TCustomWinSocket);
var
  sChrName   :String;
  sUserID    :String;
  sHumanRCD  :String;
  I          :Integer;
  nIndex     :Integer;
  bo21       :Boolean;
  DefMsg     :TDefaultMessage;
  HumanRCD   :THumDataInfo;
  HumSession :pTHumSession;
begin
  sHumanRCD :=GetValidStr3(sMsg,sUserID,['/']);
  sHumanRCD :=GetValidStr3(sHumanRCD,sChrName,['/']);
  sUserID   :=DecodeString(sUserID);
  sChrName  :=DecodeString(sChrName);
  bo21      :=False;
  FillChar(HumanRCD.Data,SizeOf(THumData),#0);
  if Length(sHumanRCD) = GetCodeMsgSize(SizeOf(THumDataInfo)*4/3) then
    DecodeBuffer(sHumanRCD,@HumanRCD,SizeOf(THumDataInfo))
  else bo21:=True;
  if not bo21 then begin
    bo21:=True;
    try
      if HumDataDB.Open then begin
        nIndex:=HumDataDB.Index(sChrName);
        if nIndex < 0 then begin
          HumanRCD.Header.sName:=sChrName;
          HumDataDB.Add(HumanRCD);
          nIndex:=HumDataDB.Index(sChrName);
        end;
        if nIndex >= 0 then begin
          HumanRCD.Header.sName:=sChrName;
          HumDataDB.Update(nIndex,HumanRCD);
          bo21:=False;
        end;
      end;
    finally
      HumDataDB.Close;
    end;
    FrmIDSoc.SetSessionSaveRcd(sUserID);
  end;
  if not bo21 then begin
    for i := 0 to HumSessionList.Count - 1 do begin
      HumSession:=HumSessionList.Items[i];
      if (HumSession.sChrName = sChrName) and (HumSession.nIndex = nRecog) then begin
        HumSession.dwTick30:=GetTickCount();
        break;
      end;
    end;
    m_DefMsg:=MakeDefaultMsg(DBR_SAVEHUMANRCD,1,0,0,0);
    SendSocket(Socket,EncodeMessage(m_DefMsg));
  end else begin
    m_DefMsg:=MakeDefaultMsg(DBR_LOADHUMANRCD,0,0,0,0);
    SendSocket(Socket,EncodeMessage(m_DefMsg));
  end;
end;
//004A9104
procedure TFrmDBSrv.SaveHumanRcdEx(sMsg:String;nRecog:Integer;Socket:TCustomWinSocket);
var
  sChrName     :String;
  sUserID      :String;
  sHumanRCD    :String;
  I            :Integer;
  bo21         :Boolean;
  DefMsg       :TDefaultMessage;
  HumanRCD     :THumDataInfo;
  HumSession   :pTHumSession;
begin
  sHumanRCD:=GetValidStr3(sMsg,sUserID,['/']);
  sHumanRCD:=GetValidStr3(sHumanRCD,sChrName,['/']);
  sUserID:=DecodeString(sUserID);
  sChrName:=DecodeString(sChrName);
  for i := 0 to HumSessionList.Count - 1 do begin
    HumSession:=HumSessionList.Items[i];
    if (HumSession.sChrName = sChrName) and (HumSession.nIndex = nRecog) then begin
      HumSession.bo24:=False;
      HumSession.Socket:=Socket;
      HumSession.bo2C:=True;
      HumSession.dwTick30:=GetTickCount();
      break;
    end;
  end;
  SaveHumanRcd(nRecog,sMsg,Socket);
end;
procedure TFrmDBSrv.Timer1Timer(Sender : TObject);
begin
  LbTransCount.Caption:=IntToStr(n348);
  n348:=0;
  if ServerList.Count > 0 then
    Label1.Caption:='Ready...'
  else Label1.Caption:='Not Ready !!';
  Label2.Caption:='ServerCount: ' + IntToStr(ServerList.Count);
  LbUserCount.Caption:=IntToStr(FrmUserSoc.GetUserCount);
  if boOpenDBBusy then begin
    if n4ADB18 > 0 then begin
      if not bo4ADB1C then begin
        Label4.Caption:='[1/4] ' + IntToStr(ROUND((n4ADB10/n4ADB18) * 1.0e2)) + '% ' +
                        IntToStr(n4ADB14) + '/' +
                        IntToStr(n4ADB18);
      end;//004A82CA
    end;//004A82CA
    if n4ADB04 > 0 then begin
      if not boHumDBReady then begin
        Label4.Caption:='[3/4] ' + IntToStr(ROUND((n4ADAFC/n4ADB04) * 1.0e2)) + '% ' +
                        IntToStr(n4ADB00) + '/' +
                        IntToStr(n4ADB04);
      end;//004A835B
    end;//004A835B
    if n4ADAF0 > 0 then begin
      if not boDataDBReady then begin
        Label4.Caption:='[4/4] ' + IntToStr(ROUND((n4ADAE4/n4ADAF0) * 1.0e2)) + '% ' +
                        IntToStr(n4ADAE8) + '/' +
                        IntToStr(n4ADAEC) + '/' +
                        IntToStr(n4ADAF0);
      end;
    end;
  end;//004A8407

  LbAutoClean.Caption:=IntToStr(g_nClearIndex) + '/(' + IntToStr(g_nClearCount) + '/' + IntToStr(g_nClearItemIndexCount) + ')/' + IntToStr(g_nClearRecordCount);

  Label8.Caption:='H-QyChr=' + IntToStr(g_nQueryChrCount);
  Label9.Caption:='H-NwChr=' + IntToStr(nHackerNewChrCount);
  Label10.Caption:='H-DlChr=' + IntToStr(nHackerDelChrCount);
  Label11.Caption:='Dubb-Sl=' + IntToStr(nHackerSelChrCount);
  if MemoLog.Lines.Count > 500 then MemoLog.Lines.Clear;
end;

procedure TFrmDBSrv.FormCreate(Sender : TObject);
var
  Conf:TIniFile;
  nX,nY:Integer;
begin
  g_dwGameCenterHandle:=Str_ToInt(ParamStr(1),0);
  nX:=Str_ToInt(ParamStr(2),-1);
  nY:=Str_ToInt(ParamStr(3),-1);
  if (nX >= 0) or (nY >= 0) then begin
    Left:=nX;
    Top:=nY;
  end;

  m_boRemoteClose:=False;

 // SendGameCenterMsg(SG_FORMHANDLE,IntToStr(Self.Handle));

  boOpenDBBusy:=True;
  label4.Caption:='';
  LbAutoClean.Caption:='-/-';
  HumChrDB:=nil;
  HumDataDB:=nil;
  {
  Conf:=TIniFile.Create('sConfFileName');
  if Conf <> nil then begin
    sDataDBFilePath:=Conf.ReadString('DB','Dir',sDataDBFilePath);
    sHumDBFilePath:=Conf.ReadString('DB','HumDir',sHumDBFilePath);
    sFeedPath:=Conf.ReadString('DB','FeeDir',sFeedPath);
    sBackupPath:=Conf.ReadString('DB','Backup',sBackupPath);
    sConnectPath:=Conf.ReadString('DB','ConnectDir',sConnectPath);
    sLogPath:=Conf.ReadString('DB','LogDir',sLogPath);
    nServerPort:=Conf.ReadInteger('Setup','ServerPort',nServerPort);
    sServerAddr:=Conf.ReadString('Setup','ServerAddr',sServerAddr);
    boViewHackMsg:=Conf.ReadBool('Setup','ViewHackMsg',boViewHackMsg);
    sServerName:=Conf.ReadString('Setup','ServerName',sServerName);
    Conf.Free;
  end;
  }
  LoadConfig();
  ServerList:=TList.Create;
  HumSessionList:=TList.Create;
  Label5.Caption:='FDB: ' + sDataDBFilePath + 'Mir.DB  ' + 'Backup: ' + sBackupPath;
  n334:=0;
  ServerSocket.Address:=sServerAddr;
  ServerSocket.Port:=nServerPort;
  ServerSocket.Active:=True;
  n4ADBF4:=0;
  n4ADBF8:=0;
  n4ADBFC:=0;
  n4ADC00:=0;
  n4ADC04:=0;
  n344:=2;
  n348:=0;
  nHackerNewChrCount:=0;
  nHackerDelChrCount:=0;
  nHackerSelChrCount:=0;
  n4ADC1C:=0;
  n4ADC20:=0;
  n4ADC24:=0;
  n4ADC28:=0;
end;

procedure TFrmDBSrv.FormDestroy(Sender : TObject);
var
  i:Integer;
  ServerInfo: pTServerInfo;
  HumSession:pTHumSession;
begin
  if HumDataDB <> nil then HumDataDB.Free;
  if HumChrDB <> nil then HumChrDB.Free;
  for i:=0 to ServerList.Count -1 do begin
    ServerInfo:=ServerList.Items[i];
    Dispose(ServerInfo);
  end;
  ServerList.Free;

  for i:=0 to HumSessionList.Count -1 do begin
    HumSession:=HumSessionList.Items[i];
    Dispose(HumSession);
  end;

  HumSessionList.Free;
end;

procedure TFrmDBSrv.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if m_boRemoteClose then exit;
    
//  if MessageDlg('ÊÇ·ñÈ·¶¨ÍË³öÊý¾Ý¿â·þÎñÆ÷£¿', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
  if Application.MessageBox('Do you want to quit DBServer?','Confirm',MB_YESNO + MB_ICONQUESTION) = mrYes then begin
    CanClose:=True;
    ServerSocket.Active:=False;
    MainOutMessage('Server Closing...');
  end else begin
    CanClose:=False;
  end;
end;

procedure TFrmDBSrv.AniTimerTimer(Sender : TObject);
begin
  if n334 > 7 then
    n334:=0
  else
   Inc(n334);

  case n334 of
    0: Label3.Caption:='|';
    1: Label3.Caption:='/';
    2: Label3.Caption:='--';
    3: Label3.Caption:='\';
    4: Label3.Caption:='|';
    5: Label3.Caption:='/';
    6: Label3.Caption:='--';
    7: Label3.Caption:='\';
  end;
end;

procedure TFrmDBSrv.FormShow(Sender : TObject);
begin
  StartTimer.Enabled:=True;
end;

procedure TFrmDBSrv.StartTimerTimer(Sender : TObject);
//0x004A79DC
begin
  SendGameCenterMsg(SG_STARTNOW,'ÕýÔÚÆô¶¯Êý¾Ý¿â·þÎñÆ÷...');
  StartTimer.Enabled:=False;
  boOpenDBBusy:=True;
  HumChrDB:=TFileHumDB.Create(sHumDBFilePath + 'Hum.DB');
  HumDataDB:=TFileDB.Create(sDataDBFilePath + 'Mir.DB');
  boOpenDBBusy:=False;
  boAutoClearDB:=True;
  Label4.Caption:='';
  FrmIDSoc.OpenConnect();
  OutMainMessage('Server Started...');
  SendGameCenterMsg(SG_STARTOK,'Êý¾Ý¿â·þÎñÆ÷Æô¶¯Íê³É...');
  SendGameCenterMsg(SG_CHECKCODEADDR,IntToStr(Integer(@g_CheckCode)));
end;

procedure TFrmDBSrv.Timer2Timer(Sender : TObject);
var
  i:Integer;
  HumSession:pTHumSession;
begin
  i:=0;

  while (True) do begin
    if HumSessionList.Count <= i then break;
    HumSession:= HumSessionList.Items[i];
    if not HumSession.bo24 then begin
      if HumSession.bo2C then begin
        if (GetTickCount - HumSession.dwTick30) > 20 * 1000 then begin
          Dispose(HumSession);
          HumSessionList.Delete(i);
          Continue;
        end;
      end else begin//004A868F
        if (GetTickCount - HumSession.dwTick30) > 2 * 60 * 1000 then begin
          Dispose(HumSession);
          HumSessionList.Delete(i);
          Continue;
        end;
      end;
    end;//004A86D2
    if (GetTickCount - HumSession.dwTick30) > 40 * 60 * 1000 then begin
      Dispose(HumSession);
      HumSessionList.Delete(i);
      Continue;
    end;
    Inc(i);
  end;

end;

procedure TFrmDBSrv.BtnUserDBToolClick(Sender : TObject);
begin
  if boHumDBReady and boDataDBReady then
    FrmIDHum.Show;
end;

procedure TFrmDBSrv.BtnReloadAddrClick(Sender : TObject);
begin
  FrmUserSoc.LoadServerInfo();
  LoadIPTable();
  LoadGateID();
end;

procedure TFrmDBSrv.BtnEditAddrsClick(Sender : TObject);
begin
  FrmEditAddr.Open();
end;

procedure TFrmDBSrv.CkViewHackMsgClick(Sender : TObject);
var
  Conf:TIniFile;
begin
  Conf:=TIniFile.Create(sConfFileName);
  if Conf <> nil then begin
    Conf.WriteBool('Setup','ViewHackMsg',CkViewHackMsg.Checked);
    Conf.Free;
  end;
end;

procedure TFrmDBSrv.WriteLogMsg(sMsg:String);
begin
(*
004A7321   8BEC                   mov     ebp, esp
004A7323   81C404FDFFFF           add     esp, $FFFFFD04
004A7329   53                     push    ebx
004A732A   56                     push    esi
004A732B   57                     push    edi
004A732C   33D2                   xor     edx, edx
004A732E   899508FDFFFF           mov     [ebp+$FFFFFD08], edx
004A7334   899504FDFFFF           mov     [ebp+$FFFFFD04], edx
004A733A   899510FDFFFF           mov     [ebp+$FFFFFD10], edx
004A7340   89950CFDFFFF           mov     [ebp+$FFFFFD0C], edx
004A7346   8955E8                 mov     [ebp-$18], edx
004A7349   8955E4                 mov     [ebp-$1C], edx
004A734C   8945FC                 mov     [ebp-$04], eax

* Reference to FrmDBSrv
|
004A734F   8B45FC                 mov     eax, [ebp-$04]

* Reference to: system.@LStrAddRef;
|
004A7352   E8DDCCF5FF             call    00404034
004A7357   33C0                   xor     eax, eax
004A7359   55                     push    ebp

* Possible String Reference to: 'éËÀõÿëÓ_^[‹å]Ã'
|
004A735A   6844754A00             push    $004A7544

***** TRY
|
004A735F   64FF30                 push    dword ptr fs:[eax]
004A7362   648920                 mov     fs:[eax], esp
004A7365   837DFC00               cmp     dword ptr [ebp-$04], +$00
004A7369   0F84A2010000           jz      004A7511
004A736F   33C0                   xor     eax, eax
004A7371   55                     push    ebp
004A7372   6807754A00             push    $004A7507

***** TRY
|
004A7377   64FF30                 push    dword ptr fs:[eax]
004A737A   648920                 mov     fs:[eax], esp

* Reference to: Unit_00407FB4.Proc_0040A530
|
004A737D   E8AE31F6FF             call    0040A530
004A7382   83C4F8                 add     esp, -$08
004A7385   DD1C24                 fstp    qword ptr [esp]
004A7388   9B                     wait
004A7389   8D4DF6                 lea     ecx, [ebp-$0A]
004A738C   8D55F8                 lea     edx, [ebp-$08]
004A738F   8D45FA                 lea     eax, [ebp-$06]

* Reference to: Unit_00407FB4.Proc_0040A4E8
|
004A7392   E85131F6FF             call    0040A4E8

* Reference to: Unit_00407FB4.Proc_0040A55C
|
004A7397   E8C031F6FF             call    0040A55C
004A739C   83C4F8                 add     esp, -$08
004A739F   DD1C24                 fstp    qword ptr [esp]
004A73A2   9B                     wait
004A73A3   8D45EE                 lea     eax, [ebp-$12]
004A73A6   50                     push    eax
004A73A7   8D4DF0                 lea     ecx, [ebp-$10]
004A73AA   8D55F2                 lea     edx, [ebp-$0E]
004A73AD   8D45F4                 lea     eax, [ebp-$0C]

* Reference to: Unit_00407FB4.Proc_0040A1D0
|
004A73B0   E81B2EF6FF             call    0040A1D0
004A73B5   FF3520BE4A00           push    dword ptr [$004ABE20]
004A73BB   8D9510FDFFFF           lea     edx, [ebp+$FFFFFD10]
004A73C1   0FB745FA               movzx   eax, word ptr [ebp-$06]

* Reference to: Unit_00407FB4.Proc_004090F0
|
004A73C5   E8261DF6FF             call    004090F0
004A73CA   FFB510FDFFFF           push    dword ptr [ebp+$FFFFFD10]
004A73D0   685C754A00             push    $004A755C
004A73D5   55                     push    ebp
004A73D6   8D950CFDFFFF           lea     edx, [ebp+$FFFFFD0C]
004A73DC   0FB745F8               movzx   eax, word ptr [ebp-$08]

* Reference to: DBSMain.Proc_004A72A4
|
004A73E0   E8BFFEFFFF             call    004A72A4
004A73E5   59                     pop     ecx
004A73E6   FFB50CFDFFFF           push    dword ptr [ebp+$FFFFFD0C]
004A73EC   8D45E8                 lea     eax, [ebp-$18]
004A73EF   BA04000000             mov     edx, $00000004

* Reference to: system.@LStrCatN;
|
004A73F4   E847CBF5FF             call    00403F40
004A73F9   A120BE4A00             mov     eax, dword ptr [$004ABE20]

* Reference to: Buttons.Proc_0048A028
|
004A73FE   E8252CFEFF             call    0048A028
004A7403   84C0                   test    al, al
004A7405   751F                   jnz     004A7426
004A7407   8D85E4FEFFFF           lea     eax, [ebp+$FFFFFEE4]
004A740D   8B1520BE4A00           mov     edx, [$004ABE20]

* Reference to: Unit_00407FB4.Proc_00409624
|
004A7413   E80C22F6FF             call    00409624
004A7418   6A00                   push    $00
004A741A   8D85E4FEFFFF           lea     eax, [ebp+$FFFFFEE4]
004A7420   50                     push    eax

* Reference to: kernel32.CreateDirectoryA()
|
004A7421   E8F2FBF5FF             call    00407018
004A7426   8B45E8                 mov     eax, [ebp-$18]

* Reference to: Buttons.Proc_0048A028
|
004A7429   E8FA2BFEFF             call    0048A028
004A742E   84C0                   test    al, al
004A7430   751C                   jnz     004A744E
004A7432   8D85E4FEFFFF           lea     eax, [ebp+$FFFFFEE4]
004A7438   8B55E8                 mov     edx, [ebp-$18]

* Reference to: Unit_00407FB4.Proc_00409624
|
004A743B   E8E421F6FF             call    00409624
004A7440   6A00                   push    $00
004A7442   8D85E4FEFFFF           lea     eax, [ebp+$FFFFFEE4]
004A7448   50                     push    eax

* Reference to: kernel32.CreateDirectoryA()
|
004A7449   E8CAFBF5FF             call    00407018
004A744E   FF75E8                 push    dword ptr [ebp-$18]
004A7451   6868754A00             push    $004A7568
004A7456   8D9508FDFFFF           lea     edx, [ebp+$FFFFFD08]
004A745C   0FB745F8               movzx   eax, word ptr [ebp-$08]

* Reference to: Unit_00407FB4.Proc_004090F0
|
004A7460   E88B1CF6FF             call    004090F0
004A7465   FFB508FDFFFF           push    dword ptr [ebp+$FFFFFD08]
004A746B   685C754A00             push    $004A755C
004A7470   55                     push    ebp
004A7471   8D9504FDFFFF           lea     edx, [ebp+$FFFFFD04]
004A7477   0FB745F6               movzx   eax, word ptr [ebp-$0A]

* Reference to: DBSMain.Proc_004A72A4
|
004A747B   E824FEFFFF             call    004A72A4
004A7480   59                     pop     ecx
004A7481   FFB504FDFFFF           push    dword ptr [ebp+$FFFFFD04]

* Possible String Reference to: '.txt'
|
004A7487   6874754A00             push    $004A7574
004A748C   8D45E4                 lea     eax, [ebp-$1C]
004A748F   BA06000000             mov     edx, $00000006

* Reference to: system.@LStrCatN;
|
004A7494   E8A7CAF5FF             call    00403F40
004A7499   8B55E4                 mov     edx, [ebp-$1C]
004A749C   8D8518FDFFFF           lea     eax, [ebp+$FFFFFD18]

* Reference to: system.@Assign(Text;Text;ShortString);
|
004A74A2   E863F0F5FF             call    0040650A
004A74A7   8B45E4                 mov     eax, [ebp-$1C]

* Reference to: Unit_00407FB4.Proc_004092E0
|
004A74AA   E8311EF6FF             call    004092E0
004A74AF   84C0                   test    al, al
004A74B1   7512                   jnz     004A74C5
004A74B3   8D8518FDFFFF           lea     eax, [ebp+$FFFFFD18]

* Reference to: System.Proc_0040662A
|
004A74B9   E86CF1F5FF             call    0040662A

* Reference to: System.Proc_00402868
|
004A74BE   E8A5B3F5FF             call    00402868
004A74C3   EB10                   jmp     004A74D5
004A74C5   8D8518FDFFFF           lea     eax, [ebp+$FFFFFD18]

* Reference to: System.Proc_00406631
|
004A74CB   E861F1F5FF             call    00406631

* Reference to: System.Proc_00402868
|
004A74D0   E893B3F5FF             call    00402868

* Reference to FrmDBSrv
|
004A74D5   8B55FC                 mov     edx, [ebp-$04]
004A74D8   8D8518FDFFFF           lea     eax, [ebp+$FFFFFD18]

* Reference to: system.@Write0Bool;
|           or: system.@Write0Long;
|           or: system.@Write0LString;
|
004A74DE   E835CDF5FF             call    00404218

* Reference to: System.Proc_00406703
|
004A74E3   E81BF2F5FF             call    00406703

* Reference to: System.Proc_00402868
|
004A74E8   E87BB3F5FF             call    00402868
004A74ED   8D8518FDFFFF           lea     eax, [ebp+$FFFFFD18]

* Reference to: system.@Close;
|
004A74F3   E8B4F0F5FF             call    004065AC

* Reference to: System.Proc_00402868
|
004A74F8   E86BB3F5FF             call    00402868
004A74FD   33C0                   xor     eax, eax
004A74FF   5A                     pop     edx
004A7500   59                     pop     ecx
004A7501   59                     pop     ecx
004A7502   648910                 mov     fs:[eax], edx
004A7505   EB0A                   jmp     004A7511

* Reference to: system.@HandleAnyException;
|
004A7507   E954BEF5FF             jmp     00403360

* Reference to: system.@DoneExcept;
|
004A750C   E8ABC1F5FF             call    004036BC

****** END
|
004A7511   33C0                   xor     eax, eax
004A7513   5A                     pop     edx
004A7514   59                     pop     ecx
004A7515   59                     pop     ecx
004A7516   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: '_^[‹å]Ã'
|
004A7519   684B754A00             push    $004A754B
004A751E   8D8504FDFFFF           lea     eax, [ebp+$FFFFFD04]
004A7524   BA04000000             mov     edx, $00000004

* Reference to: system.@LStrArrayClr;
|
004A7529   E8F6C6F5FF             call    00403C24
004A752E   8D45E4                 lea     eax, [ebp-$1C]
004A7531   BA02000000             mov     edx, $00000002

* Reference to: system.@LStrArrayClr;
|
004A7536   E8E9C6F5FF             call    00403C24
004A753B   8D45FC                 lea     eax, [ebp-$04]

* Reference to: system.@LStrClr(String;String);
|
004A753E   E8BDC6F5FF             call    00403C00
004A7543   C3                     ret


* Reference to: system.@HandleFinally;
|
004A7544   E9CBC0F5FF             jmp     00403614
004A7549   EBD3                   jmp     004A751E

****** END
|
004A754B   5F                     pop     edi
004A754C   5E                     pop     esi
004A754D   5B                     pop     ebx
004A754E   8BE5                   mov     esp, ebp
004A7550   5D                     pop     ebp
004A7551   C3                     ret

*)
end;

procedure TFrmDBSrv.OutMainMessageA(sMsg:String);
begin
(*
004A757D   8BEC                   mov     ebp, esp
004A757F   51                     push    ecx
004A7580   8945FC                 mov     [ebp-$04], eax

* Reference to FrmDBSrv
|
004A7583   8B45FC                 mov     eax, [ebp-$04]

* Reference to: system.@LStrAddRef;
|
004A7586   E8A9CAF5FF             call    00404034
004A758B   33C0                   xor     eax, eax
004A758D   55                     push    ebp
004A758E   68D0754A00             push    $004A75D0

***** TRY
|
004A7593   64FF30                 push    dword ptr fs:[eax]
004A7596   648920                 mov     fs:[eax], esp

* Reference to FrmDBSrv
|
004A7599   8B45FC                 mov     eax, [ebp-$04]

* Reference to: DBSMain.Proc_004A7320
|
004A759C   E87FFDFFFF             call    004A7320

* Reference to FrmDBSrv
|
004A75A1   A1D0DB4A00             mov     eax, dword ptr [$004ADBD0]

* Reference to control EdChrName : N.A.
|
004A75A6   8B80E4020000           mov     eax, [eax+$02E4]

* Reference to field N.A..OFFS_0208
|
004A75AC   8B8008020000           mov     eax, [eax+$0208]

* Reference to FrmDBSrv
|
004A75B2   8B55FC                 mov     edx, [ebp-$04]
004A75B5   8B08                   mov     ecx, [eax]
004A75B7   FF5134                 call    dword ptr [ecx+$34]
004A75BA   33C0                   xor     eax, eax
004A75BC   5A                     pop     edx
004A75BD   59                     pop     ecx
004A75BE   59                     pop     ecx
004A75BF   648910                 mov     fs:[eax], edx

****** FINALLY
|
004A75C2   68D7754A00             push    $004A75D7
004A75C7   8D45FC                 lea     eax, [ebp-$04]

* Reference to: system.@LStrClr(String;String);
|
004A75CA   E831C6F5FF             call    00403C00
004A75CF   C3                     ret


* Reference to: system.@HandleFinally;
|
004A75D0   E93FC0F5FF             jmp     00403614
004A75D5   EBF0                   jmp     004A75C7

****** END
|
004A75D7   59                     pop     ecx
004A75D8   5D                     pop     ebp
004A75D9   C3                     ret

*)
end;






procedure TFrmDBSrv.MainOutMessage(sMsg: String);
begin
  MemoLog.Lines.Add(sMsg)
end;
//004A80DC
procedure TFrmDBSrv.ClearSocket(Socket: TCustomWinSocket);

var
  nIndex:integer;
  HumSession:pTHumSession;
begin
  nIndex:=0;

  while (True) do begin
    if HumSessionList.Count <= nIndex then break;
    HumSession:=HumSessionList.Items[nIndex];
    if HumSession.Socket = Socket then begin
      Dispose(HumSession);
      HumSessionList.Delete(nIndex);
      Continue;
    end;
    Inc(nIndex);
  end;

end;

function TFrmDBSrv.CopyHumData(sSrcChrName, sDestChrName,
  sUserID: String): Boolean;//0x004A8864
var
  n14      :Integer;
  bo15     :Boolean;
  HumanRCD :THumDataInfo;
begin
  Result:=False;
  bo15:=False;
  try
    if HumDataDB.Open then begin
      n14:=HumDataDB.Index(sSrcChrName);
      if (n14 >= 0) and (HumDataDB.Get(n14,HumanRCD) >= 0) then bo15:=True;
      if bo15 then begin
        n14:=HumDataDB.Index(sDestChrName);
        if (n14 >= 0) then begin
          HumanRCD.Header.sName  := sDestChrName;
          HumanRCD.Data.sChrName := sDestChrName;
          HumanRCD.Data.sAccount := sUserID;
          HumDataDB.Update(n14,HumanRCD);
          Result:=True;
        end;
      end;
    end;
  finally
    HumDataDB.Close;
  end;
end;

procedure TFrmDBSrv.DelHum(sChrName: String);
//0x004A89F4
begin
  try
    if HumChrDB.Open then HumChrDB.Delete(sChrName);
  finally
    HumChrDB.Close;
  end;
end;



procedure TFrmDBSrv.MENU_MANAGE_DATAClick(Sender: TObject);
begin
  if boHumDBReady and boDataDBReady then
    FrmIDHum.Show;
end;

procedure TFrmDBSrv.MENU_MANAGE_TOOLClick(Sender: TObject);
begin
  frmDBTool.Top:=Self.Top + 20;
  frmDBTool.Left:=Self.Left;
  frmDBTool.Open();
end;

procedure TFrmDBSrv.MyMessage(var MsgData: TWmCopyData);
var
  sData:String;
  ProgramType:TProgamType;
  wIdent:Word;
begin
  wIdent:=HiWord(MsgData.From);
//  ProgramType:=TProgamType(LoWord(MsgData.From));
  sData:=StrPas(MsgData.CopyDataStruct^.lpData);
  case wIdent of    //
    GS_QUIT: begin
      ServerSocket.Active:=False;
      m_boRemoteClose:=True;
      Close();
    end;
    1: ;
    2: ;
    3: ;
  end;    // case
end;

procedure TFrmDBSrv.V1Click(Sender: TObject);
begin
//showmessage(BoolToStr(CheckChrName('½­ºþÀË¿Í')));
end;

procedure TFrmDBSrv.MENU_TEST_SELGATEClick(Sender: TObject);
begin
  frmTestSelGate:=TfrmTestSelGate.Create(Owner);
  frmTestSelGate.ShowModal;
  frmTestSelGate.Free;
end;

procedure TFrmDBSrv.MENU_CONTROL_STARTClick(Sender: TObject);
begin
  if Sender = MENU_CONTROL_START then begin

  end else
  if Sender = MENU_OPTION_GAMEGATE then begin
    frmRouteManage.Open;
  end;

end;

procedure TFrmDBSrv.Exit1Click(Sender: TObject);
begin
  Close;
end;

end.
