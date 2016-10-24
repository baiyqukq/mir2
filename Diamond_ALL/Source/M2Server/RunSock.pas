unit RunSock;

interface
uses
  Windows, Classes, SysUtils, StrUtils, SyncObjs, JSocket, ObjBase, Grobal2,SDK, FrnEngn,UsrEngn;
type

  TRunSocket = class //Size: 0xCD0
    m_RunSocketSection   :TRTLCriticalSection;
    m_RunAddrList        :TStringList;  //0x4
    n8                 :Integer;//0x8
    m_IPaddrArr        :array[0..19] of TIPaddr;
    n4F8               :Integer;  //0x4F8
    dwSendTestMsgTick  :LongWord; //0x4FC
  private
    procedure LoadRunAddr;
    procedure ExecGateBuffers(nGateIndex:Integer;Gate:pTGateInfo;Buffer:PChar;nMsgLen:Integer);
    procedure DoClientCertification(GateIdx:Integer;GateUser:pTGateUserInfo;nSocket:Integer;sMsg:String);
    procedure ExecGateMsg(GateIdx:Integer;Gate:pTGateInfo;MsgHeader:pTMsgHeader;MsgBuff:PChar;nMsgLen:Integer);
    procedure SendCheck(Socket: TCustomWinSocket;nIdent:Integer);
    function  OpenNewUser(nSocket:Integer;nGSocketIdx:Integer;sIPaddr:String; UserList:TList): Integer;
    procedure SendNewUserMsg(Socket:TCustomWinSocket;nSocket:Integer;nSocketIndex,nUserIdex:Integer);
    procedure SendGateTestMsg(nIndex:Integer);
    function  SendGateBuffers(GateIdx:Integer;Gate:pTGateInfo;MsgList:TList):Boolean;
    function  GetGateAddr(sIPaddr:String):String;
    procedure SendScanMsg(DefMsg:pTDefaultMessage;sMsg:String;nGateIdx,nSocket,nGsIdx:integer);
  public
    constructor Create();
    destructor  Destroy; override;
    procedure AddGate(Socket:TCustomWinSocket);
    procedure SocketRead(Socket:TCustomWinSocket);
    procedure CloseGate(Socket:TCustomWinSocket);
    procedure CloseErrGate(Socket:TCustomWinSocket;var ErrorCode:Integer);
    procedure CloseAllGate();
    procedure Run();
    procedure CloseUser(GateIdx,nSocket:Integer);
    function  AddGateBuffer(GateIdx:Integer;Buffer:PChar):Boolean;
    procedure SendOutConnectMsg(nGateIdx,nSocket,nGsIdx:integer);
    procedure SetGateUserList(nGateIdx,nSocket:Integer;PlayObject:TPlayObject);
    procedure KickUser(sAccount:String;nSessionID:Integer);
  end;
var
  g_GateArr           :array [0..19] of TGateInfo;
  g_nGateRecvMsgLenMin:Integer;
  g_nGateRecvMsgLenMax:Integer;
implementation

uses M2Share, IdSrvClient, HUtil32, EDcode, EncryptUnit;
var
  nRunSocketRun  :Integer = -1;
{ TRunSocket }

procedure TRunSocket.AddGate(Socket: TCustomWinSocket);
var
  i:Integer;
  sIPaddr:String;
  Gate:pTGateInfo;
ResourceString
  sGateOpen = 'Gate[%d](%s:%d) Opened...';
  sKickGate = '服务器未就绪: %s';
begin
  sIPaddr:=Socket.RemoteAddress;
  if boStartReady then begin
    for i:=Low(g_GateArr) to High(g_GateArr) do begin
      Gate:=@g_GateArr[i];
      if Gate.boUsed then Continue;
      Gate.boUsed          := True;
      Gate.Socket          := Socket;
      Gate.sAddr           := GetGateAddr(sIPaddr);
      Gate.nPort           := Socket.RemotePort;
      Gate.n520            := 1;
      Gate.UserList        := TList.Create;
      Gate.nUserCount      := 0;
      Gate.Buffer          := nil;
      Gate.nBuffLen        := 0;
      Gate.BufferList      := TList.Create;
      Gate.boSendKeepAlive := False;
      Gate.nSendChecked    := 0;
      Gate.nSendBlockCount := 0;
      Gate.dwStartTime     := GetTickCount;
      MainOutMessage(format(sGateOpen,[I,Socket.RemoteAddress,Socket.RemotePort]));
      break;
    end;
  end else begin
    MainOutMessage(format(sKickGate,[sIPaddr]));
    Socket.Close;
  end;
end;

procedure TRunSocket.CloseAllGate;//004E0068
var
  GateIdx:integer;
  Gate:pTGateInfo;
begin
  for GateIdx:= Low(g_GateArr) to High(g_GateArr) do begin
    Gate:=@g_GateArr[GateIdx];
    if Gate.Socket <> nil then begin
      Gate.Socket.Close;
    end;
  end;
end;

procedure TRunSocket.CloseErrGate(Socket: TCustomWinSocket;
  var ErrorCode: Integer);//004DFF58 
begin
  if Socket.Connected then Socket.Close;
  ErrorCode:=0;
end;


procedure TRunSocket.CloseGate(Socket: TCustomWinSocket);//004E00B4
var
  I,GateIdx:Integer;
  GateUser:pTGateUserInfo;
  UserList:TList;
  Gate:pTGateInfo;
ResourceString
  sGateClose = 'Gate[%d](%s:%d) Closed...';
begin
  EnterCriticalSection(m_RunSocketSection);
  try
    for GateIdx:= Low(g_GateArr) to High(g_GateArr) do begin
      Gate:=@g_GateArr[GateIdx];
      if Gate.Socket = Socket then begin
        UserList:=Gate.UserList;
        for I:=0 to UserList.Count - 1 do begin
          GateUser:=UserList.Items[I];
          if GateUser <> nil then begin
            if GateUser.PlayObject <> nil then begin
              TPlayObject(GateUser.PlayObject).m_boEmergencyClose:=True;
              if not TPlayObject(GateUser.PlayObject).m_boReconnection then begin
               FrmIDSoc.SendHumanLogOutmsg(GateUser.sAccount,GateUser.nSessionID);
              end;
            end;
            Dispose(GateUser);
            UserList.Items[I]:=nil;
          end;
        end;
        Gate.UserList.Free;
        Gate.UserList:=nil;

        //004E01BF
        if Gate.Buffer <> nil then
           FreeMem(Gate.Buffer);
        Gate.Buffer:=nil;
        Gate.nBuffLen:=0;

        for I:=0 to Gate.BufferList.Count -1 do begin
           FreeMem(Gate.BufferList.Items[I]);
        end;
        Gate.BufferList.Free;
        Gate.BufferList:=nil;

        Gate.boUsed:=False;
        Gate.Socket:=nil;
        MainOutMessage(format(sGateClose,[GateIdx,Socket.RemoteAddress,Socket.RemotePort]));
        break;
      end;
    end;//004E02F1
  finally
    LeaveCriticalSection(m_RunSocketSection);
  end;
end;
//004E16E4
procedure TRunSocket.ExecGateBuffers(nGateIndex:Integer;Gate:pTGateInfo;Buffer:PChar;nMsgLen:Integer);
var
  nLen:Integer;
  Buff:PChar;
  MsgBuff:PChar;
  MsgHeader:pTMsgHeader; //0x20
  nCheckMsgLen:Integer;
  TempBuff:PChar;
ResourceString
  sExceptionMsg1 = '[Exception] TRunSocket::ExecGateBuffers -> pBuffer';
  sExceptionMsg2 = '[Exception] TRunSocket::ExecGateBuffers -> @pwork,ExecGateMsg ';
  sExceptionMsg3 = '[Exception] TRunSocket::ExecGateBuffers -> FreeMem';
begin
  nLen:=0;
  Buff:=nil;
  try
    if Buffer <> nil then begin
      ReallocMem(Gate.Buffer,Gate.nBuffLen + nMsgLen);
      Move(Buffer^,Gate.Buffer[Gate.nBuffLen],nMsgLen);
    end;
  except
    MainOutMessage(sExceptionMsg1);
  end;
  try
    nLen:=Gate.nBuffLen + nMsgLen;
    Buff:=Gate.Buffer;
    if nLen >= SizeOf(TMsgHeader) then begin
      while (True) do begin
        {
        pMsg:=pTMsgHeader(Buff);
        if pMsg.dwCode = RUNGATECODE then begin
          if nLen < (pMsg.nLength + SizeOf(TMsgHeader)) then break;
          MsgBuff:=@Buff[SizeOf(TMsgHeader)];
        }

        MsgHeader:=pTMsgHeader(Buff);
        nCheckMsgLen:=abs(MsgHeader.nLength) + SizeOf(TMsgHeader);
         
        if (MsgHeader.dwCode = RUNGATECODE) and (nCheckMsgLen < $8000) then begin
          if nLen < nCheckMsgLen then break;
          MsgBuff:=Buff + SizeOf(TMsgHeader);//Jacky 1009 换上
          //MsgBuff:=@Buff[SizeOf(TMsgHeader)];


          ExecGateMsg(nGateIndex,Gate,MsgHeader,MsgBuff,MsgHeader.nLength);
          Buff:=Buff + SizeOf(TMsgHeader) + MsgHeader.nLength;//Jacky 1009 换上
          //Buff:=@Buff[SizeOf(TMsgHeader) + pMsg.nLength];
          nLen:= nLen - (MsgHeader.nLength + SizeOf(TMsgHeader));
        end else begin
          Inc(Buff);
          Dec(nLen);
        end;
        if nLen < SizeOf(TMsgHeader) then break;
      end;
    end;
  except
    MainOutMessage(sExceptionMsg2);
  end;
  try
    if nLen > 0 then begin
      GetMem(TempBuff,nLen);
      Move(Buff^,TempBuff^,nLen);
      FreeMem(Gate.Buffer);
      Gate.Buffer:=TempBuff;
      Gate.nBuffLen:=nLen;
    end else begin
      FreeMem(Gate.Buffer);
      Gate.Buffer:=nil;
      Gate.nBuffLen:=0;
    end;
  except
    MainOutMessage(sExceptionMsg3);
  end;
end;


procedure TRunSocket.SocketRead(Socket: TCustomWinSocket);//004DFF84
var
  nMsgLen, GateIdx:Integer;
  Gate:pTGateInfo;
  RecvBuffer:array[0..DATA_BUFSIZE * 2 - 1] of Char;
  nLoopCheck:Integer;
ResourceString
  sExceptionMsg1 = '[Exception] TRunSocket::SocketRead';
begin
  for GateIdx:= Low(g_GateArr) to High(g_GateArr) do begin
    Gate:=@g_GateArr[GateIdx];
    if Gate.Socket = Socket then begin
      try
        //nLoopCheck:=0;
        while (True) do begin //Jacky 1009 换上
          nMsgLen:=Socket.ReceiveBuf(RecvBuffer,SizeOf(RecvBuffer));
          if nMsgLen <= 0 then break;
          ExecGateBuffers(GateIdx,Gate,@RecvBuffer,nMsgLen);
//          Inc(nLoopCheck);
//          if nLoopCheck > g_Config.nRunSocketDieLoopLimit then begin
//            MainOutMessage('[Exception] TRunSocket.SocketRead DieLoop');
//            break;
//          end;
        end;
        break;
      except
        MainOutMessage(sExceptionMsg1);
      end;
    end;
  end;
end;

procedure TRunSocket.Run;//004E1CD0
var
 dwRunTick:LongWord;
 i,nG:Integer;
 Gate:pTGateInfo;
ResourceString
  sExceptionMsg = '[Exception] TRunSocket::Run ';
begin
  dwRunTick:=GetTickCount();
  if boStartReady then begin
    try
      if g_Config.nGateLoad > 0 then begin
        if (GetTickCount - dwSendTestMsgTick) >= 100 then begin
          dwSendTestMsgTick:=GetTickCount();
          for i:=Low(g_GateArr) to High(g_GateArr) do begin
            Gate:=@g_GateArr[i];
            if Gate.BufferList <> nil then begin
              for nG:= 0 to g_Config.nGateLoad -1 do begin
                SendGateTestMsg(i);
              end;//004E1D7D
            end;
          end;
        end;//if (GetTickCount() - dwTime4FC) >= 100 then begin
      end;//004E1D86 if nGateLoad > 0 then begin

      for i:=Low(g_GateArr) to High(g_GateArr) do begin
        Gate:=@g_GateArr[i];
        if Gate.BufferList <> nil then begin
           {
           EnterCriticalSection(RunSocketSection);
           try

             TempList:=SendMsgList;
             SendMsgList:=Gate.BufferList;
             Gate.BufferList:=TempList;
           finally
             LeaveCriticalSection(RunSocketSection);
           end;
           Gate.nSendMsgCount:=SendMsgList.Count;

           ThreadSendGateBuffers(i,Gate,SendMsgList);
           Gate.nSendRemainCount:=SendMsgList.Count;
           SendMsgList.Clear;
           }

           EnterCriticalSection(m_RunSocketSection);
           try
             Gate.nSendMsgCount:=Gate.BufferList.Count;
             if SendGateBuffers(I,Gate,Gate.BufferList) then begin
               Gate.nSendRemainCount:=Gate.BufferList.Count;
             end else begin//004E1DE3
               Gate.nSendRemainCount:=Gate.BufferList.Count;
             end;
           finally
             LeaveCriticalSection(m_RunSocketSection);
           end;
        end;//004E1DF2 
      end;//004E1DFB

      for I:=Low(g_GateArr) to High(g_GateArr) do begin
        if g_GateArr[I].Socket <> nil then begin
          Gate:=@g_GateArr[I];
          if (GetTickCount - Gate.dwSendTick) >= 1000 then begin
            Gate.dwSendTick:=GetTickCount();
            Gate.nSendMsgBytes:=Gate.nSendBytesCount;
            Gate.nSendedMsgCount:=Gate.nSendCount;
            Gate.nSendBytesCount:=0;
            Gate.nSendCount:=0;
          end;//004E1E75
          if Gate.boSendKeepAlive then begin
            Gate.boSendKeepAlive:=False;
            SendCheck(Gate.Socket,GM_CHECKSERVER);
          end;//004E1EBF
        end;//004E1EBF
      end;
    except
      on e: Exception do begin
        MainOutMessage(sExceptionMsg);
        MainOutMessage(E.Message);
      end;
    end;
  end;//004E1EEA if boStartReady then begin
  g_nSockCountMin:=GetTickCount - dwRunTick;
  if g_nSockCountMin > g_nSockCountMax then g_nSockCountMax := g_nSockCountMin;
end;

procedure TRunSocket.DoClientCertification(GateIdx:Integer;GateUser:pTGateUserInfo;nSocket:Integer;sMsg:String);//004E1028
  function GetCertification(sMsg:String;var sAccount:String;var sChrName:String;var nSessionID:Integer;var nClientVersion:Integer;var boFlag:Boolean):Boolean;  //004E0DE0
  var
    sData:String;
    sCodeStr,sClientVersion:String;
    sIdx:String;
  ResourceString
    sExceptionMsg = '[Exception] TRunSocket::DoClientCertification -> GetCertification';
  begin
    Result:=False;
    try
      sData:=DecodeString(sMsg);
//      MainOutMessage(sData);
      if (Length(sData) > 2) and (sData[1] = '*') and (sData[2] = '*') then begin
        sData:=Copy(sData,3,Length(sData)-2);
        sData := GetValidStr3 (sData, sAccount,['/']);
        sData := GetValidStr3 (sData, sChrName, ['/']);
        sData := GetValidStr3 (sData, sCodeStr, ['/']);
        sData := GetValidStr3 (sData, sClientVersion, ['/']);
        sIdx := sData;
        nSessionID:=Str_ToInt(sCodeStr,0);
        if sIdx = '0' then begin
          boFlag:=True;
        end else begin//004E0F37
          boFlag:=False;
        end;
        if (sAccount <> '') and (sChrName <> '') and (nSessionID >= 2) then begin
          nClientVersion:=Str_ToInt(sClientVersion,0);
          Result:=True;
        end;
      end;//004E0F68
    except
      MainOutMessage(sExceptionMsg);
    end;
  end;
var
  nCheckCode:Integer;
  sData:String;
  sAccount,sChrName:String;
  nSessionID:Integer;
  boFlag:Boolean;
  nClientVersion:Integer;
  nPayMent,nPayMode:Integer;
  SessInfo:pTSessInfo;
ResourceString
  sExceptionMsg = '[Exception] TRunSocket::DoClientCertification CheckCode: ';
  sDisable      = '*disable*';
begin
  nCheckCode:=0;
  try
    if GateUser.sAccount = '' then begin
      if TagCount(sMsg,'!') > 0 then begin
        sData := ArrestStringEx (sMsg, '#', '!', sMsg);
        sMsg:=Copy(sMsg,2,Length(sMsg)-1);

        if GetCertification(sMsg,sAccount,sChrName,nSessionID,nClientVersion,boFlag) then begin

          SessInfo:=FrmIDSoc.GetAdmission(sAccount,GateUser.sIPaddr,nSessionID,nPayMode,nPayMent);
          if (SessInfo <> nil) and (nPayMent > 0) then begin
            GateUser.boCertification:=True;
            GateUser.sAccount:=Trim(sAccount);
            GateUser.sCharName:=Trim(sChrName);
            GateUser.nSessionID:=nSessionID;
            GateUser.nClientVersion:=nClientVersion;
            GateUser.SessInfo:=SessInfo;

            try//004E11C9
              FrontEngine.AddToLoadRcdList(sAccount,
                                   sChrName,
                                   GateUser.sIPaddr,
                                   boFlag,
                                   nSessionID,
                                   nPayMent,
                                   nPayMode,
                                   nClientVersion,
                                   nSocket,
                                   GateUser.nGSocketIdx,
                                   GateIdx);
            except
              MainOutMessage(format(sExceptionMsg,[nCheckCode]));
            end;
          end else begin//004E1244
            nCheckCode:=2;
            GateUser.sAccount:=sDisable;
            GateUser.boCertification:=False;
            CloseUser(GateIdx,nSocket);
            nCheckCode:=3;
          end;
        end else begin//004E1276
          nCheckCode:=4;
          GateUser.sAccount:=sDisable;
          GateUser.boCertification:=False;
          CloseUser(GateIdx,nSocket);
          nCheckCode:=5;
        end;
      end;
    end;//004E12A6
  except
    MainOutMessage(format(sExceptionMsg,[nCheckCode]));
  end;
end;

function TRunSocket.SendGateBuffers(GateIdx:Integer;Gate:pTGateInfo;MsgList:TList):Boolean;//004E1930
var
  dwRunTick    :LongWord;
  BufferA      :PChar;
  BufferB      :PChar;
  BufferC      :PChar;
  I            :Integer;
  nBuffALen    :Integer;
  nBuffBLen    :Integer;
  nBuffCLen    :Integer;
  nSendBuffLen :Integer;
ResourceString
  sExceptionMsg1 = '[Exception] TRunSocket::SendGateBuffers -> ProcessBuff';
  sExceptionMsg2 = '[Exception] TRunSocket::SendGateBuffers -> SendBuff';
begin
  Result:=True;
  if MsgList.Count = 0 then exit;
  dwRunTick:=GetTickCount();
  //如果网关未回复状态消息，则不再发送数据
  if Gate.nSendChecked > 0 then begin
    if (GetTickCount - Gate.dwSendCheckTick) > g_dwSocCheckTimeOut {2 * 1000} then begin
      Gate.nSendChecked:=0;
      Gate.nSendBlockCount:=0;
    end;
    exit;
  end;//004E198F

  //将小数据合并为一个指定大小的数据
{$IF CATEXCEPTION = TRYEXCEPTION}
  try
{$IFEND}
    I:=0;
    BufferA:=MsgList.Items[I];
    while (True) do begin
      if (I + 1) >= MsgList.Count then break;
      BufferB:=MsgList.Items[I + 1];
      Move(BufferA^,nBuffALen,SizeOf(Integer));
      Move(BufferB^,nBuffBLen,SizeOf(Integer));
      if (nBuffALen + nBuffBLen) < g_Config.nSendBlock then begin
        MsgList.Delete(I + 1);
        GetMem(BufferC,nBuffALen + SizeOf(Integer) + nBuffBLen);
        nBuffCLen:=nBuffALen + nBuffBLen;
        Move(nBuffCLen,BufferC^,SizeOf(Integer));
        Move(BufferA[SizeOf(Integer)],PChar(BufferC + SizeOf(Integer))^,nBuffALen);
        Move(BufferB[SizeOf(Integer)],PChar(BufferC + nBuffALen + SizeOf(Integer))^,nBuffBLen);
        FreeMem(BufferA);
        FreeMem(BufferB);
        BufferA:=BufferC;
        MsgList.Items[I]:=BufferA;
        Continue;
      end;
      Inc(I);
      BufferA:=BufferB;
    end;//004E1A9D
{$IF CATEXCEPTION = TRYEXCEPTION}
  except
    on e: Exception do begin
      MainOutMessage(sExceptionMsg1);
      MainOutMessage(E.Message);
    end;
  end;
{$IFEND}
  
{$IF CATEXCEPTION = TRYEXCEPTION}
  try
{$IFEND}
    while MsgList.Count > 0 do begin
      BufferA:=MsgList.Items[0];
      if BufferA = nil then begin
        MsgList.Delete(0);
        Continue;
      end;
      Move(BufferA^,nSendBuffLen,SizeOf(Integer));
      if (Gate.nSendChecked = 0) and ((Gate.nSendBlockCount + nSendBuffLen) >= g_Config.nCheckBlock) then begin
        if (Gate.nSendBlockCount = 0) and (g_Config.nCheckBlock <= nSendBuffLen) then begin
          MsgList.Delete(0); //如果数据大小超过指定大小则扔掉(编辑数据比较大，与此有点关系)
          FreeMem(BufferA);
        end else begin
          SendCheck(Gate.Socket,GM_RECEIVE_OK);
          Gate.nSendChecked:=1;
          Gate.dwSendCheckTick:=GetTickCount();
        end;
        break;
      end; //004E1B75

      MsgList.Delete(0);
      BufferB:=BufferA + SizeOf(Integer);
      if nSendBuffLen > 0 then begin
        while (True) do begin
          if g_Config.nSendBlock <= nSendBuffLen then begin
            if Gate.Socket <> nil then begin
              if Gate.Socket.Connected then begin
                Gate.Socket.SendBuf(BufferB^,g_Config.nSendBlock);
              end;//004E1BC9
              Inc(Gate.nSendCount);
              Inc(Gate.nSendBytesCount,g_Config.nSendBlock);
            end;//004E1BDC
            Inc(Gate.nSendBlockCount,g_Config.nSendBlock);
            BufferB:=@BufferB[g_Config.nSendBlock];
            Dec(nSendBuffLen,g_Config.nSendBlock);
            Continue;
          end;//004E1C05
          if Gate.Socket <> nil then begin
            if Gate.Socket.Connected then begin
              Gate.Socket.SendBuf(BufferB^,nSendBuffLen);
            end;
            Inc(Gate.nSendCount);
            Inc(Gate.nSendBytesCount,nSendBuffLen);
            Inc(Gate.nSendBlockCount,nSendBuffLen);
          end;
          nSendBuffLen:=0;
          break;
        end;
      end;//004E1C54
      FreeMem(BufferA);
      if (GetTickCount - dwRunTick) > g_dwSocLimit then begin
        Result:=False;
        break;
      end;
    end; //004E1C74
{$IF CATEXCEPTION = TRYEXCEPTION}
  except
    on e: Exception do begin
      MainOutMessage(sExceptionMsg2);
      MainOutMessage(E.Message);
    end;
  end;
{$IFEND}
  //004E1C9F
end;


procedure TRunSocket.CloseUser(GateIdx,nSocket:Integer);//004E0490
var
 i:integer;
 GateUser:pTGateUserInfo;
 tStr:String;
 Gate:pTGateInfo;
ResourceString
  sExceptionMsg0 = '[Exception] TRunSocket::CloseUser 0';
  sExceptionMsg1 = '[Exception] TRunSocket::CloseUser 1';
  sExceptionMsg2 = '[Exception] TRunSocket::CloseUser 2';
  sExceptionMsg3 = '[Exception] TRunSocket::CloseUser 3';
  sExceptionMsg4 = '[Exception] TRunSocket::CloseUser 4';
begin
  if GateIdx <= High(g_GateArr) then begin
    Gate:=@g_GateArr[GateIdx];
    if Gate.UserList <> nil then begin
      EnterCriticalSection(m_RunSocketSection);
      try
        try
          for i:=0 to Gate.UserList.Count -1 do begin
            if Gate.UserList.Items[i] <> nil then begin
              GateUser:=Gate.UserList.Items[i];
              if GateUser.nSocket = nSocket then begin
                //004E0595
                try
                  if GateUser.FrontEngine <> nil then begin
                    TFrontEngine(GateUser.FrontEngine).DeleteHuman(i,GateUser.nSocket);
                  end;
                except
                  MainOutMessage(sExceptionMsg1);
                end;
                //004E05DE
                try
                  if GateUser.PlayObject <> nil then begin
                     TPlayObject(GateUser.PlayObject).m_boSoftClose:=True;
                  end;
                except
                  MainOutMessage(sExceptionMsg2);
                end;
                //004E0620
                try
                  if (GateUser.PlayObject <> nil) and TPlayObject(GateUser.PlayObject).m_boGhost and not TPlayObject(GateUser.PlayObject).m_boReconnection then begin
                    FrmIDSoc.SendHumanLogOutmsg(GateUser.sAccount,GateUser.nSessionID);
                  end;
                except
                  MainOutMessage(sExceptionMsg3);
                end;

                //004E0693
                try
                  Dispose(GateUser);
                  //MainOutMessage('关闭用户: ' + IntToStr(nSocket));

                  //02/04 Jacky
                  Gate.UserList.Items[i]:=nil;
                  Dec(Gate.nUserCount);
                except
                  MainOutMessage(sExceptionMsg4);
                end;
                break;
              end;
            end;
          end;
        except
          MainOutMessage(sExceptionMsg0);
        end;
      finally
        LeaveCriticalSection(m_RunSocketSection);
      end;
    end;
  end;
end;

function TRunSocket.OpenNewUser(nSocket:Integer;nGSocketIdx:Integer;sIPaddr:String;UserList:TList):Integer; //004E0364
var
  GateUser :pTGateUserInfo;
  I        :integer;
begin
  New(GateUser); 
  GateUser.sAccount        := '';
  GateUser.sCharName       := '';
  GateUser.sIPaddr         := sIPaddr;
  GateUser.nSocket         := nSocket;
  GateUser.nGSocketIdx     := nGSocketIdx;
  GateUser.nSessionID      := 0;
  GateUser.UserEngine      := nil;
  GateUser.FrontEngine     := nil;
  GateUser.PlayObject      := nil;
  GateUser.dwNewUserTick   := GetTickCount();
  GateUser.boCertification := False;
  for I:=0 to UserList.Count -1 do begin
    if UserList.Items[I] = nil then begin
      UserList.Items[I]:=GateUser;
      Result:=I;
      //MainOutMessage('连接用户: ' + IntToStr(nSocket));
      exit;
    end;
  end;
  //MainOutMessage('连接用户: ' + IntToStr(nSocket));
  UserList.Add(GateUser);
  Result:=UserList.Count - 1 ;
end;

//004E09D0
procedure TRunSocket.SendNewUserMsg(Socket:TCustomWinSocket;nSocket:Integer;nSocketIndex,nUserIdex:Integer);
var
  MsgHeader:TMsgHeader;
begin
  if not Socket.Connected then exit;
  MsgHeader.dwCode         := RUNGATECODE;
  MsgHeader.nSocket        := nSocket;
  MsgHeader.wGSocketIdx    := nSocketIndex;
  MsgHeader.wIdent         := GM_SERVERUSERINDEX;
  MsgHeader.wUserListIndex := nUserIdex;
  MsgHeader.nLength        := 0;

  if Socket <> nil then Socket.SendBuf(MsgHeader,SizeOf(TMsgHeader));
end;

//004E13EC
procedure TRunSocket.ExecGateMsg(GateIdx:Integer;Gate:pTGateInfo;MsgHeader:pTMsgHeader;MsgBuff:PChar;nMsgLen:Integer);
var
 nCheckCode :Integer;
 nUserIdx   :Integer;
 sIPaddr    :String;
 GateUser   :pTGateUserInfo;
 I          :Integer;
ResourceString
  sExceptionMsg = '[Exception] TRunSocket::ExecGateMsg %d';
begin
  nCheckCode:=0;
  try
    case MsgHeader.wIdent of
      GM_OPEN{1}: begin//004E1464
        nCheckCode := 1;
        sIPaddr    := StrPas(MsgBuff);
        nUserIdx   := OpenNewUser(MsgHeader.nSocket,MsgHeader.wGSocketIdx,sIPaddr,Gate.UserList);
        SendNewUserMsg(Gate.Socket,MsgHeader.nSocket,MsgHeader.wGSocketIdx,nUserIdx + 1 );
        Inc(Gate.nUserCount);
      end;
      GM_CLOSE{2}: begin
        nCheckCode := 2;
        CloseUser(GateIdx,MsgHeader.nSocket);
      end;
      GM_CHECKCLIENT{4}: begin//004E14DC
        nCheckCode := 3;
        Gate.boSendKeepAlive:=True;
      end;
      GM_RECEIVE_OK{7}: begin//004E14EF
        nCheckCode           := 4;
        Gate.nSendChecked    := 0;
        Gate.nSendBlockCount := 0;
      end;
      GM_DATA{5}: begin//004E150B
        nCheckCode := 5;
        GateUser   := nil;

        if MsgHeader.wUserListIndex >= 1 then begin
          nUserIdx:=MsgHeader.wUserListIndex -1;
          if Gate.UserList.Count > nUserIdx then begin
            GateUser:=Gate.UserList.Items[nUserIdx];
            if (GateUser <> nil) and (GateUser.nSocket <> MsgHeader.nSocket) then begin
              GateUser:=nil;
            end;
          end;
        end;

        if GateUser = nil then begin
          for I:=0 to Gate.UserList.Count -1 do begin
            if Gate.UserList.Items[I] = nil then Continue;
            if pTGateUserInfo(Gate.UserList.Items[I]).nSocket = MsgHeader.nSocket then begin
              GateUser:=Gate.UserList.Items[I];
              break;
            end;
          end;
        end;
        
        nCheckCode:=6;
        if GateUser <> nil then begin
          if (GateUser.PlayObject <> nil) and (GateUser.UserEngine <> nil) then begin
            if GateUser.boCertification and (nMsgLen >= SizeOf(TDefaultMessage)) then begin
              if nMsgLen = SizeOf(TDefaultMessage) then begin
                UserEngine.ProcessUserMessage(TPlayObject(GateUser.PlayObject),pTDefaultMessage(MsgBuff),nil)
              end else begin//004E161A
                UserEngine.ProcessUserMessage(TPlayObject(GateUser.PlayObject),pTDefaultMessage(MsgBuff),@MsgBuff[SizeOf(TDefaultMessage)]);
              end;
            end;
          end else begin//004E1638
            DoClientCertification(GateIdx,GateUser,MsgHeader.nSocket,StrPas(MsgBuff));
          end;
        end;//004E165C
      end;
    end;
  except
    MainOutMessage(format(sExceptionMsg,[nCheckCode]));
  end;
end;
procedure TRunSocket.SendCheck(Socket:TCustomWinSocket;nIdent:Integer);//004E0984
var
  MsgHeader:TMsgHeader;
begin
  if not Socket.Connected then exit;
  MsgHeader.dwCode  := RUNGATECODE;
  MsgHeader.nSocket := 0;
  MsgHeader.wIdent  := nIdent;
  MsgHeader.nLength := 0;
  if Socket <> nil then
    Socket.SendBuf(MsgHeader,SizeOf(TMsgHeader));
end;
procedure TRunSocket.LoadRunAddr();//004DFBA0
var
  sFileName:String;
begin
  sFileName:='.\RunAddr.txt';
  if FileExists(sFileName) then begin
    m_RunAddrList.LoadFromFile(sFileName);
    TrimStringList(m_RunAddrList);
  end;
end;
//constructor TRunSocket.Create(CreateSuspended: Boolean);//004DFA34
constructor TRunSocket.Create();//004DFA34
var
  I    :Integer;
  Gate :pTGateInfo;
begin
  InitializeCriticalSection(m_RunSocketSection);
  m_RunAddrList:=TStringList.Create;
  for I:= Low(g_GateArr) to High(g_GateArr) do begin
    Gate                  := @g_GateArr[I];
    Gate.boUsed           := False;
    Gate.Socket           := nil;
    Gate.boSendKeepAlive  := False;
    Gate.nSendMsgCount    := 0;
    Gate.nSendRemainCount := 0;
    Gate.dwSendTick       := GetTickCount();
    Gate.nSendMsgBytes    := 0;
    Gate.nSendedMsgCount  := 0;
  end;
  LoadRunAddr();//call    sub_4DFBA0
  n4F8:=0;
end;

destructor TRunSocket.Destroy;//004DFB4C
begin
  m_RunAddrList.Free;
  DeleteCriticalSection(m_RunSocketSection);
  inherited;
end;

function TRunSocket.AddGateBuffer(GateIdx: Integer;Buffer: PChar):Boolean;//004E0C1C
var
  Gate:pTGateInfo;
begin
  Result:=False;
  EnterCriticalSection(m_RunSocketSection);
  try
    if GateIdx < RUNGATEMAX then begin
      Gate:=@g_GateArr[GateIdx];
      if (Gate.BufferList <> nil) and (Buffer <> nil) then begin
        if Gate.boUsed and (Gate.Socket <> nil) then begin
          Gate.BufferList.Add(Buffer);
          Result:=True;
        end;
      end;
    end;
  finally
    LeaveCriticalSection(m_RunSocketSection);
  end;
end;

procedure TRunSocket.SendOutConnectMsg(nGateIdx,nSocket,nGsIdx:integer);//004E08E4
var
  DefMsg    :TDefaultMessage;
  MsgHeader :TMsgHeader;
  nLen      :Integer;
  Buff      :PChar;
begin
  DefMsg:=MakeDefaultMsg(SM_OUTOFCONNECTION,0,0,0,0);
  MsgHeader.dwCode        := RUNGATECODE;
  MsgHeader.nSocket       := nSocket;
  MsgHeader.wGSocketIdx   := nGsIdx;
  MsgHeader.wIdent        := GM_DATA;
  MsgHeader.nLength       := SizeOf(TDefaultMessage);
  
  nLen:=MsgHeader.nLength + SizeOf(TMsgHeader);
  GetMem(Buff,nLen + SizeOf(Integer));
  Move(nLen,Buff^,SizeOf(Integer));
  Move(MsgHeader,Buff[SizeOf(Integer)],SizeOf(TMsgHeader));
  Move(DefMsg,Buff[SizeOf(Integer) + SizeOf(TMsgHeader)],SizeOf(TDefaultMessage));
  if not AddGateBuffer(nGateIdx,Buff) then begin
    FreeMem(Buff);
  end;
end;
procedure TRunSocket.SendScanMsg(DefMsg:pTDefaultMessage;sMsg:String;nGateIdx,nSocket,nGsIdx:integer);
var
  MsgHdr:TMsgHeader;
  nLen:Integer;
  Buff:PChar;
  nSendBytes:Integer;
begin
  MsgHdr.dwCode        := RUNGATECODE;
  MsgHdr.nSocket       := nSocket;
  MsgHdr.wGSocketIdx   := nGsIdx;
  MsgHdr.wIdent        := GM_DATA;
  MsgHdr.nLength       := SizeOf(TDefaultMessage);

    if DefMsg <> nil then begin
      if sMsg <> '' then begin
        MsgHdr.nLength:=Length(sMsg) + SizeOf(TDefaultMessage) + 1;
        nSendBytes:=MsgHdr.nLength + SizeOf(TMsgHeader);
        GetMem(Buff,nSendBytes + SizeOf(Integer));
        Move(nSendBytes,Buff^,SizeOf(Integer));
        Move(MsgHdr,Buff[SizeOf(Integer)],SizeOf(TMsgHeader));
        Move(DefMsg^,Buff[SizeOf(TMsgHeader) + SizeOf(Integer)],SizeOf(TDefaultMessage));
        Move(sMsg[1],Buff[SizeOf(TDefaultMessage) + SizeOf(TMsgHeader) + SizeOf(Integer)],Length(sMsg) + 1);
      end else begin//004CAC29
        MsgHdr.nLength:=SizeOf(TDefaultMessage);
        nSendBytes:=MsgHdr.nLength + SizeOf(TMsgHeader);
        GetMem(Buff,nSendBytes + SizeOf(Integer));
        Move(nSendBytes,Buff^,SizeOf(Integer));
        Move(MsgHdr,Buff[SizeOf(Integer)],SizeOf(TMsgHeader));
        Move(DefMsg^,Buff[SizeOf(TMsgHeader) + SizeOf(Integer)],SizeOf(TDefaultMessage));
      end;
    end else begin//004CAC7F
      if sMsg <> '' then begin
        MsgHdr.nLength:= - (Length(sMsg) + 1);
        nSendBytes:=abs(MsgHdr.nLength) + SizeOf(TMsgHeader);
        GetMem(Buff,nSendBytes + SizeOf(Integer));
        Move(nSendBytes,Buff^,SizeOf(Integer));
        Move(MsgHdr,Buff[SizeOf(Integer)],SizeOf(TMsgHeader));
        Move(sMsg[1],Buff[SizeOf(TMsgHeader) + SizeOf(Integer)],Length(sMsg) + 1);
      end;//004CACF0
    end;//004CACF0
    if not RunSocket.AddGateBuffer(nGateIdx,Buff) then begin
      FreeMem(Buff);
    end;
end;
procedure TRunSocket.SetGateUserList(nGateIdx, nSocket: Integer;PlayObject:TPlayObject);//004E0CEC
var
  I            :Integer;
  GateUserInfo :pTGateUserInfo;
  Gate         :pTGateInfo;
begin
  if nGateIdx > high(g_GateArr) then exit;
  Gate:=@g_GateArr[nGateIdx];
  if Gate.UserList = nil then exit;
  EnterCriticalSection(m_RunSocketSection);
  try
    for I := 0 to Gate.UserList.Count - 1 do begin
      GateUserInfo:=Gate.UserList.Items[I];
      if (GateUserInfo <> nil) and (GateUserInfo.nSocket = nSocket) then begin
        GateUserInfo.FrontEngine := nil;
        GateUserInfo.UserEngine  := UserEngine;
        GateUserInfo.PlayObject  := PlayObject;
        break;
      end;       
    end;
  finally
    LeaveCriticalSection(m_RunSocketSection);
  end;
end;

procedure TRunSocket.SendGateTestMsg(nIndex:Integer);//004E0860
var
  MsgHdr:TMsgHeader;
  Buff:PChar;
  nLen:Integer;
  DefMsg:TDefaultMessage;
begin
  MsgHdr.dwCode         := RUNGATECODE;
  MsgHdr.nSocket        := 0;
  MsgHdr.wIdent         := GM_TEST;
  MsgHdr.nLength        := 100;
  nLen:=MsgHdr.nLength + SizeOf(TMsgHeader);
  GetMem(Buff,nLen + SizeOf(Integer));
  Move(nLen,Buff^,SizeOf(Integer));
  Move(MsgHdr,Buff[SizeOf(Integer)],SizeOf(TMsgHeader));
  Move(DefMsg,Buff[SizeOf(TMsgHeader) + SizeOf(Integer)],SizeOf(TDefaultMessage));
  if not AddGateBuffer(nIndex,Buff) then begin
    FreeMem(Buff);
    //MainOutMessage('SendGateTestMsg Buffer Fail ' + IntToStr(nIndex));
  end;
end;

procedure TRunSocket.KickUser(sAccount: String; nSessionID: Integer);//004E0A2C
var
  I            :Integer;
  II           :Integer;
  GateUserInfo :pTGateUserInfo;
  Gate         :pTGateInfo;
  nCheckCode   :Integer;
ResourceString
  sExceptionMsg = '[Exception] TRunSocket::KickUser';
  sKickUserMsg  = '当前登录帐号正在其它位置登录，本机已被强行离线！！！';
begin
try
  nCheckCode:=0;
  for I := Low(g_GateArr) to High(g_GateArr) do begin
    Gate:=@g_GateArr[I];
    nCheckCode:=1;
    if Gate.boUsed and (Gate.Socket <> nil) and (Gate.UserList <> nil) then begin
      nCheckCode:=2;
      EnterCriticalSection(m_RunSocketSection);
      try
        nCheckCode:=3;
        for II := 0 to Gate.UserList.Count - 1 do begin
          nCheckCode:=4;
          GateUserInfo:=Gate.UserList.Items[II];
          if GateUserInfo = nil then Continue;
          nCheckCode:=5;
          if (GateUserInfo.sAccount = sAccount) or (GateUserInfo.nSessionID = nSessionID) then begin
            nCheckCode:=6;
            if GateUserInfo.FrontEngine <> nil then begin
              nCheckCode:=7;
              TFrontEngine(GateUserInfo.FrontEngine).DeleteHuman(I,GateUserInfo.nSocket);
            end;
            nCheckCode:=8;
            if GateUserInfo.PlayObject <> nil then begin
              nCheckCode:=9;
              TPlayObject(GateUserInfo.PlayObject).SysMsg(sKickUserMsg,c_Red,t_Hint);
              TPlayObject(GateUserInfo.PlayObject).m_boEmergencyClose:=True;
              TPlayObject(GateUserInfo.PlayObject).m_boSoftClose:=True;
              //SendOutConnectMsg(I,GateUserInfo.nSocket);
            end;
            nCheckCode:=10;
            Dispose(GateUserInfo);
            nCheckCode:=11;
            Gate.UserList.Items[II]:=nil;
            nCheckCode:=12;
            Dec(Gate.nUserCount);
            break;
          end;
        end;
        nCheckCode:=13;
      finally
        LeaveCriticalSection(m_RunSocketSection);
      end;
      nCheckCode:=14;
    end;
  end;
except
    on e: Exception do begin
      MainOutMessage(format(sExceptionMsg,[nCheckCode]));
      MainOutMessage(E.Message);
    end;
end;
end;
function TRunSocket.GetGateAddr(sIPaddr: String):String;//004DFBE0
var
  I: Integer;
begin
  Result:=sIPaddr;
  for I := 0 to n8 - 1 do begin
    if m_IPaddrArr[I].sIpaddr = sIPaddr then begin
      Result:=m_IPaddrArr[I].dIPaddr;
      break;
    end;      
  end;
end;


initialization
begin

end;
finalization
begin

end;
end.
