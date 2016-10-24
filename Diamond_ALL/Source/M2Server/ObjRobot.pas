unit ObjRobot;

interface
uses
  Windows,Classes,SysUtils,DateUtils,ObjBase,Grobal2;
const
  sROAUTORUN = '#AUTORUN';

  sRONPCLABLEJMP = 'NPC';
  nRONPCLABLEJMP = 100;


  sRODAY       = 'DAY';
  nRODAY       = 200;
  sROHOUR      = 'HOUR';
  nROHOUR      = 201;
  sROMIN       = 'MIN';
  nROMIN       = 202;
  sROSEC       = 'SEC';
  nROSEC       = 203;
  sRUNONWEEK   = 'RUNONWEEK'; //指定星期几运行
  nRUNONWEEK   = 300;
  sRUNONDAY    = 'RUNONDAY';  //指定几日运行
  nRUNONDAY    = 301;
  sRUNONHOUR   = 'RUNONHOUR'; //指定小时运行
  nRUNONHOUR   = 302;
  sRUNONMIN    = 'RUNONMIN';  //指定分钟运行
  nRUNONMIN    = 303;
  sRUNONSEC    = 'RUNONSEC';
  nRUNONSEC    = 304;

type
  TOpType = (o_NPC);
  TAutoRunInfo = record
    dwRunTick    :LongWord;//上一次运行时间记录
    dwRunTimeLen :LongWord;//运行间隔时间长
    nRunCmd      :Integer; //自动运行类型
    nMoethod     :Integer;
    sParam1      :String;  //运行脚本标签
    sParam2      :String;  //传送到脚本参数内容
    sParam3      :String;
    sParam4      :String;
    nParam1      :Integer;
    nParam2      :Integer;
    nParam3      :Integer;
    nParam4      :Integer;
    boStatus     :Boolean;
  end;
  pTAutoRunInfo = ^TAutoRunInfo;
  TRobotObject = class(TPlayObject)
    m_sScriptFileName:String;
    m_AutoRunList:TList;
  private
    m_boRunOnWeek:Boolean; //是否已执行操作；
    procedure LoadScript();
    procedure ClearScript();
    procedure ProcessAutoRun();
    procedure AutoRun(AutoRunInfo:pTAutoRunInfo);
    procedure AutoRunOfOnWeek(AutoRunInfo:pTAutoRunInfo);
    procedure AutoRunOfOnDay(AutoRunInfo:pTAutoRunInfo);
    procedure AutoRunOfOnHour(AutoRunInfo:pTAutoRunInfo);
    procedure AutoRunOfOnMin(AutoRunInfo:pTAutoRunInfo);
    procedure AutoRunOfOnSec(AutoRunInfo:pTAutoRunInfo);
  public
    constructor Create();override;
    destructor Destroy; override;
    procedure SendSocket(DefMsg: pTDefaultMessage; sMsg: String);override;
    procedure ReloadScript();
    procedure Run();override;
  end;
  TRobotManage = class
    RobotHumanList:TStringList;
  private
    procedure LoadRobot();
    procedure UnLoadRobot();
  public
    constructor Create();
    destructor Destroy; override;
    procedure ReLoadRobot();
    procedure Run;
  end;
implementation

uses M2Share, HUtil32;

{ TRobotObject }

procedure TRobotObject.AutoRun(AutoRunInfo: pTAutoRunInfo);
begin
  if g_RobotNPC = nil then begin
    exit;
  end;
  if GetTickCount - AutoRunInfo.dwRunTick > AutoRunInfo.dwRunTimeLen then begin
    case AutoRunInfo.nRunCmd of    //
      nRONPCLABLEJMP: begin
        case AutoRunInfo.nMoethod of    //
          nRODAY: begin
            if GetTickCount - AutoRunInfo.dwRunTick > 24 * 60 * 60 * 1000 * LongWord(AutoRunInfo.nParam1) then begin
              AutoRunInfo.dwRunTick:=GetTickCount();
              g_RobotNPC.GotoLable(Self,AutoRunInfo.sParam2,False);
            end;
          end;
          nROHOUR: begin
            if GetTickCount - AutoRunInfo.dwRunTick > 60 * 60 * 1000 * LongWord(AutoRunInfo.nParam1) then begin
              AutoRunInfo.dwRunTick:=GetTickCount();
              g_RobotNPC.GotoLable(Self,AutoRunInfo.sParam2,False);
            end;
          end;
          nROMIN: begin
            if GetTickCount - AutoRunInfo.dwRunTick > 60 * 1000 * LongWord(AutoRunInfo.nParam1) then begin
              AutoRunInfo.dwRunTick:=GetTickCount();
              g_RobotNPC.GotoLable(Self,AutoRunInfo.sParam2,False);
            end;
          end;
          nROSEC: begin
            if GetTickCount - AutoRunInfo.dwRunTick > 1000 * LongWord(AutoRunInfo.nParam1) then begin
              AutoRunInfo.dwRunTick:=GetTickCount();
              g_RobotNPC.GotoLable(Self,AutoRunInfo.sParam2,False);
            end;
          end;
          nRUNONWEEK:   AutoRunOfOnWeek(AutoRunInfo);
          nRUNONDAY:    AutoRunOfOnDay(AutoRunInfo);
          nRUNONHOUR:   AutoRunOfOnHour(AutoRunInfo);
          nRUNONMIN:    AutoRunOfOnMin(AutoRunInfo);
          nRUNONSEC:    AutoRunOfOnSec(AutoRunInfo);

        end;    // case
      end;
      1: ;
      2: ;
      3: ;
    end;    // case

  end;
    
end;

procedure TRobotObject.AutoRunOfOnDay(AutoRunInfo: pTAutoRunInfo);
var
  nMin,nHour,nWeek:Integer;
  wWeek,wHour,wMin,wSec,wMSec:Word;
  sMin,sHour,sWeek:String;
  sLineText,sLabel:String;
begin
  sLineText:=AutoRunInfo.sParam1;
  sLineText:=GetValidStr3(sLineText,sHour,[':']);
  sLineText:=GetValidStr3(sLineText,sMin,[':']);
  nHour:=Str_ToInt(sHour,-1);
  nMin:=Str_ToInt(sMin,-1);
  sLabel:=AutoRunInfo.sParam2;
  DecodeTime(Time,wHour,wMin,wSec,wMSec);
  if (nHour in [0..24]) and (nMin in [0..60]) then begin
    if (wHour = nHour) then begin
      if (wMin = nMin) then begin
        if not AutoRunInfo.boStatus then begin
          g_RobotNPC.GotoLable(Self,AutoRunInfo.sParam2,False);
//          MainOutMessage('RUNONWEEK Test ' + AutoRunInfo.sParam1);
          AutoRunInfo.boStatus:=True;
        end;
      end else begin
        AutoRunInfo.boStatus:=False;
      end;
    end;
  end;
end;

procedure TRobotObject.AutoRunOfOnHour(AutoRunInfo: pTAutoRunInfo);
begin

end;

procedure TRobotObject.AutoRunOfOnMin(AutoRunInfo: pTAutoRunInfo);
begin

end;

procedure TRobotObject.AutoRunOfOnSec(AutoRunInfo: pTAutoRunInfo);
begin

end;

procedure TRobotObject.AutoRunOfOnWeek(AutoRunInfo: pTAutoRunInfo);
var
  nMin,nHour,nWeek:Integer;
  wWeek,wHour,wMin,wSec,wMSec:Word;
  sMin,sHour,sWeek:String;
  sLineText,sLabel:String;
begin
  sLineText:=AutoRunInfo.sParam1;
  sLineText:=GetValidStr3(sLineText,sWeek,[':']);
  sLineText:=GetValidStr3(sLineText,sHour,[':']);
  sLineText:=GetValidStr3(sLineText,sMin,[':']);
  nWeek:=Str_ToInt(sWeek,-1);
  nHour:=Str_ToInt(sHour,-1);
  nMin:=Str_ToInt(sMin,-1);
  sLabel:=AutoRunInfo.sParam2;
  DecodeTime(Time,wHour,wMin,wSec,wMSec);
  wWeek:=DayOfTheWeek(Now);
  if (nWeek in [1..7]) and (nHour in [0..24]) and (nMin in [0..60]) then begin
    if (wWeek = nWeek) and (wHour = nHour) then begin
      if (wMin = nMin) then begin
        if not AutoRunInfo.boStatus then begin
          g_RobotNPC.GotoLable(Self,AutoRunInfo.sParam2,False);
//          MainOutMessage('RUNONWEEK Test ' + AutoRunInfo.sParam1);
          AutoRunInfo.boStatus:=True;
        end;
      end else begin
        AutoRunInfo.boStatus:=False;
      end;
    end;
  end;
    
end;

procedure TRobotObject.ClearScript;
var
  I: Integer;
begin
  for I := 0 to m_AutoRunList.Count - 1 do begin
    Dispose(pTAutoRunInfo(m_AutoRunList.Items[I]));
  end;
  m_AutoRunList.Clear;
end;

constructor TRobotObject.Create;
begin
  inherited;
  m_AutoRunList:=TList.Create;
  m_boSuperMan:=True;
  m_boRunOnWeek:=False;
end;

destructor TRobotObject.Destroy;
begin
  ClearScript();
  m_AutoRunList.Free;
  inherited;
end;

procedure TRobotObject.LoadScript;
var
  I: Integer;
  LoadList:TStringList;
  sFileName:String;
  sLineText:String;
  sActionType:String;
  sRunCmd:String;
  sMoethod:String;
  sParam1:String;
  sParam2:String;
  sParam3:String;
  sParam4:String;
  AutoRunInfo:pTAutoRunInfo;
begin
  sFileName:=g_Config.sEnvirDir + 'Robot_def\' + m_sScriptFileName + '.txt';
  if FileExists(sFileName) then begin
    LoadList:=TStringList.Create;
    LoadList.LoadFromFile(sFileName);
    for I := 0 to LoadList.Count - 1 do begin
      sLineText:=LoadList.Strings[i];
      if (sLineText <> '') and (sLineText[1] <> ';') then begin
        sLineText:=GetValidStr3(sLineText,sActionType,[' ','/',#9]);
        sLineText:=GetValidStr3(sLineText,sRunCmd,[' ','/',#9]);
        sLineText:=GetValidStr3(sLineText,sMoethod,[' ','/',#9]);
        sLineText:=GetValidStr3(sLineText,sParam1,[' ','/',#9]);
        sLineText:=GetValidStr3(sLineText,sParam2,[' ','/',#9]);
        sLineText:=GetValidStr3(sLineText,sParam3,[' ','/',#9]);
        sLineText:=GetValidStr3(sLineText,sParam4,[' ','/',#9]);
        if CompareText(sActionType,sROAUTORUN) = 0 then begin
          if CompareText(sRunCmd,sRONPCLABLEJMP) = 0 then begin
            New(AutoRunInfo);
            AutoRunInfo.dwRunTick:=GetTickCount;
            AutoRunInfo.dwRunTimeLen:=0;
            AutoRunInfo.boStatus:=False;
            AutoRunInfo.nRunCmd:=nRONPCLABLEJMP;
            if CompareText(sMoethod,sRODAY) = 0 then
              AutoRunInfo.nMoethod:=nRODAY;
            if CompareText(sMoethod,sROHOUR) = 0 then
              AutoRunInfo.nMoethod:=nROHOUR;
            if CompareText(sMoethod,sROMIN) = 0 then
              AutoRunInfo.nMoethod:=nROMIN;
            if CompareText(sMoethod,sROSEC) = 0 then
              AutoRunInfo.nMoethod:=nROSEC;
            if CompareText(sMoethod,sRUNONWEEK) = 0 then
              AutoRunInfo.nMoethod:=nRUNONWEEK;
            if CompareText(sMoethod,sRUNONDAY) = 0 then
              AutoRunInfo.nMoethod:=nRUNONDAY;
            if CompareText(sMoethod,sRUNONHOUR) = 0 then
              AutoRunInfo.nMoethod:=nRUNONHOUR;
            if CompareText(sMoethod,sRUNONMIN) = 0 then
              AutoRunInfo.nMoethod:=nRUNONMIN;
            if CompareText(sMoethod,sRUNONSEC) = 0 then
              AutoRunInfo.nMoethod:=nRUNONSEC;

            AutoRunInfo.sParam1:=sParam1;
            AutoRunInfo.sParam2:=sParam2;
            AutoRunInfo.sParam3:=sParam3;
            AutoRunInfo.sParam4:=sParam4;
            AutoRunInfo.nParam1:=Str_ToInt(sParam1,1);
            m_AutoRunList.Add(AutoRunInfo);
          end;
        end;
          
      end;
    end;
    LoadList.Free;
  end;
end;

procedure TRobotObject.ProcessAutoRun;
var
  I: Integer;
  AutoRunInfo:pTAutoRunInfo;
begin
  for I := 0 to m_AutoRunList.Count - 1 do begin
    AutoRunInfo:=m_AutoRunList.Items[I];
    AutoRun(AutoRunInfo);
  end;
end;

procedure TRobotObject.ReloadScript;
begin
  ClearScript();
  LoadScript();
end;

procedure TRobotObject.Run;
begin
  ProcessAutoRun();
//  inherited;

end;

procedure TRobotObject.SendSocket(DefMsg: pTDefaultMessage; sMsg: String);
begin
  
end;

{ TRobotManage }

constructor TRobotManage.Create;
begin
  RobotHumanList:=TStringList.Create;
  LoadRobot();
end;

destructor TRobotManage.Destroy;
begin
  UnLoadRobot();
  RobotHumanList.Free;
  inherited;
end;

procedure TRobotManage.LoadRobot;
var
  I: Integer;
  LoadList:TStringList;
  sFileName:String;
  sLineText:String;
  sRobotName:String;
  sScriptFileName:String;
  RobotHuman:TRobotObject;
begin
  sFileName:=g_Config.sEnvirDir + 'Robot.txt';
  if FileExists(sFileName) then begin
    LoadList:=TStringList.Create;
    LoadList.LoadFromFile(sFileName);
    for I := 0 to LoadList.Count - 1 do begin
      sLineText:=LoadList.Strings[i];
      if (sLineText <> '') and (sLineText[1] <> ';') then begin
        sLineText:=GetValidStr3(sLineText,sRobotName,[' ','/',#9]);
        sLineText:=GetValidStr3(sLineText,sScriptFileName,[' ','/',#9]);
        if (sRobotName <> '') and (sScriptFileName <> '') then begin
          RobotHuman:=TRobotObject.Create;
          RobotHuman.m_sCharName:=sRobotName;
          RobotHuman.m_sScriptFileName:=sScriptFileName;
          RobotHuman.LoadScript;
          RobotHumanList.AddObject(RobotHuman.m_sCharName,RobotHuman);
        end;

      end;
    end;
    LoadList.Free;
  end;
end;

procedure TRobotManage.ReLoadRobot;
begin
  UnLoadRobot();
  LoadRobot();
end;

procedure TRobotManage.Run;
var
  I:Integer;
ResourceString
  sExceptionMsg = '[Exception] TRobotManage::Run';
begin
try
  for I := 0 to RobotHumanList.Count - 1 do begin
    TRobotObject(RobotHumanList.Objects[I]).Run;
  end;
except
  on e: Exception do begin
    MainOutMessage(sExceptionMsg);
    MainOutMessage(E.Message);
  end;
end;
end;

procedure TRobotManage.UnLoadRobot;
var
  I:Integer;
begin
  for I := 0 to RobotHumanList.Count - 1 do begin
    TRobotObject(RobotHumanList.Objects[I]).Free;
  end;
  RobotHumanList.Clear;
end;

end.
