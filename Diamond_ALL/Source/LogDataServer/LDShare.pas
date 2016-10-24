unit LDShare;

interface
uses
  Windows,Messages,SysUtils;
var
  sBaseDir       :String = '.\LogBase';
  sServerName    :String = 'ktest';
  sCaption       :String = 'LogServer';

  nServerPort    :Integer = 10000;
  g_dwGameCenterHandle:THandle;

  procedure SendGameCenterMsg(wIdent:Word;sSendMsg:String);
implementation

uses Grobal2, HUtil32;
procedure SendGameCenterMsg(wIdent:Word;sSendMsg:String);
var
  SendData:TCopyDataStruct;
  nParam:Integer;
begin
  nParam:=MakeLong(Word(tLogServer),wIdent);
  SendData.cbData:=Length (sSendMsg) + 1;
  GetMem(SendData.lpData,SendData.cbData);
  StrCopy (SendData.lpData, PChar(sSendMsg));
  SendMessage(g_dwGameCenterHandle,WM_COPYDATA,nParam,Cardinal(@SendData));
  FreeMem(SendData.lpData);
end;
end.
