unit NoticeM;

interface
uses
  Windows,Classes,SysUtils;
type
  TNoticeMsg = record //0x0C 00491BE9
    sMsg     :String;
    sList    :TStringList;
    bo0C     :Boolean;
  end;

  TNoticeManager = class
  private
    NoticeList:array[0..99] of TNoticeMsg;
  public
    constructor Create();
    destructor Destroy;override;
    function  GetNoticeMsg(sStr:String;LoadList:TStringList):Boolean;
    procedure LoadingNotice();
  end;
implementation

uses M2Share;

{ TNoticeManager }

//00491C9E
constructor TNoticeManager.Create;
var
  I:Integer;
begin
  for I := Low(NoticeList) to high(NoticeList) do begin
    NoticeList[i].sMsg:='';
    NoticeList[i].sList:=nil;
    NoticeList[i].bo0C:=True;
  end;
end;

destructor TNoticeManager.Destroy;
var
  I:Integer;
begin
  for I := Low(NoticeList) to high(NoticeList) do begin
    if NoticeList[i].sList <> nil then
      NoticeList[i].sList.Free;
  end;
  inherited;
end;
procedure TNoticeManager.LoadingNotice();//00491D54
var
  sFileName:String;
  i:integer;
begin
  for I := Low(NoticeList) to high(NoticeList) do begin
    if NoticeList[i].sMsg = '' then Continue;      
    sFileName:=g_Config.sNoticeDir + NoticeList[i].sMsg + '.txt';
    if FileExists(sFileName) then begin
      try
        if NoticeList[i].sList = nil then NoticeList[i].sList:=TStringList.Create;
        NoticeList[i].sList.LoadFromFile(sFileName);
      except
        MainOutMessage('Error in loading notice text. file name is ' + sFileName);
      end;
    end;
  end;
end;
function TNoticeManager.GetNoticeMsg(sStr: String; LoadList: TStringList):Boolean; //00491EA0
var
  bo15:Boolean;
  i:Integer;
  sFileName:String;
begin
  Result:=False;
  bo15:=True;
  for i := Low(NoticeList) to high(NoticeList) do begin
    if CompareText(NoticeList[i].sMsg,sStr) = 0 then begin
      if NoticeList[i].sList <> nil then begin
        LoadList.AddStrings(NoticeList[i].sList);
        Result:=True;
      end;
      bo15:=False;
    end;
  end;    // while
  if not bo15 then exit;
  for i := Low(NoticeList) to high(NoticeList) do begin
    if NoticeList[i].sMsg = '' then begin
      sFileName:=g_Config.sNoticeDir + sStr + '.txt';
      if FileExists(sFileName) then begin
        try
          if NoticeList[i].sList = nil then NoticeList[i].sList:=TStringList.Create;
          NoticeList[i].sList.LoadFromFile(sFileName);
          LoadList.AddStrings(NoticeList[i].sList);
        except
          MainOutMessage('Error in loading notice text. file name is ' + sFileName);
        end;
        NoticeList[i].sMsg:=sStr;
        Result:=True;
        break;
      end;        
    end;
  end;
end;
end.
